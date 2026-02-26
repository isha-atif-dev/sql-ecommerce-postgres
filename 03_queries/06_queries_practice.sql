-- Q1 — Basic Filtering
-- Show all customers from UK, ordered by newest created_at first.
SELECT *
FROM customers
WHERE country = 'UK'
ORDER BY created_at ASC

-- Q2 — Join Practice

-- Show each order with:
-- customer name
-- order_id
-- order_date
-- status
-- Order by order_date descending.

SELECT full_name,order_id,order_date,status
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
ORDER BY order_date DESC


-- Q3 — Aggregation

-- Show total revenue per order.
-- Sort highest revenue first.

SELECT o.order_id,
SUM(oi.quantity * oi.price) AS Total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id
ORDER BY Total_revenue DESC

-- Q4 — LEFT JOIN Logic

-- Show all customers and the number of orders they placed.
-- Customers with no orders should show 0.

SELECT c.customer_id,c.full_name,
COUNT(o.order_id) AS Total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name
ORDER BY total_orders DESC;

-- Q5 — HAVING Practice
-- Show customers who have placed more than 1 order.


SELECT c.customer_id,c.full_name,
COUNT(o.order_id) AS Total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id,c.full_name
HAVING COUNT(o.order_id) > 1;


-- Q6 — Multi-table Revenue
-- Show total revenue per customer (customer lifetime value).
-- Sort highest spender first.

SELECT c.customer_id,c.full_name,
COALESCE(SUM(oi.quantity * oi.price ),0) AS Total_revenue
FROM customers c 
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY  c.customer_id,c.full_name
ORDER BY Total_revenue DESC


-- Q7 — Category Analysis
-- Show revenue per product category.
-- Only show categories earning more than 500.


SELECT p.category,
SUM(oi.quantity * oi.price ) AS Total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
HAVING SUM(oi.quantity * oi.price) > 500



--  Q8 — NULL Understanding
-- Show customers who have never placed an order.

SELECT c.customer_id,c.full_name,o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;



-- Q9 — Business Question
-- Show the top 2 best-selling products by quantity sold.

SELECT p.product_name,
SUM(oi.quantity) AS total_quantity
FROM products p
JOIN order_items oi ON oi.product_id = p.product_id
GROUP BY p.product_name
LIMIT 2;


-- Q10 — Harder One (Multi-step Thinking)

-- Show the country that generated the highest total revenue.

-- Return:

-- country

-- total_revenue

-- Only 1 row (highest).

SELECT 
	c.country,
	SUM(oi.quantity * oi.price) AS Total_revenue
FROM customers c 
JOIN orders o 
	ON o.customer_id = c.customer_id
JOIN order_items oi 
	ON oi.order_id = o.order_id
GROUP BY c.country
ORDER BY Total_revenue DESC
LIMIT 1;




SELECT c.full_name,o.order_id,o.status
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id
 AND o.status = 'delivered'

