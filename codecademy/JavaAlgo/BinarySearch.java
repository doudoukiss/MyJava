class BinarySearch
{
  public static int binarySearch(int[] arr, int left, int right, int target)
  {
// implement steps here
    int mid = (left+right)/2;
    while (left <= right) {
        if (arr[mid] < target) {
            left = mid +1;
        } else if(arr[mid]==target){
            return mid;
        } else {
            right = mid - 1;
        }
        mid = (left + right)/2;
    }
    return -1;
  }
 
 public static void main(String[] args)
  {
    int[] arr = { 2, 5, 6, 8, 9, 10 };
    int target = 8;
 
    int left = 0;
    int right = arr.length - 1;
 
    int index = binarySearch(arr, left, right, target);
    if (index != -1) {
      System.out.println("Element found at index " + index);
    } else {
      System.out.println("Element not found in the array");
    }
  }
}