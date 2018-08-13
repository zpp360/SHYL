<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String localPath = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ localPath + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
<base href="<%=basePath%>">
<title>院校列表_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<script src="shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="shyl/js/mainjs/box.js" type="text/javascript"></script>
<link href="shyl/css/school-css.css" rel="stylesheet" type="text/css">
<link href="shyl/css/school-style.css" rel="stylesheet" type="text/css">
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	//批次选中状态
	var batch = $("#batch").val();
	if(batch==""){
		$("#batchAll").addClass("active");
	}else{
		$("#batch"+batch).addClass("active");
	}
	//学校类型选中
	var type = $("#school_type").val();
	if(type==""){
		$("#typeAll").addClass("active");
	}else{
		$("#type"+type).addClass("active");
	}
	
});
</script>
</head>
<body>
	<!--<header开始>-->
	<jsp:include page="../../common/header.jsp"><jsp:param name="id" value="rctd" /></jsp:include>
	<!--</header结束>-->
	<div class="w1100" style="margin-top: 90px;">
	<form action="<%=basePath%>joblist/goSchoolRanking.act" method="post" name="Form" id="Form">
		<div class="tit-name">
			<p class="fl">院校列表</p>
			<div class="fr">
				<input name="school_name" id="school_name" value="${pd.school_name}" placeholder="请输入院校名称关键词" type="text" class="searchbox">
				<button class="sousuo" onclick="search();">搜索</button>
			</div>
			<div class="clear"></div>
		</div>
		<div class="bid-left" style="width: 1020px;">
			<p class="bid-tit">
				<span>批次：</span>
				<a id="batchAll" href="javascript:search('batch','')">全部</a>
				<c:choose>
					<c:when test="${not empty batchList}">
						<c:forEach items="${batchList}" var="var" varStatus="vs">
							<a id="batch${var.distinguish_id}" href="javascript:search('batch','${var.distinguish_id}')">${var.batch}</a>
						</c:forEach>
					</c:when>
				</c:choose>
				<input type="hidden" value="${pd.batch}" id="batch" name="batch"> 
			</p>
			<p class="bid-tit mt40 fl">
				<span>类型：</span>
				<a id="typeAll" href="javascript:search('type','')">全部</a>
				<c:choose>
					<c:when test="${not empty typeList}">
						<c:forEach items="${typeList}" var="var" varStatus="vs">
							<a id="type${var.distinguish_id}" href="javascript:search('type','${var.distinguish_id}')">${var.type}</a>
						</c:forEach>
					</c:when>
				</c:choose>
				<input type="hidden" value="${pd.school_type}" id="school_type" name="school_type">
			</p>
		</div>
		</form>
		<div class="clear"></div>
		<div class="sch-all">
			<c:choose>
				<c:when test="${not empty effectList}">
					<c:forEach items="${effectList}" var="effectList" varStatus="vs">
					<ul>
						<li>
							<a href="<%=basePath%>joblist/goUniversity.act?school_id=${effectList.school_id}">
								<div class="sch-img">
									<img onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="<%=basePath%>images/${effectList.representative_building}" />
									<input type="hidden" name="a" value="${effectList.representative_building}"/>
								</div>
								<div class="sch-js">
									<img onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="<%=basePath%>images/${effectList.school_log}" />
									<input type="hidden" name="b" value="${effectList.school_logo}"/>
									<div class="fl sch-nr">
										<h2>${effectList.school_name}</h2>
										<p>学校地址： ${effectList.address_province}${effectList.address_city}</p>
									</div>
								</div>
							</a>
						</li>
							</ul>
				    </c:forEach>
				</c:when>
				<c:otherwise>
					<div align="center">没有相关数据</div>
				</c:otherwise>
				</c:choose>
		</div>
	</div>
	<div class="page-header position-relative">
		<table style="width: 100%;">
			<tr>
				<td style="align: center;" align="center">
					<div class="pagination" style="padding-top: 0px; margin: 0 auto; display: inline-block;">${page.platformPageStr}</div>
				</td>
			</tr>
		</table>
	</div>
	<div class="clear"></div>
	<!--<footer开始>-->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!--</footer结束>-->
	
	<script type="text/javascript">
		function search(type, id){
			if ("batch" == type) {
				$("#batch").val(id);
			} else if ("type" == type) {
				$("#school_type").val(id);
			}
			$("#Form").submit();
		}
	</script>
</body>
</html>