package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import models.Category;

@WebServlet("/AddCategory")
public class AddCategoryController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/jsp/addCategory.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		String categoryId = request.getParameter("category_id");
		String categoryName = request.getParameter("category_name");
		Category category = new Category(categoryId, categoryName);
		
		CategoryDAO cDao = new CategoryDAO();
		boolean isSuccess;
		try {
			isSuccess = cDao.addCategory(category);
			if (cDao.categoryExists(categoryId)) {
				// Update the existing category
				isSuccess = cDao.updateCategory(category);
				if (isSuccess) {
					response.sendRedirect(request.getContextPath() + "/ListCategory");
				} else {
					request.setAttribute("errorMessage", "Sửa danh mục sản phẩm không thành công.");
				}
			} else {
				// Add new category
				isSuccess = cDao.addCategory(category);
				if (isSuccess) {
					response.sendRedirect(request.getContextPath() + "/ListCategory");
				} else {
					request.setAttribute("errorMessage", "Thêm danh mục sản phẩm không thành công.");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
