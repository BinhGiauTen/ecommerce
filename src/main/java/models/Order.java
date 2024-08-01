package models;

import java.sql.Date;
import java.util.List;

public class Order {
	private int orderId;
	private String userName;
	private String phone;
	private String email;
	private String address;
	private Double totalPrice;
	private String paymentMethod;
	private List<OrderItem> orderItems;
	private Account account;
	private Date orderDate;
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public List<OrderItem> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(List<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Order(int orderId, String userName, String phone, String email, String address, Double totalPrice,
			String paymentMethod, Account account, Date orderDate) {
		super();
		this.orderId = orderId;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.totalPrice = totalPrice;
		this.paymentMethod = paymentMethod;
		this.account = account;
		this.orderDate = orderDate;
	}
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
