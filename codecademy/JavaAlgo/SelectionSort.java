import java.util.Arrays;

class SelectionSort {
  public static void selectionSort (int arr[]) {
    int size = arr.length;
    for (int i = 0; i < size - 1; i++) {
      int currentMinimumIndex = i;
      for (int j = i + 1; j < arr.length; j++) {
        if (arr[j] < arr[currentMinimumIndex]) {
          currentMinimumIndex = j;
        }
      }
      swap(arr, i, currentMinimumIndex);
  }
}
  public static void swap(int[] arr, int indexOne, int indexTwo) {
    int temp = arr[indexTwo];
    arr[indexTwo] = arr[indexOne];
    arr[indexOne] = temp;
 }
  public static void main(String args[]) {
     int[] data = { 2, 7, 1, 16, 4, 0 };
     SelectionSort.selectionSort(data);
     System.out.println(Arrays.toString(data));
  }
}