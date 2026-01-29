package com.insurance.renewal.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "policies")
public class Policy {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "policy_number", nullable = false, unique = true)
    private String policyNumber;

    @ManyToOne(fetch = FetchType.EAGER, cascade = { CascadeType.PERSIST, CascadeType.MERGE })
    @JoinColumn(name = "customer_id", nullable = false)
    private Customer customer;

    @Column(nullable = false)
    private String type;

    @Column(nullable = false)
    private BigDecimal amount;

    @Column(name = "expiry_date", nullable = false)
    private LocalDate expiryDate;

    @Column(nullable = false)
    private String status; // ACTIVE, EXPIRED, RENEWED

    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "insurance_name")
    private String insuranceName;

    @Column(name = "policy_start_date")
    private LocalDate policyStartDate;

    @Column(name = "policy_end_date")
    private LocalDate policyEndDate;

    @Column(name = "product_name")
    private String productName;

    @Column(name = "due_premium")
    private BigDecimal duePremium;

    @Column(name = "rm_name")
    private String rmName;

    @Column(name = "associate_name")
    private String associateName;

    @Column(name = "associate_code")
    private String associateCode;

    @Column(name = "vehicle_reg_no")
    private String vehicleRegNo;

    @Column(name = "vehicle_model")
    private String vehicleModel;

    @OneToOne(mappedBy = "policy", cascade = CascadeType.ALL)
    @com.fasterxml.jackson.annotation.JsonProperty(access = com.fasterxml.jackson.annotation.JsonProperty.Access.READ_ONLY)
    private Reminder reminder;

    @Column(name = "is_late_renewal")
    private Boolean lateRenewal = false;

    @Column(name = "late_renewal_gap")
    private Integer lateRenewalGap;

    @Column(name = "late_renewal_reason", columnDefinition = "TEXT")
    private String lateRenewalReason;

    // Payment Details
    @Column(name = "payment_mode")
    private String paymentMode; // CHEQUE, NEFT, UPI

    @Column(name = "payment_reference")
    private String paymentReference; // Cheque No, UTR, Txn ID

    @Column(name = "payment_date")
    private LocalDate paymentDate;

    @Column(name = "payment_amount")
    private BigDecimal paymentAmount;

    @Column(name = "payment_bank")
    private String paymentBank; // Bank Name (for Cheque)

    // Servicing Details
    @Column(name = "policy_issue_date")
    private LocalDate policyIssueDate;

    @Column(name = "net_premium")
    private BigDecimal netPremium;

    @Column(name = "sum_insured")
    private BigDecimal sumInsured;

    @Column(name = "previous_policy_number")
    private String previousPolicyNumber;

    @Column(name = "last_expiry_date")
    private LocalDate lastExpiryDate; // Stores the expiry date at the time of renewal

    @Column(name = "policy_document_path")
    private String policyDocumentPath;

    @Column(name = "payment_document_path")
    private String paymentDocumentPath;

    // MIS Enrichment Fields
    @Column(name = "business_type")
    private String businessType; // Fresh, Renewal, Portability

    @Column(name = "login_status")
    private String loginStatus; // Issued, Logged, Cancelled

    @Column(name = "branch")
    private String branch;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }
}
