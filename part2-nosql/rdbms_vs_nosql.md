## Database Recommendation

For a healthcare patient management system, MySQL would be the better choice as the primary database. Healthcare data is highly sensitive and structured, covering things like patient records, diagnoses, prescriptions and billing. In this context, accuracy is non negotiable. MySQL follows ACID properties, which ensure that transactions are handled reliably. For example, when a patient’s treatment or billing details are updated, the system must not allow partial updates or inconsistencies. Even a small error can have serious consequences.

There is also the issue of compliance and audit trails. Healthcare systems are expected to maintain clear records of changes and ensure data integrity over time. Relational databases like MySQL are well suited for this because of their strict schema and transactional guarantees.

MongoDB, on the other hand, follows a BASE model and allows more flexibility in handling data. While this is useful in many applications, it can introduce temporary inconsistencies. That trade off is usually not acceptable in healthcare, where decisions depend on accurate and up to date information.

From a system design point of view, consistency and reliability matter more than flexibility here. MySQL fits that requirement well in a controlled environment.

That said, if a fraud detection module is added, the setup can change. Fraud detection often deals with large volumes of logs and behavioral data, which may not fit neatly into structured tables. In that case, using MongoDB or another NoSQL database alongside MySQL makes sense.

A hybrid approach works best. MySQL can handle core patient data, while MongoDB can support analytics and fraud detection. This keeps the system reliable while still allowing flexibility where needed.
