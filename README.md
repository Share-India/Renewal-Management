# Insurance Renewal Management System

## Project Overview
The **Renewal Management System** is a robust full-stack enterprise application designed to streamline the entire lifecycle. It bridges the gap between effective renewal tracking and customer relationship management.

### Key Features
- **📊 Timeline-Based Dashboard**: An intuitive interface that segments policies by expiry timeframe (e.g., 75, 30, 7 days remaining), allowing agents to prioritize high-urgency renewals instantly.
- **📅 Smart Follow-Up System**: A dedicated scheduling engine that separates "General Renewals" from "Scheduled Follow-ups." When an agent sets a callback date, the system automatically moves the record to a dedicated worklist for that specific day, ensuring no opportunity is missed.
- **🛡️ Admin Command Center**: A powerful dashboard offering global visibility into team performance, total policy health, and daily work counts, equipped with advanced search and filtering.
- **👥 Customer & Policy CRUD**: Complete management of customer profiles and insurance details, supporting document uploads (payment proofs, policy docs) and historical data tracking.
- **📝 Audit Trails & History**: Detailed logs of every interaction (calls made, outcomes recorded) and administrative changes to policy data, ensuring full transparency and accountability.

---

## Setup Guide

## Prerequisites
- **Java 17+** installed and configured.
- **Maven** installed and added to system PATH.
- **Node.js (v18+)** and **npm** installed.
- **MySQL** server running on port 3306.

## 1. Database Setup
1. Create a MySQL database named `insurance_renewal`.
2. The application will automatically create tables on startup using `schema.sql`.
3. **Important**: Update `backend/src/main/resources/application.properties` with your MySQL username and password:
   ```properties
   spring.datasource.username=YOUR_USERNAME
   spring.datasource.password=YOUR_PASSWORD
   ```

## 2. Backend Setup
1. Navigate to the backend directory:
   ```bash
   cd backend
   ```
2. Build the project:
   ```bash
   mvn clean install
   ```
3. Run the application:
   ```bash
   mvn spring-boot:run
   ```
   The backend will start on `http://localhost:8080`.

## 3. Frontend Setup
1. Navigate to the frontend directory:
   ```bash
   cd frontend
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Start the development server:
   ```bash
   npm start
   ```
4. Open your browser and visit `http://localhost:4200`.

## 4. Usage
- **Timeline**: Click on the days (e.g., 75, 30, 7) to view policies expiring in that timeframe.
- **Post-Expiry**: Click on negative days (e.g., -15) to view overdue policies.
- **Admin**: Click the "Admin Dashboard" link to view system statistics.
