package chap3;

public class AutoConvert {
	public static void main(String[] args) {
		int n1 = 10; 
		float d1 = n1 + 1.1F;
		byte b1 = 10; 
		byte b2 = 1;
		byte b3 = 2;
		short s1 = 1;
		int s2 = b2 + s1;
		boolean pass = true;
		byte b4 = 1;
		short s3 = 100;
		int num200 = 1;
		float num300 = 1.1F;

		double num500 = b4 + s3 + num200 + num300;
		System.out.println(num500);
	}
}

