package abstract_;

public class Singleton2 {
    public static void main(String[] args) {
        Cat instance = Cat.getInstance();
        System.out.println(instance);

        Cat instance2 = Cat.getInstance();
        System.out.println(instance2);

        System.out.println(instance == instance2);//T

    }
}


class Cat {
    private String name;
    public static  int n1 = 999;
    private static Cat cat ; 

    private Cat(String name) {
        System.out.println("Constructor Called");
        this.name = name;
    }
    public static Cat getInstance() {

        if(cat == null) {
            cat = new Cat("lanlan");
        }
        return cat;
    }

    @Override
    public String toString() {
        return "Cat{" +
                "name='" + name + '\'' +
                '}';
    }
}