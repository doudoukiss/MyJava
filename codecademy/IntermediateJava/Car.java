import java.io.Serializable;
public class Car implements Serializable{
  private String make;
  private int year;
  private static final long serialVersionUID = 1L; 
  public Car(String make, int year){
    this.make = make;
    this.year = year;
  }
}