<%@page import="com.info.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Page</title>
</head>
<body style="background-color: black;">
	<div style="text-align: center;">
		<%
		Message msg = (Message) getServletContext().getAttribute("error");
		%>
		<h1 style="margin-block-end: 0em;margin-top: 9%; font-size: 300px; color: white;">
		<%
		if(msg != null){
			out.print(msg.getCode());
		}
		%>
		</h1>
		<h2 style="color:white">
		<%
		if(msg != null){
			out.print(msg.getMsg());
		}
		%>
		</h2>
	</div>
</body>
</html>