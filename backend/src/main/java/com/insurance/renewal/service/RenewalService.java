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
import java.util.Set;
import java.util.HashSet;

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

    private com.insurance.renewal.entity.User getEffectiveUser(com.insurance.renewal.entity.User user) {
        if (user == null || user.getRole() == null) return user;
        if (user.getRole().contains("ADMIN")) {
            org.springframework.web.context.request.ServletRequestAttributes sra = 
                (org.springframework.web.context.request.ServletRequestAttributes) org.springframework.web.context.request.RequestContextHolder.getRequestAttributes();
            if (sra != null) {
                String viewAs = sra.getRequest().getHeader("X-Admin-View-As");
                if (viewAs != null && !viewAs.isEmpty()) {
                    com.insurance.renewal.entity.User mockUser = new com.insurance.renewal.entity.User();
                    mockUser.setUsername(user.getUsername());
                    mockUser.setAssignedBranch(user.getAssignedBranch());
                    mockUser.setAssignedCustomers(user.getAssignedCustomers());
                    mockUser.setAssignedProductType(user.getAssignedProductType());
                    mockUser.setAssignedPremiumRange(user.getAssignedPremiumRange());
                    mockUser.setAssignedRm(user.getAssignedRm());
                    if (viewAs.equals("claims")) mockUser.setRole("ROLE_CLAIMS_MANAGER");
                    else if (viewAs.equals("sales")) mockUser.setRole("ROLE_SALES_MANAGER");
                    else if (viewAs.equals("underwriting")) mockUser.setRole("ROLE_UNDERWRITING_MANAGER");
                    else mockUser.setRole(user.getRole());
                    return mockUser;
                }
            }
        }
        return user;
    }

    private List<Policy> applyRenewerFilters(List<Policy> policies) {
        org.springframework.security.core.Authentication auth = org.springframework.security.core.context.SecurityContextHolder
                .getContext().getAuthentication();
        if (auth == null || !auth.isAuthenticated())
            return policies;

        String username = auth.getName();
        com.insurance.renewal.entity.User user = userRepository.findByUsername(username).orElse(null);
        com.insurance.renewal.entity.User effectiveUser = getEffectiveUser(user);
        
        if (effectiveUser == null || effectiveUser.getRole() == null || effectiveUser.getRole().contains("ADMIN"))
            return policies; // ADMIN sees everything

        return applySpecificRenewerFilters(policies, effectiveUser);
    }

    private List<Policy> applySpecificRenewerFilters(List<Policy> policies, com.insurance.renewal.entity.User user) {
        return policies.stream().filter(p -> {
            // Role CLAIMS, SALES, UNDERWRITING Logic
            String role = user.getRole();
            if (role != null) {
                if (role.equals("ROLE_CLAIMS_MANAGER")) return "CLAIMS".equals(p.getTargetTeam());
                if (role.equals("ROLE_SALES_MANAGER")) return "SALES".equals(p.getTargetTeam());
                if (role.equals("ROLE_UNDERWRITING_MANAGER")) return "UNDERWRITING".equals(p.getTargetTeam());
                if (role.equals("ROLE_CLAIMS") || role.equals("ROLE_SALES") || role.equals("ROLE_UNDERWRITING")) {
                    return user.getUsername().equals(p.getCurrentAssignee());
                }
            }

            // Role RM Logic
            if (user.getRole().contains("RM")) {
                if (user.getAssignedBranch() != null && !user.getAssignedBranch().isEmpty()
                        && !user.getAssignedBranch().equals("null")) {
                    if (p.getBranch() == null || !user.getAssignedBranch().equalsIgnoreCase(p.getBranch()))
                        return false;
                }
                if (user.getAssignedRm() != null && !user.getAssignedRm().isEmpty()
                        && !user.getAssignedRm().equals("null")) {
                    if (p.getRmName() == null)
                        return false;
                    String[] allowedRms = user.getAssignedRm().split("\\s*,\\s*");
                    boolean match = false;
                    for (String rm : allowedRms) {
                        if (rm.equalsIgnoreCase(p.getRmName().trim())) {
                            match = true;
                            break;
                        }
                    }
                    if (!match)
                        return false;
                }
                return true;
            }

            // Role RENEWER Logic
            if (user.getAssignedBranch() != null && !user.getAssignedBranch().isEmpty()
                    && !user.getAssignedBranch().equals("null")) {
                if (p.getBranch() == null) return false;
                String[] assignedBranches = user.getAssignedBranch().split("\\s*,\\s*");
                boolean branchMatch = false;
                for (String branch : assignedBranches) {
                    if (branch.equalsIgnoreCase(p.getBranch())) {
                        branchMatch = true;
                        break;
                    }
                }
                if (!branchMatch) return false;
            }
            if (user.getAssignedCustomers() != null && !user.getAssignedCustomers().isEmpty()
                    && !user.getAssignedCustomers().equals("null")) {
                if (p.getCustomer() == null || p.getCustomer().getFirstName() == null)
                    return false;
                String fullName = p.getCustomer().getFirstName() + " " + p.getCustomer().getLastName();
                String[] allowedCustomers = user.getAssignedCustomers().split("\\s*,\\s*");
                boolean match = false;
                for (String c : allowedCustomers) {
                    if (c.equalsIgnoreCase(fullName.trim())) {
                        match = true;
                        break;
                    }
                }
                if (!match)
                    return false;
            } else if (user.getAssignedProductType() != null && !user.getAssignedProductType().isEmpty()
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

            // Exclude if routed to another team
            if (p.getTargetTeam() != null && !p.getTargetTeam().equals("RENEWER") && user.getRole() != null && user.getRole().contains("RENEWER")) {
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
        com.insurance.renewal.entity.User effectiveUser = getEffectiveUser(user);

        if (effectiveUser == null || effectiveUser.getRole() == null || effectiveUser.getRole().contains("ADMIN"))
            return reminders; // ADMIN sees everything

        return reminders.stream().filter(r -> {
            Policy p = r.getPolicy();
            if (p == null)
                return false;

            // Role CLAIMS, SALES, UNDERWRITING Logic
            String role = effectiveUser.getRole();
            if (role != null) {
                if (role.equals("ROLE_CLAIMS_MANAGER")) return "CLAIMS".equals(p.getTargetTeam());
                if (role.equals("ROLE_SALES_MANAGER")) return "SALES".equals(p.getTargetTeam());
                if (role.equals("ROLE_UNDERWRITING_MANAGER")) return "UNDERWRITING".equals(p.getTargetTeam());
                if (role.equals("ROLE_CLAIMS") || role.equals("ROLE_SALES") || role.equals("ROLE_UNDERWRITING")) {
                    return effectiveUser.getUsername().equals(p.getCurrentAssignee());
                }
            }

            // Role RM Logic
            if (effectiveUser.getRole().contains("RM")) {
                if (effectiveUser.getAssignedBranch() != null && !effectiveUser.getAssignedBranch().isEmpty()
                        && !effectiveUser.getAssignedBranch().equals("null")) {
                    if (p.getBranch() == null) return false;
                    String[] assignedBranches = effectiveUser.getAssignedBranch().split("\\s*,\\s*");
                    boolean branchMatch = false;
                    for (String branch : assignedBranches) {
                        if (branch.equalsIgnoreCase(p.getBranch())) {
                            branchMatch = true;
                            break;
                        }
                    }
                    if (!branchMatch) return false;
                }
                if (effectiveUser.getAssignedRm() != null && !effectiveUser.getAssignedRm().isEmpty()
                        && !effectiveUser.getAssignedRm().equals("null")) {
                    if (p.getRmName() == null)
                        return false;
                    String[] allowedRms = effectiveUser.getAssignedRm().split("\\s*,\\s*");
                    boolean match = false;
                    for (String rm : allowedRms) {
                        if (rm.equalsIgnoreCase(p.getRmName().trim())) {
                            match = true;
                            break;
                        }
                    }
                    if (!match)
                        return false;
                }
                return true;
            }

            // Role RENEWER Logic

            if (effectiveUser.getAssignedBranch() != null && !effectiveUser.getAssignedBranch().isEmpty()
                    && !effectiveUser.getAssignedBranch().equals("null")) {
                if (p.getBranch() == null) return false;
                String[] assignedBranches = effectiveUser.getAssignedBranch().split("\\s*,\\s*");
                boolean branchMatch = false;
                for (String branch : assignedBranches) {
                    if (branch.equalsIgnoreCase(p.getBranch())) {
                        branchMatch = true;
                        break;
                    }
                }
                if (!branchMatch) return false;
            }
            if (effectiveUser.getAssignedCustomers() != null && !effectiveUser.getAssignedCustomers().isEmpty()
                    && !effectiveUser.getAssignedCustomers().equals("null")) {
                if (p.getCustomer() == null || p.getCustomer().getFirstName() == null)
                    return false;
                String fullName = p.getCustomer().getFirstName() + " " + p.getCustomer().getLastName();
                String[] allowedCustomers = effectiveUser.getAssignedCustomers().split("\\s*,\\s*");
                boolean match = false;
                for (String c : allowedCustomers) {
                    if (c.equalsIgnoreCase(fullName.trim())) {
                        match = true;
                        break;
                    }
                }
                if (!match)
                    return false;
            } else if (effectiveUser.getAssignedProductType() != null && !effectiveUser.getAssignedProductType().isEmpty()
                    && !effectiveUser.getAssignedProductType().equals("null")) {
                if (p.getType() == null)
                    return false;
                String[] allowedTypes = effectiveUser.getAssignedProductType().split("\\s*,\\s*");
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
            if (effectiveUser.getAssignedPremiumRange() != null && !effectiveUser.getAssignedPremiumRange().isEmpty()
                    && !effectiveUser.getAssignedPremiumRange().equals("null")) {
                double amount = p.getAmount() != null ? p.getAmount().doubleValue() : 0;
                String range = effectiveUser.getAssignedPremiumRange().trim();
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

            // Exclude if routed to another team
            if (p.getTargetTeam() != null && !p.getTargetTeam().equals("RENEWER") && effectiveUser.getRole() != null && effectiveUser.getRole().contains("RENEWER")) {
                return false;
            }

            return true;
        }).collect(java.util.stream.Collectors.toList());
    }

    // Get policies expiring in exactly 'days' from now
    // If days is negative, it means expired 'days' ago
    public List<Policy> getPoliciesForTimeline(int days, String branch, String sourceTeam) {
        LocalDate targetDate = LocalDate.now().plusDays(days);
        
        org.springframework.security.core.Authentication auth = org.springframework.security.core.context.SecurityContextHolder
                .getContext().getAuthentication();
        String role = null;
        if (auth != null && auth.isAuthenticated()) {
            com.insurance.renewal.entity.User user = userRepository.findByUsername(auth.getName()).orElse(null);
            com.insurance.renewal.entity.User effectiveUser = getEffectiveUser(user);
            role = effectiveUser != null ? effectiveUser.getRole() : null;
        }
            
        boolean isTeam = role != null && (role.contains("CLAIMS") || role.contains("SALES") || role.contains("UNDERWRITING"));

        if (isTeam) {
            List<Policy> teamPolicies = policyRepository.findPoliciesByRoutedAt(targetDate);
            return applyRenewerFilters(teamPolicies);
        }

        // Use the new method that excludes policies with future follow-ups
        List<Policy> policies = policyRepository.findPoliciesForTimeline(targetDate);
        
        if (branch != null && !branch.trim().isEmpty() && !branch.equals("null")) {
            policies = policies.stream().filter(p -> branch.equalsIgnoreCase(p.getBranch())).collect(java.util.stream.Collectors.toList());
        }
        
        if (sourceTeam != null && !sourceTeam.trim().isEmpty() && !sourceTeam.equals("null")) {
            policies = policies.stream().filter(p -> sourceTeam.equals(p.getTargetTeam())).collect(java.util.stream.Collectors.toList());
        }
        
        return applyRenewerFilters(policies);
    }

    public List<Policy> getHighValueDeals(String branch) {
        LocalDate today = LocalDate.now();
        LocalDate nextMonth = today.plusDays(30);
        
        List<Policy> upcomingPolicies = policyRepository.findAllPoliciesForTargetDateRange(today, nextMonth, branch);
        
        return applyRenewerFilters(upcomingPolicies);
    }

    public List<Policy> getReturnedToRenewerPolicies() {
        org.springframework.security.core.Authentication auth = org.springframework.security.core.context.SecurityContextHolder
                .getContext().getAuthentication();
        if (auth == null || !auth.isAuthenticated())
            return new java.util.ArrayList<>();

        com.insurance.renewal.entity.User user = userRepository.findByUsername(auth.getName()).orElse(null);
        com.insurance.renewal.entity.User effectiveUser = getEffectiveUser(user);
        if (effectiveUser == null || effectiveUser.getRole() == null)
            return new java.util.ArrayList<>();

        String role = effectiveUser.getRole();
        String team = null;
        if (role.contains("CLAIMS")) team = "CLAIMS";
        else if (role.contains("SALES")) team = "SALES";
        else if (role.contains("UNDERWRITING")) team = "UNDERWRITING";

        if (team == null) return new java.util.ArrayList<>();

        LocalDate today = LocalDate.now();
        LocalDate startDate = today.minusDays(75);

        return policyRepository.findReturnedToRenewerPolicies(team, startDate, today);
    }

    // Get reminders scheduled for follow-up in 'days'
    public List<Reminder> getFollowUpsForTimeline(int days) {
        LocalDate targetDate = LocalDate.now().plusDays(days);
        return applyRenewerFiltersToReminders(
                reminderRepository.findByFollowUpDateBetween(targetDate.atStartOfDay(), targetDate.atTime(23, 59, 59)));
    }

    @org.springframework.transaction.annotation.Transactional(readOnly = true)
    public Map<String, Object> getAdminStats(String branch) {
        Map<String, Object> stats = new HashMap<>();

        long totalPolicies;
        long totalReminders;

        org.springframework.security.core.Authentication auth = org.springframework.security.core.context.SecurityContextHolder.getContext().getAuthentication();
        String username = auth != null && auth.isAuthenticated() ? auth.getName() : null;
        com.insurance.renewal.entity.User user = username != null ? userRepository.findByUsername(username).orElse(null) : null;
        boolean isRmOrRenewer = user != null && user.getRole() != null && (user.getRole().contains("RM") || user.getRole().contains("RENEWER"));

        if (isRmOrRenewer) {
            if (user.getRole().contains("RM")) {
                List<String> assignedRms = null;
                if (user.getAssignedRm() != null && !user.getAssignedRm().trim().isEmpty() && !user.getAssignedRm().equals("null")) {
                    assignedRms = java.util.Arrays.stream(user.getAssignedRm().split(","))
                            .map(String::trim)
                            .map(String::toLowerCase)
                            .collect(java.util.stream.Collectors.toList());
                }

                if (assignedRms != null && !assignedRms.isEmpty()) {
                    if (branch != null && !branch.trim().isEmpty()) {
                        totalPolicies = policyRepository.countByBranchAndRmNamesIgnoreCase(branch, assignedRms);
                        totalReminders = reminderRepository.countByReminderStatusAndBranchAndRmNamesIgnoreCase("PENDING", branch, assignedRms);
                    } else {
                        totalPolicies = policyRepository.countByRmNamesIgnoreCase(assignedRms);
                        totalReminders = reminderRepository.countByReminderStatusAndRmNamesIgnoreCase("PENDING", assignedRms);
                    }
                } else {
                    totalPolicies = 0;
                    totalReminders = 0;
                }
            } else {
                List<Policy> allPols = (branch != null && !branch.trim().isEmpty()) ? policyRepository.findByBranchIgnoreCase(branch) : policyRepository.findAll();
                totalPolicies = applyRenewerFilters(allPols).size();
                
                List<Reminder> pendingRems = (branch != null && !branch.trim().isEmpty()) ? reminderRepository.findByReminderStatusAndBranchIgnoreCase("PENDING", branch) : reminderRepository.findByReminderStatusIgnoreCase("PENDING");
                totalReminders = applyRenewerFiltersToReminders(pendingRems).size();
            }
        } else {
            if (branch != null && !branch.trim().isEmpty()) {
                // Use efficient DB counting instead of fetching all entities into memory
                totalPolicies = policyRepository.countByBranchIgnoreCase(branch);
                totalReminders = reminderRepository.countByReminderStatusAndBranchIgnoreCase("PENDING", branch);
            } else {
                totalPolicies = policyRepository.count();
                totalReminders = reminderRepository.countByReminderStatusIgnoreCase("PENDING");
            }
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

    @org.springframework.transaction.annotation.Transactional(readOnly = true)
    public Map<Integer, Long> getTimelineCounts(String branch, String sourceTeam) {
        Map<Integer, Long> counts = new HashMap<>();
        LocalDate today = LocalDate.now();

        org.springframework.security.core.Authentication auth = org.springframework.security.core.context.SecurityContextHolder
                .getContext().getAuthentication();
        String role = null;
        if (auth != null && auth.isAuthenticated()) {
            com.insurance.renewal.entity.User user = userRepository.findByUsername(auth.getName()).orElse(null);
            com.insurance.renewal.entity.User effectiveUser = getEffectiveUser(user);
            role = effectiveUser != null ? effectiveUser.getRole() : null;
        }
            
        boolean isTeam = role != null && (role.contains("CLAIMS") || role.contains("SALES") || role.contains("UNDERWRITING"));

        List<Integer> specificDays = isTeam ? 
            Arrays.asList(0, -1, -2, -3, -4, -5, -6, -7, -8, -9, -10, -11, -12, -13, -14, -15) :
            Arrays.asList(75, 60, 45, 30, 15, 7, 3, 2, 1, 0, -1, -2, -3, -4, -5, -6, -7, -8, -9, -10, -11, -12, -13, -14, -15, -30, -45, -60, -75);

        if (isTeam) {
            // Map the specific days to LocalDates
            List<LocalDate> targetDates = specificDays.stream()
                    .map(offset -> today.plusDays(offset))
                    .collect(java.util.stream.Collectors.toList());

            // Fetch ONLY the policies routed on these specific days
            List<Policy> allRoutedPolicies = policyRepository.findPoliciesByRoutedAtIn(targetDates);
            List<Policy> filteredTeamPolicies = applyRenewerFilters(allRoutedPolicies);

            for (Integer offset : specificDays) {
                LocalDate targetDate = today.plusDays(offset);
                long count = filteredTeamPolicies.stream()
                        .filter(p -> targetDate.equals(p.getRoutedAt()))
                        .count();
                counts.put(offset, count);
            }
        } else {
            for (Integer offset : specificDays) {
                LocalDate targetDate = today.plusDays(offset);
                List<Policy> expiringPolicies = applyRenewerFilters(
                        policyRepository.findAdminPoliciesForTimeline(targetDate, branch));
                
                if (sourceTeam != null && !sourceTeam.trim().isEmpty() && !sourceTeam.equals("null")) {
                    expiringPolicies = expiringPolicies.stream().filter(p -> sourceTeam.equals(p.getTargetTeam())).collect(java.util.stream.Collectors.toList());
                }
                
                long expiringCount = expiringPolicies.size();

                List<Reminder> scheduledReminders = applyRenewerFiltersToReminders(
                        reminderRepository.findByFollowUpDateBetweenWithValidPolicy(targetDate.atStartOfDay(),
                                targetDate.atTime(23, 59, 59), branch));
                long followUpCount = scheduledReminders.size();

                counts.put(offset, expiringCount + followUpCount);
            }
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
            int count = reminderRepository.bulkCreateMissingReminders();
            
            if (count > 0) {
                System.out.println("Created default reminders for " + count + " policies via fast bulk DB insert.");
            }
        } catch (Exception e) {
            System.err.println("ERROR: Failed to ensure reminders exist on startup: " + e.getMessage());
        }
    }

    @org.springframework.context.event.EventListener(org.springframework.boot.context.event.ApplicationReadyEvent.class)
    @org.springframework.transaction.annotation.Transactional
    public void autoIssueStuckLifeInsurancePolicies() {
        try {
            int updatedPolicies = policyRepository.bulkAutoIssueLifeInsurancePolicies();
            if (updatedPolicies > 0) {
                int updatedReminders = reminderRepository.bulkUpdateAutoIssuedReminders();
                System.out.println("Retroactively auto-issued " + updatedPolicies + 
                        " stuck Life Insurance policies directly to MIS (updated " + updatedReminders + " reminders).");
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

    public Policy saveRmUpdate(Long policyId, String rmUpdate, String agentName) {
        Policy policy = policyRepository.findById(policyId)
                .orElseThrow(() -> new RuntimeException("Policy not found"));
        
        String oldUpdate = policy.getRmUpdate();
        policy.setRmUpdate(rmUpdate);
        logChange(policyId, "RM Update", oldUpdate, rmUpdate, agentName);
        
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
        List<Policy> expiring = applyRenewerFilters(policyRepository.findAdminPoliciesForTimeline(date, branch));
        System.out.println("DEBUG: Found " + expiring.size() + " expiring policies for date: " + date);
        expiring.forEach(p -> System.out.println(" - Policy: " + p.getPolicyNumber() + ", Status: " + p.getStatus()));

        records.put("expiringPolicies", expiring);

        // 2. Scheduled Follow-ups on this date
        java.time.LocalDateTime start = date.atStartOfDay();
        java.time.LocalDateTime end = date.atTime(java.time.LocalTime.MAX);
        System.out.println("Fetching follow-ups between " + start + " and " + end);

        List<Reminder> reminders = reminderRepository.findByFollowUpDateBetweenWithValidPolicy(start, end, branch);
        List<Reminder> filteredReminders = applyRenewerFiltersToReminders(reminders);
        System.out.println("Found " + filteredReminders.size() + " follow-ups.");

        List<Policy> scheduledFollowUps = filteredReminders.stream()
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
        List<Reminder> filteredWorkedOn = applyRenewerFiltersToReminders(workedOn);

        List<Policy> workedOnPolicies = filteredWorkedOn.stream()
                .map(reminder -> {
                    Policy policy = reminder.getPolicy();
                    policy.setReminder(reminder);
                    return policy;
                })
                .collect(java.util.stream.Collectors.toList());
        records.put("workedOnPolicies", workedOnPolicies);

        return records;
    }

    public Map<String, List<Policy>> getRecordsForNext60Days(String branch) {
        System.out.println("DEBUG: getRecordsForNext60Days called branch: " + branch);
        Map<String, List<Policy>> records = new HashMap<>();

        LocalDate today = LocalDate.now();
        LocalDate endBase = today.plusDays(60);

        // 1. Expiring Policies in next 60 days
        List<Policy> expiring = applyRenewerFilters(policyRepository.findPoliciesForTargetDateRange(today, endBase, branch));
        System.out.println("DEBUG: Found " + expiring.size() + " expiring policies for next 60 days");

        records.put("expiringPolicies", expiring);

        // 2. Scheduled Follow-ups in next 60 days
        java.time.LocalDateTime start = today.atStartOfDay();
        java.time.LocalDateTime end = endBase.atTime(23, 59, 59);

        List<Reminder> reminders = reminderRepository.findByFollowUpDateBetweenWithValidPolicy(start, end, branch);
        List<Reminder> filteredReminders = applyRenewerFiltersToReminders(reminders);
        System.out.println("Found " + filteredReminders.size() + " follow-ups for next 60 days.");

        List<Policy> scheduledFollowUps = filteredReminders.stream()
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

        return records;
    }

    public List<Map<String, Object>> getRenewerStats(String dateStr, String agentName) {
        List<Map<String, Object>> stats = new java.util.ArrayList<>();
        
        // 1. Get all users and filter by RENEWER role only
        List<com.insurance.renewal.entity.User> allUsers = userRepository.findAll();
        List<com.insurance.renewal.entity.User> renewers = new java.util.ArrayList<>();
        for (com.insurance.renewal.entity.User u : allUsers) {
            if (u.getRole() != null && u.getRole().contains("RENEWER")) {
                if (agentName == null || agentName.trim().isEmpty() || agentName.equals(u.getUsername())) {
                    renewers.add(u);
                }
            }
        }
        
        // 2. Define date range
        java.time.LocalDateTime startOfRange;
        java.time.LocalDateTime endOfRange;
        
        if (dateStr != null && !dateStr.trim().isEmpty()) {
            java.time.LocalDate selectedDate = java.time.LocalDate.parse(dateStr);
            startOfRange = selectedDate.atStartOfDay();
            endOfRange = startOfRange.plusDays(1).minusNanos(1);
        } else {
            startOfRange = java.time.LocalDateTime.now().withDayOfMonth(1).withHour(0).withMinute(0).withSecond(0).withNano(0);
            endOfRange = startOfRange.plusMonths(1).minusNanos(1);
        }
        
        List<Policy> allPoliciesInRange = policyRepository.findPoliciesOriginallyExpiringInRange(startOfRange.toLocalDate(), endOfRange.toLocalDate());
        
        for (com.insurance.renewal.entity.User user : renewers) {
            String username = user.getUsername();
            List<CallHistory> calls = callHistoryRepository.findByAgentNameAndCallDateBetween(username, startOfRange, endOfRange);
            
            Map<String, Integer> outcomeCounts = new HashMap<>();
            outcomeCounts.put("Renewed", 0);
            outcomeCounts.put("Interested", 0);
            outcomeCounts.put("Not Interested", 0);
            outcomeCounts.put("Call Back Later", 0);
            outcomeCounts.put("Voicemail", 0);
            outcomeCounts.put("Externally Renewed", 0);
            
            int total = 0;
            
            for (CallHistory call : calls) {
                String outcome = call.getCallOutcome();
                
                // Map "Pending Issuance" (used for most policies) to "Renewed" for stats purposes
                if ("Pending Issuance".equalsIgnoreCase(outcome)) {
                    outcome = "Renewed";
                }

                if (outcome != null && outcomeCounts.containsKey(outcome)) {
                    outcomeCounts.put(outcome, outcomeCounts.get(outcome) + 1);
                    total++;
                }
            }
            
            Set<Long> uniquePolicyIds = new HashSet<>();
            for (CallHistory call : calls) {
                if (call.getPolicy() != null) {
                    uniquePolicyIds.add(call.getPolicy().getId());
                }
            }
            int uniqueCount = uniquePolicyIds.size();
            
            int assignedCount = applySpecificRenewerFilters(allPoliciesInRange, user).size();
            
            Map<String, Object> renewerStat = new HashMap<>();
            renewerStat.put("agentName", username);
            renewerStat.put("stats", outcomeCounts);
            renewerStat.put("total", total);
            renewerStat.put("uniqueCount", uniqueCount);
            renewerStat.put("assignedCount", assignedCount);
            stats.add(renewerStat);
        }
        
        return stats;
    }

    public List<Reminder> getAllCallRecords(String branch) {
        // Fetch only the 500 most recent records to prevent freezing the Admin
        // Dashboard
        org.springframework.data.domain.Pageable top500 = org.springframework.data.domain.PageRequest.of(0, 500);
        return applyRenewerFiltersToReminders(reminderRepository.findTop500ByOrderByLastReminderSentAtDescWithValidPolicy(branch, top500));
    }

    @org.springframework.scheduling.annotation.Scheduled(cron = "0 0 0 * * ?") // Run at midnight
    @org.springframework.context.event.EventListener(org.springframework.boot.context.event.ApplicationReadyEvent.class) // Run on startup
    @org.springframework.transaction.annotation.Transactional
    public void updateExpiredPolicies() {
        int updatedCount = policyRepository.bulkUpdateExpiredPoliciesStatus();
        if (updatedCount > 0) {
            System.out.println("UPDATED " + updatedCount + " POLICIES TO EXPIRED STATUS (NATIVELY MIGRATED)");
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
        if (updatedPolicy.getRmEmail() != null && !updatedPolicy.getRmEmail().equals(existingPolicy.getRmEmail())) {
            logChange(policyId, "RM Email", existingPolicy.getRmEmail(), updatedPolicy.getRmEmail(), agentName);
            existingPolicy.setRmEmail(updatedPolicy.getRmEmail());
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
            String agentName, String contactTo, String contactName, String contactNumber) {
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
        history.setContactTo(contactTo);
        history.setContactName(contactName);
        history.setContactNumber(contactNumber);
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

    @org.springframework.transaction.annotation.Transactional(readOnly = true)
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

        List<Integer> buckets = java.util.Arrays.asList(
                75, 60, 45, 30, 15, 7, 3, 2, 1, 0,
                -1, -2, -3, -7, -15, -30, -45, -60, -75
        );

        long displayedCompleted = completedRemindersToday.stream()
                .filter(r -> r.getPolicy() != null)
                .map(r -> r.getPolicy().getId())
                .distinct()
                .count();

        long coreCompleted = completedRemindersToday.stream()
                .filter(r -> r.getPolicy() != null)
                .map(r -> r.getPolicy())
                .distinct()
                .filter(p -> {
                    // Was this policy part of today's CORE workload?
                    // We check the last CallHistory before today
                    com.insurance.renewal.entity.CallHistory priorCall = callHistoryRepository
                            .findFirstByPolicyIdAndCallDateBeforeOrderByCallDateDesc(p.getId(), startOfDay);
                    
                    java.time.LocalDateTime priorFollowUp = (priorCall != null) ? priorCall.getFollowUpDate() : null;

                    if (priorFollowUp != null) {
                        return !priorFollowUp.isAfter(endOfDay);
                    } else {
                        if (p.getExpiryDate() == null) return false;
                        long diff = java.time.temporal.ChronoUnit.DAYS.between(today, p.getExpiryDate());
                        return buckets.contains((int) diff);
                    }
                })
                .count();

        // By adding coreCompleted, the total remains exactly matching the original day target!
        int total = remainingTodaysWork.size() + (int) coreCompleted;

        Map<String, Integer> progress = new HashMap<>();
        progress.put("total", total);
        progress.put("completed", (int) displayedCompleted);
        return progress;
    }
}
