package com.insurance.renewal.config;

import com.insurance.renewal.entity.User;
import com.insurance.renewal.repository.UserRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.password.PasswordEncoder;

@Component
public class DataInitializer {

    @Bean
    public CommandLineRunner resetPasswords(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        return args -> {
            System.out.println("EXECUTING ADMIN INITIALIZATION...");

            // Ensure Single Admin: ShareIndia
            userRepository.findByUsername("ShareIndia").ifPresentOrElse(user -> {
                // Determine if password needs update? For now, force it to match requirement
                user.setPassword(passwordEncoder.encode("ShareIndia@123"));
                user.setRole("ROLE_ADMIN");
                user.setActive(true);
                userRepository.save(user);
                System.out.println("Admin 'ShareIndia' updated.");
            }, () -> {
                User admin = new User();
                admin.setUsername("ShareIndia");
                admin.setPassword(passwordEncoder.encode("ShareIndia@123"));
                admin.setRole("ROLE_ADMIN");
                admin.setActive(true);
                userRepository.save(admin);
                System.out.println("Admin 'ShareIndia' created.");
            });

            System.out.println("Auto-generation of other users has been removed.");

            // FIX: Ensure all existing users are active and have valid roles
            userRepository.findAll().forEach(user -> {
                boolean changed = false;
                if (!user.isActive()) {
                    user.setActive(true);
                    changed = true;
                    System.out.println("Migrated user '" + user.getUsername() + "' to active status.");
                }
                if (user.getRole() != null && !user.getRole().startsWith("ROLE_")) {
                    user.setRole("ROLE_" + user.getRole());
                    changed = true;
                    System.out.println("Migrated user '" + user.getUsername() + "' role to '" + user.getRole() + "'.");
                } else if (user.getRole() == null) {
                    user.setRole("ROLE_RENEWER"); // fallback default role
                    changed = true;
                    System.out.println("Fixed null role for user '" + user.getUsername() + "'.");
                }
                if (changed) {
                    userRepository.save(user);
                }
            });
        };
    }
}
