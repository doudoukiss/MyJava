class Dinner {
  
    private void makeNoodles(Noodle noodle, String sauce) {
      
      noodle.cook();
      
      System.out.println("Mixing " + noodle.texture + " noodles made from " + noodle.ingredients + " with " + sauce + ".");
      System.out.println("Dinner is served!");
      
    }
    
    public static void main(String[] args) {
      
      Dinner noodlesDinner = new Dinner();
      // Add your code here:
      Noodle biangBiang = new BiangBiang();
      noodelsDinner.makeNoodles(biangBiang, "soy sauce and chili oil");

      Noodle spaghetti, ramen, pho;
    
      spaghetti = new Spaghetti();
      ramen = new Ramen();
      pho = new Pho();
      
      // Add your code below:
      Noodle[] allTheNoodles = {spaghetti, ramen, pho};
      
      for (Noodle noodle : allTheNoodles) {
        
        System.out.println(noodle.getCookPrep());
        
      }
      
    }
    
  }