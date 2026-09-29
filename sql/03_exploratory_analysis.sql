-- =====================================================
-- SWYNEX Technologies - Data Analytics Internship
-- Task 2: Exploratory Data Analysis
-- Dataset: Superstore Sales
-- =====================================================

use swynex_superstore_eda;


-- 1. OVERALL SUMMARY STATISTICS

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(AVG(sales), 2) AS average_sale,
    ROUND(MIN(sales), 2) AS minimum_sale,
    ROUND(MAX(sales), 2) AS maximum_sale
FROM superstore;


-- 2. DATASET TIME RANGE

SELECT
    MIN(order_date) AS earliest_order_date,
    MAX(order_date) AS latest_order_date,
    DATEDIFF(MAX(order_date), MIN(order_date)) AS days_covered
FROM superstore;


-- 3. SALES BY YEAR

SELECT
    YEAR(order_date) AS sales_year,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY YEAR(order_date)
ORDER BY sales_year;


-- 4. SALES BY CATEGORY

Select Category,
       round(sum(sales),2) as total_sales,
       round(avg(sales),2) as average_sales
from superstore
group by category
order by total_sales desc;


-- 5. SALES BY SUB-CATEGORY

Select sub_category,
       round(sum(sales),2) as total_sales
from superstore
group by sub_category
order by total_sales desc;


-- 6. SALES BY REGION

Select region,
       count(distinct order_id) as total_orders,
       round(sum(sales),2) as total_sales
from superstore
group by region
order by total_sales desc;


-- 7. SALES BY CUSTOMER SEGMENT

Select segment,
       count(distinct customer_id) as customers,
       round(sum(sales),2) as total_sales
From superstore
group by segment
order by total_sales desc;


-- 8. TOP 10 STATES BY SALES

Select state,
       round(sum(sales),2) as total_sales
from superstore
group by state
order by total_sales desc
limit 10;


-- 9. TOP 10 PRODUCTS BY SALES

select product_name,
       round(sum(sales),2) as total_sales
from superstore
group by product_name
order by total_sales desc
limit 10;


-- 10. MONTHLY SALES TREND

select date_format(order_date, '%Y-%m') as sales_month,
       round(sum(sales),2) as total_sales
from superstore
group by date_format(order_date,'%Y-%m')
order by sales_month;


-- 11. SALES DISTRIBUTION

Select Round(avg(sales),2) as average_sale,
       round(Stddev_pop(sales),2) as sales_std_dev,
       round(min(sales),2) as minimum_sale,
       round(max(sales),2) as maximum_sale
from superstore;


-- 12. TOP 10 HIGHEST-VALUE SALES RECORDS

Select order_id,
       order_date,
       customer_name,
       category,
       sub_category,
       product_name,
       sales
from superstore
order by sales desc
limit 10;

-- 13. TOP 5 MONTHS BY SALES

Select date_format(order_date, '%Y-%m') as sales_month,
       round(sum(sales),2) as total_sales
from superstore
group by date_format(order_date,'%Y-%m')
order by total_sales desc
limit 5;


-- 14. POTENTIAL HIGH-VALUE SALES ANOMALIES

Select order_id,
       order_date,
       customer_name,
       category,
       sub_category,
       product_name,
       sales
from superstore
where sales > (
    Select avg(sales) + (3 * stddev_pop(sales))
    from superstore
)
order by sales desc;


-- 15. COUNT OF POTENTIAL HIGH-VALUE ANOMALIES

Select count(*) as potential_anomalies
from superstore
where sales > (
    Select avg(sales) + (3 * stddev_pop(sales))
    from superstore
);

-- 16. ANOMALY THRESHOLD

Select round(
    avg(sales) + (3 * stddev_pop(sales)), 2
) as anomaly_threshold
from superstore;