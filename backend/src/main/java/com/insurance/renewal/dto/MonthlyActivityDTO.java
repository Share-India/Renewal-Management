package com.insurance.renewal.dto;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class MonthlyActivityDTO {
    private String policyNo;
    private String customerName;
    private String customerNumber;
    private String customerEmail;
    private String customerDob;
    private String customerAddress;
    private String customerCity;
    private String expiryDate;
    private Double premium;
    private String branch;
    private String activityDate;
    private String activityType;
    private String agent;
    private String details;
    private LocalDateTime rawDate;
}
