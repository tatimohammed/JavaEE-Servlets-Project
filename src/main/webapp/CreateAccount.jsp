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
		style="text-align:center; border: 5px solid lightgreen; font-size: 30px; background-color: skyblue; padding: 10px; margin-right: auto; margin-left: auto; width: 500px">
		<p>Name</p>
		<input name="name" style="font-size: 30px">
		<p>Login</p>
		<input name="login" style="font-size: 30px">
		<p>Password</p>
		<input type="password" name="code" style="font-size: 30px">
		<p></p>
		<input type="submit" value="Sign Up" name="signup"
			style="font-size: 30px; padding-left: 2%; padding-right: 2%;">
	</form>
</body>
</html>