
-- 1) Show what each customer bought (JOIN across 4 tables)
SELECT 
c.full_name,
o.order_id,
o.order_date,
p.product_name,
oi.quantity,
oi.price,
o.status
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
ORDER BY o.order_date,o.order_id
