package com.insurance.renewal;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.boot.CommandLineRunner;
import org.springframework.jdbc.core.JdbcTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.boot.autoconfigure.r2dbc.R2dbcAutoConfiguration;

@SpringBootApplication(exclude = { R2dbcAutoConfiguration.class })
@org.springframework.scheduling.annotation.EnableScheduling
public class InsuranceRenewalApplication {



	public static void main(String[] args) {
		SpringApplication.run(InsuranceRenewalApplication.class, args);
	}

	@Bean
	public CommandLineRunner fixDatabaseSchema(JdbcTemplate jdbcTemplate) {
		return args -> {
			Logger logger = LoggerFactory.getLogger(InsuranceRenewalApplication.class);
			try {
				logger.info("Checking and updating database schema for assigned_rm column...");
				jdbcTemplate.execute("ALTER TABLE users MODIFY COLUMN assigned_rm TEXT");
				logger.info("Successfully updated assigned_rm column to TEXT.");
			} catch (Exception e) {
				logger.warn("Could not alter assigned_rm column (it may already be TEXT or table may not exist yet): {}", e.getMessage());
			}
		};
	}
}

