package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connectDB.ConnectDB;
import models.ProductSpecification;

public class ProductSpecDAO {

	public ArrayList<ProductSpecification> getProductDetailByProductId(String Id) {
		ArrayList<ProductSpecification> listPS = new ArrayList<>();  
	    PreparedStatement sta = null;
	    try {
	    		ConnectDB.getInstance();
				Connection con = ConnectDB.getConnection();
	    		String sql = "SELECT * FROM ProductSpecifications where product_id = ?";
	    		sta = con.prepareStatement(sql);
	    		sta.setString(1,Id);
				ResultSet rs = sta.executeQuery();

	        while (rs.next()) {
	        	String specKey = rs.getString("spec_key");
				String specValue = rs.getString("spec_value");
				ProductSpecification  ps= new ProductSpecification(specKey, specValue);
				listPS.add(ps);
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
		return listPS;
	}
	
	public static void main(String[] args) {
		ProductSpecDAO psDao= new ProductSpecDAO();
		ArrayList<ProductSpecification> listPS =psDao.getProductDetailByProductId("1");
		System.out.println(listPS);
	}
}
