<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.info.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<style type="text/css">
table, th, td {
  border: 1px solid blue;
  padding: 10px;
}
tbody {
    background-color: #fff;
}
th{
	background-color: yellow;
}
table{
	background-color: lightgreen;
}
</style>
</head>
<body>
	<nav
		style="width: 100%; background-color: skyblue; padding-bottom: 20px; padding-top: 20px; text-align: center">
		<a
			style="background-color: white; padding: 10px; border-radius: 25px; font-size: 20px; color: blue; text-decoration: none; margin: 20px"
			href="/firstApp/Play.jsp">PLAY</a> <a
			style="background-color: white; padding: 10px; border-radius: 25px; font-size: 20px; color: blue; text-decoration: none; margin: 20px"
			href="http://localhost:8080/firstApp/Logout">LOG OUT</a>
	</nav>
	<div style="color: blue; text-align: center; font-size: 10px">
		<h1>
			WELCOME
			<span style="background-color: yellow; padding: 3px;">
			<%
		User user = (User) session.getAttribute("user");
		out.print(user.getName());
		%>
			</span>
			
		</h1>
	</div>
	<div id="leaderboard"
		style="margin-left: 30%; width: 600px; height: 500px; background-color: skyblue;">
		<h2
			style="background-color: white; border: 2px solid skyblue; color: blue; letter-spacing: 4px; width: 597px; text-align: center;">OTHER
			USERS SCORES</h2>
		<p style="line-height: 40px; text-align: center;">
		</p>
			<table style="text-align: center; font-size: 20px; line-height: 40px; margin-left: 28%">
				<tr>
					<th>User Name</th>
					<th>Best Score</th>
				</tr>
				<%
				ArrayList<User> list = (ArrayList<User>) getServletContext().getAttribute("listuser");
				for(User ut: list){
					if (ut.getName().equals(user.getName())) {
						out.print("<tr>");
						out.print("<td>YOU</td>");
						out.print("<td>"+user.getBestScore()+"</td>");
						out.print("</tr>");
					} else{
						out.print("<tr>");
						out.print("<td>"+ut.getName()+"</td>");
						out.print("<td>"+ut.getBestScore()+"</td>");
						out.print("</tr>");
					}

				}
				%>
			</table>

	</div>
</body>
</html>