<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.entity.BookDetails"%>
<%@ page import="java.util.List"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>All New Books</title>
<%@ include file="all_component/allCss.jsp"%>
<style>
/* CSS for the layout and design */
.card {
    transition: 0.3s;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border: none;
    margin-bottom: 20px;
}

.card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
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

body {
    background-color: #f2f2f2;
    color: #333;
}

.footer {
    background-color: #333;
    color: white;
    padding: 20px 0;
    text-align: center;
}

#toast {
    position: fixed;
    top: 20px;
    right: 20px;
    padding: 10px 20px;
    background: #28a745;
    color: white;
    border-radius: 5px;
    z-index: 1000;
    opacity: 0;
    transition: opacity 0.5s ease-in-out;
}

#toast.display {
    opacity: 1;
}
</style>
</head>
<body>

<%
    // Toast notification message
    String addCartMessage = (String) request.getAttribute("addCart");
    if (addCartMessage != null && !addCartMessage.isEmpty()) {
%>
<div id="toast"><%= addCartMessage %></div>
<script>
    function showToast() {
        const toast = document.getElementById('toast');
        toast.classList.add('display');
        setTimeout(() => toast.classList.remove('display'), 2000);
    }
    showToast();
</script>
<%
    }
%>

<%@ include file="all_component/navbar.jsp"%>

<!-- Header Section -->
<div class="container-fluid py-3" style="background-color: #f8f9fa;">
    <h2 class="text-center">All New Books</h2>
</div>

<!-- New Books Section -->
<div class="container section">
    <div class="row">
        <%
        // Fetching the list of new books
        BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
        List<BookDetails> newBooks = dao.getAllNewBook(); // Ensure DAO has this method
        if (newBooks != null && !newBooks.isEmpty()) {
            for (BookDetails book : newBooks) {
        %>
        <div class="col-md-3">
            <div class="card">
                <div class="card-body text-center">
                    <img src="<%= book.getPhotoName() %>" alt="<%= book.getBookname() %>" class="img-thumbnail">
                    <h5 class="card-title mt-2"><%= book.getBookname() %></h5>
                    <p class="card-text">
                        by <%= book.getAuthor() %>
                    </p>
                    <div class="d-flex justify-content-center">
                        <a href="view_books.jsp?bid=<%= book.getBookId() %>" class="btn btn-success btn-sm mr-2">View Details</a>
                        <a href="#" class="btn btn-secondary btn-sm"><%= book.getPrice() %> 
                            <i class="fa-solid fa-indian-rupee-sign"></i>
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
        <p class="text-center">No new books available.</p>
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
