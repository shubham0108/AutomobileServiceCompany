<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class = "col-md-4  col-centered  col-md-offset-4">
		<div id="loginDiv">
		<h1>Employee Registration</h1><br>

		<form id = "register" class = "form" method = "post" action = "rest/emp/add" >
	
			<div class = "form-group">
				<label for = "empId">Employee ID: </label>
				<input type = "text" name = "empId" id = "empId" class = "form-control"/>
			</div>
			
			<div class = "form-group">
				<label for = "empName">Employee Name: </label>
				<input type = "text" name = "empName" id = "empName" class = "form-control"/>
			</div>
			
			<div class = "form-group">
				<label for = "userName">User Name: </label>
				<input type = "text" name = "userName" id = "userName" class = "form-control"/>
			</div>
			
			<div class = "form-group">
				<label for = "empPassword" >Password: </label>
				<input type = "password" name = "empPassword" id = "empPassword" class = "form-control"/>	
			</div>
			
			
			
				<input type = "submit" value = "Register" class = "btn btn-primary"/>
			
		</form>
		</div>
	</div>

</body>
</html>