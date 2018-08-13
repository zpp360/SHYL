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
<title></title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link href="static/css/bootstrap.min.css" rel="stylesheet" />
<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link rel="stylesheet" href="static/css/font-awesome.min.css" />
<!-- 下拉框 -->
<link rel="stylesheet" href="static/css/chosen.css" />
<link rel="stylesheet" href="static/css/ace.min.css" />
<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
<link rel="stylesheet" href="static/css/ace-skins.min.css" />
<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script type="text/javascript">
	$(top.hangge());

</script>
</head>
<body>
	<form action="knowledge/updatePoint.do" name="Form" id="Form" method="post">
		<input type="hidden" id="point_id" name="point_id" value="${pd.point_id}">
		<div id="zhongxin">
			<table style="margin-left:7px;margin-top:10px;">
			<tbody>
				<tr>
					<td> <label class="lbl" for="field_id"> 题库类型：</label> </td>
					<td><select class="chzn-select" name="field_id" id="field_id"
						data-placeholder="请选择题库类型" style="vertical-align: top;">
							<option value=""></option>
							<c:forEach items="${fieldList}" var="field">
								<option value="${field.field_id }"
									<c:if test="${field.field_id == pd.field_id }">selected</c:if>>${field.field_name }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr style="height: 3px;"></tr>
				<tr>
					<td><label class="lbl" for="point_name">知识点名：</label></td>
					<td><input name="point_name" id="point_name" value="${pd.point_name}" title="知识点名" type="text" maxlength="20" onblur="trim(this);"></td>
				</tr>
				<tr>
					<td><label class="lbl" for="name">&#12288;&#12288;描述：</label></td>
					<td><textarea rows="5" cols="" style="resize:none" maxlength="100" name="memo" id="memo" placeholder="请输入知识点描述">${pd.memo}</textarea></td>
				</tr>
				<tr style="height: 20px;"></tr>
				<tr>
					<td></td>
					<td class="center;">
						<a class="btn btn-mini btn-primary" onclick="save();" style="margin-left: 40px;">保存</a> 
						<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
					</td>
				</tr>
				</tbody>
			</table>
		</div>

		<div id="zhongxin2" class="center" style="display: none">
			<br /> <br /> <br /> <br /> <img src="static/images/jiazai.gif" /><br />
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
	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->

	<script type="text/javascript">
		$(function() {
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});

		});
	</script>
	<script type="text/javascript">
	//保存
	function localcheck(){
		if ($("#field_id").val() == "") {
			$("#field_id").tips({
				side : 3,
				msg : '请选择题库类型',
				bg : '#FF5080',
				time : 2
			});
			$("#field_id").focus();
			return false;
		}
		if ($("#point_name").val() == "") {
			$("#point_name").tips({
				side : 3,
				msg : '请输入知识点名',
				bg : '#FF5080',
				time : 2
			});
			$("#point_name").focus();
			return false;
		}
		if ($("#memo").val() == "") {
			$("#memo").tips({
				side : 3,
				msg : '请输入知识点描述',
				bg : '#FF5080',
				time : 2
			});
			$("#memo").focus();
			return false;
		}
		return true;
			
	}
	
	function save(){
		if(localcheck()){
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
	}
	
	
	</script>
</body>
</html>