package chap4;

public class ArithmeticOperator { 
	public static void main(String[] args) {
		System.out.println(10 / 4);
		System.out.println(10.0 / 4); 
		double d = 10 / 4; 
		System.out.println(d);
		System.out.println(10 % 3); 
		System.out.println(-10 % 3); 
		System.out.println(10 % -3); 
		System.out.println(-10 % -3);
		int i = 10;
		System.out.println("i=" + i);
		int j = 8;
		int k = j++; 
		System.out.println("k=" + k + "j=" + j);
	}
}