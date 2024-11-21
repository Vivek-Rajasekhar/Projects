<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TheftStat: Login</title>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="components/CSS.jsp"%>
	<%@include file="components/navbar.jsp"%>

	<!-- Login -->
	<div class="container mt-5 pt-5">
		<div class="row">
			<div class="col-12 col-sm-8 col-md-4 m-auto">
				<div class="card card-body m-auto">
				
				<c:if test="${not empty failedMsg}">
				<h5 class="text-center text-danger">${failedMsg }</h5>
				<c:remove var="failedMsg" scope="session" />
				</c:if>
				

				
					<form action="Login" method="post">
											<h3 class="text-center mb-3">Login</h3>
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Email
							</label> <input type="email" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="email" required>
							<div id="emailHelp" class="form-text"></div>
						</div>
						<div class="mb-3">
							<label for="exampleInputPassword1" class="form-label">Password</label>
							<input type="password" name="password" class="form-control"
								id="exampleInputPassword1" required>

						</div>
						<div class="d-flex justify-content-between">

							<button type="submit" class="btn btn-primary">Login</button>
							<a href="register.jsp">Create Account</a>
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>




</body>
</html>