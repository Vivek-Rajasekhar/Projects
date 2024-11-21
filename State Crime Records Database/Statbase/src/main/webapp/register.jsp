<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TheftStat: Register</title>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="components/CSS.jsp"%>
	<%@include file="components/navbar.jsp"%>



	<!-- Login -->
	<div class="container mt-3 pt-3">
		<div class="row">
			<div class="col-12 col-sm-8 col-md-4 m-auto">
				<div class="card card-body m-auto">

					<c:if test="${not empty succMsg}">
						<p class="text-center text-success">${succMsg }</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>

					<c:if test="${not empty failedMsg }">
						<p class="text-center text-danger">${failedMsg }</p>
						<c:remove var="failedMsg" scope="session" />
					</c:if>

					<form action="register" method="post">
						<h3 class="text-center mb-3">Create Account</h3>
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Name </label>
							<input type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" required="required" name="name">
							<div id="emailHelp" class="form-text"></div>
						</div>
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Email
							</label> <input type="email" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" required="required" name="email">
							<div id="emailHelp" class="form-text"></div>
						</div>
						<label for="exampleInputEmail1" class="form-label">Phone
							Number </label> <input type="text" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp"
							required="required" name="phno">
						<div id="emailHelp" class="form-text"></div>
						<div class="mb-3">
							<label for="exampleInputPassword1" class="form-label">Password</label>
							<input type="password" class="form-control"
								id="exampleInputPassword1" required="required" name="password">

						</div>
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Position/Title
							</label> <input type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" required="required" name="title">
							<div id="emailHelp" class="form-text"></div>
						</div>



						<!--  <div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Submit
								Proof: </label> <input type="file" name="proof"/>

						</div> -->



						<div class="text-center">

							<button type="submit" class="btn btn-primary">Register</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>






</body>
</html>