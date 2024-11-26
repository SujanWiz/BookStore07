package com.servlet;

import com.DAO.CartDAOImpl;
import com.entity.Cart;
import com.entity.BookDetails;
import com.DB.DBConnect;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class CartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart((int) session.getAttribute("userId"), new ArrayList<>());
            session.setAttribute("cart", cart);
        }

        if ("add".equals(action)) {
            int bookId = Integer.parseInt(request.getParameter("book_id"));
            BookDetails book = new BookDAOImpl(DBConnect.getConn()).getBookById(bookId);
            cart.addItem(book);
        } else if ("remove".equals(action)) {
            int bookId = Integer.parseInt(request.getParameter("book_id"));
            BookDetails book = new BookDAOImpl(DBConnect.getConn()).getBookById(bookId);
            cart.removeItem(book);
        } else if ("clear".equals(action)) {
            cart.clearCart();
        }

        response.sendRedirect("viewCart.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Display the cart content
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart((int) session.getAttribute("userId"), new ArrayList<>());
            session.setAttribute("cart", cart);
        }

        request.setAttribute("cart", cart);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewCart.jsp");
        dispatcher.forward(request, response);
    }
}
