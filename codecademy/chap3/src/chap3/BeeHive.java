package chap3;

import java.util.ArrayList;

public class BeeHive {
  private ArrayList<Bee> beeList;
 
  public BeeHive(int numBees) {
    this.beeList = new ArrayList<Bee>();
    for (int i = 0; i < numBees; i++) {
      this.beeList.add(new Bee("bee" + i));
    }
  }
  
  public int getBeeNum() {
	  return this.beeList.size();
  }
  
  public void printBees() {
	  for (Bee b:this.beeList) {
		  System.out.println(b.getName());
	  }
  }
  
  public void leaveHome(String beeName) {
	  for (Bee b:this.beeList) {
		  if(b.getName().equals(beeName)) {
			  b.leaveHome();
		  }
	  }
  }
  
  public void addBees(ArrayList<String> beeNames) {
	  for (String name : beeNames) {
		  this.beeList.add(new Bee(name));
	  }
  }
  
  public void moveOutBees() {
	  for (int i = 0; i < this.beeList.size(); i++) {
		  this.beeList.remove(i);
	  }
  }
  
  public void renameBees(ArrayList<String> newNames) {
	    int numNamesToAssign = this.beeList.size();
	    if (newNames.size() < this.beeList.size()) {
	      numNamesToAssign = newNames.size();
	    }
	 
	    for (int i = 0; i < numNamesToAssign; i++) {
	      this.beeList.get(i).setName(newNames.get(i));
	    }
  }
 
  public static void main(String[] args) {
    BeeHive myHive = new BeeHive(365);
  }
}
