package com.insurance.renewal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Map;

import com.insurance.renewal.service.PolicyProgressService;

@RestController
@RequestMapping("/api/progress")
@CrossOrigin(origins = "*")
public class PolicyProgressController {

    @Autowired
    private PolicyProgressService policyProgressService;

    @GetMapping("/tracking")
    public ResponseEntity<List<Map<String, Object>>> getProgressTracking(
            @RequestParam(value = "tab", defaultValue = "RETAIL") String tab,
            @RequestParam(value = "branch", required = false) String branch) {
        
        List<Map<String, Object>> progressData = policyProgressService.getProgressData(tab, branch);
        return ResponseEntity.ok(progressData);
    }
}
