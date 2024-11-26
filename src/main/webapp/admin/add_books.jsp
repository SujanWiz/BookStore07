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
