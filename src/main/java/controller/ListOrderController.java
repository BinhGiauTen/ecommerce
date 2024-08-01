package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.OrderDAO;
import models.Order;
import models.OrderItem;

@WebServlet("/ListOrder")
public class ListOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderDAO oDao = new OrderDAO();
		ArrayList<Order> listO = oDao.getAllOrder();
		request.setAttribute("listO", listO);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/jsp/listOrder.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderDAO oDao = new OrderDAO();
		String orderIdStr = request.getParameter("orderId");
		int orderId = Integer.parseInt(orderIdStr);
        ArrayList<OrderItem> listOrderItem = oDao.getOrderItemByOrderId(orderId);
        request.setAttribute("listOrderItem", listOrderItem);
        
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/jsp/orderDetail.jsp");
        dispatcher.forward(request, response);
	}

}
