package chap13;

import java.math.BigDecimal;

public class BigDecimal_ {
    @SuppressWarnings("deprecation")
	public static void main(String[] args) {

        BigDecimal bigDecimal = new BigDecimal("1234.123456789012345678901234567890");
        BigDecimal bigDecimal2 = new BigDecimal("1234.123456789012345678901234567890123456789012345678901234567890");
        System.out.println(bigDecimal);

        //1. ����� BigDecimal�������㣬����Ӽ��˳�����Ҫʹ�ö�Ӧ�ķ���
        //2. ����һ����Ҫ������ BigDecimal Ȼ�������Ӧ�ķ�������
        System.out.println(bigDecimal.add(bigDecimal2));
        System.out.println(bigDecimal.subtract(bigDecimal2));
        System.out.println(bigDecimal.multiply(bigDecimal2));
        //System.out.println(bigDecimal.divide(bigDecimal2));//�����׳��쳣ArithmeticException
        //�ڵ���divide ����ʱ��ָ�����ȼ���. BigDecimal.ROUND_CEILING
        //���������ѭ��С�����ͻᱣ�� ���� �ľ���
        System.out.println(bigDecimal.divide(bigDecimal2, BigDecimal.ROUND_CEILING));
    }
}
