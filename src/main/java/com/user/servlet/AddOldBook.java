package com.servlet;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/addOldBook")  // Remove ".java" extension from the URL pattern
public class AddOldBook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch data from form
        String bookName = request.getParameter("bookName");
        String author = request.getParameter("author");
        String priceStr = request.getParameter("price");
        String category = request.getParameter("category");
        String condition = request.getParameter("condition");
        String description = request.getParameter("description");
        int userId = Integer.parseInt(request.getParameter("userId")); // Assuming user ID is passed
        
        double price = 0.0;

        // Parse price safely
        try {
            price = Double.parseDouble(priceStr);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        // Prepare book details object
        BookDetails book = new BookDetails();
        book.setBookname(bookName);
        book.setAuthor(author);
        book.setPrice(price);
        book.setCategory(category);
        book.setCondition(condition);
        book.setDescription(description);
        book.setUserId(userId); // Owner of the old book
        book.setOldBook(true); // Mark this as an old book

        // Add book to database
        try {
            Connection conn = DBConnect.getConnection();
            BookDAOImpl dao = new BookDAOImpl(conn);

            boolean isAdded = dao.addOldBook(book);

            HttpSession session = request.getSession();
            if (isAdded) {
                session.setAttribute("succMsg", "Old book added successfully!");
                response.sendRedirect("sell_books.jsp");
            } else {
                session.setAttribute("errorMsg", "Something went wrong. Please try again.");
                response.sendRedirect("sell_books.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to error page if needed
        }
    }
}
