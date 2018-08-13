<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/static/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title>请求页面未找到</title>
		 
		<meta name="description" content="404 Error Page" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<!-- basic styles -->
		<link href="css/bootstrap.min.css" rel="stylesheet" />
		<link href="css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
		<!-- page specific plugin styles -->
		<!-- ace styles -->
		<link rel="stylesheet" href="css/ace.min.css" />
		<link rel="stylesheet" href="css/ace-responsive.min.css" />
		<link rel="stylesheet" href="css/ace-skins.min.css" />
		<!--[if lt IE 9]>
		  <link rel="stylesheet" href="css/ace-ie.min.css" />
		<![endif]-->
		 
<body>
		<div class="navbar navbar-inverse">
	
		</div><!--/.navbar-->
		<div class="container-fluid" id="main-container">
			
			<div id="main-content" class="clearfix">
					
					<div id="page-content" class="clearfix">
						
						<div class="row-fluid">
<!-- PAGE CONTENT BEGINS HERE -->
<div class="error-container">
<div class="well">
	<h1 class="grey lighter smaller">
		<span class="blue bigger-125"><i class="icon-sitemap">对不起</i></span> 您没有足够权限访问本页面
	</h1>
	<hr />
	<h3 class="lighter smaller"></h3>
	
	<div>
		
		<div class="space"></div>
		
		<h4 class="smaller">Try one of the following:</h4>
		<ul class="unstyled spaced inline bigger-110">
			<li><i class="icon-hand-right blue"></i> 请与管理员联系，以确认您是否有足够权限</li>
			<li><i class="icon-hand-right blue"></i> 检查您的环境配置是否正确</li>
		</ul>
	</div>
	
	<hr />
	<div class="space"></div>
	
	<div class="row-fluid">
		<div id="zhongxin">
			<img src="/SHYL/shyl/images/error.jpg"/>
		</div>
	</div>
</div>
</div>
<!-- PAGE CONTENT ENDS HERE -->
						 </div><!--/row-->
	
					</div><!--/#page-content-->
					  
			</div><!-- #main-content -->
		</div><!--/.fluid-container#main-container-->
		<!-- basic scripts -->
		<script src="1.9.1/jquery.min.js"></script>
		<script type="text/javascript">
		window.jQuery || document.write("<script src='js/jquery-1.9.1.min.js'>\x3C/script>");
		</script>
		
		<script src="js/bootstrap.min.js"></script>
		<!-- page specific plugin scripts -->
		
		<!-- ace scripts -->
		<script src="js/ace-elements.min.js"></script>
		<script src="js/ace.min.js"></script>
		<!-- inline scripts related to this page -->
		
		<script type="text/javascript">
		$(top.hangge());
		</script>
	</body>
</html>