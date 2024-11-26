<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css"> <!-- Replace with local path if needed -->
    <style>
        body {
            background-color: #f9f9f9;
            color: #333;
        }
        .cart-container {
            padding: 20px;
        }
        .cart-header {
            margin-bottom: 20px;
            text-align: center;
        }
        .card {
            margin-bottom: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .order-summary {
            padding: 15px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
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
    <div class="container cart-container">
        <div class="cart-header">
            <h2>Your Shopping Cart</h2>
        </div>

        <!-- Success Alert for actions like remove or successful cart update -->
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success" role="alert">
                ${successMessage}
            </div>
        </c:if>

        <!-- Selected Items Section -->
        <div class="row">
            <div class="col-md-8">
                <h4>Selected Items</h4>
                <c:if test="${empty cartItems}">
                    <p class="text-center">Your cart is empty. Add items to your cart to see them here.</p>
                </c:if>
                <c:if test="${not empty cartItems}">
                    <c:forEach var="item" items="${cartItems}">
                        <div class="card">
                            <div class="row no-gutters">
                                <div class="col-md-3">
                                    <img src="${item.photoName}" class="card-img" alt="${item.bookname}">
                                </div>
                                <div class="col-md-7">
                                    <div class="card-body">
                                        <h5 class="card-title">${item.bookname}</h5>
                                        <p class="card-text">Author: ${item.author}</p>
                                        <p class="card-text">Price: ₹${item.price}</p>
                                    </div>
                                </div>
                                <div class="col-md-2 text-center">
                                    <a href="removeCartItem?id=${item.id}" class="btn btn-danger btn-sm">
                                        <i class="fa-solid fa-trash"></i> Remove
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>

            <!-- Order Details Section -->
            <div class="col-md-4">
                <h4>Order Details</h4>
                <div class="order-summary">
                    <p><strong>Number of Items:</strong> ${cartItems.size()}</p>
                    <p><strong>Total Price:</strong> ₹${totalPrice}</p>
                    <hr>
                    <a href="checkout.jsp" class="btn btn-primary btn-block">
                        <i class="fa-solid fa-shopping-cart"></i> Proceed to Checkout
                    </a>
                    <a href="all_new_book.jsp" class="btn btn-secondary btn-block">
                        <i class="fa-solid fa-book-open"></i> Continue Shopping
                    </a>
                </div>
            </div>
        </div>

        <!-- Order Form with Readonly Fields -->
        <div class="card mt-4">
            <div class="card-body">
                <h3 class="text-center text-success">Details for Order</h3>
                <form action="placeOrder.jsp" method="post">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" id="name" name="username" value="${user.name}" readonly>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" value="${user.email}" readonly>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="phone">Phone Number</label>
                            <input type="number" class="form-control" id="phone" name="phno" value="${user.phone}" readonly>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="address">Address</label>
                            <input type="text" class="form-control" id="address" name="address" value="${user.address}" readonly>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="landmark">Landmark</label>
                            <input type="text" class="form-control" id="landmark" name="landmark" value="${user.landmark}" readonly>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="city">City</label>
                            <input type="text" class="form-control" id="city" name="city" value="${user.city}" readonly>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="state">State</label>
                            <input type="text" class="form-control" id="state" name="state" value="${user.state}" readonly>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="zip">ZIP</label>
                            <input type="number" class="form-control" id="zip" name="zip" value="${user.zip}" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="paymentMode">Payment Mode</label>
                        <select class="form-control" id="paymentMode" name="paymentMode" disabled>
                            <option value="COD" selected>Cash On Delivery</option>
                        </select>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-warning" disabled>Order Now</button>
                        <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script> <!-- Replace with local path if needed -->
</body>
</html>
