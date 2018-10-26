<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="vendors/css/normalize.css">
		<link rel="stylesheet" type="text/css" href="vendors/css/grid.css">
		<link rel="stylesheet" type="text/css" href="resources/css/style.css">
		<link href='https://fonts.googleapis.com/css?family=Lato:100,300,300i,400' rel="stylesheet" type="text/css">
		<title>Home</title>
	</head>
	<body>
		<c:url var="about" value="Servlet">
			<c:param name="command" value="ABOUT" />
		</c:url>
		<c:url var="cryptocurrencies" value="Servlet">
			<c:param name="command" value="LIST" />
		</c:url>	
		
		<header>
			<nav>
				<div class="row">
					<ul class="main-nav">
						<li><a href="home_page.jsp">Home</a></li>
						<li><a href="${about}">About</a></li>
						<li><a href="${cryptocurrencies}">Crypto Update</a></li>
						<li><a href="LoginPage.jsp">Log In</a></li>
					</ul>
				</div>
			</nav>			
		</header>
		<section>
			<div class="row">
				<div class="hero-text-box">    
	                <h1>Get a quick Crypto Update now.</h1>
	                <a class="btn btn-full" href="createAccount.jsp">Create Account</a>
	                <a class="btn btn-ghost" href="LoginPage.jsp">Log In</a>
            	</div>
			</div>
		</section>
		
	</body>

</html>







<!--

				FRONT END JUNK I CAN'T DELETE JUST YET



               <input type="button" value="Create Account" 
					onclick="window.location.href='createAccount.jsp'; return false;"
					class="btn btn-full"
				/>
                <input type="button" value="Log In" 
					onclick="window.location.href='LoginPage.jsp'; return false;"
					class="btn btn-ghost"
					
				<li><a href="#login" onclick="window.location.href='LoginPage.jsp'; return false;">Log In</a></li>	
					
					
					
					
					
					
					
				/> -->