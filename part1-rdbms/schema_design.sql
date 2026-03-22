-- =========================
-- TABLES
-- =========================

CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE sales_reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address VARCHAR(200) NOT NULL
);

CREATE TABLE orders (
    order_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

CREATE TABLE order_items (
    order_id VARCHAR(20),
    product_id VARCHAR(10),
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- =========================
-- CUSTOMERS (DEDUPED)
-- =========================

INSERT INTO customers VALUES
('C002','Priya Sharma','priya@gmail.com','Delhi'),
('C001','Rohan Mehta','rohan@gmail.com','Mumbai'),
('C006','Neha Gupta','neha@gmail.com','Delhi'),
('C003','Amit Verma','amit@gmail.com','Bangalore'),
('C005','Vikram Singh','vikram@gmail.com','Mumbai'),
('C004','Sneha Iyer','sneha@gmail.com','Chennai'),
('C007','Arjun Nair','arjun@gmail.com','Bangalore');

-- =========================
-- PRODUCTS (DEDUPED)
-- =========================

INSERT INTO products VALUES
('P004','Notebook','Stationery',120),
('P007','Pen Set','Stationery',250),
('P005','Headphones','Electronics',3200),
('P003','Desk Chair','Furniture',8500),
('P006','Standing Desk','Furniture',22000),
('P008','Webcam','Electronics',2100),
('P001','Laptop','Electronics',55000);

-- =========================
-- SALES REPS (DEDUPED)
-- =========================

INSERT INTO sales_reps VALUES
('SR02','Anita Desai','anita@corp.com','Delhi Office, Connaught Place, New Delhi - 110001'),
('SR01','Deepak Joshi','deepak@corp.com','Mumbai HQ, Nariman Point, Mumbai - 400021'),
('SR03','Ravi Kumar','ravi@corp.com','South Zone, MG Road, Bangalore - 560001');

-- =========================
-- ORDERS (UNIQUE order_id)
-- =========================

INSERT INTO orders VALUES
('ORD1027','C002','SR02','2023-11-02'),
('ORD1114','C001','SR01','2023-08-06'),
('ORD1153','C006','SR01','2023-02-14'),
('ORD1002','C002','SR02','2023-01-17'),
('ORD1118','C006','SR02','2023-11-10'),
('ORD1132','C003','SR02','2023-03-07'),
('ORD1037','C002','SR03','2023-03-06'),
('ORD1075','C005','SR03','2023-04-18'),
('ORD1083','C006','SR01','2023-07-03'),
('ORD1091','C001','SR01','2023-07-24'),
('ORD1162','C006','SR03','2023-09-29'),
('ORD1185','C003','SR03','2023-06-15'),
('ORD1076','C004','SR03','2023-05-16'),
('ORD1133','C001','SR03','2023-10-16'),
('ORD1061','C006','SR01','2023-10-27'),
('ORD1098','C007','SR03','2023-10-03');

-- =========================
-- ORDER ITEMS (EVERY ROW FROM CSV)
-- =========================

INSERT INTO order_items VALUES
('ORD1027','P004',4),
('ORD1114','P007',2),
('ORD1153','P007',3),
('ORD1002','P005',1),
('ORD1118','P007',5),
('ORD1132','P007',5),
('ORD1037','P007',2),
('ORD1075','P003',3),
('ORD1083','P007',2),
('ORD1091','P006',3),
('ORD1162','P004',3),
('ORD1185','P008',1),
('ORD1076','P006',5),
('ORD1133','P004',1),
('ORD1061','P001',4),
('ORD1098','P001',2);