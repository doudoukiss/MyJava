package chap13;
import java.math.BigInteger;

public class BigInteger_ {
    public static void main(String[] args) {
        BigInteger bigInteger = new BigInteger("123456789012345678901234567890");
        BigInteger bigInteger2 = new BigInteger("123456789012345678901234567890");
        System.out.println(bigInteger);
        //1. �ڶ� BigInteger ���мӼ��˳���ʱ����Ҫʹ�ö�Ӧ�ķ���������ֱ�ӽ��� + - * /
        //2. ���Դ���һ�� Ҫ������ BigInteger Ȼ�������Ӧ����
        BigInteger add = bigInteger.add(bigInteger2);
        System.out.println(add);//
        BigInteger subtract = bigInteger.subtract(bigInteger2);
        System.out.println(subtract);//��
        BigInteger multiply = bigInteger.multiply(bigInteger2);
        System.out.println(multiply);//��
        BigInteger divide = bigInteger.divide(bigInteger2);
        System.out.println(divide);//��
    }
}
