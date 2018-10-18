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
h1 {
	text-align: center;
}
</style>
<script type="text/javascript" src = "js/jquery-1.9.1.js"></script>
<script>
	$ (function(){
		$("#addRecDiv").hide();
		$("#getRecordByCustDiv").hide();
		$("#getAllRecordsDiv").hide();
		$("#getRecordByRegNumDiv").hide();
		$("#removeDiv").hide();
		
		$("#addRec").bind("click",{ key : 1},showForm);
		$("#getRecByCustId").bind("click",{ key : 2},showForm);
		$("#getRecByRegNum").bind("click",{ key : 3},showForm);
		$("#getAllRec").bind("click",{ key : 4},showForm);
		$("#removeRec").bind("click",{ key : 5},showForm);
		
		
		$("#calcEst").bind("click",getEstimate);


	});
	
	function getEstimate(){
		
		var carRegNum = $("#carRegNum").val();
		
		var services = $("input[name=serviceId]:checked").map(function () {return this.value;}).get().join(",");
	
		var path = "http://localhost:8080/AutomobileServiceCompany/rest/record/calcEstimate/?carRegNum=" + carRegNum + "&serviceId="+services;
		//$("#calcEst").attr("href",path);
		$.ajax({
			url : path,
			type: "get", 
			success: function(response) {
				console.log(response);
				$("#side").append(response);
			} 
			 

	});
		}
	
	
	function showForm(event){
		console.log("a")
		var data = event.data;
		switch(data.key){
		case 1:
			$("#addRecDiv").show();
			$("#getRecordByCustDiv").hide();
			$("#getAllRecordsDiv").hide();
			$("#getRecordByRegNumDiv").hide();
			$("#removeDiv").hide();
			break;
		case 2:
			$("#addRecDiv").hide();
			$("#getRecordByCustDiv").show();
			$("#getAllRecordsDiv").hide();
			$("#getRecordByRegNumDiv").hide();
			$("#removeDiv").hide();
			break;
		case 3:
			$("#addRecDiv").hide();
			$("#getRecordByCustDiv").hide();
			$("#getAllRecordsDiv").show();
			$("#getRecordByRegNumDiv").hide();
			$("#removeDiv").hide();
			break;
		case 4:
			$("#addRecDiv").hide();
			$("#getRecordByCustDiv").hide();
			$("#getAllRecordsDiv").hide();
			$("#getRecordByRegNumDiv").show();
			$("#removeDiv").hide();
			break;
		case 5: 
			$("#addRecDiv").hide();
			$("#getRecordByCustDiv").hide();
			$("#getAllRecordsDiv").hide();
			$("#getRecordByRegNumDiv").hide();
			$("#removeDiv").show();
			break;

		default:
			break;
		}
	}
	
</script>
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
	<div>
	
	</div>
	<div id = "side" class="col-md-4">
		<ul class="nav nav-pills nav-stacked navbar navbar-light" style="background-color: #123456;">
		<li><a id="addRec" href="#">Add Record</a></li><br> 
		<li><a id="getRecByCustId" href="#">Get Record By Customer ID</a></li><br> 
		<li><a id="getRecByRegNum" href="#">Get Record by Car Registration Number</a></li><br> 
		<li><a id="getAllRec" href="#">Get All Records</a></li><br> 
		<li><a id="removeRec" href="#">Remove a record</a></li><br>
		</ul>
		
<%
	out.println(session.getAttribute("status"));
	
%>		
	<div id = "side1" style="color:blue"></div>	
	</div>

	<div class="col-md-8">
		<div id="custRegDiv">
			<br>


			<div id="addRecDiv">
				<h3>Add Record</h3>
				<form id="addRecFrm" class="form" method="post"
					action="rest/record/add">

					<div class="form-group">
						<label for="carRegNum">Car Registration Number : </label> <input type="number"
							name="carRegNum" id="carRegNum" class="form-control" />
					</div>

					<div class="form-group">
						<label for="serviceId">Service ID : </label>
						<input type="checkbox" name="serviceId"  id="serviceId" value="401" class="form-control"> Polishing <br>
 						<input type="checkbox" name="serviceId"  id="serviceId" value="402" class="form-control"> Vinyls <br>
 						<input type="checkbox" name="serviceId"  id="serviceId" value="403" class="form-control"> Decals <br>
					</div>
					
					<input type="submit" value="Add Record" class="btn btn-primary" />
					<a href = "#" role="button" id = "calcEst" onclick = "getEstimate()" class = "btn btn-primary">Calculate Estimate</a>
				</form>
			</div>


			<div id="getRecordByCustDiv">
				<h3>Get Record By Customer ID</h3>
				<form id="getRecordByCustFrm" class="form" method="get"
					action="rest/record/getRecordByCustomerId">

					<div class="form-group">
						<label for="custId">Customer ID: </label> <input type="number"
							name="custId" id="custId" class="form-control" />
					</div>



					<div id="btnDiv">
						<input type="submit" value="Display Customer Record"
							class="btn btn-primary" />
					</div>

				</form>
			</div>


			<div id="getAllRecordsDiv">
				<h3>Get All Records</h3>
				<form id="getAllRecordsFrm" class="form" method="get"
					action="rest/record/getAllRecords">

					<div id="btnDiv">
						<input type="submit" value="Display All Records"
							class="btn btn-primary" />
					</div>

				</form>
			</div>

			<div id="getRecordByRegNumDiv">
				<h3>Get Record By Car Registration Number</h3>
				<form id="getRecordByRegNumFrm" class="form" method="get"
					action="rest/record/getRecordByRegNum">

					<div class="form-group">
						<label for="regNumber">Car Registration Number: </label> <input
							type="number" name="regNumber" id="regNumber"
							class="form-control" />
					</div>



					<div id="btnDiv">
						<input type="submit" value="Display Car Record"
							class="btn btn-primary" />
					</div>

				</form>
			</div>

			<div id="removeDiv">
				<h3>Remove Record By Car Registration Number</h3>
				<form id="removeFrm" class="form" method="post"
					action="rest/record/remove">

					<div class="form-group">
						<label for="carRegNum">Car Registration Number: </label> <input type="number"
							name="carRegNum" id="carRegNum" class="form-control" />
					</div>

					<div id="btnDiv">
						<input type="submit" value="Remove Customer"
							class="btn btn-primary" />
					</div>

				</form>
			</div>
		</div>
	</div>
</body>
</html>