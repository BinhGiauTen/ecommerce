package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDAO;
import models.Account;

@WebServlet("/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		LoginDAO loginDAO = new LoginDAO();
		Account a = loginDAO.login(email, password);
		if(a == null) {
			request.setAttribute("errorMessage", "Email hoặc mật khẩu sai. Vui lòng nhập lại.");
			request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("account", a);
			response.sendRedirect("/Ecommerce/Home");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
