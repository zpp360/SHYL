<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>企业新闻详细_济南市服务外包公共服务平台</title>
<!-- jsp文件头和头部 -->
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<base href="<%=basePath%>">
<style type="text/css">
 div.cml_content{
	 word-wrap: break-word; 
	 word-break: normal; 
}
</style>
</head>
<body>
    <jsp:include page="../../common/header.jsp"></jsp:include>
    <div class="clear"></div>
	<div class="cmain">
	    <div class="cml_1" style="width: 100%;">
			<div class="cml_2 clearfix">
				<div class="cml_title">
					<h1>企业新闻</h1>
				</div>
				<div class="cml_content">
					<h2>${pd.title}
						<p class="tit">
							<a href="javaScript:void(0);">发布日期</a>
							<i></i>
							<span><a href="javaScript:void(0);">${pd.insert_timestamp}</a></span>
						</p>
					</h2>
					<div class="cml_content_main">
					${pd.content}
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<!--<footer开始>-->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!--</footer结束>-->
</body>
</html>