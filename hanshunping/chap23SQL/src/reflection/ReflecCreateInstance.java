package reflection;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;

public class ReflecCreateInstance {
    public static void main(String[] args) throws ClassNotFoundException, IllegalAccessException, InstantiationException, NoSuchMethodException, InvocationTargetException {

        Class<?> userClass = Class.forName("reflection.User");

        Object o = userClass.newInstance();
        System.out.println(o);

        Constructor<?> constructor = userClass.getConstructor(String.class);

        Object hsp = constructor.newInstance("hsp");
        System.out.println("hsp=" + hsp);

        Constructor<?> constructor1 = userClass.getDeclaredConstructor(int.class, String.class);

        constructor1.setAccessible(true);
        Object user2 = constructor1.newInstance(100, "张三丰");
        System.out.println("user2=" + user2);
    }
}

class User {
    private int age = 10;
    private String name = "doudou教育";

    public User() {
    }

    public User(String name) {
        this.name = name;
    }

    private User(int age, String name) {
        this.age = age;
        this.name = name;
    }

    public String toString() {
        return "User [age=" + age + ", name=" + name + "]";
    }
}

