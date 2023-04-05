import java.util.Arrays;
class InsertionSort {
  public static void sort(int[] array) {
    // add code here
       int n = array.length;  
        for (int j = 1; j < n; j++) {  
            int temp = array[j];  
            int i = j-1;  
            while ( (i > -1) && ( array [i] > temp ) ) {  
                array [i+1] = array [i];  
                i--;  
            }  
            array[i+1] = temp;  
        } 
  }
  public static void main(String[] args) {
    int[] numbers = {1,3,7,-1,5};
    sort(numbers);
    for (int i=0; i<numbers.length; i++) {
      System.out.println(numbers[i]);
    }
  }
}