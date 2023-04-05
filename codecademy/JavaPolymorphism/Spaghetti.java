class Spaghetti extends Noodle{

    Spaghetti() {
        Super(3.0, 1.5, "irregular", "eggs, flour, salt");
        this.texture = "lumpy and liquid";
    }
    @Override
    public void cook() {
        System.out.println("Boiling.");
        System.out.println("Grinding or scraping dough.");
        this.texture = "cooked";
        
      }

}
