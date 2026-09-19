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

    // Cache of policyId -> milestones map
    private Map<Long, Map<Integer, Map<String, Object>>> milestoneCache = new HashMap<>();

    @org.springframework.scheduling.annotation.Scheduled(fixedRate = 300000) // 5 minutes
    @org.springframework.context.event.EventListener(org.springframework.boot.context.event.ApplicationReadyEvent.class)
    public void refreshMilestoneCache() {
        System.out.println("DEBUG: Starting milestone cache refresh...");
        List<String> statuses = Arrays.asList("ACTIVE", "PENDING_ISSUANCE");
        List<Policy> allPolicies = policyRepository.findByStatusIn(statuses);
        
        List<Long> policyIds = new ArrayList<>();
        for (Policy p : allPolicies) {
            policyIds.add(p.getId());
        }

        Map<Long, List<CallHistory>> callsMap = new HashMap<>();
        Map<Long, List<AuditLog>> logsMap = new HashMap<>();

        if (!policyIds.isEmpty()) {
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
            for (List<CallHistory> list : callsMap.values()) {
                list.sort((a, b) -> a.getCallDate().compareTo(b.getCallDate()));
            }
            for (List<AuditLog> list : logsMap.values()) {
                list.sort((a, b) -> a.getUpdatedAt().compareTo(b.getUpdatedAt()));
            }
        }

        Map<Long, Map<Integer, Map<String, Object>>> newCache = new HashMap<>();

        for (Policy p : allPolicies) {
            Map<Integer, Map<String, Object>> milestones = new HashMap<>();
            boolean isRetailType = p.getType() != null && RETAIL_TYPES.contains(p.getType().toLowerCase());

            for (int m : MILESTONES) {
                Map<String, Object> checks = new HashMap<>();
                checks.put("Contacted", null);
                checks.put("Customer Mailed", false);
                checks.put("RM Mailed", false);
                if (!isRetailType && m >= 30) {
                    checks.put("Claims", false);
                    checks.put("Sales", false);
                    checks.put("Underwriting", false);
                }
                milestones.put(m, checks);
            }

            LocalDate expiryDate = p.getExpiryDate();
            if (expiryDate != null) {
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
                            Map<String, Object> contactData = new HashMap<>();
                            contactData.put("status", outcome);
                            contactData.put("followUp", call.getFollowUpDate());
                            contactData.put("callDate", call.getCallDate());
                            contactData.put("note", call.getNotes());
                            checks.put("Contacted", contactData);
                        }
                    }
                }
                
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
            newCache.put(p.getId(), milestones);
        }

        this.milestoneCache = newCache;
        System.out.println("DEBUG: Milestone cache refreshed successfully. Cached " + newCache.size() + " policies.");
    }

    public List<Map<String, Object>> getProgressData(String tab, String branch) {
        List<Policy> allActivePolicies;
        List<String> statuses = Arrays.asList("ACTIVE", "PENDING_ISSUANCE");
        if (branch != null && !branch.trim().isEmpty()) {
            allActivePolicies = policyRepository.findByStatusInAndBranch(statuses, branch);
        } else {
            allActivePolicies = policyRepository.findByStatusIn(statuses);
        }
        
        allActivePolicies = renewalService.applyRenewerFilters(allActivePolicies);

        boolean isRetailTab = "RETAIL".equalsIgnoreCase(tab);
        
        List<Map<String, Object>> result = new ArrayList<>();
        
        for (Policy p : allActivePolicies) {
            boolean isRetailType = p.getType() != null && RETAIL_TYPES.contains(p.getType().toLowerCase());
            if ((isRetailTab && isRetailType) || (!isRetailTab && !isRetailType)) {
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
                
                Map<Integer, Map<String, Object>> milestones = milestoneCache.get(p.getId());
                if (milestones == null) {
                    // Fallback for new policies created between cache refreshes
                    milestones = new HashMap<>();
                    for (int m : MILESTONES) {
                        Map<String, Object> checks = new HashMap<>();
                        checks.put("Contacted", null);
                        checks.put("Customer Mailed", false);
                        checks.put("RM Mailed", false);
                        if (!isRetailType && m >= 30) {
                            checks.put("Claims", false);
                            checks.put("Sales", false);
                            checks.put("Underwriting", false);
                        }
                        milestones.put(m, checks);
                    }
                }
                
                policyMap.put("milestones", milestones);
                result.add(policyMap);
            }
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
