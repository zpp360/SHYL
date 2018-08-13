<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="img_host" value="${applicationScope.get('img_host')}"></c:set>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8" />
<title></title>
<meta name="description" content="overview & stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name='apple-mobile-web-app-capable' content='yes'>
<meta name='apple-mobile-web-app-status-bar-style' content='black'>
<meta name='format-detection' content='telephone=no'>
<script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="static/photoswipe/photoswipe.min.js"></script>
<script type="text/javascript" src="static/photoswipe/photoswipe-ui-default.min.js"></script>
<link href="static/photoswipe/photoswipe.css" rel="stylesheet" type="text/css">
<link href="static/photoswipe/default-skin/default-skin.css" rel="stylesheet" type="text/css">

<style type="text/css">
	body{
		 font-size:18px;
		 font-family:"微软雅黑";
	}
	html, section, div, ul,p{
		padding:0px;margin:0px;border:0px;
	}
	li{list-style:none;margin:0;padding:0;}
	.container img{width:100% !important;height:auto !important;}
	.container{
		max-width:740px;
		padding:0 0;
		width:90vw;
		margin:0 auto;
	}
	.container p{
		width:100% !important;
		word-break:break-all;
	}
	.container table{
		width:100% !important;
	}
	.container div{
		width:100% !important;
	}
	.container .title{
		font-size:1.3em;
		text-align: left;
		word-break:break-all;
	}
	.container .subhead{
		font-weight: normal;
	    font-size: 12px;
	    color: #ccc;
		text-align: left;
	}
	.container .views{
		font-weight: normal;
	    font-size: 12px;
	    color: #ccc;
		float: right;
	}
	.container .content{
		color:#3d3c3d;
		min-height:400px;
	}
	.container .content > p:first-child{
		margin-top: -25px !important;
	}
	
	.container iframe{
		width:100%;
		height:auto;
	}
	.container video{
		width:100%;
		height:auto;
	}
	
	
	
</style>
</head>
<body>
	<section class="container">
		<div class="content">
			　　${votePd.vote_rule_txt}
		</div>
	</section>
    
</body>

</html>