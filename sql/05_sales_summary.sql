-- Sales Summary Dashboard KPIs
-- Purpose: Calculate key metrics for a sales dashboard.

SELECT
    SUM(quantity * unit_price) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_units_sold,
    COUNT(DISTINCT customer_id) AS total_customers,
    ROUND(
        SUM(quantity * unit_price)
        / NULLIF(COUNT(DISTINCT order_id), 0),
        2
    ) AS average_order_value,
    ROUND(
        SUM(quantity * unit_price)
        / NULLIF(SUM(quantity), 0),
        2
    ) AS average_selling_price
FROM sales;
