<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
	<title>MVC-WebScraperTwo</title>
	<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body>

	<div id="wrapper">
		<div id="header">
			<h2>Cryptocurrencies - <%= new java.util.Date() %></h2>
		</div>
	</div>

	<div id="container">
	
		<div id="content">
		
			<table>
	
				<tr>
					<th>#</th>
					<th>Symbol</th>
					<th>Name</th>
					<th>Price</th>
					<th>% Change</th>
					<th>Market Cap</th>
					<th>Volume in Currency (24Hr)</th>
					<th>Circulating Supply</th>
				</tr>
			
		
				<c:forEach var="tempCoins" items="${coin_list}">
						
					<tr>
						<td>${tempCoins.numberOrder}</td>
						<td>${tempCoins.symbol}</td>
						<td>${tempCoins.name}</td>
						<td>${tempCoins.price}</td>
						<td>${tempCoins.percentChange}</td>
						<td>${tempCoins.marketCap}</td>
						<td>${tempCoins.volumeCurrency}</td>
						<td>${tempCoins.circulatingSupply}</td>
					</tr>
					
				</c:forEach>
	
			</table>
			
		</div>
		
	</div>
	
</body>
</html>