import java.util.Map;
import java.util.HashMap;

public class ShoppingBag<T extends PricedItem<Integer>> {
	
	private Map<T, Integer> shoppingBag;
	
	public ShoppingBag() {
		shoppingBag = new HashMap<T, Integer>();
	}
	
	public void addItem(T item) {
		if(shoppingBag.containsKey(item)) {
			shoppingBag.put(item, shoppingBag.get(item)+1);
		} else {
			shoppingBag.put(item, 1);
		}
	}
	
	public int getTotalPrice() {
		int result=0;
		for (Map.Entry<T, Integer> entry: shoppingBag.entrySet()) {
			
			result = result + entry.getKey().getPrice()*entry.getValue();
		}
		return result;
	}
}
