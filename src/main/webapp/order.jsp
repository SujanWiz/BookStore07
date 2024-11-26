<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Orders</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css"> <!-- Replace with local path if needed -->
    <style>
        body {
            background-color: #f9f9f9;
            color: #333;
        }
        .order-container {
            max-width: 1000px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .btn {
            transition: background-color 0.3s, transform 0.3s;
        }
        .btn:hover {
            transform: scale(1.05);
        }
        .empty-orders {
            text-align: center;
            padding: 50px 0;
        }
    </style>
</head>
<body>
    <div class="container order-container">
        <h2 class="text-center">My Orders</h2>

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

        <!-- Order List -->
        <c:if test="${empty orderList}">
            <div class="empty-orders">
                <p class="text-muted">You have not placed any orders yet.</p>
                <a href="all_new_book.jsp" class="btn btn-primary">
                    <i class="fa-solid fa-shopping-cart"></i> Start Shopping
                </a>
            </div>
        </c:if>
        <c:if test="${not empty orderList}">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Order Date</th>
                        <th scope="col">Total Items</th>
                        <th scope="col">Total Amount</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orderList}" varStatus="status">
                        <tr>
                            <th scope="row">${status.count}</th>
                            <td>${order.date}</td>
                            <td>${order.totalItems}</td>
                            <td>₹${order.totalAmount}</td>
                            <td>
                                <a href="track_order.jsp?orderId=${order.id}" class="btn btn-info btn-sm">
                                    <i class="fa-solid fa-location-arrow"></i> Track Order
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script> <!-- Replace with local path if needed -->
</body>
</html>
