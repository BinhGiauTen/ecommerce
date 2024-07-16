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

}
