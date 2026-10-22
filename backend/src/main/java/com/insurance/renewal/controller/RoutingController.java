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

    @Autowired
    private com.insurance.renewal.service.FileStorageService fileStorageService;

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
        try {
            Optional<Policy> policyOpt = policyRepository.findById(policyId);
            if (policyOpt.isEmpty())
                return ResponseEntity.notFound().build();

            Policy policy = policyOpt.get();
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            String currentUsername = auth != null && auth.isAuthenticated() ? auth.getName() : "System";
            String actionLog = "Policy updated";

            if (payload.containsKey("targetTeam")) {
                String team = payload.get("targetTeam");
                policy.setTargetTeam(team);
                policy.setRoutedAt(java.time.LocalDate.now());
                if (payload.containsKey("sourceTeam")) {
                    policy.setLastRoutedFrom(payload.get("sourceTeam"));
                }
                actionLog = "Routed to " + team;

                if ("RENEWER".equalsIgnoreCase(team)) {
                    // Determine who to assign to on return
                    String returnAssignee = policy.getOriginalRenewer();
                    if (returnAssignee == null || returnAssignee.trim().isEmpty()) {
                        try {
                            // Try to find the renewer who previously handled/routed this policy from CallHistory
                            List<com.insurance.renewal.entity.CallHistory> histories = callHistoryRepository.findByPolicyIdOrderByCallDateDesc(policy.getId());
                            for (com.insurance.renewal.entity.CallHistory h : histories) {
                                if (h.getAgentName() != null && !h.getAgentName().equals("System") && !h.getAgentName().equals("System Admin")) {
                                    Optional<User> uOpt = userRepository.findByUsername(h.getAgentName());
                                    if (uOpt.isPresent() && uOpt.get().getRole() != null && uOpt.get().getRole().contains("RENEWER")) {
                                        returnAssignee = h.getAgentName();
                                        break;
                                    }
                                }
                            }
                        } catch (Exception ignored) {}
                    }

                    if (returnAssignee == null || returnAssignee.trim().isEmpty()) {
                        if (policy.getCurrentAssignee() != null) {
                            try {
                                Optional<User> currOpt = userRepository.findByUsername(policy.getCurrentAssignee());
                                if (currOpt.isPresent() && currOpt.get().getRole() != null && currOpt.get().getRole().contains("RENEWER")) {
                                    returnAssignee = policy.getCurrentAssignee();
                                }
                            } catch (Exception ignored) {}
                        }
                    }

                    // If an assignedUser was explicitly sent in payload
                    if (payload.containsKey("assignedUser") && payload.get("assignedUser") != null && !payload.get("assignedUser").trim().isEmpty() && !payload.get("assignedUser").equalsIgnoreCase("null")) {
                        returnAssignee = payload.get("assignedUser").trim();
                    }

                    policy.setCurrentAssignee(returnAssignee);
                    actionLog = "Returned to Renewer" + (returnAssignee != null ? " (" + returnAssignee + ")" : "");
                } else {
                    // Routing TO a team (CLAIMS, SALES, UNDERWRITING):
                    // Save original renewer if not already saved
                    if (policy.getOriginalRenewer() == null || policy.getOriginalRenewer().trim().isEmpty()) {
                        if (!"System".equals(currentUsername) && !"anonymousUser".equals(currentUsername)) {
                            try {
                                Optional<User> uOpt = userRepository.findByUsername(currentUsername);
                                if (uOpt.isPresent() && uOpt.get().getRole() != null && uOpt.get().getRole().contains("RENEWER")) {
                                    policy.setOriginalRenewer(currentUsername);
                                }
                            } catch (Exception ignored) {}
                        }
                        if (policy.getOriginalRenewer() == null && policy.getCurrentAssignee() != null) {
                            try {
                                Optional<User> assigneeOpt = userRepository.findByUsername(policy.getCurrentAssignee());
                                if (assigneeOpt.isPresent() && assigneeOpt.get().getRole() != null && assigneeOpt.get().getRole().contains("RENEWER")) {
                                    policy.setOriginalRenewer(policy.getCurrentAssignee());
                                }
                            } catch (Exception ignored) {}
                        }
                    }
                }
            }

            if (payload.containsKey("assignedUser") && !"RENEWER".equalsIgnoreCase(payload.get("targetTeam"))) {
                String user = payload.get("assignedUser");
                policy.setCurrentAssignee(user);
                if (user == null || user.trim().isEmpty() || user.equalsIgnoreCase("null")) {
                    actionLog = "Unassigned";
                } else {
                    actionLog = "Assigned to " + user;
                }
            }

            policy = policyRepository.save(policy);
            try {
                logHistory(policy, actionLog, null);
            } catch (Exception logEx) {
                System.err.println("Warning: Could not log history for policy routing: " + logEx.getMessage());
            }
            return ResponseEntity.ok(policy);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(Map.of("message", e.getMessage() != null ? e.getMessage() : "Error routing policy"));
        }
    }

    @PostMapping("/{policyId}/upload-claims")
    public ResponseEntity<?> uploadClaimsFiles(
            @PathVariable Long policyId,
            @RequestParam(value = "excelFiles", required = false) MultipartFile excelFiles,
            @RequestParam(value = "pdfFiles", required = false) MultipartFile pdfFiles,
            @RequestParam(value = "note", required = false) String note) {

        Optional<Policy> policyOpt = policyRepository.findById(policyId);
        if (policyOpt.isEmpty())
            return ResponseEntity.notFound().build();

        Policy policy = policyOpt.get();
        if (excelFiles != null) {
            String path = saveFile(excelFiles);
            if (path != null)
                policy.setClaimsExcelPath(path);
        }
        if (pdfFiles != null) {
            String path = saveFile(pdfFiles);
            if (path != null)
                policy.setClaimsPdfPath(path);
        }
        if (note != null)
            policy.setClaimsNote(note);

        policyRepository.save(policy);
        logHistory(policy, "Claims Documents Uploaded", note);
        return ResponseEntity.ok().build();
    }


    @PostMapping("/{policyId}/servicing-note")
    public ResponseEntity<?> addServicingNote(
            @PathVariable Long policyId,
            @RequestBody Map<String, String> payload) {

        Optional<Policy> policyOpt = policyRepository.findById(policyId);
        if (policyOpt.isEmpty())
            return ResponseEntity.notFound().build();

        Policy policy = policyOpt.get();
        if (payload.containsKey("note")) {
            String note = payload.get("note");
            policy.setServicingNote(note);
            logHistory(policy, "Servicing Note Added", note);
        }

        policyRepository.save(policy);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/{policyId}/sales-note")
    public ResponseEntity<?> addSalesNote(
            @PathVariable Long policyId,
            @RequestBody Map<String, String> payload) {

        Optional<Policy> policyOpt = policyRepository.findById(policyId);
        if (policyOpt.isEmpty())
            return ResponseEntity.notFound().build();

        Policy policy = policyOpt.get();
        if (payload.containsKey("note")) {
            String salesNote = payload.get("note");
            policy.setSalesNote(salesNote);
            logHistory(policy, "Sales Note Added", salesNote);
        }

        policyRepository.save(policy);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/{policyId}/hot-sale")
    public ResponseEntity<?> toggleHotSale(
            @PathVariable Long policyId,
            @RequestBody Map<String, Object> payload) {

        Optional<Policy> policyOpt = policyRepository.findById(policyId);
        if (policyOpt.isEmpty())
            return ResponseEntity.notFound().build();

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && auth.isAuthenticated()) {
            User currentUser = userRepository.findByUsername(auth.getName()).orElse(null);
            if (currentUser != null && currentUser.getRole() != null) {
                String role = currentUser.getRole().toUpperCase();
                if (role.contains("ADMIN")) {
                    return ResponseEntity.status(403).body(Map.of("message", "Admins cannot set hot sales. Only Sales/RM personnel are permitted."));
                }
            }
        }

        Policy policy = policyOpt.get();
        Boolean isHotSale = payload.containsKey("isHotSale") && payload.get("isHotSale") != null ? 
                Boolean.parseBoolean(payload.get("isHotSale").toString()) : 
                !Boolean.TRUE.equals(policy.getIsHotSale());
        String source = payload.containsKey("source") && payload.get("source") != null ? 
                payload.get("source").toString() : "RM";

        policy.setIsHotSale(isHotSale);
        if (Boolean.TRUE.equals(isHotSale)) {
            policy.setHotSaleSource(source);
            policy.setHotSaleBy(auth != null ? auth.getName() : "RM");
            if (policy.getOriginalRenewer() == null || policy.getOriginalRenewer().trim().isEmpty()) {
                if (policy.getCurrentAssignee() != null) {
                    Optional<User> assigneeOpt = userRepository.findByUsername(policy.getCurrentAssignee());
                    if (assigneeOpt.isPresent() && "ROLE_RENEWER".equals(assigneeOpt.get().getRole())) {
                        policy.setOriginalRenewer(policy.getCurrentAssignee());
                    }
                }
            }
            logHistory(policy, "Marked as Hot Sale (" + source + ")", null);
        } else {
            policy.setHotSaleSource(null);
            policy.setHotSaleBy(null);
            logHistory(policy, "Removed Hot Sale status", null);
        }

        policyRepository.save(policy);
        return ResponseEntity.ok(policy);
    }

    @PostMapping("/{policyId}/case-decision")
    public ResponseEntity<?> updateCaseDecision(
            @PathVariable Long policyId,
            @RequestBody Map<String, Object> payload) {

        Optional<Policy> policyOpt = policyRepository.findById(policyId);
        if (policyOpt.isEmpty())
            return ResponseEntity.notFound().build();

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth != null && auth.isAuthenticated() ? auth.getName() : "User";

        Policy policy = policyOpt.get();
        String decision = payload.containsKey("decision") && payload.get("decision") != null ? 
                payload.get("decision").toString().trim() : null;
        if ("RESET".equalsIgnoreCase(decision) || "CLEAR".equalsIgnoreCase(decision) || "".equals(decision)) {
            decision = null;
        }

        String source = payload.containsKey("source") && payload.get("source") != null ? 
                payload.get("source").toString().trim() : "RM";
        String note = payload.containsKey("note") && payload.get("note") != null ? 
                payload.get("note").toString().trim() : null;

        policy.setCaseWorkDecision(decision);
        if (decision != null) {
            policy.setCaseDecisionSource(source);
            policy.setCaseDecisionBy(username);
            policy.setCaseDecisionAt(java.time.LocalDateTime.now());
            policy.setCaseDecisionNote(note);
            String displayDecision = "WILL_WORK".equalsIgnoreCase(decision) ? "Will Work on Case" : "Will Not Work on Case";
            logHistory(policy, displayDecision + " (" + source + " by " + username + ")", note);
        } else {
            policy.setCaseDecisionSource(null);
            policy.setCaseDecisionBy(null);
            policy.setCaseDecisionAt(null);
            policy.setCaseDecisionNote(null);
            logHistory(policy, "Cleared Case Work Decision", null);
        }

        policyRepository.save(policy);
        return ResponseEntity.ok(policy);
    }

    @PostMapping("/{policyId}/upload-underwriting")
    public ResponseEntity<?> uploadUnderwriting(
            @PathVariable Long policyId,
            @RequestParam(value = "docFile", required = false) MultipartFile docFile,
            @RequestParam(value = "note", required = false) String note) {

        Optional<Policy> policyOpt = policyRepository.findById(policyId);
        if (policyOpt.isEmpty())
            return ResponseEntity.notFound().build();

        Policy policy = policyOpt.get();
        if (docFile != null) {
            String path = saveFile(docFile);
            if (path != null)
                policy.setUnderwritingDocPath(path);
        }
        if (note != null)
            policy.setUnderwritingNote(note);

        policyRepository.save(policy);
        logHistory(policy, "Underwriting Documents Uploaded", note);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/{policyId}/document/{docType}")
    public ResponseEntity<?> deleteDocument(@PathVariable Long policyId, @PathVariable String docType) {
        Optional<Policy> policyOpt = policyRepository.findById(policyId);
        if (policyOpt.isEmpty())
            return ResponseEntity.notFound().build();

        Policy policy = policyOpt.get();
        if ("claimsExcel".equals(docType))
            policy.setClaimsExcelPath(null);
        else if ("claimsPdf".equals(docType))
            policy.setClaimsPdfPath(null);
        else if ("underwritingDoc".equals(docType))
            policy.setUnderwritingDocPath(null);

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

    private ResponseEntity<org.springframework.core.io.Resource> getDocument(Long id,
            java.util.function.Function<Policy, String> pathExtractor) {
        Optional<Policy> policyOpt = policyRepository.findById(id);
        if (policyOpt.isEmpty())
            return ResponseEntity.notFound().build();

        String path = pathExtractor.apply(policyOpt.get());
        if (path == null)
            return ResponseEntity.notFound().build();

        java.io.File file = fileStorageService.resolveFile(path, null);
        if (file == null)
            return ResponseEntity.notFound().build();

        return fileStorageService.serveFile(file, file.getName());
    }

    @PostMapping("/team/create-user")
    public ResponseEntity<?> createTeamUser(@RequestBody Map<String, String> payload) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String currentRole = auth.getAuthorities().iterator().next().getAuthority().replace("ROLE_", "");

        String targetRole = "";
        if (currentRole.equals("CLAIMS_MANAGER"))
            targetRole = "CLAIMS";
        else if (currentRole.equals("SALES_MANAGER"))
            targetRole = "SALES";
        else if (currentRole.equals("UNDERWRITING_MANAGER"))
            targetRole = "UNDERWRITING";
        else
            return ResponseEntity.status(403).body(Map.of("message", "Only managers can create team users."));

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
            if (policyOpt.isEmpty())
                return ResponseEntity.notFound().build();

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
                        
                        org.springframework.security.core.Authentication auth = org.springframework.security.core.context.SecurityContextHolder.getContext().getAuthentication();
                        if (auth != null && auth.isAuthenticated()) {
                            doc.setUploadedByUsername(auth.getName());
                        }

                        doc.setPolicy(policy);
                        policy.getTeamDocuments().add(doc);
                        policyDocumentRepository.save(doc);
                    }
                }
            }

            if (note != null) {
                if ("CLAIMS".equals(team))
                    policy.setClaimsNote(note);
                else if ("UNDERWRITING".equals(team))
                    policy.setUnderwritingNote(note);
                else if ("SALES".equals(team))
                    policy.setSalesNote(note);
            }
            policyRepository.save(policy);

            logHistory(policy, team + " Documents Uploaded", note);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500)
                    .body(Map.of("message", e.getMessage() != null ? e.getMessage() : e.toString(), "trace",
                            java.util.Arrays.toString(e.getStackTrace())));
        }
    }

    @DeleteMapping("/document/{documentId}")
    public ResponseEntity<?> deleteTeamDocument(@PathVariable Long documentId) {
        Optional<com.insurance.renewal.entity.PolicyDocument> docOpt = policyDocumentRepository.findById(documentId);
        if (docOpt.isPresent()) {
            com.insurance.renewal.entity.PolicyDocument doc = docOpt.get();
            try {
                java.io.File file = fileStorageService.resolveFile(doc.getFilePath(), doc.getFileName());
                if (file != null && file.exists())
                    file.delete();
            } catch (Exception e) {
            }
            policyDocumentRepository.delete(doc);
            return ResponseEntity.ok().build();
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping("/document/{documentId}/download")
    public ResponseEntity<org.springframework.core.io.Resource> downloadTeamDocument(@PathVariable Long documentId) {
        Optional<com.insurance.renewal.entity.PolicyDocument> docOpt = policyDocumentRepository.findById(documentId);
        if (docOpt.isEmpty())
            return ResponseEntity.notFound().build();

        com.insurance.renewal.entity.PolicyDocument doc = docOpt.get();
        java.io.File file = fileStorageService.resolveFile(doc.getFilePath(), doc.getFileName());
        if (file == null)
            return ResponseEntity.notFound().build();

        return fileStorageService.serveFile(file, doc.getFileName());
    }

    private String saveFile(MultipartFile file) {
        return fileStorageService.saveFile(file);
    }
}
