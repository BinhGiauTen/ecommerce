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

import dao.CategoryDAO;
import models.Category;

@WebServlet("/ListCategory")
public class ListCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryDAO cDao = new CategoryDAO();
		ArrayList<Category> listC = cDao.getAllCategory();
		request.setAttribute("listC", listC);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/jsp/listCategory.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		CategoryDAO cDao = new CategoryDAO();
        if ("delete".equals(action)) {
        	String categoryId = request.getParameter("categoryId");
            try {
                cDao.deleteCategory(categoryId);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            response.sendRedirect("ListCategory");
        } else if("update".equals(action)) {
        	String categoryId = request.getParameter("categoryId");
            Category category = cDao.getCategoryById(categoryId);
            request.setAttribute("category", category);
            
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/jsp/addCategory.jsp");
            dispatcher.forward(request, response);
        }
	}

}
