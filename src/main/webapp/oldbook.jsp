<%@ page import="java.sql.*" %>
<%@ page import="com.entity.BookDetails" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%-- Set the content type for the page --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Old Books</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Old Books Collection</h1>

    <div class="books-container">
        <% 
            // Initialize database connection
            Connection conn = null;
            PreparedStatement pst = null;
            ResultSet rs = null;

            try {
                // Get the database connection from DBConnect class
                conn = DBConnect.getConnection();

                // Query to fetch old books from the database
                String query = "SELECT * FROM old_books";
                pst = conn.prepareStatement(query);
                rs = pst.executeQuery();

                // Check if there are any old books available
                if (!rs.isBeforeFirst()) {
        %>
                <p>No old books are available at the moment.</p>
        <%
                } else {
                    // Loop through the result set and display each old book
                    while (rs.next()) {
                        int bookId = rs.getInt("book_id");
                        String bookName = rs.getString("book_name");
                        String author = rs.getString("author");
                        double price = rs.getDouble("price");
                        String photoName = rs.getString("photo_name");
                        String description = rs.getString("description");
        %>
                        <div class="book-item">
                            <img src="images/<%= photoName %>" alt="<%= bookName %>" class="book-image">
                            <h2><%= bookName %></h2>
                            <p><strong>Author:</strong> <%= author %></p>
                            <p><strong>Price:</strong> $<%= price %></p>
                            <p><strong>Description:</strong> <%= description %></p>
                            <form action="AddToCartServlet" method="post">
                                <input type="hidden" name="bookId" value="<%= bookId %>">
                                <input type="submit" value="Add to Cart" class="cart-button">
                            </form>
                        </div>
        <%
                    } // end while loop
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                // Close the database resources
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (pst != null) try { pst.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
    </div>
</body>
</html>

