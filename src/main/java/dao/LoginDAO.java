package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connectDB.ConnectDB;
import models.Account;

public class LoginDAO {

	public Account login(String email, String password) {
		Account a = null;
		PreparedStatement sta = null;
		try {
			ConnectDB.getInstance();
			Connection con = ConnectDB.getConnection();
			String sql = "Select * from Account where email = ? and password = ?";
			sta = con.prepareStatement(sql);
			sta.setString(1, email);
			sta.setString(2, password);
			ResultSet rs = sta.executeQuery();
			while (rs.next()) {
				int accountId = rs.getInt("account_id");
				String userName = rs.getString("user_name");
				String mail = rs.getString("email");
				String pass= rs.getString("password");
				boolean isAdmin = rs.getBoolean("is_admin");				
				a = new Account(accountId, userName, mail, pass, isAdmin);
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
		return a;
	}
	

}
