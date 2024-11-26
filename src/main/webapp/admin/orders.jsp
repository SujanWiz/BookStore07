<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : Orders</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<h3 class="text-center">Hello Admin</h3>
	<table class="table">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">OrderId</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Ph no</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td>Mark</td>
				<td>Otto</td>
				<td>@mdo</td>
				<td>Otto</td>
				<td>@mdo</td>
				<td>@wiz</td>
				<td>Otto</td>
				<td>@mdo</td>
				<td>@wiz</td>
			</tr>
			<tr>
				<th scope="row">2</th>
				<td>Jacob</td>
				<td>Thornton</td>
				<td>@fat</td>
				<td>Otto</td>
				<td>@mdo</td>
				<td>Otto</td>
				<td>@mdo</td>
				<td>@wiz</td>
				<td>@wiz</td>
			</tr>
			<tr>
				<th scope="row">3</th>
				<td>Larry</td>
				<td>the Bird</td>
				<td>@twitter</td>
				<td>Otto</td>
				<td>@mdo</td>
				<td>Otto</td>
				<td>@mdo</td>
				<td>@wiz</td>
				<td>@wiz</td>
			</tr>
		</tbody>
	</table>
	<div style="margin-top: 130px">
		<%@include file="footer.jsp"%></div>
</body>
</html>