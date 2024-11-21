<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add</title>
<%@include file="CSS.jsp" %>
</head>
<body style="background-color: #f0f2f2;">
<%@include file="navbar.jsp" %>
	<div class="container mt-3 pt-3">
		<div class="row">
			<div class="col-12 col-sm-8 col-md-4 m-auto">
				<div class="card">
					<div class="card-body m-auto">
					
					
					
					<h3 class="text-center mb-3">Add Data</h3>
					
					<c:if test="${not empty succMsg }">
					<p class="text-center text-success">${succMsg }</p>
					<c:remove var="succMsg" scope="session" />
					</c:if>
					
					<c:if test="${not empty failedMsg }">
					<p class="text-center text-danger">${failedMsg }</p>
					<c:remove var="failedMsg" scope="session" />
					</c:if>
					
					
						<form action="../add_data" method="post">
											
						<div class="mb-3">
<div class="form-group">
            <label for="stateSelect">Select State/UT:</label>
            <select class="form-control" id="inputState" name="statename">
                <option value="" selected>--select--</option>
                <!-- States -->
                <option value="Andhra Pradesh">Andhra Pradesh</option>
                <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                <option value="Assam">Assam</option>
                <option value="Bihar">Bihar</option>
                <option value="Chhattisgarh">Chhattisgarh</option>
                <option value="Goa">Goa</option>
                <option value="Gujarat">Gujarat</option>
                <option value="Haryana">Haryana</option>
                <option value="Himachal Pradesh">Himachal Pradesh</option>
                <option value="Jharkhand">Jharkhand</option>
                <option value="Jammu Kashmir">Jammu & Kashmir</option>
                <option value="Karnataka">Karnataka</option>
                <option value="Kerala">Kerala</option>
                <option value="Madhya Pradesh">Madhya Pradesh</option>
                <option value="Maharashtra">Maharashtra</option>
                <option value="Manipur">Manipur</option>
                <option value="Meghalaya">Meghalaya</option>
                <option value="Mizoram">Mizoram</option>
                <option value="Nagaland">Nagaland</option>
                <option value="Odisha">Odisha</option>
                <option value="Punjab">Punjab</option>
                <option value="Rajasthan">Rajasthan</option>
                <option value="Sikkim">Sikkim</option>
                <option value="Tamil Nadu">Tamil Nadu</option>
                <option value="Telangana">Telangana</option>
                <option value="Tripura">Tripura</option>
                <option value="Uttar Pradesh">Uttar Pradesh</option>
                <option value="Uttarakhand">Uttarakhand</option>
                <option value="West Bengal">West Bengal</option>
                <!-- Union Territories -->
                <option value="Andaman Nicobar">Andaman and Nicobar Islands</option>
                <option value="Chandigarh">Chandigarh</option>
                <option value="Dadra Nagar Haveli">Dadra and Nagar Haveli and Daman and Diu</option>
                <option value="Daman Diu">Daman and Diu</option>
                <option value="Lakshadweep">Lakshadweep</option>
                <option value="Delhi">National Capital Territory of Delhi</option>
                <option value="Puducherry">Puducherry</option>
            </select>
            </div>
            
						</div>
						<div class="mb-3">
							<label for="exampleInputPassword1" class="form-label">Year</label>
							<input type="number" name="year" class="form-control"
								id="exampleInputPassword1" required>

						</div>
												<div class="mb-3">
							<label for="exampleInputPassword1" class="form-label">Stolen Property</label>
							<input type="number" name="stolen" class="form-control"
								id="exampleInputPassword1" required>

						</div>
												<div class="mb-3">
							<label for="exampleInputPassword1" class="form-label">Recovered Property</label>
							<input type="number" name="recovered" class="form-control"
								id="exampleInputPassword1" required>

						</div>
						<div class="text-center">

							<button type="submit" class="btn btn-primary">Add</button>

						</div>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>