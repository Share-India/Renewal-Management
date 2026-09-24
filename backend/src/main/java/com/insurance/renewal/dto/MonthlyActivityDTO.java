package com.insurance.renewal.dto;

import com.insurance.renewal.entity.Policy;
import lombok.Data;
import java.time.LocalDateTime;

@Data
public class MonthlyActivityDTO {
    private Policy policy;
    private String activityDate;
    private String activityType;
    private String agent;
    private String details;
    private String outcome;
    private String notes;
    private LocalDateTime rawDate;
}
