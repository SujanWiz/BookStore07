<%@ page import="com.entity.BookDetails"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Book</title>
    <%@ include file="allCss.jsp" %>
</head>
<body>
    <%@ include file="navbar.jsp" %>

    <div class="container mt-4">
        <h3 class="text-center">Edit Book Details</h3>

    

        <form action="update_book" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="<%= book.getBookId() %>">

            <div class="form-group">
                <label>Book Name</label>
                <input type="text" name="bname" class="form-control" value="<%= book.getBookname() %>" required>
            </div>

            <div class="form-group">
                <label>Author</label>
                <input type="text" name="author" class="form-control" value="<%= book.getAuthor() %>" required>
            </div>

            <div class="form-group">
                <label>Price</label>
                <input type="number" step="0.01" name="price" class="form-control" value="<%= book.getPrice() %>" required>
            </div>

            <div class="form-group">
                <label>Category</label>
                <input type="text" name="categories" class="form-control" value="<%= book.getBookCategory() %>" required>
            </div>

            <div class="form-group">
                <label>Status</label>
                <select name="status" class="form-control" required>
                    <option value="Available" <%= "Available".equals(book.getStatus()) ? "selected" : "" %>>Available</option>
                    <option value="Unavailable" <%= "Unavailable".equals(book.getStatus()) ? "selected" : "" %>>Unavailable</option>
                </select>
            </div>

            <div class="form-group">
                <label>Book Image</label>
                <input type="file" name="bimg" class="form-control">
                <small>Current Image: <%= book.getPhotoName() %></small>
            </div>

            <div class="form-group">
                <label>Uploaded By</label>
                <input type="text" name="email" class="form-control" value="<%= book.getEmail() %>" readonly>
            </div>

            <button type="submit" class="btn btn-primary">Update Book</button>
        </form>

        <%
                    } else {
                        out.println("<h5 class='text-danger text-center'>Book not found!</h5>");
                    }
                } catch (Exception e) {
                    out.println("<h5 class='text-danger text-center'>Error fetching book details: " + e.getMessage() + "</h5>");
                }
            } else {
                out.println("<h5 class='text-danger text-center'>Invalid Book ID!</h5>");
            }
        %>

    </div>

    <div style="margin-top: 100px;">
        <%@ include file="footer.jsp" %>
    </div>
</body>
</html>
