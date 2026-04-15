package finsafe;

import java.util.ArrayList;

public class Account {
    private double balance;
    private String accountHolder;
    private ArrayList<Double> transactions = new ArrayList<>();

    public Account(String accountHolder, double initialBalance) {
        this.accountHolder = accountHolder;
        this.balance = initialBalance;
    }

    public double getBalance() {
        return balance;
    }

    public String getAccountHolder() {
        return accountHolder;
    }

    public void deposit(double amount) {
        if (amount <= 0) throw new IllegalArgumentException("Deposit must be positive");
        balance += amount;
        addTransaction(amount);
        System.out.println("Deposited: " + amount);
        System.out.println("Current Balance: " + balance);   
    }

    public void processTransaction(double amount) throws InSufficientFundsException {
        if (amount < 0) throw new IllegalArgumentException("Amount cannot be negative");
        if (amount > balance) throw new InSufficientFundsException("Insufficient funds!");
        balance -= amount;
        addTransaction(-amount);
        System.out.println("Withdrawn: " + amount);
        System.out.println("Current Balance: " + balance);   
    }

    private void addTransaction(double amount) {
        transactions.add(amount);
        if (transactions.size() > 5) {
            transactions.remove(0); 
        }
    }

    public void printMiniStatement() {
        System.out.println("Mini Statement (last 5 transactions):");
        for (double t : transactions) {
            System.out.println(t);
        }
        System.out.println("Available Balance: " + balance); 
    }
}
