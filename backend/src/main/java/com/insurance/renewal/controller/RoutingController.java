package com.insurance.renewal.controller;

import com.insurance.renewal.entity.Policy;
import com.insurance.renewal.entity.User;
import com.insurance.renewal.repository.PolicyRepository;
import com.insurance.renewal.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/routing")
@CrossOrigin(origins = { "http://localhost:4200", "http://localhost", "https://renewal.shareindiainsurance.com" })
public class RoutingController {

    @Autowired
    private PolicyRepository policyRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private com.insurance.renewal.repository.CallHistoryRepository callHistoryRepository;

    @Autowired
    private com.insurance.renewal.repository.PolicyDocumentRepository policyDocumentRepository;

    private void logHistory(Policy policy, String outcome, String notes) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String currentUsername = auth != null ? auth.getName() : "System";
        com.insurance.renewal.entity.CallHistory history = new com.insurance.renewal.entity.CallHistory();
        history.setPolicy(policy);
        history.setAgentName(currentUsername);
        history.setCallOutcome(outcome);
        history.setNotes(notes);
        history.setCallDate(java.time.LocalDateTime.now());
        callHistoryRepository.save(history);
    }

    @PostMapping("/{policyId}/route")
    public ResponseEntity<?> routePolicy(@PathVariable Long policyId, @RequestBody Map<String, String> payload) {
        Optional<Policy> policyOpt = policyRepository.findById(policyId);
        if (policyOpt.isEmpty()) return ResponseEntity.notFound().build();

        Policy policy = policyOpt.get();
        String actionLog = "Policy updated";
        if (payload.containsKey("targetTeam")) {
            String team = payload.get("targetTeam");
            policy.setTargetTeam(team);
            policy.setRoutedAt(java.time.LocalDate.now());
            if (payload.containsKey("sourceTeam")) {
                policy.setLastRoutedFrom(payload.get("sourceTeam"));
            }
            actionLog = "Routed to " + team;
        }
        if (payload.containsKey("assignedUser")) {
            String user = payload.get("assignedUser");
            policy.setCurrentAssignee(user);
            if (user == null || user.trim().isEmpty()) {
                actionLog = "Unassigned";
            } else {
                actionLog = "Assigned to " + user;
            }
        }
        
        policyRepository.save(policy);
        logHistory(policy, actionLog, null);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/{policyId}/upload-claims")
    public ResponseEntity<?> uploadClaimsFiles(
            @PathVariable Long policyId,
            @RequestParam(value = "excelFiles", required = false) MultipartFile excelFiles,
            @RequestParam(value = "pdfFiles", required = false) MultipartFile pdfFiles,
            @RequestParam(value = "note", required = false) String note) {
        
        Optional<Policy> policyOpt = policyRepository.findById(policyId);
        if (policyOpt.isEmpty()) return ResponseEntity.notFound().build();

        Policy policy = policyOpt.get();
        if (excelFiles != null) {
            String path = saveFile(excelFiles);
            if (path != null) policy.setClaimsExcelPath(path);
        }
        if (pdfFiles != null) {
            String path = saveFile(pdfFiles);
            if (path != null) policy.setClaimsPdfPath(path);
        }
        if (note != null) policy.setClaimsNote(note);
        
        policyRepository.save(policy);
        logHistory(policy, "Claims Documents Uploaded", note);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/{policyId}/sales-note")
    public ResponseEntity<?> addSalesNote(
            @PathVariable Long policyId,
            @RequestBody Map<String, String> payload) {
        
        Optional<Policy> policyOpt = policyRepository.findById(policyId);
        if (policyOpt.isEmpty()) return ResponseEntity.notFound().build();

        Policy policy = policyOpt.get();
        if (payload.containsKey("note")) {
            String salesNote = payload.get("note");
            policy.setSalesNote(salesNote);
            logHistory(policy, "Sales Note Added", salesNote);
        }
        
        policyRepository.save(policy);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/{policyId}/upload-underwriting")
    public ResponseEntity<?> uploadUnderwriting(
            @PathVariable Long policyId,
            @RequestParam(value = "docFile", required = false) MultipartFile docFile,
            @RequestParam(value = "note", required = false) String note) {
        
        Optional<Policy> policyOpt = policyRepository.findById(policyId);
        if (policyOpt.isEmpty()) return ResponseEntity.notFound().build();

        Policy policy = policyOpt.get();
        if (docFile != null) {
            String path = saveFile(docFile);
            if (path != null) policy.setUnderwritingDocPath(path);
        }
        if (note != null) policy.setUnderwritingNote(note);
        
        policyRepository.save(policy);
        logHistory(policy, "Underwriting Documents Uploaded", note);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/{policyId}/document/{docType}")
    public ResponseEntity<?> deleteDocument(@PathVariable Long policyId, @PathVariable String docType) {
        Optional<Policy> policyOpt = policyRepository.findById(policyId);
        if (policyOpt.isEmpty()) return ResponseEntity.notFound().build();

        Policy policy = policyOpt.get();
        if ("claimsExcel".equals(docType)) policy.setClaimsExcelPath(null);
        else if ("claimsPdf".equals(docType)) policy.setClaimsPdfPath(null);
        else if ("underwritingDoc".equals(docType)) policy.setUnderwritingDocPath(null);
        
        policyRepository.save(policy);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/users")
    public ResponseEntity<List<User>> getUsers() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String currentRole = auth.getAuthorities().iterator().next().getAuthority().replace("ROLE_", "");

        List<User> users = userRepository.findAll();
        if (currentRole.equals("CLAIMS_MANAGER")) {
            users = users.stream().filter(u -> "ROLE_CLAIMS".equals(u.getRole())).collect(Collectors.toList());
        } else if (currentRole.equals("SALES_MANAGER")) {
            users = users.stream().filter(u -> "ROLE_SALES".equals(u.getRole())).collect(Collectors.toList());
        } else if (currentRole.equals("UNDERWRITING_MANAGER")) {
            users = users.stream().filter(u -> "ROLE_UNDERWRITING".equals(u.getRole())).collect(Collectors.toList());
        }
        return ResponseEntity.ok(users);
    }

    @GetMapping("/{id}/claims-excel")
    public ResponseEntity<org.springframework.core.io.Resource> getClaimsExcel(@PathVariable("id") Long id) {
        return getDocument(id, policy -> policy.getClaimsExcelPath());
    }

    @GetMapping("/{id}/claims-pdf")
    public ResponseEntity<org.springframework.core.io.Resource> getClaimsPdf(@PathVariable("id") Long id) {
        return getDocument(id, policy -> policy.getClaimsPdfPath());
    }

    @GetMapping("/{id}/underwriting-doc")
    public ResponseEntity<org.springframework.core.io.Resource> getUnderwritingDoc(@PathVariable("id") Long id) {
        return getDocument(id, policy -> policy.getUnderwritingDocPath());
    }

    private ResponseEntity<org.springframework.core.io.Resource> getDocument(Long id, java.util.function.Function<Policy, String> pathExtractor) {
        Optional<Policy> policyOpt = policyRepository.findById(id);
        if (policyOpt.isEmpty()) return ResponseEntity.notFound().build();
        
        String path = pathExtractor.apply(policyOpt.get());
        if (path == null) return ResponseEntity.notFound().build();

        java.io.File file = new java.io.File(path);
        if (!file.exists()) return ResponseEntity.notFound().build();

        org.springframework.core.io.Resource resource = new org.springframework.core.io.FileSystemResource(file);
        
        String contentType = "application/octet-stream";
        if (path.endsWith(".pdf")) contentType = "application/pdf";
        else if (path.endsWith(".xlsx")) contentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
        else if (path.endsWith(".csv")) contentType = "text/csv";

        return ResponseEntity.ok()
                .header(org.springframework.http.HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + file.getName() + "\"")
                .contentType(org.springframework.http.MediaType.parseMediaType(contentType))
                .body(resource);
    }

    @PostMapping("/team/create-user")
    public ResponseEntity<?> createTeamUser(@RequestBody Map<String, String> payload) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String currentRole = auth.getAuthorities().iterator().next().getAuthority().replace("ROLE_", "");

        String targetRole = "";
        if (currentRole.equals("CLAIMS_MANAGER")) targetRole = "CLAIMS";
        else if (currentRole.equals("SALES_MANAGER")) targetRole = "SALES";
        else if (currentRole.equals("UNDERWRITING_MANAGER")) targetRole = "UNDERWRITING";
        else return ResponseEntity.status(403).body(Map.of("message", "Only managers can create team users."));

        String username = payload.get("username");
        String password = payload.get("password");

        if (userRepository.findByUsername(username).isPresent()) {
            return ResponseEntity.badRequest().body(Map.of("message", "Username already exists."));
        }

        User user = new User();
        user.setUsername(username);
        user.setPassword(passwordEncoder.encode(password));
        user.setRole("ROLE_" + targetRole);
        user.setActive(true);
        userRepository.save(user);

        return ResponseEntity.ok(Map.of("message", "User created successfully", "username", username));
    }
    @PostMapping("/{policyId}/upload-team-documents")
    public ResponseEntity<?> uploadTeamDocuments(
            @PathVariable Long policyId,
            @RequestParam(value = "files", required = false) MultipartFile[] files,
            @RequestParam(value = "team") String team,
            @RequestParam(value = "note", required = false) String note) {
        try {
            Optional<Policy> policyOpt = policyRepository.findById(policyId);
            if (policyOpt.isEmpty()) return ResponseEntity.notFound().build();

            Policy policy = policyOpt.get();
            if (files != null) {
                for (MultipartFile file : files) {
                    String path = saveFile(file);
                    if (path != null) {
                        com.insurance.renewal.entity.PolicyDocument doc = new com.insurance.renewal.entity.PolicyDocument();
                        doc.setFileName(file.getOriginalFilename());
                        doc.setFilePath(path);
                        doc.setUploadedByTeam(team);
                        doc.setDocumentType(team + "_DOCUMENT");
                        doc.setOriginalFilename(file.getOriginalFilename());
                        doc.setPolicy(policy);
                        policy.getTeamDocuments().add(doc);
                        policyDocumentRepository.save(doc);
                    }
                }
            }
            
            if (note != null) {
                if ("CLAIMS".equals(team)) policy.setClaimsNote(note);
                else if ("UNDERWRITING".equals(team)) policy.setUnderwritingNote(note);
                else if ("SALES".equals(team)) policy.setSalesNote(note);
            }
            policyRepository.save(policy);
            
            logHistory(policy, team + " Documents Uploaded", note);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(Map.of("message", e.getMessage() != null ? e.getMessage() : e.toString(), "trace", java.util.Arrays.toString(e.getStackTrace())));
        }
    }

    @DeleteMapping("/document/{documentId}")
    public ResponseEntity<?> deleteTeamDocument(@PathVariable Long documentId) {
        Optional<com.insurance.renewal.entity.PolicyDocument> docOpt = policyDocumentRepository.findById(documentId);
        if (docOpt.isPresent()) {
            com.insurance.renewal.entity.PolicyDocument doc = docOpt.get();
            try {
                java.io.File file = new java.io.File(doc.getFilePath());
                if (file.exists()) file.delete();
            } catch (Exception e) {}
            policyDocumentRepository.delete(doc);
            return ResponseEntity.ok().build();
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping("/document/{documentId}/download")
    public ResponseEntity<org.springframework.core.io.Resource> downloadTeamDocument(@PathVariable Long documentId) {
        Optional<com.insurance.renewal.entity.PolicyDocument> docOpt = policyDocumentRepository.findById(documentId);
        if (docOpt.isEmpty()) return ResponseEntity.notFound().build();
        
        com.insurance.renewal.entity.PolicyDocument doc = docOpt.get();
        java.io.File file = new java.io.File(doc.getFilePath());
        if (!file.exists()) return ResponseEntity.notFound().build();

        org.springframework.core.io.Resource resource = new org.springframework.core.io.FileSystemResource(file);
        
        String contentType = "application/octet-stream";
        String path = doc.getFilePath().toLowerCase();
        if (path.endsWith(".pdf")) contentType = "application/pdf";
        else if (path.endsWith(".xlsx")) contentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
        else if (path.endsWith(".csv")) contentType = "text/csv";
        else if (path.endsWith(".png")) contentType = "image/png";
        else if (path.endsWith(".jpg") || path.endsWith(".jpeg")) contentType = "image/jpeg";

        return ResponseEntity.ok()
                .header(org.springframework.http.HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + doc.getFileName() + "\"")
                .contentType(org.springframework.http.MediaType.parseMediaType(contentType))
                .body(resource);
    }

    private String saveFile(MultipartFile file) {
        if (file == null || file.isEmpty()) return null;
        try {
            String uploadDir = "backend/src/main/resources/uploads/";
            java.io.File directory = new java.io.File(uploadDir);
            if (!directory.exists()) {
                directory.mkdirs();
            }
            String fileName = java.util.UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
            java.io.File dest = new java.io.File(directory.getAbsolutePath() + java.io.File.separator + fileName);
            file.transferTo(dest);
            return dest.getAbsolutePath();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
