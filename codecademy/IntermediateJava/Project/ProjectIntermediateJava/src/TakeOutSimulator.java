import java.util.Scanner;

public class TakeOutSimulator{
	private Customer customer;
	private FoodMenu menu;
	private Scanner input;
	
	public TakeOutSimulator(Customer customer, FoodMenu menu, Scanner input) {
		this.customer =customer;
		this.menu = menu;
		this.input = input;
	}
	
	private<T> T getOutputOnIntInput(String userInputPrompt, MyInputRetriever<T> myInputRetriever) {
		while(true) {
			System.out.println(userInputPrompt);
			//int temp = Integer.parseInt(userInputPrompt);
			//boolean flag = temp instanceof (int);
			if(input.hasNextInt()) {
			int command = input.nextInt();
			T result = myInputRetriever.produceOutputOnIntUserInput(command);
			return result;
			} else {
			System.out.println("Please input an Integer, Thanks!");
			}
		}
	}
	
	IntUserInputRetriever intUserInputRetreiver = (selection) -> {
	      if (selection == 1 && customer.getMoney() >= menu.getLowestCostFood().getPrice()) {
	        return true;
	      } else if (selection == 0) {
	        return false;
	      } else {
	        throw new IllegalArgumentException();
	      }
	};
	  
	
	 public boolean shouldSimulate() {
		    String userPrompt = new String("Please, type 1 to proceed or 0 to stop the simulation.\n Your choice: ");

		    @ Override
		    public boolean produceOutputOnUserInput(int selection) {
		       if (selection == 1 && customer.money >= menu.getLowestCostFood()) {
		         System.out.println("Your choice was 1 and you've got some cash, nice, let us continue...");
		         return true;
		       }
		       else if (customer.getMoney() < menu.getLowestCostFood()) {
		         System.out.println(selection);
		         System.out.println("Sorry, you do not have enough money to continue shopping (only $" + customer.getMoney() + "), so go and find a better job. End of simulation..." );
		         return false;
		       }
		       else if (selection == 0 ) {
		         System.out.println(selection);
		         System.out.println("As you wish, simulation ending...");
		         return false; 
		       }
		       else {
		         throw IllegalArgumentException; 
		       }
		    }
		    getOutputOnIntUserInput(userPrompt, produceOutputOnUserInput(input));    //  ?????
	 }
	    
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public FoodMenu getMenu() {
		return menu;
	}
	public void setMenu(FoodMenu menu) {
		this.menu = menu;
	}
	public Scanner getInput() {
		return input;
	}
	public void setInput(Scanner input) {
		this.input = input;
	}


}
