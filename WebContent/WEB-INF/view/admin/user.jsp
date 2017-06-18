<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	<title>User</title>
	<link rel="stylesheet" href="">
	<style>
		/* Global CSS */
		.navbar {
			background-color: #2E363F;
		}
		.navbar-brand {
			padding-top: 0px;
		}
		img {
			margin-top: 10px;
			height: auto;
			width: 200px;
		}
		.navbar .nav>li>a {
			color: #939da8;
			font-weight: bold;
		}
		.navbar .nav>li:hover {
			background: #08c;
		}
		
		/* Tabel CSS */
		h3 {
			margin-bottom: 20px;
			margin-top: 80px;
			color: #08c;
		}


		.mytable {
			width: 100%;
			border: 1px solid #736F6E;
			border-spacing: 0;
			border-collapse: collapse;
			font-family: Helvetica;
			font-size: 16px;
			background: #f9f9f9;
		}
		
		.mytable tr {
			border: 1px solid #736F6E;
		}
		
		.mytable td, .mytable th {
			border: 1px solid #736F6E;
			padding: 6px 6px 6px 16px;
			text-align: left;
		}
		.mytable th {
			background-color: #08c;
		}
		
		input[type=submit] {
			margin-bottom: 50px;
		}
		
		hr {
			color: #o8c;
			border: 1px solid #08c;
			margin-top: -20px;
		}
		
		span[id$=errors] {
			font-size: 12px;
			font-style: italic;
			color: red;
			
		}
		
		.clear-float {
			clear: both;
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

		<div class="row">
			<div class="col-md-12">
				<h3>User list</h3>
				<hr>
			</div>
		</div>

		<div class="row">

			<div class="col-md-10">
				<table class="mytable">
					<tbody>

						<tr>
							<th style="width: 5%">STT</th>
							<th style="width: 25%">Username</th>
							<th style="width: 25%">Fullname</th>
							<th style="width: 25%; text-align: center;">Role</th>
							<th style="width: 20%; text-align: center;">Action</th>
						</tr>
						
						<c:forEach var="u" items="${listUser}" varStatus="status">
							<tr>
								<td style="text-align: center;">${status.index + 1}</td>
								<td>${u.username}</td>
								<td>${u.fullname }</td>
								<td style="text-align: center;">
									<c:choose>
										<c:when test="${u.role }">Admin</c:when>
										<c:otherwise>User</c:otherwise>
									</c:choose>
								</td>
								<td>
									<div style="text-align: center">
										<a href="user-delete.io?username=${u.username}" class="btn btn-danger" role="button">Delete</a>
									</div>
								</td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
			</div>

			<div class="col-md-2"></div>

		</div>



		<div class="row">
			<div class="col-md-12">
				<h3>Add user</h3>
				<hr>
			</div>
		</div>

		<div class="row">

			<div class="col-md-8">
					
					<form:form method="POST" action="user-add.io" modelAttribute="user">
					
					  <div class="form-group">
					    <label for="username">Username:</label>
					    <form:errors path="username" element="span" />
					    <form:input path="username" cssClass="form-control" />
					  </div>
					  
					  <div class="form-group">
					    <label for="password">Password:</label>
					    <form:errors path="password" element="span" />
					    <form:input path="password" type="password" cssClass="form-control" />
					  </div>
					  
					  <div class="form-group">
				    	<label style="display: block; float: left;">Gender:</label>
				    	<form:errors path="role" element="span" /><div class="clear-float"></div>
					    <label class="radio-inline"><form:radiobutton path="role" value="true"/>Admin</label>
					    <label class="radio-inline"><form:radiobutton path="role" value="false"/>User</label>
					  </div>
							  
					  <div class="form-group">
					    <label for="username">Full name:</label>
					    <form:errors path="fullname" element="span" />
					    <form:input path="fullname" cssClass="form-control" />
					  </div>
					  <input type="submit" class="btn btn-primary" />
					</form:form>
			</div>

			<div class="col-md-4">

			</div>

		</div>

	</div>
</body>
</html>