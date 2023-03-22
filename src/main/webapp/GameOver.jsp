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
<body>
	<div style="color: blue; text-align: center; font-size: 10px">
		<h1>
			WELCOME
			<span style="background-color: yellow; padding: 3px;">
			<%
		out.print(session.getAttribute("user").toString());
		%>
		</span>
		</h1>
	</div>
	<div id="game"
		style="border: 5px solid lightgreen;text-align: center; margin-left: 30%; width: 600px; height: 500px; background-color: skyblue;">
		<h1 style="padding-top: 17%; font-size: 50px">Game Over</h1>
		<form action="Game" method="POST">
			<input style="color: blue; background-color: white; border-color: blue; font-size: 20px; text-align: center; margin-top: 7%" type="submit" value="REPLAY" name="replay">
		</form>
		<%
		User u = (User) session.getAttribute("user");
		%>
		<p style="color: red; font-size: 20px; margin-top: 30%">Actual
			Score: <% out.print(u.getScore());%> | Best Score: <% out.print(u.getBestScore()); %></p>
	</div>
	<div style="text-align: center; margin-top: 2%;">
		<a
			style="background-color: blue; padding: 10px; border-radius: 25px; font-size: 20px; color: white; text-decoration: none; margin: 20px"
			href="/firstApp/UserHome.jsp">LEADERBOARD</a> <a
			style="background-color: blue; padding: 10px; border-radius: 25px; font-size: 20px; color: white; text-decoration: none; margin: 20px"
			href="http://localhost:8080/firstApp/Logout">LOG OUT</a>
	</div>
</body>
</html>