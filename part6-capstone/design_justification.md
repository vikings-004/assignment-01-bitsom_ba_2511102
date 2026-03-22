## Storage Systems

The system uses different storage components based on the type of data and purpose. For real-time ICU monitoring, ICU devices send continuous patient vitals through a streaming layer like Kafka. This layer handles high-speed incoming data and ensures it is processed without delay. The data is then stored in a data lake, which is designed to handle large volumes of raw and unstructured data such as sensor readings and logs.

For analytics and reporting, data is moved from the data lake to the data warehouse using batch processing. The data warehouse stores cleaned and structured data, making it easier to run queries and generate reports. It is also used to train the machine learning model. The ML model uses this data as training data to predict patient readmission risk. The predictions generated are stored and can be used for future analysis or decision making.

For daily hospital operations, an OLTP database is used to store patient records. This system supports real-time updates such as treatments and doctor inputs, and ensures that data remains consistent and accurate.

To support natural language queries, patient data from the OLTP system is converted into embeddings and stored in a vector database. This allows doctors to interact with the system using plain English through an LLM interface.

## OLTP vs OLAP Boundary

The OLTP system is responsible for handling real-time transactional data such as patient records, treatments and updates made by doctors. It is optimized for fast reads and writes with high consistency.

The OLAP system begins at the data lake and continues into the data warehouse. The data lake stores raw data collected from ICU devices, while the data warehouse processes and structures this data for analysis. The warehouse is used for reporting, dashboards and machine learning. This separation ensures that heavy analytical queries do not affect the performance of the transactional system.

## Trade-offs

One major trade-off in this design is increased system complexity. The architecture includes multiple components such as a streaming layer, data lake, data warehouse, ML model, vector database and OLTP system. Managing data flow across these systems can be challenging.

This can be mitigated by using proper data pipelines and orchestration tools to manage how data moves between different layers. Clear separation of responsibilities helps reduce confusion, and using managed services can simplify maintenance. Although the system is more complex, it provides better scalability and flexibility, allowing it to handle different types of workloads efficiently.