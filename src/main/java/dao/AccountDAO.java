package dao;

import java.io.Console;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import connectDB.ConnectDB;
import models.Account;

public class AccountDAO {
	
	public ArrayList<Account> getAllAccount(){
		ArrayList<Account> listA = new ArrayList<Account>();
		try {
			ConnectDB.getInstance();
			Connection con = ConnectDB.getConnection();
			String sql = "Select * from Account";
			Statement sta = con.createStatement();
			ResultSet rs = sta.executeQuery(sql);
			while (rs.next()) {
				int accountId = rs.getInt("account_id");
				String userName = rs.getString("user_name");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				String password = rs.getString("password");
				boolean isAdmin = rs.getBoolean("is_admin");
				Account a = new Account(accountId, userName, phone, email, password, isAdmin);
				listA.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listA;
	}
	
	public Account getAccountById(int accountId) {
		Account a = null;
		PreparedStatement sta = null;
		try {
			ConnectDB.getInstance();
			Connection con = ConnectDB.getConnection();
			String sql = "Select * from Account where account_id = ?";
			sta = con.prepareStatement(sql);
			sta.setInt(1, accountId);

			ResultSet rs = sta.executeQuery();
			while (rs.next()) {
				String userName = rs.getString("user_name");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				String password = rs.getString("password");
				boolean isAdmin = rs.getBoolean("is_admin");
				a = new Account(accountId, userName, phone, email, password, isAdmin);
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
	
	public boolean addAccount(Account a) throws SQLException {
		PreparedStatement stmt = null;
		int n = 0;
		try {
			ConnectDB.getInstance();
			Connection con = ConnectDB.getConnection();
			String sql = "insert into Account(user_name, phone, email, password, is_admin) values(?,?,?,?,?)";
			stmt = con.prepareStatement(sql);
			stmt.setString(1,a.getUserName());
			stmt.setString(2, a.getPhone());
			stmt.setString(3,a.getEmail());
			stmt.setString(4, a.getPassword());
			stmt.setBoolean(5, a.getIsAdmin());
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
	
	public boolean updateAccount(Account account) {
		PreparedStatement sta = null;
		int n=0;
		try {
			ConnectDB.getInstance();
			Connection con = ConnectDB.getConnection();
			String sql = "update Account set user_name = ?, phone = ?, email = ?, password = ?, is_admin = ? where account_id = ?";
			sta = con.prepareStatement(sql);
			sta.setString(1, account.getUserName());
			sta.setString(2, account.getPhone());
			sta.setString(3, account.getEmail());
			sta.setString(4, account.getPassword());
			sta.setBoolean(5, account.getIsAdmin());
			sta.setInt(6, account.getAccountId());
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
	
	public boolean deleteAccount(int accountId) throws SQLException {
		ConnectDB.getInstance();
		Connection con = ConnectDB.getConnection();
		PreparedStatement stmt = null;
		int n = 0;
		try {
			String sql = "delete from Account where account_id = ?";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, accountId);
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
	
	public boolean accountExists(String accountId) throws SQLException {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		boolean exists = false;
		try {
			ConnectDB.getInstance();
			Connection con = ConnectDB.getConnection();
			String sql = "SELECT COUNT(*) FROM Account WHERE account_id = ?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, accountId);
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
	
	public static void main(String[] args) {
		AccountDAO aDao = new AccountDAO();
		Account a = new Account(1, "Van Binh", "0375926965", "update@gmail.com", "1234", false);
		boolean isSuccess = aDao.updateAccount(a);
		System.out.println(isSuccess);
	}

}
