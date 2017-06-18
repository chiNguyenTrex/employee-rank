<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>Home</title>
	<link rel="stylesheet" href="">
	<style>
		.navbar {
			background-color: white;
		}
		
		.navbar-brand {
			padding-top: 0px;
		}
		
		img {
			height: 50px;
			width: auto;
		}
		.navbar .nav>li>a {
			color: #307D7E;
			font-weight: bold;
		}
		.navbar .nav>li:hover {
			background: #008080;
		}
	</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	  <div class="container">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="index.io"><img src='<c:url value="/resources/images/logo.png" />'/></a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li><a href="userlist.io">User management</a></li>
	      <li><a href="stafflist.io">Staff management</a></li>
	      <li><a href="recordlist.io">Record management</a></li>
	      <li><a href="departlist.io">Depart management</a></li>
	      <li style="color: white; margin-left: 200px; text-decoration: none"><a href="logout.io">Logout</a></li>
	    </ul>
	  </div>
	</nav>
	<div class="container">
		
	</div>
</body>
</html>