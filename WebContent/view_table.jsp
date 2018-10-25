<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.webscraper.user.User"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="vendors/css/normalize.css">
		<link rel="stylesheet" type="text/css" href="vendors/css/grid.css">
		<link rel="stylesheet" type="text/css" href="vendors/css/ionicons.min.css">
		<link rel="stylesheet" type="text/css" href="resources/css/style.css">
		<link href='https://fonts.googleapis.com/css?family=Lato:100,300,300i,400' rel="stylesheet" type="text/css">
		<title>Crypto Update</title>
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
		
		<header>
			<nav>
				<div class="row">
					<ul class="main-nav">
						<li><a href="${home}">Home</a></li>
						<li><a href="${about}">About</a></li>
						<li><a href="${cryptocurrencies}">Crypto Update</a></li>
						<li><a href="${yourAccount}">${currentSessionUser.firstName}'s Account</a></li>
						<li><a href="${logout}">Log Out</a></li>
					</ul>
				</div>
			</nav>
			<div class="title-time-box">    
                <h2>Crypto Update - <%= new java.util.Date() %></h2>
            </div>
		</header>
		<section>
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
		</section>
		
	</body>
	
</html>