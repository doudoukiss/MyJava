/**
 * 
 */

/**
 * @author seattle
 *
 */
public class notecopy1 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int num = 0;
		while (num < 20) {
		  num = num + 1;
		}
		System.out.println(num);
		
		do {
			 System.out.println("2 is equal to 4!");
		} while (2 == 4);
		
		for (int i = 0; i <= 10; i++) {
		  System.out.println(i);
		}
		
		int[] numbers = {1, 2, 3, 4, 5};
		
		for (int i = 0; i < 10; i++) {
			  System.out.println(i);
			  if (i == 4) {
			    break;
			  }
		}
		 
		for (int i = 0; i < numbers.length; i++) {
		  if (numbers[i] % 2 == 0) {
		    continue;
		  }
		  System.out.println(numbers[i]);
		}
	}
}
