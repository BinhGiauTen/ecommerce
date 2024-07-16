package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import dao.ProductDAO;
import models.Category;
import models.Product;

@WebServlet("/Home")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String categoryName = request.getParameter("categoryName");

		ProductDAO pDao = new ProductDAO();
		ArrayList<Product> listP;

		if (categoryName != null && !categoryName.isEmpty()) {
			// Nếu categoryName được chỉ định, lấy danh sách sản phẩm theo danh mục
			listP = pDao.getProductsByCategoryName(categoryName);
		} else {
			// Nếu không có categoryName, lấy tất cả sản phẩm
			listP = pDao.getAllProduct();
		}
		
		ArrayList<Product> top3Discount = pDao.getTop3ProductByDiscount();
		ArrayList<Product> top3Sold = pDao.getTop3Sold();
		ArrayList<Product> top3Rating = pDao.getTop3Rating();
		
		request.setAttribute("top3Discount", top3Discount);
		request.setAttribute("top3Sold", top3Sold);
		request.setAttribute("top3Rating", top3Rating);
		request.setAttribute("listP", listP);

		CategoryDAO cDao = new CategoryDAO();
		ArrayList<Category> listC = cDao.getAllCategory();
		request.setAttribute("listC", listC);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/jsp/home.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
