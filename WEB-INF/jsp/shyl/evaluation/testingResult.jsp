<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<title>测试结果_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">
<jsp:include page="../common/header.jsp"><jsp:param name="id" value="cp" /></jsp:include>
<link rel="stylesheet" href="shyl/css/bootstrap.css">
<link href="/SHYL/shyl/css/integrated/css.css" rel="stylesheet" type="text/css">
<link href="/SHYL/shyl/css/integrated/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
.w1100{width: 1100px; margin:0 auto;}
.result-top{ width:1000px;}
.result-top {
    border: 1px solid #e3e3e3;
    background: #fff;
    padding: 40px;
    float: left;
    margin-top: 20px;
}
.cpjg{ font-size:20px; color:#333; height:50px;}
.cpjg span{ font-size:34px; margin:0 20px;}
.cpjg img{ vertical-align:top; width:30px; height:30px;}
.cpdjfx{ margin-bottom:30px;}
.cpfx{ font-size:16px; color:#666; margin-left:30px;}
.cpdj{ font-size:16px; color:#333; margin-left:30px; height:50px;}
.cpdj span{ font-size:24px; color:#016ab9;}
#goback{
color:#fff;
display:inline-block; 
border:1px solid transparent;
padding: 6px 12px;
padding: 6px 12px;margin-bottom: 0;
font-size: 14px;
width:100px;
font-weight: normal;
border-radius: 4px;
line-height: 1.42857143;
text-align: center;
white-space: nowrap;
vertical-align: middle;
cursor: pointer;
-webkit-user-select: none;
text-align: center;
margin-top:20px;
background:#3761cb;
margin-left:43%
}
</style>
</head>
<body style="background:#f7f7f7;">
<div class="w1100" style="margin-top:90px;   position: relative;">
<input type="hidden" value="${testPaperInfo.field_id}" id="field_id">
<input type="hidden" value="${testPaperInfo.point_id}" id="field_id">
<!--结果得分-->
    <div class="result-top">
        <p class="cpjg"><img src="<%=basePath%>shyl/images/cp-icon1.png">测评结果：<span style="color:#ff0000;">${pd.test_result}分</span>
        <span style="color:#12b901;"  title="${pd.stage}">
					<c:choose>
						<c:when test="${fn:length(pd.stage) >20}">
									${fn:substring(pd.stage, 0, 20)}...
								</c:when>
						<c:otherwise>
									${pd.stage}
						</c:otherwise>
					</c:choose>
				</span>
		</p>
        <p class="cpfx">${pd.description}</p>
    </div>
     <div class="result-top">
        <p class="cpjg"><img src="<%=basePath%>shyl/images/cp-icon2.png" style="margin-top:-5px">测评结果类别：</p>
			<!-- 开始循环 -->
			<c:choose>
				<c:when test="${not empty resultTypeList}">
					<c:forEach items="${resultTypeList}" var="var" varStatus="vs">
						<div class="cpdjfx">
							<p class="cpdj">
								<span>${var.start_number}~${var.end_number}</span>分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${var.stage}
							</p>
							<p class="cpfx" style="margin-left: 120px;">${var.description}</p>
						</div>
					</c:forEach>
				</c:when>
			</c:choose>
    </div>
<a id="goback" href="<%=basePath%>evaluation/evaluationTestPaperList.act?field_id=${testPaperInfo.field_id}&point_id=${testPaperInfo.point_id}"><span class="glyphicon glyphicon-circle-arrow-left"></span>&nbsp;&nbsp;返回</a>
</div>
	<div class="clear"></div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>
