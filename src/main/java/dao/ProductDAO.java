package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import connectDB.ConnectDB;
import models.Category;
import models.Product;

public class ProductDAO {

	public ProductDAO() {

	}

	public ArrayList<Product> getAllProduct() {
		ArrayList<Product> listP = new ArrayList<Product>();
		try {
			ConnectDB.getInstance();
			Connection con = ConnectDB.getConnection();
			String sql = "Select * from Product";
			Statement sta = con.createStatement();
			ResultSet rs = sta.executeQuery(sql);
			while (rs.next()) {
				String productId = rs.getString("product_id");
				String productName = rs.getString("product_name");
				String img_url = rs.getString("img_url");
				int oldPrice = rs.getInt("old_price");
				int discount = rs.getInt("discount");
				int rating = rs.getInt("rating");
				float star = rs.getFloat("star");
				int sold = rs.getInt("sold");
				int quantity = rs.getInt("quantity");
				String location = rs.getString("location");
				String description = rs.getString("description");
				String categoryId = rs.getString("category_id");
				Category c = new Category(categoryId);
				Product p = new Product(productId, productName, img_url, oldPrice, discount, rating, star, sold,
						quantity, location, description, c);
				listP.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listP;
	}

	public ArrayList<Product> getProductsByCategoryName(String categoryName) {
	    ArrayList<Product> listP = new ArrayList<>();  
	    PreparedStatement sta = null;
	    try {
	    		ConnectDB.getInstance();
				Connection con = ConnectDB.getConnection();
	    		String sql = "SELECT * FROM Product p JOIN Category c ON p.category_id = c.category_id WHERE c.category_name = ?";
	    		sta = con.prepareStatement(sql);
	    		sta.setString(1,categoryName);
				ResultSet rs = sta.executeQuery();

	        while (rs.next()) {
	        	String productId = rs.getString("product_id");
				String productName = rs.getString("product_name");
				String img_url = rs.getString("img_url");
				int oldPrice = rs.getInt("old_price");
				int discount = rs.getInt("discount");
				int rating = rs.getInt("rating");
				float star = rs.getFloat("star");
				int sold = rs.getInt("sold");
				int quantity = rs.getInt("quantity");
				String location = rs.getString("location");
				String description = rs.getString("description");
				String categoryId = rs.getString("category_id");
				Category c = new Category(categoryId);
				Product p = new Product(productId, productName, img_url, oldPrice, discount, rating, star, sold,
						quantity, location, description, c);
				listP.add(p);
	        }
	    }catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				sta.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return listP;
	}
	
	public Product getProductById(String productId) {
	    Product product = null;
	    PreparedStatement sta = null;
	    try {
	        ConnectDB.getInstance();
	        Connection con = ConnectDB.getConnection();
	        String sql = "SELECT * FROM Product WHERE product_id = ?";
	        sta = con.prepareStatement(sql);
	        sta.setString(1, productId);
	        ResultSet rs = sta.executeQuery();
	        if (rs.next()) {
				String productName = rs.getString("product_name");
				String img_url = rs.getString("img_url");
				int oldPrice = rs.getInt("old_price");
				int discount = rs.getInt("discount");
				int rating = rs.getInt("rating");
				float star = rs.getFloat("star");
				int sold = rs.getInt("sold");
				int quantity = rs.getInt("quantity");
				String location = rs.getString("location");
				String description = rs.getString("description");
				String categoryId = rs.getString("category_id");
				Category c = new Category(categoryId);
				product = new Product(productId, productName, img_url, oldPrice, discount, rating, star, sold,
						quantity, location, description, c);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (sta != null) {
	                sta.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return product;
	}
	
	public ArrayList<Product> getTop3ProductByDiscount() {
	    ArrayList<Product> listP = new ArrayList<>();  
	    PreparedStatement sta = null;
	    try {
	    		ConnectDB.getInstance();
				Connection con = ConnectDB.getConnection();
	    		String sql = "SELECT TOP 3 * FROM Product ORDER BY discount DESC";
	    		sta = con.prepareStatement(sql);
				ResultSet rs = sta.executeQuery();

	        while (rs.next()) {
	        	String productId = rs.getString("product_id");
				String productName = rs.getString("product_name");
				String img_url = rs.getString("img_url");
				int oldPrice = rs.getInt("old_price");
				int discount = rs.getInt("discount");
				int rating = rs.getInt("rating");
				float star = rs.getFloat("star");
				int sold = rs.getInt("sold");
				int quantity = rs.getInt("quantity");
				String location = rs.getString("location");
				String description = rs.getString("description");
				String categoryId = rs.getString("category_id");
				Category c = new Category(categoryId);
				Product p = new Product(productId, productName, img_url, oldPrice, discount, rating, star, sold,
						quantity, location, description, c);
				listP.add(p);
	        }
	    }catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				sta.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return listP;
	}
	
	public ArrayList<Product> getTop3Sold() {
	    ArrayList<Product> listP = new ArrayList<>();  
	    PreparedStatement sta = null;
	    try {
	    		ConnectDB.getInstance();
				Connection con = ConnectDB.getConnection();
	    		String sql = "SELECT TOP 3 * FROM Product ORDER BY sold DESC";
	    		sta = con.prepareStatement(sql);
				ResultSet rs = sta.executeQuery();

	        while (rs.next()) {
	        	String productId = rs.getString("product_id");
				String productName = rs.getString("product_name");
				String img_url = rs.getString("img_url");
				int oldPrice = rs.getInt("old_price");
				int discount = rs.getInt("discount");
				int rating = rs.getInt("rating");
				float star = rs.getFloat("star");
				int sold = rs.getInt("sold");
				int quantity = rs.getInt("quantity");
				String location = rs.getString("location");
				String description = rs.getString("description");
				String categoryId = rs.getString("category_id");
				Category c = new Category(categoryId);
				Product p = new Product(productId, productName, img_url, oldPrice, discount, rating, star, sold,
						quantity, location, description, c);
				listP.add(p);
	        }
	    }catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				sta.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return listP;
	}
	
	public ArrayList<Product> getTop3Rating() {
	    ArrayList<Product> listP = new ArrayList<>();  
	    PreparedStatement sta = null;
	    try {
	    		ConnectDB.getInstance();
				Connection con = ConnectDB.getConnection();
	    		String sql = "SELECT TOP 3 * FROM Product ORDER BY star DESC";
	    		sta = con.prepareStatement(sql);
				ResultSet rs = sta.executeQuery();

	        while (rs.next()) {
	        	String productId = rs.getString("product_id");
				String productName = rs.getString("product_name");
				String img_url = rs.getString("img_url");
				int oldPrice = rs.getInt("old_price");
				int discount = rs.getInt("discount");
				int rating = rs.getInt("rating");
				float star = rs.getFloat("star");
				int sold = rs.getInt("sold");
				int quantity = rs.getInt("quantity");
				String location = rs.getString("location");
				String description = rs.getString("description");
				String categoryId = rs.getString("category_id");
				Category c = new Category(categoryId);
				Product p = new Product(productId, productName, img_url, oldPrice, discount, rating, star, sold,
						quantity, location, description, c);
				listP.add(p);
	        }
	    }catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				sta.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return listP;
	}
	
	public boolean addProduct(String productName, String img_url, int price, int discount, int quantity, String location, String description, String categoryId) throws SQLException {
		PreparedStatement stmt = null;
		 ProductDAO pDao = new ProductDAO();
		ArrayList<Product> listP = pDao.getAllProduct();
	    int size = listP.size(); // Lấy số lượng sản phẩm hiện tại
	    int newProductId = size + 1; // Tạo ID mới
	    String newProductIdStr = String.format("%02d", newProductId);
		int n = 0;
		try {
			ConnectDB.getInstance();
			Connection con = ConnectDB.getConnection();
			String sql = "insert into Product values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			stmt = con.prepareStatement(sql);
			stmt.setString(1,newProductIdStr);
			stmt.setString(2, productName);
			stmt.setString(3, img_url);
			stmt.setInt(4, price);
			stmt.setInt(5, discount);
			stmt.setInt(6, 0);
			stmt.setFloat(7, 0);
			stmt.setInt(8, 0);
			stmt.setInt(9, quantity);
			stmt.setString(10, location);
			stmt.setString(11, description);
			stmt.setString(12, categoryId);
			java.sql.Timestamp currentTimestamp = new java.sql.Timestamp(System.currentTimeMillis());
		    stmt.setTimestamp(13, currentTimestamp);
			n = stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return n > 0;
	}
	
	public boolean updateProduct(String productId,String productName, String img_url, int oldPrice, int discount, int quantity, String location, String description, String categoryId) {
		PreparedStatement sta = null;
		int n=0;
		try {
			ConnectDB.getInstance();
			Connection con = ConnectDB.getConnection();
			String sql = "update Product set product_name = ?, img_url = ?, old_price = ?, discount = ?, quantity = ?, location = ?, description = ?, category_id = ? where product_id = ?";
			sta = con.prepareStatement(sql);
			sta.setString(1, productName);
			sta.setString(2, img_url);
			sta.setInt(3, oldPrice);
			sta.setInt(4, discount);
			sta.setInt(5, quantity);
			sta.setString(6, location);
			sta.setString(7, description);
			sta.setString(8, categoryId);
			sta.setString(9, productId);
			n=sta.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				sta.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return n>0;
		
	}
	
	public boolean deleteProduct(String productId) throws SQLException {
		ConnectDB.getInstance();
		Connection con = ConnectDB.getConnection();
		PreparedStatement stmt = null;
		int n = 0;
		try {
			String sql = "delete from Product where product_id = ?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, productId);
			n = stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return n > 0;
	}

}