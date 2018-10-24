<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>

	<head>
		<title>Invalid Login</title>
	</head>
	<body>	
		<h2>Log In</h2>
		<h3> Sorry, your log in information is incorrect. If you are a new user, please create an account.</h3>
		<form action="Servlet" method="post">
			<input type="hidden" name="command" value="LOGIN">
			<table>
				<tbody>
					<tr>
						<td><label>Username:</label></td>
						<td><input type="text" name="un"></td>
					</tr>
					<tr>
						<td><label>Password:</label></td>
						<td><input type="password" name="pw"></td>
					</tr>
					<tr>
						<td><input type="submit" value="Log In" class="save"></td>
					</tr>
					<tr>
						<td><input type="button" value="Create Account" 
							onclick="window.location.href='createAccount.jsp'; return false;"
							class="add-student-button"
						/></td>
					</tr>
				</tbody>
			</table>	
		</form>
		<p>
			<a href="Servlet" onclick="window.location.href='home_page.jsp'; return false;">Home</a>
		</p>
	</body>

</html>