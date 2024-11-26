<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Register</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f5f3f0;">
	<%@ include file="all_component/navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Registration Page</h4>
						<c:if test="${not empty succMsg }">
						<p class="text-center text-success">$succMsg</p>
						<c:remove var="succMsg" scope="session"/>
						</c:if>
						
	             <c:if test="${not empty failedMsg }">
	             <p class="text-center text-danger">$failedMsg</p>
	             <c:remove var="failedMsg" scope="session"/>
	             
	             </c:if>					
						
						
						
						<form action="register" method="post">
							<div class="form-group">
								<label for="fullName">Enter Full Name</label> <input type="text"
									class="form-control" id="fullName" name="fullName"
									required="required" name="fname">
							</div>

							<div class="form-group">
								<label for="email">Email address</label> <input type="email"
									class="form-control" id="email" name="email"
									required="required" name="email">
							</div>

							<div class="form-group">
								<label for="phone">Phone No</label> <input type="text"
									class="form-control" id="phone" name="phone" pattern="\d{10}"
									title="Please enter exactly 10 digits" required="required"
									name="phno">
							</div>

							<div class="form-group">
								<label for="password">Password</label> <input type="password"
									class="form-control" id="password" name="password"
									required="required" name="password">
							</div>

							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="termsCheck" name="termsCheck"> <label
									class="form-check-label" for="termsCheck">I agree to
									the terms and conditions</label>
							</div>

							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>
