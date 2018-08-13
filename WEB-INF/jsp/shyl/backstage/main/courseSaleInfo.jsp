<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>课程销售详情_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">
<!-- jsp文件头和头部 -->
<%@ include file="../../../system/admin/top.jsp"%>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<link rel="stylesheet" href="static/css/thing.css" />
<style type="text/css">

.btnlist {
	padding: 5px;
	margin: 5px;
	border: 1px solid #ddd;
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}

</style>
</head>
<body>
	<div class="container-fluid" id="main-container">
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<div class="row-fluid">
					<!-- 检索  -->
					<form action="<%=basePath%>courseSale/list.do" method="post" name="Form" id="Form">
						<table style="width:100%;">
							<tr >
								<td align="center" style="font-size:1.5em;">
									<c:if test="${fn:length(pd.courseName) >= 65}"><span title="${pd.courseName}">${fn:substring(pd.courseName,0, 65)}...</span></c:if>
									<c:if test="${fn:length(pd.courseName) < 65}">${pd.courseName}</c:if>	
								</td>
							</tr>
						</table>
						<hr/>
						<!-- 检索  -->
						<table id="table_report"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
											<th class="center" width="5%">序号</th>
									<th class="center" width="35%">购买者</th>
									<th class="center" width="30%">购买价格（元）</th>
									<th class="center" width="30%">购买时间</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty varList}">
											<c:forEach items="${varList}" var="var" varStatus="vs">
												<tr>
													<td class='center' width="5%">${vs.index+1}</td>
													<td class="center" width="35%"><c:if test="${fn:length(var.NAME) >= 30}"><span title="${var.NAME}">${fn:substring(var.NAME,0, 30)}...</span></c:if><c:if test="${fn:length(var.NAME) < 30}">${var.NAME}</c:if>	</td>
													<td class="center" width="30%">${var.PRICE}</td>
													<td class="center" width="30%">${var.TIME}</td>
												</tr>
											</c:forEach>
									</c:when>
									<c:otherwise>
										<tr class="main_info">
											<td colspan="100" class="center">没有相关数据</td>
										</tr>
									</c:otherwise>
								</c:choose>


							</tbody>
						</table>

						<div class="page-header position-relative">
							<table style="width: 100%;">
								<tr>
									<td style="vertical-align: top;"><div class="pagination"
											style="float: right; padding-top: 0px; margin-top: 0px;">${page.pageStr}</div></td>
								</tr>
							</table>
						</div>
						
						<div align="center" style="margin-top: 10px;">
			<a class=" btn-small btns" onclick="toBack();"><i class=" icon-circle-arrow-left"></i>返回</a>

		</div>
					</form>
				</div>
			</div>
		</div>
		<!--/#page-content-->
	</div>
	<!--/.fluid-container#main-container-->

	<!-- 返回顶部  -->
	<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse"> <i
		class="icon-double-angle-up icon-only"></i>
	</a>

	<!-- 引入 -->
	<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>


	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!--提示框-->
	<script type="text/javascript">
	    $(top.hangge());
		// 返回
		function toBack(){
			$("#Form").submit();
		}
	</script>
</body>
</html>

