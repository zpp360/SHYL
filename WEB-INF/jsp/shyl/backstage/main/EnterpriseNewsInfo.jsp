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
<title>新闻详情_济南市服务外包公共服务平台</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="shyl/css/uploadify.css">
<%@ include file="../../../system/admin/top.jsp"%>
<link rel="stylesheet" href="static/css/thing.css" />
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<style type="text/css">
input[disabled] {
background: #ffffff;
}
</style>
</head>
<body>
<br>
	<form action="<%=basePath%>news/${msg }.do" name="Form" id="Form"
		method="post">
		<div id="zhongxin">
		<input type="hidden" name="id" id="id" value="${pd.id }"/>
			<table class="table ">
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>企业名称</B></td>
					<td><select class="chzn-select" name="company_id" id="company_id" disabled="disabled"
						data-placeholder="" style="height: 30px; width: 300px">
							<c:forEach items="${NList}" var="ind">
											<option value="${ind.user_id }" <c:if test="${ind.user_id == pd.company_id}">selected</c:if>>${ind.company_name }</option>
										</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>标题</B></td>
					<td><input type="text" name="title" id="title" value="${pd.title}" maxlength="40" disabled="disabled"
						style="height: 30px; width: 300px" placeholder="" title="" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap"
						style="width: 80px; text-align: left; padding-top: 13px;"><B>新闻内容</B></td>
					<td>
					<div id="content" style="min-height: 450px; margin: 0 auto;width:80%;float:left;margin-top:5px;" title="事件内容">${pd.content}</div>
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		<div align="center" style="margin-top: 10px;">
			<a class="btn  btn-light" onclick="returnback()"><i class=" icon-circle-arrow-left"></i>返回</a>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="<%=basePath%>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	<!-- 引入 -->
	<!-- 引入 -->
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<script src="shyl/js/jquery.uploadify.min.js" type="text/javascript"></script>
	<!-- 下拉框 -->
	<script type="text/javascript"
		src="static/js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->

	<!-- 日期框 -->
	<!-- 富文本编辑器start -->
	<!-- 配置文件 -->
	<script type="text/javascript" src="plugins/ueditor/ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript" src="plugins/ueditor/ueditor.all.js"></script>
	<!-- 富文本编辑器end -->
	
	<script type="text/javascript">
		$(top.hangge());
		$(function() {
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			//日期框
			$('.date-picker').datepicker();
			$('.date-picker1').datepicker({
				 language:  'zh-CN',
		            format: 'yyyy-mm',
		            weekStart: 1,
		            todayBtn:  'linked',
		            autoclose: 1,
		            todayHighlight: 1,
		            minViewMode: 'months', //这里就设置了默认视图为年视图
		            minView: 3, //设置最小视图为年视图
		            forceParse: 0
			});
		});
	</script>
	
	<script type="text/javascript">
		//返回
	    function returnback(){
	    	window.location.href="<%=basePath%>enterpriseN/list.do";
		}
	</script>

</body>
</html>