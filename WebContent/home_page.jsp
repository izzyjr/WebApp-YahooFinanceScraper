<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

	<head>
		<title>Home</title>
	</head>
	
	<body>
		<c:url var="about" value="Servlet">
			<c:param name="command" value="ABOUT" />
		</c:url>
		<c:url var="cryptocurrencies" value="Servlet">
			<c:param name="command" value="LIST" />
		</c:url>	
		
		<div class="topnav">
		  <a href="#home" onclick="window.location.href='home_page.jsp'; return false;">Home</a>
		  <a href="${about}">About</a>
		  <a href="${cryptocurrencies}">Cryptocurrencies</a>
		  <a href="#login" onclick="window.location.href='LoginPage.jsp'; return false;">Log In</a>
		</div>
		
		<input type="button" value="Log In" 
			onclick="window.location.href='LoginPage.jsp'; return false;"
			class="add-student-button"
		/>
		<br>
		<input type="button" value="Create Account" 
			onclick="window.location.href='createAccount.jsp'; return false;"
			class="add-student-button"
		/>
	</body>

</html>