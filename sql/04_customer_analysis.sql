-- Customer Analysis
-- Purpose: Understand customer purchasing behavior and value.

-- 1. Total spending by each customer
SELECT
    customer_id,
    SUM(quantity * unit_price) AS total_spending
FROM sales
GROUP BY customer_id
ORDER BY total_spending DESC;

-- 2. Top 10 customers by revenue
SELECT
    customer_id,
    SUM(quantity * unit_price) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM sales
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 10;

-- 3. Number of orders per customer
SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS total_orders
FROM sales
GROUP BY customer_id
ORDER BY total_orders DESC;

-- 4. Average order value by customer
SELECT
    customer_id,
    SUM(quantity * unit_price)
        / NULLIF(COUNT(DISTINCT order_id), 0) AS average_order_value
FROM sales
GROUP BY customer_id
ORDER BY average_order_value DESC;
