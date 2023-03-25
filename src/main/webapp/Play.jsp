<%@page import="java.util.ArrayList"%>
<%@page import="com.info.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
	
	<head>
		<meta charset="UTF-8">
		<title>Game - TweetyX</title>
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
			style="border-radius: 15px;text-align: center; margin-left: auto; margin-right: auto; width: 600px; height: 500px; background-color: rgb(211, 247, 145);">
			<h2
				style="font-size: 30px;background-color: rgb(52, 75, 11); color: white; letter-spacing: 16px;padding-bottom: 1%; padding-top: 1%;">
				GAME</h2>
			<h3 style="font-size: 25px; margin-top: 25%; color: rgb(52, 75, 11);">Dice Number</h3>
			<form action="Game" method="POST">
				<select name="selectdice"
					style="background-color: yellow;border-color: gb(52, 75, 11); font-size: 20px; text-align: center;">
					<option value="none">Choose a Dice</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
				</select><br>
				<input
					style="color: white; background-color: rgb(52, 75, 11); border-color: white; font-size: 20px; text-align: center; margin-top: 7%"
					type="submit" name="lance" value="Roll a Dice">
	
			</form>
			<h4 style="color: black; font-size: 35px; margin-top: 5%">
				<% ArrayList<Dice> dicelist = (ArrayList<Dice>) session.getAttribute("dicelist");
						if(dicelist != null){
						out.print(dicelist.get(dicelist.size()-1).getDiceRes());
						} else{
						out.print("NA");
						}
						User u = (User) session.getAttribute("user");
						%>
			</h4>
			<p style="color: rgb(139, 0, 0); font-size: 20px; margin-top: 10%">Actual
				Score: <%out.print(u.getScore());%> | Best Score: <%out.print(u.getBestScore()); %>
			</p>
		</div>
		<div style="margin-left: auto; margin-right: auto;text-align: center; margin-top: 2%;">
			<a style="background-color: rgb(52, 75, 11); padding: 10px; border: 3px solid white;border-radius: 25px; font-size: 20px; color: white; text-decoration: none; margin: 20px"
				href="/firstApp/UserHome.jsp">LEADERBOARD</a> <a
				style="background-color: rgb(52, 75, 11); padding: 10px; border: 3px solid white;border-radius: 25px; font-size: 20px; color: white; text-decoration: none; margin: 20px"
				href="http://localhost:8080/firstApp/Logout">LOG OUT</a>
		</div>
	</body>
	
	</html>