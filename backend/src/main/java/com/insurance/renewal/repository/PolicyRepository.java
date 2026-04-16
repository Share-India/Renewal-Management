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
        List<Policy> findByExpiryDate(LocalDate expiryDate);
        @Query("SELECT COUNT(p) FROM Policy p WHERE p.expiryDate = :expiryDate AND (:branch IS NULL OR :branch = '' OR p.branch = :branch)")
        long countByExpiryDate(@Param("expiryDate") LocalDate expiryDate, @Param("branch") String branch);

        @Query("SELECT p FROM Policy p LEFT JOIN FETCH p.reminder r WHERE p.expiryDate = :expiryDate AND p.status != 'PENDING_ISSUANCE' AND r.followUpDate IS NULL")
        List<Policy> findPoliciesForTimeline(@Param("expiryDate") LocalDate expiryDate);

        @Query("SELECT p FROM Policy p LEFT JOIN FETCH p.reminder r JOIN FETCH p.customer c WHERE p.expiryDate = :expiryDate AND p.status != 'PENDING_ISSUANCE' AND r.followUpDate IS NULL AND (:branch IS NULL OR :branch = '' OR p.branch = :branch)")
        List<Policy> findAdminPoliciesForTimeline(@Param("expiryDate") LocalDate expiryDate, @Param("branch") String branch);

        @Query("SELECT p FROM Policy p LEFT JOIN FETCH p.reminder r JOIN FETCH p.customer c WHERE p.expiryDate IN :targetDates AND p.status != 'PENDING_ISSUANCE' AND r.followUpDate IS NULL AND (:branch IS NULL OR :branch = '' OR p.branch = :branch)")
        List<Policy> findPoliciesForTodaysWork(@Param("targetDates") List<LocalDate> targetDates, @Param("branch") String branch);

        List<Policy> findByExpiryDateBetween(LocalDate startDate, LocalDate endDate);

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

        @Query("SELECT p FROM Policy p WHERE p.id NOT IN (SELECT r.policy.id FROM Reminder r)")
        List<Policy> findPoliciesWithoutReminders();

        @Query("SELECT DISTINCT p.branch FROM Policy p WHERE p.branch IS NOT NULL")
        List<String> findDistinctBranches();

        long countByBranchIgnoreCase(String branch);
}
