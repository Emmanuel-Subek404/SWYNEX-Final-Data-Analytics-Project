-- =====================================================
-- SWYNEX Technologies - Data Analytics Internship
-- Task 2: Exploratory Data Analysis
-- Data Validation & Data Type Conversion
-- =====================================================

use swynex_superstore_eda;


-- 1. CHECK TABLE STRUCTURE

Describe superstore;


-- 2. CHECK INVALID ORDER DATES

SELECT COUNT(*) AS invalid_order_dates
FROM superstore
WHERE STR_TO_DATE(order_date, '%Y-%m-%d') IS NULL
  AND order_date IS NOT NULL;


-- 3. CHECK INVALID SHIP DATES

SELECT COUNT(*) AS invalid_ship_dates
FROM superstore
WHERE STR_TO_DATE(ship_date, '%Y-%m-%d') IS NULL
  AND ship_date IS NOT NULL;


-- 4. CHECK INVALID SALES VALUES

SELECT COUNT(*) AS invalid_sales
FROM superstore
WHERE sales NOT REGEXP '^[0-9]+(\\.[0-9]+)?$';


-- 5. CONVERT DATA TYPES

ALTER TABLE superstore
    MODIFY COLUMN row_id INT,
    MODIFY COLUMN order_date DATE,
    MODIFY COLUMN ship_date DATE,
    MODIFY COLUMN sales DECIMAL(12,4);


-- Postal Code is kept as VARCHAR because it is an
-- identifier and can contain leading zeros.


-- 6. CHECK TABLE AFTER CONVERSION

Describe superstore;


-- 7. CHECK TOTAL RECORDS

select count(*) as total_records
from superstore;


-- 8. PREVIEW IMPORTANT COLUMNS

SELECT
    row_id,
    order_date,
    ship_date,
    postal_code,
    sales
FROM superstore
LIMIT 10;