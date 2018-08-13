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
<title>政策详情_济南市服务外包公共服务平台</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../../system/admin/top.jsp"%>
<link rel="stylesheet" href="static/css/thing.css" />
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script src="<%=basePath%>/shyl/js/layer/layer.js"></script>
<!-- 日期框 -->
<style type="text/css">
input[disabled] {
background: #ffffff;
}
</style>
</head>
<body>
<br>
	<form action="<%=basePath%>departs/${msg }.do" name="Form" id="Form" method="post">
		<div id="zhongxin">
			<input type="hidden" name="DEPART_ID" id="DEPART_ID"
				value="${pd.DEPART_ID }" />
			<table class="table ">
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>单位名称</B></td>
					<td><select class="chzn-select" name="UNIT_NAME_ABBREVIATION" id="UNIT_NAME_ABBREVIATION" disabled="disabled"
						data-placeholder="单位名称"  style="height: 20px; width: 315px;">
							<option value=""></option>
									<c:forEach items="${NList}" var="ind">
										<option value="${ind.UNIT_ID }" <c:if test="${ind.UNIT_ID == pd.UNIT_ID}">selected</c:if>>${ind.UNIT_NAME_ABBREVIATION }</option>
									</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>部门名称</B></td>
					<td><input type="text" name="DEPART_NAME" id="DEPART_NAME"
						value="${pd.DEPART_NAME}" maxlength="40" disabled="disabled"
						 style="height: 20px; width: 300px;" placeholder="请输入部门名称"
						title="部门名称" onblur="trim(this);" /></td>
				</tr>

				<tr>
					<td nowrap="nowrap"
						style="width: 80px; text-align: left; padding-top: 13px;"><B>简介</B></td>
					<td><textarea id="INTRODUCTION" name="INTRODUCTION"
							style="min-height: 450px; margin: 0 auto; width: 80%;float:left"
							title="简介">${pd.INTRODUCTION}</textarea></td>
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
		<div id="zhongxin2" class="center" style="display: none">
			<br /> <br /> <br /> <br /> <img src="<%=basePath%>static/images/jiazai.gif" /><br />
			<h4 class="lighter block green"></h4>
		</div>
	</form>
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

	<!-- 日期框 -->
	<!-- 富文本编辑器start -->
	<!-- 配置文件 -->
	<script type="text/javascript" src="plugins/ueditor/ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript" src="plugins/ueditor/ueditor.all.js"></script>
	<!-- 实例化编辑器 -->
	<script type="text/javascript">
		var ue = UE.getEditor("INTRODUCTION",{readonly:true});
		//ueditor有标签文本

		function getContent() {
			var arr = [];
			arr.push(UE.getEditor('INTRODUCTION').getContent());
			return arr.join("");
		}

		function clean() {
			ue.setContent("");
		}

		function setFocus() {
			UE.getEditor('INTRODUCTION').focus();
		}
	</script>
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
				language : 'zh-CN',
				format : 'yyyy-mm',
				weekStart : 1,
				todayBtn : 'linked',
				autoclose : 1,
				todayHighlight : 1,
				minViewMode : 'months', //这里就设置了默认视图为年视图
				minView : 3, //设置最小视图为年视图
				forceParse : 0
			});
		});
	</script>
	<script type="text/javascript">
		//返回
	    function returnback(){
	    	window.location.href="<%=basePath%>departs/list.do";
		}
	</script>

</body>
</html>