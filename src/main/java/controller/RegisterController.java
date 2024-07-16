package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RegisterDAO;

@WebServlet("/Register")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("fullname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		RegisterDAO registerDAO = new RegisterDAO();
		boolean isRegistered = registerDAO.register(userName, email, password);

		if (isRegistered) {
			response.sendRedirect("/Ecommerce/jsp/login.jsp");
		} else {
			request.setAttribute("errorMessage", "Đăng ký thất bại. Email đã tồn tại.");
			request.getRequestDispatcher("/Ecommerce/jsp/register.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
