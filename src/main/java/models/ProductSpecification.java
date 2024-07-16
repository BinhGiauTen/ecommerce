package models;

public class ProductSpecification {
	private String specKey;
	private String specValue;
	private Product product;
	public String getSpecKey() {
		return specKey;
	}
	public void setSpecKey(String specKey) {
		this.specKey = specKey;
	}
	public String getSpecValue() {
		return specValue;
	}
	public void setSpecValue(String specValue) {
		this.specValue = specValue;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public ProductSpecification(String specKey, String specValue, Product product) {
		super();
		this.specKey = specKey;
		this.specValue = specValue;
		this.product = product;
	}
	public ProductSpecification() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ProductSpecification(String specKey, String specValue) {
		super();
		this.specKey = specKey;
		this.specValue = specValue;
	}
	@Override
	public String toString() {
		return "ProductSpecification [specKey=" + specKey + ", specValue=" + specValue + ", product=" + product + "]";
	}
	
	

}
