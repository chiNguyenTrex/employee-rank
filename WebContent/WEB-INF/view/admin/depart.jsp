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
	<title>Department</title>
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
				<h3>Department list</h3>
				<hr>
			</div>
		</div>

		<div class="row">

			<div class="col-md-6">
				<table class="mytable">
					<tbody>

						<tr>
							<th style="width: 5%">STT</th>
						
							<th style="width: 55%">Name</th>
							<th style="width: 40%; text-align: center">Action</th>
						</tr>
						
						<c:forEach var="d" items="${departList}" varStatus="status">
							<tr>
								<td style="text-align: center;">${status.index + 1}</td>
							
								<td>${d.name }</td>
								
								<td>
									<div style="text-align: center">
										<a href="delete-depart.io?departid=${d.departId}" class="btn btn-danger" role="button">Delete</a> 
										<a data-toggle="modal" data-target="#myModal" class="btn btn-success update" role="button" 
										data-id="${d.departId}" data-name="${d.name}">Update</a>
									</div>
								</td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
			</div>
<!-- Begin modal -->
		
		 <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 style="color:red;">Update department</h4>
        </div>
        <div class="modal-body">
          	<form:form role="form" method="POST" action="update-depart.io" modelAttribute="depart">
      
           				<form:hidden path="departId" id="id"/>
           			 <div class="form-group">
		              <label>Depart name:</label>
		              <form:input path="name" cssClass="form-control" id="name"/>
		            </div>
		            
            <button type="submit" class="btn btn-default btn-success btn-block">Update</button>
          </form:form>
        </div>
      </div>
    </div>
  </div> 
  	<!-- End modal -->
  	<!-- JQuery for modal popup window -->
  	<script>
			$(document).ready(function() {
				$(".update").click(function() {
					$("#id").val($(this).data("id"));
					$("#name").val($(this).data("name"));
				
				});
			});
  	</script>
			<div class="col-md-6"></div>
			

		</div>
		
		<div class="row">
			<div class="col-md-12">
				<h3>Add user</h3>
				<hr>
			</div>
		</div>

		<div class="row">

			<div class="col-md-8">
					
					<form:form method="POST" action="add-depart.io" modelAttribute="depart">
					
					  <div class="form-group">
					    <label for="username">Depart ID:</label>
					    <form:errors path="departId" element="span" />
					    <form:input path="departId" cssClass="form-control" />
					  </div>
					  
					  <div class="form-group">
					    <label for="name">Depart name:</label>
					    <form:errors path="name" element="span" />
					    <form:input path="name" cssClass="form-control" />
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