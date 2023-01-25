package chap12;

public class CustomException {
    public static void main(String[] args) {
        int age = 180;
        if(!(age >= 18 && age <= 120)) {
            throw new AgeException("������Ҫ�� 18~120֮��");
        }
        System.out.println("������䷶Χ��ȷ.");
    }
}

@SuppressWarnings("serial")
class AgeException extends RuntimeException {
    public AgeException(String message) {
        super(message);
    }
}
