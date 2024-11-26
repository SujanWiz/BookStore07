<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help Center</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css"> <!-- Replace with local path if needed -->
    <style>
        body {
            background-color: #f9f9f9;
            color: #333;
        }
        .help-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .help-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .help-item {
            margin-bottom: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #fdfdfd;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .help-item i {
            color: #007bff;
            font-size: 1.5rem;
            margin-right: 10px;
        }
        .help-item:hover {
            background-color: #f0f8ff;
            transform: translateY(-3px);
            transition: 0.3s;
        }
        .help-item h5 {
            margin-bottom: 5px;
        }
        .help-item p {
            margin: 0;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="container help-container">
        <div class="help-header">
            <h2>Help Center</h2>
            <p class="text-muted">We are here to assist you. Reach out to us through the following helplines.</p>
        </div>

        <!-- Helpline Items -->
        <div class="help-item">
            <i class="fa-solid fa-phone"></i>
            <h5>Customer Support</h5>
            <p>Call us: <strong>+1-800-123-4567</strong></p>
            <p>Email: <a href="mailto:support@example.com">support@example.com</a></p>
        </div>

        <div class="help-item">
            <i class="fa-solid fa-phone"></i>
            <h5>Technical Support</h5>
            <p>Call us: <strong>+1-800-789-0123</strong></p>
            <p>Email: <a href="mailto:techsupport@example.com">techsupport@example.com</a></p>
        </div>

        <div class="help-item">
            <i class="fa-solid fa-phone"></i>
            <h5>Order Assistance</h5>
            <p>Call us: <strong>+1-800-456-7890</strong></p>
            <p>Email: <a href="mailto:orders@example.com">orders@example.com</a></p>
        </div>

        <div class="text-center mt-4">
            <p class="text-muted">For more queries, visit our <a href="faq.jsp">FAQ</a> page.</p>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script> <!-- Replace with local path if needed -->
</body>
</html>
