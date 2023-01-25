package homework;
import org.junit.jupiter.api.Test;
import java.io.*;
import java.util.Properties;

public class hw2 {
    public static void main(String[] args) throws IOException {
        String filePath = "src\\dog.properties";
        Properties properties = new Properties();
        properties.load(new FileReader(filePath));
        String name = properties.get("name") + "";
        int age = Integer.parseInt(properties.get("age") + "");
        String color = properties.get("color") + "";
        Dog dog = new Dog(name, age, color);
        System.out.println("===dog对象信息====");
        System.out.println(dog);
        String serFilePath = "d:\\dog.dat";
        ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(serFilePath));
        oos.writeObject(dog);
        oos.close();
        System.out.println("dog对象，serialized...");
    }

    @Test
    public void m1() throws IOException, ClassNotFoundException {
        String serFilePath = "e:\\dog.dat";
        ObjectInputStream ois = new ObjectInputStream(new FileInputStream(serFilePath));
        Dog dog = (Dog)ois.readObject();
        System.out.println("===deserialized dog====");
        System.out.println(dog);
        ois.close();
    }
}

class Dog implements  Serializable{
    private String name;
    private int age;
    private String color;
    public Dog(String name, int age, String color) {
        this.name = name;
        this.age = age;
        this.color = color;
    }

    @Override
    public String toString() {
        return "Dog{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", color='" + color + '\'' +
                '}';
    }
}
