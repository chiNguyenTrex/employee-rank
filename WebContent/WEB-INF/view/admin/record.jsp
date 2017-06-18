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
	<title>Record</title>
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
				<h3>Record list</h3>
				<hr>
			</div>
		</div>

		<div class="row">

			<div class="col-md-10">
				<table class="mytable">
					<tbody>

						<tr>
							<th style="width: 15%">Staff ID</th>
							<th style="width: 25%">Name</th>
							<th style="width: 15%">Bonus score</th>
							<th style="width: 15%">Penalty score</th>
							<th style="width: 15%">Total</th>
							<th style="width: 15%">Detail</th>
	
						</tr>
						
						<c:forEach var="r" items="${recordList}" varStatus="status">
							<tr>
								<td style="text-align: center;">${r[0]}</td>
								<td>${r[1]}</td>
								<td>${r[2]}</td>
								<td>${r[3]}</td>
								<td>${r[2] - r[3]}</td>
								<td style="text-align: center;"><a href="detail.io?idstaff=${r[0]}" role="button" class="btn btn-success">Detail</a></td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
			</div>

			<div class="col-md-2"></div>

		</div>
		
		
		
		
		
		



		<div class="row">
			<div class="col-md-12">
				<h3>Add record</h3>
				<hr>
			</div>
		</div>

		<div class="row">

			<div class="col-md-8">
					<p style="color: ${color}; font-style: italic;">${message}</p>
					<form:form method="POST" action="record-add.io" modelAttribute="record">
					  <div class="form-group">
					    <label for="depart">Staff:</label>
					    <form:select path="staff.staffId" items="${staffList}" itemLabel="name" itemValue="staffId" cssClass="form-control"/>
					  </div>
					  
 				    <div class="form-group">
				    	<label style="display: block">Type:</label>
					    <label class="radio-inline"><form:radiobutton path="type" value="true"/>Điểm thưởng</label>
					    <label class="radio-inline"><form:radiobutton path="type" value="false"/>Điểm phạt</label>
					  </div>
					  <div class="form-group">
					    <label>Reason:</label>
					    <form:input path="reason" cssClass="form-control" />
					  </div>
					  <div class="form-group">
					    <label for="username">Date:</label>
					    <form:input path="date" cssClass="form-control" placeholder="yyyy/MM/dd" />
					  </div>
					  <input type="submit" class="btn btn-success" />
					</form:form>
			</div>

			<div class="col-md-4">

			</div>

		</div>

	</div>
</body>
</html>