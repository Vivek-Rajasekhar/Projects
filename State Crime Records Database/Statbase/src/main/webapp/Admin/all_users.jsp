<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Users</title>
<%@include file="CSS.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
	<h3 class="text-center mt-3 pt-3 mb-3 pb-3">All Users</h3>
	
	<div class="container">
		<div class="container-fluid">
			<table class="table table-hover">
  <thead>
    <tr class="text-light bg-dark">
      <th scope="col">ID</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Phone Number</th>
      <th scope="col">Designation</th>
<th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
      <td>@mdo</td>
      <td>
      <a href="#" class="btn btn-sm btn-danger">Delete</a>
      </td>

    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
      <td>@fat</td>

    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry the Bird</td>
      <td>@twitter</td>
      <td>@twitter</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>
		</div>
	</div>
</body>
</html>