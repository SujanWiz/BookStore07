package com.servlet;

import com.DAO.BookOrderDAOImpl;
import com.DB.DBConnect;
import com.entity.BookOrder;
import com.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/bookOrder") // URL pattern for the servlet
public class BookOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handle GET requests (display the book order form)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        if (currentUser == null) {
            response.sendRedirect("login.jsp"); // If user is not logged in, redirect to login page
        } else {
            // Show book order form
            request.getRequestDispatcher("bookOrderForm.jsp").forward(request, response); // Forward to JSP for order form
        }
    }

    // Handle POST requests (process the book order submission and payment)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get book order details from the form
        String bookTitle = request.getParameter("bookTitle");
        String author = request.getParameter("author");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        double totalAmount = quantity * price; // Calculate total amount for the order

        // Fetch user information from session
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        if (currentUser == null) {
            response.sendRedirect("login.jsp"); // If user is not logged in, redirect to login page
            return;
        }

        // Create a BookOrder object with the order details
        BookOrder newOrder = new BookOrder();
        newOrder.setUserId(currentUser.getId()); // Set the logged-in user ID
        newOrder.setBookTitle(bookTitle);
        newOrder.setAuthor(author);
        newOrder.setQuantity(quantity);
        newOrder.setPrice(price);
        newOrder.setTotalAmount(totalAmount);

        // Validate payment (for now, we'll use a simple validation method)
        boolean isPaymentSuccessful = validatePayment(totalAmount); // This is a stub method for payment validation

        if (isPaymentSuccessful) {
            // Initialize DAO class and perform the insert operation into the DB
            try (Connection conn = DBConnect.getConnection()) {
                BookOrderDAOImpl dao = new BookOrderDAOImpl(conn);
                boolean isOrderPlaced = dao.placeBookOrder(newOrder); // Place the order in the database

                if (isOrderPlaced) {
                    session.setAttribute("succMsg", "Book order placed successfully and payment is successful!");
                    response.sendRedirect("orderConfirmation.jsp"); // Redirect to order confirmation page
                } else {
                    session.setAttribute("errorMsg", "Unable to place the order. Please try again.");
                    response.sendRedirect("bookOrderForm.jsp"); // Stay on the same page and show error
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp"); // Redirect to an error page if any exception occurs
            }
        } else {
            // Payment failed, redirect back to order form with an error message
            session.setAttribute("errorMsg", "Payment failed. Please try again.");
            response.sendRedirect("bookOrderForm.jsp");
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
