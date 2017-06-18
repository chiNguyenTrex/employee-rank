<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Company</title>

	
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
								<li role="presentation"><a href="home.io" class="active"><s:message code="global.home" /></a></li>
                <li role="presentation"><a href="record.io"><s:message code="global.record" /></a></li>
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
	
	<section id="main-slider" class="no-margin">
        <div class="carousel slide">      
            <div class="carousel-inner">
                <div class="item active" style="background-image: url(<c:url value="/resources/images/slider/bg1.jpg" />)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h2 class="animation animated-item-1"><s:message code="home.welcome" /><span>Company</span></h2>
                                    <p class="animation animated-item-2"><s:message code="home.quote" /></p>
                                    <a class="btn-slide animation animated-item-3" href="#"><s:message code="home.button" /></a>
                                </div>
                            </div>

                            <div class="col-sm-6 hidden-xs animation animated-item-4">
                                <div class="slider-img">
                                    <img src="<c:url value="/resources/images/slider/img3.png" />" class="img-responsive">
                                </div>
                            </div>

                        </div>
                    </div>
                </div><!--/.item-->             
            </div><!--/.carousel-inner-->
        </div><!--/.carousel-->
    </section><!--/#main-slider-->
	
	<div class="feature">
		<div class="container">
			<div class="text-center">
				<div class="col-md-3">
					<div class="hi-icon-wrap hi-icon-effect wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms" >
						<i class="fa fa-book"></i>	
						<h2><s:message code="home.vision" /></h2>
						<p><s:message code="home.vision.label" /></p>
					</div>
				</div>
				<div class="col-md-3">
					<div class="hi-icon-wrap hi-icon-effect wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms" >
						<i class="fa fa-laptop"></i>	
						<h2><s:message code="home.mission" /></h2>
						<p><s:message code="home.mission.label" /></p>
					</div>
				</div>
				<div class="col-md-3">
					<div class="hi-icon-wrap hi-icon-effect wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="900ms" >
						<i class="fa fa-heart-o"></i>	
						<h2><s:message code="home.value" /></h2>
						<p><s:message code="home.value.label" /></p>
					</div>
				</div>
				<div class="col-md-3">
					<div class="hi-icon-wrap hi-icon-effect wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="1200ms" >
						<i class="fa fa-cloud"></i>	
						<h2><s:message code="home.philosophy" /></h2>
						<p><s:message code="home.philosophy.label" /></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="about">
		<div class="container">
			<div class="col-md-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms" >
				<img src="<c:url value="/resources/images/6.jpg" />" class="img-responsive"/>
			</div>
			
			<div class="col-md-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms" >
				<p><s:message code="home.content1" /></p>

				<p><s:message code="home.content2" />
				</p>
			</div>
		</div>
	</div>
	

	<section id="partner">
        <div class="container">
            <div class="center wow fadeInDown">
                <h2><s:message code="home.partner" /></h2>
            </div>    

            <div class="partners">
                <ul>
                    <li> <a href="#"><img class="img-responsive wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms" src="<c:url value="/resources/images/partners/partner2.png" />"></a></li>
                    <li> <a href="#"><img class="img-responsive wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms" src="<c:url value="/resources/images/partners/partner3.png" />"></a></li>
                    <li> <a href="#"><img class="img-responsive wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="900ms" src="<c:url value="/resources/images/partners/partner4.png" />"></a></li>
                    <li> <a href="#"><img class="img-responsive wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="1200ms" src="<c:url value="/resources/images/partners/partner5.png" />"></a></li>
                    <li> <a href="#"><img class="img-responsive wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="1500ms" src="<c:url value="/resources/images/partners/partner1.png" />"></a></li>
                </ul>
            </div>        
        </div><!--/.container-->
    </section><!--/#partner-->
	
	
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
	
	
		    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="<c:url value="/resources/js/jquery-2.1.1.min.js" />"></script>	
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/js/jquery.prettyPhoto.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.isotope.min.js" />"></script>  
	<script src="<c:url value="/resources/js/wow.min.js" />"></script>
	<script src="<c:url value="/resources/js/functions.js" />"></script>
	
</body>
</html>