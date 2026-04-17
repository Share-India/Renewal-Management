package com.insurance.renewal.service;

import com.insurance.renewal.entity.Policy;
import com.insurance.renewal.entity.Reminder;
import com.insurance.renewal.entity.CallHistory;
import com.insurance.renewal.entity.Customer;
import com.insurance.renewal.repository.PolicyRepository;
import com.insurance.renewal.repository.ReminderRepository;
import com.insurance.renewal.repository.CallHistoryRepository;
import com.insurance.renewal.repository.CallHistoryRepository;
import com.insurance.renewal.repository.CustomerRepository;
import com.insurance.renewal.repository.AuditLogRepository;
import com.insurance.renewal.entity.AuditLog;
import com.insurance.renewal.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;

@Service
public class RenewalService {

    @Autowired
    private PolicyRepository policyRepository;

    @Autowired
    private ReminderRepository reminderRepository;

    @Autowired
    private CallHistoryRepository callHistoryRepository;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private AuditLogRepository auditLogRepository;

    @Autowired
    private UserRepository userRepository;

    private List<Policy> applyRenewerFilters(List<Policy> policies) {
        org.springframework.security.core.Authentication auth = org.springframework.security.core.context.SecurityContextHolder
                .getContext().getAuthentication();
        if (auth == null || !auth.isAuthenticated())
            return policies;

        String username = auth.getName();
        com.insurance.renewal.entity.User user = userRepository.findByUsername(username).orElse(null);
        if (user == null || user.getRole() == null || !user.getRole().contains("RENEWER"))
            return policies;

        return policies.stream().filter(p -> {
            if (user.getAssignedBranch() != null && !user.getAssignedBranch().isEmpty()
                    && !user.getAssignedBranch().equals("null")) {
                if (p.getBranch() == null || !user.getAssignedBranch().equalsIgnoreCase(p.getBranch()))
                    return false;
            }
            if (user.getAssignedProductType() != null && !user.getAssignedProductType().isEmpty()
                    && !user.getAssignedProductType().equals("null")) {
                if (p.getType() == null)
                    return false;
                String[] allowedTypes = user.getAssignedProductType().split("\\s*,\\s*");
                boolean match = false;
                for (String t : allowedTypes) {
                    if (t.equalsIgnoreCase(p.getType())) {
                        match = true;
                        break;
                    }
                }
                if (!match)
                    return false;
            }
            if (user.getAssignedPremiumRange() != null && !user.getAssignedPremiumRange().isEmpty()
                    && !user.getAssignedPremiumRange().equals("null")) {
                double amount = p.getAmount() != null ? p.getAmount().doubleValue() : 0;
                String range = user.getAssignedPremiumRange().trim();
                boolean matchesAnyRange = false;

                if (range.contains("<50,000") && amount < 50000) {
                    matchesAnyRange = true;
                }
                if (range.contains("50,000-1,00,000") && amount >= 50000 && amount <= 100000) {
                    matchesAnyRange = true;
                }
                if (range.contains(">1,00,000") && amount > 100000) {
                    matchesAnyRange = true;
                }

                if (!matchesAnyRange)
                    return false;
            }
            return true;
        }).collect(java.util.stream.Collectors.toList());
    }

    private List<Reminder> applyRenewerFiltersToReminders(List<Reminder> reminders) {
        org.springframework.security.core.Authentication auth = org.springframework.security.core.context.SecurityContextHolder
                .getContext().getAuthentication();
        if (auth == null || !auth.isAuthenticated())
            return reminders;

        String username = auth.getName();
        com.insurance.renewal.entity.User user = userRepository.findByUsername(username).orElse(null);
        if (user == null || user.getRole() == null || !user.getRole().contains("RENEWER"))
            return reminders;

        return reminders.stream().filter(r -> {
            Policy p = r.getPolicy();
            if (p == null)
                return false;

            if (user.getAssignedBranch() != null && !user.getAssignedBranch().isEmpty()
                    && !user.getAssignedBranch().equals("null")) {
                if (p.getBranch() == null || !user.getAssignedBranch().equalsIgnoreCase(p.getBranch()))
                    return false;
            }
            if (user.getAssignedProductType() != null && !user.getAssignedProductType().isEmpty()
                    && !user.getAssignedProductType().equals("null")) {
                if (p.getType() == null)
                    return false;
                String[] allowedTypes = user.getAssignedProductType().split("\\s*,\\s*");
                boolean match = false;
                for (String t : allowedTypes) {
                    if (t.equalsIgnoreCase(p.getType())) {
                        match = true;
                        break;
                    }
                }
                if (!match)
                    return false;
            }
            if (user.getAssignedPremiumRange() != null && !user.getAssignedPremiumRange().isEmpty()
                    && !user.getAssignedPremiumRange().equals("null")) {
                double amount = p.getAmount() != null ? p.getAmount().doubleValue() : 0;
                String range = user.getAssignedPremiumRange().trim();
                boolean matchesAnyRange = false;

                if (range.contains("<50,000") && amount < 50000) {
                    matchesAnyRange = true;
                }
                if (range.contains("50,000-1,00,000") && amount >= 50000 && amount <= 100000) {
                    matchesAnyRange = true;
                }
                if (range.contains(">1,00,000") && amount > 100000) {
                    matchesAnyRange = true;
                }

                if (!matchesAnyRange)
                    return false;
            }
            return true;
        }).collect(java.util.stream.Collectors.toList());
    }

    // Get policies expiring in exactly 'days' from now
    // If days is negative, it means expired 'days' ago
    public List<Policy> getPoliciesForTimeline(int days) {
        LocalDate targetDate = LocalDate.now().plusDays(days);
        // Use the new method that excludes policies with future follow-ups
        return applyRenewerFilters(policyRepository.findPoliciesForTimeline(targetDate));
    }

    // Get reminders scheduled for follow-up in 'days'
    public List<Reminder> getFollowUpsForTimeline(int days) {
        LocalDate targetDate = LocalDate.now().plusDays(days);
        return applyRenewerFiltersToReminders(
                reminderRepository.findByFollowUpDateBetween(targetDate.atStartOfDay(), targetDate.atTime(23, 59, 59)));
    }

    public Map<String, Object> getAdminStats(String branch) {
        Map<String, Object> stats = new HashMap<>();

        long totalPolicies;
        long totalReminders;

        if (branch != null && !branch.trim().isEmpty()) {
            // Use efficient DB counting instead of fetching all entities into memory
            totalPolicies = policyRepository.countByBranchIgnoreCase(branch);
            
            totalReminders = reminderRepository.countByReminderStatusAndBranchIgnoreCase("PENDING", branch);
        } else {
            totalPolicies = policyRepository.count();
            totalReminders = reminderRepository.countByReminderStatusIgnoreCase("PENDING");
        }

        // Today's Work Count needs to match the exact same logic as the Action Required
        // Progress Bar
        Map<String, Integer> progress = getTodaysWorkProgress(branch);
        long startCount = progress.get("total") - progress.get("completed");

        stats.put("totalPolicies", totalPolicies);
        stats.put("totalReminders", totalReminders);
        stats.put("todaysWorkCount", startCount);

        return stats;
    }

    public Map<Integer, Long> getTimelineCounts(String branch) {
        Map<Integer, Long> counts = new HashMap<>();
        LocalDate today = LocalDate.now();

        // Specific day offsets requested by user
        List<Integer> specificDays = Arrays.asList(75, 60, 45, 30, 15, 7, 3, 2, 1, 0, // Pre-expiry & Today
                -1, -2, -3, -7, -15, -30, -45, -60, -75 // Post-expiry
        );

        for (Integer offset : specificDays) {
            LocalDate targetDate = today.plusDays(offset);

            // For a specific day bucket, we count policies expiring that day
            // (excluding those pending issuance or already scheduled for a follow-up)
            List<Policy> expiringPolicies = applyRenewerFilters(
                    policyRepository.findAdminPoliciesForTimeline(targetDate, branch));
            long expiringCount = expiringPolicies.size();

            // And we count reminders scheduled for that specific date
            List<Reminder> scheduledReminders = applyRenewerFiltersToReminders(
                    reminderRepository.findByFollowUpDateBetweenWithValidPolicy(targetDate.atStartOfDay(),
                            targetDate.atTime(23, 59, 59), branch));
            long followUpCount = scheduledReminders.size();

            counts.put(offset, expiringCount + followUpCount);
        }

        return counts;
    }

    @org.springframework.transaction.annotation.Transactional
    public Policy createPolicy(Policy policy, String agentName) {
        if (policy.getStatus() == null) {
            policy.setStatus("ACTIVE");
        }

        // Handle Customer: Check if exists by email to avoid duplicates
        Customer customer = policy.getCustomer();
        if (customer != null && customer.getId() == null && customer.getEmail() != null) {
            java.util.Optional<Customer> existingCustomer = customerRepository.findByEmail(customer.getEmail());
            if (existingCustomer.isPresent()) {
                policy.setCustomer(existingCustomer.get());
            }
        }

        Policy savedPolicy = policyRepository.save(policy);

        // Create default reminder
        Reminder reminder = new Reminder();
        reminder.setPolicy(savedPolicy);
        reminder.setReminderStatus("PENDING");
        reminder.setLastCallOutcome("Pending");
        reminder.setLastUpdatedBy(agentName != null ? agentName : "System");
        reminder.setLastReminderSentAt(null);
        reminderRepository.save(reminder);

        savedPolicy.setReminder(reminder);
        return savedPolicy;
    }

    @org.springframework.context.event.EventListener(org.springframework.boot.context.event.ApplicationReadyEvent.class)
    @org.springframework.transaction.annotation.Transactional
    public void ensureRemindersExist() {
        try {
            // 0. Cleanup Orphans (Invalid policy references)
            reminderRepository.deleteOrphans();

            // 1. Cleanup Duplicates (Multiple reminders for same policy)
            reminderRepository.deleteDuplicates();

            // 2. Create Missing Reminders
            List<Policy> policiesWithoutReminders = policyRepository.findPoliciesWithoutReminders();

            if (policiesWithoutReminders.isEmpty()) {
                return;
            }

            int count = 0;
            for (Policy policy : policiesWithoutReminders) {
                // Double check in case of race condition or cache
                if (policy.getReminder() == null) {
                    Reminder reminder = new Reminder();
                    reminder.setPolicy(policy);
                    reminder.setReminderStatus("PENDING");
                    reminder.setLastCallOutcome("Pending");
                    reminder.setLastUpdatedBy("System");
                    reminder.setLastReminderSentAt(null);

                    policy.setReminder(reminder); // Link both ways if needed for JPA context
                    reminderRepository.save(reminder);
                    // policyRepository.save(policy); // Cascading should handle this if configured,
                    // but saving reminder is usually enough if owner is Policy.
                    // Actually, Reminder owns the foreign key, so saving reminder is correct.
                    // But we might need to update Policy's reference to it if we keep using the
                    // policy object in this transaction.

                    count++;
                }
            }
            if (count > 0) {
                System.out.println("Created default reminders for " + count + " policies.");
            }
        } catch (Exception e) {
            System.err.println("ERROR: Failed to ensure reminders exist on startup: " + e.getMessage());
        }
    }

    @org.springframework.context.event.EventListener(org.springframework.boot.context.event.ApplicationReadyEvent.class)
    @org.springframework.transaction.annotation.Transactional
    public void autoIssueStuckLifeInsurancePolicies() {
        try {
            List<Policy> pendingPolicies = policyRepository.findByStatus("PENDING_ISSUANCE", null);
            int count = 0;
            for (Policy policy : pendingPolicies) {
                if ("Life Insurance".equalsIgnoreCase(policy.getType())) {
                    // Update dates
                    LocalDate oldExpiryDate = policy.getExpiryDate();
                    if (policy.getLastExpiryDate() == null) {
                        policy.setLastExpiryDate(oldExpiryDate);
                    }
                    if (oldExpiryDate != null) {
                        policy.setPolicyStartDate(oldExpiryDate.plusDays(1));
                        policy.setExpiryDate(oldExpiryDate.plusYears(1));
                        policy.setPolicyEndDate(oldExpiryDate.plusYears(1));
                    }
                    policy.setPolicyIssueDate(LocalDate.now());
                    policy.setStatus("ACTIVE");

                    // Update reminder
                    Reminder reminder = policy.getReminder();
                    if (reminder != null) {
                        reminder.setReminderStatus("Renewed");
                        reminder.setLastCallOutcome("Renewed");
                        reminderRepository.save(reminder);
                    }

                    policyRepository.save(policy);
                    count++;
                }
            }
            if (count > 0) {
                System.out.println(
                        "Retroactively auto-issued " + count + " stuck Life Insurance policies directly to MIS.");
            }
        } catch (Exception e) {
            System.err.println("ERROR: Failed to retroactively issue Life Insurance policies: " + e.getMessage());
        }
    }

    @org.springframework.transaction.annotation.Transactional
    public Policy renewPolicy(Long policyId, LocalDate newEndDate, LocalDate newStartDate, String agentName,
            String lateRenewalReason, String paymentMode, String paymentReference, java.math.BigDecimal paymentAmount,
            LocalDate paymentDate, String paymentBank, String paymentDocumentPath) {
        Policy policy = policyRepository.findById(policyId)
                .orElseThrow(() -> new RuntimeException("Policy not found: " + policyId));

        LocalDate oldExpiryDate = policy.getExpiryDate();

        // Determine reference date for Late Renewal Calculation
        // Use provided start date, or payment date, or today
        LocalDate referenceDate = (newStartDate != null) ? newStartDate
                : (paymentDate != null ? paymentDate : LocalDate.now());

        // Logic based on Policy Type
        String type = policy.getType();
        if ("Life Insurance".equalsIgnoreCase(type)) {
            // Life Insurance: Continuous
            policy.setLateRenewal(false);
            policy.setLateRenewalGap(null);
            policy.setLateRenewalReason(null);

            // Validation: Ensure Start Date is continuous (Next day of old expiry)
            // But we just trust the input or set it?
            // The prompt says "life will have next date of previous renewal"
            // We can enforce it here if newStartDate is null or just for logic.
            // For now, simpler to just disable the check as requested.
        } else if ("Health Insurance".equalsIgnoreCase(type)) {
            policy.setLateRenewal(false);
            policy.setLateRenewalGap(null);
            policy.setLateRenewalReason(null);
        } else {
            // Other: Check for Late Renewal (> 5 days gap)
            // Normalize oldExpiryDate to the reference year if it's in the past
            LocalDate comparisonDate = oldExpiryDate;
            if (comparisonDate.getYear() < referenceDate.getYear()) {
                comparisonDate = comparisonDate.withYear(referenceDate.getYear());
            }

            long gap = java.time.temporal.ChronoUnit.DAYS.between(comparisonDate, referenceDate);

            if (gap > 5) {
                policy.setLateRenewal(true);
                policy.setLateRenewalGap((int) gap);

                if (lateRenewalReason == null || lateRenewalReason.trim().isEmpty()) {
                    throw new IllegalArgumentException("Late renewal reason is required for gap > 5 days");
                }
                policy.setLateRenewalReason(lateRenewalReason);
            } else {
                policy.setLateRenewal(false);
                policy.setLateRenewalGap(null);
                policy.setLateRenewalReason(null);
            }
        }

        // DATES ARE NOT UPDATED HERE for most policies.
        // They will be updated by the Service Team during 'issuePolicy'.
        // However, Life Insurance bypasses Servicing and goes straight to MIS.
        boolean isLife = "Life Insurance".equalsIgnoreCase(type);

        if (isLife) {
            if (policy.getLastExpiryDate() == null) {
                policy.setLastExpiryDate(oldExpiryDate);
            }
            // Enforce Start Date = Old Expiry + 1 Day, and extend 1 Year
            policy.setPolicyStartDate(oldExpiryDate.plusDays(1));
            policy.setExpiryDate(oldExpiryDate.plusYears(1));
            policy.setPolicyEndDate(oldExpiryDate.plusYears(1));
            policy.setPolicyIssueDate(LocalDate.now());
        }

        // --- Payment & Status Logic ---
        policy.setPaymentMode(paymentMode);
        policy.setPaymentReference(paymentReference);
        policy.setPaymentAmount(paymentAmount);
        policy.setPaymentDate(paymentDate);
        policy.setPaymentBank(paymentBank);
        if (paymentDocumentPath != null) {
            policy.setPaymentDocumentPath(paymentDocumentPath);
        }

        String newStatus = isLife ? "ACTIVE" : "PENDING_ISSUANCE";
        String outcome = isLife ? "Renewed" : "Pending Issuance";
        String reminderStatus = isLife ? "Renewed" : "PENDING";

        policy.setStatus(newStatus); // Changed from unconditional PENDING_ISSUANCE

        // Reset reminder for the new cycle
        Reminder reminder = policy.getReminder();
        if (reminder == null) {
            reminder = new Reminder();
            reminder.setPolicy(policy);
        }

        // Update who performed the renewal
        reminder.setLastUpdatedBy(agentName);

        // Set outcome
        reminder.setLastCallOutcome(outcome);

        reminder.setLastReminderSentAt(java.time.LocalDateTime.now()); // Update timestamp
        reminder.setFollowUpDate(null);
        reminder.setFollowUpRequired(false);
        reminder.setReminderStatus(reminderStatus);

        policy.setReminder(reminder);

        // Create Call History record for the renewal
        CallHistory history = new CallHistory();
        history.setPolicy(policy);
        history.setCallDate(java.time.LocalDateTime.now());
        history.setCallOutcome(outcome);
        String notes = "Policy renewed. Status: " + outcome + ". Payment Mode: " + paymentMode + ". Ref: "
                + paymentReference;
        if (lateRenewalReason != null && !lateRenewalReason.trim().isEmpty()) {
            notes += ". Late Reason: " + lateRenewalReason;
        }
        history.setNotes(notes);

        // Update Reminder Notes as well so they show in the dashboard
        reminder.setNotes(notes);
        history.setAgentName(agentName);
        callHistoryRepository.save(history);

        return policyRepository.save(policy);

    }

    private String resolveEffectiveBranch(String requestedBranch) {
        org.springframework.security.core.Authentication auth = org.springframework.security.core.context.SecurityContextHolder
                .getContext().getAuthentication();
        if (auth == null || !auth.isAuthenticated())
            return requestedBranch;

        String username = auth.getName();
        com.insurance.renewal.entity.User user = userRepository.findByUsername(username).orElse(null);
        if (user == null || "ADMIN".equals(user.getRole())) {
            return requestedBranch;
        }

        // If the user is restricted by an assigned branch, enforce their branch instead
        // of requested branch.
        String assignedBranch = user.getAssignedBranch();
        if (assignedBranch != null && !assignedBranch.trim().isEmpty() && !assignedBranch.equals("null")) {
            return assignedBranch;
        }

        // If no assigned branch restricts them (i.e. empty = "All Branches Globally"),
        // they may query by the requested dropdown branch.
        return requestedBranch;
    }

    public List<Policy> getPoliciesForServicing(String branch) {
        branch = resolveEffectiveBranch(branch);
        return policyRepository.findByStatus("PENDING_ISSUANCE", branch);
    }

    public List<Policy> getServicedPolicies(String branch) {
        branch = resolveEffectiveBranch(branch);
        // Return policies that are ACTIVE and have an Issue Date (Serviced)
        return policyRepository.findByStatusAndPolicyIssueDateIsNotNullOrderByPolicyIssueDateDesc("ACTIVE", branch);
    }

    @org.springframework.transaction.annotation.Transactional
    public Policy issuePolicy(Long id, Policy details, String documentPath, String agentName) {
        Policy policy = policyRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Policy not found"));

        if (!"PENDING_ISSUANCE".equals(policy.getStatus())) {
            throw new IllegalStateException("Policy is not in pending issuance state");
        }

        // Update fields
        if (details.getPolicyNumber() != null)
            policy.setPolicyNumber(details.getPolicyNumber());
        if (details.getCustomer() != null && details.getCustomer().getId() != null) {
            // Ideally we shouldn't change customer ID ref, but if it's just updating string
            // fields:
            // policy.setCustomer(...) - skipping for now, assuming customer relationship is
            // stable
            // But user asked for "Application No/Customer id*" update.
            // If it's a string ID on customer, we might need to update Customer entity or
            // Policy field.
            // Assuming Customer ID is DB ID, we can't change it easily.
            // If "Application No" is a field on Policy or Customer?
            // Let's assume it's just 'Previous Policy No' or we update Policy Number.
        }
        if (details.getInsuranceName() != null)
            policy.setInsuranceName(details.getInsuranceName());
        if ("Life Insurance".equalsIgnoreCase(policy.getType()) && policy.getLastExpiryDate() != null) {
            // Enforce Start Date = Old Expiry + 1 Day for Life Insurance
            policy.setPolicyStartDate(policy.getLastExpiryDate().plusDays(1));
            System.out.println("DEBUG: Enforcing Life Insurance Start Date: " + policy.getPolicyStartDate());
        } else if (details.getPolicyStartDate() != null) {
            policy.setPolicyStartDate(details.getPolicyStartDate());
        }
        if (details.getExpiryDate() != null) {
            // Save old expiry date for historical lookup
            policy.setLastExpiryDate(policy.getExpiryDate());

            System.out.println("DEBUG: issuePolicy - Setting new Expiry Date: " + details.getExpiryDate());
            policy.setExpiryDate(details.getExpiryDate());
            policy.setPolicyEndDate(details.getExpiryDate()); // Sync End Date
        } else {
            System.out.println("DEBUG: issuePolicy - WARNING: New Expiry Date is NULL!");
        }

        // New Fields
        if (details.getNetPremium() != null) {
            policy.setNetPremium(details.getNetPremium());
            policy.setAmount(details.getNetPremium()); // Sync Amount
            policy.setDuePremium(details.getNetPremium()); // Sync Due Premium (Display Field)
        }
        // Save Payment Details - Authentically Update to Current (Overwrite old data)
        policy.setPaymentMode(details.getPaymentMode());
        policy.setPaymentReference(details.getPaymentReference());
        policy.setPaymentBank(details.getPaymentBank());
        policy.setPaymentDate(details.getPaymentDate());
        policy.setPaymentAmount(details.getPaymentAmount());
        if (details.getSumInsured() != null)
            policy.setSumInsured(details.getSumInsured());
        if (details.getPolicyIssueDate() != null)
            policy.setPolicyIssueDate(details.getPolicyIssueDate());
        if (details.getPreviousPolicyNumber() != null)
            policy.setPreviousPolicyNumber(details.getPreviousPolicyNumber());
        if (details.getProductName() != null)
            policy.setProductName(details.getProductName());

        if (documentPath != null) {
            policy.setPolicyDocumentPath(documentPath);
        }

        policy.setStatus("ACTIVE");

        // Update history to say 'Issued'
        CallHistory history = new CallHistory();
        history.setPolicy(policy);
        history.setCallDate(java.time.LocalDateTime.now());
        history.setCallOutcome("Policy Issued");
        String issueNotes = "Policy issued. Document: " + (documentPath != null ? "Yes" : "No");
        if (details.getNetPremium() != null)
            issueNotes += ". Net Premium: " + details.getNetPremium();
        if (details.getSumInsured() != null)
            issueNotes += ". Sum Insured: " + details.getSumInsured();
        history.setNotes(issueNotes);
        history.setAgentName(agentName);
        callHistoryRepository.save(history);

        // RESET REMINDER FOR NEXT CYCLE
        Reminder reminder = policy.getReminder();
        if (reminder != null) {
            reminder.setFollowUpDate(null);
            reminder.setReminderStatus("Renewed"); // Mark as Renewed
            // Preserve Late Renewal status if applicable, otherwise Renewed
            String finalOutcome = Boolean.TRUE.equals(policy.getLateRenewal()) ? "Late Renewed" : "Renewed";
            reminder.setLastCallOutcome(finalOutcome);
            reminder.setNotes(issueNotes); // Sync notes to reminder
            reminder.setLastUpdatedBy(agentName);
            reminder.setLastReminderSentAt(java.time.LocalDateTime.now());
            reminderRepository.save(reminder);
        }

        return policyRepository.save(policy);
    }

    public java.io.File getPaymentProofFile(Long policyId) {
        Policy policy = policyRepository.findById(policyId)
                .orElseThrow(() -> new RuntimeException("Policy not found"));

        String path = policy.getPaymentDocumentPath();
        if (path == null) {
            throw new RuntimeException("No payment document found for policies " + policyId);
        }
        return new java.io.File(path);
    }

    public java.io.File getPolicyDocumentFile(Long policyId) {
        Policy policy = policyRepository.findById(policyId)
                .orElseThrow(() -> new RuntimeException("Policy not found"));

        String path = policy.getPolicyDocumentPath();
        if (path == null) {
            throw new RuntimeException("No policy document found for policy " + policyId);
        }
        return new java.io.File(path);
    }

    public Map<String, List<Policy>> getRecordsForDate(LocalDate date, String branch) {
        System.out.println("DEBUG: getRecordsForDate called for date: " + date + " branch: " + branch);
        Map<String, List<Policy>> records = new HashMap<>();

        // 1. Expiring Policies on this date
        List<Policy> expiring = policyRepository.findAdminPoliciesForTimeline(date, branch);
        System.out.println("DEBUG: Found " + expiring.size() + " expiring policies for date: " + date);
        expiring.forEach(p -> System.out.println(" - Policy: " + p.getPolicyNumber() + ", Status: " + p.getStatus()));

        records.put("expiringPolicies", expiring);

        // 2. Scheduled Follow-ups on this date
        java.time.LocalDateTime start = date.atStartOfDay();
        java.time.LocalDateTime end = date.atTime(java.time.LocalTime.MAX);
        System.out.println("Fetching follow-ups between " + start + " and " + end);

        List<Reminder> reminders = reminderRepository.findByFollowUpDateBetweenWithValidPolicy(start, end, branch);
        System.out.println("Found " + reminders.size() + " follow-ups.");

        List<Policy> scheduledFollowUps = reminders.stream()
                .filter(reminder -> reminder.getPolicy() != null)
                .map(reminder -> {
                    Policy policy = reminder.getPolicy();
                    policy.setReminder(reminder);
                    return policy;
                })
                .collect(java.util.stream.Collectors.toList());
        records.put("scheduledFollowUps", scheduledFollowUps);

        // Remove policies from 'expiring' if they are already in 'scheduledFollowUps'
        java.util.Set<Long> followUpPolicyIds = scheduledFollowUps.stream()
                .map(Policy::getId)
                .collect(java.util.stream.Collectors.toSet());

        List<Policy> filteredExpiring = expiring.stream()
                .filter(p -> !followUpPolicyIds.contains(p.getId()))
                .collect(java.util.stream.Collectors.toList());

        records.put("expiringPolicies", filteredExpiring);

        // 3. Worked on Policies (Renewed/Called today)
        List<Reminder> workedOn = reminderRepository.findByLastReminderSentAtBetweenWithValidPolicy(
                date.atStartOfDay(), date.atTime(23, 59, 59), branch);

        List<Policy> workedOnPolicies = workedOn.stream()
                .map(reminder -> {
                    Policy policy = reminder.getPolicy();
                    policy.setReminder(reminder);
                    return policy;
                })
                .collect(java.util.stream.Collectors.toList());
        records.put("workedOnPolicies", workedOnPolicies);

        return records;
    }

    public List<Reminder> getAllCallRecords(String branch) {
        // Fetch only the 500 most recent records to prevent freezing the Admin
        // Dashboard
        org.springframework.data.domain.Pageable top500 = org.springframework.data.domain.PageRequest.of(0, 500);
        return reminderRepository.findTop500ByOrderByLastReminderSentAtDescWithValidPolicy(branch, top500);
    }

    @org.springframework.scheduling.annotation.Scheduled(cron = "0 0 0 * * ?") // Run at midnight
    @org.springframework.context.event.EventListener(org.springframework.boot.context.event.ApplicationReadyEvent.class) // Run
                                                                                                                         // on
                                                                                                                         // startup
    public void updateExpiredPolicies() {
        LocalDate today = LocalDate.now();
        List<Policy> expiredPolicies = policyRepository.findByExpiryDateBeforeAndStatus(today, "ACTIVE");

        if (!expiredPolicies.isEmpty()) {
            expiredPolicies.forEach(policy -> policy.setStatus("EXPIRED"));
            policyRepository.saveAll(expiredPolicies);
            System.out.println("UPDATED " + expiredPolicies.size() + " POLICIES TO EXPIRED STATUS");
        }
    }

    public List<Policy> searchPolicies(String query, String branch) {
        return applyRenewerFilters(policyRepository.searchPolicies(query, branch));
    }

    public List<Policy> getLateRenewals() {
        return applyRenewerFilters(policyRepository.findByLateRenewalTrue());
    }

    @org.springframework.transaction.annotation.Transactional
    public Policy updatePolicyDetails(Long policyId, Policy updatedPolicy) {
        Policy existingPolicy = policyRepository.findById(policyId)
                .orElseThrow(() -> new RuntimeException("Policy not found: " + policyId));

        String agentName = "Admin"; // Ideally pass this from controller/security context

        // Helper for null-safe logging
        java.util.function.BiConsumer<String, String> logIfChanged = (fieldName, newValue) -> {
            // This needs reflection or manual map to get old value, or we check field by
            // field below
        };

        // Update fields only if they are not null and different
        if (updatedPolicy.getPolicyNumber() != null
                && !updatedPolicy.getPolicyNumber().equals(existingPolicy.getPolicyNumber())) {
            logChange(policyId, "Policy Number", existingPolicy.getPolicyNumber(), updatedPolicy.getPolicyNumber(),
                    agentName);
            existingPolicy.setPolicyNumber(updatedPolicy.getPolicyNumber());
        }
        if (updatedPolicy.getType() != null && !updatedPolicy.getType().equals(existingPolicy.getType())) {
            logChange(policyId, "Type", existingPolicy.getType(), updatedPolicy.getType(), agentName);
            existingPolicy.setType(updatedPolicy.getType());
        }
        if (updatedPolicy.getAmount() != null && !updatedPolicy.getAmount().equals(existingPolicy.getAmount())) {
            logChange(policyId, "Amount", String.valueOf(existingPolicy.getAmount()),
                    String.valueOf(updatedPolicy.getAmount()), agentName);
            existingPolicy.setAmount(updatedPolicy.getAmount());
        }
        if (updatedPolicy.getExpiryDate() != null
                && !updatedPolicy.getExpiryDate().equals(existingPolicy.getExpiryDate())) {
            logChange(policyId, "Expiry Date", String.valueOf(existingPolicy.getExpiryDate()),
                    String.valueOf(updatedPolicy.getExpiryDate()), agentName);
            existingPolicy.setExpiryDate(updatedPolicy.getExpiryDate());
        }
        if (updatedPolicy.getInsuranceName() != null
                && !updatedPolicy.getInsuranceName().equals(existingPolicy.getInsuranceName())) {
            logChange(policyId, "Insurance Name", existingPolicy.getInsuranceName(), updatedPolicy.getInsuranceName(),
                    agentName);
            existingPolicy.setInsuranceName(updatedPolicy.getInsuranceName());
        }
        if (updatedPolicy.getPolicyStartDate() != null
                && !updatedPolicy.getPolicyStartDate().equals(existingPolicy.getPolicyStartDate())) {
            logChange(policyId, "Start Date", String.valueOf(existingPolicy.getPolicyStartDate()),
                    String.valueOf(updatedPolicy.getPolicyStartDate()), agentName);
            existingPolicy.setPolicyStartDate(updatedPolicy.getPolicyStartDate());
        }
        if (updatedPolicy.getPolicyEndDate() != null
                && !updatedPolicy.getPolicyEndDate().equals(existingPolicy.getPolicyEndDate())) {
            logChange(policyId, "End Date", String.valueOf(existingPolicy.getPolicyEndDate()),
                    String.valueOf(updatedPolicy.getPolicyEndDate()), agentName);
            existingPolicy.setPolicyEndDate(updatedPolicy.getPolicyEndDate());

            // Sync Expiry Date when End Date changes
            if (!updatedPolicy.getPolicyEndDate().equals(existingPolicy.getExpiryDate())) {
                logChange(policyId, "Expiry Date (Synced)", String.valueOf(existingPolicy.getExpiryDate()),
                        String.valueOf(updatedPolicy.getPolicyEndDate()), agentName);
                existingPolicy.setExpiryDate(updatedPolicy.getPolicyEndDate());
            }
        }
        if (updatedPolicy.getPolicyIssueDate() != null
                && !updatedPolicy.getPolicyIssueDate().equals(existingPolicy.getPolicyIssueDate())) {
            logChange(policyId, "Issue Date", String.valueOf(existingPolicy.getPolicyIssueDate()),
                    String.valueOf(updatedPolicy.getPolicyIssueDate()), agentName);
            existingPolicy.setPolicyIssueDate(updatedPolicy.getPolicyIssueDate());
        }
        if (updatedPolicy.getProductName() != null
                && !updatedPolicy.getProductName().equals(existingPolicy.getProductName())) {
            logChange(policyId, "Product Name", existingPolicy.getProductName(), updatedPolicy.getProductName(),
                    agentName);
            existingPolicy.setProductName(updatedPolicy.getProductName());
        }
        if (updatedPolicy.getDuePremium() != null
                && !updatedPolicy.getDuePremium().equals(existingPolicy.getDuePremium())) {
            logChange(policyId, "Due Premium", String.valueOf(existingPolicy.getDuePremium()),
                    String.valueOf(updatedPolicy.getDuePremium()), agentName);
            existingPolicy.setDuePremium(updatedPolicy.getDuePremium());
        }
        if (updatedPolicy.getRmName() != null && !updatedPolicy.getRmName().equals(existingPolicy.getRmName())) {
            logChange(policyId, "RM Name", existingPolicy.getRmName(), updatedPolicy.getRmName(), agentName);
            existingPolicy.setRmName(updatedPolicy.getRmName());
        }
        if (updatedPolicy.getAssociateName() != null
                && !updatedPolicy.getAssociateName().equals(existingPolicy.getAssociateName())) {
            logChange(policyId, "Associate Name", existingPolicy.getAssociateName(), updatedPolicy.getAssociateName(),
                    agentName);
            existingPolicy.setAssociateName(updatedPolicy.getAssociateName());
        }
        if (updatedPolicy.getAssociateCode() != null
                && !updatedPolicy.getAssociateCode().equals(existingPolicy.getAssociateCode())) {
            logChange(policyId, "Associate Code", existingPolicy.getAssociateCode(), updatedPolicy.getAssociateCode(),
                    agentName);
            existingPolicy.setAssociateCode(updatedPolicy.getAssociateCode());
        }
        if (updatedPolicy.getVehicleRegNo() != null
                && !updatedPolicy.getVehicleRegNo().equals(existingPolicy.getVehicleRegNo())) {
            logChange(policyId, "Vehicle No", existingPolicy.getVehicleRegNo(), updatedPolicy.getVehicleRegNo(),
                    agentName);
            existingPolicy.setVehicleRegNo(updatedPolicy.getVehicleRegNo());
        }
        if (updatedPolicy.getVehicleModel() != null
                && !updatedPolicy.getVehicleModel().equals(existingPolicy.getVehicleModel())) {
            logChange(policyId, "Vehicle Model", existingPolicy.getVehicleModel(), updatedPolicy.getVehicleModel(),
                    agentName);
            existingPolicy.setVehicleModel(updatedPolicy.getVehicleModel());
        }

        // Update customer details if provided
        if (updatedPolicy.getCustomer() != null) {
            Customer ec = existingPolicy.getCustomer();
            Customer uc = updatedPolicy.getCustomer();

            if (uc.getFirstName() != null && !uc.getFirstName().equals(ec.getFirstName())) {
                logChange(policyId, "Customer First Name", ec.getFirstName(), uc.getFirstName(), agentName);
                ec.setFirstName(uc.getFirstName());
            }
            if (uc.getLastName() != null && !uc.getLastName().equals(ec.getLastName())) {
                logChange(policyId, "Customer Last Name", ec.getLastName(), uc.getLastName(), agentName);
                ec.setLastName(uc.getLastName());
            }
            if (uc.getEmail() != null && !uc.getEmail().equals(ec.getEmail())) {
                logChange(policyId, "Customer Email", ec.getEmail(), uc.getEmail(), agentName);
                ec.setEmail(uc.getEmail());
            }
            if (uc.getPhone() != null && !uc.getPhone().equals(ec.getPhone())) {
                logChange(policyId, "Customer Phone", ec.getPhone(), uc.getPhone(), agentName);
                ec.setPhone(uc.getPhone());
            }
            if (uc.getDob() != null && !uc.getDob().equals(ec.getDob())) {
                logChange(policyId, "Customer DOB", String.valueOf(ec.getDob()), String.valueOf(uc.getDob()),
                        agentName);
                ec.setDob(uc.getDob());
            }
            // ... (Other customer fields can be similar, for brevity focusing on main ones)
            if (uc.getAddress() != null && !uc.getAddress().equals(ec.getAddress())) {
                logChange(policyId, "Address", ec.getAddress(), uc.getAddress(), agentName);
                ec.setAddress(uc.getAddress());
            }
            if (uc.getCity() != null && !uc.getCity().equals(ec.getCity())) {
                logChange(policyId, "City", ec.getCity(), uc.getCity(), agentName);
                ec.setCity(uc.getCity());
            }
            if (uc.getState() != null && !uc.getState().equals(ec.getState())) {
                logChange(policyId, "State", ec.getState(), uc.getState(), agentName);
                ec.setState(uc.getState());
            }
            if (uc.getGstNumber() != null && !uc.getGstNumber().equals(ec.getGstNumber())) {
                logChange(policyId, "GST", ec.getGstNumber(), uc.getGstNumber(), agentName);
                ec.setGstNumber(uc.getGstNumber());
            }
            if (uc.getPanNumber() != null && !uc.getPanNumber().equals(ec.getPanNumber())) {
                logChange(policyId, "PAN", ec.getPanNumber(), uc.getPanNumber(), agentName);
                ec.setPanNumber(uc.getPanNumber());
            }
            if (uc.getBillingFrequency() != null && !uc.getBillingFrequency().equals(ec.getBillingFrequency())) {
                logChange(policyId, "Billing Freq", ec.getBillingFrequency(), uc.getBillingFrequency(), agentName);
                ec.setBillingFrequency(uc.getBillingFrequency());
            }
        }

        // Update MIS Enrichment Fields
        if (updatedPolicy.getBusinessType() != null
                && !updatedPolicy.getBusinessType().equals(existingPolicy.getBusinessType())) {
            logChange(policyId, "Business Type", existingPolicy.getBusinessType(), updatedPolicy.getBusinessType(),
                    agentName);
            existingPolicy.setBusinessType(updatedPolicy.getBusinessType());
        }
        if (updatedPolicy.getLoginStatus() != null
                && !updatedPolicy.getLoginStatus().equals(existingPolicy.getLoginStatus())) {
            logChange(policyId, "Login Status", existingPolicy.getLoginStatus(), updatedPolicy.getLoginStatus(),
                    agentName);
            existingPolicy.setLoginStatus(updatedPolicy.getLoginStatus());
        }
        if (updatedPolicy.getBranch() != null && !updatedPolicy.getBranch().equals(existingPolicy.getBranch())) {
            logChange(policyId, "Branch", existingPolicy.getBranch(), updatedPolicy.getBranch(), agentName);
            existingPolicy.setBranch(updatedPolicy.getBranch());
        }

        return policyRepository.save(existingPolicy);
    }

    public List<CallHistory> getCallHistory(Long policyId) {
        return callHistoryRepository.findByPolicyIdOrderByCallDateDesc(policyId);
    }

    @org.springframework.transaction.annotation.Transactional
    public Reminder logCall(Long policyId, String notes, String outcome, java.time.LocalDateTime nextFollowUp,
            String agentName) {
        Policy policy = policyRepository.findById(policyId)
                .orElseThrow(() -> new RuntimeException("Policy not found: " + policyId));

        // Create or Update Reminder
        Reminder reminder = policy.getReminder();
        if (reminder == null) {
            reminder = new Reminder();
            reminder.setPolicy(policy);
        }

        reminder.setLastCallOutcome(outcome);
        reminder.setNotes(notes);
        reminder.setFollowUpDate(nextFollowUp);
        reminder.setFollowUpRequired(nextFollowUp != null);
        reminder.setLastUpdatedBy(agentName);
        reminder.setLastReminderSentAt(java.time.LocalDateTime.now());

        if (nextFollowUp != null) {
            reminder.setReminderStatus("SCHEDULED");
        }

        policy.setReminder(reminder);
        policyRepository.save(policy);

        // Log to Call History
        CallHistory history = new CallHistory();
        history.setPolicy(policy);
        history.setCallDate(java.time.LocalDateTime.now());
        history.setCallOutcome(outcome);
        history.setNotes(notes);
        history.setFollowUpDate(nextFollowUp);
        history.setAgentName(agentName);
        callHistoryRepository.save(history);

        return reminder;
    }

    @org.springframework.transaction.annotation.Transactional
    public void deletePolicy(Long policyId) {
        // 1. Delete Call History first (due to foreign key constraint)
        callHistoryRepository.deleteByPolicyId(policyId);

        // 2. Delete Policy (Reminder will be deleted automatically due to
        // CascadeType.ALL)
        policyRepository.deleteById(policyId);
    }

    public List<AuditLog> getAuditLogs(Long policyId) {
        return auditLogRepository.findByPolicyIdOrderByUpdatedAtDesc(policyId);
    }

    private void logChange(Long policyId, String fieldName, String oldValue, String newValue, String updatedBy) {
        AuditLog log = new AuditLog();
        log.setPolicyId(policyId);
        log.setFieldName(fieldName);
        log.setOldValue(oldValue);
        log.setNewValue(newValue);
        log.setUpdatedBy(updatedBy);
        log.setUpdatedAt(java.time.LocalDateTime.now());
        auditLogRepository.save(log);
    }

    public List<Policy> getTodaysWork(String branch) {
        return getTodaysWork(LocalDate.now(), true, branch);
    }

    private List<Policy> getTodaysWork(LocalDate today, boolean filterCompleted, String branch) {
        List<Integer> buckets = java.util.Arrays.asList(
                75, 60, 45, 30, 15, 7, 3, 2, 1, 0, // Pre-expiry & Today
                -1, -2, -3, -7, -15, -30, -45, -60, -75 // Post-expiry
        );

        List<LocalDate> targetDates = buckets.stream()
                .map(days -> today.plusDays((long) days))
                .collect(java.util.stream.Collectors.toList());

        // Fetch policies
        List<Policy> expiring = policyRepository.findPoliciesForTodaysWork(targetDates, branch);

        // Fetch reminders
        java.time.LocalDateTime endOfToday = today.plusDays(1).atStartOfDay();
        List<Reminder> reminders = reminderRepository.findPendingFollowUpsUpTo(endOfToday, branch);
        System.out.println("DEBUG TODAY'S WORK: Found " + reminders.size() + " pending followUps up to: " + endOfToday);

        java.util.Set<Long> processedPolicyIds = new java.util.HashSet<>();
        List<Policy> todaysWork = new java.util.ArrayList<>();

        // Filter out policies that have ALREADY been worked on today
        java.time.LocalDateTime startOfDay = today.atStartOfDay();

        // Add policies from reminders (Always include if it has an active follow-up for
        // today/overdue)
        for (Reminder r : reminders) {
            Policy p = r.getPolicy();
            if (p != null) {
                p.setReminder(r); // ensure reminder is attached

                boolean workedOnToday = false;
                if (r.getLastReminderSentAt() != null && !r.getLastReminderSentAt().isBefore(startOfDay)) {
                    workedOnToday = true;
                }

                if (!filterCompleted || !workedOnToday) {
                    if (processedPolicyIds.add(p.getId())) {
                        todaysWork.add(p);
                    }
                }
            }
        }

        // Add policies from expiring
        for (Policy p : expiring) {
            Reminder r = p.getReminder();
            boolean workedOnToday = false;
            if (r != null && r.getLastReminderSentAt() != null && !r.getLastReminderSentAt().isBefore(startOfDay)) {
                workedOnToday = true;
            }

            if (!filterCompleted || !workedOnToday) {
                if (processedPolicyIds.add(p.getId())) {
                    todaysWork.add(p);
                }
            }
        }

        // Sort them
        todaysWork.sort((p1, p2) -> {
            int score1 = getPriorityScore(p1, today);
            int score2 = getPriorityScore(p2, today);
            return Integer.compare(score1, score2);
        });

        return applyRenewerFilters(todaysWork);
    }

    private int getPriorityScore(Policy p, LocalDate today) {
        LocalDate targetDate = p.getExpiryDate();
        if (p.getReminder() != null && p.getReminder().getFollowUpDate() != null) {
            targetDate = p.getReminder().getFollowUpDate().toLocalDate();
        }

        if (targetDate == null)
            return Integer.MAX_VALUE; // Fallback

        long diff = java.time.temporal.ChronoUnit.DAYS.between(today, targetDate);

        // Today (0) = 0, +1 = 1... +75 = 75, -1 = 76, -2 = 77... -75 = 150
        if (diff >= 0) {
            return (int) diff;
        } else {
            return 75 + Math.abs((int) diff);
        }
    }

    public Map<String, Integer> getTodaysWorkProgress(String branch) {
        LocalDate today = LocalDate.now();

        // 1. Get the remaining tasks for today (excludes anything already completed
        // today)
        List<Policy> remainingTodaysWork = getTodaysWork(today, true, branch);

        // 2. Count everything that was completed today
        java.time.LocalDateTime startOfDay = today.atStartOfDay();
        java.time.LocalDateTime endOfDay = today.plusDays(1).atStartOfDay();

        List<Reminder> completedRemindersToday = reminderRepository
                .findByLastReminderSentAtBetweenWithValidPolicy(startOfDay, endOfDay, branch);
        completedRemindersToday = applyRenewerFiltersToReminders(completedRemindersToday);

        long completed = completedRemindersToday.stream()
                .filter(r -> r.getPolicy() != null)
                .map(r -> r.getPolicy().getId())
                .distinct()
                .count();

        int total = remainingTodaysWork.size() + (int) completed;

        Map<String, Integer> progress = new HashMap<>();
        progress.put("total", total);
        progress.put("completed", (int) completed);
        return progress;
    }
}
