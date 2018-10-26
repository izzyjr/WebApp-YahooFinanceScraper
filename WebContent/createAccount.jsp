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
		<title>Create Account</title>
	</head>
	<body>		
		<section>
            <div class="row">
                <h2>Create Account</h2>
            </div>
            <div class="row">
                <form action="Servlet" method="post" class="contact-form">
                <input type="hidden" name="command" value="CREATE_ACCOUNT">
                	<div class="row">
                        <div class="col span-1-of-3">
                            <label>First Name</label>
                        </div>
                        <div class="col span-2-of-3">
                            <input type="text" name="first" placeholder="First name" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col span-1-of-3">
                            <label>Last Name</label>
                        </div>
                        <div class="col span-2-of-3">
                            <input type="text" name="last" placeholder="Last name" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col span-1-of-3">
                            <label>Username</label>
                        </div>
                        <div class="col span-2-of-3">
                            <input type="text" name="un" placeholder="Username" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col span-1-of-3">
                            <label>Password</label>
                        </div>
                        <div class="col span-2-of-3">
                            <input type="password" name="pw" placeholder="Password" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col span-1-of-3">
                            <label>&nbsp;</label>
                        </div>
                        <div class="col span-2-of-3">
                            <input type="submit" value="Create Account">
                        </div>
                    </div>
                </form>
                <div class="row">
	                <div class="back-home">
		                <div class="col span-1-of-3">
							<a href="home_page.jsp">Back Home</a>
		                 </div>
	             	</div>
             	</div>
            </div>
        </section>
        
	</body>
		
</html>

		
		
		
		
		
		
		
		<!-- 
		
		
		
			FRONT END JUNK I CAN'T DELETE JUST YET
		
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
		
			-->