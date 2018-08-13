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
<script type="text/javascript" src="static/js/zepto/zepto.js"></script>
<script type="text/javascript" src="static/js/common/apputils.js"></script>
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
		font-size:1.2rem;
		font-family:"微软雅黑";
		word-break:break-all;
	}
	.container .title{
		font-size:1.3em;
		text-align: center;
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
	}
</style>
</head>
<body>
	<section class="container">
		<h1 class="title">${news.news_title}</h1>
		<h2 class="subhead"><c:if test="${!empty news.news_source}">来源：${news.news_source}</c:if>     ${news.release_time} <span class="views">阅读  ${pd.views + 1}</span></h2>
		<div class="content">
			　　${news.news_content}
		</div>
	</section>
</body>

<script type="text/javascript">

	//ios和安卓点击退出
	function webViewClose(){
		var browser = myBrowser();
		if("IOS"==browser){
	        window.webkit.messageHandlers.jsCallOC.postMessage("123");
		}else{
			window.jsObj.HtmlcallJava("abc");
		}
	}
	
</script>
</html>