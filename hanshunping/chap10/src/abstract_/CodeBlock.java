package abstract_;

public class CodeBlock {
    public static void main(String[] args) {

        @SuppressWarnings("unused")
		Movie movie = new Movie("你好，李焕英");
        System.out.println("===============");
        @SuppressWarnings("unused")
		Movie movie2 = new Movie("唐探3", 100, "陈思诚");
    }
}

class Movie {
    private String name;
    private double price;
    private String director;

    {
        System.out.println("电影屏幕打开...");
        System.out.println("广告开始...");
        System.out.println("电影正是开始...");
    };

    public Movie(String name) {
        System.out.println("Movie(String name) 被调用...");
        this.setName(name);
    }

    public Movie(String name, double price) {

        this.setName(name);
        this.setPrice(price);
    }

    public Movie(String name, double price, String director) {

        System.out.println("Movie(String name, double price, String director) 被调用...");
        this.setName(name);
        this.setPrice(price);
        this.setDirector(director);
    }

	/**
	 * @return the price
	 */
	public double getPrice() {
		return price;
	}

	/**
	 * @param price the price to set
	 */
	public void setPrice(double price) {
		this.price = price;
	}

	/**
	 * @return the director
	 */
	public String getDirector() {
		return director;
	}

	/**
	 * @param director the director to set
	 */
	public void setDirector(String director) {
		this.director = director;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
}
