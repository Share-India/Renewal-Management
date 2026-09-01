package com.insurance.renewal.controller;

import com.insurance.renewal.entity.Policy;
import com.insurance.renewal.repository.PolicyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.*;
import java.util.stream.Collectors;

@CrossOrigin
@RestController
@RequestMapping("/api/admin/insights")
public class BusinessInsightsController {

    @Autowired
    private PolicyRepository policyRepository;

    @GetMapping
    public BusinessInsightsResponseDTO getInsights(@RequestParam int year, @RequestParam int month, @RequestParam(required = false) String branch, @RequestParam(required = false) String team) {
        
        List<Policy> policies;
        
        if (team != null && !team.trim().isEmpty() && !team.equalsIgnoreCase("All Teams")) {
            String dbTeam = team.trim();
            if (dbTeam.equalsIgnoreCase("Claims Team")) dbTeam = "CLAIMS";
            else if (dbTeam.equalsIgnoreCase("Sales Team")) dbTeam = "SALES";
            else if (dbTeam.equalsIgnoreCase("Underwriting Team")) dbTeam = "UNDERWRITING";
            
            policies = policyRepository.findByTargetTeamIgnoreCase(dbTeam);
        } else {
            LocalDate startDate = LocalDate.of(year, month, 1);
            LocalDate endDate = startDate.plusMonths(1).minusDays(1);
            policies = policyRepository.findByExpiryDateBetween(startDate, endDate);
        }
        
        Map<String, CustomerInsightDTO> customerMap = new HashMap<>();
        Map<String, ProductInsightDTO> productMap = new HashMap<>();
        
        LocalDate today = LocalDate.now();
        
        for (Policy p : policies) {
            if (p.getCustomer() == null) continue;
            
            // Branch filtering
            if (branch != null && !branch.trim().isEmpty() && !branch.equalsIgnoreCase("All Branches") && !branch.equalsIgnoreCase("All Branches Globally")) {
                if (p.getBranch() == null || !p.getBranch().equalsIgnoreCase(branch.trim())) {
                    continue;
                }
            }
            
            // Team filtering is now handled by the repository query above.
            
            // Customer Aggregation
            String custName = p.getCustomer().getFirstName() + (p.getCustomer().getLastName() != null && !p.getCustomer().getLastName().isEmpty() ? " " + p.getCustomer().getLastName() : "");
            custName = custName.trim();
            if (custName.isEmpty()) custName = "Unknown Customer";
            
            CustomerInsightDTO custInsight = customerMap.getOrDefault(custName, new CustomerInsightDTO(custName));
            custInsight.totalPolicies++;
            
            if (p.getAmount() != null) custInsight.amount += p.getAmount().doubleValue();
            if (p.getDuePremium() != null) custInsight.premium += p.getDuePremium().doubleValue();
            
            // Due Status calculation
            long daysBetween = ChronoUnit.DAYS.between(today, p.getExpiryDate());
            String status;
            if (daysBetween == 0) status = "Today";
            else if (daysBetween > 0) status = daysBetween + " Days";
            else status = daysBetween + " Days"; // negative days
            
            if (!custInsight.policyDueStatuses.contains(status)) {
                custInsight.policyDueStatuses.add(status);
            }
            
            customerMap.put(custName, custInsight);
            
            // Product Aggregation
            String product = p.getType();
            if (product == null || product.isEmpty()) product = "Unspecified";
            
            ProductInsightDTO prodInsight = productMap.getOrDefault(product, new ProductInsightDTO(product));
            prodInsight.totalPolicies++;
            if (p.getDuePremium() != null) prodInsight.premium += p.getDuePremium().doubleValue();
            
            productMap.put(product, prodInsight);
        }
        
        BusinessInsightsResponseDTO response = new BusinessInsightsResponseDTO();
        response.customerInsights = new ArrayList<>(customerMap.values());
        // Sort by premium descending for impact
        response.customerInsights.sort((a, b) -> Double.compare(b.premium, a.premium));
        
        response.productInsights = new ArrayList<>(productMap.values());
        response.productInsights.sort((a, b) -> Double.compare(b.premium, a.premium));
        
        return response;
    }

    public static class BusinessInsightsResponseDTO {
        public List<CustomerInsightDTO> customerInsights;
        public List<ProductInsightDTO> productInsights;
    }

    public static class CustomerInsightDTO {
        public String customerName;
        public int totalPolicies = 0;
        public List<String> policyDueStatuses = new ArrayList<>();
        public double premium = 0.0;
        public double amount = 0.0;
        
        public CustomerInsightDTO(String customerName) {
            this.customerName = customerName;
        }
    }

    public static class ProductInsightDTO {
        public String productName;
        public int totalPolicies = 0;
        public double premium = 0.0;
        
        public ProductInsightDTO(String productName) {
            this.productName = productName;
        }
    }
}
