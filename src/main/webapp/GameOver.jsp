<%@page import="java.util.ArrayList"%>
<%@page import="com.info.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
	
	<head>
		<meta charset="UTF-8">
		<title>Game Over - TweetyX</title>
	</head>
	
	<body style="background-color: rgb(15, 43, 54);">
		<div style="text-align: center; font-size: 10px; margin-top: 5%;">
			<h1>
				<span style="color: yellow;background-color: black; padding: 3px; border-radius: 10px 0px 0px 10px;">
					WELCOME
				</span>
	
				<span style="color: black;background-color: yellow; padding: 3px; border-radius: 0px 10px 10px 0px;">
					<% User user=(User) session.getAttribute("user"); out.print(user.getName()); %>
				</span>
			</h1>
		</div>
		<div id="game"
			style="border-radius: 3%;border: 5px solid rgb(52, 75, 11);text-align: center; margin-left: auto;margin-right: auto; width: 600px; height: 500px; background-color: rgb(211, 247, 145);">
			<h1 style="color: rgb(52, 75, 11);padding-top: 17%; font-size: 50px">Game Over</h1>
			<form action="Game" method="POST">
				<input
					style="color: white; background-color: rgb(52, 75, 11); border-color: white; font-size: 20px; text-align: center; margin-top: 7%"
					type="submit" value="REPLAY" name="replay">
			</form>
			<% User u=(User) session.getAttribute("user"); %>
				<p style="color: rgb(139, 0, 0); font-size: 20px; margin-top: 30%">Actual
					Score: <% out.print(u.getScore());%> | Best Score: <% out.print(u.getBestScore()); %>
				</p>
		</div>
		<div style="text-align: center; margin-top: 2%;">
			<a style="background-color: rgb(52, 75, 11); padding: 10px; border: 3px solid white;border-radius: 25px; font-size: 20px; color: white; text-decoration: none; margin: 20px"
				href="/firstApp/UserHome.jsp">LEADERBOARD</a> <a
				style="background-color: rgb(52, 75, 11); padding: 10px; border: 3px solid white;border-radius: 25px; font-size: 20px; color: white; text-decoration: none; margin: 20px"
				href="http://localhost:8080/firstApp/Logout">LOG OUT</a>
		</div>
	</body>
	
	</html>