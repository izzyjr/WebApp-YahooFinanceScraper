<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<head>
	<title>Home</title>
</head>

<body>

	<!-- set up a link for each student -->
	<c:url var="cryptocurrencies" value="Servlet">
		<c:param name="command" value="LIST" />
	</c:url>
	<c:url var="about" value="Servlet">
		<c:param name="command" value="ABOUT" />
	</c:url>	

	<div class="topnav">
	  <a href="#home">Home</a>
	  <a href="${about}">About</a>
	  <a href="${cryptocurrencies}">Cryptocurrencies</a>
	  <a href="#login" onclick="window.location.href='LoginPage.jsp'; return false;">Login</a>
	</div>
	
	<input type="button" value="Login" 
		onclick="window.location.href='LoginPage.jsp'; return false;"
		class="add-student-button"
	/>
	<button>Create Account</button>

</body>

</html>