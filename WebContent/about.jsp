<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>About</title>
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
	</div>
	
	<br>
	<h2>About</h2>
	
</body>
</html>