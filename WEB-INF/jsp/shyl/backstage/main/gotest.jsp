<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>测评管理_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">
<!-- jsp文件头和头部 -->
<%@ include file="../../../system/admin/top.jsp"%>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js"
	type="text/javascript"></script>
<style type="text/css">
.btnlist {
	padding: 5px;
	margin: 5px;
	border: 1px solid #ddd;
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}
.no{font-size:25px; color:#016ab9;margin-left:47px;margin-top:10px;}
</style>
</head>
<body>
	<div class="container-fluid" id="main-container">
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<div class="row-fluid">
					<!-- 检索  -->
					<form action="<%=basePath%>backtester/goInfoN.do" method="post"
						name="Form" id="Form">
						<div style="margin-top: 30px">
							<span style="font-size: 20px; margin-left: 15px;"><img
								alt="" src="plugins/webuploader/test_1.PNG"><b>测评结果：</b></span> <span
								style="font-size: 30px; margin-left: 10px; color: red"><b>${pd.test_result}</b></span>
							<span style="font-size: 30px; margin-left: 10px; color: green"><b>${pd.stage}</b></span>
						</div>
						<div>
							<span style="font-size: 15px; margin-left: 48px;">${pd.description}</span>
						</div>
						<hr />
						<span style="font-size: 20px; margin-left: 15px"><img
							alt="" src="plugins/webuploader/test_2.PNG"><b>测评结果类别：</b></span>
						<table>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty backList}">
										<c:forEach items="${backList}" var="var" varStatus="vs">
											<tr style="height: 60px">
												<td style="width: 90px; text-align: right;"><span
													style="font-size: 30px; color: #0072E3">${var.start_number}&nbsp;～</span></td>
												<td style="width: 70px; text-align: center;"><span
													style="font-size: 30px; color: #0072E3">${var.end_number}</span><span>&nbsp;分</span></td>
												<td style="font-size: 20px;"><b>${var.stage}</b></td>

											</tr>
											<tr style="height: 60px">
												<td style="width: 90px"></td>
												<td style="width: 70px;"></td>
												<td style="font-size: 15px;">${var.description}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:when test="${ empty backList}">
											<p class="no">
												<span>无</span>
											</p>
									</c:when>
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
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());
	</script>
</body>
</html>