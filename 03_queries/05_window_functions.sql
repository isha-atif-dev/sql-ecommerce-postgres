-- 1) Rank customers by spending (window function)
SELECT
  c.full_name,
  SUM(oi.quantity * oi.price) AS total_spent,
  RANK() OVER (ORDER BY SUM(oi.quantity * oi.price) DESC) AS spend_rank
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY c.full_name
ORDER BY spend_rank;

-- 2) Running revenue over time (window function)
WITH daily_revenue AS (
  SELECT
    o.order_date,
    SUM(oi.quantity * oi.price) AS revenue
  FROM orders o
  JOIN order_items oi ON oi.order_id = o.order_id
  GROUP BY o.order_date
)
SELECT
  order_date,
  revenue,
  SUM(revenue) OVER (ORDER BY order_date) AS running_revenue
FROM daily_revenue
ORDER BY order_date;