<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Address</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css"> <!-- Replace with local path if needed -->
    <style>
        body {
            background-color: #f9f9f9;
            color: #333;
        }
        .address-container {
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
        .address-card {
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 15px;
            background-color: #f8f9fa;
        }
        .address-card .actions {
            text-align: right;
        }
    </style>
</head>
<body>
    <div class="container address-container">
        <h2 class="text-center">Your Addresses</h2>

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

        <!-- Address List -->
        <c:if test="${empty addressList}">
            <p class="text-center">No saved addresses. Add a new address below.</p>
        </c:if>
        <c:if test="${not empty addressList}">
            <div>
                <c:forEach var="address" items="${addressList}">
                    <div class="address-card">
                        <h5>${address.name}</h5>
                        <p>${address.phone}</p>
                        <p>${address.street}, ${address.city}, ${address.state} - ${address.zip}</p>
                        <p>${address.landmark}</p>
                        <div class="actions">
                            <a href="edit_address.jsp?id=${address.id}" class="btn btn-warning btn-sm">
                                <i class="fa-solid fa-edit"></i> Edit
                            </a>
                            <a href="delete_address?id=${address.id}" class="btn btn-danger btn-sm">
                                <i class="fa-solid fa-trash"></i> Delete
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>

        <!-- Add Address Form -->
        <h4 class="mt-4">Add a New Address</h4>
        <form action="AddAddressServlet" method="post">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="phone">Phone Number</label>
                    <input type="text" class="form-control" id="phone" name="phone" required>
                </div>
            </div>
            <div class="form-group">
                <label for="street">Street Address</label>
                <input type="text" class="form-control" id="street" name="street" required>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="city">City</label>
                    <input type="text" class="form-control" id="city" name="city" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="state">State</label>
                    <input type="text" class="form-control" id="state" name="state" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="zip">ZIP Code</label>
                    <input type="text" class="form-control" id="zip" name="zip" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="landmark">Landmark</label>
                    <input type="text" class="form-control" id="landmark" name="landmark">
                </div>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Add Address</button>
            </div>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script> <!-- Replace with local path if needed -->
</body>
</html>
