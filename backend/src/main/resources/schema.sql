-- Create Database
CREATE DATABASE IF NOT EXISTS insurance_renewal;
USE insurance_renewal;

-- Users Table
CREATE TABLE IF NOT EXISTS users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL
);

-- Customers Table
CREATE TABLE IF NOT EXISTS customers (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone VARCHAR(20),
    pincode VARCHAR(20),
    billing_frequency VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Policies Table
CREATE TABLE IF NOT EXISTS policies (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    policy_number VARCHAR(50) UNIQUE NOT NULL,
    customer_id BIGINT NOT NULL,
    type VARCHAR(50) NOT NULL, -- e.g., Health, Auto, Life
    amount DECIMAL(10, 2) NOT NULL,
    expiry_date DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'ACTIVE', -- ACTIVE, EXPIRED, RENEWED
    
    -- New Fields
    insurance_name VARCHAR(100),
    policy_start_date DATE,
    policy_end_date DATE,
    product_name VARCHAR(100),
    due_premium DECIMAL(10, 2),
    rm_name VARCHAR(100),
    associate_name VARCHAR(100),
    associate_code VARCHAR(50),
    vehicle_reg_no VARCHAR(50),
    vehicle_model VARCHAR(100),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    INDEX idx_policies_expiry_date (expiry_date)
);

-- Reminders Table
-- Reminders Table
CREATE TABLE IF NOT EXISTS reminders (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    policy_id BIGINT UNIQUE NOT NULL,
    last_reminder_sent_at TIMESTAMP NULL,
    reminder_status VARCHAR(50) DEFAULT 'PENDING', -- PENDING, SENT, ACKNOWLEDGED
    follow_up_required BOOLEAN DEFAULT FALSE,
    follow_up_date DATE NULL,
    notes TEXT,
    last_call_outcome VARCHAR(50),
    last_updated_by VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (policy_id) REFERENCES policies(id),
    INDEX idx_reminders_follow_up_date (follow_up_date)
);
