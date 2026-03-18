package com.insurance.renewal.controller;

import com.insurance.renewal.entity.Branch;
import com.insurance.renewal.repository.BranchRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.access.prepost.PreAuthorize;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/renewals/branches")
@CrossOrigin(origins = "*") // Adapt based on exact security requirements
public class BranchController {

    @Autowired
    private BranchRepository branchRepository;

    @GetMapping
    public ResponseEntity<List<String>> getAllBranches() {
        // Return only the branch names for the dropdowns
        List<String> branches = branchRepository.findAll()
                .stream()
                .map(Branch::getName)
                .collect(Collectors.toList());
        return ResponseEntity.ok(branches);
    }

    @PostMapping
    @PreAuthorize("hasAuthority('ADMIN') or hasRole('ADMIN')")
    public ResponseEntity<?> createBranch(@RequestBody Branch branch) {
        if (branch.getName() == null || branch.getName().trim().isEmpty()) {
            return ResponseEntity.badRequest().body("Branch name cannot be empty");
        }
        
        String branchName = branch.getName().trim();
        
        if (branchRepository.findByName(branchName).isPresent()) {
            return ResponseEntity.badRequest().body("Branch already exists");
        }
        
        branch.setName(branchName);
        Branch saved = branchRepository.save(branch);
        
        return ResponseEntity.ok(saved);
    }
}
