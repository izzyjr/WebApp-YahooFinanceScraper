<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.webscraper.user.User"%>
<html>

<head>
	<title>Cryptocurrencies</title>
	<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body>

	<% 
	
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0
		response.setHeader("Expires", "0"); //Proxies
		
		if(session.getAttribute("currentSessionUser") ==  null) {
			
			response.sendRedirect("home_page.jsp");
			
		}
	
	%>

	<!-- set up a link for each student -->
	<c:url var="home" value="Servlet">
		<c:param name="command" value="HOME" />
	</c:url>
	<c:url var="about" value="Servlet">
		<c:param name="command" value="ABOUT" />
	</c:url>
	<c:url var="cryptocurrencies" value="Servlet">
		<c:param name="command" value="LIST" />
	</c:url>
	<c:url var="logout" value="Servlet">
		<c:param name="command" value="LOGOUT" />
	</c:url>
	
	<div class="topnav">
	  <a href="${home}">Home</a>
	  <a href="${about}">About</a>
	  <a href="${cryptocurrencies}">Cryptocurrencies</a>
	  <a href="${logout}">Logout</a>
	  ${currentSessionUser.firstName}
	</div>

	<div id="wrapper">
		<div id="header">
			<h2>Cryptocurrencies - <%= new java.util.Date() %></h2>
		</div>
	</div>

	<div id="container">
	
		<div id="content">
		
			<table>
	
				<tr>
					<th>#</th>
					<th>Symbol</th>
					<th>Name</th>
					<th>Price</th>
					<th>% Change</th>
					<th>Market Cap</th>
					<th>Volume in Currency (24Hr)</th>
					<th>Circulating Supply</th>
				</tr>
			
		
				<c:forEach var="tempCoins" items="${coin_list}">
						
					<tr>
						<td>${tempCoins.numberOrder}</td>
						<td>${tempCoins.symbol}</td>
						<td>${tempCoins.name}</td>
						<td>${tempCoins.price}</td>
						<td>${tempCoins.percentChange}</td>
						<td>${tempCoins.marketCap}</td>
						<td>${tempCoins.volumeCurrency}</td>
						<td>${tempCoins.circulatingSupply}</td>
					</tr>
					
				</c:forEach>
	
			</table>
			
		</div>
		
	</div>
	
</body>
</html>