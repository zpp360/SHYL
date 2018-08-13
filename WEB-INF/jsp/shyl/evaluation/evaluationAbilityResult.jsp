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
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>职业能力测试_济南市服务外包公共服务平台</title>
<jsp:include page="../common/header.jsp"><jsp:param
		name="id" value="cp" /></jsp:include>
<link href="shyl/css/question/css/style.css" rel="stylesheet">
<link href="shyl/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="shyl/css/bootstrap.css">
<link href="shyl/css/question/bootstrap/css/bootstrap-huan1.css"
	rel="stylesheet">
<link href="shyl/css/question/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="shyl/css/question/css/exam1.css" rel="stylesheet"
	type="text/css">
<style type="text/css">
a:hover {
   color:#2e2e2e;
   text-decoration: none;
}
</style>
</head>
<body class="nlcp-bg">
	<div class="nlcp" style="margin-top: 90px;">
		<input type="hidden" value="<%=basePath%>" id="methodurl"> <input
			type="hidden" value="${pd.id}" id="hist-id"> <input
			type="hidden" value="${pd.id}" id="paper-id"> <input
			type="hidden" value="${platUser.USER_ID}" id="loginstatus"> <input
			type="hidden" value="${platUser.USER_TYPE}" id="user_type">
		<div class="nlcp-tit"></div>
		<div class="nlcp-nr">
			<div class="nlcp-st">
				<div style="height: 600px;">
					<div class="result-top" style="margin-top: 0px">
						<p class="cpjg">
							<img src="<%=basePath%>shyl/images/cp-icon1.png">测评结果：<span
								style="color: #ff0000;">${pd.test_result}分</span><span
								style="color: #12b901;">${pd.stage}</span>
						</p>
						<p class="cpfx">${pd.description}</p>
					</div>
				</div>
			</div>
			<a id="goback" href="<%=basePath%>evaluation/evaluationIndex.act" style="margin-left:43%"><span
		class="glyphicon glyphicon-circle-arrow-left"></span>&nbsp;&nbsp;返回</a>
		</div>
	</div>
	
	<div class="clear"></div>
	<!-- 无权访问结束 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>