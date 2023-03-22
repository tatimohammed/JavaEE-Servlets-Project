<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
	<h3
		style="text-align: center; font-size: 40px; color: red; margin-top: 10%;">Login Page - TATI Version</h3>
	<form action="Login" method="POST"
		style="border: 5px solid lightgreen;margin-left: 30%; font-size: 30px; background-color: skyblue; padding: 10px; margin-right: 30%; padding-left: 7%">
		
		<p>Login:</p>
		<input name="login" style="font-size: 30px">
		<p>Password:</p>
		<input type="password" name="code" style="font-size: 30px">
		<p></p>
		<input type="submit" value="Log In" name="login"
			style="font-size: 30px; padding-left: 2%; padding-right: 2%; margin-left: 30%"><br>
		<a href="http://localhost:8080/firstApp/CreateAccount.jsp" style="font-size: 20px; margin-left: 24%; color: black">Create your account</a>
	</form>
</body>
</html>