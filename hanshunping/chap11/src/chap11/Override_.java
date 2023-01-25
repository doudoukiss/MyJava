package chap11;

public class Override_ {
    public static void main(String[] args) {

    }
}
class Father{

    public void fly(){
        int i = 0;
        System.out.println("Father fly...");
    }
    public void say(){}

}

class Son extends Father {
    @Override   
    public void fly() {
        System.out.println("Son fly....");
    }
    @Override
    public void say() {}
}
