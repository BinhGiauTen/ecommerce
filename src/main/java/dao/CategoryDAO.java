package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import connectDB.ConnectDB;
import models.Category;

public class CategoryDAO {
	
	public CategoryDAO() {

	}
	
	public ArrayList<Category> getAllCategory(){
		ArrayList<Category> listC = new ArrayList<Category>();
		try {
			ConnectDB.getInstance();
			Connection con = ConnectDB.getConnection();
			String sql = "Select * from Category";
			Statement sta = con.createStatement();
			ResultSet rs = sta.executeQuery(sql);
			while (rs.next()) {
				String categoryId = rs.getString("category_id");
				String categoryName = rs.getString("category_name");
				
				Category c = new Category(categoryId, categoryName);
				listC.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listC;
	}
	
	public Category getCategoryById(String categoryId) {
		Category c = null;
		PreparedStatement sta = null;
		try {
			ConnectDB.getInstance();
			Connection con = ConnectDB.getConnection();
			String sql = "Select * from Category where category_id = ?";
			sta = con.prepareStatement(sql);
			sta.setString(1, categoryId);

			ResultSet rs = sta.executeQuery();
			while (rs.next()) {
				String categoryName = rs.getString("category_name");
				c = new Category(categoryId, categoryName);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				sta.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return c;
	}
	
	public boolean categoryExists(String categoryId) throws SQLException {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		boolean exists = false;
		try {
			ConnectDB.getInstance();
			Connection con = ConnectDB.getConnection();
			String sql = "SELECT COUNT(*) FROM Category WHERE category_id = ?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, categoryId);
			rs = stmt.executeQuery();
			if (rs.next()) {
				exists = rs.getInt(1) > 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return exists;
	}
	
	public boolean addCategory(Category category) throws SQLException {
		PreparedStatement stmt = null;
		int n = 0;
		try {
			ConnectDB.getInstance();
			Connection con = ConnectDB.getConnection();
			String sql = "insert into Category values(?,?)";
			stmt = con.prepareStatement(sql);
			stmt.setString(1,category.getCategoryId());
			stmt.setString(2, category.getCategoryName());
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
	
	public boolean updateCategory(Category category) {
		PreparedStatement sta = null;
		int n=0;
		try {
			ConnectDB.getInstance();
			Connection con = ConnectDB.getConnection();
			String sql = "update Category set category_name = ? where category_id = ?";
			sta = con.prepareStatement(sql);
			sta.setString(1, category.getCategoryName());
			sta.setString(2, category.getCategoryId());
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
	
	public boolean deleteCategory(String categoryId) throws SQLException {
		ConnectDB.getInstance();
		Connection con = ConnectDB.getConnection();
		PreparedStatement stmt = null;
		int n = 0;
		try {
			String sql = "delete from Category where category_id = ?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, categoryId);
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
