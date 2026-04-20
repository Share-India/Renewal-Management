package com.insurance.renewal.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "reminders")
public class Reminder {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "policy_id", nullable = false, unique = true)
    @com.fasterxml.jackson.annotation.JsonIgnoreProperties("reminder")
    private Policy policy;

    @Column(name = "last_reminder_sent_at")
    private LocalDateTime lastReminderSentAt;

    @Column(name = "reminder_status")
    private String reminderStatus; // PENDING, SENT, ACKNOWLEDGED

    @Column(name = "follow_up_required")
    private boolean followUpRequired;

    @Column(name = "follow_up_date")
    private LocalDateTime followUpDate;

    @Column(columnDefinition = "TEXT")
    private String notes;

    @Column(name = "last_call_outcome")
    private String lastCallOutcome; // e.g., "Interested", "Not Interested", "Call Back Later"

    @Column(name = "last_updated_by")
    private String lastUpdatedBy;

    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }
}
