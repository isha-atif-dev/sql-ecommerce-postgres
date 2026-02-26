-- inserting customers
INSERT INTO customers (full_name, email, country)
VALUES
('Isha Atif', 'isha@email.com', 'UK'),
('Ali Khan', 'ali@email.com', 'Pakistan'),
('Sara Malik', 'sara@email.com', 'UK');

INSERT INTO customers (full_name, email, country)
VALUES
('Ahmed Raza', 'ahmed@email.com', 'UK');

-- inserting products
INSERT INTO products (product_name, category, price)
VALUES
('Laptop', 'Electronics', 1200.00),
('Phone', 'Electronics', 800.00),
('Desk Chair', 'Furniture', 150.00),
('Book', 'Education', 20.00);



-- inserting orders

INSERT INTO orders (customer_id, order_date, status)
VALUES
(1, '2025-01-10', 'placed'),
(2, '2025-01-12', 'shipped'),
(1, '2025-02-01', 'delivered'),
(3, '2025-02-05', 'placed');


-- inserting order_items 

INSERT INTO order_items (order_id, product_id, quanity, price)
VALUES
(1, 1, 1, 1200.00),
(1, 4, 2, 20.00),
(2, 2, 1, 800.00),
(3, 3, 1, 150.00),
(4, 4, 3, 20.00);

