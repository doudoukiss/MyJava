public class Noodle {
  
    protected double lengthInCentimeters;
    protected double widthInCentimeters;
    protected String shape;
    protected String ingredients;
    protected String texture = "brittle";
  
  Noodle(double lenInCent, double wthInCent, String shp, String ingr) {
    
    this.lengthInCentimeters = lenInCent;
    this.widthInCentimeters = wthInCent;
    this.shape = shp;
    this.ingredients = ingr;
    
  }

  public String getCookPrep() {
    
    return "Boil noodle for 7 minutes and add sauce.";
    
  }
  
  public void cook() {
    System.out.println("Boiling.");
    this.texture = "cooked";
    
  }

  final public boolean isTasty() {
    
    return true;
    
  }
    
    public static void main(String[] args) {
      Spaghetti spaghettiPomodoro = new Spaghetti();
      Pho phoChay = new Pho();

      Ramen yasaiRamen = new Ramen();
      System.out.println(yasaiRamen.isTasty());
    }
    
  }