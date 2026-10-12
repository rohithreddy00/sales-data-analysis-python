
-- Sales Data Analysis: Key Performance Indicators (KPIs)
-- Purpose: Measure revenue, order volume, and product performance.
-- Note: Update table and column names to match your dataset.

-- 1. Total sales revenue
SELECT
    SUM(quantity * unit_price) AS total_revenue
FROM sales;

-- 2. Total number of orders
SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM sales;

-- 3. Total units sold
SELECT
    SUM(quantity) AS total_units_sold
FROM sales;

-- 4. Top 10 products by revenue
SELECT
    product_name,
    SUM(quantity * unit_price) AS total_revenue
FROM sales
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 10;
