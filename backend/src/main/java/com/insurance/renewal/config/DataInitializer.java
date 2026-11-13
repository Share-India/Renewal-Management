package com.insurance.renewal.config;

import com.insurance.renewal.entity.User;
import com.insurance.renewal.repository.UserRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class DataInitializer {

    @Bean
    public CommandLineRunner initDefaultAdmin(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        return args -> {
            // Only create default Admin 'ShareIndia' if it does not already exist
            if (userRepository.findByUsername("ShareIndia").isEmpty()) {
                User admin = new User();
                admin.setUsername("ShareIndia");
                admin.setPassword(passwordEncoder.encode("ShareIndia@123"));
                admin.setRole("ROLE_ADMIN");
                admin.setActive(true);
                userRepository.save(admin);
                System.out.println("Default Admin 'ShareIndia' created.");
            }
        };
    }
}
