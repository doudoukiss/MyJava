package chap3;

public class Bee {
	  private String name;
	  private boolean isHome;
	 
	  public Bee(String name) {
	    this.name = name;
	    this.isHome = true;
	  }
	 
	  public String getName() {
	    return this.name;
	  }
	 
	  public void setName(String newName) {
	    this.name = newName;
	  }
	 
	  public boolean isHome() {
	    return this.isHome;
	  }
	 
	  public void leaveHome() {
	    this.isHome = false;
	  }
	 
	  public void returnHome() {
	    this.isHome = true;
	  }
	} 
