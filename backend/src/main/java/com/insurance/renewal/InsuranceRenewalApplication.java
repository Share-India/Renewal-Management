package com.insurance.renewal;

import com.insurance.renewal.repository.UserRepository;
import com.insurance.renewal.repository.PolicyRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.password.PasswordEncoder;

import org.springframework.boot.autoconfigure.r2dbc.R2dbcAutoConfiguration;

@SpringBootApplication(exclude = { R2dbcAutoConfiguration.class })
@org.springframework.scheduling.annotation.EnableScheduling
public class InsuranceRenewalApplication {

	public static void main(String[] args) {
		SpringApplication.run(InsuranceRenewalApplication.class, args);
	}

	// @Bean
	// public CommandLineRunner demo(UserRepository userRepository, PasswordEncoder
	// passwordEncoder,
	// PolicyRepository policyRepository) {
	// return (args) -> {
	// System.out.println("------------------------------------------------");
	// System.out.println("DEBUG: Total Policies in DB: " +
	// policyRepository.count());
	// };
	// }
}
