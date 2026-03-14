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

    long countByReminderStatus(String reminderStatus);

    List<Reminder> findByLastReminderSentAtBetween(java.time.LocalDateTime start, java.time.LocalDateTime end);

    @org.springframework.data.jpa.repository.Query("SELECT r FROM Reminder r JOIN FETCH r.policy p WHERE r.lastReminderSentAt BETWEEN :start AND :end")
    List<Reminder> findByLastReminderSentAtBetweenWithValidPolicy(
        @org.springframework.data.repository.query.Param("start") java.time.LocalDateTime start, 
        @org.springframework.data.repository.query.Param("end") java.time.LocalDateTime end);

    @org.springframework.data.jpa.repository.Query("SELECT r FROM Reminder r JOIN FETCH r.policy p WHERE r.followUpDate BETWEEN :start AND :end")
    List<Reminder> findByFollowUpDateBetweenWithValidPolicy(
        @org.springframework.data.repository.query.Param("start") java.time.LocalDateTime start, 
        @org.springframework.data.repository.query.Param("end") java.time.LocalDateTime end);

    @org.springframework.data.jpa.repository.Query("SELECT r FROM Reminder r JOIN FETCH r.policy")
    List<Reminder> findAllWithValidPolicy();

    @org.springframework.data.jpa.repository.Query("SELECT r FROM Reminder r JOIN FETCH r.policy p WHERE FUNCTION('DATE', r.followUpDate) IN :targetDates")
    List<Reminder> findByFollowUpDateInWithValidPolicy(@org.springframework.data.repository.query.Param("targetDates") List<LocalDate> targetDates);

    @org.springframework.data.jpa.repository.Query("SELECT r FROM Reminder r JOIN FETCH r.policy p JOIN FETCH p.customer ORDER BY r.lastReminderSentAt DESC")
    List<Reminder> findTop500ByOrderByLastReminderSentAtDescWithValidPolicy(org.springframework.data.domain.Pageable pageable);

    @org.springframework.data.jpa.repository.Modifying
    @org.springframework.data.jpa.repository.Query(value = "DELETE FROM reminders WHERE id NOT IN (SELECT id FROM (SELECT MAX(id) AS id FROM reminders GROUP BY policy_id) AS keep_ids)", nativeQuery = true)
    void deleteDuplicates();

    @org.springframework.data.jpa.repository.Modifying
    @org.springframework.data.jpa.repository.Query(value = "DELETE FROM reminders WHERE policy_id NOT IN (SELECT id FROM policies)", nativeQuery = true)
    void deleteOrphans();
}
