## ETL Decisions

### Decision 1 — Date Format Standardization
Problem: The raw dataset contained multiple inconsistent date formats such as '29/08/2023', '12/12/23', '20-02-2023', and '2/5/23'. This inconsistency would cause issues in grouping, sorting, and joining with the date dimension.

Resolution: All dates were converted into ISO format (YYYY-MM-DD) before loading into the dim_date table. This ensured consistency and enabled accurate time-based aggregation such as monthly and yearly analysis.


### Decision 2 — Category Normalization
Problem: The category field had inconsistent casing such as 'electronics', 'Electronics', and 'Grocery' vs 'Groceries'. This would result in incorrect aggregations where the same category is treated as multiple distinct values.

Resolution: All category values were standardized into three consistent groups: 'Electronics', 'Clothing', and 'Groceries'. This ensured correct grouping and accurate reporting in analytical queries.


### Decision 3 — Handling Missing and Incomplete Data
Problem: Some records had missing values in critical fields such as store_city. Including these records would break joins with dimension tables and lead to NULL foreign keys in the fact table.

Resolution: Records with missing essential fields (such as store_city) were excluded during the transformation process. This ensured referential integrity between fact and dimension tables and improved overall data quality.