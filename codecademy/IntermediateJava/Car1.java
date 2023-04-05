import java.io.Serializable;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class Car1 implements Serializable {
  private String make;
  private int year;
  private static final long serialVersionUID = 1L;
  public Car1(String make, int year){
    this.make = make;
    this.year = year;
  }

  public static void main(String[] args) throws FileNotFoundException, IOException {
    Car1 toyota = new Car1("Toyota",2021);
    Car1 honda = new Car1("Honda",2020);

    FileOutputStream fileOutputStream = new FileOutputStream("cars.txt");
    ObjectOutputStream objectOutputStream = new ObjectOutputStream(fileOutputStream);
    objectOutputStream.writeObject(toyota);
    objectOutputStream.writeObject(honda);
    objectOutputStream.close();
  }
}