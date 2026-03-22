## Architecture Recommendation

I would recommend a Data Lakehouse for this use case. The startup is dealing with different kinds of data like GPS logs, customer reviews, payments and images. A normal data warehouse works well for structured data but cannot handle images or raw logs properly. On the other hand, a data lake can store everything but makes analysis harder because the data is not well organized.

A lakehouse solves this by combining both approaches. It allows the company to store all raw data in one place while also making it easy to run queries on cleaned and structured data. For example, GPS logs can be stored as they are, while payment data can be used for reports and dashboards.

Another reason is scale. As the business grows, the amount of data will increase quickly, especially location data and user activity. A lakehouse can handle this growth without needing major changes in the system.

It also supports both real time and batch use cases. GPS data can be collected continuously, while reviews and transactions can be processed later for insights.

Overall, a data lakehouse is a practical choice because it is flexible, scalable and supports both storage and analysis in one system.
