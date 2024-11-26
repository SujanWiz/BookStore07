<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Login</title>
<%@ include file="all_component/allCss.jsp"%>
<style>
.login-container {
	margin-top: 50px;
}

.form-check-label {
	margin-left: 5px;
}

.form-check-input {
	margin-right: 5px;
}

.login-link {
	display: block;
	margin-top: 10px;
}
</style>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="all_component/navbar.jsp"%>
	<div class="container login-container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title text-center mb-4">Login</h4>
						
						<c:if test="${not empty failedMsg }">
						<h5 class="text-center text-danger">${failedMsg }</h5>
						<c:remove var="failedMsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty succMsg }">
						<h5 class="text-center text-success">${succMsg }</h5>
						<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						
						
						<form action="loginAction.jsp" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									name="email" aria-describedby="emailHelp" required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="password" required="required">
							</div>
							
							<div class="text-center mt-4">
								<button type="submit" class="btn btn-primary">Login</button>
								<a href="register.jsp" class="login-link">Create Account</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
