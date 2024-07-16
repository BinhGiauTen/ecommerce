package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Cart;

@WebServlet("/Cart")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// Set the response character encoding
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		String strAction = request.getParameter("action");
		if (strAction != null && !strAction.equals("")) {
			if (strAction.equals("add")) {
				addToCart(request);
			} else if (strAction.equals("Xóa")) {
				deleteCart(request);
			}else if (strAction.equals("Cập nhật")) {
                updateCart(request);
            }
			response.sendRedirect("/Ecommerce/jsp/cart.jsp");
		}
	}

	private void addToCart(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String productId = request.getParameter("productId");
		String productName = request.getParameter("productName");
		String img_url = request.getParameter("img_url");
		
		int discount = 0;
		int quantity = 0;
		float oldPrice = 0;

		try {
			
			discount = Integer.parseInt(request.getParameter("discount"));
			quantity = Integer.parseInt(request.getParameter("quantity"));
			oldPrice = Float.parseFloat(request.getParameter("oldPrice"));
		} catch (NumberFormatException e) {
			// Handle the exception
			e.printStackTrace();
		}

		Cart cart = null;

		Object objCart = session.getAttribute("cart");
		if (objCart != null) {
			cart = (Cart) objCart;
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		cart.addCartItem(productId, productName, img_url, oldPrice, discount, quantity);

		// Set cart size as a request attribute
		int cartSize = cart.getCartItems().size();
		request.setAttribute("cartSize", cartSize);

	}

	private void deleteCart(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String productId = request.getParameter("productId");
		Cart cart = null;

		Object objCart = session.getAttribute("cart");
		if (objCart != null) {
			cart = (Cart) objCart;
		} else {
			cart = new Cart();
		}
		cart.deleteCartItem(productId);
	}
	
	private void updateCart(HttpServletRequest request) {
		HttpSession session = request.getSession();
		int quantity = 0;
		quantity = Integer.parseInt(request.getParameter("quantity"));
		String productId = request.getParameter("productId");
		
		Cart cart = null;
		
		Object objCart = session.getAttribute("cart");
		if(objCart != null) {
			cart = (Cart) objCart;
		}else {
			cart = new Cart();
		}
		cart.updateCartItem(productId, quantity);
	}
	
}