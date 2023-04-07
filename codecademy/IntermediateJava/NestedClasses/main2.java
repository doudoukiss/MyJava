class VendingMachine{
    public static String name = "#1 Vending Machine!";
  
    public static class ChocolateBar{
  
      public String getName(){
        return "Cadbury";
      }
  
      public double getPrice(){
        return 3.95;
      }
  
    }
  
    public static class BagOfChips{
      public String getName(){
        return "Doritos";
      }
  
      public double getPrice(){
        return 5.99;
      }
    }
    
  }
  
  public class Main2{
  
    public static void main(String[] args){
  
      VendingMachine.ChocolateBar mikesChocolateBar = new VendingMachine.ChocolateBar();
      VendingMachine.BagOfChips gabbysBagOfChips = new VendingMachine.BagOfChips();
  
      String mike = "Mike's " + mikesChocolateBar.getName() + " chocolate bar costs " + mikesChocolateBar.getPrice();
      String gabby =  "Gabby's " + gabbysBagOfChips.getName() + " bag of chips costs " + gabbysBagOfChips.getPrice();
  
      System.out.println(mike);
      System.out.println(gabby);
    }
  }