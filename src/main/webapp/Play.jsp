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
<body>
	<div style="color: blue; text-align: center; font-size: 10px">
		<h1>
			WELCOME
			<span style="background-color: yellow; padding: 3px;">
			<%
			User h = (User) session.getAttribute("user");
		out.print(h.getName());
		%>
			</span>
			
		</h1>
	</div>
	<div id="game"
		style="border-radius: 15px;text-align: center; margin-left: 30%; width: 600px; height: 500px; background-color: skyblue;">
		<h2
			style="background-color: white; border: 2px solid skyblue; color: blue; letter-spacing: 4px; width: 597px; text-align: center;">GAME</h2>
		<h3 style="font-size: 25px; margin-top: 25%; color: blue;">Dice
			Number</h3>
		<form action="Game" method="POST">
			<select name="selectdice" style="border-color: blue; font-size: 20px; text-align: center;">
                <option value="none">Choose a Dice</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
            </select><br>
			<input
				style="color: blue; background-color: white; border-color: blue; font-size: 20px; text-align: center; margin-top: 7%"
				type="submit" name="lance" value="Lance">

		</form>
		<h4 style="color: green; font-size: 35px; margin-top: 7%">
		<%
		ArrayList<Dice> dicelist = (ArrayList<Dice>) session.getAttribute("dicelist");
		if(dicelist != null){
			out.print(dicelist.get(dicelist.size()-1).getDiceRes());
		} else{
			out.print("NA");
		}
		User u = (User) session.getAttribute("user");
		%>
		</h4>
		<p style="color: red; font-size: 20px; margin-top: 10%">Actual
			Score: <%out.print(u.getScore());%> | Best Score: <%out.print(u.getBestScore()); %></p>
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