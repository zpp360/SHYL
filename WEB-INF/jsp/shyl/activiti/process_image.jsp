<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
	
	</head>
<body>
		<div id="zhongxin">
			<!-- 1.获取到规则流程图 -->
			<img style="position: absolute;top: 0px;left: 0px; max-width:none;" src="<%=basePath%>workflow/view_flow_img?id=${pd.deploymentId}&name=${pd.imageName}">
			
			<!-- 2.根据当前活动的坐标，动态绘制DIV -->
			<div style="position: absolute;border:1px solid red;top:${pd.y}px;left: ${pd.x}px;width: ${pd.width}px;height:${pd.height}px;   "></div>
			</div>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><img src="static/images/jzx.gif" /><br/><h4 class="lighter block green"></h4></div>
		
	
	<!-- 引入 -->
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='static/assets/js/jquery.js'>"+"<"+"/script>");
		</script>
		<!-- <![endif]-->
		<!--[if IE]>
		<script type="text/javascript">
		 	window.jQuery || document.write("<script src='static/assets/js/jquery1x.js'>"+"<"+"/script>");
		</script>
		<![endif]-->
		<script src="static/js/bootstrap.min.js"></script>
	
		<script type="text/javascript">
		$(top.hangge());
	
		
		</script>
	
</body>
</html>