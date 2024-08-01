package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import connectDB.ConnectDB;
import models.Account;
import models.Order;
import models.OrderItem;

public class OrderDAO {
	public static boolean saveOrder(Order order) {
        Connection conn = ConnectDB.getConnection();
        try {
            conn.setAutoCommit(false);
            String insertOrderSQL = "INSERT INTO Orders (userName, phone, email, address, totalPrice, paymentMethod, account_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement orderStmt = conn.prepareStatement(insertOrderSQL, PreparedStatement.RETURN_GENERATED_KEYS);
            orderStmt.setString(1, order.getUserName());
            orderStmt.setString(2, order.getPhone());
            orderStmt.setString(3, order.getEmail());
            orderStmt.setString(4, order.getAddress());
            orderStmt.setDouble(5, order.getTotalPrice());
            orderStmt.setString(6, order.getPaymentMethod());
            orderStmt.setInt(7, order.getAccount().getAccountId());
            int affectedRows = orderStmt.executeUpdate();
            if (affectedRows == 0) {
                conn.rollback();
                return false;
            }

            int orderId;
            try (ResultSet generatedKeys = orderStmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    orderId = generatedKeys.getInt(1);
                } else {
                    conn.rollback();
                    return false;
                }
            }

            String insertOrderItemSQL = "INSERT INTO OrderItems (order_id, product_id, product_name, quantity, price) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement orderItemStmt = conn.prepareStatement(insertOrderItemSQL);
            for (OrderItem item : order.getOrderItems()) {
                orderItemStmt.setInt(1, orderId);
                orderItemStmt.setString(2, item.getProductId());
                orderItemStmt.setString(3, item.getProductName());
                orderItemStmt.setInt(4, item.getQuantity());
                orderItemStmt.setFloat(5, item.getPrice());
                orderItemStmt.addBatch();
            }
            orderItemStmt.executeBatch();
            conn.commit();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            try {
                conn.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            return false;
        } finally {
            try {
                conn.setAutoCommit(true);
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
	
	public ArrayList<Order> getAllOrder(){
		ArrayList<Order> listO = new ArrayList<Order>();
		try {
			ConnectDB.getInstance();
			Connection con = ConnectDB.getConnection();
			String sql = "Select * from Orders";
			Statement sta = con.createStatement();
			ResultSet rs = sta.executeQuery(sql);
			while (rs.next()) {
				int orderId = rs.getInt("order_id");
				String userName = rs.getString("userName");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				String address = rs.getString("address");
				Double totalPrice = rs.getDouble("totalPrice");
				String paymentMethod = rs.getString("paymentMethod");
				Date orderDate = rs.getDate("order_date");
				int accountId = rs.getInt("account_id");
				Account a = new Account(accountId);
				Order o = new Order(orderId, userName, phone, email, address, totalPrice, paymentMethod, a, orderDate);
				listO.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listO;
	}
	
	public ArrayList<OrderItem> getOrderItemByOrderId(int orderIdFind) {
		ArrayList<OrderItem> listOI = new ArrayList<OrderItem>();
		PreparedStatement sta = null;
		try {
			ConnectDB.getInstance();
			Connection con = ConnectDB.getConnection();
			String sql = "Select * from OrderItems where order_id = ?";
			sta = con.prepareStatement(sql);
			sta.setInt(1, orderIdFind);

			ResultSet rs = sta.executeQuery();
			while (rs.next()) {
				int orderItemId = rs.getInt("orderItem_id");
				int orderId = rs.getInt("order_id");
				String productId = rs.getString("product_id");
				String productName = rs.getString("product_name");
				int quantity = rs.getInt("quantity");
				float price = rs.getFloat("price");
				OrderItem o = new OrderItem(orderItemId, orderId, productId, productName, quantity, price);
				listOI.add(o);
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
		return listOI;
	}
	
}
