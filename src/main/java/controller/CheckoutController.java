package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderDAO;
import models.Account;
import models.Cart;
import models.CartItem;
import models.EmailSender;
import models.Order;
import models.OrderItem;

@WebServlet("/Checkout")
public class CheckoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        Account account = (Account) session.getAttribute("account");
        
        String userName = request.getParameter("userName");
        String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String paymentMethod = request.getParameter("paymentMethod");
		
		
        if (cart != null) {
            Order order = new Order();
            order.setAccount(account);
            order.setUserName(userName);
            order.setPhone(phone);
            order.setEmail(email);
            order.setAddress(address);
            order.setPaymentMethod(paymentMethod);
            order.setTotalPrice(cart.getTotalPrice());

            List<OrderItem> orderItems = new ArrayList<>();
            for (CartItem cartItem : cart.getCartItems()) {
                OrderItem orderItem = new OrderItem();
                float oldPrice = cartItem.getOldPrice();
                int discount = cartItem.getDiscount();
                float price = oldPrice - (oldPrice* discount)/100;
                orderItem.setProductId(cartItem.getProductId());
                orderItem.setProductName(cartItem.getProductName());
                orderItem.setQuantity(cartItem.getQuantity());
                orderItem.setPrice(price);
                orderItems.add(orderItem);
            }
            order.setOrderItems(orderItems);

            boolean isOrderSaved = OrderDAO.saveOrder(order);
            if (isOrderSaved) {
            	try {
                    EmailSender.sendOrderConfirmation(email, userName, address, orderItems, cart.getTotalPrice());
                } catch (MessagingException e) {
                    e.printStackTrace();
                }
                session.removeAttribute("cart");
                response.sendRedirect("/Ecommerce/Home?orderSuccess=true");
            } else {
                response.sendRedirect("/jsp/checkoutFailure.jsp");
            }
        } else {
            response.sendRedirect("/Cart");
        }
	}

}
