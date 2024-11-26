<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.entity.BookDetails"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ebook: Index</title>
    <%@ include file="all_component/allCss.jsp" %>
    <style>
        /* Background and card hover effects */
        .back-img {
            background: url("img/canva.jpg");
            height: 40vh;
            width: 100%;
            background-size: cover;
            background-repeat: no-repeat;
            position: relative;
        }
        .back-img::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5);
        }
        .back-img h2 {
            position: relative;
            z-index: 1;
            color: white;
            font-weight: bold;
            padding-top: 10%;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
        }
        .crd-ho {
            transition: 0.3s;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border: none;
        }
        .crd-ho:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            background-color: #f5f5f5;
        }
        .card img {
            height: 200px;
            width: auto;
            margin: auto;
            display: block;
        }
        .btn {
            transition: background-color 0.3s, transform 0.3s;
        }
        .btn:hover {
            transform: scale(1.05);
        }
        .section {
            padding: 50px 0;
        }
        .section h3 {
            margin-bottom: 30px;
            font-weight: bold;
        }
        .footer {
            background-color: #333;
            color: white;
            padding: 20px 0;
            text-align: center;
        }
    </style>
</head>
<body>
<%
    User u = (User) session.getAttribute("userobj");
%>
<%@ include file="all_component/navbar.jsp" %>

<!-- Background image section -->
<div class="container-fluid back-img">
    <h2 class="text-center">Online Book Store</h2>
</div>

<!-- Recent Books Section -->
<div class="container section">
    <h3 class="text-center">Recent Books</h3>
    <div class="row">
        <%
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            List<BookDetails> recentBooks = dao.getRecentBooks(); // Ensure DAO has this method
            if (recentBooks != null && !recentBooks.isEmpty()) {
                for (BookDetails book : recentBooks) {
        %>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img src="<%= book.getPhotoName() != null ? book.getPhotoName() : "default.jpg" %>" 
                         alt="<%= book.getBookname() %>" class="img-thumbnail">
                    <h5 class="card-title"><%= book.getBookname() %></h5>
                    <p class="card-text">by <%= book.getAuthor() %></p>
                    <div class="d-flex justify-content-center">
                        <a href="view_books.jsp?bid=<%= book.getBookId() %>" 
                           class="btn btn-success btn-sm mr-2">View Details</a>
                        <a href="#" class="btn btn-secondary btn-sm">
                            ₹<%= book.getPrice() %>
                        </a>
                    </div>
                    <form action="CartServlet" method="post" class="mt-2">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="book_id" value="<%= book.getBookId() %>">
                        <button type="submit" class="btn btn-primary btn-sm">Add to Cart</button>
                    </form>
                </div>
            </div>
        </div>
        <%
                }
            } else {
        %>
        <p class="text-center">No recent books available.</p>
        <%
            }
        %>
    </div>
</div>

<!-- Footer -->
<div class="footer">
    <p>&copy; 2024 Online Book Store. All rights reserved.</p>
</div>
</body>
</html>
