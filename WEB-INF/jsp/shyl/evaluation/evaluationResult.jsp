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
<title></title>
<base href="<%=basePath%>">
<style type="text/css">
.w1100{width: 100%; margin:0 auto;}
.result-top{ width:87%;}
.result-top {
    border: 1px solid #e3e3e3;
    background: #fff;
    padding: 10px 40px;
    float: left;
    margin: 10px 20px;
}
.cpjg{ font-size:16px; color:#333; }
.cpjg span{ font-size:34px; margin:0 20px;}
.cpjg img{ vertical-align:top; width:30px; height:30px;}
.cpdjfx{ margin-bottom:10px;}
.cpfx{ font-size:16px; color:#666; margin-left:30px;}
.cpdj{ font-size:16px; color:#333; margin-left:30px; }
.cpdj span{ font-size:24px; color:#016ab9;}
</style>
</head>
<body style="background:#f7f7f7;">
<div class="w1100" style="position: relative;">
<!--结果得分-->
    <div class="result-top">
        <p class="cpjg"><img src="<%=basePath%>shyl/images/cp-icon1.png">测评结果：<span style="color:#ff0000;">${pd.test_result}分</span>
        <span style="color:#12b901;" title="${pd.stage}">
          <c:choose>
			<c:when test="${fn:length(pd.stage) >13}">
					${fn:substring(pd.stage, 0, 13)}...
			</c:when>
			<c:otherwise>
			${pd.stage}
			</c:otherwise>
			</c:choose>
		</span>
		</p>
        <p class="cpfx">${pd.description}</p>
    </div>
    <c:if test="${paperPd.field_id!=12 && paperPd.field_id!=13}">
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
				<c:when test="${empty resultTypeList}">
					<div class="cpdjfx">
							<p class="cpdj">
								<span>无</span>
							</p>
					</div>				
				</c:when>
			</c:choose>
    </div>
    </c:if>
</div>
	<div class="clear"></div>
</body>
</html>
