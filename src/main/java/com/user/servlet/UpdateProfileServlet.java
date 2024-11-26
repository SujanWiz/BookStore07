package com.servlet;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/updateProfile") // URL pattern for the servlet
public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handle GET requests (initial profile page or to show existing profile)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch user data from the session (or redirect if no session exists)
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        if (currentUser == null) {
            response.sendRedirect("login.jsp"); // If user is not logged in, redirect to login page
        } else {
            // Show the current user profile
            request.setAttribute("user", currentUser);
            request.getRequestDispatcher("updateProfile.jsp").forward(request, response); // Forward to JSP for editing
        }
    }

    // Handle POST requests (when the user submits the form to update their profile)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get new profile details from the form
        String newName = request.getParameter("name");
        String newEmail = request.getParameter("email");
        String newPhone = request.getParameter("phone");
        int userId = Integer.parseInt(request.getParameter("userId")); // Assuming userId is passed in the form

        // Create a User object with updated details
        User updatedUser = new User();
        updatedUser.setId(userId);
        updatedUser.setName(newName);
        updatedUser.setEmail(newEmail);
        updatedUser.setPhone(newPhone);

        // Initialize DAO class and perform the update operation
        try (Connection conn = DBConnect.getConnection()) {
            UserDAOImpl dao = new UserDAOImpl(conn);
            boolean isUpdated = dao.updateUserProfile(updatedUser); // Update the profile in DB

            HttpSession session = request.getSession();
            if (isUpdated) {
                // If update is successful, update the session with new user details
                session.setAttribute("user", updatedUser);
                session.setAttribute("succMsg", "Profile updated successfully!");
                response.sendRedirect("profile.jsp"); // Redirect to profile page
            } else {
                // If update fails, show error message
                session.setAttribute("errorMsg", "Unable to update profile. Please try again.");
                response.sendRedirect("updateProfile.jsp"); // Stay on the same page
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to an error page
        }
    }
}
