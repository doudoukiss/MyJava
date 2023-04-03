package oop;

public class SavingsAccount {
	  
	  int balance;
	  
	  public SavingsAccount(int initialBalance){
	    balance = initialBalance;
	  }

	  public void checkBalance(){
	    System.out.println("Hello!");
	    System.out.println("Your balance is " + balance);
	  }

	  public void deposit(int amountToDeposit) {
	    int newBalance = balance + amountToDeposit;
	    balance = newBalance;
	  }
	  
	  public int withdraw(int amountToWithdraw){
	    int newBalance = balance - amountToWithdraw;
	    balance = newBalance;
	    return amountToWithdraw;
	  }
	  public static void main(String[] args){
	    SavingsAccount savings = new SavingsAccount(2000);
	    
	    //Check balance:
	    savings.checkBalance();
	    
	    //Withdrawing:
	    int temp = savings.withdraw(1000);
	    
	    savings.checkBalance();
	    
	    //Deposit:
	    savings.deposit(10000);
	    
	    savings.checkBalance();
	    //Check balance:
	   
	  }       
	}
