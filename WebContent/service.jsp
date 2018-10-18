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

	<h3>Services</h3>
	
	
	
	<div id="addServiceDiv">
				<h3>Add Service</h3>
				<form id="addServiceFrm" class="form" method="post"
					action="rest/services/add">

					<div class="form-group">
						<label for="serviceId">Service ID : </label> <input type="number"
							name="serviceId" id="serviceId" class="form-control" />
					</div>
					
					<div class="form-group">
						<label for="serviceName">Service Name : </label> <input type="text"
							name="serviceName" id="serviceName" class="form-control" />
					</div>
					
					<div class="form-group">
						<label for="serviceId">Cost : </label> <input type="number"
							name="cost" id="cost" class="form-control" />
					</div>

					
					
					<input type="submit" value="Add Service" class="btn btn-primary" />
				</form>
			</div>
	
	
	<div id="getServiceByIdDiv">
				<h3>Get Service By Service ID</h3>
				<form id="getRecordByCustFrm" class="form" method="get"
					action="rest/services/getService">

					<div class="form-group">
						<label for="serviceId">Service ID: </label> <input type="number"
							name="serviceId" id="serviceId" class="form-control" />
					</div>



					<div id="btnDiv">
						<input type="submit" value="Display Service"
							class="btn btn-primary" />
					</div>

				</form>
			</div>

	
	
	
	<div id = "getAllCustDiv">
			<h3>Get All Services</h3>
			<form id = "displayService" class = "form" method = "get" action = "rest/services/getAllServices" >
				
			<div id="btnDiv">
				<input type = "submit" value = "Display Services" class = "btn btn-primary"/>
			</div>
			
			</form>
		</div>
</body>
</html>