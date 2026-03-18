package com.insurance.renewal.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    private String username;

    @Column(nullable = false)
    private String password;

    @Column(nullable = false)
    private String role; // ADMIN, RENEWER

    @Column(nullable = false)
    private boolean active = true; // Default to active

    @Column(name = "assigned_branch")
    private String assignedBranch;

    @Column(name = "assigned_product_type")
    private String assignedProductType;

    @Column(name = "assigned_premium_range")
    private String assignedPremiumRange;
}
