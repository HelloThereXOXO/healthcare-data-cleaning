SELECT* FROM raw_healthcare_dataset;

CREATE TABLE healthcare_clean AS
SELECT * FROM raw_healthcare_dataset;

-- Add Length of Stay column
ALTER TABLE healthcare_clean 
ADD COLUMN `Length of Stay (Days)` INT;

UPDATE healthcare_clean
SET `Length of Stay (Days)` = DATEDIFF(
    STR_TO_DATE(`Discharge Date`, '%Y-%m-%d'),
    STR_TO_DATE(`Date of Admission`, '%Y-%m-%d')
);

-- Removing Unnecessary Columns
ALTER TABLE healthcare_clean
DROP COLUMN Hospital,
DROP COLUMN Doctor,
DROP COLUMN `Room Number`;

-- Reorder Columns
ALTER TABLE healthcare_clean
MODIFY COLUMN `Name` TEXT FIRST,
MODIFY COLUMN `Age` INT AFTER `Name`,
MODIFY COLUMN `Gender` TEXT AFTER `Age`,
MODIFY COLUMN `Blood Type` TEXT AFTER `Gender`,
MODIFY COLUMN `Medical Condition` TEXT AFTER `Blood Type`,
MODIFY COLUMN `Admission Type` TEXT AFTER `Medical Condition`,
MODIFY COLUMN `Date of Admission` TEXT AFTER `Admission Type`,
MODIFY COLUMN `Discharge Date` TEXT AFTER `Date of Admission`,
MODIFY COLUMN `Length of Stay (Days)` INT AFTER `Discharge Date`,
MODIFY COLUMN `Insurance Provider` TEXT AFTER `Length of Stay (Days)`,
MODIFY COLUMN `Billing Amount` DOUBLE AFTER `Insurance Provider`,
MODIFY COLUMN `Medication` TEXT AFTER `Billing Amount`,
MODIFY COLUMN `Test Results` TEXT AFTER `Medication`;
