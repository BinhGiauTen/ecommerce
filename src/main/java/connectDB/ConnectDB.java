
package connectDB;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB {
	public static Connection con = null;
	private static final ConnectDB instance = new ConnectDB();
	public static ConnectDB getInstance() throws SQLException {
		instance.connect();
		return instance;
	}
	public void connect() throws SQLException {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String url = "jdbc:sqlserver://localhost:1433;databasename=Ecommerce;encrypt=true;trustServerCertificate=true";
		String user = "sa";
		String password = "sapassword";
		con = DriverManager.getConnection(url, user, password);
	}
	public void disconnect() {
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
			}
		}
	}
	public static Connection getConnection() {
		return con;
	}
}

