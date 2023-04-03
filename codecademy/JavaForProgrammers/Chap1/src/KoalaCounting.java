public class KoalaCounting {
	public static int findValuesGreaterThan(int[][] arr2D, int num) {
	    int total = 0;
	    for (int row = 0; row < arr2D.length; row++) {
	        for (int col = 0; col < arr2D[0].length; col++) {
	            if (arr2D[row][col] > num) {
	                total += 1;
	            }
	        }
	    }
	    return total;
	}
	
	public static int largestColumn(int[][] arr2D) {
	    // Add your code below
	    int largestColumn = 0;
	    int largestNumber = 0;
	    for (int col = 0; col < arr2D[0].length; col++){
	    int columnVal = 0;
	        for (int row = 0; row < arr2D.length; row++) {
	            columnVal += arr2D[row][col];
	        }
	        if (columnVal > largestNumber) {
	            largestNumber = columnVal;
	            largestColumn = col;
	        }
	    }
	    return largestColumn;
	}

  public static void main(String[] args) {

    int[][] koalaSpottings = {{17, 13, 19, 22}, {12, 18, 25, 20}, {15, 18, 21, 24}, {19, 23, 23, 22}, {18, 20, 21, 26}};
    System.out.println(findValuesGreaterThan(koalaSpottings, 20));
    System.out.println(largestColumn(koalaSpottings));
  }
}

