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

			try {
				logger.info("Checking database schema for customer_code columns and indexes...");
				// 1. Ensure customer_code exists on customers table
				try {
					jdbcTemplate.execute("ALTER TABLE customers ADD COLUMN IF NOT EXISTS customer_code VARCHAR(50)");
				} catch (Exception ex) {
					try {
						Integer count = jdbcTemplate.queryForObject(
							"SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'customers' AND COLUMN_NAME = 'customer_code'",
							Integer.class
						);
						if (count == null || count == 0) {
							jdbcTemplate.execute("ALTER TABLE customers ADD COLUMN customer_code VARCHAR(50)");
						}
					} catch (Exception ignored) {}
				}

				try {
					jdbcTemplate.execute("CREATE INDEX idx_customer_customer_code ON customers(customer_code)");
				} catch (Exception ignored) {}

				// 2. Ensure customer_code exists on policies table
				try {
					jdbcTemplate.execute("ALTER TABLE policies ADD COLUMN IF NOT EXISTS customer_code VARCHAR(50)");
				} catch (Exception ex) {
					try {
						Integer count = jdbcTemplate.queryForObject(
							"SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'policies' AND COLUMN_NAME = 'customer_code'",
							Integer.class
						);
						if (count == null || count == 0) {
							jdbcTemplate.execute("ALTER TABLE policies ADD COLUMN customer_code VARCHAR(50)");
						}
					} catch (Exception ignored) {}
				}

				try {
					jdbcTemplate.execute("CREATE INDEX idx_policy_customer_code ON policies(customer_code)");
				} catch (Exception ignored) {}

				// Convert any previous CUST- format codes to SIIBPL
				try {
					jdbcTemplate.execute("UPDATE customers SET customer_code = REPLACE(customer_code, 'CUST-', 'SIIBPL') WHERE customer_code LIKE 'CUST-%'");
					jdbcTemplate.execute("UPDATE policies SET customer_code = REPLACE(customer_code, 'CUST-', 'SIIBPL') WHERE customer_code LIKE 'CUST-%'");
				} catch (Exception ignored) {}

				// 3. Auto-populate customer_code for existing customers if any are missing or non-SIIBPL
				Integer unassignedCustomers = jdbcTemplate.queryForObject(
					"SELECT COUNT(*) FROM customers WHERE customer_code IS NULL OR customer_code = '' OR customer_code NOT LIKE 'SIIBPL%'",
					Integer.class
				);
				if (unassignedCustomers != null && unassignedCustomers > 0) {
					logger.info("Found {} customers without SIIBPL customer_code. Auto-generating codes...", unassignedCustomers);

					Long existingMax = jdbcTemplate.queryForObject(
						"SELECT COALESCE(MAX(CAST(SUBSTRING(customer_code, 7) AS UNSIGNED)), 0) FROM customers WHERE customer_code LIKE 'SIIBPL%'",
						Long.class
					);
					final long baseNumber = (existingMax != null) ? existingMax : 0L;

					if (baseNumber > 0) {
						jdbcTemplate.execute(
							"UPDATE customers c " +
							"JOIN ( " +
							"    SELECT LOWER(TRIM(CONCAT(COALESCE(first_name, ''), ' ', COALESCE(last_name, '')))) as norm_name, " +
							"           MIN(customer_code) as existing_code " +
							"    FROM customers " +
							"    WHERE customer_code IS NOT NULL AND customer_code != '' AND customer_code LIKE 'SIIBPL%' " +
							"    GROUP BY norm_name " +
							") existing ON LOWER(TRIM(CONCAT(COALESCE(c.first_name, ''), ' ', COALESCE(c.last_name, '')))) = existing.norm_name " +
							"SET c.customer_code = existing.existing_code " +
							"WHERE c.customer_code IS NULL OR c.customer_code = '' OR c.customer_code NOT LIKE 'SIIBPL%'"
						);
					}

					jdbcTemplate.execute(
						"UPDATE customers c " +
						"JOIN ( " +
						"    SELECT id, CONCAT('SIIBPL', LPAD(" + baseNumber + " + DENSE_RANK() OVER (ORDER BY LOWER(TRIM(CONCAT(COALESCE(first_name, ''), ' ', COALESCE(last_name, ''))))), 5, '0')) as code " +
						"    FROM customers " +
						"    WHERE customer_code IS NULL OR customer_code = '' OR customer_code NOT LIKE 'SIIBPL%' " +
						") ranked ON c.id = ranked.id " +
						"SET c.customer_code = ranked.code " +
						"WHERE c.customer_code IS NULL OR c.customer_code = '' OR c.customer_code NOT LIKE 'SIIBPL%'"
					);
					logger.info("Successfully assigned customer_code to all customers.");
				}

				// 4. Ensure policies have the matching customer_code from their customer
				Integer unassignedPolicies = jdbcTemplate.queryForObject(
					"SELECT COUNT(*) FROM policies WHERE customer_code IS NULL OR customer_code = '' OR customer_code NOT LIKE 'SIIBPL%'",
					Integer.class
				);
				if (unassignedPolicies != null && unassignedPolicies > 0) {
					logger.info("Found {} policies without customer_code. Syncing from customers...", unassignedPolicies);
					jdbcTemplate.execute(
						"UPDATE policies p " +
						"JOIN customers c ON p.customer_id = c.id " +
						"SET p.customer_code = c.customer_code " +
						"WHERE p.customer_code IS NULL OR p.customer_code = '' OR p.customer_code != c.customer_code"
					);
					logger.info("Successfully synced customer_code to policies.");
				}
			} catch (Exception e) {
				logger.error("Error during customer_code schema update/migration: {}", e.getMessage(), e);
			}
		};
	}
}

