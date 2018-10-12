<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.webscraper.user.User"%>

<html>

<head>
	<title>WebApp-YahooFinanceScraper</title>
</head>

<body>

	<% 
	
		User currentUser = ((User) (session.getAttribute("currentSessionUser")));
	
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
	
	<input type="button" value="Login" 
		onclick="window.location.href='LoginPage.jsp'; return false;"
		class="add-student-button"
	/>
	<button>Create Account</button><br>
	
	Welcome <%= currentUser.getFirstName() + " " + currentUser.getLastName() %>
	

</body>

</html>