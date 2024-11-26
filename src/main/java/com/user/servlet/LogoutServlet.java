package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve the current session if it exists
        HttpSession session = req.getSession(false);

        if (session != null) {
            // Add an optional message for logout success
            session.setAttribute("logoutMsg", "You have been successfully logged out.");
            // Invalidate the session to log out the user
            session.invalidate();
        }

        // Redirect to the login page
        resp.sendRedirect("login.jsp");
    }
}
