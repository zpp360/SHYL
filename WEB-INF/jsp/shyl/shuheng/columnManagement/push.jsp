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
<title>推荐信息</title>
<meta name="description" content="overview & stats" />
<%@ include file="../../../system/admin/top.jsp"%>

<style type="text/css">
#pushDiv{
	margin-left: 50px;
	margin-top: 50px;
}
</style>

</head>
<body>
	<input type="hidden" id="news_push_s" name="news_push_s"/>
	<input type="hidden" id="news_push_d" name="news_push_d"/>
	<div id="pushDiv">
	<c:if test="${pd.superAdmin}">
		<input type="checkbox" name="index" style="opacity:1;position: relative;"/>&nbsp;&nbsp;主页轮播图&nbsp;&nbsp;&nbsp;&nbsp;
	</c:if>
	<input type="checkbox" name="unit" style="opacity:1;position: relative;"/>&nbsp;&nbsp;单位首页轮播图&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
</body>

<script type="text/javascript">
		
	$(function() {
		$('[name=index]').click(function(){
			if(this.checked){
				$("#news_push_s").val("1");
			}else{
				$("#news_push_s").val("");
			}
		});	
		$('[name=unit]').click(function(){
			if(this.checked){
				$("#news_push_d").val("1");
			}else{
				$("#news_push_d").val("");
			}
		});
		
			
	});
		
		
</script>

</html>