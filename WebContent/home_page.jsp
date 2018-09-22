<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<head>
	<title>WebApp-YahooFinanceScraper</title>
</head>

<body>

	<!-- set up a link for each student -->
	<c:url var="cryptocurrencies" value="Servlet">
		<c:param name="command" value="LIST" />
	</c:url>

	<div class="topnav">
	  <a href="#home">Home</a>
	  <a href="#about">About</a>
	  <a href="${cryptocurrencies}">Cryptocurrencies</a>
	  <a href="#login">Login</a>
	</div>
	
	<button>Login</button>
	<button>Create Account</button>

</body>

</html>