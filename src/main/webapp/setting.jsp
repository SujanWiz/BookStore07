<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Settings</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css"> <!-- Replace with local path if needed -->
    <style>
        body {
            background-color: #f9f9f9;
            color: #333;
        }
        .settings-container {
            max-width: 900px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .settings-section {
            margin-bottom: 30px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 20px;
        }
        .settings-section h4 {
            margin-bottom: 15px;
        }
        .btn {
            transition: background-color 0.3s, transform 0.3s;
        }
        .btn:hover {
            transform: scale(1.05);
        }
        .icon {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="container settings-container">
        <h2 class="text-center">Account Settings</h2>

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

        <!-- Sell Old Book -->
        <div class="settings-section">
            <h4><i class="fa-solid fa-book icon"></i>Sell Your Old Books</h4>
            <p>Have books you no longer need? Sell them here!</p>
            <a href="sellBook.jsp" class="btn btn-primary">Sell Books</a>
        </div>

        <!-- Login & Security (Edit Profile) -->
        <div class="settings-section">
            <h4><i class="fa-solid fa-user-edit icon"></i>Edit Profile</h4>
            <p>Manage your login credentials and personal details.</p>
            <form action="UpdateProfile" method="post">
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="${user.name}" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="${user.email}" required>
                </div>
                <div class="mb-3">
                    <label for="currentPassword" class="form-label">Current Password</label>
                    <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
                </div>
                <div class="mb-3">
                    <label for="newPassword" class="form-label">New Password</label>
                    <input type="password" class="form-control" id="newPassword" name="newPassword">
                </div>
                <button type="submit" class="btn btn-success">Save Changes</button>
            </form>
        </div>

       

        <!-- Track Your Order -->
        <div class="settings-section">
            <h4><i class="fa-solid fa-truck icon"></i>Track Your Order</h4>
            <p>Track the status of your orders and view details.</p>
            <form action="trackOrder.jsp" method="get">
                <div class="mb-3">
                    <label for="orderId" class="form-label">Enter Order ID</label>
                    <input type="text" class="form-control" id="orderId" name="orderId" placeholder="e.g., #123456" required>
                </div>
                <button type="submit" class="btn btn-primary">Track Order</button>
            </form>
        </div>

        <!-- Help Center -->
        <div class="settings-section">
            <h4><i class="fa-solid fa-life-ring icon"></i>Help Center</h4>
            <p>Need help? Contact our support team for assistance.</p>
            <a href="helpCenter.jsp" class="btn btn-info">Go to Help Center</a>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script> <!-- Replace with local path if needed -->
</body>
</html>
