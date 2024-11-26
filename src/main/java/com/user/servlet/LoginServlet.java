package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Initialize DAO
            UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
            HttpSession session = req.getSession();

            // Retrieve email and password from the request
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            System.out.println("Login attempt: " + email + " " + password);

            // Check if user is admin
            if ("admin.@gmail.com".equals(email) && "admin".equals(password)) {
                User adminUser = new User();
                adminUser.setName("Admin"); // Set admin-specific details if necessary
                session.setAttribute("userobj", adminUser);
                resp.sendRedirect("admin/home.jsp");
            } else {
                // Check user login via DAO
                User us = dao.login(email, password);
                if (us != null) {
                    session.setAttribute("userobj", us);
                    resp.sendRedirect("index.jsp");
                } else {
                    // Set error message and redirect to login page
                    session.setAttribute("failedMsg", "Invalid Email or Password");
                    resp.sendRedirect("login.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Redirect to an error page or set an error attribute if needed
            resp.sendRedirect("error.jsp");
        }
    }
}
