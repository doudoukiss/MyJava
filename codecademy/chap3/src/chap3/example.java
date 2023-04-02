package chap3;

import java.util.HashMap;

public class example {
  public static void main(String[] args) {

    HashMap<String,String> flowerNames = new HashMap<>();

    flowerNames.put("Lily", "Lilium");
    flowerNames.put("Sunflower","Helianthus");
    flowerNames.put("Daffodil", "Narcissus");
    flowerNames.put("Orchid", "TBD");
    System.out.println(flowerNames);

    flowerNames.remove("Daffodil");

    flowerNames.replace("Orchid","Orchidaceae");

    for (String key: flowerNames.keySet()) {
      System.out.println("The scientific name for " + key + " is " + flowerNames.get(key));
    }
  }
}