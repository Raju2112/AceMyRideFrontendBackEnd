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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<link rel="icon" href="${image}/favicon.ico">
	<link rel="stylesheet" type="text/css" href="${style}/styles.css"></head>
</head>
<body>

<nav class="navbar navbar-default">
  <div class="container-fluid">
  
    <div class="navbar-header">
      <a class="navbar-brand" href="#"><img src="${image}/logo.png" class="img-responsive" style="height: 60px; margin-left: 10px;"></a>
    </div>
   
   <br>
    <ul class="nav navbar-nav">

    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Categories
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
            
          <li class="dropdown dropdown-submenu" ><a class="dropdown-toggle" data-toggle="dropdown" href="#">Category 1</a>
          <ul class="dropdown-menu">
          <li><a href="#">Product 1.1</a></li>
          <li><a href="#">Product 1.2</a></li>
          <li><a href="#">Product 1.3</a></li>
          </ul>
          </li>
          <li class="dropdown dropdown-submenu" ><a class="dropdown-toggle" data-toggle="dropdown" href="#">Category 2</a>
              <ul class="dropdown-menu">
          <li><a  href="#">Product 2.1</a></li>
          <li><a  href="#">Product 2.2</a></li>
          <li><a  href="#">Product 2.3</a></li>
          </ul>
          </li>
          <li class="dropdown dropdown-submenu" ><a class="dropdown-toggle" data-toggle="dropdown" href="#">Category 3</a>
            <ul class="dropdown-menu">
          <li><a  href="#">Product 3.1</a></li>
          <li><a  href="#">Product 3.2</a></li>
          <li><a  href="#">Product 3.3</a></li>
          </ul>
          </li>
        </ul>
      </li>
      <li class="active"><a href="./">Home</a></li>
      <li><a href="aboutUs">About Us</a></li>
      <li><a href="#">Contact Us</a></li>
      <li><a href="#">Careers</a></li>
    </ul>
  

  
<ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
    </div>

    </nav>

    


