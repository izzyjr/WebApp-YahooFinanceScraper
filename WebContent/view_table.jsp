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
		</header>
		<section>
			<div class="title-time-box">    
	        	<h2>Crypto Update - <%= new java.util.Date() %></h2>
	        </div>
	        <div class="row">
				<table>
					<tr>
						<th class="left-cells">#</th>
						<th class="left-cells">Symbol</th>
						<th class="left-cells">Name</th>
						<th>Price</th>
						<th class="right-cells">% Change</th>
						<th class="right-cells">Market Cap</th>
						<th class="right-cells">Volume in Currency (24Hr)</th>
						<th class="right-cells">Circulating Supply</th>
					</tr>				
					<c:forEach var="tempCoins" items="${coin_list}">				
						<tr class="shade">
							<td class="left-cells">${tempCoins.numberOrder}</td>
							<td class="left-cells">${tempCoins.symbol}</td>
							<td class="left-cells">${tempCoins.name}</td>
							<td class="right-cells">${tempCoins.price}</td>
							<td class="right-cells">${tempCoins.percentChange}</td>
							<td class="right-cells">${tempCoins.marketCap}</td>
							<td class="right-cells">${tempCoins.volumeCurrency}</td>
							<td class="right-cells">${tempCoins.circulatingSupply}</td>
						</tr>		
					</c:forEach>
				</table>
			</div>	
		</section>
		<div class="footer">
            <div class="row">
            	<div class="col span-1-of-2">
            	</div>
                <div class="col span-1-of-2">
                    <ul class="social-links">
                        <li><a href="https://twitter.com/Izzy_Mesa"><i class="ion-social-twitter"></i></a></li>
                        <li><a href="https://github.com/izzyjr"><i class="ion-social-github"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <p>
                    Copyright &copy; 2018 by Israel Mesa. All rights reserved.
                </p>
            </div>
        </div>
		
	</body>
	
</html>