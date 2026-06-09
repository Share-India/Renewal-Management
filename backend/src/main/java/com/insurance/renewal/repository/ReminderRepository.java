package com.insurance.renewal.repository;

import com.insurance.renewal.entity.Reminder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.time.LocalDate;
import java.util.List;

@Repository
public interface ReminderRepository extends JpaRepository<Reminder, Long> {
    List<Reminder> findByFollowUpDateBetween(java.time.LocalDateTime start, java.time.LocalDateTime end);

    java.util.Optional<Reminder> findByPolicyId(Long policyId);

    @org.springframework.data.jpa.repository.Query("SELECT COUNT(r) FROM Reminder r JOIN r.policy p WHERE FUNCTION('DATE', r.followUpDate) = :date")
    long countByFollowUpDateTarget(@org.springframework.data.repository.query.Param("date") LocalDate date);

    long countByReminderStatus(String reminderStatus);
    long countByReminderStatusIgnoreCase(String reminderStatus);

    @org.springframework.data.jpa.repository.Query("SELECT COUNT(r) FROM Reminder r JOIN r.policy p WHERE LOWER(r.reminderStatus) = LOWER(:status) AND (:branch IS NULL OR :branch = '' OR LOWER(p.branch) = LOWER(:branch))")
    long countByReminderStatusAndBranchIgnoreCase(
        @org.springframework.data.repository.query.Param("status") String status, 
        @org.springframework.data.repository.query.Param("branch") String branch);

    @org.springframework.data.jpa.repository.Query("SELECT r FROM Reminder r JOIN FETCH r.policy p WHERE LOWER(r.reminderStatus) = LOWER(:status) AND (:branch IS NULL OR :branch = '' OR LOWER(p.branch) = LOWER(:branch))")
    List<Reminder> findByReminderStatusAndBranchIgnoreCase(
        @org.springframework.data.repository.query.Param("status") String status, 
        @org.springframework.data.repository.query.Param("branch") String branch);

    List<Reminder> findByReminderStatusIgnoreCase(String reminderStatus);

    @org.springframework.data.jpa.repository.Query("SELECT COUNT(r) FROM Reminder r JOIN r.policy p WHERE LOWER(r.reminderStatus) = LOWER(:status) AND (:branch IS NULL OR :branch = '' OR LOWER(p.branch) = LOWER(:branch)) AND LOWER(p.rmName) IN :rmNames")
    long countByReminderStatusAndBranchAndRmNamesIgnoreCase(
        @org.springframework.data.repository.query.Param("status") String status, 
        @org.springframework.data.repository.query.Param("branch") String branch,
        @org.springframework.data.repository.query.Param("rmNames") List<String> rmNames);

    @org.springframework.data.jpa.repository.Query("SELECT COUNT(r) FROM Reminder r JOIN r.policy p WHERE LOWER(r.reminderStatus) = LOWER(:status) AND LOWER(p.rmName) IN :rmNames")
    long countByReminderStatusAndRmNamesIgnoreCase(
        @org.springframework.data.repository.query.Param("status") String status, 
        @org.springframework.data.repository.query.Param("rmNames") List<String> rmNames);

    List<Reminder> findByLastReminderSentAtBetween(java.time.LocalDateTime start, java.time.LocalDateTime end);

    @org.springframework.data.jpa.repository.Query("SELECT r FROM Reminder r JOIN FETCH r.policy p WHERE r.lastReminderSentAt BETWEEN :start AND :end AND (:branch IS NULL OR :branch = '' OR p.branch = :branch)")
    List<Reminder> findByLastReminderSentAtBetweenWithValidPolicy(
        @org.springframework.data.repository.query.Param("start") java.time.LocalDateTime start, 
        @org.springframework.data.repository.query.Param("end") java.time.LocalDateTime end,
        @org.springframework.data.repository.query.Param("branch") String branch);

    @org.springframework.data.jpa.repository.Query("SELECT r FROM Reminder r JOIN FETCH r.policy p WHERE r.followUpDate BETWEEN :start AND :end AND (:branch IS NULL OR :branch = '' OR p.branch = :branch)")
    List<Reminder> findByFollowUpDateBetweenWithValidPolicy(
        @org.springframework.data.repository.query.Param("start") java.time.LocalDateTime start, 
        @org.springframework.data.repository.query.Param("end") java.time.LocalDateTime end,
        @org.springframework.data.repository.query.Param("branch") String branch);

    @org.springframework.data.jpa.repository.Query("SELECT r FROM Reminder r JOIN FETCH r.policy")
    List<Reminder> findAllWithValidPolicy();

    @org.springframework.data.jpa.repository.Modifying
    @org.springframework.data.jpa.repository.Query(value = "INSERT INTO reminders (policy_id, reminder_status, last_call_outcome, last_updated_by) SELECT p.id, 'PENDING', 'Pending', 'System' FROM policies p LEFT JOIN reminders r ON p.id = r.policy_id WHERE r.id IS NULL", nativeQuery = true)
    int bulkCreateMissingReminders();

    @org.springframework.data.jpa.repository.Query("SELECT r FROM Reminder r JOIN FETCH r.policy p WHERE FUNCTION('DATE', r.followUpDate) IN :targetDates")
    List<Reminder> findByFollowUpDateInWithValidPolicy(@org.springframework.data.repository.query.Param("targetDates") List<LocalDate> targetDates);

    @org.springframework.data.jpa.repository.Query("SELECT r FROM Reminder r JOIN FETCH r.policy p WHERE r.followUpDate < :endOfTargetDate AND (:branch IS NULL OR :branch = '' OR p.branch = :branch)")
    List<Reminder> findPendingFollowUpsUpTo(
        @org.springframework.data.repository.query.Param("endOfTargetDate") java.time.LocalDateTime endOfTargetDate, 
        @org.springframework.data.repository.query.Param("branch") String branch);
    @org.springframework.data.jpa.repository.Query("SELECT r FROM Reminder r JOIN FETCH r.policy p JOIN FETCH p.customer WHERE (:branch IS NULL OR :branch = '' OR p.branch = :branch) ORDER BY r.lastReminderSentAt DESC")
    List<Reminder> findTop500ByOrderByLastReminderSentAtDescWithValidPolicy(
        @org.springframework.data.repository.query.Param("branch") String branch, 
        org.springframework.data.domain.Pageable pageable);

    @org.springframework.data.jpa.repository.Modifying
    @org.springframework.data.jpa.repository.Query(value = "DELETE r1 FROM reminders r1 INNER JOIN reminders r2 WHERE r1.policy_id = r2.policy_id AND r1.id < r2.id", nativeQuery = true)
    void deleteDuplicates();

    @org.springframework.data.jpa.repository.Modifying
    @org.springframework.data.jpa.repository.Query(value = "DELETE r FROM reminders r LEFT JOIN policies p ON r.policy_id = p.id WHERE p.id IS NULL", nativeQuery = true)
    void deleteOrphans();

    @org.springframework.data.jpa.repository.Modifying
    @org.springframework.data.jpa.repository.Query(value = "UPDATE reminders r " +
            "JOIN policies p ON r.policy_id = p.id " +
            "SET r.reminder_status = 'Renewed', r.last_call_outcome = 'Renewed' " +
            "WHERE p.status = 'ACTIVE' AND LOWER(p.type) = 'life insurance' AND p.policy_issue_date = CURRENT_DATE", nativeQuery = true)
    int bulkUpdateAutoIssuedReminders();
}
