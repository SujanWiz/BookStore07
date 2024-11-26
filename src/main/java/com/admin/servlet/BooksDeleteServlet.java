package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

@WebServlet("/delete_book")
public class DeleteBookServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Get the book ID from the request parameter
            int bookId = Integer.parseInt(req.getParameter("id"));

            // Initialize the DAO
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());

            // Call the delete method in DAO
            boolean isDeleted = dao.deleteBook(bookId);

            // Manage session messages
            HttpSession session = req.getSession();
            if (isDeleted) {
                session.setAttribute("succMsg", "Book deleted successfully.");
            } else {
                session.setAttribute("failedMsg", "Failed to delete the book. Try again.");
            }

            // Redirect back to the books page
            resp.sendRedirect("all_books.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = req.getSession();
            session.setAttribute("failedMsg", "Something went wrong. Please try again.");
            resp.sendRedirect("all_books.jsp");
        }
    }
}
