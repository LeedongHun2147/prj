package dto;

public class Order1 implements Comparable<Order1> {
	private int order_id;
	private String id;
	private String order_time;
	private String served;
	
	public Order1() {
		super();
		this.order_id = -1;
		this.id = null;
		this.order_time = null;
		this.served = null;
	}
	
	public Order1(int order_id, String id, String order_time, String served) {
		super();
		this.order_id = order_id;
		this.id = id;
		this.order_time = order_time;
		this.served = served;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOrder_time() {
		return order_time;
	}

	public void setOrder_time(String order_time) {
		this.order_time = order_time;
	}

	public String getServed() {
		return served;
	}

	public void setServed(String served) {
		this.served = served;
	}

	@Override
	public int compareTo(Order1 o) {
		if(this.order_id < o.getOrder_id()) {
			return -1;
		} else if(this.order_id > o.getOrder_id()) {
			return 1;
		}
		return 0;
	}
	
}
