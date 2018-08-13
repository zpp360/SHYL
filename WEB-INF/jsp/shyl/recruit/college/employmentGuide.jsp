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
<meta http-equiv=”X-UA-Compatible” content=”IE=EmulateIE7″ />
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>求职指南详情_济南市服务外包公共服务平台</title>
<!--<header开始>-->
<jsp:include page="../../common/header.jsp"></jsp:include>
<!--</header结束>-->
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<!-- <script src="shyl/js/jquery-1.9.1.min.js" type="text/javascript"></script> -->
<script type="text/javascript">
//关闭当前画面
function Close() {
	window.opener = null;
	window.open('', '_self');
	window.close();
}
$(document).ready(function(){
	if ($("#pdvalue").val() == "") {
		$("#prompt").modal('show');
	}else{
		var id = $("#category").val();
		$("#typeD"+id).addClass("types1");
	}
});
function getList(){
	var categoryid = $("#category").val();
	var flag = $("#flag").val();
	window.location.href ='<%=basePath%>joblist/typeList.act?CATEGORY='+flag;
	$("#prompt").modal('hide');
}
</script>
<style>
.types {
    border: 1px solid #ccc;
    padding: 8px 8px 8px 8px;
    margin-right: 15px;
    font-size: 14px;
    color: #505a78;
}
.types1 {
    border: 1px solid #ccc;
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

<!--<banner开始>-->
<div class="clear"></div>
<div class="cmain">
	<div class="cml_1">
		<div class="cml_2 clearfix">
			<input type="hidden" id="category" value="${pg.CATEGORY}"/>
			<input type="hidden" id="flag" value="${pg.flag}"/>
			<div class="cml_title">
				<c:choose>
					<c:when test="${not empty pd}">
					<h1 style="line-height: 28px;">${pd.MNAME}</h1>
					</c:when>
				</c:choose>
				<c:choose>
			    <c:when test="${not empty pdb.title}">
			    <a href="<%=basePath%>joblist/employmentGuide.act?EMPLOYMENT_ID=${pdb.employment_id}&CATEGORY=${pg.CATEGORY}&flag=${pg.CATEGORY}">【下一篇】${pdb.title}</a>
				</c:when>
				<c:otherwise>
				<a href="javaScript:void(0);">没有下一篇了</a>
				</c:otherwise>
				</c:choose>
			</div>
			<div class="cml_content">
				<c:choose>
					<c:when test="${not empty pd}">
						<h2 style=" text-align:center;border-bottom: 0px dashed">${pd.TITLE}</h2>
						<h2>
							<p class="tit">
								<a href="javaScript:void(0);">${pd.MNAME}</a>
								<i></i>
								<span><a href="javaScript:void(0);">${pd.INSERT_TIMESTAMP}</a></span>
								<a href="javaScript:void(0);">来源：</a><a href="javaScript:void(0);">${pd.GUIDE_SOURCES}</a>
							</p>
						</h2>
						<div class="cml_content_main">
						${pd.GUIDE_CONTENT}
						</div>
					</c:when>
					<c:otherwise>
						<input type="hidden" id="pdvalue" value="" />
					</c:otherwise>
				</c:choose>
				<c:choose>
			    <c:when test="${not empty pda.title}">
				<a href="<%=basePath%>joblist/employmentGuide.act?EMPLOYMENT_ID=${pda.employment_id}&CATEGORY=${pg.CATEGORY}&flag=${pg.CATEGORY}" class="page-b">【上一篇】${pda.title}</a>
				</c:when>
				<c:otherwise>
				<a href="javaScript:void(0);" class="page-b">没有上一篇了</a>
				</c:otherwise>
				</c:choose>
				
			</div>
		</div>
	</div>
	<div class="cmr_1">
	    <div class="cmr_2" style="height: 60px;">
		</div>
		<div class="cmr_2">
			<h1>类别</h1>
			<div class="typeDiv">
				<c:choose>
					<c:when test="${not empty listType}">
						<c:forEach items="${listType}" var="types" varStatus="vs">
						 <c:if test="${vs.index <= 2}">
						 	<a id="noticeLink${types.distinguish_id}"  href="<%=basePath%>joblist/typeList.act?CATEGORY=${types.distinguish_id}">
						 		<span class="types" id="typeD${types.distinguish_id}">${types.dname}</span>
						 	</a>
						 </c:if>
						</c:forEach>
					</c:when>
				</c:choose>
			</div>
			<div class="typeDiv">
				<c:choose>
					<c:when test="${not empty listType}">
						<c:forEach items="${listType}" var="types" varStatus="vs">
						 <c:if test="${vs.index > 2}">
						 	<a id="noticeLink${types.distinguish_id}"  href="<%=basePath%>joblist/typeList.act?CATEGORY=${types.distinguish_id}">
						 		<span class="types" id="typeD${types.distinguish_id}">${types.dname}</span>
						 	</a>
						 </c:if>
						</c:forEach>
					</c:when>
				</c:choose>
			</div>
		</div>
		<div class="cmr_2">
			<h1>公开指南</h1>
			<ul class="guanzhu">
				<c:choose>
					<c:when test="${not empty listTime}">
						<c:forEach items="${listTime}" var="times" varStatus="vs">
							<li>
							    <c:if test = "${vs.index == 0}">
							    	<a href="<%=basePath%>joblist/employmentGuide.act?EMPLOYMENT_ID=${times.employment_id}&CATEGORY=6&flag=${pg.flag}">
										<h1>${times.title}</h1>
									</a>
									<span style="width: 100%; font-size: 0.85em;">${times.guide_content}   <a href="<%=basePath%>joblist/employmentGuide.act?EMPLOYMENT_ID=${times.employment_id}&CATEGORY=6&flag=${pg.flag}"><span style="float: right;">[详情]</span></a></span>
									
							    </c:if>
							    <c:if test = "${vs.index != 0}">
									<a href="<%=basePath%>joblist/employmentGuide.act?EMPLOYMENT_ID=${times.employment_id}&CATEGORY=6&flag=${pg.flag}">
										> ${times.title}
									</a>
								</c:if>
						    </li>
						</c:forEach>
					</c:when>
				</c:choose>
			</ul>
		</div>
	</div>
	<div class="modaldel fade in" id="prompt" tabindex="-1" role="dialog"
		aria-labelledby="delresume" aria-hidden="false" data-backdrop="static"
		data-target="" style="display: none;">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						onclick="getList()">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<p id="warntext">该${pg.newsname}不存在，请浏览其它！</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" onclick="getList()"
						id="d">确认</button>
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
