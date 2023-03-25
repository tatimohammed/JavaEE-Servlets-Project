<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
	
	<head>
		<meta charset="UTF-8">
		<title>Login Page</title>
	</head>
	
	<body style="background-color: rgb(15, 43, 54);">
		<h3 style="text-align: center; font-size: 40px; color: white; margin-top: 10%;">Login Page</h3>
		<form action="Login" method="POST"
			style="border: 5px solid rgb(52, 75, 11);border-radius: 3%;margin-left: auto; height:350px; margin-right: auto; font-size: 20px; background-color: rgb(211, 247, 145); width: 500px;">
	
			<p style="margin-left: 30px;margin-top: 50px;">Login</p>
			<input name="login" style="margin-left: 30px;font-size: 15px;" placeholder="Enter your name" size="40">
			<p style="margin-left: 30px;margin-top: 30px;">Password</p>
			<input type="password" name="code" style="font-size: 15px; margin-left: 30px;" placeholder="Enter your password"
				size="40"><br>
			<input type="submit" value="Log In" name="login"
				style="margin-left: 30px; font-size: 20px; padding-left: 2%; padding-right: 2%;margin-top: 50px; color: white; background-color: rgb(52, 75, 11); "><br>
			<a href="http://localhost:8080/firstApp/CreateAccount.jsp"
				style="margin-top: 50px;font-size: 15px; text-align: center; color: black; margin-left: 30px; ">Create your
				account</a>
		</form>
	</body>
	
	</html>