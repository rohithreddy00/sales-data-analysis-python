-- Monthly Sales Trend Analysis
-- Purpose: Analyze revenue and order trends by month.

-- 1. Monthly revenue
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
    SUM(quantity * unit_price) AS monthly_revenue
FROM sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY sales_month;

-- 2. Monthly order volume
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
    COUNT(DISTINCT order_id) AS total_orders
FROM sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY sales_month;

-- 3. Monthly units sold
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
    SUM(quantity) AS total_units_sold
FROM sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY sales_month;

-- 4. Month-over-month revenue growth
WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
        SUM(quantity * unit_price) AS monthly_revenue
    FROM sales
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT
    sales_month,
    monthly_revenue,
    LAG(monthly_revenue) OVER (
        ORDER BY sales_month
    ) AS previous_month_revenue,
    ROUND(
        (
            monthly_revenue - LAG(monthly_revenue) OVER (
                ORDER BY sales_month
            )
        ) / NULLIF(
            LAG(monthly_revenue) OVER (
                ORDER BY sales_month
            ), 0
        ) * 100,
        2
    ) AS revenue_growth_percent
FROM monthly_sales
ORDER BY sales_month;
