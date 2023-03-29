
public class Arrayinjava {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[][] nums = {{10, 9, 8}, {7, 6, 5}, {4, 3, 2}}; 
		System.out.println(nums[0][1]); 
		
		char[][] letters1 = {{'A', 'a'}, {'B', 'x'}, {'C', 'c'}};
		 
		// Update the value:
		letters1[1][1] = 'b';
		System.out.println(letters1[1][1]);
		
		int[][] intArray = new int[2][3];
		 
		intArray[0][0] = 1;
		intArray[0][1] = 2;
		intArray[0][2] = 4;
		intArray[1][0] = 1;
		intArray[1][1] = 3;
		intArray[1][2] = 6;

		char[][] letters = {{'A', 'a'}, {'B', 'b'}, {'C', 'c'}};
		 
		for (int i = 0; i < letters.length; i++){
		  for (int j = 0; j < letters[0].length; j++){
		    System.out.print(letters[i][j]);
		  }
		}
		
		for (int i = 0; i < letters[0].length; i++){
			  for (int j = 0; j < letters.length; j++){
			    System.out.print(letters[j][i]);
			  }
		}
		
		String[] groceries = new String[] {"candy corn", "chocolate", "jelly beans", "cookies"};
		 
		for(String item : groceries) {
		  System.out.println(item.toUpperCase());
		}
		
	}

}
