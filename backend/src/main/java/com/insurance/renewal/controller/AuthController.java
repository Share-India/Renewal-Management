package com.insurance.renewal.controller;

import com.insurance.renewal.entity.User;
import com.insurance.renewal.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = { "http://localhost:4200", "http://localhost", "https://renewal.shareindiainsurance.com" })
public class AuthController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/auth/login")
    public ResponseEntity<Map<String, String>> login() {
        // If we reach here, Basic Auth has already succeeded
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String role = auth.getAuthorities().iterator().next().getAuthority().replace("ROLE_", "");

        Map<String, String> response = new HashMap<>();
        response.put("username", auth.getName());
        response.put("role", role);

        userRepository.findByUsername(auth.getName()).ifPresent(user -> {
            if (user.getAssignedBranch() != null) response.put("assignedBranch", user.getAssignedBranch());
            if (user.getAssignedProductType() != null) response.put("assignedProductType", user.getAssignedProductType());
            if (user.getAssignedPremiumRange() != null) response.put("assignedPremiumRange", user.getAssignedPremiumRange());
        });

        return ResponseEntity.ok(response);
    }

    @PostMapping("/admin/users")
    public ResponseEntity<User> createUser(@RequestBody Map<String, String> payload) {
        String username = payload.get("username");
        String password = payload.get("password");
        String role = payload.get("role"); // ADMIN or RENEWER

        if (userRepository.findByUsername(username).isPresent()) {
            throw new RuntimeException("Username already exists");
        }

        User user = new User();
        user.setUsername(username);
        user.setPassword(passwordEncoder.encode(password));
        user.setRole(role.startsWith("ROLE_") ? role : "ROLE_" + role);

        if (role.contains("RENEWER")) {
            user.setAssignedBranch(payload.get("assignedBranch"));
            user.setAssignedProductType(payload.get("assignedProductType"));
            user.setAssignedPremiumRange(payload.get("assignedPremiumRange"));
        }

        return ResponseEntity.ok(userRepository.save(user));
    }

    @GetMapping("/admin/users")
    public java.util.List<User> getUsers() {
        java.util.List<User> users = userRepository.findAll();
        System.out.println("DEBUG: Found " + users.size() + " users.");
        users.forEach(u -> System.out.println("DEBUG: User - " + u.getUsername() + ", Active: " + u.isActive()));
        return users;
    }

    @DeleteMapping("/admin/users/{id}")
    public ResponseEntity<User> deleteUser(@PathVariable("id") Long id) {
        // Soft delete: Toggle active status
        return userRepository.findById(id).map(user -> {
            user.setActive(!user.isActive());
            return ResponseEntity.ok(userRepository.save(user));
        }).orElse(ResponseEntity.notFound().build());
    }

    @PostMapping("/auth/change-password")
    public ResponseEntity<String> changePassword(@RequestBody Map<String, String> payload) {
        String oldPassword = payload.get("oldPassword");
        String newPassword = payload.get("newPassword");

        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("User not found"));

        // Since we are using NoOpPasswordEncoder (as configured in SecurityConfig), we
        // check plain text
        // or whatever encoder is actually active. Code says NoOpPasswordEncoder.
        if (!user.getPassword().equals(oldPassword)) {
            return ResponseEntity.badRequest().body("Incorrect old password");
        }

        user.setPassword(newPassword); // NoOp encoder implies plain text save
        userRepository.save(user);

        return ResponseEntity.ok("Password changed successfully");
    }
}
