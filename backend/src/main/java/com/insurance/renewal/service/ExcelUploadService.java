package com.insurance.renewal.service;

import com.insurance.renewal.entity.Customer;
import com.insurance.renewal.entity.Policy;
import com.insurance.renewal.repository.CustomerRepository;
import com.insurance.renewal.repository.PolicyRepository;
import org.apache.poi.ss.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ExcelUploadService {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private PolicyRepository policyRepository;

    @Transactional
    public void processAndAssignExcel(MultipartFile file, String renewerUsername, String branch) throws Exception {
        try (InputStream is = file.getInputStream(); Workbook workbook = WorkbookFactory.create(is)) {
            Sheet sheet = workbook.getSheetAt(0);
            
            // Search for the header row dynamically (first row containing "Policy No")
            Row headerRow = null;
            java.util.Map<String, Integer> headerMap = new java.util.HashMap<>();
            int dataStartRow = 1;
            
            for (int i = 0; i < Math.min(10, sheet.getLastRowNum() + 1); i++) {
                Row r = sheet.getRow(i);
                if (r == null) continue;
                
                for (Cell cell : r) {
                    if (cell != null && cell.getCellType() == CellType.STRING) {
                        String val = cell.getStringCellValue().trim();
                        if (val.equalsIgnoreCase("Policy No") || val.equalsIgnoreCase("Policy Number")) {
                            headerRow = r;
                            dataStartRow = i + 1;
                            break;
                        }
                    }
                }
                if (headerRow != null) break;
            }
            
            if (headerRow == null) {
                throw new IllegalArgumentException("Could not find header row containing 'Policy No' or 'Policy Number'");
            }
            
            for (Cell cell : headerRow) {
                if (cell != null && cell.getCellType() == CellType.STRING) {
                    headerMap.put(cell.getStringCellValue().trim().toLowerCase(), cell.getColumnIndex());
                }
            }

            java.util.Map<String, Policy> policiesToSaveMap = new java.util.HashMap<>();
            java.util.List<Policy> policiesToSave = new java.util.ArrayList<>();
            
            for (int i = headerRow.getRowNum() + 1; i <= sheet.getLastRowNum(); i++) {
                Row row = sheet.getRow(i);
                if (row == null) continue;

                String policyNo = getCellValue(row, headerMap, "policy no");
                if (policyNo == null) policyNo = getCellValue(row, headerMap, "policy number");
                if (policyNo == null || policyNo.isEmpty()) continue;
                
                policyNo = policyNo.trim();

                // Check if policy exists in map first, then db
                Policy policy = policiesToSaveMap.get(policyNo);
                if (policy == null) {
                    policy = policyRepository.findByPolicyNumber(policyNo).orElse(new Policy());
                }
                policy.setPolicyNumber(policyNo);

                // Find or create customer
                String customerName = getCellValue(row, headerMap, "customer name");
                String contactNo = getCellValue(row, headerMap, "contact no");
                if (contactNo == null) contactNo = getCellValue(row, headerMap, "phone");
                
                String email = getCellValue(row, headerMap, "email id");
                if (email == null) email = getCellValue(row, headerMap, "email");
                
                Customer customer = null;
                
                // 1. Try to find by email first (since it has a unique constraint)
                if (email != null && !email.trim().isEmpty() && !email.trim().equals("-")) {
                    java.util.Optional<Customer> opt = customerRepository.findByEmail(email.trim());
                    if (opt.isPresent()) {
                        customer = opt.get();
                    }
                }
                
                // 2. Try to find by phone if not found by email
                if (customer == null && contactNo != null && !contactNo.trim().isEmpty()) {
                    List<Customer> customers = customerRepository.findByPhone(contactNo.trim());
                    if (!customers.isEmpty()) customer = customers.get(0);
                }
                
                // 3. Create new if still not found
                if (customer == null) {
                    customer = new Customer();
                }
                
                // Update phone if provided
                if (contactNo != null && !contactNo.trim().isEmpty()) {
                    customer.setPhone(contactNo.trim());
                }
                
                if (customerName != null && !customerName.trim().isEmpty() && !customerName.trim().equals("-")) {
                    String[] names = customerName.trim().split(" ", 2);
                    customer.setFirstName(names[0]);
                    if (names.length > 1) customer.setLastName(names[1]);
                }
                
                if (customer.getFirstName() == null || customer.getFirstName().isEmpty()) {
                    customer.setFirstName("Unknown");
                }
                if (customer.getLastName() == null || customer.getLastName().isEmpty()) {
                    customer.setLastName("User");
                }
                
                if (email == null || email.trim().isEmpty() || email.trim().equals("-")) {
                    if (customer.getEmail() == null || customer.getEmail().isEmpty()) {
                        customer.setEmail("dummy_" + java.util.UUID.randomUUID().toString().substring(0, 8) + "@example.com");
                    }
                } else {
                    customer.setEmail(email.trim());
                }
                
                customer.setDob(getDateValue(row, headerMap, "dob"));
                customer.setAddress(getCellValue(row, headerMap, "address 1"));
                if (customer.getAddress() == null) customer.setAddress(getCellValue(row, headerMap, "address"));
                
                customer.setCity(getCellValue(row, headerMap, "city"));
                customer.setState(getCellValue(row, headerMap, "state"));
                customer.setBillingFrequency(getCellValue(row, headerMap, "billing frequency"));

                customer = customerRepository.save(customer);
                policy.setCustomer(customer);

                // Set policy fields
                policy.setType(getCellValue(row, headerMap, "insurance type"));
                policy.setInsuranceName(getCellValue(row, headerMap, "insurer name"));
                policy.setProductName(getCellValue(row, headerMap, "product name"));
                policy.setRmName(getCellValue(row, headerMap, "rm name"));
                policy.setRmEmail(getCellValue(row, headerMap, "rm email"));
                String assocName = getCellValue(row, headerMap, "associate name");
                if (assocName == null) assocName = getCellValue(row, headerMap, "associate");
                policy.setAssociateName(assocName);
                policy.setAssociateCode(getCellValue(row, headerMap, "associate code"));
                policy.setVehicleRegNo(getCellValue(row, headerMap, "car/regno"));
                policy.setVehicleModel(getCellValue(row, headerMap, "model name"));
                
                try {
                    String premium = getCellValue(row, headerMap, "premium");
                    if (premium != null && !premium.trim().isEmpty() && !premium.trim().equals("-")) {
                        policy.setDuePremium(new java.math.BigDecimal(premium.trim()));
                    }
                } catch (Exception e) {}
                
                try {
                    String amt = getCellValue(row, headerMap, "amout");
                    if (amt == null) amt = getCellValue(row, headerMap, "amount");
                    if (amt == null) amt = getCellValue(row, headerMap, "premium");
                    if (amt != null && !amt.trim().isEmpty() && !amt.trim().equals("-")) {
                        policy.setAmount(new java.math.BigDecimal(amt.trim()));
                    } else {
                        policy.setAmount(java.math.BigDecimal.ZERO);
                    }
                } catch (Exception e) {
                    policy.setAmount(java.math.BigDecimal.ZERO);
                }

                policy.setPolicyStartDate(getDateValue(row, headerMap, "policy start date"));
                LocalDate endDate = getDateValue(row, headerMap, "policy end date");
                if (endDate == null) endDate = getDateValue(row, headerMap, "renewal end date");
                policy.setPolicyEndDate(endDate);
                
                LocalDate expiry = getDateValue(row, headerMap, "renewal due date");
                if (expiry == null) expiry = getDateValue(row, headerMap, "expiry date");
                if (expiry == null) expiry = LocalDate.now();
                policy.setExpiryDate(expiry);
                
                if (policy.getType() == null || policy.getType().isEmpty()) {
                    policy.setType("General");
                }
                
                policy.setPaymentDate(getDateValue(row, headerMap, "payment date"));

                // Assign to user and branch
                policy.setTargetTeam("RENEWER");
                policy.setCurrentAssignee(renewerUsername);
                policy.setBranch(branch);
                policy.setStatus("ACTIVE");
                
                policiesToSaveMap.put(policyNo, policy);
            }

            if (policiesToSaveMap.isEmpty()) {
                throw new IllegalArgumentException("No valid policies found in the Excel file. Please ensure 'Policy No' column is filled.");
            }

            policyRepository.saveAll(policiesToSaveMap.values());
        }
    }

    private String getCellValue(Row row, java.util.Map<String, Integer> headerMap, String colName) {
        Integer colIdx = headerMap.get(colName.toLowerCase());
        if (colIdx == null) return null;
        Cell cell = row.getCell(colIdx);
        if (cell == null) return null;
        
        if (cell.getCellType() == CellType.STRING) {
            return cell.getStringCellValue().trim();
        } else if (cell.getCellType() == CellType.NUMERIC) {
            if (DateUtil.isCellDateFormatted(cell)) {
                return cell.getDateCellValue().toString();
            }
            double val = cell.getNumericCellValue();
            if (val == Math.floor(val)) return String.valueOf((long) val);
            return String.valueOf(val);
        }
        return null;
    }

    private LocalDate getDateValue(Row row, java.util.Map<String, Integer> headerMap, String colName) {
        Integer colIdx = headerMap.get(colName.toLowerCase());
        if (colIdx == null) return null;
        Cell cell = row.getCell(colIdx);
        if (cell == null) return null;
        if (cell.getCellType() == CellType.NUMERIC && DateUtil.isCellDateFormatted(cell)) {
            return cell.getDateCellValue().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        } else if (cell.getCellType() == CellType.STRING) {
            try {
                return LocalDate.parse(cell.getStringCellValue());
            } catch (Exception e) { return null; }
        }
        return null;
    }
}
