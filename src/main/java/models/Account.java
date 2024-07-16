package models;

public class Account {
	private int accountId;
	private String userName;
	private String email;
	private String password;
	private boolean isAdmin;
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	public Account( String userName, String email, String password, boolean isAdmin) {
		super();
		this.userName = userName;
		this.email = email;
		this.password = password;
		this.isAdmin = isAdmin;
	}
	
	
	public Account(String userName, String email, String password) {
		super();
		this.userName = userName;
		this.email = email;
		this.password = password;
	}
	public Account(int accountId, String userName, String email, String password, Boolean isAdmin) {
		super();
		this.accountId = accountId;
		this.userName = userName;
		this.email = email;
		this.password = password;
		this.isAdmin = isAdmin;
	}
	public Account() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Account [accountId=" + accountId + ", userName=" + userName + ", email=" + email + ", password="
				+ password + ", isAdmin=" + isAdmin + "]";
	}
	
	
	
}
