package oop;

public class Store {
	  // instance fields
	  String productType;
	  
	  // constructor method
	  public Store(String product) {
	    productType = product;
	  }
	  
	  // advertise method
	  public  void advertise(){
	    System.out.println("Come spend some money!");
	    System.out.println("Selling "+ this.productType);
	  }
	  // main method
	  public static void main(String[] args) {
	    Store myStore = new Store("Seattle Supersonics!");
	    System.out.println("The name of the product is " + myStore.productType + "!");
	    
	  }
	}

public class Store {
	  // instance fields
	  String productType;
	  
	  // constructor method
	  public Store(String product) {
	    productType = product;
	  }
	  
	  // advertise method
	  public void advertise() {
			System.out.println("Selling " + productType + "!");
	    System.out.println("Come spend some money!");
	  }
	  
	  // main method
	  public static void main(String[] args) {
	    Store lemonadeStand = new Store("Lemonade");
	    lemonadeStand.advertise();
	    lemonadeStand.advertise();
	    lemonadeStand.advertise();
	  }
	}

public class Store {
	  // instance fields
	  String productType;
	  
	  // constructor method
	  public Store(String product) {
	    productType = product;
	  }
	  
	  // advertise method
	  public void advertise() {
	    String message = "Selling " + productType + "!";
			System.out.println(message);
	  }

	  public void greetCustomer(String customer) {
	    System.out.print("Welcome to the store, " + customer + "!");
	  }
	  
	  // main method
	  public static void main(String[] args) {
	    Store lemonadeStand = new Store("Lemonade");
	    lemonadeStand.greetCustomer("Seattle");
	    
	  }
	}

public class Store {
	  // instance fields
	  String productType;
	  double price;
	  
	  // constructor method
	  public Store(String product, double initialPrice) {
	    productType = product;
	    price = initialPrice;
	  }
	  
	  // increase price method
	  public void increasePrice(double priceToAdd){
	    double newPrice = price + priceToAdd;
	    this.price = newPrice;
	  }
	  
	  // main method
	  public static void main(String[] args) {
	    Store lemonadeStand = new Store("Lemonade", 3.75);
	    lemonadeStand.increasePrice(1.5);
	    System.out.println(lemonadeStand.price);
	  }
	}
