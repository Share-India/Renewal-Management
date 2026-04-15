SET FOREIGN_KEY_CHECKS=0;

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Sandeep Kumar', 'no-email-dl-0@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_0 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('12185495', 'Miscellaneous Insurance', NULL, NULL, '2026-03-02', '2027-03-02', '1970-01-01', 0.0, 0.0, @curr_c_0, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ms', 'Shashi Kiran Kumar', 'no-email-dl-1@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('30481194', 'Miscellaneous Insurance', NULL, NULL, '2026-03-04', '2027-03-04', '1970-01-01', 0.0, 0.0, @curr_c_1, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Richard Thomas', 'no-email-dl-2@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_2 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11907202', 'Miscellaneous Insurance', NULL, NULL, '2026-03-05', '2027-03-05', '1970-01-01', 0.0, 0.0, @curr_c_2, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Rajesh Kumar Pun', 'no-email-dl-3@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_3 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('80490614', 'Miscellaneous Insurance', NULL, NULL, '2026-03-06', '2028-03-06', '1970-01-01', 0.0, 0.0, @curr_c_3, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Madan Lal Rana', 'no-email-dl-4@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_4 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('12208983', 'Miscellaneous Insurance', NULL, NULL, '2026-03-08', '2027-03-08', '1970-01-01', 0.0, 0.0, @curr_c_4, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Kalyan Shukul', 'no-email-dl-5@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_5 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('61195925', 'Miscellaneous Insurance', NULL, NULL, '2026-03-09', '2027-03-09', '1970-01-01', 0.0, 0.0, @curr_c_5, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Thomas Vellara Chackku', 'no-email-dl-6@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_6 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('80816716', 'Miscellaneous Insurance', NULL, NULL, '2026-03-09', '2027-03-09', '1970-01-01', 0.0, 0.0, @curr_c_6, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Imran Khan', 'no-email-dl-7@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_7 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('80654648', 'Miscellaneous Insurance', NULL, NULL, '2026-03-09', '2027-03-09', '1970-01-01', 0.0, 0.0, @curr_c_7, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Parveen Kumar', 'no-email-dl-8@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_8 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('62992211', 'Miscellaneous Insurance', NULL, NULL, '2026-03-10', '2027-03-10', '1970-01-01', 0.0, 0.0, @curr_c_8, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Gaurav Pathak', 'no-email-dl-9@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_9 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11037696', 'Miscellaneous Insurance', NULL, NULL, '2026-03-12', '2027-03-12', '1970-01-01', 0.0, 0.0, @curr_c_9, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Bhagwan Sarup', 'no-email-dl-10@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_10 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('12229256', 'Miscellaneous Insurance', NULL, NULL, '2026-03-13', '2027-03-13', '1970-01-01', 0.0, 0.0, @curr_c_10, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Jamalpur Santosh Kumar', 'no-email-dl-11@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_11 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('62460818', 'Miscellaneous Insurance', NULL, NULL, '2026-03-14', '2027-03-14', '1970-01-01', 0.0, 0.0, @curr_c_11, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Shalin Jain Shalin Jain', 'no-email-dl-12@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_12 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('80769129', 'Miscellaneous Insurance', NULL, NULL, '2026-03-15', '2027-03-15', '1970-01-01', 0.0, 0.0, @curr_c_12, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Anil Kumar Vishwakarma', 'no-email-dl-13@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_13 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10762208', 'Miscellaneous Insurance', NULL, NULL, '2026-03-16', '2027-03-16', '1970-01-01', 0.0, 0.0, @curr_c_13, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Rajesh Sharma', 'no-email-dl-14@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_14 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('81027409', 'Miscellaneous Insurance', NULL, NULL, '2026-03-16', '2027-03-16', '1970-01-01', 0.0, 0.0, @curr_c_14, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Narendra Prakash Gunnam', 'no-email-dl-15@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_15 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11127296', 'Miscellaneous Insurance', NULL, NULL, '2026-03-18', '2027-03-18', '1970-01-01', 0.0, 0.0, @curr_c_15, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Mohit Awasthi', 'no-email-dl-16@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_16 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('63055164', 'Miscellaneous Insurance', NULL, NULL, '2026-03-19', '2027-03-19', '1970-01-01', 0.0, 0.0, @curr_c_16, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Dilawar Hussain', 'no-email-dl-17@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_17 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('12260169', 'Miscellaneous Insurance', NULL, NULL, '2026-03-19', '2027-03-19', '1970-01-01', 0.0, 0.0, @curr_c_17, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Divyanshu Sharma', 'no-email-dl-18@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_18 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('63362989', 'Miscellaneous Insurance', NULL, NULL, '2026-03-22', '2027-03-22', '1970-01-01', 0.0, 0.0, @curr_c_18, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Ashok Kumar', 'no-email-dl-19@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_19 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('12289545', 'Miscellaneous Insurance', NULL, NULL, '2026-03-24', '2029-03-24', '1970-01-01', 0.0, 0.0, @curr_c_19, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Sinisetty Vsn Satyanarayana', 'no-email-dl-20@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_20 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('63355005', 'Miscellaneous Insurance', NULL, NULL, '2026-03-24', '2027-03-24', '1970-01-01', 0.0, 0.0, @curr_c_20, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Anuj Kr Majumdar', 'no-email-dl-21@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_21 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10899639', 'Miscellaneous Insurance', NULL, NULL, '2026-03-25', '2027-03-25', '1970-01-01', 0.0, 0.0, @curr_c_21, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Dattatray Vitthal Dhindule', 'no-email-dl-22@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_22 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('63102303', 'Miscellaneous Insurance', NULL, NULL, '2026-03-25', '2027-03-25', '1970-01-01', 0.0, 0.0, @curr_c_22, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Janardan Jayprakash Singh', 'no-email-dl-23@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_23 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('81622058', 'Miscellaneous Insurance', NULL, NULL, '2026-03-25', '2027-03-25', '1970-01-01', 0.0, 0.0, @curr_c_23, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ms', 'Rashmi Singh Rashmi Singh', 'no-email-dl-24@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_24 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('63586584', 'Miscellaneous Insurance', NULL, NULL, '2026-03-25', '2027-03-25', '1970-01-01', 0.0, 0.0, @curr_c_24, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Girish Tripathi Girish Tripathi', 'no-email-dl-25@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_25 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('62810086', 'Miscellaneous Insurance', NULL, NULL, '2026-03-25', '2027-03-25', '1970-01-01', 0.0, 0.0, @curr_c_25, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Sachin Kumar', 'no-email-dl-26@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_26 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('12192652', 'Miscellaneous Insurance', NULL, NULL, '2026-03-27', '2027-03-27', '1970-01-01', 0.0, 0.0, @curr_c_26, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Amitesh Datt', 'no-email-dl-27@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_27 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11164210', 'Miscellaneous Insurance', NULL, NULL, '2026-03-28', '2027-03-28', '1970-01-01', 0.0, 0.0, @curr_c_27, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Hemant Kumar Singh', 'no-email-dl-28@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_28 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('63358784', 'Miscellaneous Insurance', NULL, NULL, '2026-03-28', '2027-03-28', '1970-01-01', 0.0, 0.0, @curr_c_28, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Kapil Mutreja', 'no-email-dl-29@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_29 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11174722', 'Miscellaneous Insurance', NULL, NULL, '2026-03-29', '2027-03-29', '1970-01-01', 0.0, 0.0, @curr_c_29, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Mukul Manchanda', 'no-email-dl-30@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_30 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('63782336', 'Miscellaneous Insurance', NULL, NULL, '2026-03-30', '2027-03-30', '1970-01-01', 0.0, 0.0, @curr_c_30, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ms', 'Aruna Agarwal', 'no-email-dl-31@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_31 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('30185376', 'Miscellaneous Insurance', NULL, NULL, '2026-03-30', '2027-03-30', '1970-01-01', 0.0, 0.0, @curr_c_31, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Anil Kumar Gupta', 'no-email-dl-32@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_32 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('17282650', 'Miscellaneous Insurance', NULL, NULL, '2026-03-30', '2027-03-30', '1970-01-01', 0.0, 0.0, @curr_c_32, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Sandesh Sharma', 'no-email-dl-33@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_33 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('81025928', 'Miscellaneous Insurance', NULL, NULL, '2026-03-30', '2027-03-30', '1970-01-01', 0.0, 0.0, @curr_c_33, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Debasis Roy', 'no-email-dl-34@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_34 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('63216173', 'Miscellaneous Insurance', NULL, NULL, '2026-03-30', '2027-03-30', '1970-01-01', 0.0, 0.0, @curr_c_34, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ms', 'Shalin Christina Asher', 'no-email-dl-35@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_35 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('81490119', 'Miscellaneous Insurance', NULL, NULL, '2026-03-30', '2027-03-30', '1970-01-01', 0.0, 0.0, @curr_c_35, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Umesh Shrikant Soman', 'no-email-dl-36@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_36 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('12320662', 'Miscellaneous Insurance', NULL, NULL, '2026-03-30', '2027-03-30', '1970-01-01', 0.0, 0.0, @curr_c_36, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Govind Chandra', 'no-email-dl-37@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_37 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('17286180', 'Miscellaneous Insurance', NULL, NULL, '2026-03-31', '2027-03-31', '1970-01-01', 0.0, 0.0, @curr_c_37, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Shiv Prakash Rai', 'no-email-dl-38@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_38 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('63799643', 'Miscellaneous Insurance', NULL, NULL, '2026-03-31', '2027-03-31', '1970-01-01', 0.0, 0.0, @curr_c_38, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Navdeep H I Navdeep H I', 'no-email-dl-39@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_39 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('81677379', 'Miscellaneous Insurance', NULL, NULL, '2026-03-31', '2027-03-31', '1970-01-01', 0.0, 0.0, @curr_c_39, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Arif', 'Khan', 'no-email-dl-40@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_40 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33835157202602', 'Miscellaneous Insurance', NULL, NULL, '2026-03-05', '2027-03-05', '1970-01-01', 0.0, 0.0, @curr_c_40, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ravi', 'Kumar Namdeo', 'no-email-dl-41@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_41 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33848460202602', 'Miscellaneous Insurance', NULL, NULL, '2026-03-15', '2027-03-15', '1970-01-01', 0.0, 0.0, @curr_c_41, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Srinivas', 'Karne', 'no-email-dl-42@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_42 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33127035202601', 'Miscellaneous Insurance', NULL, NULL, '2026-03-28', '2027-03-28', '1970-01-01', 0.0, 0.0, @curr_c_42, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VINAY', 'KUMAR', 'no-email-dl-43@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_43 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2856206248242302', 'Miscellaneous Insurance', NULL, NULL, '2026-03-24', '2027-03-24', '1970-01-01', 0.0, 0.0, @curr_c_43, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MOHIT', 'TANEJA', 'no-email-dl-44@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_44 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805208334907500', 'Miscellaneous Insurance', NULL, NULL, '2026-03-13', '2028-03-13', '1970-01-01', 0.0, 0.0, @curr_c_44, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Alim', 'Shaukatali Chandani', 'no-email-dl-45@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_45 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4191/344547595/02/000', 'Miscellaneous Insurance', NULL, NULL, '2026-03-19', '2027-03-19', '1970-01-01', 0.0, 0.0, @curr_c_45, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANKIT', '', 'no-email-dl-46@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_46 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('920222628680175087', 'Miscellaneous Insurance', NULL, NULL, '2026-03-24', '2027-03-24', '1970-01-01', 0.0, 0.0, @curr_c_46, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Jitendra', 'Kumar', 'no-email-dl-47@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_47 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3854112005047755', 'Miscellaneous Insurance', NULL, NULL, '2026-03-01', '2027-03-01', '1970-01-01', 0.0, 0.0, @curr_c_47, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Kaustubh', 'C       Behere', 'no-email-dl-48@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_48 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1450111709017486', 'Miscellaneous Insurance', NULL, NULL, '2026-03-02', '2027-03-02', '1970-01-01', 0.0, 0.0, @curr_c_48, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Vaijayanti', 'Chandrashekhar Behere', 'no-email-dl-49@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_49 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1985111709093926', 'Miscellaneous Insurance', NULL, NULL, '2026-03-02', '2027-03-02', '1970-01-01', 0.0, 0.0, @curr_c_49, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Rajana', 'Venkata Ramana', 'no-email-dl-50@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_50 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1791111808083467', 'Miscellaneous Insurance', NULL, NULL, '2026-03-02', '2027-03-02', '1970-01-01', 0.0, 0.0, @curr_c_50, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Satish', 'Kohli', 'no-email-dl-51@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_51 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1836111907094613', 'Miscellaneous Insurance', NULL, NULL, '2026-03-02', '2027-03-02', '1970-01-01', 0.0, 0.0, @curr_c_51, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Prabhu', 'S', 'no-email-dl-52@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_52 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7562112105048662', 'Miscellaneous Insurance', NULL, NULL, '2026-03-03', '2027-03-03', '1970-01-01', 0.0, 0.0, @curr_c_52, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Somasundaram', 'Narayanasamy', 'no-email-dl-53@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_53 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5064112204003187', 'Miscellaneous Insurance', NULL, NULL, '2026-03-03', '2027-03-03', '1970-01-01', 0.0, 0.0, @curr_c_53, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ashish', 'Rashmikant Desai', 'no-email-dl-54@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_54 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2927111804224148', 'Miscellaneous Insurance', NULL, NULL, '2026-03-03', '2027-03-03', '1970-01-01', 0.0, 0.0, @curr_c_54, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Shilpa', 'S Hampiholi', 'no-email-dl-55@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_55 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9898111808067387', 'Miscellaneous Insurance', NULL, NULL, '2026-03-06', '2027-03-06', '1970-01-01', 0.0, 0.0, @curr_c_55, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Manoj', 'Kumar Chakrvesh', 'no-email-dl-56@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_56 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5852111709086022', 'Miscellaneous Insurance', NULL, NULL, '2026-03-06', '2027-03-06', '1970-01-01', 0.0, 0.0, @curr_c_56, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mamidanna', 'Venkata Ramana', 'no-email-dl-57@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_57 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5601111907031312', 'Miscellaneous Insurance', NULL, NULL, '2026-03-06', '2027-03-06', '1970-01-01', 0.0, 0.0, @curr_c_57, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Shanthi', 'Mulayath', 'no-email-dl-58@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_58 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7503111907003678', 'Miscellaneous Insurance', NULL, NULL, '2026-03-07', '2027-03-07', '1970-01-01', 0.0, 0.0, @curr_c_58, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Gnanendra', 'Pm', 'no-email-dl-59@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_59 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3497111907011781', 'Miscellaneous Insurance', NULL, NULL, '2026-03-07', '2027-03-07', '1970-01-01', 0.0, 0.0, @curr_c_59, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Peter', 'C K', 'no-email-dl-60@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_60 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2495111907004172', 'Miscellaneous Insurance', NULL, NULL, '2026-03-07', '2027-03-07', '1970-01-01', 0.0, 0.0, @curr_c_60, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Imran', 'Khan', 'no-email-dl-61@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_61 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4051112105026952', 'Miscellaneous Insurance', NULL, NULL, '2026-03-08', '2027-03-08', '1970-01-01', 0.0, 0.0, @curr_c_61, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Eshan', 'Labroo', 'no-email-dl-62@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_62 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9400112104064056', 'Miscellaneous Insurance', NULL, NULL, '2026-03-08', '2027-03-08', '1970-01-01', 0.0, 0.0, @curr_c_62, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Rajinder', 'Singh', 'no-email-dl-63@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_63 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1648112105052878', 'Miscellaneous Insurance', NULL, NULL, '2026-03-08', '2027-03-08', '1970-01-01', 0.0, 0.0, @curr_c_63, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4371112105090086', 'Miscellaneous Insurance', NULL, NULL, '2026-03-08', '2027-03-08', '1970-01-01', 0.0, 0.0, @curr_c_62, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Jaikrishna', 'K', 'no-email-dl-65@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_65 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5727112105064831', 'Miscellaneous Insurance', NULL, NULL, '2026-03-08', '2027-03-08', '1970-01-01', 0.0, 0.0, @curr_c_65, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Challa', 'Venkata Swamy', 'no-email-dl-66@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_66 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2642112105097696', 'Miscellaneous Insurance', NULL, NULL, '2026-03-09', '2027-03-09', '1970-01-01', 0.0, 0.0, @curr_c_66, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr.Raj', 'Kumar', 'no-email-dl-67@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_67 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4449111507784803', 'Miscellaneous Insurance', NULL, NULL, '2026-03-10', '2027-03-10', '1970-01-01', 0.0, 0.0, @curr_c_67, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('A', 'Nageshwara Rao', 'no-email-dl-68@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_68 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1640111808063657', 'Miscellaneous Insurance', NULL, NULL, '2026-03-10', '2027-03-10', '1970-01-01', 0.0, 0.0, @curr_c_68, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Abhirami', 'G', 'no-email-dl-69@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_69 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8800111907440470', 'Miscellaneous Insurance', NULL, NULL, '2026-03-10', '2027-03-10', '1970-01-01', 0.0, 0.0, @curr_c_69, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PRALAY', 'KUMAR DAS', 'no-email-dl-70@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_70 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6867111907050113', 'Miscellaneous Insurance', NULL, NULL, '2026-03-11', '2027-03-11', '1970-01-01', 0.0, 0.0, @curr_c_70, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('', 'A Venkata Krishnareddy', 'no-email-dl-71@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_71 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5046111808002420', 'Miscellaneous Insurance', NULL, NULL, '2026-03-12', '2027-03-12', '1970-01-01', 0.0, 0.0, @curr_c_71, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mahua', 'Bhattacharjee', 'no-email-dl-72@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_72 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5569112105089554', 'Miscellaneous Insurance', NULL, NULL, '2026-03-12', '2027-03-12', '1970-01-01', 0.0, 0.0, @curr_c_72, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Premwati', 'Bahote', 'no-email-dl-73@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_73 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4114112204020030', 'Miscellaneous Insurance', NULL, NULL, '2026-03-13', '2027-03-13', '1970-01-01', 0.0, 0.0, @curr_c_73, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr.Ravindra', 'Sudhakar Gaikwad', 'no-email-dl-74@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_74 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5996111907050412', 'Miscellaneous Insurance', NULL, NULL, '2026-03-13', '2027-03-13', '1970-01-01', 0.0, 0.0, @curr_c_74, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Lakshmi', 'Mohan', 'no-email-dl-75@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_75 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6262111907055677', 'Miscellaneous Insurance', NULL, NULL, '2026-03-13', '2027-03-13', '1970-01-01', 0.0, 0.0, @curr_c_75, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Anil', 'Kumar  Jat', 'no-email-dl-76@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_76 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7036111808402182', 'Miscellaneous Insurance', NULL, NULL, '2026-03-13', '2027-03-13', '1970-01-01', 0.0, 0.0, @curr_c_76, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Suresh', 'Jadiyappa Nagathan', 'no-email-dl-77@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_77 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8231111907040497', 'Miscellaneous Insurance', NULL, NULL, '2026-03-14', '2027-03-14', '1970-01-01', 0.0, 0.0, @curr_c_77, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mohit', 'Taneja', 'no-email-dl-78@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_78 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4265111808095826', 'Miscellaneous Insurance', NULL, NULL, '2026-03-14', '2027-03-14', '1970-01-01', 0.0, 0.0, @curr_c_78, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Pravin', 'Kumar Varshney', 'no-email-dl-79@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_79 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4248112105092469', 'Miscellaneous Insurance', NULL, NULL, '2026-03-15', '2027-03-15', '1970-01-01', 0.0, 0.0, @curr_c_79, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Sanket', 'Naresh Bhai Shah', 'no-email-dl-80@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_80 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6610111709009856', 'Miscellaneous Insurance', NULL, NULL, '2026-03-15', '2027-03-15', '1970-01-01', 0.0, 0.0, @curr_c_80, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Kewal', 'Krishan', 'no-email-dl-81@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_81 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5144111808058169', 'Miscellaneous Insurance', NULL, NULL, '2026-03-15', '2027-03-15', '1970-01-01', 0.0, 0.0, @curr_c_81, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Gurwinder', 'Singh', 'no-email-dl-82@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_82 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2926112105050464', 'Miscellaneous Insurance', NULL, NULL, '2026-03-16', '2027-03-16', '1970-01-01', 0.0, 0.0, @curr_c_82, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Kamal', 'Kumar', 'no-email-dl-83@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_83 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4592112105040930', 'Miscellaneous Insurance', NULL, NULL, '2026-03-16', '2027-03-16', '1970-01-01', 0.0, 0.0, @curr_c_83, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('V', 'SRINIVAS RAO', 'no-email-dl-84@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_84 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9541111709046917', 'Miscellaneous Insurance', NULL, NULL, '2026-03-16', '2027-03-16', '1970-01-01', 0.0, 0.0, @curr_c_84, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DEEPAK', 'V HIREMATH', 'no-email-dl-85@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_85 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8765111907087940', 'Miscellaneous Insurance', NULL, NULL, '2026-03-16', '2027-03-16', '1970-01-01', 0.0, 0.0, @curr_c_85, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr.Pramit', 'Lahiri', 'no-email-dl-86@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_86 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3227111709455182', 'Miscellaneous Insurance', NULL, NULL, '2026-03-17', '2027-03-17', '1970-01-01', 0.0, 0.0, @curr_c_86, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Milen', 'Raj Pothanikatt', 'no-email-dl-87@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_87 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2063112006078342', 'Miscellaneous Insurance', NULL, NULL, '2026-03-17', '2027-03-17', '1970-01-01', 0.0, 0.0, @curr_c_87, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Sumedha', 'Naik', 'no-email-dl-88@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_88 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7396111709425685', 'Miscellaneous Insurance', NULL, NULL, '2026-03-18', '2027-03-18', '1970-01-01', 0.0, 0.0, @curr_c_88, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Alim', 'Shaukatali Chandani', 'no-email-dl-89@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_89 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4315112402065620', 'Miscellaneous Insurance', NULL, NULL, '2026-03-19', '2027-03-19', '1970-01-01', 0.0, 0.0, @curr_c_89, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Rahul', 'Shrikant Rana', 'no-email-dl-90@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_90 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3491112204040092', 'Miscellaneous Insurance', NULL, NULL, '2026-03-19', '2027-03-19', '1970-01-01', 0.0, 0.0, @curr_c_90, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Hema', 'U Hatolkar', 'no-email-dl-91@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_91 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5283111507295105', 'Miscellaneous Insurance', NULL, NULL, '2026-03-19', '2027-03-19', '1970-01-01', 0.0, 0.0, @curr_c_91, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Shiv', 'Arya', 'no-email-dl-92@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_92 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2330112006027319', 'Miscellaneous Insurance', NULL, NULL, '2026-03-19', '2027-03-19', '1970-01-01', 0.0, 0.0, @curr_c_92, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Rahul', 'Shrikant Rana', 'no-email-dl-93@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_93 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9749112204044003', 'Miscellaneous Insurance', NULL, NULL, '2026-03-19', '2027-03-19', '1970-01-01', 0.0, 0.0, @curr_c_93, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr.Sahil', 'Sachdeva', 'no-email-dl-94@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_94 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4038111408235762', 'Miscellaneous Insurance', NULL, NULL, '2026-03-20', '2027-03-20', '1970-01-01', 0.0, 0.0, @curr_c_94, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mrs.Neeru', '', 'no-email-dl-95@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_95 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7151111607205614', 'Miscellaneous Insurance', NULL, NULL, '2026-03-20', '2027-03-20', '1970-01-01', 0.0, 0.0, @curr_c_95, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Yogesh', 'Sharma', 'no-email-dl-96@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_96 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6424111907042253', 'Miscellaneous Insurance', NULL, NULL, '2026-03-20', '2027-03-20', '1970-01-01', 0.0, 0.0, @curr_c_96, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Abhijit', '', 'no-email-dl-97@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_97 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9778112104214734', 'Miscellaneous Insurance', NULL, NULL, '2026-03-20', '2027-03-20', '1970-01-01', 0.0, 0.0, @curr_c_97, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr.Anil', 'Kumar Sharma', 'no-email-dl-98@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_98 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8286111808011706', 'Miscellaneous Insurance', NULL, NULL, '2026-03-21', '2027-03-21', '1970-01-01', 0.0, 0.0, @curr_c_98, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Sampad', 'Paul', 'no-email-dl-99@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_99 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7456111808031722', 'Miscellaneous Insurance', NULL, NULL, '2026-03-21', '2027-03-21', '1970-01-01', 0.0, 0.0, @curr_c_99, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Abhay', 'Kumar Samantaray', 'no-email-dl-100@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_100 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2347111907013794', 'Miscellaneous Insurance', NULL, NULL, '2026-03-22', '2027-03-22', '1970-01-01', 0.0, 0.0, @curr_c_100, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Sushil', 'Kumar', 'no-email-dl-101@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_101 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5959112006032371', 'Miscellaneous Insurance', NULL, NULL, '2026-03-22', '2027-03-22', '1970-01-01', 0.0, 0.0, @curr_c_101, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr.Vijay', 'Narayan Tiwari', 'no-email-dl-102@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_102 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8062111808381741', 'Miscellaneous Insurance', NULL, NULL, '2026-03-22', '2027-03-22', '1970-01-01', 0.0, 0.0, @curr_c_102, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Rahul', 'Chathrath', 'no-email-dl-103@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_103 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2786112204028258', 'Miscellaneous Insurance', NULL, NULL, '2026-03-22', '2027-03-22', '1970-01-01', 0.0, 0.0, @curr_c_103, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Shailendra', 'Kumar Tiwari', 'no-email-dl-104@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_104 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8097112006043361', 'Miscellaneous Insurance', NULL, NULL, '2026-03-23', '2027-03-23', '1970-01-01', 0.0, 0.0, @curr_c_104, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mukesh', 'Kumar', 'no-email-dl-105@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_105 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8212112204007437', 'Miscellaneous Insurance', NULL, NULL, '2026-03-23', '2027-03-23', '1970-01-01', 0.0, 0.0, @curr_c_105, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Pawan', 'Kumar Sharma', 'no-email-dl-106@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_106 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1245111907142065', 'Miscellaneous Insurance', NULL, NULL, '2026-03-23', '2027-03-23', '1970-01-01', 0.0, 0.0, @curr_c_106, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('P', 'U Bhaskara Rao', 'no-email-dl-107@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_107 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5769111709056686', 'Miscellaneous Insurance', NULL, NULL, '2026-03-24', '2027-03-24', '1970-01-01', 0.0, 0.0, @curr_c_107, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Dhirendra', 'Devendratiwari', 'no-email-dl-108@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_108 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9778112006053299', 'Miscellaneous Insurance', NULL, NULL, '2026-03-25', '2027-03-25', '1970-01-01', 0.0, 0.0, @curr_c_108, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Sobhana', 'Sashidharan  Panickar', 'no-email-dl-109@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_109 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8324112204070451', 'Miscellaneous Insurance', NULL, NULL, '2026-03-25', '2027-03-25', '1970-01-01', 0.0, 0.0, @curr_c_109, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Prashant', 'Kumar', 'no-email-dl-110@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_110 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6184111907017391', 'Miscellaneous Insurance', NULL, NULL, '2026-03-25', '2027-03-25', '1970-01-01', 0.0, 0.0, @curr_c_110, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Saveen', 'Thomas', 'no-email-dl-111@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_111 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6061111907007191', 'Miscellaneous Insurance', NULL, NULL, '2026-03-25', '2027-03-25', '1970-01-01', 0.0, 0.0, @curr_c_111, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Shashidharan', 'Nanu Panikar', 'no-email-dl-112@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_112 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6997112204015127', 'Miscellaneous Insurance', NULL, NULL, '2026-03-25', '2027-03-25', '1970-01-01', 0.0, 0.0, @curr_c_112, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Tamali', 'Chakaraborty', 'no-email-dl-113@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_113 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3072111907095503', 'Miscellaneous Insurance', NULL, NULL, '2026-03-25', '2027-03-25', '1970-01-01', 0.0, 0.0, @curr_c_113, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Manu', 'Raj', 'no-email-dl-114@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_114 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7060112402079394', 'Miscellaneous Insurance', NULL, NULL, '2026-03-25', '2027-03-25', '1970-01-01', 0.0, 0.0, @curr_c_114, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mohammad', 'Imran', 'no-email-dl-115@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_115 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7256111808038272', 'Miscellaneous Insurance', NULL, NULL, '2026-03-26', '2027-03-26', '1970-01-01', 0.0, 0.0, @curr_c_115, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Milen', 'Raj', 'no-email-dl-116@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_116 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9521112006037266', 'Miscellaneous Insurance', NULL, NULL, '2026-03-26', '2027-03-26', '1970-01-01', 0.0, 0.0, @curr_c_116, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Dinesh', 'Verma', 'no-email-dl-117@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_117 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4251111804274079', 'Miscellaneous Insurance', NULL, NULL, '2026-03-26', '2027-03-26', '1970-01-01', 0.0, 0.0, @curr_c_117, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ashish', 'Kumar Chhabra', 'no-email-dl-118@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_118 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2676111808047787', 'Miscellaneous Insurance', NULL, NULL, '2026-03-26', '2027-03-26', '1970-01-01', 0.0, 0.0, @curr_c_118, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Siddharth', 'Maruti Gaikwad', 'no-email-dl-119@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_119 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7402112303036290', 'Miscellaneous Insurance', NULL, NULL, '2026-03-28', '2027-03-28', '1970-01-01', 0.0, 0.0, @curr_c_119, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Alok', 'Soni', 'no-email-dl-120@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_120 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4706111808034983', 'Miscellaneous Insurance', NULL, NULL, '2026-03-30', '2027-03-30', '1970-01-01', 0.0, 0.0, @curr_c_120, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Rahul', 'Bhattacharjee', 'no-email-dl-121@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_121 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1687111808090618', 'Miscellaneous Insurance', NULL, NULL, '2026-03-30', '2027-03-30', '1970-01-01', 0.0, 0.0, @curr_c_121, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ram', 'Niwas', 'no-email-dl-122@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_122 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8155111808008966', 'Miscellaneous Insurance', NULL, NULL, '2026-03-30', '2027-03-30', '1970-01-01', 0.0, 0.0, @curr_c_122, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ronak', 'Gunwant Shah', 'no-email-dl-123@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_123 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4478111808088509', 'Miscellaneous Insurance', NULL, NULL, '2026-03-30', '2027-03-30', '1970-01-01', 0.0, 0.0, @curr_c_123, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Seelam', 'Chandra Shekar Reddy', 'no-email-dl-124@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_124 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1865111808044968', 'Miscellaneous Insurance', NULL, NULL, '2026-03-30', '2027-03-30', '1970-01-01', 0.0, 0.0, @curr_c_124, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Shailesh', 'Shetty', 'no-email-dl-125@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_125 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9195112006054024', 'Miscellaneous Insurance', NULL, NULL, '2026-03-30', '2027-03-30', '1970-01-01', 0.0, 0.0, @curr_c_125, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Singhi', 'Rajesh', 'no-email-dl-126@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_126 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9488111507253030', 'Miscellaneous Insurance', NULL, NULL, '2026-03-30', '2027-03-30', '1970-01-01', 0.0, 0.0, @curr_c_126, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('B.V.S', 'Sarma', 'no-email-dl-127@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_127 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8659111907023807', 'Miscellaneous Insurance', NULL, NULL, '2026-03-30', '2027-03-30', '1970-01-01', 0.0, 0.0, @curr_c_127, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Sushmita', 'Kaushik', 'no-email-dl-128@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_128 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33882256202602', 'Miscellaneous Insurance', NULL, NULL, '2026-03-21', '2027-03-21', '1970-01-01', 0.0, 0.0, @curr_c_128, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SRINIVAS', 'KARNE', 'no-email-dl-129@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_129 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33129724202603', 'Miscellaneous Insurance', NULL, NULL, '2026-03-30', '2027-03-30', '1970-01-01', 0.0, 0.0, @curr_c_129, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MANOJ', 'KUMAR SHARMA', 'no-email-dl-130@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_130 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('36126929202601', 'Miscellaneous Insurance', NULL, NULL, '2026-03-23', '2027-03-23', '1970-01-01', 0.0, 0.0, @curr_c_130, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PAWAN', 'MANN', 'no-email-dl-131@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_131 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4193i/APRN/328793518/02/000', 'Miscellaneous Insurance', NULL, NULL, '2026-03-07', '2027-03-07', '1970-01-01', 0.0, 0.0, @curr_c_131, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Umesh', 'Vasantrao Dabhekar', 'no-email-dl-132@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_132 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('23-19-0100569-06', 'Miscellaneous Insurance', NULL, NULL, '2026-02-02', '2027-02-02', '1970-01-01', 0.0, 0.0, @curr_c_132, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Sunder', 'Saini .', 'no-email-dl-133@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_133 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-22-3806464-03', 'Miscellaneous Insurance', NULL, NULL, '2026-02-04', '2027-02-04', '1970-01-01', 0.0, 0.0, @curr_c_133, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Animesh', 'Dangi', 'no-email-dl-134@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_134 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('23-22-2222665-03', 'Miscellaneous Insurance', NULL, NULL, '2026-02-13', '2027-02-13', '1970-01-01', 0.0, 0.0, @curr_c_134, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SYED', 'MOOSA KHADRI', 'no-email-dl-135@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_135 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6465111907057717', 'Miscellaneous Insurance', NULL, NULL, '2026-02-04', '2027-02-04', '1970-01-01', 0.0, 0.0, @curr_c_135, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KATRENIKONA', 'RAVIKUMAR', 'no-email-dl-136@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_136 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9600111907082421', 'Miscellaneous Insurance', NULL, NULL, '2026-02-04', '2027-02-04', '1970-01-01', 0.0, 0.0, @curr_c_136, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('BHAWNA', 'RAJPUT', 'no-email-dl-137@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_137 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7926111907024997', 'Miscellaneous Insurance', NULL, NULL, '2026-02-05', '2027-02-05', '1970-01-01', 0.0, 0.0, @curr_c_137, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ABDUL', 'ALEEM', 'no-email-dl-138@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_138 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8172111808270353', 'Miscellaneous Insurance', NULL, NULL, '2026-02-05', '2027-02-05', '1970-01-01', 0.0, 0.0, @curr_c_138, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4477111907001170', 'Miscellaneous Insurance', NULL, NULL, '2026-02-05', '2027-02-05', '1970-01-01', 0.0, 0.0, @curr_c_135, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('LEAQUAT', 'HOSSAIN', 'no-email-dl-140@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_140 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8511111907031076', 'Miscellaneous Insurance', NULL, NULL, '2026-02-05', '2027-02-05', '1970-01-01', 0.0, 0.0, @curr_c_140, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PROTUSH', 'PANDA', 'no-email-dl-141@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_141 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9013111807213282', 'Miscellaneous Insurance', NULL, NULL, '2026-02-06', '2027-02-06', '1970-01-01', 0.0, 0.0, @curr_c_141, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('I.V.N.G.SURESH', '', 'no-email-dl-142@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_142 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5689111808150032', 'Miscellaneous Insurance', NULL, NULL, '2026-02-06', '2027-02-06', '1970-01-01', 0.0, 0.0, @curr_c_142, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAHUL', 'GUPTA', 'no-email-dl-143@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_143 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3410112006033615', 'Miscellaneous Insurance', NULL, NULL, '2026-02-06', '2027-02-06', '1970-01-01', 0.0, 0.0, @curr_c_143, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANAND', 'VISHWANATH KURANKAR', 'no-email-dl-144@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_144 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7261112006074311', 'Miscellaneous Insurance', NULL, NULL, '2026-02-07', '2027-02-07', '1970-01-01', 0.0, 0.0, @curr_c_144, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('LOUNWALA', '', 'no-email-dl-145@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_145 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4516112105080587', 'Miscellaneous Insurance', NULL, NULL, '2026-02-07', '2027-02-07', '1970-01-01', 0.0, 0.0, @curr_c_145, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Deshmukh', 'Sharyu Rajendra', 'no-email-dl-146@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_146 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4012112402083785', 'Miscellaneous Insurance', NULL, NULL, '2026-02-07', '2027-02-07', '1970-01-01', 0.0, 0.0, @curr_c_146, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAMPUKAR', 'THAKUR', 'no-email-dl-147@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_147 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6295111808082067', 'Miscellaneous Insurance', NULL, NULL, '2026-02-08', '2027-02-08', '1970-01-01', 0.0, 0.0, @curr_c_147, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SANJEEV', 'NAGESH MALALIKAR', 'no-email-dl-148@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_148 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6655111808078726', 'Miscellaneous Insurance', NULL, NULL, '2026-02-08', '2027-02-08', '1970-01-01', 0.0, 0.0, @curr_c_148, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('AMIT', 'KUMAR ARYA', 'no-email-dl-149@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_149 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6292111906664584', 'Miscellaneous Insurance', NULL, NULL, '2026-02-08', '2027-02-08', '1970-01-01', 0.0, 0.0, @curr_c_149, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DIPANWITA', 'GUPTA', 'no-email-dl-150@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_150 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3956112006068824', 'Miscellaneous Insurance', NULL, NULL, '2026-02-09', '2027-02-09', '1970-01-01', 0.0, 0.0, @curr_c_150, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('NASH', 'SELWYN DSOUZA', 'no-email-dl-151@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_151 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1203112204081002', 'Miscellaneous Insurance', NULL, NULL, '2026-02-09', '2027-02-09', '1970-01-01', 0.0, 0.0, @curr_c_151, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SREEDHAR', 'YADAV NALI', 'no-email-dl-152@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_152 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6134112006039639', 'Miscellaneous Insurance', NULL, NULL, '2026-02-10', '2027-02-10', '1970-01-01', 0.0, 0.0, @curr_c_152, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MEGHA', 'VINAYAK PARANJAPE', 'no-email-dl-153@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_153 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2849111808034517', 'Miscellaneous Insurance', NULL, NULL, '2026-02-11', '2027-02-11', '1970-01-01', 0.0, 0.0, @curr_c_153, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ABDUL', 'KARIM YUNUS KAZI', 'no-email-dl-154@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_154 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5217112006033099', 'Miscellaneous Insurance', NULL, NULL, '2026-02-12', '2027-02-12', '1970-01-01', 0.0, 0.0, @curr_c_154, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SHIV', 'PRATEEK', 'no-email-dl-155@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_155 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9785111705243175', 'Miscellaneous Insurance', NULL, NULL, '2026-02-12', '2027-02-12', '1970-01-01', 0.0, 0.0, @curr_c_155, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('NIRAJ', 'GOKULDAS LAKHOTIYA', 'no-email-dl-156@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_156 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3145111709134126', 'Miscellaneous Insurance', NULL, NULL, '2026-02-13', '2027-02-13', '1970-01-01', 0.0, 0.0, @curr_c_156, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('NEERAJ', '', 'no-email-dl-157@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_157 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5564111907013961', 'Miscellaneous Insurance', NULL, NULL, '2026-02-13', '2027-02-13', '1970-01-01', 0.0, 0.0, @curr_c_157, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('GOVINDARAJAN.N', '', 'no-email-dl-158@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_158 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3895111907046524', 'Miscellaneous Insurance', NULL, NULL, '2026-02-13', '2027-02-13', '1970-01-01', 0.0, 0.0, @curr_c_158, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ACHUTA', 'RAMAIAH GOTETI', 'no-email-dl-159@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_159 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4753111709464502', 'Miscellaneous Insurance', NULL, NULL, '2026-02-13', '2027-02-13', '1970-01-01', 0.0, 0.0, @curr_c_159, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('AMOD', 'KUMAR JHA', 'no-email-dl-160@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_160 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9174111907041180', 'Miscellaneous Insurance', NULL, NULL, '2026-02-15', '2027-02-15', '1970-01-01', 0.0, 0.0, @curr_c_160, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RASHMIK', 'VINODCHANDRA SHETH', 'no-email-dl-161@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_161 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6666112204048850', 'Miscellaneous Insurance', NULL, NULL, '2026-02-15', '2027-02-15', '1970-01-01', 0.0, 0.0, @curr_c_161, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUKANT', 'K  JOSHI', 'no-email-dl-162@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_162 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6255111808459766', 'Miscellaneous Insurance', NULL, NULL, '2026-02-15', '2027-02-15', '1970-01-01', 0.0, 0.0, @curr_c_162, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MUTHUSELVAN', '', 'no-email-dl-163@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_163 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1800111808028264', 'Miscellaneous Insurance', NULL, NULL, '2026-02-16', '2027-02-16', '1970-01-01', 0.0, 0.0, @curr_c_163, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('AMOL', 'PRABHAKAR PATHAK', 'no-email-dl-164@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_164 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9773112006088831', 'Miscellaneous Insurance', NULL, NULL, '2026-02-16', '2027-02-16', '1970-01-01', 0.0, 0.0, @curr_c_164, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('S', 'N BHINGARKAR', 'no-email-dl-165@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_165 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8444111907075065', 'Miscellaneous Insurance', NULL, NULL, '2026-02-16', '2027-02-16', '1970-01-01', 0.0, 0.0, @curr_c_165, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SHREEYA', 'KATYAL', 'no-email-dl-166@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_166 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6037112005001825', 'Miscellaneous Insurance', NULL, NULL, '2026-02-17', '2027-02-17', '1970-01-01', 0.0, 0.0, @curr_c_166, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SHIVAPRASAD', 'T V', 'no-email-dl-167@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_167 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2000112204077813', 'Miscellaneous Insurance', NULL, NULL, '2026-02-17', '2027-02-17', '1970-01-01', 0.0, 0.0, @curr_c_167, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MANJUNATHA', 'K', 'no-email-dl-168@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_168 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6703111907076758', 'Miscellaneous Insurance', NULL, NULL, '2026-02-19', '2027-02-19', '1970-01-01', 0.0, 0.0, @curr_c_168, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SIBI', 'K P', 'no-email-dl-169@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_169 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2360111907084769', 'Miscellaneous Insurance', NULL, NULL, '2026-02-19', '2027-02-19', '1970-01-01', 0.0, 0.0, @curr_c_169, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANIL', 'KUMAR PODDAR', 'no-email-dl-170@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_170 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4418112004299996', 'Miscellaneous Insurance', NULL, NULL, '2026-02-19', '2027-02-19', '1970-01-01', 0.0, 0.0, @curr_c_170, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('REKHA', 'GHORPADE', 'no-email-dl-171@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_171 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6153111907089853', 'Miscellaneous Insurance', NULL, NULL, '2026-02-20', '2027-02-20', '1970-01-01', 0.0, 0.0, @curr_c_171, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SHARAD', 'ROHIDAS SANGALE', 'no-email-dl-172@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_172 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6318111907040415', 'Miscellaneous Insurance', NULL, NULL, '2026-02-20', '2027-02-20', '1970-01-01', 0.0, 0.0, @curr_c_172, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('AMBRISH', 'UPADHYAY', 'no-email-dl-173@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_173 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2852111907014231', 'Miscellaneous Insurance', NULL, NULL, '2026-02-20', '2027-02-20', '1970-01-01', 0.0, 0.0, @curr_c_173, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RATISH', 'AGARWAL', 'no-email-dl-174@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_174 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5106111709019735', 'Miscellaneous Insurance', NULL, NULL, '2026-02-21', '2027-02-21', '1970-01-01', 0.0, 0.0, @curr_c_174, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SATISH', 'VISAPURE', 'no-email-dl-175@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_175 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2394112105072924', 'Miscellaneous Insurance', NULL, NULL, '2026-02-21', '2027-02-21', '1970-01-01', 0.0, 0.0, @curr_c_175, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('A', 'RAMACHANDER RAO', 'no-email-dl-176@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_176 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9266111907005547', 'Miscellaneous Insurance', NULL, NULL, '2026-02-23', '2027-02-23', '1970-01-01', 0.0, 0.0, @curr_c_176, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('OM', 'PRAKASH', 'no-email-dl-177@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_177 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8959112006077467', 'Miscellaneous Insurance', NULL, NULL, '2026-02-24', '2027-02-24', '1970-01-01', 0.0, 0.0, @curr_c_177, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('M', 'KAWIN KUMAR', 'no-email-dl-178@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_178 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3275111906234658', 'Miscellaneous Insurance', NULL, NULL, '2026-02-25', '2027-02-25', '1970-01-01', 0.0, 0.0, @curr_c_178, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAJITH', 'K', 'no-email-dl-179@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_179 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1930111907067829', 'Miscellaneous Insurance', NULL, NULL, '2026-02-26', '2027-02-26', '1970-01-01', 0.0, 0.0, @curr_c_179, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('JAYANTA', 'KUMAR MITRA', 'no-email-dl-180@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_180 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9491112006091562', 'Miscellaneous Insurance', NULL, NULL, '2026-02-26', '2027-02-26', '1970-01-01', 0.0, 0.0, @curr_c_180, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PRIYANKA', 'NARAYAN', 'no-email-dl-181@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_181 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8873112204408526', 'Miscellaneous Insurance', NULL, NULL, '2026-02-27', '2027-02-27', '1970-01-01', 0.0, 0.0, @curr_c_181, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANIL', 'THOMAS', 'no-email-dl-182@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_182 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6067112204040004', 'Miscellaneous Insurance', NULL, NULL, '2026-02-27', '2027-02-27', '1970-01-01', 0.0, 0.0, @curr_c_182, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('GOTETI', 'ACHUTA RAMAIAH', 'no-email-dl-183@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_183 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1862111708086161', 'Miscellaneous Insurance', NULL, NULL, '2026-02-27', '2027-02-27', '1970-01-01', 0.0, 0.0, @curr_c_183, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9592111709078766', 'Miscellaneous Insurance', NULL, NULL, '2026-02-27', '2027-02-27', '1970-01-01', 0.0, 0.0, @curr_c_183, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('UREN', 'AJAYKUMAR SHAH', 'no-email-dl-185@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_185 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2483111904629449', 'Miscellaneous Insurance', NULL, NULL, '2026-02-27', '2027-02-27', '1970-01-01', 0.0, 0.0, @curr_c_185, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('B.R.', 'JAYAPRAKASH NARAYAN', 'no-email-dl-186@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_186 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9662111709079569', 'Miscellaneous Insurance', NULL, NULL, '2026-02-28', '2027-02-28', '1970-01-01', 0.0, 0.0, @curr_c_186, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR.ANIL', 'KALRA', 'no-email-dl-187@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_187 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3338111607217783', 'Miscellaneous Insurance', NULL, NULL, '2026-02-28', '2027-02-28', '1970-01-01', 0.0, 0.0, @curr_c_187, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ADIRAJU', 'VISWANADH', 'no-email-dl-188@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_188 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5321112105056278', 'Miscellaneous Insurance', NULL, NULL, '2026-02-28', '2027-02-28', '1970-01-01', 0.0, 0.0, @curr_c_188, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANIL', 'KUMAR GUPTA', 'no-email-dl-189@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_189 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3135111907051154', 'Miscellaneous Insurance', NULL, NULL, '2026-02-28', '2027-02-28', '1970-01-01', 0.0, 0.0, @curr_c_189, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('AKSHAY', 'ANANT MIRGAL', 'no-email-dl-190@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_190 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2776112402073736', 'Miscellaneous Insurance', NULL, NULL, '2026-02-28', '2027-02-28', '1970-01-01', 0.0, 0.0, @curr_c_190, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ms', 'Yamini Saraswathi Sabbasani', 'no-email-dl-191@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_191 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10991110', 'Miscellaneous Insurance', NULL, NULL, '2026-02-02', '2027-02-02', '1970-01-01', 0.0, 0.0, @curr_c_191, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ms', 'Meenakshi Sharma', 'no-email-dl-192@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_192 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10994813', 'Miscellaneous Insurance', NULL, NULL, '2026-02-03', '2028-02-04', '1970-01-01', 0.0, 0.0, @curr_c_192, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Varun Sharma', 'no-email-dl-193@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_193 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11913261', 'Miscellaneous Insurance', NULL, NULL, '2026-02-05', '2027-02-05', '1970-01-01', 0.0, 0.0, @curr_c_193, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Munir A R Wagle', 'no-email-dl-194@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_194 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('12080827', 'Miscellaneous Insurance', NULL, NULL, '2026-02-05', '2027-02-05', '1970-01-01', 0.0, 0.0, @curr_c_194, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ms', 'Runa Priyanka', 'no-email-dl-195@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_195 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('53220160', 'Miscellaneous Insurance', NULL, NULL, '2026-02-05', '2027-02-05', '1970-01-01', 0.0, 0.0, @curr_c_195, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Kausik Mondal', 'no-email-dl-196@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_196 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11000212', 'Miscellaneous Insurance', NULL, NULL, '2026-02-07', '2027-02-07', '1970-01-01', 0.0, 0.0, @curr_c_196, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Tulsidas Gumane', 'no-email-dl-197@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_197 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('98936851', 'Miscellaneous Insurance', NULL, NULL, '2026-02-07', '2027-02-07', '1970-01-01', 0.0, 0.0, @curr_c_197, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Ishan Kakra', 'no-email-dl-198@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_198 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11002414', 'Miscellaneous Insurance', NULL, NULL, '2026-02-08', '2029-02-08', '1970-01-01', 0.0, 0.0, @curr_c_198, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Anil Tomar', 'no-email-dl-199@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_199 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('61773312', 'Miscellaneous Insurance', NULL, NULL, '2026-02-09', '2027-02-09', '1970-01-01', 0.0, 0.0, @curr_c_199, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Bharath Kulai', 'no-email-dl-200@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_200 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('60993801', 'Miscellaneous Insurance', NULL, NULL, '2026-02-09', '2027-02-09', '1970-01-01', 0.0, 0.0, @curr_c_200, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ms', 'Munnangi Vineela', 'no-email-dl-201@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_201 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11005107', 'Miscellaneous Insurance', NULL, NULL, '2026-02-10', '2029-02-10', '1970-01-01', 0.0, 0.0, @curr_c_201, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Ashutosh Upadhyay', 'no-email-dl-202@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_202 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('60762146', 'Miscellaneous Insurance', NULL, NULL, '2026-02-12', '2027-02-12', '1970-01-01', 0.0, 0.0, @curr_c_202, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ms', 'Ravita Kumari', 'no-email-dl-203@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_203 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10997706', 'Miscellaneous Insurance', NULL, NULL, '2026-02-16', '2027-02-16', '1970-01-01', 0.0, 0.0, @curr_c_203, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11009233', 'Miscellaneous Insurance', NULL, NULL, '2026-02-17', '2027-02-17', '1970-01-01', 0.0, 0.0, @curr_c_14, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Vardhman Suresh Bage', 'no-email-dl-205@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_205 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('30208650', 'Miscellaneous Insurance', NULL, NULL, '2026-02-20', '2027-02-20', '1970-01-01', 0.0, 0.0, @curr_c_205, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Om Prakash Vishwakarma', 'no-email-dl-206@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_206 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('62334865', 'Miscellaneous Insurance', NULL, NULL, '2026-02-21', '2027-02-21', '1970-01-01', 0.0, 0.0, @curr_c_206, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('97582887', 'Miscellaneous Insurance', NULL, NULL, '2026-02-21', '2027-02-21', '1970-01-01', 0.0, 0.0, @curr_c_14, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Satwinder Singh Sembhi', 'no-email-dl-208@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_208 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('79531511', 'Miscellaneous Insurance', NULL, NULL, '2026-02-23', '2027-02-23', '1970-01-01', 0.0, 0.0, @curr_c_208, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Deepak Rayapudi', 'no-email-dl-209@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_209 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('62206625', 'Miscellaneous Insurance', NULL, NULL, '2026-02-25', '2027-02-25', '1970-01-01', 0.0, 0.0, @curr_c_209, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Rajendra Prasad Tiwari', 'no-email-dl-210@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_210 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('98194581', 'Miscellaneous Insurance', NULL, NULL, '2026-02-27', '2027-02-27', '1970-01-01', 0.0, 0.0, @curr_c_210, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Anil Kumar Sharma', 'no-email-dl-211@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_211 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('13808743', 'Miscellaneous Insurance', NULL, NULL, '2026-02-28', '2027-02-28', '1970-01-01', 0.0, 0.0, @curr_c_211, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Rishav', 'Yadav', 'no-email-dl-212@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_212 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33794766202602', 'Miscellaneous Insurance', NULL, NULL, '2026-02-19', '2027-02-19', '1970-01-01', 0.0, 0.0, @curr_c_212, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Jaisika', 'Bansal', 'no-email-dl-213@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_213 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('32261266202604', 'Miscellaneous Insurance', NULL, NULL, '2026-02-28', '2027-02-28', '1970-01-01', 0.0, 0.0, @curr_c_213, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33794751202602', 'Miscellaneous Insurance', NULL, NULL, '2026-02-19', '2027-02-19', '1970-01-01', 0.0, 0.0, @curr_c_212, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Rupesh', 'Dilip Marathe', 'no-email-dl-215@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_215 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33818561202602', 'Miscellaneous Insurance', NULL, NULL, '2026-02-28', '2027-02-28', '1970-01-01', 0.0, 0.0, @curr_c_215, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Preyash', 'P Chhapgar', 'no-email-dl-216@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_216 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33057724202603', 'Miscellaneous Insurance', NULL, NULL, '2026-02-27', '2027-02-27', '1970-01-01', 0.0, 0.0, @curr_c_216, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Renu', 'Sharma', 'no-email-dl-217@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_217 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33006355202603', 'Miscellaneous Insurance', NULL, NULL, '2026-02-08', '2027-02-08', '1970-01-01', 0.0, 0.0, @curr_c_217, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('GURPREET', 'SINGH', 'no-email-dl-218@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_218 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805203553096706', 'Miscellaneous Insurance', NULL, NULL, '2026-02-20', '2027-02-20', '1970-01-01', 0.0, 0.0, @curr_c_218, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Sanjeev', 'Katyal', 'no-email-dl-219@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_219 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805207194374701', 'Miscellaneous Insurance', NULL, NULL, '2026-02-19', '2027-02-19', '1970-01-01', 0.0, 0.0, @curr_c_219, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Anusha', 'Madhan Kumar', 'no-email-dl-220@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_220 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4193i/APRN/332027691/02/000', 'Miscellaneous Insurance', NULL, NULL, '2026-02-28', '2027-02-28', '1970-01-01', 0.0, 0.0, @curr_c_220, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'UPENDRA RANJIT SINGH', 'no-email-dl-221@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_221 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10995475', 'Miscellaneous Insurance', NULL, NULL, '2026-02-12', '2027-02-12', '1970-01-01', 0.0, 0.0, @curr_c_221, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Vikas', 'E', 'no-email-dl-222@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_222 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-20-3825871-05', 'Miscellaneous Insurance', NULL, NULL, '2026-02-25', '2027-02-25', '1970-01-01', 0.0, 0.0, @curr_c_222, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ashok', 'Kumar Dhamija', 'no-email-dl-223@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_223 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805207157920601', 'Miscellaneous Insurance', NULL, NULL, '2026-02-06', '2027-02-06', '1970-01-01', 0.0, 0.0, @curr_c_223, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Dhananjay', 'Dheeraj', 'no-email-dl-224@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_224 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805203720231305', 'Miscellaneous Insurance', NULL, NULL, '2026-02-12', '2027-02-12', '1970-01-01', 0.0, 0.0, @curr_c_224, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Anjana', 'Ashwani Sharma', 'no-email-dl-225@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_225 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('95688711', 'Miscellaneous Insurance', NULL, NULL, '2026-02-02', '2027-02-02', '1970-01-01', 0.0, 0.0, @curr_c_225, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'AVINASH KUMAR', 'no-email-dl-226@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_226 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('76258322', 'Miscellaneous Insurance', NULL, NULL, '2026-01-02', '2027-01-02', '1970-01-01', 0.0, 0.0, @curr_c_226, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'T SRINIVAS KUMAR', 'no-email-dl-227@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_227 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('77309461', 'Miscellaneous Insurance', NULL, NULL, '2026-01-08', '2027-01-08', '1970-01-01', 0.0, 0.0, @curr_c_227, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'RAMESH SHIVSHANKAR', 'no-email-dl-228@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_228 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11950997', 'Miscellaneous Insurance', NULL, NULL, '2026-01-16', '2028-01-17', '1970-01-01', 0.0, 0.0, @curr_c_228, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'ABDUL HAMEED', 'no-email-dl-229@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_229 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('37557203', 'Miscellaneous Insurance', NULL, NULL, '2026-01-18', '2027-01-18', '1970-01-01', 0.0, 0.0, @curr_c_229, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS', 'Shampa Tarafder', 'no-email-dl-230@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_230 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('60913508', 'Miscellaneous Insurance', NULL, NULL, '2026-01-18', '2027-01-18', '1970-01-01', 0.0, 0.0, @curr_c_230, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Amol Dilip Marathe', 'no-email-dl-231@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_231 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('78158552', 'Miscellaneous Insurance', NULL, NULL, '2026-01-24', '2027-01-24', '1970-01-01', 0.0, 0.0, @curr_c_231, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Devashish Oberoi', 'no-email-dl-232@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_232 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('78080594', 'Miscellaneous Insurance', NULL, NULL, '2026-01-27', '2027-01-27', '1970-01-01', 0.0, 0.0, @curr_c_232, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Ajit .', 'no-email-dl-233@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_233 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('61346069', 'Miscellaneous Insurance', NULL, NULL, '2026-01-27', '2027-01-27', '1970-01-01', 0.0, 0.0, @curr_c_233, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'RAVI TEJA ANNE', 'no-email-dl-234@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_234 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('60513660', 'Miscellaneous Insurance', NULL, NULL, '2026-01-28', '2027-01-28', '1970-01-01', 0.0, 0.0, @curr_c_234, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('YOGESH', 'ARUN DAHATONDE', 'no-email-dl-235@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_235 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5599111907082266', 'Miscellaneous Insurance', NULL, NULL, '2026-01-01', '2027-01-01', '1970-01-01', 0.0, 0.0, @curr_c_235, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MUDAHADU', 'UPENDRA', 'no-email-dl-236@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_236 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9237111907072644', 'Miscellaneous Insurance', NULL, NULL, '2026-01-01', '2027-01-01', '1970-01-01', 0.0, 0.0, @curr_c_236, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANUJA', 'NIYOGI', 'no-email-dl-237@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_237 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6704111907003488', 'Miscellaneous Insurance', NULL, NULL, '2026-01-01', '2027-01-01', '1970-01-01', 0.0, 0.0, @curr_c_237, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VISHAL', 'RAMCHANDRA SHINDE', 'no-email-dl-238@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_238 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2077111907120109', 'Miscellaneous Insurance', NULL, NULL, '2026-01-02', '2028-01-03', '1970-01-01', 0.0, 0.0, @curr_c_238, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DR', 'BUDHA PRAKASH', 'no-email-dl-239@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_239 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5892111907071397', 'Miscellaneous Insurance', NULL, NULL, '2026-01-02', '2027-01-02', '1970-01-01', 0.0, 0.0, @curr_c_239, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ZARINE', 'KARIM KAPADIA', 'no-email-dl-240@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_240 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3188111807053726', 'Miscellaneous Insurance', NULL, NULL, '2026-01-03', '2027-01-03', '1970-01-01', 0.0, 0.0, @curr_c_240, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR.PATEL', 'KANUBHAI AMBALAL', 'no-email-dl-241@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_241 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4074111807078458', 'Miscellaneous Insurance', NULL, NULL, '2026-01-03', '2027-01-03', '1970-01-01', 0.0, 0.0, @curr_c_241, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('TEJ', 'NARAYAN SINGH', 'no-email-dl-242@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_242 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8667111808084449', 'Miscellaneous Insurance', NULL, NULL, '2026-01-04', '2027-01-04', '1970-01-01', 0.0, 0.0, @curr_c_242, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SAURABH', 'Y BHAGADKAR', 'no-email-dl-243@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_243 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4038111907072155', 'Miscellaneous Insurance', NULL, NULL, '2026-01-04', '2027-01-04', '1970-01-01', 0.0, 0.0, @curr_c_243, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1005161907070929', 'Miscellaneous Insurance', NULL, NULL, '2026-01-04', '2028-01-05', '1970-01-01', 0.0, 0.0, @curr_c_243, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('L.NATARAJAN', '', 'no-email-dl-245@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_245 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7231112105075354', 'Miscellaneous Insurance', NULL, NULL, '2026-01-04', '2027-01-04', '1970-01-01', 0.0, 0.0, @curr_c_245, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PANKAJ', 'KUMAR', 'no-email-dl-246@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_246 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5570111904319536', 'Miscellaneous Insurance', NULL, NULL, '2026-01-04', '2027-01-04', '1970-01-01', 0.0, 0.0, @curr_c_246, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('A.VENU', 'MADHAV', 'no-email-dl-247@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_247 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5182112006086123', 'Miscellaneous Insurance', NULL, NULL, '2026-01-04', '2027-01-04', '1970-01-01', 0.0, 0.0, @curr_c_247, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('THULASIDHARA', 'SUVARNA', 'no-email-dl-248@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_248 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6181111907003576', 'Miscellaneous Insurance', NULL, NULL, '2026-01-05', '2027-01-05', '1970-01-01', 0.0, 0.0, @curr_c_248, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Bishal', 'Bhujel', 'no-email-dl-249@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_249 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5389111709010035', 'Miscellaneous Insurance', NULL, NULL, '2026-01-06', '2027-01-06', '1970-01-01', 0.0, 0.0, @curr_c_249, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ram', 'Bahadur Chettri', 'no-email-dl-250@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_250 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2178111709096643', 'Miscellaneous Insurance', NULL, NULL, '2026-01-06', '2027-01-06', '1970-01-01', 0.0, 0.0, @curr_c_250, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Sageer', 'Hussain', 'no-email-dl-251@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_251 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2840112006002626', 'Miscellaneous Insurance', NULL, NULL, '2026-01-06', '2027-01-06', '1970-01-01', 0.0, 0.0, @curr_c_251, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6321112006028281', 'Miscellaneous Insurance', NULL, NULL, '2026-01-06', '2027-01-06', '1970-01-01', 0.0, 0.0, @curr_c_251, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Kapil', 'Gite', 'no-email-dl-253@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_253 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3828111907096150', 'Miscellaneous Insurance', NULL, NULL, '2026-01-07', '2027-01-07', '1970-01-01', 0.0, 0.0, @curr_c_253, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAKESH', 'KUMAR', 'no-email-dl-254@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_254 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4454111907043977', 'Miscellaneous Insurance', NULL, NULL, '2026-01-07', '2027-01-07', '1970-01-01', 0.0, 0.0, @curr_c_254, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAKESH', 'MAHALA', 'no-email-dl-255@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_255 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5228111907095270', 'Miscellaneous Insurance', NULL, NULL, '2026-01-08', '2027-01-08', '1970-01-01', 0.0, 0.0, @curr_c_255, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DEEPAK', 'VADERA', 'no-email-dl-256@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_256 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7043111907065906', 'Miscellaneous Insurance', NULL, NULL, '2026-01-08', '2027-01-08', '1970-01-01', 0.0, 0.0, @curr_c_256, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('JOSEPH', 'ROBERT PRAVEEN. D', 'no-email-dl-257@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_257 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6258162501095606', 'Miscellaneous Insurance', NULL, NULL, '2026-01-08', '2027-01-08', '1970-01-01', 0.0, 0.0, @curr_c_257, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SEEMA', 'WALIA', 'no-email-dl-258@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_258 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1801111907033321', 'Miscellaneous Insurance', NULL, NULL, '2026-01-08', '2027-01-08', '1970-01-01', 0.0, 0.0, @curr_c_258, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('YOGESH', 'RAJPUT', 'no-email-dl-259@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_259 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3169111907041997', 'Miscellaneous Insurance', NULL, NULL, '2026-01-09', '2027-01-09', '1970-01-01', 0.0, 0.0, @curr_c_259, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DHIRENDER', 'MANDAN', 'no-email-dl-260@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_260 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1873111907005832', 'Miscellaneous Insurance', NULL, NULL, '2026-01-09', '2027-01-09', '1970-01-01', 0.0, 0.0, @curr_c_260, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MANOJ', 'KUMAR JAIN', 'no-email-dl-261@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_261 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2248112105096840', 'Miscellaneous Insurance', NULL, NULL, '2026-01-09', '2027-01-09', '1970-01-01', 0.0, 0.0, @curr_c_261, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUNNY', 'GUPTA', 'no-email-dl-262@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_262 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9714112402012940', 'Miscellaneous Insurance', NULL, NULL, '2026-01-10', '2027-01-10', '1970-01-01', 0.0, 0.0, @curr_c_262, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SHANKUL', 'ARVIND CHHEDA', 'no-email-dl-263@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_263 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8275112006047385', 'Miscellaneous Insurance', NULL, NULL, '2026-01-10', '2027-01-10', '1970-01-01', 0.0, 0.0, @curr_c_263, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUSHIL', 'KUMAR', 'no-email-dl-264@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_264 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8325111907034948', 'Miscellaneous Insurance', NULL, NULL, '2026-01-10', '2027-01-10', '1970-01-01', 0.0, 0.0, @curr_c_264, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('C', 'GOPI', 'no-email-dl-265@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_265 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9950112006078330', 'Miscellaneous Insurance', NULL, NULL, '2026-01-11', '2027-01-11', '1970-01-01', 0.0, 0.0, @curr_c_265, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANANT', 'VASUDEV PEDNEKAR', 'no-email-dl-266@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_266 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6334111808084427', 'Miscellaneous Insurance', NULL, NULL, '2026-01-11', '2027-01-11', '1970-01-01', 0.0, 0.0, @curr_c_266, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DIKSHA', 'MALHAN', 'no-email-dl-267@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_267 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5776112203439471', 'Miscellaneous Insurance', NULL, NULL, '2026-01-11', '2027-01-11', '1970-01-01', 0.0, 0.0, @curr_c_267, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('GUPTA', 'ROSHAN KUMAR RAJESH BHAI', 'no-email-dl-268@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_268 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4817112105048035', 'Miscellaneous Insurance', NULL, NULL, '2026-01-11', '2027-01-11', '1970-01-01', 0.0, 0.0, @curr_c_268, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('M', 'CHITRADEVI', 'no-email-dl-269@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_269 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2909111709012275', 'Miscellaneous Insurance', NULL, NULL, '2026-01-11', '2027-01-11', '1970-01-01', 0.0, 0.0, @curr_c_269, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('AJEET', 'MISHRA', 'no-email-dl-270@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_270 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4389111808017624', 'Miscellaneous Insurance', NULL, NULL, '2026-01-11', '2027-01-11', '1970-01-01', 0.0, 0.0, @curr_c_270, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('N.MD.', 'NAZEER AHAMED', 'no-email-dl-271@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_271 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5494111907018868', 'Miscellaneous Insurance', NULL, NULL, '2026-01-11', '2027-01-11', '1970-01-01', 0.0, 0.0, @curr_c_271, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SHIVA', 'KUMAR M J', 'no-email-dl-272@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_272 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3026111907069485', 'Miscellaneous Insurance', NULL, NULL, '2026-01-11', '2027-01-11', '1970-01-01', 0.0, 0.0, @curr_c_272, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KAMINI', 'GANESH TAMBE', 'no-email-dl-273@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_273 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1989111808057348', 'Miscellaneous Insurance', NULL, NULL, '2026-01-12', '2027-01-12', '1970-01-01', 0.0, 0.0, @curr_c_273, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7086112203064951', 'Miscellaneous Insurance', NULL, NULL, '2026-01-12', '2027-01-12', '1970-01-01', 0.0, 0.0, @curr_c_267, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KIRAN', 'M R', 'no-email-dl-275@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_275 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4955112204000285', 'Miscellaneous Insurance', NULL, NULL, '2026-01-12', '2027-01-12', '1970-01-01', 0.0, 0.0, @curr_c_275, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUDHIR', 'KUMAR', 'no-email-dl-276@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_276 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1544111808032725', 'Miscellaneous Insurance', NULL, NULL, '2026-01-12', '2027-01-12', '1970-01-01', 0.0, 0.0, @curr_c_276, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('NANDKISHOR', 'KISHOR SONI', 'no-email-dl-277@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_277 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3589111907063811', 'Miscellaneous Insurance', NULL, NULL, '2026-01-14', '2027-01-14', '1970-01-01', 0.0, 0.0, @curr_c_277, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DUSHYANT', 'KUMAR', 'no-email-dl-278@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_278 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7893111907075283', 'Miscellaneous Insurance', NULL, NULL, '2026-01-15', '2027-01-15', '1970-01-01', 0.0, 0.0, @curr_c_278, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ALOK', 'CHANDRAKANT SUGANDHI', 'no-email-dl-279@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_279 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1181111907000492', 'Miscellaneous Insurance', NULL, NULL, '2026-01-16', '2027-01-16', '1970-01-01', 0.0, 0.0, @curr_c_279, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MANOJ', 'KUMAR', 'no-email-dl-280@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_280 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4807111907055999', 'Miscellaneous Insurance', NULL, NULL, '2026-01-16', '2027-01-16', '1970-01-01', 0.0, 0.0, @curr_c_280, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('NAVYA', 'KAYAKAKULA', 'no-email-dl-281@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_281 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1170111907090999', 'Miscellaneous Insurance', NULL, NULL, '2026-01-16', '2027-01-16', '1970-01-01', 0.0, 0.0, @curr_c_281, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('BHAGYASHEELA', 'CHANDRAKANT DESAI', 'no-email-dl-282@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_282 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1384112204095593', 'Miscellaneous Insurance', NULL, NULL, '2026-01-17', '2027-01-17', '1970-01-01', 0.0, 0.0, @curr_c_282, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SRINIVASULU', 'RAMADASS', 'no-email-dl-283@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_283 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1641111808211355', 'Miscellaneous Insurance', NULL, NULL, '2026-01-18', '2027-01-18', '1970-01-01', 0.0, 0.0, @curr_c_283, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('AADIMOOLAM', 'VASUDEVA RAO', 'no-email-dl-284@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_284 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2139111808464939', 'Miscellaneous Insurance', NULL, NULL, '2026-01-18', '2027-01-18', '1970-01-01', 0.0, 0.0, @curr_c_284, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MAGAM', 'NAGESWARA  RAO', 'no-email-dl-285@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_285 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3412112204012573', 'Miscellaneous Insurance', NULL, NULL, '2026-01-19', '2027-01-19', '1970-01-01', 0.0, 0.0, @curr_c_285, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('NIRMIT', 'KAPOOR', 'no-email-dl-286@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_286 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2817111907034126', 'Miscellaneous Insurance', NULL, NULL, '2026-01-19', '2027-01-19', '1970-01-01', 0.0, 0.0, @curr_c_286, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KARAN', 'SHAW', 'no-email-dl-287@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_287 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4650111907029882', 'Miscellaneous Insurance', NULL, NULL, '2026-01-20', '2027-01-20', '1970-01-01', 0.0, 0.0, @curr_c_287, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KHUSHBOO', 'KUMARI', 'no-email-dl-288@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_288 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7499111906099856', 'Miscellaneous Insurance', NULL, NULL, '2026-01-20', '2027-01-20', '1970-01-01', 0.0, 0.0, @curr_c_288, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('AMARDEEP', 'SHASHIKANT SHINGE', 'no-email-dl-289@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_289 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2773111907022255', 'Miscellaneous Insurance', NULL, NULL, '2026-01-21', '2027-01-21', '1970-01-01', 0.0, 0.0, @curr_c_289, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PANKAJ', 'JAIN', 'no-email-dl-290@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_290 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8193111907019655', 'Miscellaneous Insurance', NULL, NULL, '2026-01-21', '2027-01-21', '1970-01-01', 0.0, 0.0, @curr_c_290, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8629111907085737', 'Miscellaneous Insurance', NULL, NULL, '2026-01-21', '2027-01-21', '1970-01-01', 0.0, 0.0, @curr_c_287, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUNIL', 'KARNOOR', 'no-email-dl-292@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_292 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9557112204067085', 'Miscellaneous Insurance', NULL, NULL, '2026-01-21', '2027-01-21', '1970-01-01', 0.0, 0.0, @curr_c_292, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DINESH', 'HASTIMAL JAIN', 'no-email-dl-293@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_293 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7136111907021555', 'Miscellaneous Insurance', NULL, NULL, '2026-01-21', '2027-01-21', '1970-01-01', 0.0, 0.0, @curr_c_293, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('BHAGWAN', 'KONDAJI KHATALE', 'no-email-dl-294@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_294 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1146112402081791', 'Miscellaneous Insurance', NULL, NULL, '2026-01-22', '2027-01-22', '1970-01-01', 0.0, 0.0, @curr_c_294, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUNITA', 'KUMARI', 'no-email-dl-295@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_295 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4414112006027673', 'Miscellaneous Insurance', NULL, NULL, '2026-01-22', '2027-01-22', '1970-01-01', 0.0, 0.0, @curr_c_295, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANITHA', 'R .', 'no-email-dl-296@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_296 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1086112501062142', 'Miscellaneous Insurance', NULL, NULL, '2026-01-23', '2027-01-23', '1970-01-01', 0.0, 0.0, @curr_c_296, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANIL', 'KUMAR ADAPALA', 'no-email-dl-297@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_297 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6510111907061496', 'Miscellaneous Insurance', NULL, NULL, '2026-01-23', '2027-01-23', '1970-01-01', 0.0, 0.0, @curr_c_297, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DEVKINANDAN', 'SHARDA', 'no-email-dl-298@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_298 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7504112006040318', 'Miscellaneous Insurance', NULL, NULL, '2026-01-23', '2027-01-23', '1970-01-01', 0.0, 0.0, @curr_c_298, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANOOP', 'SAXSENA', 'no-email-dl-299@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_299 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8623111808052080', 'Miscellaneous Insurance', NULL, NULL, '2026-01-23', '2027-01-23', '1970-01-01', 0.0, 0.0, @curr_c_299, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR.ANDREW.S.JOHN', '', 'no-email-dl-300@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_300 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8558111708002489', 'Miscellaneous Insurance', NULL, NULL, '2026-01-24', '2027-01-24', '1970-01-01', 0.0, 0.0, @curr_c_300, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANURADHA', 'EFFIE FERNANDES', 'no-email-dl-301@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_301 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5770111904207697', 'Miscellaneous Insurance', NULL, NULL, '2026-01-24', '2027-01-24', '1970-01-01', 0.0, 0.0, @curr_c_301, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SANJEEV', 'KUMAR CHOUDHARY', 'no-email-dl-302@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_302 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7223111907015450', 'Miscellaneous Insurance', NULL, NULL, '2026-01-24', '2027-01-24', '1970-01-01', 0.0, 0.0, @curr_c_302, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('NANDKUMAR', 'GOVIND KUMBHAR', 'no-email-dl-303@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_303 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7949112006014883', 'Miscellaneous Insurance', NULL, NULL, '2026-01-27', '2027-01-27', '1970-01-01', 0.0, 0.0, @curr_c_303, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9957112204078951', 'Miscellaneous Insurance', NULL, NULL, '2026-01-27', '2027-01-27', '1970-01-01', 0.0, 0.0, @curr_c_257, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KARTHIK', 'T.G.', 'no-email-dl-305@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_305 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3028112006061549', 'Miscellaneous Insurance', NULL, NULL, '2026-01-27', '2027-01-27', '1970-01-01', 0.0, 0.0, @curr_c_305, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DINESH', 'RASIKLAL SONI', 'no-email-dl-306@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_306 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5838112204032167', 'Miscellaneous Insurance', NULL, NULL, '2026-01-28', '2027-01-28', '1970-01-01', 0.0, 0.0, @curr_c_306, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ZEENATAYESHA', '', 'no-email-dl-307@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_307 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5372111907030740', 'Miscellaneous Insurance', NULL, NULL, '2026-01-30', '2027-01-30', '1970-01-01', 0.0, 0.0, @curr_c_307, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SANJAY', 'KUMAR JAYASWAL', 'no-email-dl-308@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_308 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2747112105061190', 'Miscellaneous Insurance', NULL, NULL, '2026-01-31', '2027-01-31', '1970-01-01', 0.0, 0.0, @curr_c_308, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAMSAGAR', 'RAJENDRA SHUKLA', 'no-email-dl-309@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_309 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3393112105022080', 'Miscellaneous Insurance', NULL, NULL, '2026-01-31', '2027-01-31', '1970-01-01', 0.0, 0.0, @curr_c_309, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Mohammed Rizwan Ahmad', 'no-email-dl-310@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_310 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('34718403', 'Miscellaneous Insurance', NULL, NULL, '2026-01-05', '2027-01-05', '1970-01-01', 0.0, 0.0, @curr_c_310, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Suneel', 'Venkata Kandula', 'no-email-dl-311@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_311 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805203567919206', 'Miscellaneous Insurance', NULL, NULL, '2026-01-05', '2027-01-05', '1970-01-01', 0.0, 0.0, @curr_c_311, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAVI', 'RAVI TEJA', 'no-email-dl-312@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_312 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('32954858202603', 'Miscellaneous Insurance', NULL, NULL, '2026-01-06', '2027-01-06', '1970-01-01', 0.0, 0.0, @curr_c_312, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Megha', 'Sachin Narnaware', 'no-email-dl-313@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_313 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('920222628680011586', 'Miscellaneous Insurance', NULL, NULL, '2026-01-06', '2027-01-06', '1970-01-01', 0.0, 0.0, @curr_c_313, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ms', 'Shashi Rawat', 'no-email-dl-314@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_314 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10860278', 'Miscellaneous Insurance', NULL, NULL, '2026-01-07', '2027-01-07', '1970-01-01', 0.0, 0.0, @curr_c_314, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Sourabh', 'Rathore', 'no-email-dl-315@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_315 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('32967386202603', 'Miscellaneous Insurance', NULL, NULL, '2026-01-11', '2027-01-11', '1970-01-01', 0.0, 0.0, @curr_c_315, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VARUN', 'M NAIR', 'no-email-dl-316@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_316 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805207106734401', 'Miscellaneous Insurance', NULL, NULL, '2026-01-12', '2027-01-12', '1970-01-01', 0.0, 0.0, @curr_c_316, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Shivam Kumar Kesarwani', 'no-email-dl-317@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_317 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('19756286', 'Miscellaneous Insurance', NULL, NULL, '2026-01-13', '2027-01-13', '1970-01-01', 0.0, 0.0, @curr_c_317, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MD', 'AYAZ AHMAD', 'no-email-dl-318@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_318 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('920222628680036860', 'Miscellaneous Insurance', NULL, NULL, '2026-01-14', '2027-01-14', '1970-01-01', 0.0, 0.0, @curr_c_318, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Parveen', 'Kumar Rai', 'no-email-dl-319@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_319 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('12-20-0091277-05', 'Miscellaneous Insurance', NULL, NULL, '2026-01-15', '2027-01-15', '1970-01-01', 0.0, 0.0, @curr_c_319, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ms', 'Rajni Ratan', 'no-email-dl-320@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_320 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11934992', 'Miscellaneous Insurance', NULL, NULL, '2026-01-17', '2027-01-17', '1970-01-01', 0.0, 0.0, @curr_c_320, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MOHIT', 'JAIN', 'no-email-dl-321@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_321 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('32988852202603', 'Miscellaneous Insurance', NULL, NULL, '2026-01-23', '2027-01-23', '1970-01-01', 0.0, 0.0, @curr_c_321, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ARCHANA', 'ROY', 'no-email-dl-322@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_322 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('32991071202603', 'Miscellaneous Insurance', NULL, NULL, '2026-01-24', '2027-01-24', '1970-01-01', 0.0, 0.0, @curr_c_322, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Shrimali Hiteshkumar Dineshchandra', 'no-email-dl-323@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_323 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('61206640', 'Miscellaneous Insurance', NULL, NULL, '2026-01-25', '2027-01-25', '1970-01-01', 0.0, 0.0, @curr_c_323, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Shazad', 'Keki Kavarana', 'no-email-dl-324@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_324 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805203553002306', 'Miscellaneous Insurance', NULL, NULL, '2026-01-26', '2027-01-26', '1970-01-01', 0.0, 0.0, @curr_c_324, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Tshering', 'Yangchen Bhutia', 'no-email-dl-325@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_325 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('31093536202605', 'Miscellaneous Insurance', NULL, NULL, '2026-01-28', '2027-01-28', '1970-01-01', 0.0, 0.0, @curr_c_325, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Habibur Rahaman Syed', 'no-email-dl-326@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_326 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10975146', 'Miscellaneous Insurance', NULL, NULL, '2026-01-29', '2029-01-29', '1970-01-01', 0.0, 0.0, @curr_c_326, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Vijay', 'Hiraman Gangurde', 'no-email-dl-327@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_327 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('31539864202605', 'Miscellaneous Insurance', NULL, NULL, '2026-01-30', '2027-01-30', '1970-01-01', 0.0, 0.0, @curr_c_327, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Gaurav', 'Sharma', 'no-email-dl-328@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_328 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2866100273087006', 'Miscellaneous Insurance', NULL, NULL, '2026-01-30', '2027-01-30', '1970-01-01', 0.0, 0.0, @curr_c_328, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'CHANDAN CHATTERJEE', 'no-email-dl-329@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_329 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10987205', 'Miscellaneous Insurance', NULL, NULL, '2026-01-30', '2027-01-30', '1970-01-01', 0.0, 0.0, @curr_c_329, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('B', 'RAJASHREE', 'no-email-dl-330@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_330 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1705111907089966', 'Miscellaneous Insurance', NULL, NULL, '2025-12-01', '2026-12-01', '1970-01-01', 0.0, 0.0, @curr_c_330, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('AJAY', 'KUMAR JHA', 'no-email-dl-331@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_331 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5591111907075006', 'Miscellaneous Insurance', NULL, NULL, '2025-12-01', '2026-12-01', '1970-01-01', 0.0, 0.0, @curr_c_331, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DEVADAS', 'A KUDALKAR', 'no-email-dl-332@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_332 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8503111907030873', 'Miscellaneous Insurance', NULL, NULL, '2025-12-01', '2026-12-01', '1970-01-01', 0.0, 0.0, @curr_c_332, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('FIRDAUS', 'FATIMA MOHD SHAKEEL SAYYED', 'no-email-dl-333@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_333 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5027111709018999', 'Miscellaneous Insurance', NULL, NULL, '2025-12-02', '2026-12-02', '1970-01-01', 0.0, 0.0, @curr_c_333, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('NITESH', 'DNYANESHWAR PATIL', 'no-email-dl-334@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_334 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1746112204087696', 'Miscellaneous Insurance', NULL, NULL, '2025-12-02', '2026-12-02', '1970-01-01', 0.0, 0.0, @curr_c_334, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('BICHITRANANDA', 'NAYAK', 'no-email-dl-335@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_335 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6528111907098101', 'Miscellaneous Insurance', NULL, NULL, '2025-12-03', '2026-12-03', '1970-01-01', 0.0, 0.0, @curr_c_335, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAJESH', 'BHARGAVA', 'no-email-dl-336@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_336 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6027111808092485', 'Miscellaneous Insurance', NULL, NULL, '2025-12-03', '2026-12-03', '1970-01-01', 0.0, 0.0, @curr_c_336, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DEVENDRAN', 'K', 'no-email-dl-337@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_337 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5452112005034469', 'Miscellaneous Insurance', NULL, NULL, '2025-12-04', '2026-12-04', '1970-01-01', 0.0, 0.0, @curr_c_337, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ARVIND', 'KUMAR GUPTA', 'no-email-dl-338@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_338 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8374162501042349', 'Miscellaneous Insurance', NULL, NULL, '2025-12-04', '2026-12-04', '1970-01-01', 0.0, 0.0, @curr_c_338, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ASHISH', 'BATHAM', 'no-email-dl-339@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_339 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9777111709066785', 'Miscellaneous Insurance', NULL, NULL, '2025-12-04', '2026-12-04', '1970-01-01', 0.0, 0.0, @curr_c_339, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANANTH', 'GRAMA', 'no-email-dl-340@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_340 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1722162501046943', 'Miscellaneous Insurance', NULL, NULL, '2025-12-04', '2026-12-04', '1970-01-01', 0.0, 0.0, @curr_c_340, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KUNAL', 'KAILAS KATHE', 'no-email-dl-341@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_341 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5424111907068069', 'Miscellaneous Insurance', NULL, NULL, '2025-12-04', '2026-12-04', '1970-01-01', 0.0, 0.0, @curr_c_341, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('AMIT', 'KUMAR KASHYAP', 'no-email-dl-342@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_342 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8536112204016424', 'Miscellaneous Insurance', NULL, NULL, '2025-12-06', '2026-12-06', '1970-01-01', 0.0, 0.0, @curr_c_342, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('NEERAJ', 'SHARMA', 'no-email-dl-343@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_343 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9331111705213419', 'Miscellaneous Insurance', NULL, NULL, '2025-12-08', '2026-12-08', '1970-01-01', 0.0, 0.0, @curr_c_343, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MRINAL', 'DUGAR', 'no-email-dl-344@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_344 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1127111804212454', 'Miscellaneous Insurance', NULL, NULL, '2025-12-08', '2026-12-08', '1970-01-01', 0.0, 0.0, @curr_c_344, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('LIMBANATH', 'K SHINDE', 'no-email-dl-345@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_345 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6986112105075179', 'Miscellaneous Insurance', NULL, NULL, '2025-12-09', '2026-12-09', '1970-01-01', 0.0, 0.0, @curr_c_345, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Siddaraju', '', 'no-email-dl-346@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_346 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7886111903007203', 'Miscellaneous Insurance', NULL, NULL, '2025-12-10', '2026-12-10', '1970-01-01', 0.0, 0.0, @curr_c_346, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1450112105426180', 'Miscellaneous Insurance', NULL, NULL, '2025-12-11', '2026-12-11', '1970-01-01', 0.0, 0.0, @curr_c_338, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mikkilineni', 'Kamala Devi', 'no-email-dl-348@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_348 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9934112000023544', 'Miscellaneous Insurance', NULL, NULL, '2025-12-11', '2028-12-11', '1970-01-01', 0.0, 0.0, @curr_c_348, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Surya', 'Narayan Malli', 'no-email-dl-349@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_349 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7562111904213587', 'Miscellaneous Insurance', NULL, NULL, '2025-12-13', '2026-12-13', '1970-01-01', 0.0, 0.0, @curr_c_349, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr.MARADA', 'RAVI KUMAR', 'no-email-dl-350@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_350 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1290111607225679', 'Miscellaneous Insurance', NULL, NULL, '2025-12-13', '2026-12-13', '1970-01-01', 0.0, 0.0, @curr_c_350, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Subodh', 'Kumar Shaw', 'no-email-dl-351@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_351 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3370112105132535', 'Miscellaneous Insurance', NULL, NULL, '2025-12-14', '2026-12-14', '1970-01-01', 0.0, 0.0, @curr_c_351, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MOHAMMED', 'FAIZ UL HASAN', 'no-email-dl-352@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_352 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9260112204027862', 'Miscellaneous Insurance', NULL, NULL, '2025-12-15', '2026-12-15', '1970-01-01', 0.0, 0.0, @curr_c_352, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DEEPAK', 'HIRABHAI PATEL', 'no-email-dl-353@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_353 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7795112201019438', 'Miscellaneous Insurance', NULL, NULL, '2025-12-15', '2026-12-15', '1970-01-01', 0.0, 0.0, @curr_c_353, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('GURURAJ', 'RAO T', 'no-email-dl-354@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_354 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7229111709037458', 'Miscellaneous Insurance', NULL, NULL, '2025-12-15', '2026-12-15', '1970-01-01', 0.0, 0.0, @curr_c_354, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('BHAVI', 'NAGARANI', 'no-email-dl-355@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_355 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9592162501090390', 'Miscellaneous Insurance', NULL, NULL, '2025-12-15', '2026-12-15', '1970-01-01', 0.0, 0.0, @curr_c_355, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SURAJ', 'KUMAR', 'no-email-dl-356@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_356 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6957112006045240', 'Miscellaneous Insurance', NULL, NULL, '2025-12-16', '2026-12-16', '1970-01-01', 0.0, 0.0, @curr_c_356, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7232112204040638', 'Miscellaneous Insurance', NULL, NULL, '2025-12-16', '2026-12-16', '1970-01-01', 0.0, 0.0, @curr_c_355, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PASUPULETI', 'DORA SAI KIRAN', 'no-email-dl-358@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_358 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1442112501062174', 'Miscellaneous Insurance', NULL, NULL, '2025-12-16', '2026-12-16', '1970-01-01', 0.0, 0.0, @curr_c_358, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MRS.MONALI', 'GODE', 'no-email-dl-359@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_359 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3777111709273162', 'Miscellaneous Insurance', NULL, NULL, '2025-12-16', '2026-12-16', '1970-01-01', 0.0, 0.0, @curr_c_359, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PALANI', 'SAMI', 'no-email-dl-360@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_360 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4117111808031976', 'Miscellaneous Insurance', NULL, NULL, '2025-12-17', '2026-12-17', '1970-01-01', 0.0, 0.0, @curr_c_360, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SAGAR', 'DIXIT', 'no-email-dl-361@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_361 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4606111907082543', 'Miscellaneous Insurance', NULL, NULL, '2025-12-17', '2026-12-17', '1970-01-01', 0.0, 0.0, @curr_c_361, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAJAT', 'KUMAR SHAW', 'no-email-dl-362@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_362 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9421112105033584', 'Miscellaneous Insurance', NULL, NULL, '2025-12-18', '2026-12-18', '1970-01-01', 0.0, 0.0, @curr_c_362, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Tamali', 'Chakaraborty', 'no-email-dl-363@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_363 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9967111907067385', 'Miscellaneous Insurance', NULL, NULL, '2025-12-18', '2026-12-18', '1970-01-01', 0.0, 0.0, @curr_c_363, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ISTIYAK', 'KHAN', 'no-email-dl-364@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_364 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5647111907056502', 'Miscellaneous Insurance', NULL, NULL, '2025-12-18', '2026-12-18', '1970-01-01', 0.0, 0.0, @curr_c_364, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SURESH', 'AKYANA', 'no-email-dl-365@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_365 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7376111907020087', 'Miscellaneous Insurance', NULL, NULL, '2025-12-18', '2026-12-18', '1970-01-01', 0.0, 0.0, @curr_c_365, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KEDAR', 'BHIMRAO ROKADE', 'no-email-dl-366@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_366 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8191161907056131', 'Miscellaneous Insurance', NULL, NULL, '2025-12-18', '2026-12-18', '1970-01-01', 0.0, 0.0, @curr_c_366, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('V.M', 'SAGUNA', 'no-email-dl-367@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_367 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7350112006092190', 'Miscellaneous Insurance', NULL, NULL, '2025-12-18', '2026-12-18', '1970-01-01', 0.0, 0.0, @curr_c_367, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4706111907041785', 'Miscellaneous Insurance', NULL, NULL, '2025-12-18', '2026-12-18', '1970-01-01', 0.0, 0.0, @curr_c_363, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('YOJANA', 'ROKADE', 'no-email-dl-369@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_369 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3593161907008035', 'Miscellaneous Insurance', NULL, NULL, '2025-12-18', '2026-12-18', '1970-01-01', 0.0, 0.0, @curr_c_369, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VIJAY', 'VASANTRAO SONAWANE', 'no-email-dl-370@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_370 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3761111709098023', 'Miscellaneous Insurance', NULL, NULL, '2025-12-19', '2026-12-19', '1970-01-01', 0.0, 0.0, @curr_c_370, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('HARISH', 'SHARMA', 'no-email-dl-371@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_371 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3611111807266172', 'Miscellaneous Insurance', NULL, NULL, '2025-12-19', '2026-12-19', '1970-01-01', 0.0, 0.0, @curr_c_371, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KAMLESH', 'MAYWAD', 'no-email-dl-372@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_372 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1222111808012048', 'Miscellaneous Insurance', NULL, NULL, '2025-12-19', '2026-12-19', '1970-01-01', 0.0, 0.0, @curr_c_372, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2743111907082681', 'Miscellaneous Insurance', NULL, NULL, '2025-12-20', '2026-12-20', '1970-01-01', 0.0, 0.0, @curr_c_340, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('GULSHAN', 'KUMAR NANDA', 'no-email-dl-374@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_374 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4223111907074967', 'Miscellaneous Insurance', NULL, NULL, '2025-12-20', '2026-12-20', '1970-01-01', 0.0, 0.0, @curr_c_374, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PRATAP', 'KUMAR GOTTIMUKKALA', 'no-email-dl-375@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_375 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9533112006061639', 'Miscellaneous Insurance', NULL, NULL, '2025-12-21', '2026-12-21', '1970-01-01', 0.0, 0.0, @curr_c_375, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANURADHA', 'GOTTIMUKKALA', 'no-email-dl-376@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_376 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6450112006091345', 'Miscellaneous Insurance', NULL, NULL, '2025-12-21', '2026-12-21', '1970-01-01', 0.0, 0.0, @curr_c_376, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('BALIVADA', 'V RAMANA RAO', 'no-email-dl-377@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_377 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6298111907016930', 'Miscellaneous Insurance', NULL, NULL, '2025-12-21', '2026-12-21', '1970-01-01', 0.0, 0.0, @curr_c_377, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUDHANSHU', 'BHUSHAN MOHANTY', 'no-email-dl-378@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_378 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1493112105029199', 'Miscellaneous Insurance', NULL, NULL, '2025-12-21', '2026-12-21', '1970-01-01', 0.0, 0.0, @curr_c_378, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr.BAPIN', 'GOCHHAYAT', 'no-email-dl-379@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_379 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1418111709021019', 'Miscellaneous Insurance', NULL, NULL, '2025-12-21', '2026-12-21', '1970-01-01', 0.0, 0.0, @curr_c_379, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MRS.NEELAKSHI', 'TYAGI', 'no-email-dl-380@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_380 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8902111808024190', 'Miscellaneous Insurance', NULL, NULL, '2025-12-21', '2026-12-21', '1970-01-01', 0.0, 0.0, @curr_c_380, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SIDDHARTHA', 'SAHA', 'no-email-dl-381@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_381 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6455112006072436', 'Miscellaneous Insurance', NULL, NULL, '2025-12-22', '2026-12-22', '1970-01-01', 0.0, 0.0, @curr_c_381, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUNIL', 'MALHARI JADHAV', 'no-email-dl-382@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_382 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2783112105028510', 'Miscellaneous Insurance', NULL, NULL, '2025-12-22', '2026-12-22', '1970-01-01', 0.0, 0.0, @curr_c_382, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KEDAR', 'NATH PANDEY', 'no-email-dl-383@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_383 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4108112006023720', 'Miscellaneous Insurance', NULL, NULL, '2025-12-23', '2026-12-23', '1970-01-01', 0.0, 0.0, @curr_c_383, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KAVALI', 'SATYANARAYANA MURTHY', 'no-email-dl-384@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_384 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1074112105057526', 'Miscellaneous Insurance', NULL, NULL, '2025-12-24', '2026-12-24', '1970-01-01', 0.0, 0.0, @curr_c_384, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DARSHAN', 'SHESHAWATAR SETTY', 'no-email-dl-385@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_385 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1632112006039306', 'Miscellaneous Insurance', NULL, NULL, '2025-12-25', '2026-12-25', '1970-01-01', 0.0, 0.0, @curr_c_385, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PARTHA', 'PROTIME BANERJEE', 'no-email-dl-386@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_386 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2482112105171233', 'Miscellaneous Insurance', NULL, NULL, '2025-12-25', '2026-12-25', '1970-01-01', 0.0, 0.0, @curr_c_386, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ABHISHEK', 'SRIVASTAVA', 'no-email-dl-387@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_387 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8514111808027454', 'Miscellaneous Insurance', NULL, NULL, '2025-12-25', '2026-12-25', '1970-01-01', 0.0, 0.0, @curr_c_387, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('A.SARAVANAN', '', 'no-email-dl-388@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_388 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6890112006067238', 'Miscellaneous Insurance', NULL, NULL, '2025-12-26', '2026-12-26', '1970-01-01', 0.0, 0.0, @curr_c_388, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('AJIT', 'KUMAR VERMA', 'no-email-dl-389@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_389 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8086112105012268', 'Miscellaneous Insurance', NULL, NULL, '2025-12-26', '2026-12-26', '1970-01-01', 0.0, 0.0, @curr_c_389, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('LOKESH', 'KUMAR', 'no-email-dl-390@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_390 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5492162204097875', 'Miscellaneous Insurance', NULL, NULL, '2025-12-26', '2026-12-26', '1970-01-01', 0.0, 0.0, @curr_c_390, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('BALAJI', 'NATARAJAN', 'no-email-dl-391@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_391 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8719112204048032', 'Miscellaneous Insurance', NULL, NULL, '2025-12-27', '2026-12-27', '1970-01-01', 0.0, 0.0, @curr_c_391, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('BINESH.M.R', '', 'no-email-dl-392@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_392 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4236112105036745', 'Miscellaneous Insurance', NULL, NULL, '2025-12-28', '2026-12-28', '1970-01-01', 0.0, 0.0, @curr_c_392, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SARATH', 'VN', 'no-email-dl-393@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_393 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3994111907089057', 'Miscellaneous Insurance', NULL, NULL, '2025-12-28', '2026-12-28', '1970-01-01', 0.0, 0.0, @curr_c_393, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('A', 'VENKATESHWAR REDDY', 'no-email-dl-394@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_394 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2554111709072576', 'Miscellaneous Insurance', NULL, NULL, '2025-12-28', '2026-12-28', '1970-01-01', 0.0, 0.0, @curr_c_394, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Krunal', 'Ghorpade', 'no-email-dl-395@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_395 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7494112201051004', 'Miscellaneous Insurance', NULL, NULL, '2025-12-29', '2028-12-29', '1970-01-01', 0.0, 0.0, @curr_c_395, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR.AMARA', 'PRAVEEN KUMAR', 'no-email-dl-396@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_396 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4629111709049249', 'Miscellaneous Insurance', NULL, NULL, '2025-12-29', '2026-12-29', '1970-01-01', 0.0, 0.0, @curr_c_396, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RIYA', 'BANERJEE', 'no-email-dl-397@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_397 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8826112105504950', 'Miscellaneous Insurance', NULL, NULL, '2025-12-29', '2026-12-29', '1970-01-01', 0.0, 0.0, @curr_c_397, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ABHINAVA', 'CHATTERJEE', 'no-email-dl-398@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_398 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8327111705299639', 'Miscellaneous Insurance', NULL, NULL, '2025-12-30', '2026-12-30', '1970-01-01', 0.0, 0.0, @curr_c_398, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('K.R', '.RAJAGOPALAN', 'no-email-dl-399@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_399 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2039112006000395', 'Miscellaneous Insurance', NULL, NULL, '2025-12-30', '2026-12-30', '1970-01-01', 0.0, 0.0, @curr_c_399, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ADARSH', 'SARAF', 'no-email-dl-400@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_400 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1155111907033654', 'Miscellaneous Insurance', NULL, NULL, '2025-12-30', '2026-12-30', '1970-01-01', 0.0, 0.0, @curr_c_400, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANKUR', 'KUMAR', 'no-email-dl-401@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_401 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8837112204084884', 'Miscellaneous Insurance', NULL, NULL, '2025-12-30', '2026-12-30', '1970-01-01', 0.0, 0.0, @curr_c_401, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SAMIR', 'KUMAR CHATTERJEE', 'no-email-dl-402@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_402 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8098112105077358', 'Miscellaneous Insurance', NULL, NULL, '2025-12-30', '2026-12-30', '1970-01-01', 0.0, 0.0, @curr_c_402, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Soni', 'Rajesh Penkar', 'no-email-dl-403@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_403 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4193i/APRN/319253388/02/000', 'Miscellaneous Insurance', NULL, NULL, '2025-12-01', '2026-12-01', '1970-01-01', 0.0, 0.0, @curr_c_403, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('BIJU', 'THOMAS', 'no-email-dl-404@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_404 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805206963770101', 'Miscellaneous Insurance', NULL, NULL, '2025-12-06', '2026-12-06', '1970-01-01', 0.0, 0.0, @curr_c_404, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Sanjay', 'Suresh Bansal', 'no-email-dl-405@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_405 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4128i/HEPNR/321386616/02/000', 'Miscellaneous Insurance', NULL, NULL, '2025-12-06', '2026-12-06', '1970-01-01', 0.0, 0.0, @curr_c_405, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'SUNIL ASHOKRAO AMBILWADE', 'no-email-dl-406@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_406 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('93388198', 'Miscellaneous Insurance', NULL, NULL, '2025-12-06', '2026-12-06', '1970-01-01', 0.0, 0.0, @curr_c_406, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'VISHAL CHITKARA', 'no-email-dl-407@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_407 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('79144436', 'Miscellaneous Insurance', NULL, NULL, '2025-12-07', '2026-12-07', '1970-01-01', 0.0, 0.0, @curr_c_407, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS', 'Sonia Sonia', 'no-email-dl-408@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_408 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10896050', 'Miscellaneous Insurance', NULL, NULL, '2025-12-07', '2027-12-08', '1970-01-01', 0.0, 0.0, @curr_c_408, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'RAKESH KUMAR JHA', 'no-email-dl-409@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_409 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('18901694', 'Miscellaneous Insurance', NULL, NULL, '2025-12-07', '2026-12-07', '1970-01-01', 0.0, 0.0, @curr_c_409, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Unmesh', 'Ramesh Kulkarni', 'no-email-dl-410@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_410 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33601497202502', 'Miscellaneous Insurance', NULL, NULL, '2025-12-09', '2026-12-09', '1970-01-01', 0.0, 0.0, @curr_c_410, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAJENDRA', 'SINGH BISHT', 'no-email-dl-411@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_411 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805206981854401001', 'Miscellaneous Insurance', NULL, NULL, '2025-12-10', '2026-12-10', '1970-01-01', 0.0, 0.0, @curr_c_411, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Venkatesh Ragunathan', 'no-email-dl-412@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_412 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('49195963', 'Miscellaneous Insurance', NULL, NULL, '2025-12-10', '2026-12-10', '1970-01-01', 0.0, 0.0, @curr_c_412, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'SATISH SHARMA', 'no-email-dl-413@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_413 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10873818', 'Miscellaneous Insurance', NULL, NULL, '2025-12-11', '2026-12-11', '1970-01-01', 0.0, 0.0, @curr_c_413, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('94028911', 'Miscellaneous Insurance', NULL, NULL, '2025-12-11', '2026-12-11', '1970-01-01', 0.0, 0.0, @curr_c_413, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Souveek', 'Ray', 'no-email-dl-415@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_415 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33610223202502', 'Miscellaneous Insurance', NULL, NULL, '2025-12-12', '2026-12-12', '1970-01-01', 0.0, 0.0, @curr_c_415, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Smita', 'P Mukherjee', 'no-email-dl-416@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_416 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('PROPRM050066855', 'Miscellaneous Insurance', NULL, NULL, '2025-12-14', '2026-12-14', '1970-01-01', 0.0, 0.0, @curr_c_416, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'SOMNATH MISHRA', 'no-email-dl-417@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_417 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10911156', 'Miscellaneous Insurance', NULL, NULL, '2025-12-15', '2026-12-15', '1970-01-01', 0.0, 0.0, @curr_c_417, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'RAKESH RAMESH DALMIA', 'no-email-dl-418@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_418 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('74701357', 'Miscellaneous Insurance', NULL, NULL, '2025-12-23', '2026-12-23', '1970-01-01', 0.0, 0.0, @curr_c_418, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'GIRIN PAREKH', 'no-email-dl-419@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_419 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('19019773', 'Miscellaneous Insurance', NULL, NULL, '2025-12-23', '2026-12-23', '1970-01-01', 0.0, 0.0, @curr_c_419, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Kumar Gaurav', 'no-email-dl-420@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_420 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('74833214', 'Miscellaneous Insurance', NULL, NULL, '2025-12-23', '2026-12-23', '1970-01-01', 0.0, 0.0, @curr_c_420, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ALOK', 'JAIN', 'no-email-dl-421@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_421 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2866100396094507', 'Miscellaneous Insurance', NULL, NULL, '2025-12-24', '2026-12-24', '1970-01-01', 0.0, 0.0, @curr_c_421, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SANJEEV', 'LAKHANI', 'no-email-dl-422@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_422 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805203554580406', 'Miscellaneous Insurance', NULL, NULL, '2025-12-26', '2026-12-26', '1970-01-01', 0.0, 0.0, @curr_c_422, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Brajesh Maurya', 'no-email-dl-423@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_423 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10929636', 'Miscellaneous Insurance', NULL, NULL, '2025-12-27', '2026-12-27', '1970-01-01', 0.0, 0.0, @curr_c_423, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'MANISH  JADHAV', 'no-email-dl-424@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_424 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('94127122', 'Miscellaneous Insurance', NULL, NULL, '2025-12-27', '2026-12-27', '1970-01-01', 0.0, 0.0, @curr_c_424, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS', 'MANISH  JADHAV', 'no-email-dl-425@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_425 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('94146578', 'Miscellaneous Insurance', NULL, NULL, '2025-12-27', '2026-12-27', '1970-01-01', 0.0, 0.0, @curr_c_425, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Priyam Malhotra', 'no-email-dl-426@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_426 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10932346', 'Miscellaneous Insurance', NULL, NULL, '2025-12-28', '2027-12-29', '1970-01-01', 0.0, 0.0, @curr_c_426, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS', 'Kanudeep Kaur', 'no-email-dl-427@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_427 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('25138215', 'Miscellaneous Insurance', NULL, NULL, '2025-12-29', '2026-12-29', '1970-01-01', 0.0, 0.0, @curr_c_427, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Jabeena', 'Najeeb', 'no-email-dl-428@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_428 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('26-21-0013823-04', 'Miscellaneous Insurance', NULL, NULL, '2025-11-05', '2026-11-05', '1970-01-01', 0.0, 0.0, @curr_c_428, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SAURABH', 'TEWARI', 'no-email-dl-429@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_429 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6450111507281721', 'Miscellaneous Insurance', NULL, NULL, '2025-11-01', '2026-11-01', '1970-01-01', 0.0, 0.0, @curr_c_429, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SYED', 'IQBAL AHMED', 'no-email-dl-430@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_430 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5293112006096218', 'Miscellaneous Insurance', NULL, NULL, '2025-11-01', '2026-11-01', '1970-01-01', 0.0, 0.0, @curr_c_430, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAJEEV', 'CHOURASIYA', 'no-email-dl-431@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_431 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7326111907012321', 'Miscellaneous Insurance', NULL, NULL, '2025-11-03', '2026-11-03', '1970-01-01', 0.0, 0.0, @curr_c_431, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('NANDITA', 'BANERJEE', 'no-email-dl-432@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_432 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8546112006096277', 'Miscellaneous Insurance', NULL, NULL, '2025-11-04', '2026-11-04', '1970-01-01', 0.0, 0.0, @curr_c_432, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SAURAV', 'MITTAL', 'no-email-dl-433@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_433 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2610111904041778', 'Miscellaneous Insurance', NULL, NULL, '2025-11-06', '2027-11-07', '1970-01-01', 0.0, 0.0, @curr_c_433, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SAURAV', 'MITTAL', 'no-email-dl-434@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_434 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6700111907028076', 'Miscellaneous Insurance', NULL, NULL, '2025-11-06', '2026-11-06', '1970-01-01', 0.0, 0.0, @curr_c_434, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('NISHIKANT', 'NANDKUMAR SHINDE', 'no-email-dl-435@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_435 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3584111805078103', 'Miscellaneous Insurance', NULL, NULL, '2025-11-08', '2026-11-08', '1970-01-01', 0.0, 0.0, @curr_c_435, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('BHARATHI', 'ARUN MAKKALA', 'no-email-dl-436@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_436 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2676162501046532', 'Miscellaneous Insurance', NULL, NULL, '2025-11-09', '2026-11-09', '1970-01-01', 0.0, 0.0, @curr_c_436, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('LALIT', 'BAJAJ', 'no-email-dl-437@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_437 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9632111804065567', 'Miscellaneous Insurance', NULL, NULL, '2025-11-09', '2027-11-10', '1970-01-01', 0.0, 0.0, @curr_c_437, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SYED', 'ADNAN AMEEN', 'no-email-dl-438@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_438 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6298111709037427', 'Miscellaneous Insurance', NULL, NULL, '2025-11-10', '2026-11-10', '1970-01-01', 0.0, 0.0, @curr_c_438, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5312112105036723', 'Miscellaneous Insurance', NULL, NULL, '2025-11-10', '2026-11-10', '1970-01-01', 0.0, 0.0, @curr_c_436, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAGVENDRA', 'PRATAP SINGH', 'no-email-dl-440@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_440 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7284112303042030', 'Miscellaneous Insurance', NULL, NULL, '2025-11-12', '2026-11-12', '1970-01-01', 0.0, 0.0, @curr_c_440, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DALCHAND', '', 'no-email-dl-441@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_441 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8280112005216860', 'Miscellaneous Insurance', NULL, NULL, '2025-11-12', '2026-11-12', '1970-01-01', 0.0, 0.0, @curr_c_441, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('AJEET', 'KUMAR SINGH', 'no-email-dl-442@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_442 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6507111907076467', 'Miscellaneous Insurance', NULL, NULL, '2025-11-13', '2026-11-13', '1970-01-01', 0.0, 0.0, @curr_c_442, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KISHOR', 'KOTHARI', 'no-email-dl-443@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_443 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2256111907093981', 'Miscellaneous Insurance', NULL, NULL, '2025-11-13', '2026-11-13', '1970-01-01', 0.0, 0.0, @curr_c_443, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAGHAVAN', 'BAHURAJAN', 'no-email-dl-444@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_444 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7155111709022302', 'Miscellaneous Insurance', NULL, NULL, '2025-11-14', '2026-11-14', '1970-01-01', 0.0, 0.0, @curr_c_444, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('K', 'NARAYANASWAMY', 'no-email-dl-445@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_445 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9080111907075704', 'Miscellaneous Insurance', NULL, NULL, '2025-11-14', '2026-11-14', '1970-01-01', 0.0, 0.0, @curr_c_445, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ISWAR', 'CHANDRA ROUT', 'no-email-dl-446@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_446 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5082112204001733', 'Miscellaneous Insurance', NULL, NULL, '2025-11-15', '2026-11-15', '1970-01-01', 0.0, 0.0, @curr_c_446, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VINAY', 'RAJPUT', 'no-email-dl-447@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_447 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4116111808064037', 'Miscellaneous Insurance', NULL, NULL, '2025-11-15', '2026-11-15', '1970-01-01', 0.0, 0.0, @curr_c_447, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ABHISEK', 'SARANGI', 'no-email-dl-448@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_448 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1013111904053964', 'Miscellaneous Insurance', NULL, NULL, '2025-11-15', '2027-11-16', '1970-01-01', 0.0, 0.0, @curr_c_448, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ASHOK', '', 'no-email-dl-449@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_449 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7851111709038353', 'Miscellaneous Insurance', NULL, NULL, '2025-11-16', '2026-11-16', '1970-01-01', 0.0, 0.0, @curr_c_449, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PRAMOD', 'NARAYAN GUNAGA', 'no-email-dl-450@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_450 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9621111907037151', 'Miscellaneous Insurance', NULL, NULL, '2025-11-16', '2026-11-16', '1970-01-01', 0.0, 0.0, @curr_c_450, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MACHHINDRA', 'KASHINATH WADHAVANE', 'no-email-dl-451@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_451 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4271112105432048', 'Miscellaneous Insurance', NULL, NULL, '2025-11-16', '2026-11-16', '1970-01-01', 0.0, 0.0, @curr_c_451, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VANEET', 'JINDAL', 'no-email-dl-452@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_452 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2939111907039770', 'Miscellaneous Insurance', NULL, NULL, '2025-11-16', '2026-11-16', '1970-01-01', 0.0, 0.0, @curr_c_452, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PRASAD', 'R', 'no-email-dl-453@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_453 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8078111907008047', 'Miscellaneous Insurance', NULL, NULL, '2025-11-16', '2026-11-16', '1970-01-01', 0.0, 0.0, @curr_c_453, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS.', 'SHAMMI', 'no-email-dl-454@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_454 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2061111808061086', 'Miscellaneous Insurance', NULL, NULL, '2025-11-16', '2026-11-16', '1970-01-01', 0.0, 0.0, @curr_c_454, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('CHANDRAN', 'M P', 'no-email-dl-455@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_455 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9374112104279015', 'Miscellaneous Insurance', NULL, NULL, '2025-11-17', '2026-11-17', '1970-01-01', 0.0, 0.0, @curr_c_455, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MARIE', 'FRANCISE MANICOM', 'no-email-dl-456@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_456 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9347111907083084', 'Miscellaneous Insurance', NULL, NULL, '2025-11-17', '2026-11-17', '1970-01-01', 0.0, 0.0, @curr_c_456, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('FEBY', 'SEBASTINE', 'no-email-dl-457@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_457 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3504112204089295', 'Miscellaneous Insurance', NULL, NULL, '2025-11-17', '2026-11-17', '1970-01-01', 0.0, 0.0, @curr_c_457, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1935112006009754', 'Miscellaneous Insurance', NULL, NULL, '2025-11-18', '2026-11-18', '1970-01-01', 0.0, 0.0, @curr_c_432, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ASHISH', 'SATKARCHAND SONI', 'no-email-dl-459@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_459 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3402111907080918', 'Miscellaneous Insurance', NULL, NULL, '2025-11-19', '2026-11-19', '1970-01-01', 0.0, 0.0, @curr_c_459, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KUCHIBHOTLA', 'VISWANADH RAMESH', 'no-email-dl-460@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_460 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1173112105005637', 'Miscellaneous Insurance', NULL, NULL, '2025-11-19', '2026-11-19', '1970-01-01', 0.0, 0.0, @curr_c_460, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KRISHAN', 'BANSLA', 'no-email-dl-461@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_461 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6858111808053329', 'Miscellaneous Insurance', NULL, NULL, '2025-11-20', '2026-11-20', '1970-01-01', 0.0, 0.0, @curr_c_461, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PRAVEEN', 'SHRIDHAR KULKARNI', 'no-email-dl-462@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_462 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5010112204007113', 'Miscellaneous Insurance', NULL, NULL, '2025-11-20', '2026-11-20', '1970-01-01', 0.0, 0.0, @curr_c_462, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANAND', 'UPADHYAY', 'no-email-dl-463@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_463 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1534111907054949', 'Miscellaneous Insurance', NULL, NULL, '2025-11-20', '2026-11-20', '1970-01-01', 0.0, 0.0, @curr_c_463, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MD', 'TARIK', 'no-email-dl-464@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_464 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9936111907025584', 'Miscellaneous Insurance', NULL, NULL, '2025-11-20', '2026-11-20', '1970-01-01', 0.0, 0.0, @curr_c_464, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SANDEEP', 'SHYAM JOGDAND', 'no-email-dl-465@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_465 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1725111808071263', 'Miscellaneous Insurance', NULL, NULL, '2025-11-20', '2026-11-20', '1970-01-01', 0.0, 0.0, @curr_c_465, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('CHAMPA', 'PATRA', 'no-email-dl-466@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_466 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7691112006051650', 'Miscellaneous Insurance', NULL, NULL, '2025-11-20', '2026-11-20', '1970-01-01', 0.0, 0.0, @curr_c_466, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('GOTETI', 'RAVI KISHORE', 'no-email-dl-467@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_467 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6870111907091539', 'Miscellaneous Insurance', NULL, NULL, '2025-11-20', '2026-11-20', '1970-01-01', 0.0, 0.0, @curr_c_467, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ARPITA', 'CHAKRABORTY', 'no-email-dl-468@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_468 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9069112104281732', 'Miscellaneous Insurance', NULL, NULL, '2025-11-22', '2026-11-22', '1970-01-01', 0.0, 0.0, @curr_c_468, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAJESH', 'B M', 'no-email-dl-469@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_469 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7207112006035517', 'Miscellaneous Insurance', NULL, NULL, '2025-11-23', '2026-11-23', '1970-01-01', 0.0, 0.0, @curr_c_469, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('YOGESH', 'JUNEJA', 'no-email-dl-470@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_470 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4150112006045945', 'Miscellaneous Insurance', NULL, NULL, '2025-11-23', '2026-11-23', '1970-01-01', 0.0, 0.0, @curr_c_470, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PRAKASH', 'VIRNAWE', 'no-email-dl-471@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_471 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8527112006093094', 'Miscellaneous Insurance', NULL, NULL, '2025-11-24', '2026-11-24', '1970-01-01', 0.0, 0.0, @curr_c_471, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VIKAS', 'CHANDEL', 'no-email-dl-472@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_472 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4060111907078330', 'Miscellaneous Insurance', NULL, NULL, '2025-11-24', '2026-11-24', '1970-01-01', 0.0, 0.0, @curr_c_472, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PRASHANT', 'SETH', 'no-email-dl-473@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_473 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7873112104217646', 'Miscellaneous Insurance', NULL, NULL, '2025-11-24', '2026-11-24', '1970-01-01', 0.0, 0.0, @curr_c_473, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KAMLESH', 'CHAUDHARY', 'no-email-dl-474@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_474 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7366111907006211', 'Miscellaneous Insurance', NULL, NULL, '2025-11-25', '2026-11-25', '1970-01-01', 0.0, 0.0, @curr_c_474, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ASHOK', 'LALGUDI KAUSHIK', 'no-email-dl-475@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_475 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8035112006062350', 'Miscellaneous Insurance', NULL, NULL, '2025-11-25', '2026-11-25', '1970-01-01', 0.0, 0.0, @curr_c_475, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('HEMANT', 'KUTHIALA', 'no-email-dl-476@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_476 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8205112201076423', 'Miscellaneous Insurance', NULL, NULL, '2025-11-26', '2026-11-26', '1970-01-01', 0.0, 0.0, @curr_c_476, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAJU', 'P V', 'no-email-dl-477@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_477 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2850112204082907', 'Miscellaneous Insurance', NULL, NULL, '2025-11-26', '2026-11-26', '1970-01-01', 0.0, 0.0, @curr_c_477, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RATNESH', 'UPADHYAY', 'no-email-dl-478@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_478 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3975111907055465', 'Miscellaneous Insurance', NULL, NULL, '2025-11-26', '2026-11-26', '1970-01-01', 0.0, 0.0, @curr_c_478, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KIZHAKKOOTTUVALAPPIL', 'KUNHIMOIDEEN', 'no-email-dl-479@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_479 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8735112105065218', 'Miscellaneous Insurance', NULL, NULL, '2025-11-26', '2026-11-26', '1970-01-01', 0.0, 0.0, @curr_c_479, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('HARSHADA', 'J. SAWANT', 'no-email-dl-480@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_480 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5884112204095452', 'Miscellaneous Insurance', NULL, NULL, '2025-11-27', '2026-11-27', '1970-01-01', 0.0, 0.0, @curr_c_480, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('UPPALAPATI', 'NARESH', 'no-email-dl-481@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_481 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7937112204057109', 'Miscellaneous Insurance', NULL, NULL, '2025-11-27', '2026-11-27', '1970-01-01', 0.0, 0.0, @curr_c_481, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4291162501062219', 'Miscellaneous Insurance', NULL, NULL, '2025-11-28', '2026-11-28', '1970-01-01', 0.0, 0.0, @curr_c_238, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PREETI', 'RATHORE', 'no-email-dl-483@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_483 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4343112402064002', 'Miscellaneous Insurance', NULL, NULL, '2025-11-29', '2026-11-29', '1970-01-01', 0.0, 0.0, @curr_c_483, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('M', 'MUNIRAJU', 'no-email-dl-484@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_484 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5718112105091001', 'Miscellaneous Insurance', NULL, NULL, '2025-11-29', '2026-11-29', '1970-01-01', 0.0, 0.0, @curr_c_484, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('B.RAVIPRASAD', '', 'no-email-dl-485@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_485 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1374111709089495', 'Miscellaneous Insurance', NULL, NULL, '2025-11-29', '2026-11-29', '1970-01-01', 0.0, 0.0, @curr_c_485, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RONAK', 'KOTHARI', 'no-email-dl-486@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_486 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6309112105059558', 'Miscellaneous Insurance', NULL, NULL, '2025-11-29', '2026-11-29', '1970-01-01', 0.0, 0.0, @curr_c_486, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SHRUTI', 'MEHTA', 'no-email-dl-487@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_487 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5682112402055771', 'Miscellaneous Insurance', NULL, NULL, '2025-11-29', '2026-11-29', '1970-01-01', 0.0, 0.0, @curr_c_487, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DEVESH', 'KUMAR', 'no-email-dl-488@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_488 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1272112006031539', 'Miscellaneous Insurance', NULL, NULL, '2025-11-29', '2026-11-29', '1970-01-01', 0.0, 0.0, @curr_c_488, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PRACHI', 'SHINDE', 'no-email-dl-489@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_489 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7545111808093009', 'Miscellaneous Insurance', NULL, NULL, '2025-11-30', '2026-11-30', '1970-01-01', 0.0, 0.0, @curr_c_489, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'VINDPAL SINGH', 'no-email-dl-490@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_490 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('73203756', 'Miscellaneous Insurance', NULL, NULL, '2025-11-06', '2026-11-06', '1970-01-01', 0.0, 0.0, @curr_c_490, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Nitin Chauhan', 'no-email-dl-491@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_491 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('34638152', 'Miscellaneous Insurance', NULL, NULL, '2025-11-07', '2027-11-08', '1970-01-01', 0.0, 0.0, @curr_c_491, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Nishant Desai', 'no-email-dl-492@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_492 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11743996', 'Miscellaneous Insurance', NULL, NULL, '2025-11-08', '2026-11-08', '1970-01-01', 0.0, 0.0, @curr_c_492, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'ANANDAN PRAKASH ANANDAN PRAKASH', 'no-email-dl-493@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_493 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('73941867', 'Miscellaneous Insurance', NULL, NULL, '2025-11-09', '2026-11-09', '1970-01-01', 0.0, 0.0, @curr_c_493, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Muskan', 'Hashmi', 'no-email-dl-494@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_494 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('32820780202503', 'Miscellaneous Insurance', NULL, NULL, '2025-11-09', '2026-11-09', '1970-01-01', 0.0, 0.0, @curr_c_494, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'MUKESH KUMAR', 'no-email-dl-495@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_495 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10739390', 'Miscellaneous Insurance', NULL, NULL, '2025-11-18', '2026-11-18', '1970-01-01', 0.0, 0.0, @curr_c_495, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'SANTOSH KUMAR', 'no-email-dl-496@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_496 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('74966174', 'Miscellaneous Insurance', NULL, NULL, '2025-11-18', '2026-11-18', '1970-01-01', 0.0, 0.0, @curr_c_496, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'AJAY SHARMA', 'no-email-dl-497@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_497 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('74707792', 'Miscellaneous Insurance', NULL, NULL, '2025-11-18', '2026-11-18', '1970-01-01', 0.0, 0.0, @curr_c_497, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('74969128', 'Miscellaneous Insurance', NULL, NULL, '2025-11-18', '2026-11-18', '1970-01-01', 0.0, 0.0, @curr_c_496, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'KADIR FARID SHAIKH', 'no-email-dl-499@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_499 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('73569453', 'Miscellaneous Insurance', NULL, NULL, '2025-11-19', '2026-11-19', '1970-01-01', 0.0, 0.0, @curr_c_499, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'DEBA PRASAD SANA', 'no-email-dl-500@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_500 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('92736988', 'Miscellaneous Insurance', NULL, NULL, '2025-11-20', '2026-11-20', '1970-01-01', 0.0, 0.0, @curr_c_500, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ravinesh', 'Kumar Sinha', 'no-email-dl-501@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_501 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4193i/APRN/269309713/03/000', 'Miscellaneous Insurance', NULL, NULL, '2025-11-20', '2026-11-20', '1970-01-01', 0.0, 0.0, @curr_c_501, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MAHESH', 'JOY', 'no-email-dl-502@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_502 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33562969202502', 'Miscellaneous Insurance', NULL, NULL, '2025-11-20', '2026-11-20', '1970-01-01', 0.0, 0.0, @curr_c_502, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Padma', 'Shenoy U', 'no-email-dl-503@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_503 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-22-3781607-03', 'Miscellaneous Insurance', NULL, NULL, '2025-11-21', '2026-11-21', '1970-01-01', 0.0, 0.0, @curr_c_503, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'SHASHIKANT PATIL', 'no-email-dl-504@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_504 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('73370077', 'Miscellaneous Insurance', NULL, NULL, '2025-11-21', '2026-11-21', '1970-01-01', 0.0, 0.0, @curr_c_504, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'DEEPAK GULATI', 'no-email-dl-505@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_505 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10879444', 'Miscellaneous Insurance', NULL, NULL, '2025-11-22', '2026-11-22', '1970-01-01', 0.0, 0.0, @curr_c_505, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Rajveer', 'Singh', 'no-email-dl-506@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_506 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('32837587202503', 'Miscellaneous Insurance', NULL, NULL, '2025-11-22', '2026-11-22', '1970-01-01', 0.0, 0.0, @curr_c_506, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('JAYAKRISHNAN', 'K', 'no-email-dl-507@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_507 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33572477202502', 'Miscellaneous Insurance', NULL, NULL, '2025-11-24', '2026-11-24', '1970-01-01', 0.0, 0.0, @curr_c_507, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'GUMMA RAMESH YADAV', 'no-email-dl-508@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_508 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('18997737', 'Miscellaneous Insurance', NULL, NULL, '2025-11-26', '2026-11-26', '1970-01-01', 0.0, 0.0, @curr_c_508, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS', 'SHWETA SOOD', 'no-email-dl-509@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_509 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10887917', 'Miscellaneous Insurance', NULL, NULL, '2025-11-28', '2026-11-28', '1970-01-01', 0.0, 0.0, @curr_c_509, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Rekha', 'Dawar', 'no-email-dl-510@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_510 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('32838180202503', 'Miscellaneous Insurance', NULL, NULL, '2025-11-28', '2026-11-28', '1970-01-01', 0.0, 0.0, @curr_c_510, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS', 'PREETI RATHORE', 'no-email-dl-511@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_511 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('75330318', 'Miscellaneous Insurance', NULL, NULL, '2025-11-29', '2026-11-29', '1970-01-01', 0.0, 0.0, @curr_c_511, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'DINESH KUMAR', 'no-email-dl-512@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_512 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('19052965', 'Miscellaneous Insurance', NULL, NULL, '2025-11-29', '2026-11-29', '1970-01-01', 0.0, 0.0, @curr_c_512, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PRADEEP', 'MULJI TANNA', 'no-email-dl-513@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_513 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('31455872202505', 'Miscellaneous Insurance', NULL, NULL, '2025-11-29', '2026-11-29', '1970-01-01', 0.0, 0.0, @curr_c_513, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'SHRIKANT ISHWAR CHOUDHARI', 'no-email-dl-514@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_514 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10890179', 'Miscellaneous Insurance', NULL, NULL, '2025-11-30', '2026-11-30', '1970-01-01', 0.0, 0.0, @curr_c_514, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Thirusenthilnathan Natarajan Iyer', 'no-email-dl-515@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_515 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33300249', 'Miscellaneous Insurance', NULL, NULL, '2025-11-30', '2026-11-30', '1970-01-01', 0.0, 0.0, @curr_c_515, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MADHU', 'DEVI', 'no-email-dl-516@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_516 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805206975400301', 'Miscellaneous Insurance', NULL, NULL, '2025-11-21', '2026-11-21', '1970-01-01', 0.0, 0.0, @curr_c_516, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MAHESH', 'KUMAR SHARMA', 'no-email-dl-517@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_517 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805206977150801001', 'Miscellaneous Insurance', NULL, NULL, '2025-11-22', '2026-11-22', '1970-01-01', 0.0, 0.0, @curr_c_517, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('INDERJIT', 'SINGH', 'no-email-dl-518@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_518 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805206981584901000', 'Miscellaneous Insurance', NULL, NULL, '2025-11-24', '2026-11-24', '1970-01-01', 0.0, 0.0, @curr_c_518, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SANJEEV', 'KUMAR SUDHANSHU', 'no-email-dl-519@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_519 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805203553870606001', 'Miscellaneous Insurance', NULL, NULL, '2025-11-24', '2026-11-24', '1970-01-01', 0.0, 0.0, @curr_c_519, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr.', 'Yatendra', 'no-email-dl-520@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_520 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33482733202502', 'Miscellaneous Insurance', NULL, NULL, '2025-11-05', '2026-11-05', '1970-01-01', 0.0, 0.0, @curr_c_520, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VIRENDER', 'KUMAR', 'no-email-dl-521@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_521 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805207909626500000', 'Miscellaneous Insurance', NULL, NULL, '2025-11-24', '2026-11-24', '1970-01-01', 0.0, 0.0, @curr_c_521, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Nitin', 'Gupta', 'no-email-dl-522@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_522 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33518717202502', 'Miscellaneous Insurance', NULL, NULL, '2025-11-11', '2026-11-11', '1970-01-01', 0.0, 0.0, @curr_c_522, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Kimti', 'Lal', 'no-email-dl-523@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_523 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-21-0081499-04', 'Miscellaneous Insurance', NULL, NULL, '2025-10-02', '2026-10-02', '1970-01-01', 0.0, 0.0, @curr_c_523, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Indranil', 'Roychowdhury', 'no-email-dl-524@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_524 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('31-25-0200907-05', 'Miscellaneous Insurance', NULL, NULL, '2025-10-05', '2027-10-06', '1970-01-01', 0.0, 0.0, @curr_c_524, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MRS', 'BEENA', 'no-email-dl-525@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_525 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-22-3737926-03', 'Miscellaneous Insurance', NULL, NULL, '2025-10-09', '2026-10-09', '1970-01-01', 0.0, 0.0, @curr_c_525, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DALBIR', 'SINGH', 'no-email-dl-526@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_526 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7596111906096230', 'Miscellaneous Insurance', NULL, NULL, '2025-10-03', '2026-10-03', '1970-01-01', 0.0, 0.0, @curr_c_526, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('AVINASH', 'KUMAR', 'no-email-dl-527@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_527 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1720112105090789', 'Miscellaneous Insurance', NULL, NULL, '2025-10-04', '2026-10-04', '1970-01-01', 0.0, 0.0, @curr_c_527, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUNDARA', 'RAO KOLUKULURI', 'no-email-dl-528@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_528 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7957112006075963', 'Miscellaneous Insurance', NULL, NULL, '2025-10-05', '2026-10-05', '1970-01-01', 0.0, 0.0, @curr_c_528, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('HIMADRI', 'SHEKHAR DAS', 'no-email-dl-529@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_529 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6874111808015407', 'Miscellaneous Insurance', NULL, NULL, '2025-10-06', '2026-10-06', '1970-01-01', 0.0, 0.0, @curr_c_529, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DEEPTI', 'AGRAWAL', 'no-email-dl-530@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_530 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4678111903244822', 'Miscellaneous Insurance', NULL, NULL, '2025-10-06', '2026-10-06', '1970-01-01', 0.0, 0.0, @curr_c_530, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('AYUSH', 'JAIN', 'no-email-dl-531@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_531 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1336112303030222', 'Miscellaneous Insurance', NULL, NULL, '2025-10-06', '2026-10-06', '1970-01-01', 0.0, 0.0, @curr_c_531, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SANJEEV', 'KUMAR KATARIA', 'no-email-dl-532@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_532 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1594112204038149', 'Miscellaneous Insurance', NULL, NULL, '2025-10-08', '2026-10-08', '1970-01-01', 0.0, 0.0, @curr_c_532, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('BRAJESH', 'RAGHUWANSHI', 'no-email-dl-533@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_533 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7943112303013659', 'Miscellaneous Insurance', NULL, NULL, '2025-10-08', '2026-10-08', '1970-01-01', 0.0, 0.0, @curr_c_533, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KIRAN', 'MARUTI BADIGER', 'no-email-dl-534@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_534 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9537112303053176', 'Miscellaneous Insurance', NULL, NULL, '2025-10-08', '2026-10-08', '1970-01-01', 0.0, 0.0, @curr_c_534, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SREEJITH', 'SOMAN NAIR', 'no-email-dl-535@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_535 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4898112204039233', 'Miscellaneous Insurance', NULL, NULL, '2025-10-12', '2026-10-12', '1970-01-01', 0.0, 0.0, @curr_c_535, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SONIA', 'NAGPAL', 'no-email-dl-536@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_536 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3119111906248729', 'Miscellaneous Insurance', NULL, NULL, '2025-10-12', '2026-10-12', '1970-01-01', 0.0, 0.0, @curr_c_536, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VINOD', 'JAVED', 'no-email-dl-537@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_537 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4967112105024361', 'Miscellaneous Insurance', NULL, NULL, '2025-10-12', '2026-10-12', '1970-01-01', 0.0, 0.0, @curr_c_537, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANAMIKA', 'SINGH', 'no-email-dl-538@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_538 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3242111808158764', 'Miscellaneous Insurance', NULL, NULL, '2025-10-12', '2026-10-12', '1970-01-01', 0.0, 0.0, @curr_c_538, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Neha', 'Raikwar', 'no-email-dl-539@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_539 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9537112204050062', 'Miscellaneous Insurance', NULL, NULL, '2025-10-13', '2026-10-13', '1970-01-01', 0.0, 0.0, @curr_c_539, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MANOHAR', 'K SINGH', 'no-email-dl-540@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_540 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5041111808176641', 'Miscellaneous Insurance', NULL, NULL, '2025-10-14', '2026-10-14', '1970-01-01', 0.0, 0.0, @curr_c_540, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SANJAY', 'ATMARAM JADHAV', 'no-email-dl-541@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_541 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2878112105074863', 'Miscellaneous Insurance', NULL, NULL, '2025-10-14', '2026-10-14', '1970-01-01', 0.0, 0.0, @curr_c_541, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SOUMEN', 'NANDAN', 'no-email-dl-542@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_542 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4263112004290480', 'Miscellaneous Insurance', NULL, NULL, '2025-10-16', '2026-10-16', '1970-01-01', 0.0, 0.0, @curr_c_542, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2177162501023081', 'Miscellaneous Insurance', NULL, NULL, '2025-10-16', '2026-10-16', '1970-01-01', 0.0, 0.0, @curr_c_429, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ASHIT', 'KHANNA', 'no-email-dl-544@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_544 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6888111709295287', 'Miscellaneous Insurance', NULL, NULL, '2025-10-16', '2026-10-16', '1970-01-01', 0.0, 0.0, @curr_c_544, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR.SANJAY', 'MADAN PARAKH', 'no-email-dl-545@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_545 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8451111907037399', 'Miscellaneous Insurance', NULL, NULL, '2025-10-17', '2026-10-17', '1970-01-01', 0.0, 0.0, @curr_c_545, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('GANESH', 'BALAJI PAULBUDHE', 'no-email-dl-546@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_546 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3406111709009232', 'Miscellaneous Insurance', NULL, NULL, '2025-10-18', '2026-10-18', '1970-01-01', 0.0, 0.0, @curr_c_546, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MOHAMMED', 'JAVED SHAIKH', 'no-email-dl-547@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_547 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5193111907000726', 'Miscellaneous Insurance', NULL, NULL, '2025-10-18', '2026-10-18', '1970-01-01', 0.0, 0.0, @curr_c_547, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('GOVIND', 'KUMAR CHOUDHARY', 'no-email-dl-548@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_548 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7179111709024898', 'Miscellaneous Insurance', NULL, NULL, '2025-10-19', '2026-10-19', '1970-01-01', 0.0, 0.0, @curr_c_548, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KAPIL', 'KUMAR JHA', 'no-email-dl-549@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_549 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4229112105021528', 'Miscellaneous Insurance', NULL, NULL, '2025-10-20', '2026-10-20', '1970-01-01', 0.0, 0.0, @curr_c_549, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('AVINASH', 'BALIGA B', 'no-email-dl-550@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_550 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6782112006016095', 'Miscellaneous Insurance', NULL, NULL, '2025-10-21', '2026-10-21', '1970-01-01', 0.0, 0.0, @curr_c_550, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3459162501005012', 'Miscellaneous Insurance', NULL, NULL, '2025-10-22', '2026-10-22', '1970-01-01', 0.0, 0.0, @curr_c_448, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUBRAMANIYAN', 'HARIHARAN', 'no-email-dl-552@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_552 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8770112004689276', 'Miscellaneous Insurance', NULL, NULL, '2025-10-22', '2026-10-22', '1970-01-01', 0.0, 0.0, @curr_c_552, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS.MEDIPALLI', 'SWATHI', 'no-email-dl-553@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_553 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6494111907087235', 'Miscellaneous Insurance', NULL, NULL, '2025-10-23', '2026-10-23', '1970-01-01', 0.0, 0.0, @curr_c_553, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9374162501045135', 'Miscellaneous Insurance', NULL, NULL, '2025-10-23', '2026-10-23', '1970-01-01', 0.0, 0.0, @curr_c_431, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('LINGARAJ', 'G R', 'no-email-dl-555@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_555 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2835111907006452', 'Miscellaneous Insurance', NULL, NULL, '2025-10-24', '2026-10-24', '1970-01-01', 0.0, 0.0, @curr_c_555, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6065162501070720', 'Miscellaneous Insurance', NULL, NULL, '2025-10-24', '2026-10-24', '1970-01-01', 0.0, 0.0, @curr_c_434, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SNEHALKUMAR', 'DEVENDRA HARNE', 'no-email-dl-557@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_557 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3563111907065570', 'Miscellaneous Insurance', NULL, NULL, '2025-10-24', '2026-10-24', '1970-01-01', 0.0, 0.0, @curr_c_557, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SHANTHI', 'RAMAKRISHNAN', 'no-email-dl-558@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_558 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2387112004289021', 'Miscellaneous Insurance', NULL, NULL, '2025-10-24', '2026-10-24', '1970-01-01', 0.0, 0.0, @curr_c_558, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('NILADRI', 'DEY', 'no-email-dl-559@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_559 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7122162501034887', 'Miscellaneous Insurance', NULL, NULL, '2025-10-24', '2026-10-24', '1970-01-01', 0.0, 0.0, @curr_c_559, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DHARMENDRA', 'SHARMA', 'no-email-dl-560@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_560 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9428112105066325', 'Miscellaneous Insurance', NULL, NULL, '2025-10-25', '2026-10-25', '1970-01-01', 0.0, 0.0, @curr_c_560, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ASHIK', 'BARKAT BHUTIYA', 'no-email-dl-561@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_561 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5708112303001925', 'Miscellaneous Insurance', NULL, NULL, '2025-10-25', '2026-10-25', '1970-01-01', 0.0, 0.0, @curr_c_561, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MORTHA', 'SAI VEERRAJU', 'no-email-dl-562@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_562 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1371112105095956', 'Miscellaneous Insurance', NULL, NULL, '2025-10-25', '2026-10-25', '1970-01-01', 0.0, 0.0, @curr_c_562, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('BIRENDRA', 'SHANKAR PANDEY', 'no-email-dl-563@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_563 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4874111907072140', 'Miscellaneous Insurance', NULL, NULL, '2025-10-25', '2026-10-25', '1970-01-01', 0.0, 0.0, @curr_c_563, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUBRAMANIAN', '', 'no-email-dl-564@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_564 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4282112204067904', 'Miscellaneous Insurance', NULL, NULL, '2025-10-26', '2026-10-26', '1970-01-01', 0.0, 0.0, @curr_c_564, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('BASAVANA', 'GOWDA S N', 'no-email-dl-565@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_565 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2800112104276160', 'Miscellaneous Insurance', NULL, NULL, '2025-10-26', '2026-10-26', '1970-01-01', 0.0, 0.0, @curr_c_565, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3656111907018654', 'Miscellaneous Insurance', NULL, NULL, '2025-10-27', '2026-10-27', '1970-01-01', 0.0, 0.0, @curr_c_559, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('NAMITA', 'MISHRA', 'no-email-dl-567@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_567 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2882112204470281', 'Miscellaneous Insurance', NULL, NULL, '2025-10-27', '2026-10-27', '1970-01-01', 0.0, 0.0, @curr_c_567, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SARWAT', 'KAZMI', 'no-email-dl-568@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_568 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8454112204061575', 'Miscellaneous Insurance', NULL, NULL, '2025-10-27', '2026-10-27', '1970-01-01', 0.0, 0.0, @curr_c_568, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('JAGADEESH', 'KUMAR GAVALAKAR', 'no-email-dl-569@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_569 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8112111709004225', 'Miscellaneous Insurance', NULL, NULL, '2025-10-27', '2026-10-27', '1970-01-01', 0.0, 0.0, @curr_c_569, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MRITUNJAY', 'KUMAR TIWARI', 'no-email-dl-570@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_570 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8984111907026193', 'Miscellaneous Insurance', NULL, NULL, '2025-10-27', '2026-10-27', '1970-01-01', 0.0, 0.0, @curr_c_570, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR.ANUPA', 'KARUNAKAR SHETTY', 'no-email-dl-571@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_571 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5969112105081184', 'Miscellaneous Insurance', NULL, NULL, '2025-10-27', '2026-10-27', '1970-01-01', 0.0, 0.0, @curr_c_571, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PIYUSH', 'PRABHAKAR MISHRA', 'no-email-dl-572@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_572 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5282112204401621', 'Miscellaneous Insurance', NULL, NULL, '2025-10-27', '2026-10-27', '1970-01-01', 0.0, 0.0, @curr_c_572, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Anoopam', 'Bhatnagar', 'no-email-dl-573@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_573 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3578112201003835', 'Miscellaneous Insurance', NULL, NULL, '2025-10-28', '2026-10-28', '1970-01-01', 0.0, 0.0, @curr_c_573, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('GURDIP', 'SINGH', 'no-email-dl-574@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_574 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3377111808156562', 'Miscellaneous Insurance', NULL, NULL, '2025-10-28', '2026-10-28', '1970-01-01', 0.0, 0.0, @curr_c_574, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAMAN', 'LAL LILACHAND', 'no-email-dl-575@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_575 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2612112204055655', 'Miscellaneous Insurance', NULL, NULL, '2025-10-29', '2026-10-29', '1970-01-01', 0.0, 0.0, @curr_c_575, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('AMOD', 'KUMAR SINGH', 'no-email-dl-576@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_576 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1420112204053784', 'Miscellaneous Insurance', NULL, NULL, '2025-10-29', '2026-10-29', '1970-01-01', 0.0, 0.0, @curr_c_576, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('GANGA', 'KARAK', 'no-email-dl-577@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_577 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5399112105042291', 'Miscellaneous Insurance', NULL, NULL, '2025-10-29', '2026-10-29', '1970-01-01', 0.0, 0.0, @curr_c_577, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('LAKSHMI', 'N', 'no-email-dl-578@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_578 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1438112402065538', 'Miscellaneous Insurance', NULL, NULL, '2025-10-30', '2026-10-30', '1970-01-01', 0.0, 0.0, @curr_c_578, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('BOBBIE', 'NINAN ABRAHAM', 'no-email-dl-579@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_579 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8633112204059171', 'Miscellaneous Insurance', NULL, NULL, '2025-10-30', '2026-10-30', '1970-01-01', 0.0, 0.0, @curr_c_579, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7499162501019951', 'Miscellaneous Insurance', NULL, NULL, '2025-10-30', '2026-10-30', '1970-01-01', 0.0, 0.0, @curr_c_435, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAHUL', 'VIJ', 'no-email-dl-581@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_581 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4774112203000705', 'Miscellaneous Insurance', NULL, NULL, '2025-10-31', '2026-10-31', '1970-01-01', 0.0, 0.0, @curr_c_581, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1635112203093154', 'Miscellaneous Insurance', NULL, NULL, '2025-10-31', '2026-10-31', '1970-01-01', 0.0, 0.0, @curr_c_581, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAKESH', 'SINGH', 'no-email-dl-583@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_583 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6759111808106037', 'Miscellaneous Insurance', NULL, NULL, '2025-10-31', '2026-10-31', '1970-01-01', 0.0, 0.0, @curr_c_583, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MOHAMMED', 'NIAS GK', 'no-email-dl-584@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_584 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9284111709083548', 'Miscellaneous Insurance', NULL, NULL, '2025-10-31', '2026-10-31', '1970-01-01', 0.0, 0.0, @curr_c_584, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VISHAL', 'DUBEY', 'no-email-dl-585@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_585 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5287111808092881', 'Miscellaneous Insurance', NULL, NULL, '2025-10-31', '2026-10-31', '1970-01-01', 0.0, 0.0, @curr_c_585, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SHIJU', 'A.J', 'no-email-dl-586@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_586 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8048112204084734', 'Miscellaneous Insurance', NULL, NULL, '2025-10-31', '2026-10-31', '1970-01-01', 0.0, 0.0, @curr_c_586, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MANJEET', 'SINGH', 'no-email-dl-587@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_587 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805206855856901', 'Miscellaneous Insurance', NULL, NULL, '2025-10-11', '2026-10-11', '1970-01-01', 0.0, 0.0, @curr_c_587, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PATEL', 'MOHISHKUMAR HASMUKHBHAI', 'no-email-dl-588@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_588 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805207927155900000', 'Miscellaneous Insurance', NULL, NULL, '2025-10-25', '2027-10-26', '1970-01-01', 0.0, 0.0, @curr_c_588, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ASHISH', 'RAI CHOPRA', 'no-email-dl-589@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_589 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2866204374444702', 'Miscellaneous Insurance', NULL, NULL, '2025-10-26', '2027-10-27', '1970-01-01', 0.0, 0.0, @curr_c_589, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('AASHUTOSH', 'KUMAR SINGH', 'no-email-dl-590@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_590 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33469472202502', 'Miscellaneous Insurance', NULL, NULL, '2025-10-02', '2026-10-02', '1970-01-01', 0.0, 0.0, @curr_c_590, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Pandurang', 'Harishchndra Gurav', 'no-email-dl-591@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_591 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('32777530202503', 'Miscellaneous Insurance', NULL, NULL, '2025-10-17', '2026-10-17', '1970-01-01', 0.0, 0.0, @curr_c_591, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Harsh', 'Mishra', 'no-email-dl-592@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_592 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('32793120202503', 'Miscellaneous Insurance', NULL, NULL, '2025-10-26', '2026-10-26', '1970-01-01', 0.0, 0.0, @curr_c_592, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Prashant', 'Mahajan', 'no-email-dl-593@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_593 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('32006061202502', 'Miscellaneous Insurance', NULL, NULL, '2025-10-28', '2027-10-29', '1970-01-01', 0.0, 0.0, @curr_c_593, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Arjun', 'Singh', 'no-email-dl-594@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_594 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('32038311202504', 'Miscellaneous Insurance', NULL, NULL, '2025-10-28', '2026-10-28', '1970-01-01', 0.0, 0.0, @curr_c_594, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Prateek', 'Sharma', 'no-email-dl-595@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_595 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('920222528680746878', 'Miscellaneous Insurance', NULL, NULL, '2025-10-10', '2026-10-10', '1970-01-01', 0.0, 0.0, @curr_c_595, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mrs.', 'Rajni', 'no-email-dl-596@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_596 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('920222528680742747', 'Miscellaneous Insurance', NULL, NULL, '2025-10-11', '2026-10-11', '1970-01-01', 0.0, 0.0, @curr_c_596, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mk', 'Mohammed Najeeb', 'no-email-dl-597@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_597 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('26-21-0013074-04', 'Miscellaneous Insurance', NULL, NULL, '2025-10-20', '2026-10-20', '1970-01-01', 0.0, 0.0, @curr_c_597, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Paresh', 'Parmar', 'no-email-dl-598@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_598 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-21-0091577-04', 'Miscellaneous Insurance', NULL, NULL, '2025-10-28', '2026-10-28', '1970-01-01', 0.0, 0.0, @curr_c_598, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Arun Kumar Mishra', 'no-email-dl-599@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_599 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('71946798', 'Miscellaneous Insurance', NULL, NULL, '2025-10-01', '2026-10-01', '1970-01-01', 0.0, 0.0, @curr_c_599, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'KAILASH MUNDRA', 'no-email-dl-600@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_600 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('71611557', 'Miscellaneous Insurance', NULL, NULL, '2025-10-03', '2026-10-03', '1970-01-01', 0.0, 0.0, @curr_c_600, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'KAMAL KISHORE SINGH', 'no-email-dl-601@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_601 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('70845544', 'Miscellaneous Insurance', NULL, NULL, '2025-10-03', '2026-10-03', '1970-01-01', 0.0, 0.0, @curr_c_601, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'SHYAMSINH SHANKARSIN CHAUHAN', 'no-email-dl-602@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_602 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('72294825', 'Miscellaneous Insurance', NULL, NULL, '2025-10-04', '2026-10-04', '1970-01-01', 0.0, 0.0, @curr_c_602, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS', 'Purnima Batuk Maniar', 'no-email-dl-603@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_603 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('47210313', 'Miscellaneous Insurance', NULL, NULL, '2025-10-07', '2028-10-07', '1970-01-01', 0.0, 0.0, @curr_c_603, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Rohit Moon', 'no-email-dl-604@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_604 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('18439758', 'Miscellaneous Insurance', NULL, NULL, '2025-10-09', '2026-10-09', '1970-01-01', 0.0, 0.0, @curr_c_604, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'SUNIL GANPAT BANKAR', 'no-email-dl-605@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_605 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('72460330', 'Miscellaneous Insurance', NULL, NULL, '2025-10-09', '2026-10-09', '1970-01-01', 0.0, 0.0, @curr_c_605, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS', 'REETA DEVI', 'no-email-dl-606@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_606 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('72592471', 'Miscellaneous Insurance', NULL, NULL, '2025-10-12', '2026-10-12', '1970-01-01', 0.0, 0.0, @curr_c_606, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Jasbir Singh', 'no-email-dl-607@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_607 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('71464413', 'Miscellaneous Insurance', NULL, NULL, '2025-10-14', '2026-10-14', '1970-01-01', 0.0, 0.0, @curr_c_607, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'AKHILESH RANJAN', 'no-email-dl-608@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_608 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('72941522', 'Miscellaneous Insurance', NULL, NULL, '2025-10-18', '2026-10-18', '1970-01-01', 0.0, 0.0, @curr_c_608, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Kamal Kumar Malkani', 'no-email-dl-609@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_609 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('47947906', 'Miscellaneous Insurance', NULL, NULL, '2025-10-20', '2027-10-21', '1970-01-01', 0.0, 0.0, @curr_c_609, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Ishwar Prasad Kashyap', 'no-email-dl-610@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_610 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('13202255', 'Miscellaneous Insurance', NULL, NULL, '2025-10-23', '2026-10-23', '1970-01-01', 0.0, 0.0, @curr_c_610, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Mangesh Prabhakar Kasar', 'no-email-dl-611@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_611 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('18637234', 'Miscellaneous Insurance', NULL, NULL, '2025-10-24', '2026-10-24', '1970-01-01', 0.0, 0.0, @curr_c_611, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Rajesh K Mishra', 'no-email-dl-612@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_612 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10846564', 'Miscellaneous Insurance', NULL, NULL, '2025-10-25', '2027-10-26', '1970-01-01', 0.0, 0.0, @curr_c_612, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'NILESHKUMAR SHARMA', 'no-email-dl-613@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_613 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10839950', 'Miscellaneous Insurance', NULL, NULL, '2025-10-26', '2026-10-26', '1970-01-01', 0.0, 0.0, @curr_c_613, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Vinod Chaudhary', 'no-email-dl-614@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_614 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('46777340', 'Miscellaneous Insurance', NULL, NULL, '2025-10-26', '2026-10-26', '1970-01-01', 0.0, 0.0, @curr_c_614, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'MALKIT SINGH', 'no-email-dl-615@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_615 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('70397076', 'Miscellaneous Insurance', NULL, NULL, '2025-10-26', '2026-10-26', '1970-01-01', 0.0, 0.0, @curr_c_615, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Mohd Mikail Mohd Israil Supariwala', 'no-email-dl-616@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_616 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('20802127', 'Miscellaneous Insurance', NULL, NULL, '2025-10-28', '2026-10-28', '1970-01-01', 0.0, 0.0, @curr_c_616, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Amarjeet Singh Babbar', 'no-email-dl-617@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_617 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11710740', 'Miscellaneous Insurance', NULL, NULL, '2025-10-29', '2026-10-29', '1970-01-01', 0.0, 0.0, @curr_c_617, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'NAIR MOHANAN C', 'no-email-dl-618@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_618 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('72458298', 'Miscellaneous Insurance', NULL, NULL, '2025-10-31', '2026-10-31', '1970-01-01', 0.0, 0.0, @curr_c_618, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'SHRIKANT  SHARMA', 'no-email-dl-619@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_619 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('72535275', 'Miscellaneous Insurance', NULL, NULL, '2025-10-11', '2026-10-11', '1970-01-01', 0.0, 0.0, @curr_c_619, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('HARNARAYAN', 'SACHAN', 'no-email-dl-620@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_620 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9340112303011809', 'Miscellaneous Insurance', NULL, NULL, '2025-09-01', '2026-09-01', '1970-01-01', 0.0, 0.0, @curr_c_620, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr.OMBATHIVELI', 'PADMANABHAN MURALI', 'no-email-dl-621@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_621 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4715112002020030', 'Miscellaneous Insurance', NULL, NULL, '2025-09-01', '2027-09-02', '1970-01-01', 0.0, 0.0, @curr_c_621, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'DIVYANSHU SINGH CHAMIYAL .', 'no-email-dl-622@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_622 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('70816781', 'Miscellaneous Insurance', NULL, NULL, '2025-09-02', '2026-09-02', '1970-01-01', 0.0, 0.0, @curr_c_622, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VIKAS', 'KUMAR SRIVASTAVA', 'no-email-dl-623@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_623 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9611111606212922', 'Miscellaneous Insurance', NULL, NULL, '2025-09-02', '2026-09-02', '1970-01-01', 0.0, 0.0, @curr_c_623, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS', 'LAXMI DEVI', 'no-email-dl-624@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_624 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('89067415', 'Miscellaneous Insurance', NULL, NULL, '2025-09-02', '2026-09-02', '1970-01-01', 0.0, 0.0, @curr_c_624, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('70813486', 'Miscellaneous Insurance', NULL, NULL, '2025-09-02', '2026-09-02', '1970-01-01', 0.0, 0.0, @curr_c_622, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Swapnil Ramesh Bhavar', 'no-email-dl-626@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_626 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('45723989', 'Miscellaneous Insurance', NULL, NULL, '2025-09-02', '2026-09-02', '1970-01-01', 0.0, 0.0, @curr_c_626, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Nishant', 'Garud', 'no-email-dl-627@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_627 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6473112204014634', 'Miscellaneous Insurance', NULL, NULL, '2025-09-02', '2026-09-02', '1970-01-01', 0.0, 0.0, @curr_c_627, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33311519', 'Miscellaneous Insurance', NULL, NULL, '2025-09-02', '2026-09-02', '1970-01-01', 0.0, 0.0, @curr_c_624, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('M', 'PUSHPA KUMARI', 'no-email-dl-629@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_629 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1473112006045893', 'Miscellaneous Insurance', NULL, NULL, '2025-09-03', '2026-09-03', '1970-01-01', 0.0, 0.0, @curr_c_629, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('GAUTAM', 'DHANESWAR MISHRA', 'no-email-dl-630@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_630 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8412112204040345', 'Miscellaneous Insurance', NULL, NULL, '2025-09-03', '2026-09-03', '1970-01-01', 0.0, 0.0, @curr_c_630, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MAHANTHA', 'SWAMY MADALAGEREVEERAN', 'no-email-dl-631@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_631 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8486111907076310', 'Miscellaneous Insurance', NULL, NULL, '2025-09-05', '2026-09-05', '1970-01-01', 0.0, 0.0, @curr_c_631, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'AJODHYANATH TRIPATHY', 'no-email-dl-632@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_632 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('13033757', 'Miscellaneous Insurance', NULL, NULL, '2025-09-07', '2027-09-08', '1970-01-01', 0.0, 0.0, @curr_c_632, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('GADIPERTHI', 'SIVARAM', 'no-email-dl-633@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_633 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3503111907099643', 'Miscellaneous Insurance', NULL, NULL, '2025-09-07', '2026-09-07', '1970-01-01', 0.0, 0.0, @curr_c_633, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('BALAJI', 'DEVATHA', 'no-email-dl-634@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_634 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3091112006045607', 'Miscellaneous Insurance', NULL, NULL, '2025-09-07', '2026-09-07', '1970-01-01', 0.0, 0.0, @curr_c_634, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('A.JEGAN', '', 'no-email-dl-635@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_635 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3600112204072599', 'Miscellaneous Insurance', NULL, NULL, '2025-09-07', '2026-09-07', '1970-01-01', 0.0, 0.0, @curr_c_635, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Kalavadia Jayesh Navinchandra', 'no-email-dl-636@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_636 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11572906', 'Miscellaneous Insurance', NULL, NULL, '2025-09-07', '2026-09-07', '1970-01-01', 0.0, 0.0, @curr_c_636, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('GADIPARTI', 'NARASIMHA RAO', 'no-email-dl-637@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_637 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1887111907004638', 'Miscellaneous Insurance', NULL, NULL, '2025-09-07', '2026-09-07', '1970-01-01', 0.0, 0.0, @curr_c_637, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('C', 'R CHANDRASHEKAR', 'no-email-dl-638@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_638 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3378111907078244', 'Miscellaneous Insurance', NULL, NULL, '2025-09-08', '2026-09-08', '1970-01-01', 0.0, 0.0, @curr_c_638, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VRUSHAB', 'GOSALIA', 'no-email-dl-639@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_639 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4828112102027224', 'Miscellaneous Insurance', NULL, NULL, '2025-09-09', '2028-09-09', '1970-01-01', 0.0, 0.0, @curr_c_639, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DALJINDER', 'SINGH', 'no-email-dl-640@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_640 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5306112303085950', 'Miscellaneous Insurance', NULL, NULL, '2025-09-09', '2026-09-09', '1970-01-01', 0.0, 0.0, @curr_c_640, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VATHSALA', 'SHARMA', 'no-email-dl-641@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_641 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8604112303073623', 'Miscellaneous Insurance', NULL, NULL, '2025-09-09', '2026-09-09', '1970-01-01', 0.0, 0.0, @curr_c_641, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'PARSHURAM B KANDALGAONKAR', 'no-email-dl-642@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_642 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('71194826', 'Miscellaneous Insurance', NULL, NULL, '2025-09-09', '2026-09-09', '1970-01-01', 0.0, 0.0, @curr_c_642, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS', 'SWATI CHAWLA', 'no-email-dl-643@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_643 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1245111602214525', 'Miscellaneous Insurance', NULL, NULL, '2025-09-09', '2026-09-09', '1970-01-01', 0.0, 0.0, @curr_c_643, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VENKATESWARARAO', 'ELURU', 'no-email-dl-644@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_644 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1589112105000001', 'Miscellaneous Insurance', NULL, NULL, '2025-09-11', '2026-09-11', '1970-01-01', 0.0, 0.0, @curr_c_644, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'JITENDRA CHOUHAN .', 'no-email-dl-645@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_645 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('70950664', 'Miscellaneous Insurance', NULL, NULL, '2025-09-11', '2026-09-11', '1970-01-01', 0.0, 0.0, @curr_c_645, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'SANTOSH KUMAR PATRA', 'no-email-dl-646@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_646 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('17984637', 'Miscellaneous Insurance', NULL, NULL, '2025-09-12', '2026-09-12', '1970-01-01', 0.0, 0.0, @curr_c_646, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('AMIT', 'RAWAT', 'no-email-dl-647@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_647 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4481111709044116', 'Miscellaneous Insurance', NULL, NULL, '2025-09-12', '2026-09-12', '1970-01-01', 0.0, 0.0, @curr_c_647, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('T', 'S       VENKATESWARAN', 'no-email-dl-648@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_648 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2065111507211346', 'Miscellaneous Insurance', NULL, NULL, '2025-09-12', '2026-09-12', '1970-01-01', 0.0, 0.0, @curr_c_648, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'HEMANT GUPTA', 'no-email-dl-649@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_649 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('70520808', 'Miscellaneous Insurance', NULL, NULL, '2025-09-14', '2026-09-14', '1970-01-01', 0.0, 0.0, @curr_c_649, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VALLURUPALLI', 'SUDHA SWAROOP', 'no-email-dl-650@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_650 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7150111907040433', 'Miscellaneous Insurance', NULL, NULL, '2025-09-14', '2026-09-14', '1970-01-01', 0.0, 0.0, @curr_c_650, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'PRASANTA KUMAR KARMAKAR .', 'no-email-dl-651@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_651 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('70528234', 'Miscellaneous Insurance', NULL, NULL, '2025-09-15', '2026-09-15', '1970-01-01', 0.0, 0.0, @curr_c_651, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Sunil Nalawade', 'no-email-dl-652@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_652 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11597685', 'Miscellaneous Insurance', NULL, NULL, '2025-09-16', '2026-09-16', '1970-01-01', 0.0, 0.0, @curr_c_652, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr.NINAN', 'PHILIP', 'no-email-dl-653@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_653 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5211112002050515', 'Miscellaneous Insurance', NULL, NULL, '2025-09-17', '2027-09-18', '1970-01-01', 0.0, 0.0, @curr_c_653, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PRADEEP', 'KARMAKAR', 'no-email-dl-654@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_654 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3083111808247456', 'Miscellaneous Insurance', NULL, NULL, '2025-09-18', '2026-09-18', '1970-01-01', 0.0, 0.0, @curr_c_654, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SANJAY', '', 'no-email-dl-655@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_655 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6318112303042442', 'Miscellaneous Insurance', NULL, NULL, '2025-09-19', '2026-09-19', '1970-01-01', 0.0, 0.0, @curr_c_655, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Hemant Dhobale', 'no-email-dl-656@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_656 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11599493', 'Miscellaneous Insurance', NULL, NULL, '2025-09-19', '2026-09-19', '1970-01-01', 0.0, 0.0, @curr_c_656, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAMESH', 'KUMAR SINGH', 'no-email-dl-657@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_657 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7217112006068155', 'Miscellaneous Insurance', NULL, NULL, '2025-09-19', '2026-09-19', '1970-01-01', 0.0, 0.0, @curr_c_657, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PRATEEK', 'DUBEY', 'no-email-dl-658@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_658 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4153112105031117', 'Miscellaneous Insurance', NULL, NULL, '2025-09-21', '2026-09-21', '1970-01-01', 0.0, 0.0, @curr_c_658, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ADITYA', 'SAHAY', 'no-email-dl-659@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_659 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1119112303078055', 'Miscellaneous Insurance', NULL, NULL, '2025-09-21', '2026-09-21', '1970-01-01', 0.0, 0.0, @curr_c_659, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'PRAVEEN KATIYAR', 'no-email-dl-660@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_660 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('14866291', 'Miscellaneous Insurance', NULL, NULL, '2025-09-21', '2026-09-21', '1970-01-01', 0.0, 0.0, @curr_c_660, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SANGAMESH', 'KASHINATH SARANGAMATH', 'no-email-dl-661@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_661 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4999112204027845', 'Miscellaneous Insurance', NULL, NULL, '2025-09-23', '2026-09-23', '1970-01-01', 0.0, 0.0, @curr_c_661, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('AKASH', 'JAISWAL', 'no-email-dl-662@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_662 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7664111907065963', 'Miscellaneous Insurance', NULL, NULL, '2025-09-24', '2026-09-24', '1970-01-01', 0.0, 0.0, @curr_c_662, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('AKSHAY', 'DESHPANDE', 'no-email-dl-663@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_663 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9272112204035015', 'Miscellaneous Insurance', NULL, NULL, '2025-09-25', '2026-09-25', '1970-01-01', 0.0, 0.0, @curr_c_663, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'SANDEEP SUBHASH JAHAGIDAR', 'no-email-dl-664@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_664 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10791878', 'Miscellaneous Insurance', NULL, NULL, '2025-09-25', '2026-09-25', '1970-01-01', 0.0, 0.0, @curr_c_664, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SURAJ', 'BHAGAT', 'no-email-dl-665@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_665 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8173111903205906', 'Miscellaneous Insurance', NULL, NULL, '2025-09-26', '2026-09-26', '1970-01-01', 0.0, 0.0, @curr_c_665, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DATTATRAY', 'KUNDLIK GORE', 'no-email-dl-666@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_666 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3132112006068952', 'Miscellaneous Insurance', NULL, NULL, '2025-09-27', '2026-09-27', '1970-01-01', 0.0, 0.0, @curr_c_666, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RUMA', 'DEY', 'no-email-dl-667@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_667 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4352111804231104', 'Miscellaneous Insurance', NULL, NULL, '2025-09-28', '2026-09-28', '1970-01-01', 0.0, 0.0, @curr_c_667, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('JITESH', 'MEHTA', 'no-email-dl-668@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_668 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3766112004299215', 'Miscellaneous Insurance', NULL, NULL, '2025-09-28', '2026-09-28', '1970-01-01', 0.0, 0.0, @curr_c_668, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'PRASOON SINGH', 'no-email-dl-669@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_669 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('70609452', 'Miscellaneous Insurance', NULL, NULL, '2025-09-28', '2026-09-28', '1970-01-01', 0.0, 0.0, @curr_c_669, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANAND', 'KUMAR AHUJA', 'no-email-dl-670@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_670 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7421111709012786', 'Miscellaneous Insurance', NULL, NULL, '2025-09-28', '2026-09-28', '1970-01-01', 0.0, 0.0, @curr_c_670, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANUBHA', 'LAL', 'no-email-dl-671@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_671 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4814111904243438', 'Miscellaneous Insurance', NULL, NULL, '2025-09-29', '2026-09-29', '1970-01-01', 0.0, 0.0, @curr_c_671, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS', 'Aarti Sharma', 'no-email-dl-672@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_672 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('14866976', 'Miscellaneous Insurance', NULL, NULL, '2025-09-29', '2026-09-29', '1970-01-01', 0.0, 0.0, @curr_c_672, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('FASIN', 'KATTEKKADAN', 'no-email-dl-673@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_673 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2905111907023518', 'Miscellaneous Insurance', NULL, NULL, '2025-09-29', '2026-09-29', '1970-01-01', 0.0, 0.0, @curr_c_673, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MANOJ', 'KUMAR GUPTA', 'no-email-dl-674@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_674 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6164112204098620', 'Miscellaneous Insurance', NULL, NULL, '2025-09-29', '2026-09-29', '1970-01-01', 0.0, 0.0, @curr_c_674, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ADITYA', 'PRAKASH SINGH', 'no-email-dl-675@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_675 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1849111804271682', 'Miscellaneous Insurance', NULL, NULL, '2025-09-29', '2026-09-29', '1970-01-01', 0.0, 0.0, @curr_c_675, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('AKHIL', 'ASHOK THEKKUVEETIL', 'no-email-dl-676@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_676 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3261112004200505', 'Miscellaneous Insurance', NULL, NULL, '2025-09-29', '2026-09-29', '1970-01-01', 0.0, 0.0, @curr_c_676, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR.KOTAGIRI', 'VENKATESHWARLU', 'no-email-dl-677@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_677 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3077111808057557', 'Miscellaneous Insurance', NULL, NULL, '2025-09-29', '2026-09-29', '1970-01-01', 0.0, 0.0, @curr_c_677, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Dipankar', 'Bose', 'no-email-dl-678@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_678 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('32671394202503', 'Miscellaneous Insurance', NULL, NULL, '2025-09-01', '2026-09-01', '1970-01-01', 0.0, 0.0, @curr_c_678, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Padmaja', 'Adusumilli', 'no-email-dl-679@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_679 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-21-0069654-04', 'Miscellaneous Insurance', NULL, NULL, '2025-09-05', '2026-09-05', '1970-01-01', 0.0, 0.0, @curr_c_679, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Manish', 'Chaudhary', 'no-email-dl-680@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_680 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-21-0069312-04', 'Miscellaneous Insurance', NULL, NULL, '2025-09-05', '2026-09-05', '1970-01-01', 0.0, 0.0, @curr_c_680, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mahima', 'Gupta', 'no-email-dl-681@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_681 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-19-0013635-07', 'Miscellaneous Insurance', NULL, NULL, '2025-09-13', '2026-09-13', '1970-01-01', 0.0, 0.0, @curr_c_681, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mukesh', 'Surana', 'no-email-dl-682@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_682 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('31946560202504', 'Miscellaneous Insurance', NULL, NULL, '2025-09-13', '2026-09-13', '1970-01-01', 0.0, 0.0, @curr_c_682, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ARUN', 'KUMAR', 'no-email-dl-683@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_683 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33426304202502', 'Miscellaneous Insurance', NULL, NULL, '2025-09-13', '2026-09-13', '1970-01-01', 0.0, 0.0, @curr_c_683, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Amogh', 'Madari', 'no-email-dl-684@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_684 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-17-0002820-10', 'Miscellaneous Insurance', NULL, NULL, '2025-09-16', '2026-09-16', '1970-01-01', 0.0, 0.0, @curr_c_684, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Dhruv', 'A  Kamboj', 'no-email-dl-685@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_685 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('23-20-0153133-05', 'Miscellaneous Insurance', NULL, NULL, '2025-09-25', '2026-09-25', '1970-01-01', 0.0, 0.0, @curr_c_685, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Arun', 'Kumar', 'no-email-dl-686@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_686 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('32728561202503', 'Miscellaneous Insurance', NULL, NULL, '2025-09-25', '2026-09-25', '1970-01-01', 0.0, 0.0, @curr_c_686, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANIL', 'KUMAR SHRIVASTAV', 'no-email-dl-687@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_687 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33455730202501', 'Miscellaneous Insurance', NULL, NULL, '2025-09-26', '2026-09-26', '1970-01-01', 0.0, 0.0, @curr_c_687, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MOHAMMED', 'NISAR KHAN', 'no-email-dl-688@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_688 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('31976080202504', 'Miscellaneous Insurance', NULL, NULL, '2025-09-27', '2026-09-27', '1970-01-01', 0.0, 0.0, @curr_c_688, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Pankaj', 'Goyal', 'no-email-dl-689@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_689 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-17-0011867-11', 'Miscellaneous Insurance', NULL, NULL, '2025-09-29', '2026-09-29', '1970-01-01', 0.0, 0.0, @curr_c_689, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Vijai', 'DEEP SINGH', 'no-email-dl-690@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_690 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('31-25-0277510-07', 'Miscellaneous Insurance', NULL, NULL, '2025-09-29', '2026-09-29', '1970-01-01', 0.0, 0.0, @curr_c_690, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SARABJEET', 'SINGH CHANEY', 'no-email-dl-691@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_691 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805206774869401', 'Miscellaneous Insurance', NULL, NULL, '2025-09-02', '2026-09-02', '1970-01-01', 0.0, 0.0, @curr_c_691, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Sagar', 'Vishwanath Bhosle', 'no-email-dl-692@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_692 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('PROHLR111256552', 'Miscellaneous Insurance', NULL, NULL, '2025-09-10', '2026-09-10', '1970-01-01', 0.0, 0.0, @curr_c_692, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KURAKULA', 'CHARAN CHANDRA', 'no-email-dl-693@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_693 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2825/57664859/08/000', 'Miscellaneous Insurance', NULL, NULL, '2025-09-18', '2026-09-18', '1970-01-01', 0.0, 0.0, @curr_c_693, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUDESH', 'KUMARI', 'no-email-dl-694@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_694 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805203721003905', 'Miscellaneous Insurance', NULL, NULL, '2025-09-26', '2026-09-26', '1970-01-01', 0.0, 0.0, @curr_c_694, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mutyala', 'Satyanarayanarao', 'no-email-dl-695@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_695 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('34341684202501', 'Miscellaneous Insurance', NULL, NULL, '2025-09-28', '2026-09-28', '1970-01-01', 0.0, 0.0, @curr_c_695, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ASHU', 'DIXIT', 'no-email-dl-696@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_696 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('36058931501', 'Miscellaneous Insurance', NULL, NULL, '2025-09-19', '2026-09-19', '1970-01-01', 0.0, 0.0, @curr_c_696, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('HINSON', 'P K', 'no-email-dl-697@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_697 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9772112006050839', 'Miscellaneous Insurance', NULL, NULL, '2025-08-01', '2026-08-01', '1970-01-01', 0.0, 0.0, @curr_c_697, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Yenigalla', 'Saikiran', 'no-email-dl-698@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_698 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1756111907092148', 'Miscellaneous Insurance', NULL, NULL, '2025-08-01', '2026-08-01', '1970-01-01', 0.0, 0.0, @curr_c_698, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ADITYA', 'KAURA', 'no-email-dl-699@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_699 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8962112006017714', 'Miscellaneous Insurance', NULL, NULL, '2025-08-02', '2026-08-02', '1970-01-01', 0.0, 0.0, @curr_c_699, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DHRUV', 'MURGAI', 'no-email-dl-700@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_700 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6462111907024175', 'Miscellaneous Insurance', NULL, NULL, '2025-08-03', '2026-08-03', '1970-01-01', 0.0, 0.0, @curr_c_700, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('LAVUDE', 'SRINIVAS .', 'no-email-dl-701@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_701 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4024112402096256', 'Miscellaneous Insurance', NULL, NULL, '2025-08-06', '2026-08-06', '1970-01-01', 0.0, 0.0, @curr_c_701, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KAPIL', '', 'no-email-dl-702@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_702 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5321112303028425', 'Miscellaneous Insurance', NULL, NULL, '2025-08-06', '2026-08-06', '1970-01-01', 0.0, 0.0, @curr_c_702, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SHIV', 'SINGH', 'no-email-dl-703@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_703 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2613111907073256', 'Miscellaneous Insurance', NULL, NULL, '2025-08-07', '2026-08-07', '1970-01-01', 0.0, 0.0, @curr_c_703, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MD', 'MISBAH AHMED', 'no-email-dl-704@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_704 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6782112303032841', 'Miscellaneous Insurance', NULL, NULL, '2025-08-07', '2026-08-07', '1970-01-01', 0.0, 0.0, @curr_c_704, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANUJ', 'SAYAL', 'no-email-dl-705@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_705 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1707111808074078', 'Miscellaneous Insurance', NULL, NULL, '2025-08-08', '2026-08-08', '1970-01-01', 0.0, 0.0, @curr_c_705, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PRASAD', 'TUKARAM SAMGISKAR', 'no-email-dl-706@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_706 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6627111808078354', 'Miscellaneous Insurance', NULL, NULL, '2025-08-09', '2026-08-09', '1970-01-01', 0.0, 0.0, @curr_c_706, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ASHISH', 'KUMAR CHAUHAN', 'no-email-dl-707@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_707 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2404111907069038', 'Miscellaneous Insurance', NULL, NULL, '2025-08-09', '2026-08-09', '1970-01-01', 0.0, 0.0, @curr_c_707, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SANDEEP', 'KUMAR', 'no-email-dl-708@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_708 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1943111808032897', 'Miscellaneous Insurance', NULL, NULL, '2025-08-10', '2026-08-10', '1970-01-01', 0.0, 0.0, @curr_c_708, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ADITI', 'BISHT', 'no-email-dl-709@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_709 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9621112204007825', 'Miscellaneous Insurance', NULL, NULL, '2025-08-10', '2026-08-10', '1970-01-01', 0.0, 0.0, @curr_c_709, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VISHWANATH', 'SHARMA', 'no-email-dl-710@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_710 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6991112006026705', 'Miscellaneous Insurance', NULL, NULL, '2025-08-10', '2026-08-10', '1970-01-01', 0.0, 0.0, @curr_c_710, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9502112204067560', 'Miscellaneous Insurance', NULL, NULL, '2025-08-10', '2026-08-10', '1970-01-01', 0.0, 0.0, @curr_c_709, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAJESH', 'BHANJI HELIYA', 'no-email-dl-712@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_712 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1085111907091780', 'Miscellaneous Insurance', NULL, NULL, '2025-08-11', '2026-08-11', '1970-01-01', 0.0, 0.0, @curr_c_712, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MUKESH', 'CHANDRA RAJPOOT', 'no-email-dl-713@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_713 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2631112006001730', 'Miscellaneous Insurance', NULL, NULL, '2025-08-11', '2026-08-11', '1970-01-01', 0.0, 0.0, @curr_c_713, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('HARIKA', 'PUTCHAKAYALA', 'no-email-dl-714@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_714 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2061112105050989', 'Miscellaneous Insurance', NULL, NULL, '2025-08-12', '2026-08-12', '1970-01-01', 0.0, 0.0, @curr_c_714, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAJEEV', 'TULI', 'no-email-dl-715@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_715 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5997112204096071', 'Miscellaneous Insurance', NULL, NULL, '2025-08-12', '2026-08-12', '1970-01-01', 0.0, 0.0, @curr_c_715, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MAHESH', 'RAMAKANT  DAREKAR', 'no-email-dl-716@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_716 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8925111808075803', 'Miscellaneous Insurance', NULL, NULL, '2025-08-14', '2026-08-14', '1970-01-01', 0.0, 0.0, @curr_c_716, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANIL', 'KUMAR CHILUKURI', 'no-email-dl-717@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_717 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9800112006037554', 'Miscellaneous Insurance', NULL, NULL, '2025-08-14', '2026-08-14', '1970-01-01', 0.0, 0.0, @curr_c_717, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Talamala', 'Ravi  kumar', 'no-email-dl-718@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_718 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4598112402047116', 'Miscellaneous Insurance', NULL, NULL, '2025-08-16', '2026-08-16', '1970-01-01', 0.0, 0.0, @curr_c_718, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VIDYAWATI', '', 'no-email-dl-719@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_719 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5450112006048801', 'Miscellaneous Insurance', NULL, NULL, '2025-08-16', '2026-08-16', '1970-01-01', 0.0, 0.0, @curr_c_719, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('AMIT', 'SRIVASTAVA', 'no-email-dl-720@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_720 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8104112006036077', 'Miscellaneous Insurance', NULL, NULL, '2025-08-16', '2026-08-16', '1970-01-01', 0.0, 0.0, @curr_c_720, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VISHNU', 'PRASATH  GOPALAKRISHNAN', 'no-email-dl-721@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_721 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1415112501028821', 'Miscellaneous Insurance', NULL, NULL, '2025-08-16', '2026-08-16', '1970-01-01', 0.0, 0.0, @curr_c_721, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('S', 'K SRINIVASA', 'no-email-dl-722@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_722 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1368112204001771', 'Miscellaneous Insurance', NULL, NULL, '2025-08-17', '2026-08-17', '1970-01-01', 0.0, 0.0, @curr_c_722, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('JAY', 'KUMAR SINGH', 'no-email-dl-723@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_723 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6924112204025625', 'Miscellaneous Insurance', NULL, NULL, '2025-08-17', '2026-08-17', '1970-01-01', 0.0, 0.0, @curr_c_723, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'MAYANK KUMAR', 'no-email-dl-724@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_724 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5022161904075227', 'Miscellaneous Insurance', NULL, NULL, '2025-08-18', '2027-08-19', '1970-01-01', 0.0, 0.0, @curr_c_724, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SHUBHAM', 'KASHIV', 'no-email-dl-725@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_725 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2980112006008245', 'Miscellaneous Insurance', NULL, NULL, '2025-08-18', '2026-08-18', '1970-01-01', 0.0, 0.0, @curr_c_725, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Raj', 'Kishor  Singh', 'no-email-dl-726@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_726 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9835112402060345', 'Miscellaneous Insurance', NULL, NULL, '2025-08-19', '2026-08-19', '1970-01-01', 0.0, 0.0, @curr_c_726, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VIJAY', 'JINABHAI SHAH', 'no-email-dl-727@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_727 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7677112006092935', 'Miscellaneous Insurance', NULL, NULL, '2025-08-20', '2026-08-20', '1970-01-01', 0.0, 0.0, @curr_c_727, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('IRVINDER', 'SINGH', 'no-email-dl-728@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_728 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4780111903242415', 'Miscellaneous Insurance', NULL, NULL, '2025-08-21', '2026-08-21', '1970-01-01', 0.0, 0.0, @curr_c_728, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('BIKASH', 'KUMAR SINGH', 'no-email-dl-729@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_729 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2197112204080133', 'Miscellaneous Insurance', NULL, NULL, '2025-08-21', '2026-08-21', '1970-01-01', 0.0, 0.0, @curr_c_729, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ALFRED', 'DCOSTA', 'no-email-dl-730@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_730 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1293112006568392', 'Miscellaneous Insurance', NULL, NULL, '2025-08-22', '2026-08-22', '1970-01-01', 0.0, 0.0, @curr_c_730, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VISHAL', 'AGGARWAL', 'no-email-dl-731@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_731 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7044111903203659', 'Miscellaneous Insurance', NULL, NULL, '2025-08-22', '2026-08-22', '1970-01-01', 0.0, 0.0, @curr_c_731, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ALFRED', 'DCOSTA', 'no-email-dl-732@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_732 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1401112006562381', 'Miscellaneous Insurance', NULL, NULL, '2025-08-22', '2026-08-22', '1970-01-01', 0.0, 0.0, @curr_c_732, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5019111907095633', 'Miscellaneous Insurance', NULL, NULL, '2025-08-22', '2026-08-22', '1970-01-01', 0.0, 0.0, @curr_c_712, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('AMRIK', 'PANESAR', 'no-email-dl-734@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_734 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2088112006026210', 'Miscellaneous Insurance', NULL, NULL, '2025-08-22', '2026-08-22', '1970-01-01', 0.0, 0.0, @curr_c_734, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('JUGAL', 'KISHOR VYAS', 'no-email-dl-735@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_735 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3153112006099916', 'Miscellaneous Insurance', NULL, NULL, '2025-08-23', '2026-08-23', '1970-01-01', 0.0, 0.0, @curr_c_735, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ABHISHEK', 'KUMAR SINGH', 'no-email-dl-736@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_736 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3367112303038976', 'Miscellaneous Insurance', NULL, NULL, '2025-08-24', '2026-08-24', '1970-01-01', 0.0, 0.0, @curr_c_736, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2690162501027433', 'Miscellaneous Insurance', NULL, NULL, '2025-08-25', '2026-08-25', '1970-01-01', 0.0, 0.0, @curr_c_650, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('S.', 'SELVI', 'no-email-dl-738@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_738 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7847162501073440', 'Miscellaneous Insurance', NULL, NULL, '2025-08-28', '2026-08-28', '1970-01-01', 0.0, 0.0, @curr_c_738, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PRASAD', 'O A', 'no-email-dl-739@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_739 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2041111907067490', 'Miscellaneous Insurance', NULL, NULL, '2025-08-28', '2026-08-28', '1970-01-01', 0.0, 0.0, @curr_c_739, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR.RAHUL', 'AGARWAL', 'no-email-dl-740@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_740 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7979111707687537', 'Miscellaneous Insurance', NULL, NULL, '2025-08-28', '2026-08-28', '1970-01-01', 0.0, 0.0, @curr_c_740, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('FRANCIS', 'PAUL PANIKULAM', 'no-email-dl-741@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_741 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5738112006049770', 'Miscellaneous Insurance', NULL, NULL, '2025-08-28', '2026-08-28', '1970-01-01', 0.0, 0.0, @curr_c_741, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('N', 'SENTHIL KUMAR', 'no-email-dl-742@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_742 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8620112006048018', 'Miscellaneous Insurance', NULL, NULL, '2025-08-29', '2026-08-29', '1970-01-01', 0.0, 0.0, @curr_c_742, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('GOPAL', 'KRISHNA RAO', 'no-email-dl-743@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_743 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4780111808003473', 'Miscellaneous Insurance', NULL, NULL, '2025-08-29', '2026-08-29', '1970-01-01', 0.0, 0.0, @curr_c_743, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9019112006043042', 'Miscellaneous Insurance', NULL, NULL, '2025-08-29', '2026-08-29', '1970-01-01', 0.0, 0.0, @curr_c_738, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VIKASH', 'BUCHASIA', 'no-email-dl-745@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_745 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5225111907076660', 'Miscellaneous Insurance', NULL, NULL, '2025-08-29', '2026-08-29', '1970-01-01', 0.0, 0.0, @curr_c_745, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUDIPTO', 'DAS', 'no-email-dl-746@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_746 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8565112006097252', 'Miscellaneous Insurance', NULL, NULL, '2025-08-29', '2026-08-29', '1970-01-01', 0.0, 0.0, @curr_c_746, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('JITENDRA', 'MAHADEO GADRE', 'no-email-dl-747@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_747 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7080112204054684', 'Miscellaneous Insurance', NULL, NULL, '2025-08-29', '2026-08-29', '1970-01-01', 0.0, 0.0, @curr_c_747, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('JITENDRA', 'MAHADEO GADRE', 'no-email-dl-748@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_748 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7750112204025743', 'Miscellaneous Insurance', NULL, NULL, '2025-08-30', '2026-08-30', '1970-01-01', 0.0, 0.0, @curr_c_748, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR.TAMOJOY', 'CHAKMA', 'no-email-dl-749@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_749 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9603111804030272', 'Miscellaneous Insurance', NULL, NULL, '2025-08-30', '2027-08-31', '1970-01-01', 0.0, 0.0, @curr_c_749, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAHUL', 'KOUL', 'no-email-dl-750@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_750 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4960111907030010', 'Miscellaneous Insurance', NULL, NULL, '2025-08-30', '2026-08-30', '1970-01-01', 0.0, 0.0, @curr_c_750, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DHARMISTHABEN', 'JAYANTILAL  THAKKAR', 'no-email-dl-751@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_751 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4722112005025655', 'Miscellaneous Insurance', NULL, NULL, '2025-08-31', '2026-08-31', '1970-01-01', 0.0, 0.0, @curr_c_751, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUSHIL', 'KUMAR SAXENA', 'no-email-dl-752@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_752 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9110111808084936', 'Miscellaneous Insurance', NULL, NULL, '2025-08-31', '2026-08-31', '1970-01-01', 0.0, 0.0, @curr_c_752, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KAUSHAL', 'SHAH', 'no-email-dl-753@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_753 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2142112006072644', 'Miscellaneous Insurance', NULL, NULL, '2025-08-31', '2026-08-31', '1970-01-01', 0.0, 0.0, @curr_c_753, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SHAIK', 'RIYAZ', 'no-email-dl-754@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_754 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2454111907073296', 'Miscellaneous Insurance', NULL, NULL, '2025-08-31', '2026-08-31', '1970-01-01', 0.0, 0.0, @curr_c_754, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('BHARAT', 'BHUSHAN', 'no-email-dl-755@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_755 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('34187753202501', 'Miscellaneous Insurance', NULL, NULL, '2025-08-01', '2026-08-01', '1970-01-01', 0.0, 0.0, @curr_c_755, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS', 'Meeta Jain', 'no-email-dl-756@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_756 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('14585471', 'Miscellaneous Insurance', NULL, NULL, '2025-08-04', '2027-08-05', '1970-01-01', 0.0, 0.0, @curr_c_756, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('parixit', 'dwivedi', 'no-email-dl-757@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_757 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33350092202502', 'Miscellaneous Insurance', NULL, NULL, '2025-08-04', '2026-08-04', '1970-01-01', 0.0, 0.0, @curr_c_757, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33350094202502', 'Miscellaneous Insurance', NULL, NULL, '2025-08-04', '2026-08-04', '1970-01-01', 0.0, 0.0, @curr_c_757, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Sujata', 'Baveja', 'no-email-dl-759@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_759 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('32616884202503', 'Miscellaneous Insurance', NULL, NULL, '2025-08-06', '2026-08-06', '1970-01-01', 0.0, 0.0, @curr_c_759, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'NAVEEN GUHER', 'no-email-dl-760@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_760 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('87769958', 'Miscellaneous Insurance', NULL, NULL, '2025-08-08', '2026-08-08', '1970-01-01', 0.0, 0.0, @curr_c_760, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS', 'Prakriti Prabha', 'no-email-dl-761@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_761 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('45160940', 'Miscellaneous Insurance', NULL, NULL, '2025-08-09', '2026-08-09', '1970-01-01', 0.0, 0.0, @curr_c_761, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Amit Garg', 'no-email-dl-762@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_762 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11155033', 'Miscellaneous Insurance', NULL, NULL, '2025-08-09', '2026-08-09', '1970-01-01', 0.0, 0.0, @curr_c_762, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Deepak', 'Kumar', 'no-email-dl-763@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_763 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-21-0058826-04', 'Miscellaneous Insurance', NULL, NULL, '2025-08-10', '2026-08-10', '1970-01-01', 0.0, 0.0, @curr_c_763, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VIPIN', 'SRIVASTAVA', 'no-email-dl-764@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_764 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33361434202502', 'Miscellaneous Insurance', NULL, NULL, '2025-08-10', '2026-08-10', '1970-01-01', 0.0, 0.0, @curr_c_764, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33361342202502', 'Miscellaneous Insurance', NULL, NULL, '2025-08-10', '2026-08-10', '1970-01-01', 0.0, 0.0, @curr_c_764, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAJESH', 'SINGH', 'no-email-dl-766@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_766 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('31899316202504', 'Miscellaneous Insurance', NULL, NULL, '2025-08-11', '2026-08-11', '1970-01-01', 0.0, 0.0, @curr_c_766, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SHILPA', 'S UPADHYAY', 'no-email-dl-767@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_767 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('31911287202504', 'Miscellaneous Insurance', NULL, NULL, '2025-08-11', '2026-08-11', '1970-01-01', 0.0, 0.0, @curr_c_767, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ravi', 'Prakash Singh', 'no-email-dl-768@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_768 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('31-25-0200440-11', 'Miscellaneous Insurance', NULL, NULL, '2025-08-12', '2026-08-12', '1970-01-01', 0.0, 0.0, @curr_c_768, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'HARA BISWANATH SATPATHY', 'no-email-dl-769@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_769 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('17956202', 'Miscellaneous Insurance', NULL, NULL, '2025-08-15', '2026-08-15', '1970-01-01', 0.0, 0.0, @curr_c_769, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Paresh', 'Hareshbhai DANGARIYA', 'no-email-dl-770@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_770 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-21-0058932-04', 'Miscellaneous Insurance', NULL, NULL, '2025-08-16', '2026-08-16', '1970-01-01', 0.0, 0.0, @curr_c_770, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'VISHNU LAL', 'no-email-dl-771@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_771 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('70431056', 'Miscellaneous Insurance', NULL, NULL, '2025-08-16', '2026-08-16', '1970-01-01', 0.0, 0.0, @curr_c_771, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Rajiv', 'Sarkar', 'no-email-dl-772@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_772 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('D205236774', 'Miscellaneous Insurance', NULL, NULL, '2025-08-16', '2026-08-16', '1970-01-01', 0.0, 0.0, @curr_c_772, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'SWAROOP GHOSH', 'no-email-dl-773@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_773 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('70075000', 'Miscellaneous Insurance', NULL, NULL, '2025-08-17', '2026-08-17', '1970-01-01', 0.0, 0.0, @curr_c_773, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'AMIY TIWARI', 'no-email-dl-774@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_774 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('69799053', 'Miscellaneous Insurance', NULL, NULL, '2025-08-17', '2026-08-17', '1970-01-01', 0.0, 0.0, @curr_c_774, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Alok', 'Bharti', 'no-email-dl-775@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_775 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-21-0057309-04', 'Miscellaneous Insurance', NULL, NULL, '2025-08-19', '2026-08-19', '1970-01-01', 0.0, 0.0, @curr_c_775, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Sanjeev Bhadana', 'no-email-dl-776@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_776 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10745663', 'Miscellaneous Insurance', NULL, NULL, '2025-08-19', '2026-08-19', '1970-01-01', 0.0, 0.0, @curr_c_776, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS', 'GEETA KUMARI', 'no-email-dl-777@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_777 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10730507', 'Miscellaneous Insurance', NULL, NULL, '2025-08-19', '2026-08-19', '1970-01-01', 0.0, 0.0, @curr_c_777, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Vikas', 'Kumar', 'no-email-dl-778@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_778 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('32645186202503', 'Miscellaneous Insurance', NULL, NULL, '2025-08-21', '2026-08-21', '1970-01-01', 0.0, 0.0, @curr_c_778, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'KISHORE PARIDALA CHOUDHURY', 'no-email-dl-779@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_779 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('88558387', 'Miscellaneous Insurance', NULL, NULL, '2025-08-22', '2026-08-22', '1970-01-01', 0.0, 0.0, @curr_c_779, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'PRADEEP KUMAR PRADEEP KUMAR', 'no-email-dl-780@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_780 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10741637', 'Miscellaneous Insurance', NULL, NULL, '2025-08-22', '2026-08-22', '1970-01-01', 0.0, 0.0, @curr_c_780, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Rajesh', 'Roushan', 'no-email-dl-781@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_781 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-21-0063938-04', 'Miscellaneous Insurance', NULL, NULL, '2025-08-23', '2026-08-23', '1970-01-01', 0.0, 0.0, @curr_c_781, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Prakash', 'D', 'no-email-dl-782@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_782 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-20-0031353-05', 'Miscellaneous Insurance', NULL, NULL, '2025-08-23', '2026-08-23', '1970-01-01', 0.0, 0.0, @curr_c_782, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'VINAY KUMAR', 'no-email-dl-783@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_783 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('14523844', 'Miscellaneous Insurance', NULL, NULL, '2025-08-23', '2026-08-23', '1970-01-01', 0.0, 0.0, @curr_c_783, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Dina', 'Sadanand Ahire', 'no-email-dl-784@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_784 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('PROTOS050009536', 'Miscellaneous Insurance', NULL, NULL, '2025-08-23', '2026-08-23', '1970-01-01', 0.0, 0.0, @curr_c_784, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Anil Kumar Mishra', 'no-email-dl-785@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_785 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('70584528', 'Miscellaneous Insurance', NULL, NULL, '2025-08-24', '2026-08-24', '1970-01-01', 0.0, 0.0, @curr_c_785, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('M', 'NAGABHUSHANA RAO', 'no-email-dl-786@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_786 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('32655190202503', 'Miscellaneous Insurance', NULL, NULL, '2025-08-24', '2026-08-24', '1970-01-01', 0.0, 0.0, @curr_c_786, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('32652740202503', 'Miscellaneous Insurance', NULL, NULL, '2025-08-24', '2026-08-24', '1970-01-01', 0.0, 0.0, @curr_c_778, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Krishna', 'Nand Jha', 'no-email-dl-788@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_788 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-17-0006955-11', 'Miscellaneous Insurance', NULL, NULL, '2025-08-26', '2026-08-26', '1970-01-01', 0.0, 0.0, @curr_c_788, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Parminder', 'Shah', 'no-email-dl-789@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_789 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-21-0065796-04', 'Miscellaneous Insurance', NULL, NULL, '2025-08-27', '2026-08-27', '1970-01-01', 0.0, 0.0, @curr_c_789, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Deepak', 'Kumar', 'no-email-dl-790@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_790 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('31-25-0221410-04', 'Miscellaneous Insurance', NULL, NULL, '2025-08-27', '2026-08-27', '1970-01-01', 0.0, 0.0, @curr_c_790, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PRAVEEN', 'SINGH', 'no-email-dl-791@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_791 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33351941202502', 'Miscellaneous Insurance', NULL, NULL, '2025-08-27', '2026-08-27', '1970-01-01', 0.0, 0.0, @curr_c_791, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('mrs', 'Hemlata', 'no-email-dl-792@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_792 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('31929430202504', 'Miscellaneous Insurance', NULL, NULL, '2025-08-29', '2026-08-29', '1970-01-01', 0.0, 0.0, @curr_c_792, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUSHIL', 'JIMDHARI RAJBHAR', 'no-email-dl-793@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_793 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33396817202502', 'Miscellaneous Insurance', NULL, NULL, '2025-08-29', '2026-08-29', '1970-01-01', 0.0, 0.0, @curr_c_793, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Nakul', 'Sharma', 'no-email-dl-794@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_794 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-21-0066906-04', 'Miscellaneous Insurance', NULL, NULL, '2025-08-30', '2026-08-30', '1970-01-01', 0.0, 0.0, @curr_c_794, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Haricheran', 'Nellayi R', 'no-email-dl-795@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_795 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('23-19-0035447-07', 'Miscellaneous Insurance', NULL, NULL, '2025-08-30', '2026-08-30', '1970-01-01', 0.0, 0.0, @curr_c_795, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ankit', 'Bansal', 'no-email-dl-796@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_796 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('31-25-0215334-04', 'Miscellaneous Insurance', NULL, NULL, '2025-08-30', '2028-08-30', '1970-01-01', 0.0, 0.0, @curr_c_796, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Manish Virmani', 'no-email-dl-797@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_797 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11557306', 'Miscellaneous Insurance', NULL, NULL, '2025-08-30', '2026-08-30', '1970-01-01', 0.0, 0.0, @curr_c_797, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'GUNVANT VYAS', 'no-email-dl-798@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_798 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33283004', 'Miscellaneous Insurance', NULL, NULL, '2025-08-30', '2026-08-30', '1970-01-01', 0.0, 0.0, @curr_c_798, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33397623202502', 'Miscellaneous Insurance', NULL, NULL, '2025-08-30', '2026-08-30', '1970-01-01', 0.0, 0.0, @curr_c_793, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'PRATIK LOHIA', 'no-email-dl-800@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_800 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10753545', 'Miscellaneous Insurance', NULL, NULL, '2025-08-31', '2026-08-31', '1970-01-01', 0.0, 0.0, @curr_c_800, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS', 'MANJU KHATRI', 'no-email-dl-801@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_801 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('12430447', 'Miscellaneous Insurance', NULL, NULL, '2025-08-31', '2026-08-31', '1970-01-01', 0.0, 0.0, @curr_c_801, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Govinda', 'Agrawal', 'no-email-dl-802@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_802 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-17-0006547-11', 'Miscellaneous Insurance', NULL, NULL, '2025-08-02', '2026-08-02', '1970-01-01', 0.0, 0.0, @curr_c_802, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Manjunath', 'L', 'no-email-dl-803@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_803 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('31-25-0179989-04', 'Miscellaneous Insurance', NULL, NULL, '2025-08-04', '2026-08-04', '1970-01-01', 0.0, 0.0, @curr_c_803, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Parmjit', 'Singh', 'no-email-dl-804@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_804 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-21-0056674-05', 'Miscellaneous Insurance', NULL, NULL, '2025-08-05', '2026-08-05', '1970-01-01', 0.0, 0.0, @curr_c_804, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Bhim', 'Bai Kognoor', 'no-email-dl-805@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_805 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-22-3713464-03', 'Miscellaneous Insurance', NULL, NULL, '2024-08-25', '2025-08-25', '1970-01-01', 0.0, 0.0, @curr_c_805, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'CHINMAY BHALCHANDRA DESAI', 'no-email-dl-806@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_806 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('32692774', 'Miscellaneous Insurance', NULL, NULL, '2025-08-03', '2027-08-04', '1970-01-01', 0.0, 0.0, @curr_c_806, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Uttam Kumar Mishra', 'no-email-dl-807@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_807 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11492310', 'Miscellaneous Insurance', NULL, NULL, '2025-08-04', '2026-08-04', '1970-01-01', 0.0, 0.0, @curr_c_807, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Sankalp', 'Srivastava', 'no-email-dl-808@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_808 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33363195202502', 'Miscellaneous Insurance', NULL, NULL, '2025-08-11', '2026-08-11', '1970-01-01', 0.0, 0.0, @curr_c_808, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33363191202502', 'Miscellaneous Insurance', NULL, NULL, '2025-08-11', '2026-08-11', '1970-01-01', 0.0, 0.0, @curr_c_808, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Rakesh', 'Ramesh Dalmia', 'no-email-dl-810@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_810 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33382707202502', 'Miscellaneous Insurance', NULL, NULL, '2025-08-29', '2026-08-29', '1970-01-01', 0.0, 0.0, @curr_c_810, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Kamlawati', 'Devi', 'no-email-dl-811@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_811 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('920222528240839452', 'Miscellaneous Insurance', NULL, NULL, '2025-08-18', '2026-08-18', '1970-01-01', 0.0, 0.0, @curr_c_811, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805206727966401', 'Miscellaneous Insurance', NULL, NULL, '2025-08-21', '2026-08-21', '1970-01-01', 0.0, 0.0, @curr_c_177, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SURESH', 'KUMAR CHOPRA', 'no-email-dl-813@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_813 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2865201901820704', 'Miscellaneous Insurance', NULL, NULL, '2025-08-22', '2027-08-23', '1970-01-01', 0.0, 0.0, @curr_c_813, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Abhishek Ramashray Vishwakarma', 'no-email-dl-814@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_814 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('86181415', 'Miscellaneous Insurance', NULL, NULL, '2025-07-02', '2026-07-02', '1970-01-01', 0.0, 0.0, @curr_c_814, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Jitendra Singh Bisen', 'no-email-dl-815@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_815 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('86270380', 'Miscellaneous Insurance', NULL, NULL, '2025-07-03', '2026-07-03', '1970-01-01', 0.0, 0.0, @curr_c_815, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Aakash Choudhary', 'no-email-dl-816@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_816 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11428807', 'Miscellaneous Insurance', NULL, NULL, '2025-07-06', '2028-07-06', '1970-01-01', 0.0, 0.0, @curr_c_816, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Om', 'Kumar', 'no-email-dl-817@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_817 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('32510047202503', 'Miscellaneous Insurance', NULL, NULL, '2025-07-07', '2026-07-07', '1970-01-01', 0.0, 0.0, @curr_c_817, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Sachin', 'Chauhan', 'no-email-dl-818@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_818 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33260754202502', 'Miscellaneous Insurance', NULL, NULL, '2025-07-10', '2026-07-10', '1970-01-01', 0.0, 0.0, @curr_c_818, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ms', 'Nagalakshmi M L', 'no-email-dl-819@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_819 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('86467544', 'Miscellaneous Insurance', NULL, NULL, '2025-07-10', '2026-07-10', '1970-01-01', 0.0, 0.0, @curr_c_819, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Sanjay Jajoo', 'no-email-dl-820@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_820 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10714972', 'Miscellaneous Insurance', NULL, NULL, '2025-07-11', '2026-07-11', '1970-01-01', 0.0, 0.0, @curr_c_820, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Nachiketa Sharma', 'no-email-dl-821@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_821 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('68482421', 'Miscellaneous Insurance', NULL, NULL, '2025-07-12', '2026-07-12', '1970-01-01', 0.0, 0.0, @curr_c_821, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ms', 'Suvarna Baburao Sanap', 'no-email-dl-822@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_822 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('55611503', 'Miscellaneous Insurance', NULL, NULL, '2025-07-13', '2026-07-13', '1970-01-01', 0.0, 0.0, @curr_c_822, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Shashi Kumar', 'no-email-dl-823@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_823 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('68648351', 'Miscellaneous Insurance', NULL, NULL, '2025-07-13', '2026-07-13', '1970-01-01', 0.0, 0.0, @curr_c_823, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ms', 'Ankita Maurya', 'no-email-dl-824@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_824 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('68253297', 'Miscellaneous Insurance', NULL, NULL, '2025-07-15', '2026-07-15', '1970-01-01', 0.0, 0.0, @curr_c_824, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Harsh', 'Vardhan', 'no-email-dl-825@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_825 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('34166191202501', 'Miscellaneous Insurance', NULL, NULL, '2025-07-23', '2026-07-23', '1970-01-01', 0.0, 0.0, @curr_c_825, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS.SHRUTI', 'VINAY BARPANDE', 'no-email-dl-826@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_826 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8564112105066101', 'Miscellaneous Insurance', NULL, NULL, '2025-07-01', '2026-07-01', '1970-01-01', 0.0, 0.0, @curr_c_826, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PRASANTH', 'THOOMBAYIL KUSUMAM', 'no-email-dl-827@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_827 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4685112006097162', 'Miscellaneous Insurance', NULL, NULL, '2025-07-03', '2026-07-03', '1970-01-01', 0.0, 0.0, @curr_c_827, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUJAY', 'KUMAR', 'no-email-dl-828@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_828 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3030112105076146', 'Miscellaneous Insurance', NULL, NULL, '2025-07-08', '2026-07-08', '1970-01-01', 0.0, 0.0, @curr_c_828, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR.CHANDRA', 'MOHAN KAMAT', 'no-email-dl-829@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_829 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8351111808321409', 'Miscellaneous Insurance', NULL, NULL, '2025-07-08', '2026-07-08', '1970-01-01', 0.0, 0.0, @curr_c_829, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR.RAMESH', 'CHANDRA BADITYA', 'no-email-dl-830@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_830 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9922111808226912', 'Miscellaneous Insurance', NULL, NULL, '2025-07-09', '2026-07-09', '1970-01-01', 0.0, 0.0, @curr_c_830, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAJESH', 'YADAV', 'no-email-dl-831@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_831 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2273112303063574', 'Miscellaneous Insurance', NULL, NULL, '2025-07-09', '2026-07-09', '1970-01-01', 0.0, 0.0, @curr_c_831, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MANISH', 'KAUSHIK', 'no-email-dl-832@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_832 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4776112006040058', 'Miscellaneous Insurance', NULL, NULL, '2025-07-10', '2026-07-10', '1970-01-01', 0.0, 0.0, @curr_c_832, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PAWAN', 'DEEP', 'no-email-dl-833@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_833 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6322112006009567', 'Miscellaneous Insurance', NULL, NULL, '2025-07-11', '2026-07-11', '1970-01-01', 0.0, 0.0, @curr_c_833, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('EVA', 'SAXENA', 'no-email-dl-834@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_834 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5482162204050285', 'Miscellaneous Insurance', NULL, NULL, '2025-07-15', '2026-07-15', '1970-01-01', 0.0, 0.0, @curr_c_834, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('NEELAM', 'MITTAL', 'no-email-dl-835@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_835 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7372112006021342', 'Miscellaneous Insurance', NULL, NULL, '2025-07-16', '2026-07-16', '1970-01-01', 0.0, 0.0, @curr_c_835, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('HARSHPREET', 'SINGH SIDHU', 'no-email-dl-836@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_836 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3168112006060957', 'Miscellaneous Insurance', NULL, NULL, '2025-07-17', '2026-07-17', '1970-01-01', 0.0, 0.0, @curr_c_836, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'K Senthil Kumaran', 'no-email-dl-837@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_837 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('14489538', 'Miscellaneous Insurance', NULL, NULL, '2025-07-17', '2028-07-17', '1970-01-01', 0.0, 0.0, @curr_c_837, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR.SATYA', 'DEV ARYA', 'no-email-dl-838@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_838 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4352111808079226', 'Miscellaneous Insurance', NULL, NULL, '2025-07-18', '2026-07-18', '1970-01-01', 0.0, 0.0, @curr_c_838, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'SHASHI KUMAR', 'no-email-dl-839@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_839 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('68842584', 'Miscellaneous Insurance', NULL, NULL, '2025-07-18', '2026-07-18', '1970-01-01', 0.0, 0.0, @curr_c_839, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS', 'SUVARNA PRAFULLA DOSHI', 'no-email-dl-840@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_840 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('68848625', 'Miscellaneous Insurance', NULL, NULL, '2025-07-18', '2026-07-18', '1970-01-01', 0.0, 0.0, @curr_c_840, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS', 'THUMMALAPALLY RAVILA KUMARI', 'no-email-dl-841@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_841 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('67237487', 'Miscellaneous Insurance', NULL, NULL, '2025-07-19', '2026-07-19', '1970-01-01', 0.0, 0.0, @curr_c_841, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAJEEV', 'RANJAN KUMAR', 'no-email-dl-842@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_842 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8104112006012569', 'Miscellaneous Insurance', NULL, NULL, '2025-07-20', '2026-07-20', '1970-01-01', 0.0, 0.0, @curr_c_842, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('CHANDRA', 'SEKHAR SAHU', 'no-email-dl-843@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_843 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1090112402027510', 'Miscellaneous Insurance', NULL, NULL, '2025-07-21', '2026-07-21', '1970-01-01', 0.0, 0.0, @curr_c_843, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ASHWINI', 'T BHATIA', 'no-email-dl-844@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_844 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7089112105013694', 'Miscellaneous Insurance', NULL, NULL, '2025-07-22', '2026-07-22', '1970-01-01', 0.0, 0.0, @curr_c_844, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('69036983', 'Miscellaneous Insurance', NULL, NULL, '2025-07-25', '2026-07-25', '1970-01-01', 0.0, 0.0, @curr_c_771, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Nagubandi Kasi Viswanath', 'no-email-dl-846@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_846 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('68648207', 'Miscellaneous Insurance', NULL, NULL, '2025-07-25', '2026-07-25', '1970-01-01', 0.0, 0.0, @curr_c_846, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('NAGESH', 'BHANDARI', 'no-email-dl-847@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_847 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2128112402037151', 'Miscellaneous Insurance', NULL, NULL, '2025-07-26', '2026-07-26', '1970-01-01', 0.0, 0.0, @curr_c_847, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KVB', 'GANESH', 'no-email-dl-848@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_848 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9652112204089747', 'Miscellaneous Insurance', NULL, NULL, '2025-07-27', '2026-07-27', '1970-01-01', 0.0, 0.0, @curr_c_848, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Lahari Manchiraju', 'no-email-dl-849@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_849 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('14513210', 'Miscellaneous Insurance', NULL, NULL, '2025-07-27', '2026-07-27', '1970-01-01', 0.0, 0.0, @curr_c_849, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS', 'Jayasri Manchiraju', 'no-email-dl-850@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_850 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('14516140', 'Miscellaneous Insurance', NULL, NULL, '2025-07-27', '2026-07-27', '1970-01-01', 0.0, 0.0, @curr_c_850, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'JOSEPH C V', 'no-email-dl-851@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_851 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('69145605', 'Miscellaneous Insurance', NULL, NULL, '2025-07-28', '2026-07-28', '1970-01-01', 0.0, 0.0, @curr_c_851, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MRS.NEERA', 'SAXENA', 'no-email-dl-852@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_852 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1170111807350188', 'Miscellaneous Insurance', NULL, NULL, '2025-07-29', '2026-07-29', '1970-01-01', 0.0, 0.0, @curr_c_852, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'DEBA PRASAD SANA', 'no-email-dl-853@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_853 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('69488194', 'Miscellaneous Insurance', NULL, NULL, '2025-07-29', '2026-07-29', '1970-01-01', 0.0, 0.0, @curr_c_853, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'VIMAL MONGA', 'no-email-dl-854@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_854 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('44581151', 'Miscellaneous Insurance', NULL, NULL, '2025-07-29', '2026-07-29', '1970-01-01', 0.0, 0.0, @curr_c_854, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Pawan prakash shukla', 'no-email-dl-855@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_855 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('14512498', 'Miscellaneous Insurance', NULL, NULL, '2025-07-31', '2026-07-31', '1970-01-01', 0.0, 0.0, @curr_c_855, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'TARKA MEEN KHATRI', 'no-email-dl-856@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_856 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('68017920', 'Miscellaneous Insurance', NULL, NULL, '2025-07-31', '2026-07-31', '1970-01-01', 0.0, 0.0, @curr_c_856, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VIJAYA', 'RAJE  SINGH', 'no-email-dl-857@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_857 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3542112006089685', 'Miscellaneous Insurance', NULL, NULL, '2025-07-02', '2026-07-02', '1970-01-01', 0.0, 0.0, @curr_c_857, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('NIRAJ', 'DEO MISHRA', 'no-email-dl-858@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_858 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6048111906086775', 'Miscellaneous Insurance', NULL, NULL, '2025-07-03', '2026-07-03', '1970-01-01', 0.0, 0.0, @curr_c_858, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('AMIT', 'DHINGRA', 'no-email-dl-859@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_859 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4512112006052082', 'Miscellaneous Insurance', NULL, NULL, '2025-07-04', '2026-07-04', '1970-01-01', 0.0, 0.0, @curr_c_859, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANTHONY', 'GOMES', 'no-email-dl-860@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_860 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805203572609800', 'Miscellaneous Insurance', NULL, NULL, '2025-07-04', '2026-07-04', '1970-01-01', 0.0, 0.0, @curr_c_860, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('HEMLATA', 'KRISHNA JADHAV', 'no-email-dl-861@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_861 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805207524312000', 'Miscellaneous Insurance', NULL, NULL, '2025-07-04', '2026-07-04', '1970-01-01', 0.0, 0.0, @curr_c_861, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('HITESH', 'VERMA', 'no-email-dl-862@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_862 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805207534156000', 'Miscellaneous Insurance', NULL, NULL, '2025-07-05', '2026-07-05', '1970-01-01', 0.0, 0.0, @curr_c_862, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PIYUSH', 'JAIN', 'no-email-dl-863@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_863 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3568112204065076', 'Miscellaneous Insurance', NULL, NULL, '2025-07-07', '2026-07-07', '1970-01-01', 0.0, 0.0, @curr_c_863, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Chandramohan', 'Singh', 'no-email-dl-864@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_864 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4501111902079130', 'Miscellaneous Insurance', NULL, NULL, '2025-07-08', '2027-07-09', '1970-01-01', 0.0, 0.0, @curr_c_864, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SAMIR', 'KESHAV PAWAR', 'no-email-dl-865@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_865 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2987111808068741', 'Miscellaneous Insurance', NULL, NULL, '2025-07-09', '2026-07-09', '1970-01-01', 0.0, 0.0, @curr_c_865, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAJESH', 'JAISWAL', 'no-email-dl-866@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_866 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3603111906077549', 'Miscellaneous Insurance', NULL, NULL, '2025-07-09', '2026-07-09', '1970-01-01', 0.0, 0.0, @curr_c_866, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('YOGESH', 'MATHUR', 'no-email-dl-867@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_867 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1812162501067619', 'Miscellaneous Insurance', NULL, NULL, '2025-07-09', '2026-07-09', '1970-01-01', 0.0, 0.0, @curr_c_867, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Yatendra', 'no-email-dl-868@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_868 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('23-19-0022652-07', 'Miscellaneous Insurance', NULL, NULL, '2025-07-09', '2026-07-09', '1970-01-01', 0.0, 0.0, @curr_c_868, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Vishav', 'JEET SHUKLA', 'no-email-dl-869@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_869 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('23-19-0022721-07', 'Miscellaneous Insurance', NULL, NULL, '2025-07-09', '2026-07-09', '1970-01-01', 0.0, 0.0, @curr_c_869, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SHASHIDHAR', '', 'no-email-dl-870@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_870 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9662112204093867', 'Miscellaneous Insurance', NULL, NULL, '2025-07-10', '2026-07-10', '1970-01-01', 0.0, 0.0, @curr_c_870, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PARAS', 'SHAH', 'no-email-dl-871@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_871 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8027112402030048', 'Miscellaneous Insurance', NULL, NULL, '2025-07-10', '2026-07-10', '1970-01-01', 0.0, 0.0, @curr_c_871, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('JAYDIP', 'PAUL', 'no-email-dl-872@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_872 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4945112006021608', 'Miscellaneous Insurance', NULL, NULL, '2025-07-11', '2026-07-11', '1970-01-01', 0.0, 0.0, @curr_c_872, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('JAVEED', 'SHAREEF', 'no-email-dl-873@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_873 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805101067676900', 'Miscellaneous Insurance', NULL, NULL, '2025-07-11', '2026-07-11', '1970-01-01', 0.0, 0.0, @curr_c_873, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MUKESH', 'KUMAR', 'no-email-dl-874@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_874 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8275111907079082', 'Miscellaneous Insurance', NULL, NULL, '2025-07-12', '2026-07-12', '1970-01-01', 0.0, 0.0, @curr_c_874, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DILIP', 'S JOSHI', 'no-email-dl-875@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_875 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1563111907078891', 'Miscellaneous Insurance', NULL, NULL, '2025-07-12', '2026-07-12', '1970-01-01', 0.0, 0.0, @curr_c_875, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('PROHLR111296196', 'Miscellaneous Insurance', NULL, NULL, '2025-07-12', '2026-07-12', '1970-01-01', 0.0, 0.0, @curr_c_189, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DHRUV', 'MURGAI', 'no-email-dl-877@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_877 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8418112204085807', 'Miscellaneous Insurance', NULL, NULL, '2025-07-13', '2026-07-13', '1970-01-01', 0.0, 0.0, @curr_c_877, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PARAMESWARI', '', 'no-email-dl-878@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_878 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3404111808055561', 'Miscellaneous Insurance', NULL, NULL, '2025-07-13', '2026-07-13', '1970-01-01', 0.0, 0.0, @curr_c_878, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MANNAR', 'NATCHIMUTHU VIVEKANANDA .', 'no-email-dl-879@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_879 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805207514215100001', 'Miscellaneous Insurance', NULL, NULL, '2025-07-13', '2026-07-13', '1970-01-01', 0.0, 0.0, @curr_c_879, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DEV', 'ANAND TIWARI', 'no-email-dl-880@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_880 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5532112006057535', 'Miscellaneous Insurance', NULL, NULL, '2025-07-17', '2026-07-17', '1970-01-01', 0.0, 0.0, @curr_c_880, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('GUMMADI', 'PRASANTH', 'no-email-dl-881@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_881 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4599111807053418', 'Miscellaneous Insurance', NULL, NULL, '2025-07-17', '2026-07-17', '1970-01-01', 0.0, 0.0, @curr_c_881, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SAJIN', 'M S', 'no-email-dl-882@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_882 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2107112105069062', 'Miscellaneous Insurance', NULL, NULL, '2025-07-17', '2026-07-17', '1970-01-01', 0.0, 0.0, @curr_c_882, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DEBJIT', 'BAIDYA', 'no-email-dl-883@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_883 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5545112006040818', 'Miscellaneous Insurance', NULL, NULL, '2025-07-17', '2026-07-17', '1970-01-01', 0.0, 0.0, @curr_c_883, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Pr', 'Balaji Rao', 'no-email-dl-884@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_884 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('31-24-0069251-11', 'Miscellaneous Insurance', NULL, NULL, '2025-07-17', '2026-07-17', '1970-01-01', 0.0, 0.0, @curr_c_884, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('', 'Aanchal  Rastogi', 'no-email-dl-885@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_885 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('23-19-0023187-05', 'Miscellaneous Insurance', NULL, NULL, '2025-07-18', '2026-07-18', '1970-01-01', 0.0, 0.0, @curr_c_885, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Surendra', 'Bhatnagar', 'no-email-dl-886@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_886 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('23-20-0098402-05', 'Miscellaneous Insurance', NULL, NULL, '2025-07-18', '2026-07-18', '1970-01-01', 0.0, 0.0, @curr_c_886, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Sanjay Pal', 'no-email-dl-887@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_887 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6763111903279977', 'Miscellaneous Insurance', NULL, NULL, '2025-07-19', '2026-07-19', '1970-01-01', 0.0, 0.0, @curr_c_887, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KHUSHBOO', 'SINGH', 'no-email-dl-888@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_888 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('34130263202501', 'Miscellaneous Insurance', NULL, NULL, '2025-07-19', '2026-07-19', '1970-01-01', 0.0, 0.0, @curr_c_888, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('NARENDRA', 'KHANVILKAR', 'no-email-dl-889@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_889 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1234111808041770', 'Miscellaneous Insurance', NULL, NULL, '2025-07-20', '2026-07-20', '1970-01-01', 0.0, 0.0, @curr_c_889, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('HARVINDER', 'KUMAR', 'no-email-dl-890@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_890 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2441112006049307', 'Miscellaneous Insurance', NULL, NULL, '2025-07-20', '2026-07-20', '1970-01-01', 0.0, 0.0, @curr_c_890, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ashish', 'Chaurasiya', 'no-email-dl-891@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_891 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('190222528680001903', 'Miscellaneous Insurance', NULL, NULL, '2025-07-20', '2026-07-20', '1970-01-01', 0.0, 0.0, @curr_c_891, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUNITA', 'S PRASAD', 'no-email-dl-892@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_892 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3751112402011762', 'Miscellaneous Insurance', NULL, NULL, '2025-07-21', '2026-07-21', '1970-01-01', 0.0, 0.0, @curr_c_892, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Avtar', 'Singh', 'no-email-dl-893@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_893 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-22-3524571-03', 'Miscellaneous Insurance', NULL, NULL, '2025-07-21', '2026-07-21', '1970-01-01', 0.0, 0.0, @curr_c_893, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Abhishek', 'Kumar', 'no-email-dl-894@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_894 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('920222528680409979', 'Miscellaneous Insurance', NULL, NULL, '2025-07-21', '2026-07-21', '1970-01-01', 0.0, 0.0, @curr_c_894, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PARIMAL', 'PRATAP ARJUGADE', 'no-email-dl-895@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_895 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2728111709045185', 'Miscellaneous Insurance', NULL, NULL, '2025-07-23', '2026-07-23', '1970-01-01', 0.0, 0.0, @curr_c_895, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SAKSHI', 'CHAUHAN', 'no-email-dl-896@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_896 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9839112501080652', 'Miscellaneous Insurance', NULL, NULL, '2025-07-23', '2026-07-23', '1970-01-01', 0.0, 0.0, @curr_c_896, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUNIL', 'KUMAR WALIA', 'no-email-dl-897@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_897 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3871112204021473', 'Miscellaneous Insurance', NULL, NULL, '2025-07-23', '2026-07-23', '1970-01-01', 0.0, 0.0, @curr_c_897, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('G', 'Kali Prasad', 'no-email-dl-898@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_898 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-17-0004396-11', 'Miscellaneous Insurance', NULL, NULL, '2025-07-23', '2026-07-23', '1970-01-01', 0.0, 0.0, @curr_c_898, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MRS.SUDHA', 'KAUL', 'no-email-dl-899@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_899 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3687112204041476', 'Miscellaneous Insurance', NULL, NULL, '2025-07-24', '2026-07-24', '1970-01-01', 0.0, 0.0, @curr_c_899, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VINAYAK', 'BHARDWAJ', 'no-email-dl-900@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_900 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4002112501040773', 'Miscellaneous Insurance', NULL, NULL, '2025-07-24', '2026-07-24', '1970-01-01', 0.0, 0.0, @curr_c_900, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('YOGESH', 'PANDEY', 'no-email-dl-901@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_901 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5221112501000492', 'Miscellaneous Insurance', NULL, NULL, '2025-07-24', '2026-07-24', '1970-01-01', 0.0, 0.0, @curr_c_901, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Nirdesh', 'Devi', 'no-email-dl-902@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_902 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('920222528680512625', 'Miscellaneous Insurance', NULL, NULL, '2025-07-24', '2026-07-24', '1970-01-01', 0.0, 0.0, @curr_c_902, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SESHENDRA', 'KRISHNAN T', 'no-email-dl-903@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_903 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2632111906206332', 'Miscellaneous Insurance', NULL, NULL, '2025-07-25', '2026-07-25', '1970-01-01', 0.0, 0.0, @curr_c_903, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SANTOSH', 'DEWAN SINGH BHANDARI', 'no-email-dl-904@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_904 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1294112006001378', 'Miscellaneous Insurance', NULL, NULL, '2025-07-25', '2026-07-25', '1970-01-01', 0.0, 0.0, @curr_c_904, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('HANU', 'GUPTA', 'no-email-dl-905@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_905 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4042112501054822', 'Miscellaneous Insurance', NULL, NULL, '2025-07-26', '2026-07-26', '1970-01-01', 0.0, 0.0, @curr_c_905, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DHEERENDRA', 'SINGH RAWAT', 'no-email-dl-906@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_906 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('34139817202501', 'Miscellaneous Insurance', NULL, NULL, '2025-07-26', '2026-07-26', '1970-01-01', 0.0, 0.0, @curr_c_906, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANITA', 'ARORA .', 'no-email-dl-907@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_907 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33231396202502', 'Miscellaneous Insurance', NULL, NULL, '2025-07-26', '2026-07-26', '1970-01-01', 0.0, 0.0, @curr_c_907, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SADAN', 'AGARWAL', 'no-email-dl-908@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_908 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8653112006045445', 'Miscellaneous Insurance', NULL, NULL, '2025-07-27', '2026-07-27', '1970-01-01', 0.0, 0.0, @curr_c_908, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Rinkesh', 'Kumar M Patel', 'no-email-dl-909@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_909 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('PROHLR111275777', 'Miscellaneous Insurance', NULL, NULL, '2025-07-27', '2026-07-27', '1970-01-01', 0.0, 0.0, @curr_c_909, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Harish', 'Kumar Kumar J', 'no-email-dl-910@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_910 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('PROHLR111299872', 'Miscellaneous Insurance', NULL, NULL, '2025-07-27', '2026-07-27', '1970-01-01', 0.0, 0.0, @curr_c_910, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VIVEK', 'KUMAR GUPTA', 'no-email-dl-911@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_911 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8995112006018386', 'Miscellaneous Insurance', NULL, NULL, '2025-07-29', '2026-07-29', '1970-01-01', 0.0, 0.0, @curr_c_911, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KANHAIYA', 'LAL KEDIA', 'no-email-dl-912@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_912 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8962112204088186', 'Miscellaneous Insurance', NULL, NULL, '2025-07-29', '2026-07-29', '1970-01-01', 0.0, 0.0, @curr_c_912, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ASHISH', 'KUMAR SINGH', 'no-email-dl-913@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_913 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3482112006035606', 'Miscellaneous Insurance', NULL, NULL, '2025-07-29', '2026-07-29', '1970-01-01', 0.0, 0.0, @curr_c_913, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DENDUKURI', 'SATYANARAYANA RAJU', 'no-email-dl-914@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_914 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1958112303097218', 'Miscellaneous Insurance', NULL, NULL, '2025-07-29', '2026-07-29', '1970-01-01', 0.0, 0.0, @curr_c_914, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR.SANJEEV', 'SHARMA', 'no-email-dl-915@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_915 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2061111808257837', 'Miscellaneous Insurance', NULL, NULL, '2025-07-29', '2026-07-29', '1970-01-01', 0.0, 0.0, @curr_c_915, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUMANTA', 'BANERJEE', 'no-email-dl-916@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_916 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5293112204047554', 'Miscellaneous Insurance', NULL, NULL, '2025-07-30', '2026-07-30', '1970-01-01', 0.0, 0.0, @curr_c_916, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ARUNA', 'KUMAR MOHAPATRA', 'no-email-dl-917@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_917 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2975111907091914', 'Miscellaneous Insurance', NULL, NULL, '2025-07-30', '2026-07-30', '1970-01-01', 0.0, 0.0, @curr_c_917, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PRASHANT', 'VERMA', 'no-email-dl-918@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_918 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4217111709038826', 'Miscellaneous Insurance', NULL, NULL, '2025-07-30', '2026-07-30', '1970-01-01', 0.0, 0.0, @curr_c_918, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('GOURI', 'JAYDEEP HARDIKAR', 'no-email-dl-919@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_919 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1633112006092962', 'Miscellaneous Insurance', NULL, NULL, '2025-07-31', '2026-07-31', '1970-01-01', 0.0, 0.0, @curr_c_919, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('POTLURI', 'RAVI', 'no-email-dl-920@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_920 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1475111507260317', 'Miscellaneous Insurance', NULL, NULL, '2025-07-31', '2026-07-31', '1970-01-01', 0.0, 0.0, @curr_c_920, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUBHADRA', 'RAMANATHAN MATHUR', 'no-email-dl-921@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_921 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3947112006000188', 'Miscellaneous Insurance', NULL, NULL, '2025-07-31', '2026-07-31', '1970-01-01', 0.0, 0.0, @curr_c_921, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Abhinav', 'Singh', 'no-email-dl-922@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_922 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5282111907082834', 'Miscellaneous Insurance', NULL, NULL, '2025-06-26', '2026-06-26', '1970-01-01', 0.0, 0.0, @curr_c_922, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KRISHAN', 'KUMAR', 'no-email-dl-923@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_923 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8970112203235976', 'Miscellaneous Insurance', NULL, NULL, '2025-06-01', '2026-06-01', '1970-01-01', 0.0, 0.0, @curr_c_923, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('NEHA', 'SINGH', 'no-email-dl-924@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_924 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7299112303054690', 'Miscellaneous Insurance', NULL, NULL, '2025-06-01', '2026-06-01', '1970-01-01', 0.0, 0.0, @curr_c_924, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS.SHRUTI', 'VINAY BARPANDE', 'no-email-dl-925@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_925 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4171162501046415', 'Miscellaneous Insurance', NULL, NULL, '2025-06-02', '2026-06-02', '1970-01-01', 0.0, 0.0, @curr_c_925, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Rajan', 'Sagar', 'no-email-dl-926@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_926 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4899112204066490', 'Miscellaneous Insurance', NULL, NULL, '2025-06-03', '2026-06-03', '1970-01-01', 0.0, 0.0, @curr_c_926, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('John', 'Fernandes', 'no-email-dl-927@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_927 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7267112002079412', 'Miscellaneous Insurance', NULL, NULL, '2025-06-05', '2027-06-06', '1970-01-01', 0.0, 0.0, @curr_c_927, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('LINGAM', 'SREENIVASA REDDY', 'no-email-dl-928@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_928 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4779111907074297', 'Miscellaneous Insurance', NULL, NULL, '2025-06-06', '2026-06-06', '1970-01-01', 0.0, 0.0, @curr_c_928, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PALLAVI', 'GIDRONIYA', 'no-email-dl-929@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_929 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2844111610045628', 'Miscellaneous Insurance', NULL, NULL, '2025-06-08', '2026-06-08', '1970-01-01', 0.0, 0.0, @curr_c_929, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ASHOKKUMAR', 'RADHAKRISHNA MAROO', 'no-email-dl-930@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_930 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4031111904011585', 'Miscellaneous Insurance', NULL, NULL, '2025-06-08', '2027-06-09', '1970-01-01', 0.0, 0.0, @curr_c_930, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MEGHNA', 'CHOWDHURY', 'no-email-dl-931@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_931 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9971112103024402', 'Miscellaneous Insurance', NULL, NULL, '2025-06-09', '2026-06-09', '1970-01-01', 0.0, 0.0, @curr_c_931, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MANASH', 'MUKHERJEE', 'no-email-dl-932@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_932 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9495111606200892', 'Miscellaneous Insurance', NULL, NULL, '2025-06-09', '2026-06-09', '1970-01-01', 0.0, 0.0, @curr_c_932, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VIKESH', 'GUPTA', 'no-email-dl-933@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_933 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7977111808054862', 'Miscellaneous Insurance', NULL, NULL, '2025-06-09', '2026-06-09', '1970-01-01', 0.0, 0.0, @curr_c_933, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Chandra', 'Sekhar Manna', 'no-email-dl-934@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_934 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4724111907068843', 'Miscellaneous Insurance', NULL, NULL, '2025-06-09', '2026-06-09', '1970-01-01', 0.0, 0.0, @curr_c_934, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SANJAY', 'CHANDRAKANT POL', 'no-email-dl-935@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_935 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4858112401013250', 'Miscellaneous Insurance', NULL, NULL, '2025-06-13', '2027-06-14', '1970-01-01', 0.0, 0.0, @curr_c_935, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ATUL', 'KUMAR KHANDELWAL', 'no-email-dl-936@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_936 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6175112006006300', 'Miscellaneous Insurance', NULL, NULL, '2025-06-13', '2026-06-13', '1970-01-01', 0.0, 0.0, @curr_c_936, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('LALTA', 'PRASAD', 'no-email-dl-937@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_937 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2712112006012163', 'Miscellaneous Insurance', NULL, NULL, '2025-06-13', '2026-06-13', '1970-01-01', 0.0, 0.0, @curr_c_937, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('A.', 'SURENDAR REDDY', 'no-email-dl-938@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_938 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4955111907030698', 'Miscellaneous Insurance', NULL, NULL, '2025-06-14', '2026-06-14', '1970-01-01', 0.0, 0.0, @curr_c_938, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RUSHAB', 'GOSALIA', 'no-email-dl-939@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_939 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3412112006056429', 'Miscellaneous Insurance', NULL, NULL, '2025-06-14', '2026-06-14', '1970-01-01', 0.0, 0.0, @curr_c_939, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('C', 'NARASIMHA REDDY', 'no-email-dl-940@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_940 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8746112204082367', 'Miscellaneous Insurance', NULL, NULL, '2025-06-14', '2026-06-14', '1970-01-01', 0.0, 0.0, @curr_c_940, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VINOD', 'KUMAR K', 'no-email-dl-941@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_941 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4444112006026893', 'Miscellaneous Insurance', NULL, NULL, '2025-06-15', '2026-06-15', '1970-01-01', 0.0, 0.0, @curr_c_941, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PANKAJ', 'GUPTA', 'no-email-dl-942@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_942 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8387111808090848', 'Miscellaneous Insurance', NULL, NULL, '2025-06-16', '2026-06-16', '1970-01-01', 0.0, 0.0, @curr_c_942, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MURARI', 'BHASKAR RAO', 'no-email-dl-943@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_943 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9671111907003231', 'Miscellaneous Insurance', NULL, NULL, '2025-06-16', '2026-06-16', '1970-01-01', 0.0, 0.0, @curr_c_943, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KR.', 'KARTHIKEYAN', 'no-email-dl-944@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_944 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2169112105074202', 'Miscellaneous Insurance', NULL, NULL, '2025-06-16', '2026-06-16', '1970-01-01', 0.0, 0.0, @curr_c_944, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SONIA', 'NAGPAL', 'no-email-dl-945@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_945 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5820112105071205', 'Miscellaneous Insurance', NULL, NULL, '2025-06-18', '2026-06-18', '1970-01-01', 0.0, 0.0, @curr_c_945, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ARJUN', 'BALU DHOKLE', 'no-email-dl-946@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_946 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4857111907092662', 'Miscellaneous Insurance', NULL, NULL, '2025-06-19', '2026-06-19', '1970-01-01', 0.0, 0.0, @curr_c_946, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('CHILLAKURU', 'CHANDRA REDDY', 'no-email-dl-947@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_947 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1585112006038400', 'Miscellaneous Insurance', NULL, NULL, '2025-06-19', '2026-06-19', '1970-01-01', 0.0, 0.0, @curr_c_947, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('JAYANT', 'BANERJEE', 'no-email-dl-948@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_948 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1311111808073170', 'Miscellaneous Insurance', NULL, NULL, '2025-06-20', '2026-06-20', '1970-01-01', 0.0, 0.0, @curr_c_948, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('N.', 'Vinod Chandra Menon', 'no-email-dl-949@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_949 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1725111907027648', 'Miscellaneous Insurance', NULL, NULL, '2025-06-20', '2026-06-20', '1970-01-01', 0.0, 0.0, @curr_c_949, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANKIT', 'AGRAWAL', 'no-email-dl-950@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_950 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7730111709440390', 'Miscellaneous Insurance', NULL, NULL, '2025-06-20', '2026-06-20', '1970-01-01', 0.0, 0.0, @curr_c_950, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ABHISHEK', 'ASHOK BANE', 'no-email-dl-951@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_951 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2244112204063413', 'Miscellaneous Insurance', NULL, NULL, '2025-06-22', '2026-06-22', '1970-01-01', 0.0, 0.0, @curr_c_951, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2368112204072051', 'Miscellaneous Insurance', NULL, NULL, '2025-06-23', '2026-06-23', '1970-01-01', 0.0, 0.0, @curr_c_940, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('BHARAT', 'DASWANI', 'no-email-dl-953@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_953 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6880112303069745', 'Miscellaneous Insurance', NULL, NULL, '2025-06-24', '2026-06-24', '1970-01-01', 0.0, 0.0, @curr_c_953, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('REVATHI', 'M KULKARNI', 'no-email-dl-954@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_954 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4997112402058835', 'Miscellaneous Insurance', NULL, NULL, '2025-06-24', '2026-06-24', '1970-01-01', 0.0, 0.0, @curr_c_954, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANURAG', 'KUMAR PORWAL', 'no-email-dl-955@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_955 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3990111907086238', 'Miscellaneous Insurance', NULL, NULL, '2025-06-24', '2026-06-24', '1970-01-01', 0.0, 0.0, @curr_c_955, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('BAKKA', 'VEMANA  CHIRANJEEVI', 'no-email-dl-956@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_956 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7967111808282850', 'Miscellaneous Insurance', NULL, NULL, '2025-06-24', '2026-06-24', '1970-01-01', 0.0, 0.0, @curr_c_956, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('LAVUDE', 'SRINIVAS  .', 'no-email-dl-957@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_957 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2944112402017064', 'Miscellaneous Insurance', NULL, NULL, '2025-06-25', '2026-06-25', '1970-01-01', 0.0, 0.0, @curr_c_957, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MEHR', 'SANDHU', 'no-email-dl-958@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_958 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6463112103279547', 'Miscellaneous Insurance', NULL, NULL, '2025-06-26', '2026-06-26', '1970-01-01', 0.0, 0.0, @curr_c_958, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('POOJA', 'BHARTI', 'no-email-dl-959@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_959 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1055112203227296', 'Miscellaneous Insurance', NULL, NULL, '2025-06-27', '2026-06-27', '1970-01-01', 0.0, 0.0, @curr_c_959, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('GURPREETSINGH', 'RABGOLAR', 'no-email-dl-960@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_960 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5011112501083961', 'Miscellaneous Insurance', NULL, NULL, '2025-06-27', '2026-06-27', '1970-01-01', 0.0, 0.0, @curr_c_960, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR.SHYAM', 'BABU KAMAT', 'no-email-dl-961@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_961 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9986111808365646', 'Miscellaneous Insurance', NULL, NULL, '2025-06-27', '2026-06-27', '1970-01-01', 0.0, 0.0, @curr_c_961, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SHAKTI', 'PRASAD DWIVEDY', 'no-email-dl-962@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_962 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6159112006017320', 'Miscellaneous Insurance', NULL, NULL, '2025-06-27', '2026-06-27', '1970-01-01', 0.0, 0.0, @curr_c_962, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DEEPTI', 'LAXMIKANT ANANTWAR', 'no-email-dl-963@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_963 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5231112006023954', 'Miscellaneous Insurance', NULL, NULL, '2025-06-28', '2026-06-28', '1970-01-01', 0.0, 0.0, @curr_c_963, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('NEELIMA', 'SHARMA', 'no-email-dl-964@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_964 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1579112303016318', 'Miscellaneous Insurance', NULL, NULL, '2025-06-28', '2026-06-28', '1970-01-01', 0.0, 0.0, @curr_c_964, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR.SACHIN', 'BHARTIYA', 'no-email-dl-965@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_965 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5409111808223334', 'Miscellaneous Insurance', NULL, NULL, '2025-06-28', '2026-06-28', '1970-01-01', 0.0, 0.0, @curr_c_965, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KAMAL', 'CHAUHAN', 'no-email-dl-966@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_966 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2793112006050771', 'Miscellaneous Insurance', NULL, NULL, '2025-06-28', '2026-06-28', '1970-01-01', 0.0, 0.0, @curr_c_966, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VAIBHAV', 'KESHAV JADHAV', 'no-email-dl-967@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_967 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7938111907056366', 'Miscellaneous Insurance', NULL, NULL, '2025-06-28', '2026-06-28', '1970-01-01', 0.0, 0.0, @curr_c_967, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ravi', 'Kant Gupta', 'no-email-dl-968@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_968 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5449112201070020', 'Miscellaneous Insurance', NULL, NULL, '2025-06-29', '2027-06-30', '1970-01-01', 0.0, 0.0, @curr_c_968, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PRATAP', 'S  NARGUNDKAR', 'no-email-dl-969@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_969 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3420112006093821', 'Miscellaneous Insurance', NULL, NULL, '2025-06-29', '2026-06-29', '1970-01-01', 0.0, 0.0, @curr_c_969, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SAI', 'KUMAR', 'no-email-dl-970@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_970 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3187112006087954', 'Miscellaneous Insurance', NULL, NULL, '2025-06-29', '2026-06-29', '1970-01-01', 0.0, 0.0, @curr_c_970, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PANDURANG', 'VISHNU PATIL', 'no-email-dl-971@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_971 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6518112006086773', 'Miscellaneous Insurance', NULL, NULL, '2025-06-29', '2026-06-29', '1970-01-01', 0.0, 0.0, @curr_c_971, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KAVITHA', 'F J', 'no-email-dl-972@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_972 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9106112006006764', 'Miscellaneous Insurance', NULL, NULL, '2025-06-29', '2026-06-29', '1970-01-01', 0.0, 0.0, @curr_c_972, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Yenigalla', 'Saikiran', 'no-email-dl-973@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_973 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9395162402094198', 'Miscellaneous Insurance', NULL, NULL, '2025-06-30', '2026-06-30', '1970-01-01', 0.0, 0.0, @curr_c_973, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SAHIL', 'SHENDE', 'no-email-dl-974@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_974 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2656112501009543', 'Miscellaneous Insurance', NULL, NULL, '2025-06-30', '2026-06-30', '1970-01-01', 0.0, 0.0, @curr_c_974, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Koganti', 'Rambabu', 'no-email-dl-975@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_975 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('32477215202503', 'Miscellaneous Insurance', NULL, NULL, '2025-06-02', '2026-06-02', '1970-01-01', 0.0, 0.0, @curr_c_975, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Sunil Kumar', 'no-email-dl-976@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_976 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('17410927', 'Miscellaneous Insurance', NULL, NULL, '2025-06-03', '2026-06-03', '1970-01-01', 0.0, 0.0, @curr_c_976, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Vaishali', 'Gulati', 'no-email-dl-977@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_977 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33235276202502', 'Miscellaneous Insurance', NULL, NULL, '2025-06-04', '2026-06-04', '1970-01-01', 0.0, 0.0, @curr_c_977, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'ANIL KUMAR', 'no-email-dl-978@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_978 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('23-19-0014440-07', 'Miscellaneous Insurance', NULL, NULL, '2025-06-04', '2026-06-04', '1970-01-01', 0.0, 0.0, @curr_c_978, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Srikant  Mali', 'no-email-dl-979@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_979 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('84405329', 'Miscellaneous Insurance', NULL, NULL, '2025-06-05', '2026-06-05', '1970-01-01', 0.0, 0.0, @curr_c_979, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Aashutosh Divakar Singh', 'no-email-dl-980@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_980 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('84794815', 'Miscellaneous Insurance', NULL, NULL, '2025-06-06', '2026-06-06', '1970-01-01', 0.0, 0.0, @curr_c_980, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Bhalchandra K Patwardhan', 'no-email-dl-981@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_981 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('85020811', 'Miscellaneous Insurance', NULL, NULL, '2025-06-07', '2026-06-07', '1970-01-01', 0.0, 0.0, @curr_c_981, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Sandeep K', 'no-email-dl-982@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_982 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('53873469', 'Miscellaneous Insurance', NULL, NULL, '2025-06-08', '2026-06-08', '1970-01-01', 0.0, 0.0, @curr_c_982, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Bhanu Prakash Nim', 'no-email-dl-983@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_983 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('12558606', 'Miscellaneous Insurance', NULL, NULL, '2025-06-09', '2026-06-09', '1970-01-01', 0.0, 0.0, @curr_c_983, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'G Jayakumar G Jayakumar', 'no-email-dl-984@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_984 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('66919790', 'Miscellaneous Insurance', NULL, NULL, '2025-06-09', '2026-06-09', '1970-01-01', 0.0, 0.0, @curr_c_984, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Ramesh Babu Gudala', 'no-email-dl-985@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_985 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('66877995', 'Miscellaneous Insurance', NULL, NULL, '2025-06-10', '2026-06-10', '1970-01-01', 0.0, 0.0, @curr_c_985, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('GOPAL', 'JAIPRAKASH KABRA', 'no-email-dl-986@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_986 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('23-22-1024545-02', 'Miscellaneous Insurance', NULL, NULL, '2025-06-10', '2028-06-10', '1970-01-01', 0.0, 0.0, @curr_c_986, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Deepak Kaushik', 'no-email-dl-987@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_987 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('67100108', 'Miscellaneous Insurance', NULL, NULL, '2025-06-12', '2026-06-12', '1970-01-01', 0.0, 0.0, @curr_c_987, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Rachna', 'Sirohi', 'no-email-dl-988@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_988 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('31786572202504', 'Miscellaneous Insurance', NULL, NULL, '2025-06-12', '2026-06-12', '1970-01-01', 0.0, 0.0, @curr_c_988, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAMESH', 'SHREERAM TIWARI', 'no-email-dl-989@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_989 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('PROHLR111262233', 'Miscellaneous Insurance', NULL, NULL, '2025-06-12', '2026-06-12', '1970-01-01', 0.0, 0.0, @curr_c_989, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Siddharth Chauhan', 'no-email-dl-990@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_990 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('66981811', 'Miscellaneous Insurance', NULL, NULL, '2025-06-15', '2026-06-15', '1970-01-01', 0.0, 0.0, @curr_c_990, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Shreyas', 'Krishnaswami Mudaliar', 'no-email-dl-991@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_991 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('34074610202501', 'Miscellaneous Insurance', NULL, NULL, '2025-06-16', '2026-06-16', '1970-01-01', 0.0, 0.0, @curr_c_991, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('JOGENDER', 'KUMAR', 'no-email-dl-992@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_992 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('PROHLR111284486', 'Miscellaneous Insurance', NULL, NULL, '2025-06-18', '2026-06-18', '1970-01-01', 0.0, 0.0, @curr_c_992, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('LALTA', 'PRASAD', 'no-email-dl-993@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_993 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2825/57318407/08/000', 'Miscellaneous Insurance', NULL, NULL, '2025-06-19', '2026-06-19', '1970-01-01', 0.0, 0.0, @curr_c_993, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Virendra Vijay Butolia', 'no-email-dl-994@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_994 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('67580816', 'Miscellaneous Insurance', NULL, NULL, '2025-06-21', '2026-06-21', '1970-01-01', 0.0, 0.0, @curr_c_994, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Devendra', 'Singh Rawat', 'no-email-dl-995@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_995 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33260689202502', 'Miscellaneous Insurance', NULL, NULL, '2025-06-21', '2026-06-21', '1970-01-01', 0.0, 0.0, @curr_c_995, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('23-19-0019071-07', 'Miscellaneous Insurance', NULL, NULL, '2025-06-26', '2026-06-26', '1970-01-01', 0.0, 0.0, @curr_c_280, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Vijay Kumar Pathak', 'no-email-dl-997@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_997 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('54694529', 'Miscellaneous Insurance', NULL, NULL, '2025-06-26', '2026-06-26', '1970-01-01', 0.0, 0.0, @curr_c_997, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Sanjay Kumar', 'no-email-dl-998@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_998 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11157938', 'Miscellaneous Insurance', NULL, NULL, '2025-06-28', '2026-06-28', '1970-01-01', 0.0, 0.0, @curr_c_998, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Jitendra Kumar Singh', 'no-email-dl-999@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_999 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11392412', 'Miscellaneous Insurance', NULL, NULL, '2025-06-28', '2026-06-28', '1970-01-01', 0.0, 0.0, @curr_c_999, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Amiya Kumar Nayak', 'no-email-dl-1000@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1000 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('67494210', 'Miscellaneous Insurance', NULL, NULL, '2025-06-28', '2026-06-28', '1970-01-01', 0.0, 0.0, @curr_c_1000, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ms', 'Preeti Sharma', 'no-email-dl-1001@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1001 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10790920', 'Miscellaneous Insurance', NULL, NULL, '2025-06-29', '2026-06-29', '1970-01-01', 0.0, 0.0, @curr_c_1001, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('AMIT', 'SINGH', 'no-email-dl-1002@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1002 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('23-19-0016683-07', 'Miscellaneous Insurance', NULL, NULL, '2025-06-29', '2026-06-29', '1970-01-01', 0.0, 0.0, @curr_c_1002, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Sunil', 'Kumar Mangal', 'no-email-dl-1003@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1003 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-17-0002234-10', 'Miscellaneous Insurance', NULL, NULL, '2025-06-29', '2026-06-29', '1970-01-01', 0.0, 0.0, @curr_c_1003, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Sachin', 'Maheshwari', 'no-email-dl-1004@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1004 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33189574202502', 'Miscellaneous Insurance', NULL, NULL, '2025-06-29', '2026-06-29', '1970-01-01', 0.0, 0.0, @curr_c_1004, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Subodh', 'Malasi', 'no-email-dl-1005@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1005 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('34110884202501', 'Miscellaneous Insurance', NULL, NULL, '2025-06-30', '2026-06-30', '1970-01-01', 0.0, 0.0, @curr_c_1005, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Prashant Urankar', 'no-email-dl-1006@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1006 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('42986829', 'Miscellaneous Insurance', NULL, NULL, '2025-06-30', '2026-06-30', '1970-01-01', 0.0, 0.0, @curr_c_1006, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Vinodkumar', 'Madhavan', 'no-email-dl-1007@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1007 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('31821197202504', 'Miscellaneous Insurance', NULL, NULL, '2025-06-30', '2026-06-30', '1970-01-01', 0.0, 0.0, @curr_c_1007, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'KRISHNA KANT SHARMA', 'no-email-dl-1008@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1008 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('14278258', 'Miscellaneous Insurance', NULL, NULL, '2025-06-05', '2026-06-05', '1970-01-01', 0.0, 0.0, @curr_c_1008, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MUKUL', 'GARG', 'no-email-dl-1009@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1009 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805203587175305', 'Miscellaneous Insurance', NULL, NULL, '2025-06-05', '2026-06-05', '1970-01-01', 0.0, 0.0, @curr_c_1009, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('JIGNESH', 'DEEPAKKUMAR SONI', 'no-email-dl-1010@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1010 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805207478645700', 'Miscellaneous Insurance', NULL, NULL, '2025-06-12', '2026-06-12', '1970-01-01', 0.0, 0.0, @curr_c_1010, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KANHAIYA', 'MADANLALJI HIRANWAR', 'no-email-dl-1011@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1011 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2813203670590905', 'Miscellaneous Insurance', NULL, NULL, '2025-06-13', '2026-06-13', '1970-01-01', 0.0, 0.0, @curr_c_1011, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'VAIBBHAV JAAIN', 'no-email-dl-1012@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1012 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('67237424', 'Miscellaneous Insurance', NULL, NULL, '2025-06-16', '2026-06-16', '1970-01-01', 0.0, 0.0, @curr_c_1012, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('23-19-0017293-08', 'Miscellaneous Insurance', NULL, NULL, '2025-06-26', '2026-06-26', '1970-01-01', 0.0, 0.0, @curr_c_280, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Purushottam', 'khandelwal', 'no-email-dl-1014@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1014 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1090111808124734', 'Miscellaneous Insurance', NULL, NULL, '2025-06-04', '2026-06-04', '1970-01-01', 0.0, 0.0, @curr_c_1014, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('TANUJ', '', 'no-email-dl-1015@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1015 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5650111906050427', 'Miscellaneous Insurance', NULL, NULL, '2025-05-02', '2026-05-02', '1970-01-01', 0.0, 0.0, @curr_c_1015, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAMANDEEP', 'KUMAR', 'no-email-dl-1016@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1016 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4238112006029300', 'Miscellaneous Insurance', NULL, NULL, '2025-05-03', '2026-05-03', '1970-01-01', 0.0, 0.0, @curr_c_1016, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('IMRAN', 'KHAN', 'no-email-dl-1017@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1017 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8035112204078012', 'Miscellaneous Insurance', NULL, NULL, '2025-05-06', '2026-05-06', '1970-01-01', 0.0, 0.0, @curr_c_1017, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Wadood', 'Hasan', 'no-email-dl-1018@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1018 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2999112006044666', 'Miscellaneous Insurance', NULL, NULL, '2025-05-06', '2026-05-06', '1970-01-01', 0.0, 0.0, @curr_c_1018, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MOHIT', 'GUPTA', 'no-email-dl-1019@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1019 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6938112402027648', 'Miscellaneous Insurance', NULL, NULL, '2025-05-07', '2026-05-07', '1970-01-01', 0.0, 0.0, @curr_c_1019, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Jyoti', 'Das', 'no-email-dl-1020@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1020 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5303112006048961', 'Miscellaneous Insurance', NULL, NULL, '2025-05-07', '2026-05-07', '1970-01-01', 0.0, 0.0, @curr_c_1020, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Vijay', 'Indarchand Kankariya', 'no-email-dl-1021@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1021 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7948111808085871', 'Miscellaneous Insurance', NULL, NULL, '2025-05-08', '2026-05-08', '1970-01-01', 0.0, 0.0, @curr_c_1021, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MONIKA', 'RAWAT', 'no-email-dl-1022@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1022 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9554112402067851', 'Miscellaneous Insurance', NULL, NULL, '2025-05-10', '2026-05-10', '1970-01-01', 0.0, 0.0, @curr_c_1022, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ramkesh', 'Kumar', 'no-email-dl-1023@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1023 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7025112006021232', 'Miscellaneous Insurance', NULL, NULL, '2025-05-13', '2026-05-13', '1970-01-01', 0.0, 0.0, @curr_c_1023, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr.SUNIL', 'PALIWAL', 'no-email-dl-1024@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1024 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2834111807255226', 'Miscellaneous Insurance', NULL, NULL, '2025-05-15', '2026-05-15', '1970-01-01', 0.0, 0.0, @curr_c_1024, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR.STEVENSON', 'ADAMS', 'no-email-dl-1025@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1025 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6670111808083733', 'Miscellaneous Insurance', NULL, NULL, '2025-05-17', '2026-05-17', '1970-01-01', 0.0, 0.0, @curr_c_1025, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAJIV', 'JOSHI', 'no-email-dl-1026@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1026 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7771112303003646', 'Miscellaneous Insurance', NULL, NULL, '2025-05-17', '2026-05-17', '1970-01-01', 0.0, 0.0, @curr_c_1026, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RIMITA', 'ROY', 'no-email-dl-1027@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1027 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5203112006050083', 'Miscellaneous Insurance', NULL, NULL, '2025-05-18', '2026-05-18', '1970-01-01', 0.0, 0.0, @curr_c_1027, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ninan', 'Philip', 'no-email-dl-1028@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1028 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5414112000024703', 'Miscellaneous Insurance', NULL, NULL, '2025-05-18', '2028-05-18', '1970-01-01', 0.0, 0.0, @curr_c_1028, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Deepak', 'Singh', 'no-email-dl-1029@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1029 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2969111903248246', 'Miscellaneous Insurance', NULL, NULL, '2025-05-19', '2026-05-19', '1970-01-01', 0.0, 0.0, @curr_c_1029, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('BALARAM', 'SAHU', 'no-email-dl-1030@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1030 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9981112006042543', 'Miscellaneous Insurance', NULL, NULL, '2025-05-20', '2026-05-20', '1970-01-01', 0.0, 0.0, @curr_c_1030, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAJENDRA', 'D MIRAJKAR', 'no-email-dl-1031@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1031 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9329112303031067', 'Miscellaneous Insurance', NULL, NULL, '2025-05-20', '2026-05-20', '1970-01-01', 0.0, 0.0, @curr_c_1031, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('sudhir', 'bapurao kulkarni', 'no-email-dl-1032@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1032 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1954111907441440', 'Miscellaneous Insurance', NULL, NULL, '2025-05-20', '2026-05-20', '1970-01-01', 0.0, 0.0, @curr_c_1032, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Sudha', 'Rani Mokkapati', 'no-email-dl-1033@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1033 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4818112006099760', 'Miscellaneous Insurance', NULL, NULL, '2025-05-21', '2026-05-21', '1970-01-01', 0.0, 0.0, @curr_c_1033, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Akash', 'Tiwari', 'no-email-dl-1034@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1034 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8664112006025011', 'Miscellaneous Insurance', NULL, NULL, '2025-05-22', '2026-05-22', '1970-01-01', 0.0, 0.0, @curr_c_1034, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('M', 'Ramesh', 'no-email-dl-1035@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1035 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8503112006023264', 'Miscellaneous Insurance', NULL, NULL, '2025-05-22', '2026-05-22', '1970-01-01', 0.0, 0.0, @curr_c_1035, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR.SAYONJIT', 'ROY', 'no-email-dl-1036@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1036 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6360111907064089', 'Miscellaneous Insurance', NULL, NULL, '2025-05-22', '2026-05-22', '1970-01-01', 0.0, 0.0, @curr_c_1036, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('JINO', 'JOHN', 'no-email-dl-1037@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1037 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6714112303023082', 'Miscellaneous Insurance', NULL, NULL, '2025-05-22', '2026-05-22', '1970-01-01', 0.0, 0.0, @curr_c_1037, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR.BRAJESH', 'KUMAR', 'no-email-dl-1038@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1038 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5973111806273795', 'Miscellaneous Insurance', NULL, NULL, '2025-05-23', '2026-05-23', '1970-01-01', 0.0, 0.0, @curr_c_1038, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAVINDRAN', 'K NAIR', 'no-email-dl-1039@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1039 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1882112105064266', 'Miscellaneous Insurance', NULL, NULL, '2025-05-23', '2026-05-23', '1970-01-01', 0.0, 0.0, @curr_c_1039, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SAIKAT', 'BISWAS', 'no-email-dl-1040@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1040 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5700111907039840', 'Miscellaneous Insurance', NULL, NULL, '2025-05-23', '2026-05-23', '1970-01-01', 0.0, 0.0, @curr_c_1040, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MURUGESAN', 'THANDAVAN', 'no-email-dl-1041@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1041 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5223112105006421', 'Miscellaneous Insurance', NULL, NULL, '2025-05-23', '2026-05-23', '1970-01-01', 0.0, 0.0, @curr_c_1041, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('', 'ASIM KUMAR DAS', 'no-email-dl-1042@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1042 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5453112303070897', 'Miscellaneous Insurance', NULL, NULL, '2025-05-25', '2026-05-25', '1970-01-01', 0.0, 0.0, @curr_c_1042, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Dharmendra', 'Sharma', 'no-email-dl-1043@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1043 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9692112006052821', 'Miscellaneous Insurance', NULL, NULL, '2025-05-26', '2026-05-26', '1970-01-01', 0.0, 0.0, @curr_c_1043, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('S', 'NARASIMHAN', 'no-email-dl-1044@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1044 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3628112105096741', 'Miscellaneous Insurance', NULL, NULL, '2025-05-27', '2026-05-27', '1970-01-01', 0.0, 0.0, @curr_c_1044, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MRS.SHANTHI', 'NAIDU KAMATHAM', 'no-email-dl-1045@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1045 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2077111803074043', 'Miscellaneous Insurance', NULL, NULL, '2025-05-29', '2028-05-29', '1970-01-01', 0.0, 0.0, @curr_c_1045, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Nitesh', 'rathor', 'no-email-dl-1046@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1046 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6280111907070717', 'Miscellaneous Insurance', NULL, NULL, '2025-05-30', '2026-05-30', '1970-01-01', 0.0, 0.0, @curr_c_1046, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('CHANCHAL', 'KARMA', 'no-email-dl-1047@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1047 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9061112303014457', 'Miscellaneous Insurance', NULL, NULL, '2025-05-30', '2026-05-30', '1970-01-01', 0.0, 0.0, @curr_c_1047, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Saurabh', 'Yerpude', 'no-email-dl-1048@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1048 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8808112303079323', 'Miscellaneous Insurance', NULL, NULL, '2025-05-31', '2026-05-31', '1970-01-01', 0.0, 0.0, @curr_c_1048, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MOHIT', 'DESHMUKH', 'no-email-dl-1049@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1049 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2531112303090430', 'Miscellaneous Insurance', NULL, NULL, '2025-05-31', '2026-05-31', '1970-01-01', 0.0, 0.0, @curr_c_1049, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'DHARMENDRA GUJAN MAURYA', 'no-email-dl-1050@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1050 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('83280771', 'Miscellaneous Insurance', NULL, NULL, '2025-05-01', '2026-05-01', '1970-01-01', 0.0, 0.0, @curr_c_1050, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS', 'MINI BHARGAVA', 'no-email-dl-1051@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1051 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('12423578', 'Miscellaneous Insurance', NULL, NULL, '2025-05-02', '2026-05-02', '1970-01-01', 0.0, 0.0, @curr_c_1051, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Arjun Soni', 'no-email-dl-1052@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1052 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('52442287', 'Miscellaneous Insurance', NULL, NULL, '2025-05-03', '2026-05-03', '1970-01-01', 0.0, 0.0, @curr_c_1052, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'BALAKRISHNA RAJU  CHOKKARAJU', 'no-email-dl-1053@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1053 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('83322451', 'Miscellaneous Insurance', NULL, NULL, '2025-05-03', '2026-05-03', '1970-01-01', 0.0, 0.0, @curr_c_1053, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Asad Ali', 'no-email-dl-1054@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1054 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('12237742', 'Miscellaneous Insurance', NULL, NULL, '2025-05-03', '2026-05-03', '1970-01-01', 0.0, 0.0, @curr_c_1054, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS', 'GYANTI BIRENDRAKUMAR SINGH', 'no-email-dl-1055@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1055 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('83345528', 'Miscellaneous Insurance', NULL, NULL, '2025-05-04', '2026-05-04', '1970-01-01', 0.0, 0.0, @curr_c_1055, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS', 'KAVITA KAUSHIK', 'no-email-dl-1056@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1056 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('64933444', 'Miscellaneous Insurance', NULL, NULL, '2025-05-05', '2026-05-05', '1970-01-01', 0.0, 0.0, @curr_c_1056, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Virendra Dogra', 'no-email-dl-1057@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1057 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11127216', 'Miscellaneous Insurance', NULL, NULL, '2025-05-06', '2026-05-06', '1970-01-01', 0.0, 0.0, @curr_c_1057, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'GURDARSAN PAL SINGH GULATI', 'no-email-dl-1058@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1058 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11185280', 'Miscellaneous Insurance', NULL, NULL, '2025-05-08', '2026-05-08', '1970-01-01', 0.0, 0.0, @curr_c_1058, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'VIJAY DUBEY', 'no-email-dl-1059@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1059 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('64838055', 'Miscellaneous Insurance', NULL, NULL, '2025-05-08', '2026-05-08', '1970-01-01', 0.0, 0.0, @curr_c_1059, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Girish', 'Damodar Usakoyala', 'no-email-dl-1060@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1060 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4193i/APRN/290121355/02/000', 'Miscellaneous Insurance', NULL, NULL, '2025-05-09', '2026-05-09', '1970-01-01', 0.0, 0.0, @curr_c_1060, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Avinash Mittal', 'no-email-dl-1061@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1061 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11056750', 'Miscellaneous Insurance', NULL, NULL, '2025-05-09', '2026-05-09', '1970-01-01', 0.0, 0.0, @curr_c_1061, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'AWADHESH TIWARI AWADHESH TIWARI', 'no-email-dl-1062@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1062 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('65737065', 'Miscellaneous Insurance', NULL, NULL, '2025-05-10', '2026-05-10', '1970-01-01', 0.0, 0.0, @curr_c_1062, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'TADEPALLY SR BANGAR RAJU', 'no-email-dl-1063@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1063 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('66184698', 'Miscellaneous Insurance', NULL, NULL, '2025-05-12', '2026-05-12', '1970-01-01', 0.0, 0.0, @curr_c_1063, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('', 'SARITA', 'no-email-dl-1064@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1064 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('920222528680276443', 'Miscellaneous Insurance', NULL, NULL, '2025-05-14', '2026-05-14', '1970-01-01', 0.0, 0.0, @curr_c_1064, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'ARIF INNUS INAMDAR', 'no-email-dl-1065@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1065 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('83773215', 'Miscellaneous Insurance', NULL, NULL, '2025-05-15', '2026-05-15', '1970-01-01', 0.0, 0.0, @curr_c_1065, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'BHALCHANDRA K PATWARDHAN', 'no-email-dl-1066@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1066 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('65795731', 'Miscellaneous Insurance', NULL, NULL, '2025-05-15', '2026-05-15', '1970-01-01', 0.0, 0.0, @curr_c_1066, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Avinash Vasant Datar', 'no-email-dl-1067@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1067 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('42200957', 'Miscellaneous Insurance', NULL, NULL, '2025-05-15', '2026-05-15', '1970-01-01', 0.0, 0.0, @curr_c_1067, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Rakesh Kumar Jha', 'no-email-dl-1068@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1068 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('14160809', 'Miscellaneous Insurance', NULL, NULL, '2025-05-16', '2026-05-16', '1970-01-01', 0.0, 0.0, @curr_c_1068, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Rashmi', 'K', 'no-email-dl-1069@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1069 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('23-19-0009074-07', 'Miscellaneous Insurance', NULL, NULL, '2025-05-17', '2026-05-17', '1970-01-01', 0.0, 0.0, @curr_c_1069, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('BHARTI', '', 'no-email-dl-1070@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1070 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('920222528680283657', 'Miscellaneous Insurance', NULL, NULL, '2025-05-17', '2026-05-17', '1970-01-01', 0.0, 0.0, @curr_c_1070, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'SUNIL GHANSHAM TIWADI', 'no-email-dl-1071@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1071 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('65001955', 'Miscellaneous Insurance', NULL, NULL, '2025-05-18', '2026-05-18', '1970-01-01', 0.0, 0.0, @curr_c_1071, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'BHUPENDRAA PRRASAD', 'no-email-dl-1072@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1072 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('42282778', 'Miscellaneous Insurance', NULL, NULL, '2025-05-18', '2026-05-18', '1970-01-01', 0.0, 0.0, @curr_c_1072, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'NITIN SHRIRAM BURUNGALE', 'no-email-dl-1073@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1073 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('84110130', 'Miscellaneous Insurance', NULL, NULL, '2025-05-22', '2026-05-22', '1970-01-01', 0.0, 0.0, @curr_c_1073, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'MRITUNJOY MITRA', 'no-email-dl-1074@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1074 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('63808825', 'Miscellaneous Insurance', NULL, NULL, '2025-05-22', '2026-05-22', '1970-01-01', 0.0, 0.0, @curr_c_1074, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'SANDEEP RAMESH SHEWALE', 'no-email-dl-1075@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1075 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('66161370', 'Miscellaneous Insurance', NULL, NULL, '2025-05-23', '2026-05-23', '1970-01-01', 0.0, 0.0, @curr_c_1075, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('66161808', 'Miscellaneous Insurance', NULL, NULL, '2025-05-23', '2026-05-23', '1970-01-01', 0.0, 0.0, @curr_c_1075, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'ANOOP KUMAR', 'no-email-dl-1077@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1077 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('66428594', 'Miscellaneous Insurance', NULL, NULL, '2025-05-27', '2026-05-27', '1970-01-01', 0.0, 0.0, @curr_c_1077, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'JYOTI PRAKASH  VAISHNAV', 'no-email-dl-1078@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1078 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('84410528', 'Miscellaneous Insurance', NULL, NULL, '2025-05-27', '2026-05-27', '1970-01-01', 0.0, 0.0, @curr_c_1078, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('', 'SANJAY KUMAR BERIWAL', 'no-email-dl-1079@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1079 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('920222528680330753', 'Miscellaneous Insurance', NULL, NULL, '2025-05-29', '2026-05-29', '1970-01-01', 0.0, 0.0, @curr_c_1079, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Ram Palat Singh', 'no-email-dl-1080@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1080 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('65370995', 'Miscellaneous Insurance', NULL, NULL, '2025-05-29', '2026-05-29', '1970-01-01', 0.0, 0.0, @curr_c_1080, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Milind', 'Prabhakar Gawas', 'no-email-dl-1081@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1081 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('34035065202501', 'Miscellaneous Insurance', NULL, NULL, '2025-05-29', '2026-05-29', '1970-01-01', 0.0, 0.0, @curr_c_1081, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('34022449202501', 'Miscellaneous Insurance', NULL, NULL, '2025-05-29', '2026-05-29', '1970-01-01', 0.0, 0.0, @curr_c_280, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Chirag', 'Pal', 'no-email-dl-1083@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1083 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('34041450202501', 'Miscellaneous Insurance', NULL, NULL, '2025-05-31', '2026-05-31', '1970-01-01', 0.0, 0.0, @curr_c_1083, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Ashutosh Sharma', 'no-email-dl-1084@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1084 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('42795652', 'Miscellaneous Insurance', NULL, NULL, '2025-05-31', '2026-05-31', '1970-01-01', 0.0, 0.0, @curr_c_1084, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('CHARVI', 'NARANG', 'no-email-dl-1085@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1085 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805203573590805001', 'Miscellaneous Insurance', NULL, NULL, '2025-05-11', '2026-05-11', '1970-01-01', 0.0, 0.0, @curr_c_1085, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MOHAMMAD', 'PARVEZ AHMAD', 'no-email-dl-1086@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1086 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2803203844264705', 'Miscellaneous Insurance', NULL, NULL, '2025-05-14', '2026-05-14', '1970-01-01', 0.0, 0.0, @curr_c_1086, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VAISHALI', 'DATTATRAY SURYAVANSHI', 'no-email-dl-1087@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1087 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805205441170402', 'Miscellaneous Insurance', NULL, NULL, '2025-05-18', '2026-05-18', '1970-01-01', 0.0, 0.0, @curr_c_1087, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Geeta', 'Ramnarayan Shukla', 'no-email-dl-1088@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1088 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('PROHLR111265611', 'Miscellaneous Insurance', NULL, NULL, '2025-05-15', '2026-05-15', '1970-01-01', 0.0, 0.0, @curr_c_1088, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Amit', 'Kumar Verma', 'no-email-dl-1089@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1089 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('PROHLR111280870', 'Miscellaneous Insurance', NULL, NULL, '2025-05-30', '2026-05-30', '1970-01-01', 0.0, 0.0, @curr_c_1089, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Sher', 'Singh', 'no-email-dl-1090@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1090 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('PROHLN111367768', 'Miscellaneous Insurance', NULL, NULL, '2025-05-12', '2026-05-12', '1970-01-01', 0.0, 0.0, @curr_c_1090, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Sangita', 'Rustgi', 'no-email-dl-1091@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1091 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('PROHLR111276672', 'Miscellaneous Insurance', NULL, NULL, '2025-05-22', '2027-05-23', '1970-01-01', 0.0, 0.0, @curr_c_1091, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Lalitha', 'R Prabhoo', 'no-email-dl-1092@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1092 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('32473315202503', 'Miscellaneous Insurance', NULL, NULL, '2025-05-31', '2026-05-31', '1970-01-01', 0.0, 0.0, @curr_c_1092, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr.Suresh', 'Kumar', 'no-email-dl-1093@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1093 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8354112204430926', 'Miscellaneous Insurance', NULL, NULL, '2025-04-03', '2026-04-03', '1970-01-01', 0.0, 0.0, @curr_c_1093, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Priya', 'Pal', 'no-email-dl-1094@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1094 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6883112302049375', 'Miscellaneous Insurance', NULL, NULL, '2025-04-01', '2026-04-01', '1970-01-01', 0.0, 0.0, @curr_c_1094, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KISHOR', 'VASANT PATIL', 'no-email-dl-1095@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1095 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1046111906069227', 'Miscellaneous Insurance', NULL, NULL, '2025-04-03', '2026-04-03', '1970-01-01', 0.0, 0.0, @curr_c_1095, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUSANTA', 'MANNA', 'no-email-dl-1096@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1096 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4344112105001174', 'Miscellaneous Insurance', NULL, NULL, '2025-04-03', '2026-04-03', '1970-01-01', 0.0, 0.0, @curr_c_1096, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Srikanthrao', 'chitneni', 'no-email-dl-1097@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1097 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2314112006013798', 'Miscellaneous Insurance', NULL, NULL, '2025-04-03', '2026-04-03', '1970-01-01', 0.0, 0.0, @curr_c_1097, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Prasanna', 'Desai', 'no-email-dl-1098@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1098 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8383111805271122', 'Miscellaneous Insurance', NULL, NULL, '2025-04-05', '2026-04-05', '1970-01-01', 0.0, 0.0, @curr_c_1098, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Vichiter', 'Chhoker', 'no-email-dl-1099@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1099 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4231112006467962', 'Miscellaneous Insurance', NULL, NULL, '2025-04-05', '2026-04-05', '1970-01-01', 0.0, 0.0, @curr_c_1099, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('sudhakaran', 'V', 'no-email-dl-1100@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1100 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3890111708065309', 'Miscellaneous Insurance', NULL, NULL, '2025-04-06', '2026-04-06', '1970-01-01', 0.0, 0.0, @curr_c_1100, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Rokkam', 'Naren', 'no-email-dl-1101@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1101 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3451111808042538', 'Miscellaneous Insurance', NULL, NULL, '2025-04-07', '2026-04-07', '1970-01-01', 0.0, 0.0, @curr_c_1101, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr.HARSHIT', '', 'no-email-dl-1102@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1102 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3654111506792401', 'Miscellaneous Insurance', NULL, NULL, '2025-04-08', '2026-04-08', '1970-01-01', 0.0, 0.0, @curr_c_1102, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Harish', 'sharma sharma', 'no-email-dl-1103@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1103 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4699112203200557', 'Miscellaneous Insurance', NULL, NULL, '2025-04-08', '2026-04-08', '1970-01-01', 0.0, 0.0, @curr_c_1103, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ABDUL', 'WAHID KHAN  .', 'no-email-dl-1104@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1104 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3026112501061614', 'Miscellaneous Insurance', NULL, NULL, '2025-04-09', '2026-04-09', '1970-01-01', 0.0, 0.0, @curr_c_1104, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Rushindar', 'apparao dabhade', 'no-email-dl-1105@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1105 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1309112105041571', 'Miscellaneous Insurance', NULL, NULL, '2025-04-09', '2026-04-09', '1970-01-01', 0.0, 0.0, @curr_c_1105, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('laxmi', '', 'no-email-dl-1106@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1106 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1147112204071580', 'Miscellaneous Insurance', NULL, NULL, '2025-04-09', '2026-04-09', '1970-01-01', 0.0, 0.0, @curr_c_1106, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mrinal', 'Raj Singh Rana', 'no-email-dl-1107@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1107 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7329112104284462', 'Miscellaneous Insurance', NULL, NULL, '2025-04-10', '2026-04-10', '1970-01-01', 0.0, 0.0, @curr_c_1107, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Anju', 'Rana', 'no-email-dl-1108@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1108 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2686111804250189', 'Miscellaneous Insurance', NULL, NULL, '2025-04-10', '2026-04-10', '1970-01-01', 0.0, 0.0, @curr_c_1108, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('UMESH', 'CHANDRA SHARMA', 'no-email-dl-1109@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1109 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6636111907019441', 'Miscellaneous Insurance', NULL, NULL, '2025-04-10', '2026-04-10', '1970-01-01', 0.0, 0.0, @curr_c_1109, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('CHANDER', 'JEET CHAUDHARY', 'no-email-dl-1110@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1110 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6023111808099533', 'Miscellaneous Insurance', NULL, NULL, '2025-04-10', '2026-04-10', '1970-01-01', 0.0, 0.0, @curr_c_1110, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ARVIND', 'PRAKASH', 'no-email-dl-1111@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1111 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6597112303090411', 'Miscellaneous Insurance', NULL, NULL, '2025-04-11', '2026-04-11', '1970-01-01', 0.0, 0.0, @curr_c_1111, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5447112103286776', 'Miscellaneous Insurance', NULL, NULL, '2025-04-11', '2026-04-11', '1970-01-01', 0.0, 0.0, @curr_c_1111, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mrs.Ratna', 'Puri', 'no-email-dl-1113@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1113 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8559111708402059', 'Miscellaneous Insurance', NULL, NULL, '2025-04-11', '2026-04-11', '1970-01-01', 0.0, 0.0, @curr_c_1113, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUNIL', 'SHARMA', 'no-email-dl-1114@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1114 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1471111705622281', 'Miscellaneous Insurance', NULL, NULL, '2025-04-12', '2026-04-12', '1970-01-01', 0.0, 0.0, @curr_c_1114, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SANJEEV', 'KUMAR', 'no-email-dl-1115@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1115 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3842112006020459', 'Miscellaneous Insurance', NULL, NULL, '2025-04-13', '2026-04-13', '1970-01-01', 0.0, 0.0, @curr_c_1115, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUBRATA', 'BHATTACHARYA', 'no-email-dl-1116@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1116 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4531111808032897', 'Miscellaneous Insurance', NULL, NULL, '2025-04-13', '2026-04-13', '1970-01-01', 0.0, 0.0, @curr_c_1116, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAJESH', 'POONAMCHAND  KOTHARI', 'no-email-dl-1117@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1117 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1887111907033116', 'Miscellaneous Insurance', NULL, NULL, '2025-04-13', '2026-04-13', '1970-01-01', 0.0, 0.0, @curr_c_1117, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr.SUBODH', 'CHANDRA', 'no-email-dl-1118@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1118 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1495111708260704', 'Miscellaneous Insurance', NULL, NULL, '2025-04-13', '2026-04-13', '1970-01-01', 0.0, 0.0, @curr_c_1118, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('HANSA', 'RAMNIK MEHTA', 'no-email-dl-1119@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1119 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3369112105008530', 'Miscellaneous Insurance', NULL, NULL, '2025-04-14', '2026-04-14', '1970-01-01', 0.0, 0.0, @curr_c_1119, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ajeet', 'kumar', 'no-email-dl-1120@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1120 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8117112105089557', 'Miscellaneous Insurance', NULL, NULL, '2025-04-14', '2026-04-14', '1970-01-01', 0.0, 0.0, @curr_c_1120, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUBODH', 'KUMAR SINGH', 'no-email-dl-1121@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1121 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5204112204059796', 'Miscellaneous Insurance', NULL, NULL, '2025-04-14', '2026-04-14', '1970-01-01', 0.0, 0.0, @curr_c_1121, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ramniklal', 'keshavlal mehta', 'no-email-dl-1122@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1122 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3440112105056029', 'Miscellaneous Insurance', NULL, NULL, '2025-04-14', '2026-04-14', '1970-01-01', 0.0, 0.0, @curr_c_1122, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PRAKASH', 'NARAYANA NAIR', 'no-email-dl-1123@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1123 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2664112204001357', 'Miscellaneous Insurance', NULL, NULL, '2025-04-14', '2026-04-14', '1970-01-01', 0.0, 0.0, @curr_c_1123, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Anil', 'kumar tailor', 'no-email-dl-1124@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1124 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1620112006075619', 'Miscellaneous Insurance', NULL, NULL, '2025-04-16', '2026-04-16', '1970-01-01', 0.0, 0.0, @curr_c_1124, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MANJUSHREE', 'DAS', 'no-email-dl-1125@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1125 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3187112006022678', 'Miscellaneous Insurance', NULL, NULL, '2025-04-16', '2026-04-16', '1970-01-01', 0.0, 0.0, @curr_c_1125, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SANKARA', 'NARAYANAN RAMARAJ', 'no-email-dl-1126@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1126 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1344111907031321', 'Miscellaneous Insurance', NULL, NULL, '2025-04-16', '2026-04-16', '1970-01-01', 0.0, 0.0, @curr_c_1126, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Amitananda', 'Halder', 'no-email-dl-1127@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1127 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9274161902075351', 'Miscellaneous Insurance', NULL, NULL, '2025-04-17', '2027-04-18', '1970-01-01', 0.0, 0.0, @curr_c_1127, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mohamed', 'Abbas T M', 'no-email-dl-1128@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1128 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4297111903247653', 'Miscellaneous Insurance', NULL, NULL, '2025-04-17', '2026-04-17', '1970-01-01', 0.0, 0.0, @curr_c_1128, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Amit', 'Saini', 'no-email-dl-1129@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1129 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5926111906052468', 'Miscellaneous Insurance', NULL, NULL, '2025-04-18', '2026-04-18', '1970-01-01', 0.0, 0.0, @curr_c_1129, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('K', 'V MOHIDEEN BAVA', 'no-email-dl-1130@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1130 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1056112006094237', 'Miscellaneous Insurance', NULL, NULL, '2025-04-19', '2026-04-19', '1970-01-01', 0.0, 0.0, @curr_c_1130, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('CHANDRA', 'MOHAN SHARMA', 'no-email-dl-1131@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1131 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6433112006019805', 'Miscellaneous Insurance', NULL, NULL, '2025-04-19', '2026-04-19', '1970-01-01', 0.0, 0.0, @curr_c_1131, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('LOKENDRA', 'SINGH', 'no-email-dl-1132@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1132 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3153112402040914', 'Miscellaneous Insurance', NULL, NULL, '2025-04-21', '2026-04-21', '1970-01-01', 0.0, 0.0, @curr_c_1132, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ajay', 'Ghatge', 'no-email-dl-1133@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1133 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8028112105007317', 'Miscellaneous Insurance', NULL, NULL, '2025-04-22', '2026-04-22', '1970-01-01', 0.0, 0.0, @curr_c_1133, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('vijaya', 'kumar VL', 'no-email-dl-1134@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1134 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9707111906058495', 'Miscellaneous Insurance', NULL, NULL, '2025-04-22', '2026-04-22', '1970-01-01', 0.0, 0.0, @curr_c_1134, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Chandy', 'Abraham Ayrookuzhil Cherian', 'no-email-dl-1135@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1135 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5584112105019057', 'Miscellaneous Insurance', NULL, NULL, '2025-04-23', '2026-04-23', '1970-01-01', 0.0, 0.0, @curr_c_1135, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Andaleeb', 'Hussain', 'no-email-dl-1136@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1136 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6707112204008265', 'Miscellaneous Insurance', NULL, NULL, '2025-04-24', '2026-04-24', '1970-01-01', 0.0, 0.0, @curr_c_1136, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANUPAMA', 'ANJALI UPADHYAY', 'no-email-dl-1137@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1137 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2292111605275418', 'Miscellaneous Insurance', NULL, NULL, '2025-04-24', '2026-04-24', '1970-01-01', 0.0, 0.0, @curr_c_1137, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Deepak', 'Kumar Bora', 'no-email-dl-1138@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1138 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3898111907052220', 'Miscellaneous Insurance', NULL, NULL, '2025-04-24', '2026-04-24', '1970-01-01', 0.0, 0.0, @curr_c_1138, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Gurminder', 'Singh Dhillon', 'no-email-dl-1139@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1139 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2048112003068135', 'Miscellaneous Insurance', NULL, NULL, '2025-04-25', '2027-04-26', '1970-01-01', 0.0, 0.0, @curr_c_1139, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6687112003081882', 'Miscellaneous Insurance', NULL, NULL, '2025-04-25', '2027-04-26', '1970-01-01', 0.0, 0.0, @curr_c_1139, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Abhiram', 'Chandra Barman', 'no-email-dl-1141@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1141 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9028111906023087', 'Miscellaneous Insurance', NULL, NULL, '2025-04-26', '2026-04-26', '1970-01-01', 0.0, 0.0, @curr_c_1141, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KULDEEP', 'SINGH', 'no-email-dl-1142@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1142 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('3371112204053184', 'Miscellaneous Insurance', NULL, NULL, '2025-04-26', '2026-04-26', '1970-01-01', 0.0, 0.0, @curr_c_1142, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VENU', 'GOPAL SINHA', 'no-email-dl-1143@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1143 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('8361112204049638', 'Miscellaneous Insurance', NULL, NULL, '2025-04-27', '2026-04-27', '1970-01-01', 0.0, 0.0, @curr_c_1143, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MANPREET', 'SINGH', 'no-email-dl-1144@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1144 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('1987112006068848', 'Miscellaneous Insurance', NULL, NULL, '2025-04-27', '2026-04-27', '1970-01-01', 0.0, 0.0, @curr_c_1144, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('BISWESWAR', 'PRUSTY', 'no-email-dl-1145@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1145 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6254112006083696', 'Miscellaneous Insurance', NULL, NULL, '2025-04-28', '2026-04-28', '1970-01-01', 0.0, 0.0, @curr_c_1145, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('HARIKRISHNA', 'AJMEERA', 'no-email-dl-1146@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1146 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9900111907015471', 'Miscellaneous Insurance', NULL, NULL, '2025-04-28', '2026-04-28', '1970-01-01', 0.0, 0.0, @curr_c_1146, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('', 'M Prakash Rao', 'no-email-dl-1147@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1147 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5104111906049254', 'Miscellaneous Insurance', NULL, NULL, '2025-04-30', '2026-04-30', '1970-01-01', 0.0, 0.0, @curr_c_1147, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('AKKANKSHYA', '', 'no-email-dl-1148@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1148 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6325112300069862', 'Miscellaneous Insurance', NULL, NULL, '2025-04-30', '2028-04-30', '1970-01-01', 0.0, 0.0, @curr_c_1148, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MANPREET', 'SINGH LOTEY', 'no-email-dl-1149@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1149 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9041111907085145', 'Miscellaneous Insurance', NULL, NULL, '2025-04-30', '2026-04-30', '1970-01-01', 0.0, 0.0, @curr_c_1149, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUNIL', 'GARG', 'no-email-dl-1150@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1150 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33144161202502', 'Miscellaneous Insurance', NULL, NULL, '2025-04-01', '2026-04-01', '1970-01-01', 0.0, 0.0, @curr_c_1150, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Geeta', 'yadav', 'no-email-dl-1151@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1151 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('32317502202503', 'Miscellaneous Insurance', NULL, NULL, '2025-04-02', '2026-04-02', '1970-01-01', 0.0, 0.0, @curr_c_1151, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('PRIYANKA', 'GURUNATH DARNE', 'no-email-dl-1152@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1152 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33939867202501', 'Miscellaneous Insurance', NULL, NULL, '2025-04-11', '2026-04-11', '1970-01-01', 0.0, 0.0, @curr_c_1152, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'R Varadha Rajan', 'no-email-dl-1153@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1153 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11212135', 'Miscellaneous Insurance', NULL, NULL, '2025-04-12', '2026-04-12', '1970-01-01', 0.0, 0.0, @curr_c_1153, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'JAYA KRISHNA  TIRUMAREDDY', 'no-email-dl-1154@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1154 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('82614937', 'Miscellaneous Insurance', NULL, NULL, '2025-04-13', '2026-04-13', '1970-01-01', 0.0, 0.0, @curr_c_1154, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('BHOOMIKA', 'SRIVASTAVA', 'no-email-dl-1155@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1155 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33944040202501', 'Miscellaneous Insurance', NULL, NULL, '2025-04-13', '2026-04-13', '1970-01-01', 0.0, 0.0, @curr_c_1155, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MADHU', 'MALHOTRA', 'no-email-dl-1156@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1156 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('PROHLR280100759', 'Miscellaneous Insurance', NULL, NULL, '2025-04-15', '2026-04-15', '1970-01-01', 0.0, 0.0, @curr_c_1156, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'DINESH KUMAR SINGH', 'no-email-dl-1157@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1157 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('51435661', 'Miscellaneous Insurance', NULL, NULL, '2025-04-16', '2026-04-16', '1970-01-01', 0.0, 0.0, @curr_c_1157, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'ALOK KUMAR MISHRA', 'no-email-dl-1158@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1158 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('31142080', 'Miscellaneous Insurance', NULL, NULL, '2025-04-16', '2026-04-16', '1970-01-01', 0.0, 0.0, @curr_c_1158, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VIJAY', 'KUMAR SINGLA', 'no-email-dl-1159@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1159 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33933276202501', 'Miscellaneous Insurance', NULL, NULL, '2025-04-16', '2026-04-16', '1970-01-01', 0.0, 0.0, @curr_c_1159, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11135296', 'Miscellaneous Insurance', NULL, NULL, '2025-04-16', '2026-04-16', '1970-01-01', 0.0, 0.0, @curr_c_1157, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'ANSHUL KUMAR YADAV', 'no-email-dl-1161@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1161 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('64427500', 'Miscellaneous Insurance', NULL, NULL, '2025-04-17', '2026-04-17', '1970-01-01', 0.0, 0.0, @curr_c_1161, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'AMAR SINGH', 'no-email-dl-1162@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1162 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('12376782', 'Miscellaneous Insurance', NULL, NULL, '2025-04-17', '2026-04-17', '1970-01-01', 0.0, 0.0, @curr_c_1162, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS', 'NEELAM JHA', 'no-email-dl-1163@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1163 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('82749235', 'Miscellaneous Insurance', NULL, NULL, '2025-04-22', '2026-04-22', '1970-01-01', 0.0, 0.0, @curr_c_1163, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('30637044', 'Miscellaneous Insurance', NULL, NULL, '2025-04-22', '2026-04-22', '1970-01-01', 0.0, 0.0, @curr_c_1163, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'KAPIL PANDURANG LIMKAR', 'no-email-dl-1165@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1165 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('65016088', 'Miscellaneous Insurance', NULL, NULL, '2025-04-22', '2026-04-22', '1970-01-01', 0.0, 0.0, @curr_c_1165, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('AMIT', 'KUMAR SHARMA', 'no-email-dl-1166@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1166 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33940180202501', 'Miscellaneous Insurance', NULL, NULL, '2025-04-22', '2026-04-22', '1970-01-01', 0.0, 0.0, @curr_c_1166, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Sharad', 'Maheshwari', 'no-email-dl-1167@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1167 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('PROHLN111360356', 'Miscellaneous Insurance', NULL, NULL, '2025-04-22', '2026-04-22', '1970-01-01', 0.0, 0.0, @curr_c_1167, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS', 'RANI KUMARI', 'no-email-dl-1168@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1168 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('31226042', 'Miscellaneous Insurance', NULL, NULL, '2025-04-23', '2026-04-23', '1970-01-01', 0.0, 0.0, @curr_c_1168, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'ASHISH KUMAR ARORA', 'no-email-dl-1169@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1169 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('65059420', 'Miscellaneous Insurance', NULL, NULL, '2025-04-24', '2026-04-24', '1970-01-01', 0.0, 0.0, @curr_c_1169, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Priyesh', 'Mahajan', 'no-email-dl-1170@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1170 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33174200202502', 'Miscellaneous Insurance', NULL, NULL, '2025-04-24', '2026-04-24', '1970-01-01', 0.0, 0.0, @curr_c_1170, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('CHAUDARI', 'MOHAMMED NADEEM', 'no-email-dl-1171@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1171 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('32408490202503', 'Miscellaneous Insurance', NULL, NULL, '2025-04-26', '2026-04-26', '1970-01-01', 0.0, 0.0, @curr_c_1171, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'SUMIT KUMAR', 'no-email-dl-1172@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1172 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('63621613', 'Miscellaneous Insurance', NULL, NULL, '2025-04-28', '2026-04-28', '1970-01-01', 0.0, 0.0, @curr_c_1172, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUMIT', 'HALDAR', 'no-email-dl-1173@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1173 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2856205360136102', 'Miscellaneous Insurance', NULL, NULL, '2025-04-10', '2026-04-10', '1970-01-01', 0.0, 0.0, @curr_c_1173, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('NATARAJAN', 'GANESHAN', 'no-email-dl-1174@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1174 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805207303523900', 'Miscellaneous Insurance', NULL, NULL, '2025-04-02', '2028-04-02', '1970-01-01', 0.0, 0.0, @curr_c_1174, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Nayan', 'Ambalal Parekh', 'no-email-dl-1175@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1175 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2825/58375341/07/000', 'Miscellaneous Insurance', NULL, NULL, '2025-04-06', '2026-04-06', '1970-01-01', 0.0, 0.0, @curr_c_1175, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6637111903007137', 'Miscellaneous Insurance', NULL, NULL, '2025-03-17', '2027-03-18', '1970-01-01', 0.0, 0.0, @curr_c_683, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Gerald', 'Anthony Miranda', 'no-email-dl-1177@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1177 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('5576112200007646', 'Miscellaneous Insurance', NULL, NULL, '2025-03-26', '2028-03-26', '1970-01-01', 0.0, 0.0, @curr_c_1177, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ms', 'Pooja Hawa', 'no-email-dl-1178@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1178 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('13820011', 'Miscellaneous Insurance', NULL, NULL, '2025-03-01', '2028-03-01', '1970-01-01', 0.0, 0.0, @curr_c_1178, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Arvinder Singh Chawla', 'no-email-dl-1179@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1179 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('81811985', 'Miscellaneous Insurance', NULL, NULL, '2025-03-13', '2027-03-14', '1970-01-01', 0.0, 0.0, @curr_c_1179, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr', 'Yogesh Chandra Sharma', 'no-email-dl-1180@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1180 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('30968036', 'Miscellaneous Insurance', NULL, NULL, '2025-03-30', '2028-03-30', '1970-01-01', 0.0, 0.0, @curr_c_1180, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAJNEESH', 'PRASAD SEN', 'no-email-dl-1181@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1181 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2805203554678503001', 'Miscellaneous Insurance', NULL, NULL, '2025-02-27', '2027-02-28', '1970-01-01', 0.0, 0.0, @curr_c_1181, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ATUL', 'CHANDRA KALITA', 'no-email-dl-1182@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1182 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('9009162101029886', 'Miscellaneous Insurance', NULL, NULL, '2025-02-19', '2027-02-20', '1970-01-01', 0.0, 0.0, @curr_c_1182, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Dr.', 'TARANI KANTA KALITA', 'no-email-dl-1183@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1183 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7897162101075720', 'Miscellaneous Insurance', NULL, NULL, '2025-02-19', '2027-02-20', '1970-01-01', 0.0, 0.0, @curr_c_1183, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Ruchira', 'Ohri', 'no-email-dl-1184@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1184 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2356112001034881', 'Miscellaneous Insurance', NULL, NULL, '2025-02-19', '2027-02-20', '1970-01-01', 0.0, 0.0, @curr_c_1184, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'ARVINDER SINGH CHAWLA', 'no-email-dl-1185@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1185 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('12111803', 'Miscellaneous Insurance', NULL, NULL, '2025-02-28', '2027-03-01', '1970-01-01', 0.0, 0.0, @curr_c_1185, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Rajesh Kumar', 'no-email-dl-1186@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1186 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11935342', 'Miscellaneous Insurance', NULL, NULL, '2025-01-18', '2028-01-19', '1970-01-01', 0.0, 0.0, @curr_c_1186, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KARAN', 'DUA', 'no-email-dl-1187@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1187 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('4713112101041396', 'Miscellaneous Insurance', NULL, NULL, '2025-01-03', '2027-01-04', '1970-01-01', 0.0, 0.0, @curr_c_1187, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Nitin', 'Gulati', 'no-email-dl-1188@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1188 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('32926095202402', 'Miscellaneous Insurance', NULL, NULL, '2024-12-27', '2027-12-28', '1970-01-01', 0.0, 0.0, @curr_c_1188, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('32933322202402', 'Miscellaneous Insurance', NULL, NULL, '2024-12-29', '2026-12-30', '1970-01-01', 0.0, 0.0, @curr_c_1188, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Madhuri', 'Hemant Bhandari', 'no-email-dl-1190@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1190 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11251475326301', 'Miscellaneous Insurance', NULL, NULL, '2024-12-09', '2027-12-10', '1970-01-01', 0.0, 0.0, @curr_c_1190, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Garv', 'dhar', 'no-email-dl-1191@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1191 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11251504919003', 'Miscellaneous Insurance', NULL, NULL, '2024-12-17', '2027-12-18', '1970-01-01', 0.0, 0.0, @curr_c_1191, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Dayanand', 'Yadav', 'no-email-dl-1192@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1192 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('6456162200038104', 'Miscellaneous Insurance', NULL, NULL, '2024-12-24', '2027-12-25', '1970-01-01', 0.0, 0.0, @curr_c_1192, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('', 'Roshni Samanta', 'no-email-dl-1193@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1193 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('31-24-0164598-01', 'Miscellaneous Insurance', NULL, NULL, '2024-11-15', '2027-11-16', '1970-01-01', 0.0, 0.0, @curr_c_1193, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Jujharpal Singh', 'no-email-dl-1194@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1194 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('49035328', 'Miscellaneous Insurance', NULL, NULL, '2024-11-21', '2026-11-22', '1970-01-01', 0.0, 0.0, @curr_c_1194, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Senthil', 'kumar', 'no-email-dl-1195@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1195 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11251177592802', 'Miscellaneous Insurance', NULL, NULL, '2024-10-21', '2026-10-22', '1970-01-01', 0.0, 0.0, @curr_c_1195, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Nitesh', 'Dudhakuwar', 'no-email-dl-1196@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1196 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('16251074420001', 'Miscellaneous Insurance', NULL, NULL, '2024-10-27', '2026-10-28', '1970-01-01', 0.0, 0.0, @curr_c_1196, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Anoop', 'Kumar', 'no-email-dl-1197@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1197 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('31-24-0144836-03', 'Miscellaneous Insurance', NULL, NULL, '2024-10-15', '2026-10-16', '1970-01-01', 0.0, 0.0, @curr_c_1197, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANANDARAJ', 'GOPALAKRISHNAN NAIR', 'no-email-dl-1198@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1198 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('16251189629501', 'Miscellaneous Insurance', NULL, NULL, '2024-10-23', '2027-10-24', '1970-01-01', 0.0, 0.0, @curr_c_1198, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ASHWANI', 'SINGH', 'no-email-dl-1199@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1199 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11250775635501', 'Miscellaneous Insurance', NULL, NULL, '2024-09-13', '2026-09-14', '1970-01-01', 0.0, 0.0, @curr_c_1199, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KRISHNA', 'NAND DEO PANDEY', 'no-email-dl-1200@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1200 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11250628646601', 'Miscellaneous Insurance', NULL, NULL, '2024-09-14', '2027-09-15', '1970-01-01', 0.0, 0.0, @curr_c_1200, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Devendra', 'Kumar Yadav', 'no-email-dl-1201@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1201 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('31989033202401', 'Miscellaneous Insurance', NULL, NULL, '2024-09-29', '2027-09-30', '1970-01-01', 0.0, 0.0, @curr_c_1201, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Debabrata', 'Paul', 'no-email-dl-1202@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1202 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('7000014322-01', 'Miscellaneous Insurance', NULL, NULL, '2024-09-07', '2027-09-08', '1970-01-01', 0.0, 0.0, @curr_c_1202, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUSHEEL', 'DINKAR RAJE', 'no-email-dl-1203@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1203 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11250400778501', 'Miscellaneous Insurance', NULL, NULL, '2024-08-06', '2027-08-07', '1970-01-01', 0.0, 0.0, @curr_c_1203, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('R', 'MOHANRAJ', 'no-email-dl-1204@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1204 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11250314769205', 'Miscellaneous Insurance', NULL, NULL, '2024-08-19', '2026-08-20', '1970-01-01', 0.0, 0.0, @curr_c_1204, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Chinmay Desai', 'no-email-dl-1205@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1205 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('32691878', 'Miscellaneous Insurance', NULL, NULL, '2024-08-06', '2026-08-07', '1970-01-01', 0.0, 0.0, @curr_c_1205, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Byalya Thimmapppa Shanthiprasad', 'no-email-dl-1206@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1206 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33050645', 'Miscellaneous Insurance', NULL, NULL, '2024-08-06', '2026-08-07', '1970-01-01', 0.0, 0.0, @curr_c_1206, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'MADHUKAR S BHAMBORE', 'no-email-dl-1207@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1207 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('44764681', 'Miscellaneous Insurance', NULL, NULL, '2024-08-13', '2027-08-14', '1970-01-01', 0.0, 0.0, @curr_c_1207, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Maruti', 'Chouudry Chouudry vellanki', 'no-email-dl-1208@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1208 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-21-0060711-01', 'Miscellaneous Insurance', NULL, NULL, '2024-08-15', '2027-08-16', '1970-01-01', 0.0, 0.0, @curr_c_1208, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mahendra', 'Rathod', 'no-email-dl-1209@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1209 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-21-0066591-01', 'Miscellaneous Insurance', NULL, NULL, '2024-08-29', '2027-08-30', '1970-01-01', 0.0, 0.0, @curr_c_1209, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('KAPIL', 'SAGAR', 'no-email-dl-1210@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1210 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11250336066901', 'Miscellaneous Insurance', NULL, NULL, '2024-07-16', '2027-07-17', '1970-01-01', 0.0, 0.0, @curr_c_1210, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Amit', 'KUMAR AGARWAL', 'no-email-dl-1211@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1211 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-21-0054129-01', 'Miscellaneous Insurance', NULL, NULL, '2024-07-30', '2027-07-31', '1970-01-01', 0.0, 0.0, @curr_c_1211, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Dean', 'Agnel Creado', 'no-email-dl-1212@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1212 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('0238536650-03', 'Miscellaneous Insurance', NULL, NULL, '2024-07-06', '2027-07-07', '1970-01-01', 0.0, 0.0, @curr_c_1212, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Preeti', 'Bhaskar', 'no-email-dl-1213@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1213 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('P/161130/01/2025/034802', 'Miscellaneous Insurance', NULL, NULL, '2024-06-25', '2026-06-26', '1970-01-01', 0.0, 0.0, @curr_c_1213, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Anish', 'Nehra', 'no-email-dl-1214@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1214 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11250122156201', 'Miscellaneous Insurance', NULL, NULL, '2024-06-29', '2026-06-30', '1970-01-01', 0.0, 0.0, @curr_c_1214, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('RAMAN', 'KHETERPAL', 'no-email-dl-1215@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1215 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-17-0002814-10', 'Miscellaneous Insurance', NULL, NULL, '2024-06-29', '2026-06-30', '1970-01-01', 0.0, 0.0, @curr_c_1215, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('manish', 'mohan bhandare', 'no-email-dl-1216@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1216 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('P/161130/02/2025/000332', 'Miscellaneous Insurance', NULL, NULL, '2024-05-09', '2026-05-10', '1970-01-01', 0.0, 0.0, @curr_c_1216, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('VILAS', 'RAJARAM WAMAN', 'no-email-dl-1217@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1217 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33201322202401', 'Miscellaneous Insurance', NULL, NULL, '2024-05-12', '2026-05-13', '1970-01-01', 0.0, 0.0, @curr_c_1217, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('ANCHRA', 'MADAN', 'no-email-dl-1218@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1218 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2866100300938004', 'Miscellaneous Insurance', NULL, NULL, '2024-04-14', '2026-04-15', '1970-01-01', 0.0, 0.0, @curr_c_1218, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SAURABH', 'SHUKLA', 'no-email-dl-1219@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1219 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('33163705202401', 'Miscellaneous Insurance', NULL, NULL, '2024-04-20', '2027-04-21', '1970-01-01', 0.0, 0.0, @curr_c_1219, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'MOHAMMED ZAHIR AHMED', 'no-email-dl-1220@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1220 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('30668423', 'Miscellaneous Insurance', NULL, NULL, '2024-03-11', '2027-03-12', '1970-01-01', 0.0, 0.0, @curr_c_1220, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MS', 'SIMRAN SIMRAN', 'no-email-dl-1221@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1221 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('12237660', 'Miscellaneous Insurance', NULL, NULL, '2024-03-15', '2027-03-16', '1970-01-01', 0.0, 0.0, @curr_c_1221, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('30655431', 'Miscellaneous Insurance', NULL, NULL, '2024-03-11', '2027-03-12', '1970-01-01', 0.0, 0.0, @curr_c_1220, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Ashok Kumar', 'no-email-dl-1223@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1223 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('12157670', 'Miscellaneous Insurance', NULL, NULL, '2024-02-23', '2027-02-23', '1970-01-01', 0.0, 0.0, @curr_c_1223, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Sunil', 'Kumar Sharma', 'no-email-dl-1224@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1224 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('P/161130/02/2024/000705', 'Miscellaneous Insurance', NULL, NULL, '2024-01-11', '2027-01-11', '1970-01-01', 0.0, 0.0, @curr_c_1224, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SUJAY', 'RAMESH', 'no-email-dl-1225@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1225 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('19596622', 'Miscellaneous Insurance', NULL, NULL, '2024-01-09', '2027-01-09', '1970-01-01', 0.0, 0.0, @curr_c_1225, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Amit', 'Aggarwal', 'no-email-dl-1226@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1226 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('16240490717301', 'Miscellaneous Insurance', NULL, NULL, '2023-12-07', '2026-12-07', '1970-01-01', 0.0, 0.0, @curr_c_1226, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('DEEPMALA', 'AGGARWAL', 'no-email-dl-1227@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1227 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('16240490562201', 'Miscellaneous Insurance', NULL, NULL, '2023-12-07', '2026-12-07', '1970-01-01', 0.0, 0.0, @curr_c_1227, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MAHASWETA', 'PAUL', 'no-email-dl-1228@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1228 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2828100249075404', 'Miscellaneous Insurance', NULL, NULL, '2023-11-11', '2026-11-11', '1970-01-01', 0.0, 0.0, @curr_c_1228, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Anang Pal Tomar', 'no-email-dl-1229@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1229 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('11713641', 'Miscellaneous Insurance', NULL, NULL, '2023-10-30', '2026-10-30', '1970-01-01', 0.0, 0.0, @curr_c_1229, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Shanmugapandi', 'Mariappan', 'no-email-dl-1230@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1230 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('21-21-0080407-01', 'Miscellaneous Insurance', NULL, NULL, '2023-09-28', '2026-09-28', '1970-01-01', 0.0, 0.0, @curr_c_1230, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Mr.', 'SHARLIN THAYIL', 'no-email-dl-1231@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1231 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('PROHLR280100040', 'Miscellaneous Insurance', NULL, NULL, '2023-09-14', '2026-09-14', '1970-01-01', 0.0, 0.0, @curr_c_1231, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('SANKET', 'VIJAY SHIRSAT', 'no-email-dl-1232@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1232 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('PROHLR280100014', 'Miscellaneous Insurance', NULL, NULL, '2023-09-05', '2026-09-05', '1970-01-01', 0.0, 0.0, @curr_c_1232, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'Rajkishor Rajkishor', 'no-email-dl-1233@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1233 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('10709031', 'Miscellaneous Insurance', NULL, NULL, '2023-07-05', '2026-07-05', '1970-01-01', 0.0, 0.0, @curr_c_1233, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('Lakshmi', 'Kuppuswamy', 'no-email-dl-1234@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1234 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('PROHLR111299241', 'Miscellaneous Insurance', NULL, NULL, '2023-07-27', '2026-07-27', '1970-01-01', 0.0, 0.0, @curr_c_1234, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('HARIDAS', 'M', 'no-email-dl-1235@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1235 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('2828100810021401', 'Miscellaneous Insurance', NULL, NULL, '2023-06-25', '2026-06-25', '1970-01-01', 0.0, 0.0, @curr_c_1235, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('MR', 'ANUPAM MISHRA', 'no-email-dl-1236@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1236 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('14285475', 'Miscellaneous Insurance', NULL, NULL, '2023-06-05', '2026-06-05', '1970-01-01', 0.0, 0.0, @curr_c_1236, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES ('HARIKRISHNAN', 'BALAGOPAL', 'no-email-dl-1237@default.com', '0', NULL, NULL, NULL, NULL, 'Delhi', NULL, NULL, NULL);
SET @curr_c_1237 = LAST_INSERT_ID();

INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) VALUES ('P/161130/01/2024/026412', 'Miscellaneous Insurance', NULL, NULL, '2023-05-19', '2026-05-19', '1970-01-01', 0.0, 0.0, @curr_c_1237, 'ACTIVE', NULL, NULL, NULL, NULL, NULL, 'Delhi');

SET FOREIGN_KEY_CHECKS=1;
