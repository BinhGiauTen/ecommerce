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

@WebServlet("/AddProduct")
public class AddProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryDAO cDao = new CategoryDAO();
		ArrayList<Category> listC = cDao.getAllCategory();
		request.setAttribute("listC", listC);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/jsp/addproduct.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		// Lấy dữ liệu từ biểu mẫu
		String productId = request.getParameter("productId");
        String productName = request.getParameter("product_name");
        String imgUrl = request.getParameter("img_url");
        int oldPrice = Integer.parseInt(request.getParameter("old_price"));
        int discount = Integer.parseInt(request.getParameter("discount"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String location = request.getParameter("location");
        String description = request.getParameter("description");
        String categoryId = request.getParameter("category_id");


        // Tạo đối tượng ProductDAO và gọi phương thức addProduct
        ProductDAO productDAO = new ProductDAO();
        boolean isSuccess;
		try {
			if(productId == null) {
				isSuccess = productDAO.addProduct( productName, imgUrl, oldPrice, discount, quantity, location, description, categoryId);
			}else {
				isSuccess = productDAO.updateProduct(productId, productName, imgUrl, oldPrice, discount, quantity, location, description, categoryId);
			}
			if (isSuccess) {
	            // Nếu thêm thành công, chuyển hướng đến trang danh sách sản phẩm hoặc gửi thông báo thành công
	            response.sendRedirect(request.getContextPath() + "/ListProduct");
	        } else {
	            // Nếu thêm không thành công, chuyển hướng lại trang thêm sản phẩm hoặc gửi thông báo lỗi
	            request.setAttribute("errorMessage", "Thêm sản phẩm không thành công.");
	            doGet(request, response);
	        }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        
	}

}
