-- 1) Total revenue per order
SELECT
  o.order_id,
  SUM(oi.quantity * oi.price) AS order_total
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY o.order_id
ORDER BY order_total DESC;

-- 2) Total spending per customer (customer lifetime value basic)
SELECT
  c.full_name,
  SUM(oi.quantity * oi.price) AS total_spent
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY c.full_name
ORDER BY total_spent DESC;

-- 3) Revenue by product category
SELECT
  p.category,
  SUM(oi.quantity * oi.price) AS revenue
FROM products p
JOIN order_items oi ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- 4) Top 3 best-selling products (by quantity)
SELECT
  p.product_name,
  SUM(oi.quantity) AS units_sold
FROM products p
JOIN order_items oi ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY units_sold DESC
LIMIT 3;


-- 5) Customers with more than 1 order (HAVING)
SELECT
  c.full_name,
  COUNT(DISTINCT o.order_id) AS orders_count
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
GROUP BY c.full_name
HAVING COUNT(DISTINCT o.order_id) > 1
ORDER BY orders_count DESC;