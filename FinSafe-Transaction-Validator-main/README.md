# FinSafe Transaction Validator

A console-based digital wallet application built using Core Java.

## Features

* Deposit and withdraw money
* Prevent overdraft using custom exception handling
* Validate invalid transaction amounts
* Store and display the last 5 successful transactions
* Menu-driven user interface

## Concepts Used

* OOPs
* Encapsulation
* Custom Exceptions
* Exception Handling
* ArrayList Collections
* Constructors

## Project Structure

```text
src/
└── finsafe/
    ├── Account.java
    ├── InSufficientFundsException.java
    └── Main.java
```


## Business Use Case

FinSafe validates every withdrawal request against the available balance to prevent overdraft errors and maintains a mini statement of the last 5 transactions for auditing purposes.


