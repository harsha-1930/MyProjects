package finsafe;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Account account = new Account("Deepthika", 0.0);

        while (true) {
            System.out.println("\n--- FinSafe Menu ---");
            System.out.println("1. Deposit");
            System.out.println("2. Withdraw");
            System.out.println("3. View Mini Statement");
            System.out.println("4. Exit");
            System.out.print("Choose option: ");

            int choice = sc.nextInt();
            try {
                switch (choice) {
                    case 1:
                        System.out.print("Enter deposit amount: ");
                        account.deposit(sc.nextDouble());
                        break;
                    case 2:
                        System.out.print("Enter withdrawal amount: ");
                        account.processTransaction(sc.nextDouble());
                        break;
                    case 3:
                        account.printMiniStatement();
                        break;
                    case 4:
                        System.out.println("Exiting...");
                        sc.close();
                        return;
                    default:
                        System.out.println("Invalid choice!");
                }
            } catch (IllegalArgumentException | InSufficientFundsException e) {
                System.out.println("Error: " + e.getMessage());
            }
        }
    }
}

