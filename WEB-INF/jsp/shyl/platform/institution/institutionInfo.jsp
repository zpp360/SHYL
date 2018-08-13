<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String localPath = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ localPath + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
<base href="<%=basePath%>">
<title>机构列表_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<script src="shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="shyl/js/mainjs/box.js" type="text/javascript"></script>
<link href="shyl/css/school-css.css" rel="stylesheet" type="text/css">
<link href="shyl/css/school-style.css" rel="stylesheet" type="text/css">
<link href="/SHYL/shyl/css/maincss/fuwu.css" rel="stylesheet"
	type="text/css">
<link href="/SHYL/shyl/css/maincss/rencai.css" rel="stylesheet"
	type="text/css">
<script src="<%=basePath%>shyl/js/mainjs/errImage.js"
	type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	//批次选中状态
	var batch = $("#industry").val();
	if(batch==""){
		$("#batchAll").addClass("active");
	}else{
		$("#industry"+batch).addClass("active");
	}
	
});
</script>
<style type="text/css">
div.rc_zw_category dl dd a{
width: 123px;
}
div.rc_zw_category dl dd a:hover, div.rc_zw_category dl dd a.hover {
    color: #ff8a10;
    background-color: #ffffff;
    border: 1px solid #ff8a10;
    }
.rc_zw_category .active {
	border-radius: 5px;
	border: 1px solid #ff8a10;
	color: #ff8a10;
}
</style>
</head>
<body style="background:#f7f7f7;">
	<!--<header开始>-->
	<jsp:include page="../../common/header.jsp"></jsp:include>
	<!--</header结束>-->
	<div class="w1100" style="margin-top: 90px;">
		<div class="tit-name">
			<p class="fl">机构列表</p>
			<div class="fr">
				<form action="<%=basePath%>institution/institutionlist.act" method="post" name="Form" id="Form">
					<input type="hidden" value="${pd.industry}" id="industry" name="industry"> 
					<input name="institutions_name" id="institutions_name" value="${pd.institutions_name}" placeholder="请输入机构名称" type="text" class="searchbox">
					<button class="sousuo" onclick="search();">搜索</button>
				</form>
			</div>
			<div class="clear"></div>
		</div>
		<div class="rc_zw_category" style="width: 1020px;padding: 40px;float: left;margin-top: 20px;border: 1px solid #e3e3e3;background: #fff;">
			<dl>
				<dd style="margin-top:5px; width:80px;font-size: 14px;color: #666;border-left: 3px solid #ff8142;height: 20px;line-height: 20px;text-indent: 10px;">所属行业 :</dd>
				<dd style="width:930px;float:left">
					<a id="batchAll" href="<%=basePath%>institution/institutionlist.act">全部</a>
				<c:choose>
					<c:when test="${not empty industryList}">
						<c:forEach items="${industryList}" var="industrylist" varStatus="vs">
						
						<c:choose>
													<c:when test="${fn:length(industrylist.industry)>7}">
													
													<a id="industry${industrylist.distinguish_id}" title="${industrylist.industry}" href="<%=basePath%>institution/institutionlist.act?industry=${industrylist.distinguish_id}">${fn:substring(industrylist.industry,0, 7)}...</a>
													</c:when>
													<c:otherwise>
													<a id="industry${industrylist.distinguish_id}" title="${industrylist.industry}" href="<%=basePath%>institution/institutionlist.act?industry=${industrylist.distinguish_id}">${industrylist.industry}</a>
													</c:otherwise>
												</c:choose>
						
						
						
						
						
							</c:forEach>
					</c:when>
				</c:choose>
				</dd>
			</dl>
			
		</div>
		<div class="clear"></div>
		<div class="sch-all">
			
			<c:choose>
				<c:when test="${not empty varList}">
					<c:forEach items="${varList}" var="var" varStatus="vs">
					<ul>
						<li>
							<a href="<%=basePath%>institution/toEdit.act?institutions_id=${var.institutions_id}">
								<div class="sch-img">
									<img onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');"
											src="<%=basePath%>images/${var.file_path}" />
								</div>
								<div class="sch-js">
									<img
											onerror="showImgDelay(this,'<%=basePath%>shyl/images/logo_temp.jpg');"
											src="<%=basePath%>images/${var.logo}">
									<div class="fl sch-nr">
										<h2>${var.institutions_name}</h2>
										<p>联系人： ${var.contact}</p>
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
		function search(){
			$("#Form").submit();
		}
	</script>
</body>
</html>