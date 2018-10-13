<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.webscraper.user.User"%>

<html>

<head>
	<title>WebApp-YahooFinanceScraper</title>
</head>

<body>

	<% 
	
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0
		response.setHeader("Expires", "0"); //Proxies
	
	%>

	<!-- set up a link for each student -->
	<c:url var="cryptocurrencies" value="Servlet">
		<c:param name="command" value="LIST" />
	</c:url>
	<c:url var="logout" value="Servlet">
		<c:param name="command" value="LOGOUT" />
	</c:url>
		

	<div class="topnav">
	  <a href="#home">Home</a>
	  <a href="#about">About</a>
	  <a href="${cryptocurrencies}">Cryptocurrencies</a>
	  <a href="${logout}">Logout</a>
	</div>

</body>

</html>