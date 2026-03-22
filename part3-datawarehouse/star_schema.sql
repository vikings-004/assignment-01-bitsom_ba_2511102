-- =========================
-- DIMENSION TABLES
-- =========================

CREATE TABLE dim_date (
    date_id DATE PRIMARY KEY,
    day INT,
    month INT,
    year INT,
    month_name VARCHAR(20)
);

CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    store_city VARCHAR(50)
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- =========================
-- FACT TABLE
-- =========================

CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    date_id DATE,
    store_id INT,
    product_id INT,
    units_sold INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(12,2),

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- =========================
-- DIM_DATE
-- =========================

INSERT INTO dim_date VALUES
('2023-01-15',15,1,2023,'January'),
('2023-01-18',18,1,2023,'January'),
('2023-02-05',5,2,2023,'February'),
('2023-02-08',8,2,2023,'February'),
('2023-02-20',20,2,2023,'February'),
('2023-03-31',31,3,2023,'March'),
('2023-04-28',28,4,2023,'April'),
('2023-05-21',21,5,2023,'May'),
('2023-06-04',4,6,2023,'June'),
('2023-07-22',22,7,2023,'July'),
('2023-08-01',1,8,2023,'August'),
('2023-08-09',9,8,2023,'August'),
('2023-08-15',15,8,2023,'August'),
('2023-08-29',29,8,2023,'August'),
('2023-10-20',20,10,2023,'October'),
('2023-10-26',26,10,2023,'October'),
('2023-11-18',18,11,2023,'November'),
('2023-12-05',5,12,2023,'December'),
('2023-12-08',8,12,2023,'December'),
('2023-12-12',12,12,2023,'December');

-- =========================
-- DIM_STORE
-- =========================

INSERT INTO dim_store VALUES
(1,'Chennai Anna','Chennai'),
(2,'Delhi South','Delhi'),
(3,'Bangalore MG','Bangalore'),
(4,'Pune FC Road','Pune'),
(5,'Mumbai Central','Mumbai');

-- =========================
-- DIM_PRODUCT (FULLY FIXED)
-- =========================

INSERT INTO dim_product VALUES
(101,'Speaker','Electronics'),
(102,'Tablet','Electronics'),
(103,'Phone','Electronics'),
(104,'Smartwatch','Electronics'),
(105,'Atta 10kg','Groceries'),
(106,'Jeans','Clothing'),
(107,'Biscuits','Groceries'),
(108,'Jacket','Clothing'),
(109,'Laptop','Electronics'),
(110,'Milk 1L','Groceries'),
(111,'Saree','Clothing'),
(112,'Headphones','Electronics'),
(113,'Pulses 1kg','Groceries'),
(114,'T-Shirt','Clothing'),
(115,'Oil 1L','Groceries'),
(116,'Rice 5kg','Groceries');

-- =========================
-- FACT_SALES (CONSISTENT)
-- =========================

INSERT INTO fact_sales VALUES
(1,'2023-08-29',1,101,3,49262.78,147788.34),
(2,'2023-12-12',1,102,11,23226.12,255487.32),
(3,'2023-02-05',1,103,20,48703.39,974067.80),
(4,'2023-02-20',2,102,14,23226.12,325165.68),
(5,'2023-01-15',1,104,10,58851.01,588510.10),
(6,'2023-08-09',3,105,12,52464.00,629568.00),
(7,'2023-03-31',4,104,6,58851.01,353106.06),
(8,'2023-10-26',4,106,16,2317.47,37079.52),
(9,'2023-12-08',3,107,9,27469.99,247229.91),
(10,'2023-08-15',3,104,3,58851.01,176553.03),
(11,'2023-06-04',1,108,15,30187.24,452808.60),
(12,'2023-10-20',5,106,13,2317.47,30127.11),
(13,'2023-05-21',3,109,13,42343.15,550460.95),
(14,'2023-04-28',5,110,10,43374.39,433743.90),
(15,'2023-11-18',2,108,5,30187.24,150936.20),
(16,'2023-01-18',5,111,15,35451.81,531777.15),
(17,'2023-08-01',5,111,11,35451.81,389969.91),
(18,'2023-12-05',3,108,6,30187.24,181123.44),
(19,'2023-02-08',3,112,15,39854.96,597824.40),
(20,'2023-07-22',1,105,3,52464.00,157392.00);