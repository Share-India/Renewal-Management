package com.insurance.renewal.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.*;

@Service
public class FileStorageService {

    private static final Logger log = LoggerFactory.getLogger(FileStorageService.class);

    /**
     * Resolves the primary upload directory where new uploads will be stored.
     */
    public Path getPrimaryUploadDir() {
        // Priority 1: System property or Environment variable
        String customDir = System.getProperty("app.upload.dir");
        if (customDir == null || customDir.isBlank()) {
            customDir = System.getenv("UPLOADS_DIR");
        }
        if (customDir != null && !customDir.isBlank()) {
            try {
                Path p = Paths.get(customDir);
                Files.createDirectories(p);
                return p.toAbsolutePath().normalize();
            } catch (Exception e) {
                log.warn("[FileStorageService] Could not initialize custom upload dir: {}", customDir, e);
            }
        }

        // Priority 2: Docker volume mount check (/app exists and is writable)
        try {
            if (Files.exists(Paths.get("/app"))) {
                Path dockerUploadDir = Paths.get("/app/backend/src/main/resources/uploads");
                Files.createDirectories(dockerUploadDir);
                return dockerUploadDir.toAbsolutePath().normalize();
            }
        } catch (Exception ignored) {}

        // Priority 3: Local workspace standard relative directories
        String[] preferredRelativeDirs = new String[] {
                "backend/src/main/resources/uploads",
                "backend/backend/src/main/resources/uploads",
                "src/main/resources/uploads",
                "uploads"
        };
        for (String rel : preferredRelativeDirs) {
            try {
                Path p = Paths.get(rel);
                Files.createDirectories(p);
                return p.toAbsolutePath().normalize();
            } catch (Exception ignored) {}
        }

        // Fallback: OS temp directory
        Path tmp = Paths.get(System.getProperty("java.io.tmpdir"), "insurance_uploads");
        try {
            Files.createDirectories(tmp);
        } catch (Exception ignored) {}
        return tmp.toAbsolutePath().normalize();
    }

    /**
     * Saves a multipart file into the primary upload directory and returns the absolute path string.
     */
    public String saveFile(MultipartFile file) {
        if (file == null || file.isEmpty()) {
            return null;
        }
        try {
            Path uploadDir = getPrimaryUploadDir();
            Files.createDirectories(uploadDir);

            String originalName = "document";
            if (file.getOriginalFilename() != null && !file.getOriginalFilename().isBlank()) {
                originalName = Paths.get(file.getOriginalFilename()).getFileName().toString();
            }
            // Sanitize file name for filesystem safety
            String safeName = originalName.replaceAll("[^a-zA-Z0-9._-]", "_");

            String uniqueFileName = UUID.randomUUID().toString() + "_" + safeName;
            Path destination = uploadDir.resolve(uniqueFileName);

            // Using InputStream copy is safe across Tomcat, Docker, Windows, and Linux
            try (InputStream in = file.getInputStream()) {
                Files.copy(in, destination, StandardCopyOption.REPLACE_EXISTING);
            }

            log.info("[FileStorageService] Successfully saved file: {} (original: {})", destination.toAbsolutePath(), originalName);
            return destination.toAbsolutePath().toString();
        } catch (Exception e) {
            log.error("[FileStorageService] Failed to save uploaded file: {}", file.getOriginalFilename(), e);
            return null;
        }
    }

    /**
     * Resiliently finds an existing file on disk across candidate directories, even if the path
     * stored in the DB originated from another machine, OS, or container working directory.
     */
    public File resolveFile(String rawPath, String originalFileName) {
        if ((rawPath == null || rawPath.isBlank()) && (originalFileName == null || originalFileName.isBlank())) {
            return null;
        }

        // 1. Direct check: Is rawPath directly valid and readable?
        if (rawPath != null && !rawPath.isBlank()) {
            try {
                File direct = new File(rawPath);
                if (direct.exists() && direct.isFile() && direct.canRead()) {
                    log.info("[FileStorageService] File resolved directly: {}", direct.getAbsolutePath());
                    return direct;
                }
            } catch (Exception ignored) {}
        }

        // 2. Extract filename from rawPath (handling both Windows \ and Unix /)
        String fileNameFromPath = null;
        if (rawPath != null && !rawPath.isBlank()) {
            String norm = rawPath.replace('\\', '/');
            int lastSlash = norm.lastIndexOf('/');
            fileNameFromPath = (lastSlash >= 0) ? norm.substring(lastSlash + 1) : norm;
        }

        // 3. Build comprehensive list of candidate directories
        List<File> searchDirs = getCandidateSearchDirs();

        // Check if fileNameFromPath exists in any candidate dir
        if (fileNameFromPath != null && !fileNameFromPath.isBlank()) {
            for (File dir : searchDirs) {
                if (dir.exists() && dir.isDirectory()) {
                    File candidate = new File(dir, fileNameFromPath);
                    if (candidate.exists() && candidate.isFile() && candidate.canRead()) {
                        log.info("[FileStorageService] Resolved [{}] in candidate dir: {}", fileNameFromPath, candidate.getAbsolutePath());
                        return candidate;
                    }
                }
            }
        }

        // 4. Check if originalFileName exists directly or as suffix in candidate dirs
        if (originalFileName != null && !originalFileName.isBlank()) {
            String cleanOrig = originalFileName.trim().toLowerCase();
            for (File dir : searchDirs) {
                if (dir.exists() && dir.isDirectory()) {
                    File directName = new File(dir, originalFileName);
                    if (directName.exists() && directName.isFile() && directName.canRead()) {
                        log.info("[FileStorageService] Resolved by exact original filename: {}", directName.getAbsolutePath());
                        return directName;
                    }

                    File[] list = dir.listFiles();
                    if (list != null) {
                        for (File f : list) {
                            if (f.isFile() && f.getName().toLowerCase().endsWith(cleanOrig)) {
                                log.info("[FileStorageService] Resolved by suffix match [{}] in candidate dir: {}", f.getName(), f.getAbsolutePath());
                                return f;
                            }
                        }
                    }
                }
            }
        }

        // 5. Check by UUID prefix (if fileNameFromPath has UUID of length 36)
        if (fileNameFromPath != null && fileNameFromPath.length() >= 36) {
            String uuidPrefix = fileNameFromPath.substring(0, 36).toLowerCase();
            for (File dir : searchDirs) {
                if (dir.exists() && dir.isDirectory()) {
                    File[] list = dir.listFiles();
                    if (list != null) {
                        for (File f : list) {
                            if (f.isFile() && f.getName().toLowerCase().startsWith(uuidPrefix)) {
                                log.info("[FileStorageService] Resolved by UUID prefix [{}] in candidate dir: {}", f.getName(), f.getAbsolutePath());
                                return f;
                            }
                        }
                    }
                }
            }
        }

        log.warn("[FileStorageService] File not found. rawPath='{}', originalFileName='{}'. Searched {} candidate directories.",
                rawPath, originalFileName, searchDirs.size());
        return null;
    }

    /**
     * Lists all plausible directories where uploaded files might reside.
     */
    public List<File> getCandidateSearchDirs() {
        Set<String> pathsToCheck = new LinkedHashSet<>();

        try {
            pathsToCheck.add(getPrimaryUploadDir().toString());
        } catch (Exception ignored) {}

        // Docker paths
        pathsToCheck.add("/app/backend/src/main/resources/uploads");
        pathsToCheck.add("/app/uploads");
        pathsToCheck.add("/app");

        // Working directory relative paths
        String userDir = System.getProperty("user.dir");
        if (userDir != null) {
            pathsToCheck.add(userDir + "/backend/src/main/resources/uploads");
            pathsToCheck.add(userDir + "/backend/backend/src/main/resources/uploads");
            pathsToCheck.add(userDir + "/src/main/resources/uploads");
            pathsToCheck.add(userDir + "/uploads");
            pathsToCheck.add(userDir);
        }

        // Standard relative paths
        pathsToCheck.add("backend/src/main/resources/uploads");
        pathsToCheck.add("backend/backend/src/main/resources/uploads");
        pathsToCheck.add("src/main/resources/uploads");
        pathsToCheck.add("uploads");
        pathsToCheck.add("../uploads");

        // OS temp & User home directories
        String tmpDir = System.getProperty("java.io.tmpdir");
        if (tmpDir != null) {
            pathsToCheck.add(tmpDir + "/insurance_uploads");
            pathsToCheck.add(tmpDir + "/uploads");
        }
        String userHome = System.getProperty("user.home");
        if (userHome != null) {
            pathsToCheck.add(userHome + "/uploads");
            pathsToCheck.add(userHome + "/insurance_uploads");
        }

        List<File> result = new ArrayList<>();
        for (String p : pathsToCheck) {
            try {
                File dir = new File(p).getCanonicalFile();
                if (dir.exists() && dir.isDirectory() && !result.contains(dir)) {
                    result.add(dir);
                }
            } catch (Exception e) {
                File dir = new File(p);
                if (dir.exists() && dir.isDirectory() && !result.contains(dir)) {
                    result.add(dir);
                }
            }
        }
        return result;
    }

    /**
     * Serves a file as a ResponseEntity Resource with inline disposition, standard RFC 5987 filename encoding,
     * accurate content type, and appropriate headers.
     */
    public ResponseEntity<Resource> serveFile(File file, String downloadFileName) {
        if (file == null || !file.exists() || !file.canRead()) {
            return ResponseEntity.notFound().build();
        }

        String displayName = (downloadFileName != null && !downloadFileName.isBlank()) ? downloadFileName : file.getName();
        // Remove UUID prefix if present for clean display in browser
        if (displayName.length() > 37 && displayName.charAt(36) == '_') {
            displayName = displayName.substring(37);
        }

        String contentType = determineContentType(displayName.isEmpty() ? file.getName() : displayName);

        String encodedName = URLEncoder.encode(displayName, StandardCharsets.UTF_8).replaceAll("\\+", "%20");
        String safeAsciiName = displayName.replaceAll("[\"\\r\\n]", "_");
        String contentDisposition = "inline; filename=\"" + safeAsciiName + "\"; filename*=UTF-8''" + encodedName;

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, contentDisposition)
                .contentType(MediaType.parseMediaType(contentType))
                .contentLength(file.length())
                .body(new FileSystemResource(file));
    }

    /**
     * Determines MIME content type based on file extension.
     */
    public String determineContentType(String fileName) {
        if (fileName == null) {
            return "application/octet-stream";
        }
        String lower = fileName.toLowerCase();
        if (lower.endsWith(".pdf")) return "application/pdf";
        if (lower.endsWith(".xlsx")) return "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
        if (lower.endsWith(".xls")) return "application/vnd.ms-excel";
        if (lower.endsWith(".csv")) return "text/csv";
        if (lower.endsWith(".png")) return "image/png";
        if (lower.endsWith(".jpg") || lower.endsWith(".jpeg")) return "image/jpeg";
        if (lower.endsWith(".gif")) return "image/gif";
        if (lower.endsWith(".webp")) return "image/webp";
        if (lower.endsWith(".doc")) return "application/msword";
        if (lower.endsWith(".docx")) return "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
        if (lower.endsWith(".txt")) return "text/plain";
        return "application/octet-stream";
    }
}
