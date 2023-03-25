<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
	
	<head>
		<meta charset="UTF-8">
		<title>Create Account Page</title>
	</head>
	
	<body style="background-color: rgb(15, 43, 54);">
		<h3 style="text-align: center; font-size: 40px; color: white; margin-top: 7%;">Create your account</h3>
		<form action="Signup"
			style="border: 5px solid rgb(52, 75, 11);border-radius: 3%; font-size: 20px; background-color: rgb(211, 247, 145); width: 500px; padding: 10px; margin-right: auto; margin-left: auto;">
			<p style="margin-left: 30px;margin-top: 50px;">Name</p>
			<input name="name" style="font-size: 15px; margin-left: 30px;" placeholder="Enter your full name" size="40">
			<p style="margin-left: 30px;margin-top: 30px;">Login</p>
			<input name="login" style="font-size: 15px; margin-left: 30px;" placeholder="Enter your email or username"
				size="40">
			<p style="margin-left: 30px;margin-top: 30px;">Password</p>
			<input type="password" name="code" style="font-size: 15px; margin-left: 30px;"
				placeholder="Enter your super password" size="40">
			<p></p>
			<input type="submit" value="Sign Up" name="signup"
				style="margin-left: 30px; font-size: 20px; padding-left: 2%; padding-right: 2%;margin-top: 20px; color: white; background-color: rgb(52, 75, 11); ">
		</form>
	</body>
	
	</html>