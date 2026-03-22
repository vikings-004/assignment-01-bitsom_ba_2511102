## Anomaly Analysis

### Insert Anomaly
In the `orders_flat.csv`, product-related columns such as `product_name`, `category`, and `unit_price` are always stored along with order-related columns like `order_id`.

For example, in rows where `order_id = ORD1027` or `ORD1114`, products such as "Laptop" or "Headphones" are recorded only as part of an order.

This means that if a new product needs to be added (e.g., a new "Tablet"), it cannot be inserted into the dataset unless an `order_id` is also created. Since product data cannot exist independently of order data, this results in an insert anomaly.

---

### Update Anomaly
Customer details such as `customer_name`, `customer_email`, and `customer_city` are repeated across multiple rows.

For instance, the same customer (e.g., "Rahul Sharma") appears in multiple rows with different `order_id` values (e.g., `ORD1027`, `ORD1002`). These values are stored in columns `customer_name`, `customer_email`, and `customer_city`.

If Rahul moves from Mumbai to Pune, the `customer_city` column must be updated in every row where he appears. Missing even one row would lead to inconsistent data.

Similarly, sales representative details such as `sales_rep_name` and `office_address` are repeated across rows (e.g., rows where `sales_rep_name = Anita Verma`). Any change in office location would require multiple updates.

This duplication across rows leads to an update anomaly.

---

### Delete Anomaly
Each row in the dataset contains combined information from multiple entities, including orders, products, customers, and sales representatives.

For example, consider a row where `order_id = ORD1027` and the product (in column `product_name`) is "Tablet". If this product appears only in that row, deleting this row would remove all related product information, including `product_name`, `category`, and `unit_price`.

Similarly, if a customer appears in only one row, deleting that row would remove all their details (`customer_name`, `customer_email`, `customer_city`).

Thus, deleting a single order can lead to unintended loss of product or customer data, resulting in a delete anomaly.