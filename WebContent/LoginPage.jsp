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
		<title>Log In Page</title>
	</head>
	<body>		
		<section>
            <div class="row">
                <h2>Log In</h2>
            </div>
            <div class="row">
                <form action="Servlet" method="post" class="contact-form">
                <input type="hidden" name="command" value="LOGIN">
                    <div class="row">
                        <div class="col span-1-of-3">
                            <label>Username</label>
                        </div>
                        <div class="col span-2-of-3">
                            <input type="text" name="un" placeholder="Your Name" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col span-1-of-3">
                            <label>Password</label>
                        </div>
                        <div class="col span-2-of-3">
                            <input type="password" name="pw" placeholder="Your Password" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col span-1-of-3">
                            <label>&nbsp;</label>
                        </div>
                        <div class="col span-2-of-3">
                            <input type="submit" value="Log In">
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
		
		<h3>Log In</h3>	
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
						<td><label></label></td>
						<td><input type="submit" value="Log In" class="save"></td>
					</tr>
				</tbody>
			</table>	
		</form>	
		
			
	 -->