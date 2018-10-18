<%@page import="com.automobile.resources.EmployeeResource"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Employee Login</title>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript">

</script>
<style>
	#loginDiv{
		height:15%;
		margin-top:42.5%;
	}
	#loginDiv>h1{
		text-align:center;
	}
	#btnDiv>a{
		align-self: right;
	}
</style>
</head>
<body>

	<div class = "col-md-4  col-centered  col-md-offset-4">
		<div id="loginDiv">
		<h1>Employee Login</h1><br>

		<form id = "login" class = "form" method = "post" action = "rest/emp/login" >
	
			<div class = "form-group">
				<label for = "empId">Employee ID: </label>
				<input type = "text" name = "empId" id = "empId" class = "form-control"/>
			</div>
			
			<div class = "form-group">
				<label for = "empPassword" >Password: </label>
				<input type = "password" name = "empPassword" id = "empPassword" class = "form-control"/>	
			</div>
			
			<div id="btnDiv">
				<input type = "submit" value = "Login" class = "btn btn-primary"/>
			
				<a id="btnReg" class="btn btn-primary" role = "button" href = "register.jsp" >Register New</a>
			</div>
		</form>
		</div>
	</div>
	

</body>
</html>