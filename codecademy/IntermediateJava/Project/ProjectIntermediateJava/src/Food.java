
public class Food implements PricedItem<Integer>{
	
	private String name;
	private String description;
	private Integer price;
	
	public Food(String name, String description, Integer price) {
		this.name = name;
		this.description = description;
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Override
	public Integer getPrice() {
		return price;
	}
	
	@Override
	public void setPrice(Integer price) {
		// TODO Auto-generated method stub
		
	}
}
