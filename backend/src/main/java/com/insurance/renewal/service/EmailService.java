package com.insurance.renewal.service;

import com.insurance.renewal.entity.Policy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.time.format.DateTimeFormatter;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    @Value("${spring.mail.username}")
    private String fromEmail;

    public void sendCustomerRenewalEmail(Policy policy, String agentName) {
        if (policy.getCustomer() == null || policy.getCustomer().getEmail() == null || policy.getCustomer().getEmail().isEmpty()) {
            throw new RuntimeException("Customer email address is missing.");
        }

        String customerName = policy.getCustomer().getFirstName() + " " + policy.getCustomer().getLastName();
        String policyType = policy.getType() != null ? policy.getType() : "Insurance";
        String policyEndDate = policy.getExpiryDate() != null ? policy.getExpiryDate().format(DateTimeFormatter.ofPattern("dd-MM-yyyy")) : "N/A";
        String policyNumber = policy.getPolicyNumber() != null ? policy.getPolicyNumber() : "N/A";
        String productName = policy.getProductName() != null ? policy.getProductName() : "N/A";
        
        String[] ccArray = {
            "pranav.mandal@shareindia.co.in",
            "amar.sawant@shareindia.co.in",
            "shubham.shejul@shareindia.co.in"
        };

        String subject = "Intimation for " + policyType + " Policy Renewal Due on " + policyEndDate;
        
        String body = "Dear " + customerName + ",\n\n" +
                "Greetings from Share India Insurance Brokers Pvt. Ltd.\n\n" +
                "This is " + agentName + " from the Renewal Department.\n\n" +
                "We would like to inform you that your " + policyType + " Policy is due for renewal on " + policyEndDate + ". " +
                "To ensure continuity of coverage and uninterrupted policy benefits, we request you to kindly review the policy details mentioned below and plan the renewal accordingly.\n\n" +
                "Policy Details:\n\n" +
                "• Policy No.: " + policyNumber + "\n" +
                "• Insurance Type: " + policyType + "\n" +
                "• Product: " + productName + "\n" +
                "• Renewal Due Date: " + policyEndDate + "\n\n" +
                "In case you require any assistance regarding the renewal process, premium details, or policy benefits, please feel free to contact us. We will be glad to assist you.\n\n" +
                "Thank you for choosing Share India Insurance Brokers Pvt. Ltd. We look forward to serving you.\n\n" +
                "Warm Regards,\n\n" +
                agentName + "\n" +
                "Renewal Department\n" +
                "Share India Insurance Brokers Pvt. Ltd.";

        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(fromEmail);
        message.setTo(policy.getCustomer().getEmail().toLowerCase());
        message.setCc(ccArray);
        message.setSubject(subject);
        message.setText(body);

        mailSender.send(message);
    }

    public void sendRmEmail(Policy policy, String agentName) {
        if (policy.getRmEmail() == null || policy.getRmEmail().trim().isEmpty()) {
            throw new RuntimeException("RM email address is missing or not configured for this policy.");
        }

        String customerName = policy.getCustomer() != null ? policy.getCustomer().getFirstName() + " " + policy.getCustomer().getLastName() : "Customer";
        String policyType = policy.getType() != null ? policy.getType() : "Insurance";
        String policyEndDate = policy.getExpiryDate() != null ? policy.getExpiryDate().format(DateTimeFormatter.ofPattern("dd-MM-yyyy")) : "N/A";
        String premium = policy.getDuePremium() != null ? policy.getDuePremium().toString() : "N/A";
        String associateName = policy.getAssociateName() != null ? policy.getAssociateName() : "N/A";
        String rmName = policy.getRmName() != null ? policy.getRmName() : "RM";

        String subject = "Insurance Policy Renewal – " + customerName + " – " + policyEndDate;
        
        String body = "Dear Sir/Madam,\n" +
                rmName + "\n\n" +
                "This is to bring to your notice that the below-mentioned insurance policy is due for renewal " + policyEndDate + ".\n\n" +
                "We request you to review the policy details and confirm if any changes or amendments are required at the time of renewal. This will enable us to complete the renewal process without any delay or lapse in coverage.\n\n" +
                "Policy Details:\n" +
                "• Insured Name: " + customerName + "\n" +
                "• Type of Policy: " + policyType + "\n" +
                "• Renewal Date: " + policyEndDate + "\n" +
                "• Premium: " + premium + "\n" +
                "• Associate Name: " + associateName + "\n\n" +
                "We look forward to your prompt response and confirmation regarding the renewal, along with details of any changes required.\n\n" +
                "Regards,\n" +
                agentName + "\n" +
                "Renewal Department\n" +
                "Share India Insurance Brokers Pvt Ltd";

        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(fromEmail);
        message.setTo(policy.getRmEmail().toLowerCase().trim());
        message.setSubject(subject);
        message.setText(body);

        mailSender.send(message);
    }
}
