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
			table,
			th,
			td {
				border: 1px solid rgb(15, 43, 54);
				padding: 10px;
			}
	
			tbody {
				background-color: #fff;
			}
	
			th {
				background-color: yellow;
			}
	
			table {
				background-color: rgb(52, 75, 11);
				border-radius: 15px;
			}
		</style>
	</head>
	
	<body style="background-color: rgb(15, 43, 54);">
		<h3 style="text-align: center; font-size: 30px; color: white; margin-top: 3%;">User Home</h3>
		<nav style="padding-bottom: 20px; padding-top: 20px; text-align: center">
			<a style="background-color: rgb(52, 75, 11); padding: 10px; border: 3px solid white;border-radius: 25px; font-size: 15px; color: white; text-decoration: none; margin: 20px"
				href="/firstApp/Play.jsp">PLAY</a> <a
				style="background-color: rgb(52, 75, 11); padding: 10px; border: 3px solid white;border-radius: 25px; font-size: 15px; color: white; text-decoration: none; margin: 20px"
				href="http://localhost:8080/firstApp/Logout">LOG OUT</a>
		</nav>
		<div style="text-align: center; font-size: 10px;">
			<h1>
				<span style="color: yellow;background-color: black; padding: 3px; border-radius: 10px 0px 0px 10px;">
					WELCOME
				</span>
	
				<span style="color: black;background-color: yellow; padding: 3px; border-radius: 0px 10px 10px 0px;">
					<% User user=(User) session.getAttribute("user"); out.print(user.getName()); %>
				</span>
	
			</h1>
		</div>
		<div id="leaderboard"
			style="border-radius: 3%;border: 3px solid rgb(52, 75, 11);margin-left: auto; margin-right: auto; width: 600px; height: 500px; background-color: rgb(211, 247, 145);">
			<h2 style="font-size:20px; color: rgb(52, 75, 11); letter-spacing: 4px; text-align: center;">OTHER
				USERS SCORES</h2>
			<hr style="background-color: rgb(52, 75, 11); height: 3px; border: 0px;">
			<table
				style="text-align: center; font-size: 15px; line-height: 30px; margin-left: auto; margin-right: auto; margin-top: 10px;">
				<tr>
					<th>User Name</th>
					<th>Best Score</th>
				</tr>
				<% ArrayList<User> list = (ArrayList<User>) getServletContext().getAttribute("listuser");
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