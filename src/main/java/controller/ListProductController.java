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
import dao.ProductDAO;
import models.Category;
import models.Product;

@WebServlet("/ListProduct")
public class ListProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO pDao = new ProductDAO();
		ArrayList<Product> listP = pDao.getAllProduct();
		request.setAttribute("listP", listP);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/jsp/listproduct.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		ProductDAO pDao = new ProductDAO();
		CategoryDAO cDao = new CategoryDAO();
        if ("delete".equals(action)) {
        	String productId = request.getParameter("productId");
            try {
                pDao.deleteProduct(productId);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            response.sendRedirect("ListProduct");
        } else if("update".equals(action)) {
        	String productId = request.getParameter("productId");
            Product product = pDao.getProductById(productId);
            request.setAttribute("product", product);
            
            ArrayList<Category> listC = cDao.getAllCategory();
            request.setAttribute("listC", listC);
            
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/jsp/addproduct.jsp");
            dispatcher.forward(request, response);
        }
	}

}
