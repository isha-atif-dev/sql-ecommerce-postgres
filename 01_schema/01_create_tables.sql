-- Customers 

CREATE TABLE customers (
	customer_id SERIAL PRIMARY KEY,
	full_name VARCHAR(100) NOT NULL,
	email VARCHAR(120) UNIQUE NOT NULL,
	country VARCHAR(50) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Products 

CREATE TABLE products (
	product_id SERIAL PRIMARY KEY,
	product_name VARCHAR(120) NOT NULL,
	category VARCHAR(80) NOT NULL,
	price NUMERIC(10,2) CHECK(PRICE > 0)
);

-- Orders

CREATE TABLE orders (
	order_id SERIAL PRIMARY KEY,
	customer_id INT REFERENCES customers(customer_id),
	order_date DATE NOT NULL,
	status VARCHAR(30) CHECK (status IN ('placed','shipped','delivered','cancelled'))
);


--Order Items

CREATE TABLE order_items (
	order_item_id SERIAL PRIMARY KEY,
	order_id INT REFERENCES orders(order_id),
	product_id INT REFERENCES products(product_id),
	quantity INT CHECK (quantity > 0),
	price NUMERIC(10,2) CHECK (price > 0)
);
