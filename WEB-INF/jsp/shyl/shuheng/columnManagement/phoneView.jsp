<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="static/js/common/apputils.js"></script>
<link href="static/css/bootstrap.min.css" rel="stylesheet" />
<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
<style type="text/css">
	body{
		 font-size:18px;
		 font-family:"微软雅黑";
	}
	html, section, div, ul{
		padding:0px;margin:0px;border:0px;
	}
	li{list-style:none;margin:0;padding:0;}
	img{width:100% !important;height:auto !important;}
	.container{
		width:90vw;
		margin:0 auto;
	}
	.container p{
		word-break:break-all;
	}
	.container .title{
		font-size:1.3em;
		text-align: center;
	}
	.container .subhead{
		font-size:0.7em;
		color:#5e5d5e;
	}
	.container .content{
		color:#3d3c3d;
	}
</style>
</head>
<body>
	<section class="container" style="width:${phoneSize.width}px;height:${phoneSize.height}px;overflow-y:scroll;">
		<h1 class="title">${pd.news_title}</h1>
		<h2 class="subhead"><c:if test="${!empty pd.news_source}">来源：${pd.news_source}</c:if>     ${pd.update_date}</h2>
		<div class="content">
			　　${pd.news_content}
		</div>
	</section>
	<div align="center" style="margin-top: 10px;">
			<a class="btn  btn-light" onclick="returnback()"><i class=" icon-circle-arrow-left"></i>返回</a>
	</div>
	<form id="Form" name="Form" method="post" style="display:none;" action="<%=basePath%>columnManagement/phoneViewBack.do">
		<input type="hidden" id="form_action" name="form_action" value="${pd.back}"/>
		<input type="hidden" id="news_id" name="news_id" value="${pd.news_id}"/>
		<input type="hidden" id="superAdmin" name="superAdmin" value="${pd.superAdmin}"/>
		<input type="hidden" name="column_id" value="${pd.column_id}" />
		<input type="hidden" name="unit_id" value="${pd.unit_id}" />
		<input type="hidden" id="unit_name" name="unit_name" value="${pd.unit_name}"/>
		<input type="hidden" name="news_title" value="${pd.news_title}" />
		<input type="hidden" name="news_source" value="${pd.news_source}" />
		<input type="hidden" name="news_picturePath" value="${pd.news_picturePath}" />
		<input type="hidden" name="column_width" value="${pd.width}" />
		<input type="hidden" name="column_height" value="${pd.height}" />
		<input type="hidden" name="news_fileName" value="${pd.news_fileName}" />
		<input type="hidden" name="news_filePath" value="${pd.news_filePath}" />
		<input type="hidden" name="release_time" value="${pd.release_time}" />
		<input type="hidden" name="form_action" value="${pd.back}" />
		<textarea id="news_content" name="news_content" maxlength="10000">${pd.news_content}</textarea>
	</form>
</body>

<script type="text/javascript">
	function returnback(){
		$("#Form").submit();
	}
	
</script>
</html>
