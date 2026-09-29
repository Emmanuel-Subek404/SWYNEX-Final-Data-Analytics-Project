-- =====================================================
-- SWYNEX Technologies - Data Analytics Internship
-- Task 2: Exploratory Data Analysis
-- Dataset: Superstore Sales
-- Database Setup & Data Import
-- =====================================================

Create Database if not exists swynex_superstore_eda;

use swynex_superstore_eda;


-- 1. CREATE SUPERSTORE TABLE

Drop table if exists superstore;

CREATE TABLE superstore (
    row_id VARCHAR(20),
    order_id VARCHAR(50),
    order_date VARCHAR(30),
    ship_date VARCHAR(30),
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(150),
    segment VARCHAR(50),
    country VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(100),
    sub_category VARCHAR(100),
    product_name VARCHAR(500),
    sales VARCHAR(50)
);


-- 2. IMPORT CLEANED DATASET

LOAD DATA LOCAL INFILE 'D:/Data Analytics/SWYNEX-Data-Cleaning-Preparation/data/cleaned/superstore_cleaned.csv'
INTO TABLE superstore
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;


-- 3. CHECK TOTAL RECORDS

select count(*) as total_count
from superstore;


-- 4. PREVIEW DATA

select *
from superstore
limit 10;