package dto;

public class Order_foods {
	private int order_id;
	private String food_name;
	private int amount;
	private int amtPrice;
	
	public Order_foods() {
		super();
	}
	
	public Order_foods(int order_id, String food_name, int amount, int amtPrice) {
		super();
		this.order_id = order_id;
		this.food_name = food_name;
		this.amount = amount;
		this.amtPrice = amtPrice;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public String getFood_name() {
		return food_name;
	}

	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getAmtPrice() {
		return amtPrice;
	}

	public void setAmtPrice(int amtPrice) {
		this.amtPrice = amtPrice;
	}
	
}
