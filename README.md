# SQL E-Commerce Analysis (PostgreSQL)

## Project Overview
This project demonstrates a small e-commerce relational database built in PostgreSQL.  
It includes schema design (tables + relationships), sample data, and analysis queries to extract business insights.

## Database Schema
The database contains four tables:

- customers
- products
- orders
- order_items

Relationships:
- orders.customer_id → customers.customer_id
- order_items.order_id → orders.order_id
- order_items.product_id → products.product_id

## Project Structure
- 01_schema/ : table creation, constraints, indexes
- 02_seeds/  : sample data insertion (INSERT statements)
- 03_queries/: analysis queries (joins, group by, having, window functions)
- 04_outputs/: sample results / notes (optional)

## Key Skills Demonstrated
- Relational database modelling (PK, FK)
- Constraints (NOT NULL, UNIQUE, CHECK)
- INNER JOIN and LEFT JOIN
- Aggregations (SUM, COUNT) with GROUP BY / HAVING
- Window functions (RANK, running totals)
- Indexing basics for performance
- Clean SQL project organisation for GitHub

## How to Run (Local PostgreSQL)
1) Create a database:
```sql
CREATE DATABASE sql_ecommerce;
```

2) Run schema files (in order):

- 01_schema/01_create_tables.sql
- 01_schema/02_constraints.sql   (if used)
- 01_schema/03_indexes.sql

3) Insert seed data:

- 02_seeds/01_insert_sample_data.sql

4) Execute analysis queries:

- 03_queries/01_basic_selects.sql
- 03_queries/02_joins.sql
- 03_queries/03_groupby_having.sql
- 03_queries/04_subqueries.sql
- 03_queries/05_window_functions.sql

---

## Example Analyses Included

- Total revenue per order
- Total spending per customer (basic customer lifetime value)
- Revenue by product category
- Top 3 best-selling products
- Customers ranked by total spending (RANK window function)
- Running revenue over time
- Customers with more than 1 order (HAVING)
- Data quality validation using LEFT JOIN

---

## Notes

- Seed files contain INSERT statements only for reproducibility.
- Indexes are created on frequently joined columns.
- Queries are separated by concept for clarity and maintainability.