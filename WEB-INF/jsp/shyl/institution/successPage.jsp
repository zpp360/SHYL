<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<title>培训晋升-订单支付（购买课程）</title>
<base href="<%=basePath%>">
<link href="/SHYL/shyl/css/integrated/style.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" href="/SHYL/shyl/css/bootstrap.css" />
<link rel="stylesheet" href="/SHYL/shyl/css/course/course.css">
<link rel="stylesheet" href="/SHYL/WebRoot/shyl/css/maincss/mypage.css">
<script src="/SHYL/shyl/js/mainjs/jquery-v1.10.2.js"
	type="text/javascript"></script>
<script src="/SHYL/shyl/js/layer/layer.js"></script>
<style type="text/css">
.inputtxt2s {
	width: 450px;
	padding-left: 40%;
	background-color: #ffffff;
	line-height: 42px;
	height: 42px;
	border: 0;
	border-radius: 5px;
	font-size: 1.25em;
}

.leftdiv {
	margin-left: 0px;
	width: 100px;
	background-color: green;
	float: left;
	height: 100px;
}

.dnf {
	margin-top: 45px;
	width: 80%;
	float: right;
	height: 85px;
}


#goback {
    text-decoration: none;
    transition: 0.2s;
    color: #157BC6;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"><jsp:param
			name="id" value="pxjs" /></jsp:include>
	<div class="clear"></div>
	<input type="hidden" id="course_id" value="${pd.course_id}">
	<div class="register-box clearfix">
		<div class="rticon"></div>
		<div style='padding-left: 25%'>
			<div class="leftdiv">
				<img src="shyl/images/successImg.jpg" width="100px" height="100px">
			</div>
			<div style="font-size: 24px" class="dnf">支付成功</div>
		</div>
		<br>
		<div class="inputtxt2s">
			<ul>
				<li>订单号：<input title="${pd.order_number}" style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis;width:300px;background-color: #ffffff;border: 0;border-radius: 5px;" disabled="disabled" value="${pd.order_number}"/></li>
				<li>标题：<input title="${pd.course_name}" style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis;width:300px;background-color: #ffffff;border: 0;border-radius: 5px;" disabled="disabled" value="${pd.course_name}"/></li>
				<li>内容：<input title="${pd.body}" style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis;width:300px;background-color: #ffffff;border: 0;border-radius: 5px;" disabled="disabled" value="${pd.body}"/></li>
				<li>金额：<input title="￥${pd.price}" style="width:200px;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;width:300px;background-color: #ffffff;border: 0;border-radius: 5px;" disabled="disabled" value="￥${pd.price}"/></li>
			</ul>
		</div>
		<div style="height: 60px; padding-top: 35%; padding-left: 75%;">
				<a id="goback" onclick="pay()" href="javascript:void(0);" style="margin-left:43%"><span
		class="glyphicon glyphicon-circle-arrow-left"></span>&nbsp;&nbsp;返回</a>
		</div>
	</div>
	<div class="clear"></div>
	<%@ include file="../common/footer.jsp"%>
</body>
<script type="text/javascript">
	function pay(){
		var course_id = $("#course_id").val();
		window.location.href='<%=basePath%>institution/notFreeCourse.act?classTypeId='+course_id;
	}
</script>
</html>
