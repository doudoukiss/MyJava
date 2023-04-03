package chap4DP;
import java.util.HashMap;
import java.util.Set;
import java.util.Map;

public class fibonacci {
	public static void main(String[] args) {
	    Map<Integer, Integer> map = new HashMap<Integer, Integer>();
	   
	    System.out.println(fibMemo(10, map));

	    map = new HashMap<Integer, Integer>();
	    System.out.println(fibMemo(20, map));
	  }

	  public static int fibMemo(int n, Map<Integer, Integer> map) {
		  int result;
		  if (n==0 || n==1) {
			  map.put(n, 1);
			  return n;
		  } else if (map.containsKey(n)) {
			  return map.get(n);
		  } else {
			  result = fibMemo(n-1, map) + fibMemo(n-2, map);
			  map.put(n, result);
		  }

	    return result;
	  }

}