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

<meta charset="utf-8" />
<title>指南详情_济南市服务外包公共服务平台</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<%@ include file="../../../system/admin/top.jsp"%>
<link rel="stylesheet" href="static/css/thing.css" />
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<style type="text/css">
input[disabled] {
background: #ffffff;
}
</style>
<!-- 日期框 -->
</head>
<body>
	<br>
	<form action="" name="Form" id="Form" method="post">
		<div id="zhongxin">
			<table class="table ">
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>指南类别</B></td>
					<td><select class="chzn-select" name="category" id="category" disabled="disabled"
						data-placeholder="请选择指南类别" style="height: 30px; width: 300px">
							<option value=""></option>
							<c:forEach items="${NList}" var="ind">
								<option value="${ind.distinguish_id }"
									<c:if test="${ind.distinguish_id == pd.category}">selected</c:if>>${ind.value }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>指南名称</B></td>
					<td><input type="text" name="title" id="title" disabled="disabled"
						value="${pd.title}" maxlength="50"
						style="height: 30px; width: 300px" placeholder="请输入指南名称"
						title="指南名称" onblur="trim(this);" /></td>
				</tr>

				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>指南来源</B></td>
					<td><input type="text" name="guide_sources" id="guide_sources"
						value="${pd.guide_sources}" maxlength="50" disabled="disabled"
						style="height: 30px; width: 300px" placeholder="请输入指南来源"
						title="指南来源" onblur="trim(this);" /></td>
				</tr>
				<tr>
				    <td style="width: 80px; text-align: left; padding-top: 13px;"><B>缩略图片</B></td>
					<td>
						<div class="form-group" id="businessDiv">
						    <div class="col-sm-2">
						    	<c:if test="${empty pd.guide_thumbnail}">
                                    <img id="weixin_show" name="weixin_show" style="width: 158px; height: 190px;" src="<%=basePath%>shyl/images/temp.png">
                                </c:if>
                                <c:if test="${!empty pd.guide_thumbnail}">
                                    <img onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" id="weixin_show" name="weixin_show" style="width: 158px; height: 190px;" src="<%=basePath%>images/${pd.guide_thumbnail}">
                                </c:if>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td nowrap="nowrap"
						style="width: 80px; text-align: left; padding-top: 13px;"><B>指南内容</B></td>
					<td><textarea id="guide_content" name="guide_content"
							style="min-height: 450px; margin: 0 auto; width: 80%;float:left"
							title="指南内容">${pd.guide_content}</textarea></td>
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
		var ue = UE.getEditor("guide_content",{readonly:true});
		//ueditor有标签文本

		function getContent() {
			var arr = [];
			arr.push(UE.getEditor('guide_content').getContent());
			return arr.join("");
		}

		function clean() {
			ue.setContent("");
		}

		function setFocus() {
			UE.getEditor('guide_content').focus();
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
		});
	</script>
	<script type="text/javascript">
		//返回
	    function returnback(){
	    	window.location.href="<%=basePath%>guide/list.do";
		}
	</script>

</body>
</html>