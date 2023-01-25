package abstract_;

public class Singleton1 {

    public static void main(String[] args) {

        GirlFriend instance = GirlFriend.getInstance();
        System.out.println(instance);

        GirlFriend instance2 = GirlFriend.getInstance();
        System.out.println(instance2);

        System.out.println(instance == instance2);
    }
}

class GirlFriend {

    private String name;
    private static GirlFriend gf = new GirlFriend("liu ru shi");

    private GirlFriend(String name) {
        System.out.println("Constructor called");
        this.name = name;
    }

    public static GirlFriend getInstance() {
        return gf;
    }

    @Override
    public String toString() {
        return "GirlFriend{" +
                "name='" + name + '\'' +
                '}';
    }
}
