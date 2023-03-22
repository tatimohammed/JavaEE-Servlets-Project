<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Account Page</title>
</head>
<body>
	<h3
		style="text-align: center; font-size: 40px; color: red; margin-top: 7%;">Create your account</h3>
	<form action="Signup"
		style="border: 5px solid lightgreen;margin-left: 30%; font-size: 30px; background-color: skyblue; padding: 10px; margin-right: 30%; padding-left: 7%">
		<p>Name:</p>
		<input name="name" style="font-size: 30px">
		<p>Login:</p>
		<input name="login" style="font-size: 30px">
		<p>Password:</p>
		<input type="password" name="code" style="font-size: 30px">
		<p></p>
		<input type="submit" value="Sign Up" name="signup"
			style="font-size: 30px; padding-left: 2%; padding-right: 2%; margin-left: 30%">
	</form>
</body>
</html>