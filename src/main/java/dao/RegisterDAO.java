package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connectDB.ConnectDB;

public class RegisterDAO {

    // Phương thức kiểm tra email đã tồn tại
    public boolean isEmailExist(String email) {
        PreparedStatement sta = null;
        ResultSet rs = null;
        boolean exists = false;
        try {
            ConnectDB.getInstance();
            Connection con = ConnectDB.getConnection();
            String sql = "SELECT COUNT(*) FROM Account WHERE email = ?";
            sta = con.prepareStatement(sql);
            sta.setString(1, email);
            rs = sta.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                exists = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (sta != null) sta.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return exists;
    }

    // Phương thức đăng ký tài khoản mới
    public boolean register(String userName, String phone, String email, String password) {
        if (isEmailExist(email)) {
            return false; // Email đã tồn tại
        }

        PreparedStatement sta = null;
        int n = 0;
        try {
            ConnectDB.getInstance();
            Connection con = ConnectDB.getConnection();
            String sql = "INSERT INTO Account(user_name, phone, email, password, is_admin) VALUES(?,?,?,?,?)";
            sta = con.prepareStatement(sql);
            sta.setString(1, userName);
            sta.setString(2,phone);
            sta.setString(3, email);
            sta.setString(4, password);
            sta.setBoolean(5, false);
            n = sta.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (sta != null) sta.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return n > 0;
    }
}
