**Portfolio Projects: Java, Python, SQL**



This repository showcases three independent projects built to solve real-world business problems.  

Each project demonstrates core programming concepts, error handling, and professional packaging.





**1. Core Java: FinSafe Transaction Validator**



**Business Case:**

Digital wallet app "FinSafe" faces overdraft errors due to slow transaction processing.  

The solution validates every spend request against the user’s balance and logs actions for auditing.



**Features:**

\- Encapsulation with `Account` class (private balance, accountHolder).

\- Custom exception: `InSufficientFundsException`.

\- Validation logic in `processTransaction(double amount)`:

&#x20; - Negative amounts → `IllegalArgumentException`.

&#x20; - Amount > balance → `InSufficientFundsException`.

\- Transaction history: Stores last 5 successful transactions in an `ArrayList`.

\- Mini statement printing via `printMiniStatement()`.



**Deliverable:** 

A console-based Java application supporting Deposit, Withdraw, and View History with full error handling.



**2. Core Python: OpsBot Log Automator**



**Business Case:**

IT Operations team spends 2 hours daily scanning 5,000 log lines for failed logins.  

OpsBot automates log parsing and generates security alerts.



**Features:**

\- File parsing: Reads `server.log` line by line.

\- Pattern matching: Detects `CRITICAL`, `ERROR`, and `FAILED LOGIN`.

\- Data structuring: Counts frequency of each error type using a dictionary.

\- Report generation: Writes filtered critical lines into `security\_alert\_\[date].txt`.

\- Automation: Uses `os` module to print size of alert file for confirmation.



**Deliverable:**  

A Python script (`opsbot.py`) plus sample "Before" and "After" log files demonstrating filtering.





**3. SQL: SwiftShip Logistics Tracker**



**Business Case:**  

Logistics provider "SwiftShip" struggles with lost items and underperforming delivery partners.  

The solution tracks shipments, delays, and partner performance.



**Features:**

\- Schema design: `Partners`, `Shipments`, `DeliveryLogs`.

\- Delayed shipment query: Finds shipments where `ActualDeliveryDate > PromisedDate`.

\- Performance ranking: Uses `COUNT` + `GROUP BY` to show successful vs. returned deliveries per partner.

\- Zone filter: Identifies most popular destination city in last 30 days.



**Deliverable:**  

SQL scripts that output a "Partner Scorecard" highlighting delays and ranking partners by success rate.





🚀 **How to Run**

\- **Java:** Compile and run `FinSafe.java` in console (`javac FinSafe.java \&\& java FinSafe`).

\- **Python:** Run `python opsbot.py` with a sample `server.log` file.

\- **SQL**: Execute `schema.sql` and queries in PostgreSQL/MySQL.



&#x20;**👤 Author**

All projects developed and packaged by **harsha-1930**.  

Each project demonstrates original work, professional documentation, and portfolio-ready structure.



