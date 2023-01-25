package chap12;

public class TryCatch {
}

class ExceptionExe01 {
    public static int method() {
        int i = 1;//i = 1
        try {
            i++;// i=2
            String[] names = new String[3];
            if (names[1].equals("tom")) { 
                System.out.println(names[1]);
            } else {
                names[3] = "liurushi";
            }
            return 1;
        } catch (ArrayIndexOutOfBoundsException e) {
            return 2;
        } catch (NullPointerException e) {
            return ++i;  
        } finally {
            ++i; 
            System.out.println("i=" + i);
        }
    }

    public static void main(String[] args) {
        System.out.println(method());// 3
    }
}