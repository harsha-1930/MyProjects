**Core Java Project: FinSafe Transaction Validator**



**Overview**

FinSafe is a simplified digital wallet application built with Core Java.

It automates transaction validation to prevent overdraft errors, ensuring that users cannot spend more than their available balance.

The project demonstrates encapsulation, custom exception handling, transaction history tracking, and robust error management in a console-based environment.



**Project Files**

Account.java: Encapsulated account class with balance, account holder, and transaction history.



InSufficientFundsException.java: Custom user-defined exception for overdraft scenarios.



Main.java: Console-based application with menu-driven options for deposit, withdrawal, and viewing history.



README.md: Documentation and instructions (this file).



**Setup Instructions**

1\. Create Project Folder

mkdir FinSafe

cd FinSafe

2\. Verify Java Installation

java -version

javac -version

Ensure Java 17+ is installed.

3\. Project Structure

Code

FinSafe/

&#x20;├── src/

&#x20;│    └── finsafe/

&#x20;│          ├── Account.java

&#x20;│          ├── InSufficientFundsException.java

&#x20;│          └── Main.java

&#x20;├── bin/

&#x20;└── README.md

4\. Compile

javac -d bin src/finsafe/\*.java

5\. Run Application

java -cp bin finsafe.Main



**Queries / Logic Included**

**Validation Logic**

Encapsulation: Private variables for balance and account holder.



Custom Exception: Throws InSufficientFundsException when withdrawal exceeds balance.



Validation:



Negative amounts → IllegalArgumentException.



Withdrawals greater than balance → InSufficientFundsException.



Transaction History: Stores last 5 successful transactions in an ArrayList.



**Business Case Logic**



Prevent overdraft errors by validating every spend request.



Maintain audit logs of deposits and withdrawals.



Provide a mini statement for quick reporting.



Ensure robust error handling for invalid inputs.



**Notes**



Initial balance is set to 0 by default.



Mini statement shows the last 5 transactions and current balance.



Errors are handled gracefully with clear messages.



To reset, simply delete compiled files in bin/ and recompile.



**Deliverables**



Account.java: Encapsulation and transaction logic.



InSufficientFundsException.java: Custom exception class.



Main.java: Console application with menu-driven interface.



README.md: Documentation and instructions.

