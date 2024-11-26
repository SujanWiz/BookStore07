<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : All Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin : Add Books</title>
    <%@ include file="allCss.jsp" %>
</head>
<body style="background-color: #f0f2f2;">
    <%@ include file="navbar.jsp" %>

    <!-- Redirect to login if user object is null -->
    <c:if test="${empty userobj}">
        <c:redirect url="../login.jsp" />
    </c:if>
    
    <h3 class="text-center">Hello Admin</h3>
    
    <c:if test="${not empty succMsg }">
						<h5 class="text-center text-success">${succMsg }</h5>
						<c:remove var="succMsg" scope="session"/>
						</c:if>
						
			<c:if test="${not empty failedMsg }">
						<h5 class="text-center text-danger">${failedMsg }</h5>
						<c:remove var="failedMsg" scope="session"/>
						</c:if>			

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center">Add Books</h4>

                        <!-- Success Message -->
                        <c:if test="${not empty succMsg}">
                            <p class="text-center text-success">${succMsg}</p>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>

                        <!-- Error Message -->
                        <c:if test="${not empty failedMsg}">
                            <p class="text-center text-danger">${failedMsg}</p>
                            <c:remove var="failedMsg" scope="session" />
                        </c:if>

                        <!-- Add Book Form -->
                        <form action="../add_books" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="bookName">Book Name*</label>
                                <input name="bname" type="text" class="form-control" id="bookName" required>
                            </div>

                            <div class="form-group">
                                <label for="authorName">Author Name*</label>
                                <input name="author" type="text" class="form-control" id="authorName" required>
                            </div>

                            <div class="form-group">
                                <label for="price">Price*</label>
                                <input name="price" type="number" class="form-control" id="price" step="0.01" required>
                            </div>

                            <div class="form-group">
                                <label for="categories">Book Categories*</label>
                                <select name="categories" class="form-control" id="categories" required>
                                    <option selected disabled>-- Select --</option>
                                    <option value="New">New Book</option>
                                    <option value="Old">Old Book</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="status">Book Status*</label>
                                <select name="status" class="form-control" id="status" required>
                                    <option selected disabled>-- Select --</option>
                                    <option value="Active">Active</option>
                                    <option value="Inactive">Inactive</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="bookImage">Upload Photo*</label>
                                <input name="bimg" type="file" class="form-control-file" id="bookImage" required>
                            </div>

                            <button type="submit" class="btn btn-primary btn-block">Add Book</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div style="margin-top: 40px;">
        <%@ include file="footer.jsp" %>
    </div>
</body>
</html>
	
	
	<div class="container mt-4">
		<h3 class="text-center">All Books</h3>

		<%
			try {
				// Fetch the list of books from the database
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
				List<BookDetails> list = dao.getAllBooks(); // Assuming `getAllBooks()` exists in DAO

				if (list != null && !list.isEmpty()) {
		%>
		<table class="table table-bordered">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Image</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Categories</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (BookDetails b : list) { // Loop through the book list
				%>
				<tr>
					<td><img src="book_images/<%= b.getPhotoName() %>" alt="Book Image" style="width: 50px; height: 50px;"></td>
					<td><%= b.getBookname() %></td>
					<td><%= b.getAuthor() %></td>
					<td><%= b.getPrice() %></td>
					<td><%= b.getBookCategory() %></td>
					<td><%= b.getStatus() %></td>
					<td>
						<a href="edit_book.jsp?id=<%= b.getBookId() %>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i>Edit</a>
						<a href="../delete_book?id=<%= b.getBookId() %>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this book?');"><i class="fa-solid fa-trash-can"></i>Delete</a>
					</td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<%
				} else {
					out.println("<h5 class='text-center text-danger'>No books found!</h5>");
				}
			} catch (Exception e) {
				e.printStackTrace();
				out.println("<h5 class='text-center text-danger'>An error occurred while fetching books!</h5>");
			}
		%>
	</div>

	<div style="margin-top: 130px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>
