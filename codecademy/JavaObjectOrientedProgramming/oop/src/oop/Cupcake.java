package oop;

class Cupcake {
	  String flavor;
	  boolean sprinkles;
	 
	  public Cupcake(String type, boolean hasSprinkles) {
	    flavor = type;
	    sprinkles = hasSprinkles;
	  }
	  
	  public Cupcake(Cupcake copy) {
		    flavor = copy.flavor;
		    sprinkles = copy.sprinkles;
	  }
}