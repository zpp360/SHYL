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
<html lang="zh-CN" class="ua-www">
<head>
<base href="<%=basePath%>">
<title>职业倾向测试_济南市服务外包公共服务平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, maximum-scale=1.0">
<jsp:include page="../common/header.jsp"><jsp:param name="id" value="cp" /></jsp:include>
<link href="shyl/css/question/css/style.css" rel="stylesheet">
<link href="shyl/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="shyl/css/bootstrap.css">
<link href="shyl/css/question/bootstrap/css/bootstrap-huan1.css"
	rel="stylesheet">
<link href="shyl/css/question/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="shyl/css/question/css/exam1.css" rel="stylesheet"
	type="text/css">
<style>
a:hover {
   color:#2e2e2e;
   text-decoration: none;
}
.zycp-tit{ background:url(/SHYL/shyl/images/zycs-tit.png) no-repeat; width:1130px; height:180px;}
.zycp{ width:1130px; margin:0 auto;}
.zycp-nr{ background:url(/SHYL/shyl/images/zycp-bg.png) no-repeat; width:1130px; height:780px;}
.zycp-st{ padding:60px 80px 20px;}
.zycp-st form label{ width:300px; text-align:left;    display: block;float: left; margin-left:20px;}
.newfooter {
	height: 100px;
	background: #ededed;
	font-size: 0.85em;
	border-top: 2px solid #3155C8;
	padding-top: 20px;
	padding-bottom: 20px;
	margin: 0 auto;
	position: relative;
	top: 10px;
}
.wanew p {
	color: #4b4b4b;
	font-size: 1.0em;
	margin: 0 auto;
	font-family: arial;
	text-align: center;
}

.wanew span {
	color: #4b4b4b;
	margin-left: 0px;
}
.result-top {
	width: 950px;
}

.result-top {
	border: 1px solid #e3e3e3;
	background: #fff;
	padding: 40px;
	float: left;
	margin-top: 20px;
}

.cpjg {
	font-size: 20px;
	color: #333;
	height: 50px;
}

.cpjg span {
	font-size: 34px;
	margin: 0 20px;
}

.cpjg img {
	vertical-align: top;
	width: 30px;
	height: 30px;
}

.cpdjfx {
	margin-bottom: 30px;
}

.cpfx {
	font-size: 16px;
	color: #666;
	margin-left: 30px;
}

.cpdj {
	font-size: 16px;
	color: #333;
	margin-left: 30px;
	height: 50px;
}

.cpdj span {
	font-size: 24px;
	color: #016ab9;
}

#goback {
	color: #fff;
	display: inline-block;
	border: 1px solid transparent;
	padding: 6px 12px;
	padding: 6px 12px;
	margin-bottom: 0;
	font-size: 14px;
	width: 100px;
	font-weight: normal;
	border-radius: 4px;
	line-height: 1.42857143;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	cursor: pointer;
	-webkit-user-select: none;
	text-align: center;
	margin-top: 20px;
	background: #3761cb;
	margin-left: 44%;
	text-decoration: none
}
</style>
</head>
<body>
	<div class="zycp" style="margin-top:90px;">
	    <div class="zycp-tit"></div>
	    <div class="zycp-nr">
	    <input type="hidden" value="<%=basePath%>" id="methodurl">
		<input type="hidden" value="${pd.id}" id="hist-id">
		<input type="hidden" value="${pd.id}" id="paper-id">
		<input type="hidden" value="${platUser.USER_ID}" id="loginstatus">
    	<input type="hidden" value="${platUser.USER_TYPE}" id="user_type">
	    	<div class="zycp-st">
	   			<div style=" height:600px;">
	      							<div style="height: 600px;">
					<div class="result-top" style="margin-top: 0px">
						<p class="cpjg">
							<img src="<%=basePath%>shyl/images/cp-icon1.png">测评结果：<span
								style="color: #ff0000;">${pd.test_result}分</span><span
								style="color: #12b901;">${pd.stage}</span>
						</p>
						<p class="cpfx">${pd.description}</p>
					</div>
<!-- 					<div class="result-top"> -->
<!-- 						<p class="cpjg"> -->
<%-- 							<img src="<%=basePath%>shyl/images/cp-icon2.png" --%>
<!-- 								style="margin-top: -5px">测评结果类别： -->
<!-- 						</p> -->
<!-- 						开始循环 -->
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${not empty resultTypeList}"> --%>
<%-- 								<c:forEach items="${resultTypeList}" var="var" varStatus="vs"> --%>
<!-- 									<div class="cpdjfx"> -->
<!-- 										<p class="cpdj"> -->
<%-- 											<span>${var.start_number}~${var.end_number}</span>分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${var.stage} --%>
<!-- 										</p> -->
<%-- 										<p class="cpfx" style="margin-left: 120px;">${var.description}</p> --%>
<!-- 									</div> -->
<%-- 								</c:forEach> --%>
<%-- 							</c:when> --%>
<%-- 						</c:choose> --%>
<!-- 					</div> -->
				</div>
				</div>
		    </div>
		</div>
		<a id="goback" href="<%=basePath%>evaluation/evaluationIndex.act"><span class="glyphicon glyphicon-circle-arrow-left"></span>&nbsp;&nbsp;返回</a>
	</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>