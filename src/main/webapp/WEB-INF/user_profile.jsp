<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css"> <!-- Replace with local path if needed -->
    <style>
        body {
            background-color: #f9f9f9;
            color: #333;
        }
        .profile-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .profile-header {
            margin-bottom: 30px;
            text-align: center;
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
    <div class="container profile-container">
        <h2 class="text-center profile-header">User Profile</h2>

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

        <!-- Profile Information Form -->
        <form action="UpdateProfile" method="post">
            <div class="form-group mb-3">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" value="${user.name}" required>
            </div>
            <div class="form-group mb-3">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" value="${user.email}" required>
            </div>
            <div class="form-group mb-3">
                <label for="phone">Phone Number</label>
                <input type="text" class="form-control" id="phone" name="phone" value="${user.phone}" required>
            </div>
            <div class="form-group mb-3">
                <label for="currentPassword">Current Password</label>
                <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
            </div>
            <div class="form-group mb-3">
                <label for="newPassword">New Password</label>
                <input type="password" class="form-control" id="newPassword" name="newPassword">
            </div>
            <button type="submit" class="btn btn-primary">Save Changes</button>
        </form>

        <hr>

        <!-- Additional Options -->
        <div class="mt-4">
            <h4>Additional Options</h4>
            <div class="d-flex flex-column">
                <a href="trackOrder.jsp" class="btn btn-info mb-2">
                    <i class="fa-solid fa-truck"></i> Track Your Orders
                </a>
                <a href="manageAddress.jsp" class="btn btn-secondary mb-2">
                    <i class="fa-solid fa-address-card"></i> Manage Addresses
                </a>
                <a href="sellBook.jsp" class="btn btn-warning mb-2">
                    <i class="fa-solid fa-book"></i> Sell Your Books
                </a>
                <a href="helpCenter.jsp" class="btn btn-danger">
                    <i class="fa-solid fa-life-ring"></i> Help Center
                </a>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script> <!-- Replace with local path if needed -->
</body>
</html>
