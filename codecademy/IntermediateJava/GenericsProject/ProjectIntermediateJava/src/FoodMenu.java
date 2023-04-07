import java.util.List;

public class FoodMenu {
	private List<Food> menu;
	public FoodMenu() {
		Food beef = new Food("beef", "protein for gymnasium", 2000);
		Food milk = new Food("milk", "daily drink", 500);
		Food vegetable = new Food("vegetable", "fibers", 300);
		menu.add(beef);
		menu.add(milk);
		menu.add(vegetable);
	}
	
	@Override
	public String toString() {
		StringBuilder result = null;
		for (Food element: menu) {
			result.append(element.getName());
			result.append(element.getDescription());
			result.append(element.getPrice());
			
		}
		return result.toString();
	}

	public Food getFood(int index) {
		Food result = null;
		try {
			result = menu.get(index +1);
		} catch(Exception IndexOutOfBoundsException) {
			
		}
		return result;
	}
	
	public Food getLowestCostFood() {
		int price = Integer.MAX_VALUE;
		Food temp = null;
		for (Food element: menu) {
			//price = element.getPrice() < price? element.getPrice():price;
			if(element.getPrice() < price) {
				temp = element;
			} 		
		}
		return temp;
	}
}
