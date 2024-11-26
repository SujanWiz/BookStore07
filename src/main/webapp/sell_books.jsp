<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sell Your Book</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css"> <!-- Replace with local path if needed -->
    <style>
        body {
            background-color: #f9f9f9;
            color: #333;
        }
        .sell-book-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-group label {
            font-weight: bold;
        }
        .btn {
            transition: background-color 0.3s, transform 0.3s;
        }
        .btn:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="container sell-book-container">
        <h2 class="text-center">Sell Old Book</h2>

        <!-- Success and Error Messages -->
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success" role="alert">
                ${successMessage}
            </div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger" role="alert">
                ${errorMessage}
            </div>
        </c:if>

        <!-- Sell Book Form -->
        <form action="SellBookServlet" method="post" enctype="multipart/form-data">
            <div class="form-group mb-3">
                <label for="bookName">Book Name</label>
                <input type="text" class="form-control" id="bookName" name="bookName" placeholder="Enter book name" required>
            </div>
            <div class="form-group mb-3">
                <label for="author">Author</label>
                <input type="text" class="form-control" id="author" name="author" placeholder="Enter author name" required>
            </div>
            <div class="form-group mb-3">
                <label for="category">Category</label>
                <select class="form-control" id="category" name="category" required>
                    <option value="" disabled selected>--Select Category--</option>
                    <option value="Fiction">Fiction</option>
                    <option value="Non-Fiction">Non-Fiction</option>
                    <option value="Science">Science</option>
                    <option value="Technology">Technology</option>
                    <option value="Education">Education</option>
                    <option value="Other">Other</option>
                </select>
            </div>
            <div class="form-group mb-3">
                <label for="price">Price (₹)</label>
                <input type="number" class="form-control" id="price" name="price" placeholder="Enter selling price" required>
            </div>
            <div class="form-group mb-3">
                <label for="description">Description</label>
                <textarea class="form-control" id="description" name="description" rows="4" placeholder="Provide a brief description of the book" required></textarea>
            </div>
            <div class="form-group mb-3">
                <label for="bookImage">Upload Book Image</label>
                <input type="file" class="form-control" id="bookImage" name="bookImage" accept="image/*" required>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">List Your Book</button>
                <a href="user_profile.jsp" class="btn btn-secondary">Back to Profile</a>
            </div>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script> <!-- Replace with local path if needed -->
</body>
</html>
