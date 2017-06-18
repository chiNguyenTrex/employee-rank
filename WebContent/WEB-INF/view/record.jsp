<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Record</title>
	
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />">
	<link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css" />">
	<link rel="stylesheet" href="<c:url value="/resources/css/animate.css" />">
	<link rel="stylesheet" href="<c:url value="/resources/css/prettyPhoto.css" />">
	<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<style>
		.logout a:hover {
			color: green;
		}	
	</style>	

  </head>
  <body>
	<header>		
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="navigation">
				<div class="container-fluid">	

					<div class="navbar-header" style="margin-left: 83px;">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse.collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<div class="navbar-brand">
							<a href="home.io"><h1><span>Com</span>pany</h1></a>
						</div>
					</div>
					
					<div class="navbar-collapse collapse">							
						<div class="menu" style="float: left; margin-left: 200px">
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation"><a href="home.io"><s:message code="global.home" /></a></li>
                <li role="presentation"><a href="record.io" class="active"><s:message code="global.record" /></a></li>
                <li role="presentation"><a href="depart.io"><s:message code="global.depart" /></a></li>
                <li role="presentation"><a href="profile.io"><s:message code="global.profile" /></a></li>
							</ul>
						</div>
                        <div style="margin-top: 22px">
                            <div style="float: left; margin-left: 50px;">
                                <a data-lang="en" ><img src="<c:url value="/resources/images/en.png" />" style="height: 30px; width: auto;"></a>
                            </div>
                            <div style="float: left; margin-left: 10px;">
                                <a data-lang="vi" ><img src="<c:url value="/resources/images/vi.png" />" style="height: 30px; width: auto;"></a>
                            </div>
                            <div style="float: right; margin-right: 20px; font-weight: bold;" class="logout">
                                <a href="logout.io" title="" ><s:message code="global.logout" /></a>
                            </div>
                            
                        </div>

					</div>

				</div>
			</div>	
		</nav>		
	</header>
	
	<div id="breadcrumb">
		<div class="container">	
			<div class="breadcrumb">							
				<li><a href="home.io"><s:message code="global.home" /></a></li>
				<li><s:message code="global.record" /></li>			
			</div>		
		</div>	
	</div>
	
	
	<div class="our-team">
		<div class="container">
			<h3><s:message code="record.header" /></h3>	
			<div class="text-center">
			

					<c:forEach var="r" items="${recordList2}" varStatus="status">
						<div class="col-md-4 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
							<img src="<c:url value="/resources/images/services/${r[5] }" />" alt="" >
							<h4>${r[2] } - <span class="text-success">${r[1] }</span></h4>
							<p style="font-size: 18px"><strong><s:message code="record.total" />: </strong>${r[3] - r[4]}</p>
						</div>

				</c:forEach>
						
				
			
			</div>
		</div>
	</div>
	
	<footer>
		<div class="footer">
			<div class="container">
				<div class="social-icon">
					<div class="col-md-4">
						<ul class="social-network">
							<li><a href="#" class="fb tool-tip" title="Facebook"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#" class="twitter tool-tip" title="Twitter"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#" class="gplus tool-tip" title="Google Plus"><i class="fa fa-google-plus"></i></a></li>
							<li><a href="#" class="linkedin tool-tip" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
							<li><a href="#" class="ytube tool-tip" title="You Tube"><i class="fa fa-youtube-play"></i></a></li>
						</ul>	
					</div>
				</div>
				
				<div class="col-md-4 col-md-offset-4">
					<div class="copyright">
						&copy; Company website. All Rights Reserved.
                        <div class="credits">
             
                            <a href="">Design</a> by <a href="#">Lê Chí Nguyên</a>
                        </div>
					</div>
				</div>										
			</div>
			<div class="pull-right">
				<a href="#home" class="scrollup"><i class="fa fa-angle-up fa-3x"></i></a>
			</div>
		</div>
	</footer>
		<script type="text/javascript">
						$(document).ready(function() {
							$("a[data-lang]").click(function() {
								var lang = $(this).data("lang");
								$.get("home.io?lang=" + lang, function() {
									location.reload();
								});
								return false;
							});

						});
				</script>
	
	
		<script src="<c:url value="/resources/js/jquery-2.1.1.min.js" />"></script>	
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/js/jquery.prettyPhoto.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.isotope.min.js" />"></script>  
	<script src="<c:url value="/resources/js/wow.min.js" />"></script>
	<script src="<c:url value="/resources/js/functions.js" />"></script>
	
	
</body>
</html>