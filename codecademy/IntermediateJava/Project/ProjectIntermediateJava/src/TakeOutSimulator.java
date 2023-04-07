import java.util.Scanner;

public class TakeOutSimulator {
	private Customer customer;
	private FoodMenu menu;
	private Scanner input;
	
	public TakeOutSimulator(Customer customer, FoodMenu menu, Scanner input) {
		this.customer =customer;
		this.menu = menu;
		this.input = input;
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
