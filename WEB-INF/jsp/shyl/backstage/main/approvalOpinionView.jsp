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
<base href="<%=basePath%>">

<meta charset="utf-8" />
<title>审批意见_济南市服务外包公共服务平台</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../../system/admin/top.jsp"%>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js"
	type="text/javascript"></script>
	<script type="text/javascript">
	$(top.hangge());
</script>
</head>
<body>
	<br>
 		<div id="zhongxin">
			<input type="hidden" value="${pd.info_id}" id="infoid" name="infoid">
			<table class="table" style="max-height:500px">
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>审批者</B></td>
					<td style="text-align: left; padding-top: 13px;"><span>${pd.NAME}</span></td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>审批意见</B></td>
					<td style="text-align: left; padding-top: 13px;height:248px;"><div style="width:480px;word-wrap: break-word;word-break: normal;">${pd.APPROVAL_OPINION}</div></td>
				</tr>
			</table>
		</div>
		<div align="center" style="margin-top: 10px;">
			<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
		</div>
		<div id="zhongxin2" class="center" style="display: none">
			<br /> <br /> <br /> <br /> <img
				src="<%=basePath%>static/images/jiazai.gif" /><br />
			<h4 class="lighter block green"></h4>
		</div>
	<!-- 引入 -->
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript"
		src="static/js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->
</body>
</html>