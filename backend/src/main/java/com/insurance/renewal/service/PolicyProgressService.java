package com.insurance.renewal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

import com.insurance.renewal.entity.Policy;
import com.insurance.renewal.entity.CallHistory;
import com.insurance.renewal.entity.AuditLog;
import com.insurance.renewal.repository.PolicyRepository;
import com.insurance.renewal.repository.CallHistoryRepository;
import com.insurance.renewal.repository.AuditLogRepository;

@Service
public class PolicyProgressService {

    @Autowired
    private PolicyRepository policyRepository;
    @Autowired
    private CallHistoryRepository callHistoryRepository;
    @Autowired
    private AuditLogRepository auditLogRepository;
    @Autowired
    private RenewalService renewalService;

    private static final int[] MILESTONES = {75, 60, 45, 30, 15, 7, 3, 2, 1};
    private static final List<String> RETAIL_TYPES = Arrays.asList("health", "life", "motor", "general", "health insurance", "life insurance", "motor insurance", "general insurance");

    public List<Map<String, Object>> getProgressData(String tab, String branch) {
        List<Policy> allActivePolicies;
        List<String> statuses = Arrays.asList("ACTIVE", "PENDING_ISSUANCE");
        if (branch != null && !branch.trim().isEmpty()) {
            allActivePolicies = policyRepository.findByStatusInAndBranch(statuses, branch);
        } else {
            allActivePolicies = policyRepository.findByStatusIn(statuses);
        }
        
        // Apply RBAC filters so Branch Managers / RMs only see their own policies
        allActivePolicies = renewalService.applyRenewerFilters(allActivePolicies);

        boolean isRetailTab = "RETAIL".equalsIgnoreCase(tab);
        
        List<Policy> filtered = new ArrayList<>();
        for (Policy p : allActivePolicies) {
            boolean isRetailType = p.getType() != null && RETAIL_TYPES.contains(p.getType().toLowerCase());
            if (isRetailTab && isRetailType) {
                filtered.add(p);
            } else if (!isRetailTab && !isRetailType) {
                filtered.add(p);
            }
        }

        List<Map<String, Object>> result = new ArrayList<>();
        
        // --- Batch fetch logs and calls to avoid N+1 query problem ---
        List<Long> policyIds = new ArrayList<>();
        for (Policy p : filtered) {
            policyIds.add(p.getId());
        }
        
        Map<Long, List<CallHistory>> callsMap = new HashMap<>();
        Map<Long, List<AuditLog>> logsMap = new HashMap<>();
        
        if (!policyIds.isEmpty()) {
            // Chunking by 1000 to avoid SQL IN clause limits
            for (int i = 0; i < policyIds.size(); i += 1000) {
                List<Long> chunk = policyIds.subList(i, Math.min(policyIds.size(), i + 1000));
                
                List<CallHistory> chunkCalls = callHistoryRepository.findByPolicyIdIn(chunk);
                for (CallHistory c : chunkCalls) {
                    callsMap.computeIfAbsent(c.getPolicy().getId(), k -> new ArrayList<>()).add(c);
                }
                
                List<AuditLog> chunkLogs = auditLogRepository.findByPolicyIdIn(chunk);
                for (AuditLog l : chunkLogs) {
                    logsMap.computeIfAbsent(l.getPolicyId(), k -> new ArrayList<>()).add(l);
                }
            }
            // Sort them asc in memory so that the most recent overrides in the loop
            for (List<CallHistory> list : callsMap.values()) {
                list.sort((a, b) -> a.getCallDate().compareTo(b.getCallDate()));
            }
            for (List<AuditLog> list : logsMap.values()) {
                list.sort((a, b) -> a.getUpdatedAt().compareTo(b.getUpdatedAt()));
            }
        }
        // -------------------------------------------------------------
        
        for (Policy p : filtered) {
            Map<String, Object> policyMap = new HashMap<>();
            policyMap.put("id", p.getId());
            policyMap.put("policyNumber", p.getPolicyNumber());
            policyMap.put("customerName", p.getCustomer() != null ? p.getCustomer().getFirstName() + " " + p.getCustomer().getLastName() : "Unknown");
            policyMap.put("rmName", p.getRmName());
            policyMap.put("branch", p.getBranch());
            policyMap.put("status", p.getStatus());
            policyMap.put("type", p.getType());
            if (p.getExpiryDate() != null) {
                policyMap.put("expiryDate", p.getExpiryDate().toString());
            }
            
            // Initialize milestones
            Map<Integer, Map<String, Object>> milestones = new HashMap<>();
            for (int m : MILESTONES) {
                Map<String, Object> checks = new HashMap<>();
                checks.put("Contacted", null);
                checks.put("Customer Mailed", false);
                checks.put("RM Mailed", false);
                if (!isRetailTab && m >= 30) {
                    checks.put("Claims", false);
                    checks.put("Sales", false);
                    checks.put("Underwriting", false);
                }
                milestones.put(m, checks);
            }
            
            LocalDate expiryDate = p.getExpiryDate();
            if (expiryDate != null) {
                // Process Call History
                List<CallHistory> calls = callsMap.getOrDefault(p.getId(), Collections.emptyList());
                for (CallHistory call : calls) {
                    int bucket = getClosestMilestone(call.getCallDate().toLocalDate(), expiryDate);
                    Map<String, Object> checks = milestones.get(bucket);
                    
                    String outcome = call.getCallOutcome();
                    if (outcome != null) {
                        String outLower = outcome.toLowerCase();
                        if (outLower.contains("routed to claims")) {
                            if (checks.containsKey("Claims")) checks.put("Claims", true);
                        } else if (outLower.contains("routed to sales")) {
                            if (checks.containsKey("Sales")) checks.put("Sales", true);
                        } else if (outLower.contains("routed to underwriting")) {
                            if (checks.containsKey("Underwriting")) checks.put("Underwriting", true);
                        } else {
                            // Regular contact
                            Map<String, Object> contactData = new HashMap<>();
                            contactData.put("status", outcome);
                            contactData.put("followUp", call.getFollowUpDate());
                            contactData.put("callDate", call.getCallDate());
                            contactData.put("note", call.getNotes());
                            checks.put("Contacted", contactData);
                        }
                    }
                }
                
                // Process Audit Logs
                List<AuditLog> logs = logsMap.getOrDefault(p.getId(), Collections.emptyList());
                for (AuditLog log : logs) {
                    if ("Action".equals(log.getFieldName())) {
                        int bucket = getClosestMilestone(log.getUpdatedAt().toLocalDate(), expiryDate);
                        Map<String, Object> checks = milestones.get(bucket);
                        if ("Customer Mailed".equals(log.getNewValue())) {
                            checks.put("Customer Mailed", true);
                        } else if ("RM Mailed".equals(log.getNewValue())) {
                            checks.put("RM Mailed", true);
                        }
                    }
                }
            }
            
            policyMap.put("milestones", milestones);
            result.add(policyMap);
        }
        
        return result;
    }

    private int getClosestMilestone(LocalDate activityDate, LocalDate expiryDate) {
        long daysBefore = ChronoUnit.DAYS.between(activityDate, expiryDate);
        int closest = 75;
        long minDiff = Long.MAX_VALUE;
        for (int m : MILESTONES) {
            long diff = Math.abs(daysBefore - m);
            if (diff < minDiff) {
                minDiff = diff;
                closest = m;
            }
        }
        return closest;
    }
}
