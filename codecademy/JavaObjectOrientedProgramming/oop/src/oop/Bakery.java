package oop;

class Bakery {
	  Cupcake bakeryCupcake;
	  double price;
	  String giveTotal;
	 
	  public Bakery(Cupcake cupcakeType, double priceOf) {
	    bakeryCupcake = cupcakeType;
	    // Cupcake copy = new Cupcake(cupcakeType);
	 // change cupcake object flavor to vanilla
	    bakeryCupcake.flavor = "vanilla";
	    //bakeryCupcake = copy;
	    price = priceOf;
	    giveTotal = "The " + bakeryCupcake.flavor + " cupcake is €" + price;
	  }
	  
	  public static void main(String[] args) {
		  Cupcake chocolateSprinkle = new Cupcake("chocolate", true);
		  // Add your code below
		  Bakery myBakery = new Bakery(chocolateSprinkle, 3.25);
		  System.out.println(myBakery.giveTotal); 
		}
	}