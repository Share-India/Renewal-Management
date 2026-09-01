package com.insurance.renewal.repository;

import com.insurance.renewal.entity.Policy;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.time.LocalDate;
import java.util.List;

@Repository
public interface PolicyRepository extends JpaRepository<Policy, Long> {

    java.util.Optional<Policy> findByPolicyNumber(String policyNumber);
        List<Policy> findByExpiryDate(LocalDate expiryDate);
        @Query("SELECT COUNT(p) FROM Policy p WHERE p.expiryDate = :expiryDate AND (:branch IS NULL OR :branch = '' OR p.branch = :branch)")
        long countByExpiryDate(@Param("expiryDate") LocalDate expiryDate, @Param("branch") String branch);

        @Query("SELECT p FROM Policy p LEFT JOIN FETCH p.reminder r WHERE p.expiryDate = :expiryDate AND p.status != 'PENDING_ISSUANCE' AND r.followUpDate IS NULL")
        List<Policy> findPoliciesForTimeline(@Param("expiryDate") LocalDate expiryDate);

        @Query("SELECT p FROM Policy p LEFT JOIN FETCH p.reminder r JOIN FETCH p.customer c WHERE p.expiryDate = :expiryDate AND p.status != 'PENDING_ISSUANCE' AND r.followUpDate IS NULL AND (:branch IS NULL OR :branch = '' OR p.branch = :branch)")
        List<Policy> findAdminPoliciesForTimeline(@Param("expiryDate") LocalDate expiryDate, @Param("branch") String branch);

        @Query("SELECT p FROM Policy p LEFT JOIN FETCH p.reminder r JOIN FETCH p.customer c WHERE p.expiryDate IN :targetDates AND p.status != 'PENDING_ISSUANCE' AND r.followUpDate IS NULL AND (:branch IS NULL OR :branch = '' OR p.branch = :branch)")
        List<Policy> findPoliciesForTodaysWork(@Param("targetDates") List<LocalDate> targetDates, @Param("branch") String branch);

        @Query("SELECT p FROM Policy p LEFT JOIN FETCH p.reminder r JOIN FETCH p.customer c WHERE p.expiryDate >= :startDate AND p.expiryDate <= :endDate AND p.status != 'PENDING_ISSUANCE' AND r.followUpDate IS NULL AND (:branch IS NULL OR :branch = '' OR p.branch = :branch)")
        List<Policy> findPoliciesForTargetDateRange(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate, @Param("branch") String branch);

        @Query("SELECT p FROM Policy p LEFT JOIN FETCH p.reminder r JOIN FETCH p.customer c WHERE p.expiryDate >= :startDate AND p.expiryDate <= :endDate AND p.status != 'PENDING_ISSUANCE' AND (:branch IS NULL OR :branch = '' OR p.branch = :branch)")
        List<Policy> findAllPoliciesForTargetDateRange(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate, @Param("branch") String branch);

        List<Policy> findByExpiryDateBetween(LocalDate startDate, LocalDate endDate);
        List<Policy> findByTargetTeamIgnoreCase(String targetTeam);

        @Query("SELECT p FROM Policy p WHERE (p.expiryDate >= :startDate AND p.expiryDate <= :endDate) OR (p.lastExpiryDate >= :startDate AND p.lastExpiryDate <= :endDate)")
        List<Policy> findPoliciesOriginallyExpiringInRange(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);

        List<Policy> findByExpiryDateBeforeAndStatus(LocalDate date, String status);

        @Query("SELECT COUNT(p) FROM Policy p LEFT JOIN p.reminder r WHERE " +
                        "(FUNCTION('DATEDIFF', p.expiryDate, :currentDate) IN :offsets) " +
                        "AND (r.followUpDate IS NULL) AND (:branch IS NULL OR :branch = '' OR p.branch = :branch)")
        long countPoliciesForTimelineBuckets(@Param("currentDate") LocalDate currentDate,
                        @Param("offsets") List<Integer> offsets, @Param("branch") String branch);

        @Query("SELECT p FROM Policy p WHERE " +
                        "(LOWER(p.policyNumber) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
                        "LOWER(p.customer.firstName) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
                        "LOWER(p.customer.lastName) LIKE LOWER(CONCAT('%', :query, '%'))) AND " +
                        "(:branch IS NULL OR :branch = '' OR p.branch = :branch)")
        List<Policy> searchPolicies(@Param("query") String query, @Param("branch") String branch);

        List<Policy> findByLateRenewalTrue();

        @Query("SELECT p FROM Policy p WHERE p.status = :status AND (:branch IS NULL OR :branch = '' OR p.branch = :branch)")
        List<Policy> findByStatus(@Param("status") String status, @Param("branch") String branch);

        @Query("SELECT p FROM Policy p WHERE p.status = :status AND p.policyIssueDate IS NOT NULL AND (:branch IS NULL OR :branch = '' OR p.branch = :branch) ORDER BY p.policyIssueDate DESC")
        List<Policy> findByStatusAndPolicyIssueDateIsNotNullOrderByPolicyIssueDateDesc(@Param("status") String status, @Param("branch") String branch);

        @Query("SELECT p FROM Policy p WHERE p.targetTeam = 'RENEWER' AND p.lastRoutedFrom = :team AND p.routedAt >= :startDate AND p.routedAt <= :endDate")
        List<Policy> findReturnedToRenewerPolicies(@Param("team") String team, @Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);

        @Query("SELECT p FROM Policy p WHERE p.id NOT IN (SELECT r.policy.id FROM Reminder r)")
        List<Policy> findPoliciesWithoutReminders();

        @Query("SELECT DISTINCT p.branch FROM Policy p WHERE p.branch IS NOT NULL")
        List<String> findDistinctBranches();

        // Team routing queries
        @Query("SELECT p FROM Policy p LEFT JOIN FETCH p.reminder r JOIN FETCH p.customer c WHERE p.routedAt = :routedAt")
        List<Policy> findPoliciesByRoutedAt(@Param("routedAt") LocalDate routedAt);

        @Query("SELECT p FROM Policy p LEFT JOIN FETCH p.reminder r JOIN FETCH p.customer c WHERE p.routedAt IN :routedAts")
        List<Policy> findPoliciesByRoutedAtIn(@Param("routedAts") List<LocalDate> routedAts);

        @Query("SELECT DISTINCT p.rmName FROM Policy p WHERE p.rmName IS NOT NULL AND p.rmName != '' AND (:branch IS NULL OR :branch = '' OR p.branch = :branch) ORDER BY p.rmName ASC")
        List<String> findDistinctRmNamesByBranch(@Param("branch") String branch);

        @Query("SELECT DISTINCT p.rmName FROM Policy p WHERE p.rmName IS NOT NULL AND p.rmName != '' AND (p.branch IN :branches) ORDER BY p.rmName ASC")
        List<String> findDistinctRmNamesByBranches(@Param("branches") List<String> branches);

        @Query("SELECT DISTINCT CONCAT(c.firstName, ' ', c.lastName) FROM Policy p JOIN p.customer c WHERE (:branch IS NULL OR :branch = '' OR p.branch = :branch)")
        List<String> findDistinctCustomerNamesByBranch(@Param("branch") String branch);

        @Query("SELECT DISTINCT CONCAT(c.firstName, ' ', c.lastName) FROM Policy p JOIN p.customer c WHERE (p.branch IN :branches)")
        List<String> findDistinctCustomerNamesByBranches(@Param("branches") List<String> branches);

        long countByBranchIgnoreCase(String branch);
        List<Policy> findByBranchIgnoreCase(String branch);

        @Query("SELECT COUNT(p) FROM Policy p WHERE (:branch IS NULL OR :branch = '' OR LOWER(p.branch) = LOWER(:branch)) AND LOWER(p.rmName) IN :rmNames")
        long countByBranchAndRmNamesIgnoreCase(@Param("branch") String branch, @Param("rmNames") List<String> rmNames);

        @Query("SELECT COUNT(p) FROM Policy p WHERE LOWER(p.rmName) IN :rmNames")
        long countByRmNamesIgnoreCase(@Param("rmNames") List<String> rmNames);

        @org.springframework.data.jpa.repository.Modifying
        @Query(value = "UPDATE policies p " +
                "SET p.last_expiry_date = COALESCE(p.last_expiry_date, p.expiry_date), " +
                "p.policy_start_date = DATE_ADD(p.expiry_date, INTERVAL 1 DAY), " +
                "p.expiry_date = DATE_ADD(p.expiry_date, INTERVAL 1 YEAR), " +
                "p.policy_end_date = DATE_ADD(p.expiry_date, INTERVAL 1 YEAR), " +
                "p.policy_issue_date = CURRENT_DATE, " +
                "p.status = 'ACTIVE' " +
                "WHERE p.status = 'PENDING_ISSUANCE' AND LOWER(p.type) = 'life insurance'", nativeQuery = true)
        int bulkAutoIssueLifeInsurancePolicies();
    @org.springframework.data.jpa.repository.Modifying
    @org.springframework.data.jpa.repository.Query(value = "UPDATE policies " +
            "SET status = 'EXPIRED' " +
            "WHERE expiry_date < CURRENT_DATE AND status = 'ACTIVE'", nativeQuery = true)
    int bulkUpdateExpiredPoliciesStatus();
}
