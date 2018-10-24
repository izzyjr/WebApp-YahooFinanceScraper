<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.webscraper.user.User"%>

<html>
	<head>
		<title>Home</title>
	</head>
	<body>
	
		<% 
		
			response.setHeader("Pragma", "no-cache"); //HTTP 1.0
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
			response.setHeader("Expires", "0"); //Proxies
			
			if(session.getAttribute("currentSessionUser") ==  null) {
				
				response.sendRedirect("home_page.jsp");
				
			}
		
		%>
	
		<c:url var="home" value="Servlet">
			<c:param name="command" value="HOME" />
		</c:url>
		<c:url var="about" value="Servlet">
			<c:param name="command" value="ABOUT" />
		</c:url>
		<c:url var="cryptocurrencies" value="Servlet">
			<c:param name="command" value="LIST" />
		</c:url>
			<c:url var="yourAccount" value="Servlet">
			<c:param name="command" value="ACCOUNT" />
		</c:url>
		<c:url var="logout" value="Servlet">
			<c:param name="command" value="LOGOUT" />
		</c:url>
		
		<div>
		  <a href="${home}">Home</a>
		  <a href="${about}">About</a>
		  <a href="${cryptocurrencies}">Cryptocurrencies</a>
		  <a href="${yourAccount}">${currentSessionUser.firstName}'s Account</a>
		  <a href="${logout}">Log Out</a>
		</div>
	
	</body>

</html>