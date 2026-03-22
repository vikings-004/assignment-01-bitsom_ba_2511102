-- Q1: List all customers along with the total number of orders they have placed
SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM read_csv_auto('datasets/customers.csv') c
LEFT JOIN read_json_auto('datasets/orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;


-- Q2: Find the top 3 customers by total order value
SELECT 
    c.customer_id,
    c.customer_name,
    SUM(o.total_amount) AS total_value
FROM read_csv_auto('datasets/customers.csv') c
JOIN read_json_auto('datasets/orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_value DESC
LIMIT 3;


-- Q3: List all products purchased by customers from Bangalore
-- Note: orders.json does not contain product_id, so product-level join is not possible
SELECT 
    c.customer_name,
    o.order_id,
    o.total_amount
FROM read_csv_auto('datasets/customers.csv') c
JOIN read_json_auto('datasets/orders.json') o
ON c.customer_id = o.customer_id
WHERE c.customer_city = 'Bangalore';


-- Q4: Join all three files to show: customer name, order date, product name, and quantity
-- Note: orders.json does not contain product_id, so product-level join is not possible
SELECT 
    c.customer_name,
    o.order_date,
    o.total_amount,
    o.num_items
FROM read_csv_auto('datasets/customers.csv') c
JOIN read_json_auto('datasets/orders.json') o
ON c.customer_id = o.customer_id
LEFT JOIN read_parquet('datasets/products.parquet') p
ON 1=0;