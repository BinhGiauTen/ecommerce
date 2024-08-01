package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDAO;
import models.Account;

@WebServlet("/AddAccount")
public class AddAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/jsp/addAccount.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		String accountId = request.getParameter("accountId");
		String userName = request.getParameter("user_name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Account account = new Account(userName, phone, email, password, false);
		AccountDAO aDao = new AccountDAO();
		boolean isSuccess;
		try {
			if(accountId == null) {
				isSuccess = aDao.addAccount(account);
			}else {
				isSuccess = aDao.updateAccount(account);
			}
			if (isSuccess) {
	            // Nếu thêm thành công, chuyển hướng đến trang danh sách sản phẩm hoặc gửi thông báo thành công
	            response.sendRedirect(request.getContextPath() + "/ListAccount");
	        } else {
	            // Nếu thêm không thành công, chuyển hướng lại trang thêm sản phẩm hoặc gửi thông báo lỗi
	            request.setAttribute("errorMessage", "Thêm tài khoản không thành công.");
	            System.out.println("Lỗi cập nhật tài khoản");
	            doGet(request, response);
	        }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
