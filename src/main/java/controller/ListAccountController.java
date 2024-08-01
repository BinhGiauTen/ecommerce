package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDAO;
import models.Account;

@WebServlet("/ListAccount")
public class ListAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountDAO aDao = new AccountDAO();
		ArrayList<Account> listA = aDao.getAllAccount();
		request.setAttribute("listA", listA);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/jsp/listAccount.jsp");
		dispatcher.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		AccountDAO aDao = new AccountDAO();
        if ("delete".equals(action)) {
        	String accountIdStr = request.getParameter("accountId");
        	int accountId =Integer.parseInt(accountIdStr);
            try {
                aDao.deleteAccount(accountId);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            response.sendRedirect("ListAccount");
        } else if("update".equals(action)) {
        	String accountIdStr = request.getParameter("accountId");
        	int accountId = Integer.parseInt(accountIdStr);
            Account a = aDao.getAccountById(accountId);
            request.setAttribute("a", a);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/jsp/addAccount.jsp");
            dispatcher.forward(request, response);
        }
	}

}
