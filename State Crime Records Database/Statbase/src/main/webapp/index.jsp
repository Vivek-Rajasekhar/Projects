<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TheftStat: Home</title>
<%@include file="components/CSS.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	

	<!-- showcase -->


	<section class="p-5 text-dark text-sm-start py-6">
		<div class="container">
			<div class="d-sm-flex align-items-center justify-content-between">
				<div>
					<h1>
						<span class="text-danger">Statewise</span> Property Insights
					</h1>
					<p class="lead my-4">Dive into our site for a quick insight
						into property theft landscapes. Discover real-time data on stolen
						assets, recovery efforts, and the prevailing success percentages
						across states. Empowering you with succinct information for a
						vigilant community.</p>
					<button class="btn btn-primary btn-lg" data-toggle="modal"
						data-target="#exampleModal">Contribute</button>
				</div>
				<img class="img-fluid" src="./images/header.svg" alt=""
					style="width: 45%" />
			</div>
		</div>
	</section>

	<!-- Features -->
	

	<section class="p-5 features">
		<div class="container">
			<h1 class="text-center">Explore the Functionalities</h1>
			<div class="row text-center">
				<div class="col-md py-5">
					<div class="card bg-dark text-light" style="border-radius: 25px;">
						<div class="card-body text-center">
							<div class="h1 mb-3">
								<i class="uil uil-comparison"></i>
							</div>
							<h3 class="card-title mb-3">Compare</h3>
							<p class="card-text">Effortlessly analyze and contrast key
								metrics, uncovering disparities and similarities between two
								states for informed decision-making</p>
							<a href="#" class="btn btn-primary">View</a>
						</div>
					</div>
				</div>
				<div class="col-md py-5">
					<div class="card bg-dark text-light" style="border-radius: 25px;">
						<div class="card-body text-center">
							<div class="h1 mb-3">
								<i class="uil uil-analytics"></i>
							</div>
							<h3 class="card-title mb-3">Year-wise Analysis</h3>
							<p class="card-text">Effortlessly analyze and contrast key
								metrics, uncovering disparities and similarities between two
								states for informed decision-making</p>
							<a href="#" class="btn btn-primary">View</a>
						</div>
					</div>
				</div>
				<div class="col-md py-5">
					<div class="card bg-dark text-light" style="border-radius: 25px;">
						<div class="card-body text-center">
							<div class="h1 mb-3">
								<i class="uil uil-file-graph"></i>
							</div>
							<h3 class="card-title mb-3">State-wise Report</h3>
							<p class="card-text">Effortlessly analyze and contrast key
								metrics, uncovering disparities and similarities between two
								states for informed decision-making</p>
							<a href="#" class="btn btn-primary">View</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Contribution
						Registration</h5>
				</div>
				<div class="modal-body">Exclusive Contribution Access:
					Reserved for authorized users. Government officials, presenting
					valid ID proof, are welcome to register and contribute to our
					platform.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<a class="btn btn-primary" href="register.jsp">Register</a>
				</div>
			</div>
		</div>
	</div>
	
		<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title text-center" id="exampleModalLongTitle">Log In</h5>
	
				</div>
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>



	<%@include file="components/footer.jsp"%>
</body>
</html>