<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" media="all">
<!-- Custom Theme files -->
<link href="<c:url value="/resources/css/style2.css" />" rel="stylesheet" type="text/css" media="all"/>
<!--js-->
<script src="<c:url value="/resources/js/jquery-2.1.1.min.js" />"></script> 
<!--icons-css-->
<link href="<c:url value="/resources/css/font-awesome.css" />" rel="stylesheet"> 
<!--Google Fonts-->
<!--static chart-->
</head>
<body>	
<div class="login-page">
    <div class="login-main">  	
    	 <div class="login-head" style="background: url(<c:url value="/resources/images/login.jpg" />)no-repeat;" >
				<h1>Login</h1>
			</div>
			<div class="login-block">
				<form method="POST" action="user-login.io">
					<div style="color: red; font-style: italic; font-size: 12px; height: 30px;">${message }</div>
					<input type="text" name="username" placeholder="Username">
					<input type="password" name="password" class="lock" placeholder="Password">
					<div class="forgot-top-grids">
						<div class="forgot-grid">
							
						</div>
						<div class="forgot">
							
						</div>
						<div class="clearfix"> </div>
					</div>
					<input type="submit" name="Sign In" value="Login">	
					
				</form>
				
			</div>
      </div>
</div>
<!--inner block end here-->
<!--copy rights start here-->
<div class="copyrights">
	 <p>© 2016 Company. All Rights Reserved | Design by  me</p>
</div>	
<!--COPY rights end here-->

<!--scrolling js-->
		<script src="<c:url value="/resources/js/jquery.nicescroll.js" />"></script>
		<script src="<c:url value="/resources/js/scripts.js" />"></script>
		<!--//scrolling js-->
		<script src="<c:url value="/resources/js/bootstrap.js" />"> </script>
<!-- mother grid end here-->
</body>
</html>