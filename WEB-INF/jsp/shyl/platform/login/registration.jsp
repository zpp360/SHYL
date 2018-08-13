<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
<base href="<%=basePath%>">
<title>注册条款_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link href="shyl/css/maincss/css.css" rel="stylesheet" type="text/css">
<style>
.register-box{
    align: "left";
    margin: 120px 400px 20px 400px;
    border: 1px solid #eee;
}
.title{
    font-size: 24px;
    text-align: center;
    margin: 20px 0px 20px 0px;
}
.content{
    text-align: left;
    margin: 20px 0px 20px 0px;
    padding: 0px 20px 00px 20px;
}
</style>
</head>
<body>
    <jsp:include page="../../common/header.jsp"></jsp:include>
	<div class="register-box">
	    <div class="title">${pd.title}</div>
		<div class="content">${pd.content}</div>
	</div>
	<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>

</html>