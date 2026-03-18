package com.insurance.renewal;

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
}
