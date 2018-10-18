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
<script type="text/javascript" src = "js/jquery-1.9.1.js"></script>
<script>
	$ (function(){
		$("#custRegDiv").hide();
		$("#addCarDiv").hide();
		$("#updateCustDiv").hide();
		$("#getCustDiv").hide();
		$("#getAllCustDiv").hide();
		$("#getCarByRegDiv").hide();
		$("#getCarsByCustIdDiv").hide();
		$("#removeCustByCustIdDiv").hide();
		$("#removeCarByRegNumDiv").hide();

		$("#property").bind("change",setType);
		
		$("#addCustomer").bind("click",{ key : 1},showForm);
		$("#addCar").bind("click",{ key : 2},showForm);
		$("#editCustomer").bind("click",{ key : 3},showForm);
		$("#getCustomerById").bind("click",{ key : 4},showForm);
		$("#getAllCust").bind("click",{ key : 5},showForm);
		$("#getCarByReg").bind("click",{ key : 6},showForm);
		$("#getCarByCustId").bind("click",{ key : 7},showForm);
		$("#removeCust").bind("click",{ key : 8},showForm);
		$("#removeCar").bind("click",{ key : 9},showForm);

	});
	
	function showForm(event){
		console.log("a")
		var data = event.data;
		switch(data.key){
		case 1:
			$("#addCarDiv").hide();
			$("#updateCustDiv").hide();
			$("#getCustDiv").hide();
			$("#getAllCustDiv").hide();
			$("#getCarByRegDiv").hide();
			$("#getCarsByCustIdDiv").hide();
			$("#removeCustByCustIdDiv").hide();
			$("#removeCarByRegNumDiv").hide();
			$("#custRegDiv").show();
			break;
		case 2:
			$("#custRegDiv").hide();
			$("#updateCustDiv").hide();
			$("#getCustDiv").hide();
			$("#getAllCustDiv").hide();
			$("#getCarByRegDiv").hide();
			$("#getCarsByCustIdDiv").hide();
			$("#removeCustByCustIdDiv").hide();
			$("#removeCarByRegNumDiv").hide();
			$("#addCarDiv").show();
			break;
		case 3:
			$("#custRegDiv").hide();
			$("#addCarDiv").hide();
			$("#getCustDiv").hide();
			$("#getAllCustDiv").hide();
			$("#getCarByRegDiv").hide();
			$("#getCarsByCustIdDiv").hide();
			$("#removeCustByCustIdDiv").hide();
			$("#removeCarByRegNumDiv").hide();
			$("#updateCustDiv").show();
			break;
		case 4:
			$("#custRegDiv").hide();
			$("#addCarDiv").hide();
			$("#updateCustDiv").hide();
			$("#getAllCustDiv").hide();
			$("#getCarByRegDiv").hide();
			$("#getCarsByCustIdDiv").hide();
			$("#removeCustByCustIdDiv").hide();
			$("#removeCarByRegNumDiv").hide();
			$("#getCustDiv").show();
			break;
		case 5: 
			$("#custRegDiv").hide();
			$("#addCarDiv").hide();
			$("#updateCustDiv").hide();
			$("#getCustDiv").hide();
			$("#getCarByRegDiv").hide();
			$("#getCarsByCustIdDiv").hide();
			$("#removeCustByCustIdDiv").hide();
			$("#removeCarByRegNumDiv").hide();
			$("#getAllCustDiv").show();
			break;
			
		case 6: 
			$("#custRegDiv").hide();
			$("#addCarDiv").hide();
			$("#updateCustDiv").hide();
			$("#getCustDiv").hide();
			$("#getAllCustDiv").hide();
			$("#getCarsByCustIdDiv").hide();
			$("#removeCustByCustIdDiv").hide();
			$("#removeCarByRegNumDiv").hide();
			$("#getCarByRegDiv").show();
			break;
		case 7: 
			$("#custRegDiv").hide();
			$("#addCarDiv").hide();
			$("#updateCustDiv").hide();
			$("#getCustDiv").hide();
			$("#getAllCustDiv").hide();
			$("#getCarByRegDiv").hide();
			$("#removeCustByCustIdDiv").hide();
			$("#removeCarByRegNumDiv").hide();
			$("#getCarsByCustIdDiv").show();
			break;
		case 8: 
			$("#custRegDiv").hide();
			$("#addCarDiv").hide();
			$("#updateCustDiv").hide();
			$("#getCustDiv").hide();
			$("#getAllCustDiv").hide();
			$("#getCarsByCustIdDiv").hide();
			$("#removeCarByRegNumDiv").hide();
			$("#getCarByRegDiv").hide();
			$("#removeCustByCustIdDiv").show();
			break;
		case 9: 
			$("#custRegDiv").hide();
			$("#addCarDiv").hide();
			$("#updateCustDiv").hide();
			$("#getCustDiv").hide();
			$("#getAllCustDiv").hide();
			$("#getCarsByCustIdDiv").hide();
			$("#removeCustByCustIdDiv").hide();
			$("#getCarByRegDiv").hide();
			$("#removeCarByRegNumDiv").show();

			break;
		default:
			break;
		}
	}
	
	function setType(){
		if($("#property").val()==="mobile"){
			$("#newValue").attr("type","number");
		}
		
	}
	
	function display(){
		$.ajax({
			  url: "http://localhost:8080/AutomobileServiceCompany/rest/cust/getAllCustomer/",
			  type: "get", //send it through get method
			  dataType: 'json',
			  success: function(response) {
				  console.log(response);
				  loadEstimate(response);
			  },
			  error: function(xhr) {
				  alert("no!");
			  }
			})
	}
	
	
	function loadEstimate(jsonData){
		
		var custList = JSON.stringify(jsonData,null,4);
		
		
		var container = document.getElementById("displayContainer");
		
		var table = document.createElement('table');
		var rowHeading = document.createElement('tr');
		
		var id = document.createElement('th');
		var name = document.createElement('th');
		var phone = document.createElement('th');
		var list = document.createElement('th');
		
		
		id.innerHTML = "Customer ID";
		name.innerHTML = "Customer Name";
		phone.innerHTML = "Mobile";
		list.innerHTML = "Car List";
		
		var obj = JSON.parse(custList);
    	container.append(custList);

    	
	        
		
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




	
	<div class = "col-md-4">
		
		<ul class="nav nav-pills nav-stacked navbar navbar-light" style="background-color: #123456;">
		<li class="nav-item"><a id = "addCustomer" href = "#" >Add Customer</a></li><br>
		<li class="nav-item"><a id = "addCar" href = "#" >Add Car</a></li><br>
		<li><a id = "editCustomer" href = "#" >Edit Details</a></li><br>
		<li><a id = "getCustomerById" href = "#" >Get Customer By ID</a></li><br>
		<li><a id = "getAllCust" href = "#" >Get All Customers</a></li><br>
		<li><a id = "getCarByReg" href = "#" >Get Car by Car Registration Number</a></li><br>
		<li><a id = "getCarByCustId" href = "#" >Get Cars by Customer ID</a></li><br>
		<li><a id = "removeCust" href = "#" >Remove Customer by Customer ID</a></li><br>
		
		</ul>
	
	</div>
	
	<div class = "col-md-8">
		<div id="custRegDiv">
		<h3>Customer Registration</h3><br>

		<form id = "registerCust" class = "form" method = "post" action = "rest/cust/add" >
	
			<div class = "form-group">
				<label for = "custId">Customer ID : </label>
				<input type = "text" name = "custId" id = "custId" class = "form-control"/>
			</div>
			
			<div class = "form-group">
				<label for = "custName">Customer Name : </label>
				<input type = "text" name = "custName" id = "custName" class = "form-control"/>
			</div>
			
			<div class = "form-group">
				<label for = "mobile" >Contact Number :</label>
				<input type = "number" name = "mobile" id = "mobile" class = "form-control"/>	
			</div>
			
			<div class = "form-group">
				<label for = "regNumber">Car Registration Number : </label>
				<input type = "number" name = "regNumber" id = "regNumber" class = "form-control"/>
			</div>
			
			<div class = "form-group">
				<label for = "carName">Car Name : </label>
				<input type = "text" name = "carName" id = "carName" class = "form-control"/>
			</div>
			

			
			<div class = "form-group">
				<label for = "policyId" >Policy Id :</label>
				<input type = "number" name = "policyId" id = "policyId" class = "form-control"/>	
			</div>
				<input type = "submit" value = "Register" class = "btn btn-primary"/>
			
		</form>
		</div>
		<div id = "addCarDiv">
			<h3>Add Car</h3>
				<form id = "addCarFrm" class = "form" method = "post" action = "rest/cust/addCar" >
	
			<div class = "form-group">
				<label for = "custId">Customer ID : </label>
				<input type = "text" name = "custId" id = "custId" class = "form-control"/>
			</div>

			<div class = "form-group">
				<label for = "regNumber">Car Registration Number : </label>
				<input type = "number" name = "regNumber" id = "regNumber" class = "form-control"/>
			</div>
			
			<div class = "form-group">
				<label for = "carName">Car Name : </label>
				<input type = "text" name = "carName" id = "carName" class = "form-control"/>
			</div>
			
		
			
			<div class = "form-group">
				<label for = "policyId" >Policy Id :</label>
				<input type = "number" name = "policyId" id = "policyId" class = "form-control"/>	
			</div>
				<input type = "submit" value = "Register" class = "btn btn-primary"/>
			
		</form>
		</div>
		
		<div id = "updateCustDiv">
			<h3>Update Customer</h3>
			<form id = "updateCust" class = "form" method = "post" action = "rest/cust/update" >
	
			<div class = "form-group">
				<label for = "custId">Customer ID: </label>
				<input type = "number" name = "custId" id = "custId" class = "form-control"/>
			</div>
			
			<div class = "form-group">
				<label for = "property" >Detail to edit: </label>
				<select name = "property" id = "property" class = "form-control">
					<option value ="custName" >Name</option>
					<option value ="custMobNum" >Mobile Number</option>
				</select>		
			</div>
			
			<div class = "form-group">
				<label for = "newValue">Enter New: </label>
				<input type = "text" name = "newValue" id = "newValue" class = "form-control"/>
			</div>
			
			<div id="btnDiv">
				<input type = "submit" value = "Update" class = "btn btn-primary"/>
			</div>
			
			</form>
		</div>
		
		
		<div id = "getCustDiv">
			<h3>Get Customer By ID</h3>
			<form id = "updateCust" class = "form" method = "get" action = "rest/cust/getCustomer" >
	
			<div class = "form-group">
				<label for = "custId">Customer ID: </label>
				<input type = "number" name = "custId" id = "custId" class = "form-control"/>
			</div>
			
			
			
			<div id="btnDiv">
				<input type = "submit" value = "Display Customer" class = "btn btn-primary"/>
			</div>
			
			</form>
		</div>
		
		
		<div id = "getAllCustDiv">
			<h3>Get All Customers</h3>
			<form id = "updateCust" class = "form" method = "get" action = "rest/cust/getAllCustomer" >
				
			<div id="btnDiv">
				<input type = "" value = "Display Customers" class = "btn btn-primary" onclick="display()"/>
			</div>
			
			</form>
		</div>
		
		<div id = "getCarByRegDiv">
			<h3>Get Customer By ID</h3>
			<form id = "getCarByRegFrm" class = "form" method = "get" action = "rest/cust/getCarByReg" >
	
			<div class = "form-group">
				<label for = "carRegNum">Car Registration Number: </label>
				<input type = "number" name = "carRegNum" id = "carRegNum" class = "form-control"/>
			</div>
			
			
			
			<div id="btnDiv">
				<input type = "submit" value = "Display Car Details" class = "btn btn-primary"/>
			</div>
			
			</form>
		</div>
		
		<div id = "getCarsByCustIdDiv">
			<h3>Get Customer By ID</h3>
			<form id = "getCarsByCustIdFrm" class = "form" method = "get" action = "rest/cust/getCarsByCustId" >
	
			<div class = "form-group">
				<label for = "custId">Customer ID: </label>
				<input type = "number" name = "custId" id = "custId" class = "form-control"/>
			</div>
			
			<div id="btnDiv">
				<input type = "submit" value = "Display Car Details" class = "btn btn-primary"/>
			</div>
			
			</form>
		</div>
		
		<div id = "removeCustByCustIdDiv">
			<h3>Remove Customer By ID</h3>
			<form id = "removeCustByCustIdFrm" class = "form" method = "post" action = "rest/cust/removeCust" >
	
			<div class = "form-group">
				<label for = "custId">Customer ID: </label>
				<input type = "number" name = "custId" id = "custId" class = "form-control"/>
			</div>
			
			<div id="btnDiv">
				<input type = "submit" value = "Remove Customer" class = "btn btn-primary"/>
			</div>
			
			</form>
		</div>
		
		
	</div>
	
	<div id="displayContainer">
	
	</div>
</body>
</html>