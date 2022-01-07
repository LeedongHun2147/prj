package dto;

public class Food {
	private String food_name;
	private String category;
	private int price;
	private int stock;
	private String file_name;
	private int quantity;
	
	public Food() {
		super();
		this.stock = 0;
		this.quantity = 0;
	}
	
	public Food(String food_name, String category, int price) {
		super();
		this.food_name = food_name;
		this.category = category;
		this.price = price;
		this.stock = 0;
		this.quantity = 0;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}
