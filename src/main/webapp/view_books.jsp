<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.entity.BookDetails"%>
<%@ page import="java.util.List"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Book Details</title>
<%@ include file="all_component/allCss.jsp"%>
<style>
    /* Custom CSS styles */
    .book-detail {
        padding: 30px 0;
        background-color: #f2f2f2;
    }
    .book-detail img {
        max-width: 100%;
        height: auto;
    }
    .book-info {
        margin-top: 20px;
    }
    .book-info h3 {
        margin-bottom: 20px;
    }
    .btn {
        transition: background-color 0.3s, transform 0.3s;
    }
    .btn:hover {
        transform: scale(1.05);
    }
    .footer {
        background-color: #333;
        color: white;
        padding: 20px 0;
        text-align: center;
    }
    .action-buttons {
        margin-top: 20px;
    }
    .action-buttons .btn {
        margin-right: 15px;
    }
    .icon {
        margin-right: 5px;
    }
    .contact-info {
        margin-top: 20px;
        font-size: 1.1em;
    }
</style>
</head>
<body>
    <%@ include file="all_component/navbar.jsp"%>

    <div class="container book-detail">
        <%
            // Retrieve the book ID from the request parameter
            String bookId = request.getParameter("book_id");
            
            if (bookId != null) {
                BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                try {
                    // Get the book details from the database by book_id
                    BookDetails book = dao.getBookById(Integer.parseInt(bookId));
                    
                    if (book != null) {
                        // Format the price to show currency symbol
                        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance();
                        String formattedPrice = currencyFormat.format(book.getPrice());
                        
                        // Define old book threshold (e.g., books published before 2014 are considered old)
                        int currentYear = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
                        boolean isOldBook = book.getPublicationYear() < (currentYear - 10); // Books older than 10 years
        %>
        <div class="row">
            <div class="col-md-6">
                <!-- Book Image -->
                <img src="<%= book.getPhotoName() %>" alt="<%= book.getBookname() %>" class="img-fluid">
            </div>
            <div class="col-md-6 book-info">
                <h3><%= book.getBookname() %></h3>
                <p><strong>Author:</strong> <%= book.getAuthor() %></p>
                <p><strong>Price:</strong> <%= formattedPrice %> <i class="fa-solid fa-indian-rupee-sign"></i></p>
                <p><strong>Category:</strong> <%= book.getCategory() %></p>
                <p><strong>Description:</strong> <%= book.getDescription() %></p>

                <!-- Add to Cart Button -->
                <form action="AddToCartServlet" method="post">
                    <input type="hidden" name="book_id" value="<%= book.getId() %>">
                    <input type="hidden" name="book_name" value="<%= book.getBookname() %>">
                    <input type="hidden" name="book_price" value="<%= book.getPrice() %>">
                    <button type="submit" class="btn btn-primary btn-lg mt-3">Add to Cart</button>
                </form>

                <!-- Action buttons below -->
                <div class="action-buttons">
                    <!-- Money Bills Icon -->
                    <a href="#" class="btn btn-info btn-sm">
                        <i class="fa-solid fa-money-bill-wave icon"></i> Money Bills
                    </a>

                    <!-- Return Icon -->
                    <a href="#" class="btn btn-warning btn-sm">
                        <i class="fa-solid fa-rotate-left icon"></i> Return
                    </a>

                    <!-- Delivery Icon -->
                    <a href="#" class="btn btn-success btn-sm">
                        <i class="fa-solid fa-truck icon"></i> Shipping
                    </a>
                </div>

                <!-- Display contact info based on category -->
                <% if ("old".equals(book.getCategory())) { %>
                    <div class="contact-info">
                        <p><strong>Continue Shopping:</strong> <i class="fa-solid fa-envelope"></i> <a href="mailto:seller@example.com">seller@example.com</a></p>
                    </div>
                <% } else { %>
                    <div class="contact-info">
                        <p><strong>Contact to Seller:</strong> <i class="fa-solid fa-envelope"></i> <a href="mailto:seller@example.com">seller@example.com</a></p>
                    </div>
                <% } %>

            </div>
        </div>
        <%
                    } else {
        %>
        <p class="text-center">Book not found.</p>
        <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("<p>Error fetching book details.</p>");
                }
            } else {
        %>
        <p class="text-center">Invalid Book ID.</p>
        <%
            }
        %>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2024 Online Book Store. All rights reserved.</p>
    </div>

</body>
</html>
