<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Services</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<style>
	h1{
	text-align: center;}
</style>
</head>
<body>
<h1>Automobile Company - Services</h1>
	<br>
	<br>
	<nav class="navbar navbar-light" style="background-color: #123456;">
		<div class="container-fluid" id="navbarNav">
			<div class="navbar-header">
				<a class="navbar-brand" href="home.jsp" style="color:#ffffff">Automobile Servicing</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="home.jsp" style="color:#ffffff">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="service.jsp" style="color:#ffffff">Services</a></li>
				<li class="nav-item"><a class="nav-link" href="employee.jsp" style="color:#ffffff">Employee</a></li>
				<li class="nav-item"><a class="nav-link" href="policy.jsp" style="color:#ffffff">Policies</a></li>
				<li class="nav-item"><a class="nav-link" href="customer.jsp" style="color:#ffffff">Customer</a></li>
				<li class="nav-item"><a class="nav-link" href="record.jsp" style="color:#ffffff">Record
						<span class="sr-only">(current)</span>
				</a></li>
			</ul>
		</div>
	</nav>
	<br>

	
	
		<div id="addPolicyDiv">
				<h3>Add Policy</h3>
				<form id="addServiceFrm" class="form" method="post"
					action="rest/policy/add">

					<div class="form-group">
						<label for="policyId">Policy ID : </label> <input type="number"
							name="policyId" id="policyId" class="form-control" />
					</div>
					
					<div class="form-group">
						<label for="policyType">Policy Type : </label> <input type="text"
							name="policyType" id="policyType" class="form-control" />
					</div>
					
					

					
					
					<input type="submit" value="Add Policy" class="btn btn-primary" />
				</form>
			</div>
	
</body>
</html>