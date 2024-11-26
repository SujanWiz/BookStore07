package com.servlet;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/deleteOldBook") // The URL pattern for the servlet
public class DeleteOldBook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch the bookId from the request
        int bookId = Integer.parseInt(request.getParameter("bookId"));

        // Create a BookDAOImpl object to interact with the database
        try (Connection conn = DBConnect.getConnection()) {
            BookDAOImpl dao = new BookDAOImpl(conn);

            // Try to delete the book by its ID
            boolean isDeleted = dao.deleteOldBook(bookId);

            HttpSession session = request.getSession();
            if (isDeleted) {
                // If deletion is successful, set a success message and redirect
                session.setAttribute("succMsg", "Old book deleted successfully!");
                response.sendRedirect("manage_books.jsp"); // Redirect to the book management page
            } else {
                // If deletion fails, set an error message and redirect
                session.setAttribute("errorMsg", "Something went wrong. Please try again.");
                response.sendRedirect("manage_books.jsp"); // Redirect back to the management page
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to an error page if an exception occurs
        }
    }
}
