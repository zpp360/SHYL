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
<base href="<%=basePath%>">
<title>招聘信息_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../common/header.jsp"%>
<link rel="stylesheet" href="<%=basePath%>shyl/css/maincss/mypage.css" />
<script src="<%=basePath%>shyl/js/jquery-1.7.2.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.min.js"></script>
<script src="<%=basePath%>shyl/js/jquery.tips.js"></script>
<!--分页  -->
<script type="text/javascript" src="<%=basePath%>shyl/js/common/head.js"></script>
<!-- 新追加部分 -->
<!--引入弹窗组件start-->
<script src="<%=basePath%>plugins/attention/zDialog/zDrag.js"></script>
<script src="<%=basePath%>plugins/attention/zDialog/zDialog.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<style>
.emptyView{
	height:200px; 
	text-align: center; 
	line-height: 100px;
	color: #a5abbb; 
	font-size: 0.75em;
}
.jianli li {
    width: 180px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    float: left;
    line-height: 35px;
    height: 35px;
}
</style>

</head>
<body id="top" style="background-color: #f7f7f7;">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>

		<div class="mypage_left">
			<div class="mypage_image">
				<img onerror="showImgDelay(this,'<%=basePath%>shyl/images/mylogo.jpg');" src="<%=basePath%>images/${pd.LOGO}" alt="LOGO" style="max-width: 100%; max-height: 100%;" >
			</div>
			<a id="resumemt" href="<%=basePath%>company/info.act?companyId=${pd.USER_ID}">企业信息</a>
			<a
				id="trainingmanage"
				href="<%=basePath%>recruitment/list.act?companyId=${pd.USER_ID}" class="hover">招聘信息</a>
		</div>
		<div class="mypage_right">
			<h2>
				<span class="glyphicon glyphicon-cog"></span>招聘信息
			</h2>
			<!--form 用于分页 -->
			<form action="<%=basePath%>recruitment/list.act" method="post"
				name="Form" id="Form">
				<input type="hidden" name="companyId" value="${pd.USER_ID}">
			</form>
				<div class="jianli">
					<ul class="bg1">
						<li class="a1">职位名称</li>
						<li class="a2">薪资</li>
						<li class="a3">招聘人数</li>
						<li class="a4">工作地点</li>
						<li class="a5">更新日期</li>
					</ul>
					<c:if test="${empty varList }">
						<div class="emptyView">
							没有相关信息
						</div>
					</c:if>
					<c:forEach items="${varList}" var="var" varStatus="vs">
						<ul>
							<li class="a1"><a  href="<%=basePath%>job/detail/info.act?companyId=${var.USER_ID}&positionId=${var.RECRUITMENT_INFO_ID}"
											target="_blank" title="${var.POSITION_NAME}">${var.POSITION_NAME}</a></li>
							<li class="a2">${var.SALARY}</li>
							<li class="a3">${var.RECRUITMENT_NUMBER}</li>
							<li class="a4">${var.WORK_PLACE_CITY}</li>
							<li class="a5">${var.UPDATE_TIMESTAMP}</li>
						</ul>
					</c:forEach>
			</div>
			<!-- 分页开始 -->
			<!-- 分页开始 -->
					 <div class="page-header position-relative">
				<table style="width: 100%;">
					<tr><td style="align: center;" align="center"><div class="pagination"
								style="padding-top: 20px; margin:0 auto;  font-size:13px; display: inline-block;">${page.platformPageStr}</div></td>
					</tr>
				</table>
			</div>
					<!-- 分页结束 -->
		</div>
		<div class="clearfix"></div>
	</div>

	<%@ include file="../../common/footer.jsp"%>

</body>

</html>