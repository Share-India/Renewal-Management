-- Migration script to fix NULL values for isLateRenewal column
-- Run this in your MySQL database

USE insurance_renewal;

-- Update existing NULL values to FALSE
UPDATE policy 
SET is_late_renewal = FALSE 
WHERE is_late_renewal IS NULL;

-- Verify the update
SELECT COUNT(*) as updated_count 
FROM policy 
WHERE is_late_renewal = FALSE;
