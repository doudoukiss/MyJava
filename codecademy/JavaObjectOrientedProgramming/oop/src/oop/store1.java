package oop;

public class Store1 {
	  // instance fields
	  String productType;
	  double price;
	  
	  // constructor method
	  public Store1(String product, double initialPrice) {
	    productType = product;
	    price = initialPrice;
	  }
	  
	  // increase price method
	  public void increasePrice(double priceToAdd){
	    double newPrice = price + priceToAdd;
	    price = newPrice;
	  }
	  
	  // get price with tax method
	  public double getPriceWithTax(){
	    double totalPrice = price + price*0.08;
	    return totalPrice;
	  }
	  // main method
	  public static void main(String[] args) {
	    Store1 lemonadeStand = new Store1("Lemonade", 3.75);
	    double lemonadePrice = lemonadeStand.getPriceWithTax();
	    System.out.println(lemonadePrice);
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
	    price = newPrice;
	  }
	  
	  // get price with tax method
	  public double getPriceWithTax(){
	    double tax = 0.08;
	    double totalPrice = price + price*tax;
	    return totalPrice;
	  }

	  public String toString(){
	    return "This store sells "+ productType + " at a price of " + price+".";
	  }

	  // main method
	  public static void main(String[] args) {
	    Store lemonadeStand = new Store("Lemonade", 3.75);
	    Store cookieShop = new Store("Cookies", 5);
	    System.out.println(lemonadeStand);
	    System.out.println(cookieShop);
	  }
	}