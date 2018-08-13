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
<title>新闻发布_济南市服务外包公共服务平台</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../../system/admin/top.jsp"%>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js"
	type="text/javascript"></script>
<script type="text/javascript">
	$(top.hangge());
	$(function() {
		//下拉框
		$(".chzn-select").chosen();
		$(".chzn-select-deselect").chosen({
			allow_single_deselect : true
		});
	});
</script>
<script type="text/javascript">
	//保存
	function save() {
		if ($("#examina_conten").val() == "") {
			$("#examina_content").tips({
				side : 3,
				msg : '请输入审批意见',
				bg : '#FF5080',
				time : 3
			});
			$("#examina_content").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
</script>
</head>
<body>
	<br>
	<form action="<%=basePath%>search/saveExamina.do" name="Form" id="Form"
		method="post">
		<div id="zhongxin">
			<input type="hidden" value="${pd.info_id}" id="infoid" name="infoid">
			<table class="table ">
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>审批结果</B></td>
					<td><select class="chzn-select" name="examinaSelect"
						id="examinaSelect" data-placeholder="请选择审批结果"
						style="height: 20px; width: 315px;"
						value="${pd.examination_result}">
							<c:forEach items="${examin_result}" var="role">
								<option value="${role.DISTINGUISH_ID }"
									<c:if test="${role.DISTINGUISH_ID == pd.examination_result}">selected</c:if>>${role.VALUE}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td nowrap="nowrap"
						style="width: 80px; text-align: left; padding-top: 13px;"><B>审批意见</B></td>
					<td><textarea id="examina_content" name="examina_content"
							style="min-height: 255px; margin: 0 auto; width: 80%; float: left;"
							title="审批内容">${pd.approval_opinion }</textarea></td>
				</tr>

			</table>
		</div>
		<div align="center" style="margin-top: 10px;">
			<a class="btn btn-mini btn-primary" onclick="save();"
				style="margin-left: 40px;">保存</a> <a class="btn btn-mini btn-danger"
				onclick="top.Dialog.close();">取消</a>

		</div>
		<div id="zhongxin2" class="center" style="display: none">
			<br /> <br /> <br /> <br /> <img
				src="<%=basePath%>static/images/jiazai.gif" /><br />
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

	<!-- 富文本编辑器start -->
	<!-- 配置文件 -->
	<script type="text/javascript" src="plugins/ueditor/ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript" src="plugins/ueditor/ueditor.all.js"></script>
	<!-- 实例化编辑器 -->
	<script type="text/javascript">
		var ue = UE.getEditor("examina_content");
		//ueditor有标签文本

		function getContent() {
			var arr = [];
			arr.push(UE.getEditor('examina_content').getContent());
			return arr.join("");
		}

		function clean() {
			ue.setContent("");
		}

		function setFocus() {
			UE.getEditor('examina_content').focus();
		}
	</script>
	<!-- 富文本编辑器end -->
	<script type="text/javascript">
		var tips = function(id, msg) {
			$("#" + id).tips({
				side : 2,
				msg : msg,
				bg : '#FF5080',
				time : 2
			});
		}
	</script>
</body>
</html>