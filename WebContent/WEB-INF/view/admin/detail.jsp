<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="format"%>
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
	<title>Detail</title>
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
				<h3>History record</h3>
				<hr>
				<p>Nhân viên: ${staffName}</p>
			</div>
		</div>

		<div class="row">

			<div class="col-md-10">
				<table class="mytable">
					<tbody>

						<tr>
							<th style="width: 10%">STT</th>
							<th style="width: 30%">Date</th>
							<th style="width: 20%">Type</th>
							<th style="width: 40%">Reason</th>
						</tr>
						
						<c:forEach var="r" items="${recordList}" varStatus="status">
							<tr>
								<td style="text-align: center;">${status.index + 1}</td>
								<td><format:formatDate value="${r.date}" pattern="dd/MM/yyyy"/></td>
								<td>${r.type?"Điểm thưởng":"Điểm phạt"}</td>
								<td>${r.reason}</td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
			</div>

			<div class="col-md-2"></div>
		</div>
	</div>
</body>
</html>