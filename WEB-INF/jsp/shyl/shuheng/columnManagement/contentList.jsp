<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>用户组</title>
<script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
<link type="text/css" rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css"/>
<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>

<!-- jsp文件头和头部 -->
<style type="text/css">
.commitopacity {
	position: absolute;
	width: 100%;
	height: 100px;
	background: #7f7f7f;
	filter: alpha(opacity = 50);
	-moz-opacity: 0.8;
	-khtml-opacity: 0.5;
	opacity: 0.5;
	top: 0px;
	z-index: 99999;
}
.right{
	width:85%;
	float:left;
}
</style>

</head>
<body >
	<div class="container-fluid" id="main-container">
		<a href="#" id="menu-toggler"><span></span></a>
		<!-- menu toggler -->

		<!-- 左侧菜单 -->
		<%@ include file="contentLeft.jsp"%>

	

		<div class="right">
			<iframe name="groupFrame" id="groupFrame" frameborder="0" src="<%=basePath%>columnManagement/contentRight.do"
				style="margin: 0 auto; width: 100%; height: 100%;"></iframe>
		</div>

	</div>
	<!--/.fluid-container#main-container-->
	<!-- basic scripts -->
	<!-- 引入 -->
	<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<!-- 引入 -->

	<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
	<script type="text/javascript" >
	function cmainFrame(){
		var hmain = document.getElementById("groupFrame");
		var bheight = document.documentElement.clientHeight;
		hmain .style.width = '100%';
		hmain .style.height = (bheight  - 51) + 'px';
		
	}
	cmainFrame();
	window.onresize=function(){  
		cmainFrame();
	};
	</script>
</body>
</html>
