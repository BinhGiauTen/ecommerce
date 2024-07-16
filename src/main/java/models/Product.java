package models;

public class Product {
	private String productId;
	private String productName;
	private String img_url;
	private int oldPrice;
	private int discount;
	private int rating;
	private float star;
	private int sold;
	private int quantity;
	private String location;
	private String description;
	private Category category;
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public float getOldPrice() {
		return oldPrice;
	}
	public void setOldPrice(int oldPrice) {
		this.oldPrice = oldPrice;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public float getStar() {
		return star;
	}
	public void setStar(float star) {
		this.star = star;
	}
	public int getSold() {
		return sold;
	}
	public void setSold(int sold) {
		this.sold = sold;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Product(String productId, String productName, String img_url, int oldPrice, int discount, int rating,
			float star, int sold, int quantity, String location, String description, Category category) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.img_url = img_url;
		this.oldPrice = oldPrice;
		this.discount = discount;
		this.rating = rating;
		this.star = star;
		this.sold = sold;
		this.quantity = quantity;
		this.location = location;
		this.description = description;
		this.category = category;
	}
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Product(String productId) {
		super();
		this.productId = productId;
	}
	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", img_url=" + img_url
				+ ", oldPrice=" + oldPrice + ", discount=" + discount + ", rating=" + rating + ", star=" + star
				+ ", sold=" + sold + ", quantity=" + quantity + ", location=" + location + ", description="
				+ description + ", category=" + category + "]";
	}
	
	
}
