<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<head>
		<title>Create Account</title>
	</head>
	<body>
		<h2>Cryptocurrency Update</h2>
		<h3>Create Account</h3>
		<form action="Servlet" method="post">
			<input type="hidden" name="command" value="CREATE_ACCOUNT">
				<table>
					<tbody>
					<tr>
						<td><label>First Name:</label></td>
						<td><input type="text" name="first"></td>
					</tr>
					<tr>
						<td><label>Last Name:</label></td>
						<td><input type="text" name="last"></td>
					</tr>
					<tr>
						<td><label>Username:</label></td>
						<td><input type="text" name="un"></td>
					</tr>
					<tr>
						<td><label>Password:</label></td>
						<td><input type="password" name="pw"></td>
					</tr>
					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Sign Up" class="save"></td>
					</tr>
					</tbody>
				</table>
		</form>
		<p>
			<a href="Servlet" onclick="window.location.href='home_page.jsp'; return false;">Home</a>
		</p>
	</body>
	
</html>