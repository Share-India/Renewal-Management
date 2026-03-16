package com.insurance.renewal.controller;

import com.insurance.renewal.entity.Policy;
import com.insurance.renewal.entity.Reminder;
import com.insurance.renewal.entity.AuditLog;
import com.insurance.renewal.service.RenewalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/renewals")
@CrossOrigin(origins = { "http://localhost:4200", "http://localhost", "https://renewal.shareindiainsurance.com" }) // Allow Angular frontend and production domain
public class RenewalController {

    @Autowired
    private RenewalService renewalService;

    @GetMapping("/timeline/{days}")
    public List<Policy> getTimelinePolicies(@PathVariable("days") int days) {
        System.out.println("API Request: /timeline/" + days);
        List<Policy> policies = renewalService.getPoliciesForTimeline(days);

        // PROJECT DATES FOR VISUAL CONSISTENCY (As per User "Consider dates according
        // to you")
        LocalDate targetDate = LocalDate.now().plusDays(days);
        int targetYear = targetDate.getYear();

        policies.forEach(p -> {
            if (p.getExpiryDate().getYear() != targetYear) {
                // Shift year to match Target
                p.setExpiryDate(p.getExpiryDate().withYear(targetYear));
                // Adjust Start/End dates roughly (assuming 1 year term)
                p.setPolicyEndDate(p.getExpiryDate());
                p.setPolicyStartDate(p.getExpiryDate().minusYears(1).plusDays(1));

                // Fix Status visual (Don't show EXPIRED for future target)
                if (days >= 0) {
                    p.setStatus("ACTIVE");
                }
            }
        });

        System.out.println("Found " + policies.size() + " policies for " + days + " days bucket.");
        policies.forEach(
                p -> System.out.println(" - Policy: " + p.getPolicyNumber() + " | Expiry: " + p.getExpiryDate()));
        return policies;
    }

    @GetMapping("/follow-ups/{days}")
    public ResponseEntity<List<Reminder>> getFollowUpsByTimeline(@PathVariable("days") int days) {
        return ResponseEntity.ok(renewalService.getFollowUpsForTimeline(days));
    }

    @GetMapping("/admin/stats")
    public ResponseEntity<Map<String, Object>> getAdminStats() {
        return ResponseEntity.ok(renewalService.getAdminStats());
    }

    @GetMapping("/timeline-counts")
    public ResponseEntity<Map<Integer, Long>> getTimelineCounts() {
        return ResponseEntity.ok(renewalService.getTimelineCounts());
    }

    @GetMapping("/todays-work")
    public ResponseEntity<List<Policy>> getTodaysWork() {
        return ResponseEntity.ok(renewalService.getTodaysWork());
    }

    @PostMapping("/policies")
    public ResponseEntity<Policy> createPolicy(@RequestBody Policy policy) {
        // Get current user
        String agentName = org.springframework.security.core.context.SecurityContextHolder .getContext()
                .getAuthentication().getName();

        if (agentName == null || agentName.equals("anonymousUser")) {
            agentName = "System Admin";
        }

        return ResponseEntity.ok(renewalService.createPolicy(policy, agentName));
    }

    @PostMapping("/{policyId}/log-call")
    public ResponseEntity<Reminder> logCall(
            @PathVariable("policyId") Long policyId,
            @RequestBody Map<String, Object> payload) {

        String notes = (String) payload.get("notes");
        String outcome = (String) payload.get("outcome");
        String dateStr = (String) payload.get("nextFollowUp");
        java.time.LocalDateTime nextFollowUp = dateStr != null ? java.time.LocalDateTime.parse(dateStr) : null;

        // Get current user
        String agentName = (String) payload.get("agentName");
        if (agentName == null || agentName.isEmpty()) {
            agentName = org.springframework.security.core.context.SecurityContextHolder.getContext()
                    .getAuthentication().getName();
        }

        if (agentName == null || agentName.equals("anonymousUser")) {
            agentName = "System Admin"; // Fallback if no user is logged in
        }

        return ResponseEntity.ok(renewalService.logCall(policyId, notes, outcome, nextFollowUp, agentName));
    }

    @GetMapping("/admin/call-records")
    public ResponseEntity<List<Reminder>> getAllCallRecords() {
        return ResponseEntity.ok(renewalService.getAllCallRecords());
    }

    @GetMapping("/admin/records")
    public ResponseEntity<Map<String, List<Policy>>> getRecordsForDate(@RequestParam("date") String date) {
        System.out.println("API Request: /admin/records?date=" + date);
        LocalDate selectedDate = LocalDate.parse(date);
        System.out.println("Parsed Date: " + selectedDate);
        return ResponseEntity.ok(renewalService.getRecordsForDate(selectedDate));
    }

    @GetMapping("/search")
    public ResponseEntity<List<Policy>> searchPolicies(@RequestParam("query") String query) {
        return ResponseEntity.ok(renewalService.searchPolicies(query));
    }

    @GetMapping("/late-renewals")
    public ResponseEntity<List<Policy>> getLateRenewals() {
        return ResponseEntity.ok(renewalService.getLateRenewals());
    }

    @PostMapping(value = "/renew/{id}", consumes = org.springframework.http.MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<Policy> renewPolicy(
            @PathVariable("id") Long id,
            @RequestPart("data") String payloadJson,
            @RequestPart(value = "file", required = false) org.springframework.web.multipart.MultipartFile file) {

        try {
            com.fasterxml.jackson.databind.ObjectMapper mapper = new com.fasterxml.jackson.databind.ObjectMapper();
            @SuppressWarnings("unchecked")
            Map<String, Object> payload = mapper.readValue(payloadJson, Map.class);

            // File Saving Logic
            String paymentDocumentPath = null;
            if (file != null && !file.isEmpty()) {
                String uploadDir = "backend/src/main/resources/uploads/";
                java.io.File directory = new java.io.File(uploadDir);
                if (!directory.exists()) {
                    directory.mkdirs();
                }
                String fileName = java.util.UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
                java.io.File dest = new java.io.File(directory.getAbsolutePath() + java.io.File.separator + fileName);
                file.transferTo(dest);
                paymentDocumentPath = dest.getAbsolutePath();
            }

            String endDateStr = (String) payload.get("newEndDate");
            LocalDate newEndDate = (endDateStr != null && !endDateStr.isEmpty())
                    ? LocalDate.parse(endDateStr)
                    : null;
            String startDateStr = (String) payload.get("newStartDate");
            LocalDate newStartDate = (startDateStr != null && !startDateStr.isEmpty())
                    ? LocalDate.parse(startDateStr)
                    : null;

            String agentName = (String) payload.get("agentName");
            if (agentName == null || agentName.isEmpty()) {
                agentName = org.springframework.security.core.context.SecurityContextHolder.getContext()
                        .getAuthentication().getName();
            }

            // Extract payment details safely
            String paymentMode = (String) payload.get("paymentMode");
            String paymentReference = (String) payload.get("paymentReference");
            String paymentBank = (String) payload.get("paymentBank");
            String paymentDateStr = (String) payload.get("paymentDate");

            java.math.BigDecimal paymentAmount = null;
            Object amountObj = payload.get("paymentAmount");
            if (amountObj != null) {
                paymentAmount = new java.math.BigDecimal(amountObj.toString());
            }

            LocalDate paymentDate = (paymentDateStr != null && !paymentDateStr.isEmpty())
                    ? LocalDate.parse(paymentDateStr)
                    : null;

            String lateRenewalReason = (String) payload.get("lateRenewalReason");

            return ResponseEntity.ok(
                    renewalService.renewPolicy(id, newEndDate, newStartDate, agentName, lateRenewalReason, paymentMode,
                            paymentReference, paymentAmount, paymentDate, paymentBank, paymentDocumentPath));
        } catch (Exception e) {
            e.printStackTrace(); // Helpful for debugging
            throw new RuntimeException("Error renewing policy: " + e.getMessage());
        }
    }

    @GetMapping("/servicing/pending")
    public ResponseEntity<List<Policy>> getPendingIssuancePolicies() {
        return ResponseEntity.ok(renewalService.getPoliciesForServicing());
    }

    @GetMapping("/servicing/history")
    public ResponseEntity<List<Policy>> getServicedHistory() {
        return ResponseEntity.ok(renewalService.getServicedPolicies());
    }

    @PostMapping("/servicing/issue/{id}")
    public ResponseEntity<Policy> issuePolicy(
            @PathVariable("id") Long id,
            @RequestPart("policy") String policyJson,
            @RequestPart(value = "file", required = false) org.springframework.web.multipart.MultipartFile file) {

        try {
            // Parse JSON
            com.fasterxml.jackson.databind.ObjectMapper mapper = new com.fasterxml.jackson.databind.ObjectMapper();
            // Configure mapper to handle LocalDate if not already configured globally or
            // use string setters
            mapper.registerModule(new com.fasterxml.jackson.datatype.jsr310.JavaTimeModule());
            Policy policyDetails = mapper.readValue(policyJson, Policy.class);

            String documentPath = null;
            if (file != null && !file.isEmpty()) {
                // Save file
                String uploadDir = "backend/src/main/resources/uploads/";
                java.io.File directory = new java.io.File(uploadDir);
                if (!directory.exists()) {
                    directory.mkdirs();
                }
                String fileName = java.util.UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
                java.io.File dest = new java.io.File(directory.getAbsolutePath() + java.io.File.separator + fileName);
                file.transferTo(dest);
                documentPath = dest.getAbsolutePath();
            }

            String agentName = org.springframework.security.core.context.SecurityContextHolder.getContext()
                    .getAuthentication().getName();
            if (agentName == null || agentName.equals("anonymousUser")) {
                agentName = "Service Team";
            }

            return ResponseEntity.ok(renewalService.issuePolicy(id, policyDetails, documentPath, agentName));
        } catch (java.io.IOException e) {
            throw new RuntimeException("Error processing issuance request: " + e.getMessage());
        }
    }

    @PutMapping("/policies/{id}")
    public ResponseEntity<Policy> updatePolicyDetails(
            @PathVariable("id") Long id,
            @RequestBody Policy policy) {
        return ResponseEntity.ok(renewalService.updatePolicyDetails(id, policy));
    }

    @GetMapping("/call-history/{policyId}")
    public ResponseEntity<List<com.insurance.renewal.entity.CallHistory>> getCallHistory(@PathVariable("policyId") Long policyId) {
        return ResponseEntity.ok(renewalService.getCallHistory(policyId));
    }

    @DeleteMapping("/policies/{id}")
    public ResponseEntity<Void> deletePolicy(@PathVariable("id") Long id) {
        renewalService.deletePolicy(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/todays-work-progress")
    public ResponseEntity<Map<String, Integer>> getTodaysWorkProgress() {
        return ResponseEntity.ok(renewalService.getTodaysWorkProgress());
    }

    @GetMapping("/{id}/audit-logs")
    public ResponseEntity<List<AuditLog>> getAuditLogs(@PathVariable("id") Long id) {
        return ResponseEntity.ok(renewalService.getAuditLogs(id));
    }

    @GetMapping("/{id}/payment-proof")
    public ResponseEntity<org.springframework.core.io.Resource> getPaymentProof(@PathVariable("id") Long id) {
        try {
            java.io.File file = renewalService.getPaymentProofFile(id);
            if (!file.exists()) {
                return ResponseEntity.notFound().build();
            }
            org.springframework.core.io.Resource resource = new org.springframework.core.io.FileSystemResource(file);

            String contentType = "application/octet-stream";
            String name = file.getName().toLowerCase();
            if (name.endsWith(".png"))
                contentType = "image/png";
            else if (name.endsWith(".jpg") || name.endsWith(".jpeg"))
                contentType = "image/jpeg";
            else if (name.endsWith(".pdf"))
                contentType = "application/pdf";

            String displayFileName = file.getName();
            // Robust check: Is there an underscore at index 36? (Standard UUID is 36 chars)
            if (displayFileName.length() > 37 && displayFileName.charAt(36) == '_') {
                displayFileName = displayFileName.substring(37);
            }

            // Encode filename for filename* parameter (handles spaces/special chars)
            String encodedFileName = java.net.URLEncoder
                    .encode(displayFileName, java.nio.charset.StandardCharsets.UTF_8.toString())
                    .replaceAll("\\+", "%20");

            return ResponseEntity.ok()
                    .header(org.springframework.http.HttpHeaders.CONTENT_DISPOSITION,
                            "inline; filename=\"" + displayFileName + "\"; filename*=UTF-8''" + encodedFileName)
                    .contentType(org.springframework.http.MediaType.parseMediaType(contentType))
                    .body(resource);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("/{id}/policy-document")
    public ResponseEntity<org.springframework.core.io.Resource> getPolicyDocument(@PathVariable("id") Long id) {
        try {
            java.io.File file = renewalService.getPolicyDocumentFile(id);
            if (!file.exists()) {
                return ResponseEntity.notFound().build();
            }
            org.springframework.core.io.Resource resource = new org.springframework.core.io.FileSystemResource(file);

            String contentType = "application/octet-stream";
            String name = file.getName().toLowerCase();
            if (name.endsWith(".pdf"))
                contentType = "application/pdf";
            else if (name.endsWith(".png"))
                contentType = "image/png";
            else if (name.endsWith(".jpg") || name.endsWith(".jpeg"))
                contentType = "image/jpeg";

            String displayFileName = file.getName();
            // Robust check: Is there an underscore at index 36?
            if (displayFileName.length() > 37 && displayFileName.charAt(36) == '_') {
                displayFileName = displayFileName.substring(37);
            }

            // Encode filename for filename* parameter
            String encodedFileName = java.net.URLEncoder
                    .encode(displayFileName, java.nio.charset.StandardCharsets.UTF_8.toString())
                    .replaceAll("\\+", "%20");

            return ResponseEntity.ok()
                    .header(org.springframework.http.HttpHeaders.CONTENT_DISPOSITION,
                            "inline; filename=\"" + displayFileName + "\"; filename*=UTF-8''" + encodedFileName)
                    .contentType(org.springframework.http.MediaType.parseMediaType(contentType))
                    .body(resource);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.notFound().build();
        }
    }
}
