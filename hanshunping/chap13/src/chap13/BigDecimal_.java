package chap13;

import java.math.BigDecimal;

public class BigDecimal_ {
    @SuppressWarnings("deprecation")
	public static void main(String[] args) {

        BigDecimal bigDecimal = new BigDecimal("1234.123456789012345678901234567890");
        BigDecimal bigDecimal2 = new BigDecimal("1234.123456789012345678901234567890123456789012345678901234567890");
        System.out.println(bigDecimal);

        //1. 如果对 BigDecimal进行运算，比如加减乘除，需要使用对应的方法
        //2. 创建一个需要操作的 BigDecimal 然后调用相应的方法即可
        System.out.println(bigDecimal.add(bigDecimal2));
        System.out.println(bigDecimal.subtract(bigDecimal2));
        System.out.println(bigDecimal.multiply(bigDecimal2));
        //System.out.println(bigDecimal.divide(bigDecimal2));//可能抛出异常ArithmeticException
        //在调用divide 方法时，指定精度即可. BigDecimal.ROUND_CEILING
        //如果有无限循环小数，就会保留 分子 的精度
        System.out.println(bigDecimal.divide(bigDecimal2, BigDecimal.ROUND_CEILING));
    }
}
