<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
<title>求职指南_济南市服务外包公共服务平台</title>
<jsp:include page="../../common/header.jsp"><jsp:param name="id" value="rctd" /></jsp:include>
<link href="/SHYL/shyl/css/maincss/rencai.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	$(document).ready(function(){
		var id = $("#CATEGORY").val();
		$("#typeDiv" + id).addClass("types1");
		$("#categoryName").html($("#typeDiv" + id).html());
	});
	
	//显示选择的指南内容
	function showNewsList(category){
		document.getElementById("CATEGORY").value=category;
		var url = document.forms[0].getAttribute("action");
		document.forms[0].action=url+"?CATEGORY="+category;
		document.forms[0].submit();
	}
</script>
<style>
.types {
    border: 1px solid #cccccc;
    padding: 8px 8px 8px 8px;
    margin-right: 15px;
    font-size: 14px;
    color: #505a78;
}
.types1 {
    border: 1px solid #cccccc;
    padding: 8px 8px 8px 8px;
    margin-right: 15px;
    font-size: 14px;
    color: red;
}
.typeDiv {
    margin-top: 20px;
}
</style>
</head>
<body>
<!--<cmain开始>-->
<div class="clear"></div>
<form action="<%=basePath%>joblist/typeList.act" method="post" name="Form" id="Form">
<div class="cmain">
	<div class="cml_1">
		<div class="cml_2 clearfix">
			<div class="cml_title">
				<h1>求职<i>指南</i></h1>
				<span id="categoryName"></span>
			</div>
			<div class="cml_content">
			<ul>
				<c:forEach items="${guideList}" var="guide" varStatus="vs">
					<c:if test="${pd.CATEGORY != '6'}">
						<c:set var="url" value="joblist/employmentGuide.act?EMPLOYMENT_ID=${guide.EMPLOYMENT_ID}&CATEGORY=${pd.CATEGORY}&flag=${pd.CATEGORY}"/>
					</c:if>
					<li>
						<a href="<%=basePath%>${url}" class="cml_c_1" id="">
							<c:choose>
								<c:when test="${fn:length(guide.TITLE) >50}">
									${fn:substring(guide.TITLE, 0, 50)}...
								</c:when>
								<c:otherwise>
									${guide.TITLE}
								</c:otherwise>
							</c:choose>
						</a>
						<i><span style="font-size: 0.85em;color: #a5abbb;"><c:choose>
								<c:when test="${fn:length(guide.GUIDE_SOURCES) >12}">
									${fn:substring(guide.GUIDE_SOURCES, 0, 12)}...
								</c:when>
								<c:otherwise>
									${guide.GUIDE_SOURCES}
								</c:otherwise>
							</c:choose></span>
						<span class="cml_c_3 cml_c_s">${guide.UPDATE_TIMESTAMP1}</span></i>
						<a href="<%=basePath%>${url}" class="p">${guide.GUIDE_CONTENT}
						</a>
					</li>
				</c:forEach>
			</ul>
			</div>
			<div class="page-header position-relative">
				<table style="width: 100%;">
					<tr><td style="align: center;" align="center"><div class="pagination"
						style="padding-top: 0px; margin:0 auto;  display: inline-block;">${page.platformPageStr}</div></td>
					</tr>
				</table>
			</div>
		</div>
			</div>
	<div class="cmr_1">
		<div class="cmr_2" style="height: 60px;">
		</div>
		<div class="cmr_2">
			<h1>类别</h1>
			<div class="typeDiv">
				<a href="#" id="typeLink0" onclick="showNewsList('0')"><span class="types" id="typeDiv0">面试问题</span></a>
				<a href="#" id="typeLink1" onclick="showNewsList('1')"><span class="types" id="typeDiv1">面试技巧</span></a>
				<a href="#" id="typeLink2" onclick="showNewsList('2')"><span class="types" id="typeDiv2">自我介绍</span></a>
			</div>
			<div class="typeDiv">
				<a href="#" id="typeLink3" onclick="showNewsList('3')"><span class="types" id="typeDiv3">就业前景</span></a>
				<a href="#" id="typeLink4" onclick="showNewsList('4')"><span class="types" id="typeDiv4">行业资讯</span></a>
				<a href="#" id="typeLink5" onclick="showNewsList('5')"><span class="types" id="typeDiv5">就业动态</span></a>
			</div>
			<input type="hidden" id="CATEGORY" name="CATEGORY" value="${pd.CATEGORY}"/>
		</div>
		<div class="cmr_2">
			<h1>公开指南</h1>
			<ul class="guanzhu">
				<c:forEach items="${publicGuide}" var="publicGuide" varStatus="vs">
					<li>
						<c:if test = "${vs.index == 0}">
					    	<a href="<%=basePath%>joblist/employmentGuide.act?EMPLOYMENT_ID=${publicGuide.employment_id}&CATEGORY=6&flag=${pd.CATEGORY}">
								<h1>${publicGuide.title}</h1>
							</a>
							<span style="width: 100%; font-size: 0.85em;">${publicGuide.guide_content}    <a href="<%=basePath%>joblist/employmentGuide.act?EMPLOYMENT_ID=${publicGuide.employment_id}&CATEGORY=6&flag=${pd.CATEGORY}"><span style="float: right;">[详情]</span></a></span>
					    </c:if>
					    <c:if test = "${vs.index != 0}">
							<a href="<%=basePath%>joblist/employmentGuide.act?EMPLOYMENT_ID=${publicGuide.employment_id}&CATEGORY=6&flag=${pd.CATEGORY}">
								> ${publicGuide.title}
							</a>
						</c:if>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
</form>
<!--</cmain结束>-->
<div class="clear"></div>
<!--<footer开始>-->
<jsp:include page="../../common/footer.jsp"></jsp:include>
<!--</footer结束>-->
</body>
</html>