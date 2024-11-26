package com.servlet;

import com.DAO.OrderDAOImpl;
import com.DB.DBConnect;
import com.entity.Order;
import com.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/order") // URL pattern for the servlet
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handle GET requests (display the order form or details)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        if (currentUser == null) {
            response.sendRedirect("login.jsp"); // If user is not logged in, redirect to login page
        } else {
            // Show order form (this could be for creating a new order or viewing previous orders)
            request.getRequestDispatcher("orderForm.jsp").forward(request, response); // Forward to JSP for order form
        }
    }

    // Handle POST requests (process the order submission and payment)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get order details from the form
        String productName = request.getParameter("productName");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        double totalAmount = quantity * price; // Calculate total amount

        // Fetch user information from session
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        if (currentUser == null) {
            response.sendRedirect("login.jsp"); // If user is not logged in, redirect to login page
            return;
        }

        // Create an Order object with the order details
        Order newOrder = new Order();
        newOrder.setUserId(currentUser.getId()); // Set the logged-in user ID
        newOrder.setProductName(productName);
        newOrder.setQuantity(quantity);
        newOrder.setPrice(price);
        newOrder.setTotalAmount(totalAmount);

        // Validate payment (for now, we'll use a simple validation method, but this can be replaced with real payment gateway integration)
        boolean isPaymentSuccessful = validatePayment(totalAmount); // This is a stub method for payment validation

        if (isPaymentSuccessful) {
            // Initialize DAO class and perform the insert operation into DB
            try (Connection conn = DBConnect.getConnection()) {
                OrderDAOImpl dao = new OrderDAOImpl(conn);
                boolean isOrderPlaced = dao.placeOrder(newOrder); // Place the order in the database

                if (isOrderPlaced) {
                    session.setAttribute("succMsg", "Order placed and payment successful!");
                    response.sendRedirect("orderConfirmation.jsp"); // Redirect to order confirmation page
                } else {
                    session.setAttribute("errorMsg", "Unable to place the order. Please try again.");
                    response.sendRedirect("orderForm.jsp"); // Stay on the same page and show error
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp"); // Redirect to an error page if any exception occurs
            }
        } else {
            // Payment failed, redirect back to order form with an error message
            session.setAttribute("errorMsg", "Payment failed. Please try again.");
            response.sendRedirect("orderForm.jsp");
        }
    }

    // Stub method for payment validation (Replace this with actual payment gateway integration, e.g., Stripe or PayPal)
    private boolean validatePayment(double amount) {
        // In a real-world scenario, here you would integrate with a payment gateway.
        // This could involve calling Stripe's API or PayPal's API to process the payment.
        // For now, we will simulate a successful payment for simplicity.
        return true; // Assume payment is always successful
    }
}
