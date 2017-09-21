<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
	<title>AceMyRide</title>
	<c:url var="image" value="/resources/images"></c:url>
	<c:url var="script" value="/resources/scripts"></c:url>
	<c:url var="style" value="/resources/styles"></c:url>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	
	<link rel="icon" href="${image}/favicon.ico">
	<link rel="stylesheet" type="text/css" href="${style}/main-style.css">
	<link rel="stylesheet" type="text/css" href="${style}/adminPanel.css">
	<link rel="stylesheet" type="text/css" href="${style}/styles.css">
</head>
<body>

	<div class="header">
			<c:if test="${empty isLoggedIn }">
			<a href="./"><img src="${image}/logo-dark.png" class="logo-image-large"></a>
			</c:if>
			<c:if test="${isLoggedIn}">
			<a href="./"><img src="${image}/icon-ace-light.png" class="logo-image-large"></a>
			</c:if>
			<div class="search-form form-group">
				<form class="" action="search">
					<div class="input-group">
						<div class="input-group-addon"><span class="glyphicon glyphicon-search"></span></div>
						<input type="text" name="searchText" class="form-control">
						<span class="input-group-btn"><input type="submit" class="form-control btn btn-secondary btn-search" value="Search"></span>
					</div>
				</form>
			</div>
			<nav class="menu">
				<ul class="clearfix">
					
					<li><a>Categories<span class="arrow">&#9660;</span></a>
							<ul class="sub-menu">
								<c:forEach var="x" items="${listOfCategories}">
								<li><a href="categoryUser?name=${x.name}"><c:out value="${x.name}"/></a></li>
								</c:forEach>
							</ul>
					</li>
					<li class="active"><a href="./">Home</a></li>
					<li><a href="aboutUs">About Us</a></li>
					<li><a href="contactUs">Contact Us</a></li>
					<c:if test="${empty isLoggedIn}">
						<li><a href="login"><span class="glyphicon glyphicon-user"></span> Login/Register</a></li>
						
					</c:if>
					<c:if test="${isLoggedIn}">
				     <li><a href="cart"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
              			<li><a href="profile">Hi, <c:out value="${userName}"></c:out></a></li>

               		<li><a href="userLogout"><span class="glyphicon glyphicon-user"></span>Logout</a></li>
       			</c:if>
       			
				</ul>
			</nav>
		</div>
	</div>