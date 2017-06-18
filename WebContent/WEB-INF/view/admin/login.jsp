<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
    
<head>
    <title>Company Admin</title><meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="<c:url value="/resources/admin/css/bootstrap.min.css" />" />
		<link rel="stylesheet" href="<c:url value="/resources/admin/css/bootstrap-responsive.min.css" />" />
    <link rel="stylesheet" href="<c:url value="/resources/admin/css/matrix-login.css" />" />
    <link href="<c:url value="/resources/admin/font-awesome/css/font-awesome.css" />" rel="stylesheet" />
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>

    </head>
    <body>
        <div id="loginbox">            
            <form  class="form-vertical" action="admin-login.io" method="post">
				 <div class="control-group normal_text"> <h3><img src="<c:url value="/resources/admin/img/logo.png" />" alt="Logo" /></h3></div>
				 			
                <div class="control-group">
                    <div class="controls">
                    <div style="color:red; height: 20px; margin-left: 18px;">${message }</div>
                        <div class="main_input_box">
                            <span class="add-on bg_lg"><i class="icon-user"></i></span><input type="text" name="username" placeholder="Username" />
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_ly"><i class="icon-lock"></i></span><input type="password" name="password" placeholder="Password" />
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    
                    <span class="pull-right"><input type="submit" class="btn btn-success" ></span>
                </div>
            </form>
            
        </div>
        
        <script src="<c:url value="/resources/admin/js/jquery.min.js" />"></script>  
     
    </body>

</html>
