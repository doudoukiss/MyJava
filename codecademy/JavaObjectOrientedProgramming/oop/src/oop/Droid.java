package oop;

public class Droid {
	   String name;
	   int batteryLevel;

	   public Droid(String droidName) {
	      name = droidName;
	      batteryLevel = 100;
	   }

	   public String toString() {
	      return "Hello, I’m the droid: " + name;
	   }

	   public void performTask(String task) {
	     System.out.println(name + "is performing " + task + "！");
	     batteryLevel -= 10;
	   }

	   public void energyReport() {
	     System.out.println("Power is now " + batteryLevel + "%");
	   }

	   public void energyTransfer() {
	     batteryLevel = 100;
	     System.out.println("Charging Complete！");
	   }

	   public static void main(String[] args) {
	     Droid myDroid = new Droid("Codey");
	     System.out.println(myDroid);
	     myDroid.performTask("Cleaning");
	     myDroid.energyReport();
	     myDroid.energyTransfer();
	     myDroid.energyReport();
	   } 
	}
