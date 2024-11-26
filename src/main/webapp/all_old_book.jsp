<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.entity.BookDetails"%>
<%@ page import="java.util.List"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>All Old Books</title>
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
</style>
</head>
<body>
    <%@ include file="all_component/navbar.jsp"%>

    <!-- Header Section -->
    <div class="container-fluid py-3" style="background-color: #f8f9fa;">
        <h2 class="text-center">All Old Books</h2>
    </div>

    <!-- Old Books Section -->
    <div class="container section">
        <div class="row">
            <%
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            List<BookDetails> oldBooks = dao.getAllOldBook(); // Ensure DAO has this method
            if (oldBooks != null && !oldBooks.isEmpty()) {
                for (BookDetails book : oldBooks) {
            %>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body text-center">
                        <img src="<%=book.getPhotoName()%>"
                            alt="<%=book.getBookname()%>" class="img-thumbnail">
                        <h5 class="card-title mt-2"><%=book.getBookname()%></h5>
                        <p class="card-text">
                            by <%=book.getAuthor()%>
                        </p>
                        <div class="d-flex justify-content-center">
                            <a href="#" class="btn btn-success btn-sm mr-2">View Details</a>
                            <a href="#" class="btn btn-secondary btn-sm"><%=book.getPrice()%> 
                                <i class="fa-solid fa-indian-rupee-sign"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            } else {
            %>
            <p class="text-center">No old books available.</p>
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
