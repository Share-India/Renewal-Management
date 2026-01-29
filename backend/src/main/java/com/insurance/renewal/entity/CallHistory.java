package com.insurance.renewal.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "call_history")
public class CallHistory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "policy_id", nullable = false)
    @com.fasterxml.jackson.annotation.JsonIgnoreProperties("callHistory")
    private Policy policy;

    @Column(name = "call_date", nullable = false)
    private LocalDateTime callDate;

    @Column(name = "call_outcome")
    private String callOutcome; // "Interested", "Not Interested", "Call Back Later", "No Response", etc.

    @Column(columnDefinition = "TEXT")
    private String notes;

    @Column(name = "follow_up_date")
    private LocalDateTime followUpDate;

    @Column(name = "agent_name")
    private String agentName;

    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        if (callDate == null) {
            callDate = LocalDateTime.now();
        }
    }
}
