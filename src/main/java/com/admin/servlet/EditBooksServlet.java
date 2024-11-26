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
import com.entity.BookDetails;

@WebServlet("/update_book")
public class EditBooksServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Retrieve parameters from the form
            int id = Integer.parseInt(req.getParameter("id"));
            String bookName = req.getParameter("bname");
            String author = req.getParameter("author");
            double price = Double.parseDouble(req.getParameter("price"));
            String status = req.getParameter("status");

            // Create a BookDetails object and set its properties
            BookDetails book = new BookDetails();
            book.setBookId(id);
            book.setBookname(bookName);
            book.setAuthor(author);
            book.setPrice(price);
            book.setStatus(status);

            // Use DAO to update the book details
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            boolean isUpdated = dao.updateEditBooks(book);

            // Create an HTTP session to store messages
            HttpSession session = req.getSession();

            // Redirect based on the update result
            if (isUpdated) {
                session.setAttribute("succMsg", "Book updated successfully.");
                resp.sendRedirect("all_books.jsp");
            } else {
                session.setAttribute("failedMsg", "Something went wrong on the server.");
                resp.sendRedirect("all_books.jsp");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            HttpSession session = req.getSession();
            session.setAttribute("failedMsg", "Invalid data format.");
            resp.sendRedirect("all_books.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = req.getSession();
            session.setAttribute("failedMsg", "An error occurred while processing the request.");
            resp.sendRedirect("all_books.jsp");
        }
    }
}
