<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Home</title>
<%@include file="CSS.jsp" %>
<style type="text/css">
a{
	text-decoration: none;
	color: black;
}
a:hover{
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
<%@include file="navbar.jsp" %>
	
	<div class="container">
		<div class="row p-5">

			<div class="col-md-3">
					<a href="all_users.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="uil uil-users-alt fa-3x text-primary"></i><br>
						<h4>Users</h4>
					</div>
				</div>
				</a>
			</div>	
			
			
						<div class="col-md-3">
						<a href="add_data.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="uil uil-plus-circle fa-3x text-danger"></i><br>
						<h4>Add Data</h4>
					</div>
				</div>
				</a>
			</div>	
			
		
				<div class="col-md-3">
				<a href="update_data.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="uil uil-wrench fa-3x text-warning"></i><br>
						<h4>Update Data</h4>

					</div>
				</div>
				</a>
			</div>	
			
			
	
				<div class="col-md-3">
				<a href="suggestions.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="uil uil-comment-message fa-3x text-success"></i><br>
						<h4>Suggestions</h4>

					</div>
				</div>
				</a>
			</div>
				
	
		</div>
	</div>
	
</body>
</html>