**SQL Project E-commerce Logistics.**



**Overview**



It is a simplified e-commerce logistics system based on the PostgreSQL and modeled as a project. It also has schema definitions, sample data and queries to give answers to the business case questions such as delayed shipments, partner performance, zone analysis and partner score-cards.



**Project Files**



schema.sql: The database structure (table: customers, orders, partners, shipments, deliverylogs).



sample\_data.sql: Inserts sample data in the database.



queries.SQL: SQL queries, which are applied in validation and business case analysis.



**Setup Instructions**



**Create the database**



createdb swiftshipdb



**Linkage to a database.**



psql swiftshipdb user swiftshipdb



**Run the schema file**



\\i 'C:/Users/E-commerce logistics/schema.sql'



**Insert sample data**



\\i 'C:/Users/E-commerce logistics/sample\_data.sql'



**Execute queries**



\\i 'C:/Users/E-commerce logistics/queries.sql'



**Queries Included**



Validation Queries



List all customers



Shows all the pending orders.



Find delivered shipments



Number of total orders per customer.



Place orders jointly with the customers.



Business Case Queries



Late Shipments: Identify those shipments that were late in comparison to the scheduled shipments.



Performance of partners: Successful and returned deliveries by partner.



Zone Filter: What is the most popular destination city in the last 30 days.



Partner Scorecard: Rank the partners basing on the timeliness of the shipments and success rate.



**Notes**



Identify outputs with the help of use echo labels in queries.sql.



Ensure that the orders should be entered before the shipments to prevent the errors of foreign key.



TRUNCATE customers, orders, partners, shipments, deliverylogs RESTART IDENTITY CASCADE; in case you want to empty the database with prior restarting sample data.



**Deliverables**



schema.sql: Database structure.



sample\_data.sql: Test dataset.



queries.SQL: Query-based analytics with labelled results.



README.md: Documentation and instructions (the file).





