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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Staff</title>
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
		
		#myInput {
			width: 177px;
			margin-bottom: 10px;
			margin-left: 963px;
			height: 30px;
		}
		
		span[id$=errors] {
			font-size: 12px;
			font-style: italic;
			color: red;
			

	</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.io"><img
					src='<c:url value="/resources/images/logo.png" />' /></a>
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
				<h3>Staff list</h3>
				
				<hr>
			</div>
		</div>
	
		<div class="row">
		

			<div class="col-md-12">
			<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names..">
				<table class="mytable" id="myTable">
					<tbody>

						<tr>
							<th style="width: 4%; text-align: center;">STT</th>
							<th style="width: 4%">Staff ID</th>
							<th style="width: 20%">Full name</th>
							<th style="width: 16%">Gender</th>
							<th style="width: 16%">Birthday</th>
							<th style="width: 16%">Phone</th>
							<th style="width: 8%;">Image</th>
							<th style="width: 16%; text-align: center;">Action</th>
						</tr>

						<c:forEach var="s" items="${staffList}" varStatus="status">
							<tr>
							<td style="text-align: center;">${status.index + 1}</td>
								<td style="text-align: center;">${s.staffId}</td>
								<td>${s.name}</td>
								<td>
									<c:choose>
										<c:when test="${s.gender}">Male</c:when>
										<c:otherwise>Female</c:otherwise>
									</c:choose>
								</td>
								<td><format:formatDate value="${s.birthday}" pattern="dd/MM/yyyy"/></td>
								<td>${s.phone }</td>
								<td style="text-align: center;">
								<img src="<c:url value="/resources/images/services/${s.photo }" />" style="width: 50px; height: auto;" />
								</td>
								<td>
									<div style="text-align: center">
										<a href="staff-delete.io?staffid=${s.staffId}" class="btn btn-danger" role="button">Delete</a> 
										
										<a data-toggle="modal" data-target="#myModal" class="btn btn-success update" role="button" 
										data-id="${s.staffId}" data-image="${s.photo}" data-email="${s.email}" data-name="${s.name}" data-phonenumber="${s.phone}"
										data-salary="${s.salary}" data-birthday="<format:formatDate value="${s.birthday}" pattern="yyyy/MM/dd"/>">Update</a>
									</div>
								</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>

		

		</div>
		
		<!-- End list -->
		<!-- Begin modal -->
		
		 <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 style="color:red;">Update staff</h4>
        </div>
        <div class="modal-body">
          	<form:form role="form" method="POST" action="staff-update.io" modelAttribute="staff">
           	<div class="row">
           	<form:hidden path="photo" id="photo"/>
           		<!-- Column 1 -->
           		<div class="col-md-6">
           			 <div class="form-group">
		              <label>Staff ID:</label>
		              <form:input path="staffId" cssClass="form-control" id="staffId" readonly="true" />
		            </div>
		            
     					  <div class="form-group">
							    <label for="depart">Department:</label>
							    <form:select path="depart.departId" items="${departs}" itemLabel="name" itemValue="departId" cssClass="form-control"/>
							  </div>
           	
							  <div class="form-group">
							    <label for="name">Full name:</label>
							    <form:input path="name" cssClass="form-control" id="fullname"/>
							  </div>
						    <div class="form-group">
						    	<label style="display: block">Gender:</label>
							    <label class="radio-inline"><form:radiobutton path="gender" value="true"/>Male</label>
							    <label class="radio-inline"><form:radiobutton path="gender" value="false"/>Female</label>
							  </div>
					  	</div>
           		<!-- Column 2 -->
           		<div class="col-md-6">
	  				    <div class="form-group">
							    <label for="staffId">Birthday:</label>
							    <form:input path="birthday" cssClass="form-control" placeholder="yyyy/mm/dd" id="birthday" />
							  </div>
							  
					     	<div class="form-group">
							    <label for="email">Email:</label>
							    <form:input path="email" cssClass="form-control" id="email" />
							  </div>
							  
					     	<div class="form-group">
							    <label for="phone">Phone number:</label>
							    <form:input path="phone" cssClass="form-control" id="phone" />
							  </div>
							  <div class="form-group">
							    <label for="salary">Salary:</label>
							    <form:input path="salary" cssClass="form-control" id="salary" />
							  </div>         		
           		</div>
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
					$("#staffId").val($(this).data("id"));
					$("#fullname").val($(this).data("name"));
					$("#birthday").val($(this).data("birthday"));
					$("#email").val($(this).data("email"));
					$("#phone").val($(this).data("phonenumber"));
					$("#salary").val($(this).data("salary"));
					$("#photo").val($(this).data("image"));
				});
			});
  	</script>
		<!-- start form -->



		<div class="row">
			<div class="col-md-12">
				<h3>Add staff</h3>
				<hr>
			</div>
		</div>

		<div class="row">

			<div class="col-md-8">
					<form method="POST" action="staff-add.io" enctype="multipart/form-data">
					
					  <div class="form-group">
					    <label for="staffId">Staff ID:</label>
					    <span id="errors">${dublicateStaff}</span>
					    <input name="staffId" type="text" required="required" class="form-control" />
					  </div>
					  
					  <div class="form-group">
					    <label for="depart">Department:</label>
					    <select name="departId" class="form-control">
					    <c:forEach var="d" items="${departs}">
					    	<option value="${d.departId}">${d.name }</option>
					    </c:forEach>
					    </select>
					  </div>
					  
					  <div class="form-group">
					    <label for="name">Full name:</label>
					    <input name="name" type="text" required="required" class="form-control" />
					  </div>
					  
				    <div class="form-group">
				    	<label style="display: block">Gender:</label>
					    <label class="radio-inline"><input type="radio" name="gender" value="true"/>Male</label>
					    <label class="radio-inline"><input type="radio" name="gender" value="false"/>Female</label>
					  </div>
					  
				    <div class="form-group">
					    <label for="staffId">Birthday:</label>
					    <input name="birthday" type="text" class="form-control" placeholder="yyyy/mm/dd" />
					  </div>
					  
			     	<div class="form-group">
					    <label for="email">Email:</label>
					    <input name="email" type="email" class="form-control" />
					  </div>
					  
			     	<div class="form-group">
					    <label for="phone">Phone number:</label> 
					    <input name="phone" type = "tel" required="required" class="form-control" />
					  </div>
					  
					  <div class="form-group">
						<label for="image">Image:</label><span id="imageerrors" >${imageMessage}</span>
						<input type="file" name="image" class="form-control" required="required">
					</div>
					
					  <div class="form-group">
					    <label for="salary">Salary:</label>
					    <input name="salary" type="number" class="form-control" required="required"/>
					  </div>
					  <input type="submit" class="btn btn-success" />
					  
					  
					</form>
			</div>

			<div class="col-md-4">

			</div>

		</div>
		

	</div>
	
	<script>
		function myFunction() {
			 var input, filter, table, tr, td, i;
			  input = document.getElementById("myInput");
			  filter = input.value.toUpperCase();
			  table = document.getElementById("myTable");
			  tr = table.getElementsByTagName("tr");

			  // Loop through all table rows, and hide those who don't match the search query
			  for (i = 0; i < tr.length; i++) {
			    td = tr[i].getElementsByTagName("td")[1];
			    if (td) {
			      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
			        tr[i].style.display = "";
			      } else {
			        tr[i].style.display = "none";
			      }
			    } 
			  }
		}
	</script>
</body>
</html>