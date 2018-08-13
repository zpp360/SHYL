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
<title>志愿者详情</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../../system/admin/top.jsp"%>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<!-- 日期框 -->
</head>
<body>
<br>
	<form action="" name="Form" id="Form" method="post">
		<div id="zhongxin">
			<table class="table ">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>用户名</B></td>
					<td><input type="text" name="user_name" id="user_name" disabled="disabled" value="${pd.user_name}"
						 style="height: 20px; width: 300px;"
						onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>单位</B>
					</td>
					<td><input name="unit_name" id="unit_name" disabled="disabled" value="${pd.unit_name}" type="text" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>爱心时长</B></td>
					<td><input type="text" name="volunteer_love_hour" id="volunteer_love_hour" disabled="disabled" value="${pd.volunteer_love_hour}" 
						 style="height: 20px; width: 300px;"
						 onblur="trim(this);" /></td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>加入时间</B></td>
					<td><input type="text" name="create_time" id="create_time" disabled="disabled" value="${pd.create_time}"
						 style="height: 20px; width: 300px;" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>志愿者宣言</B></td>
					<td>
						<textarea rows="10" style="width: 300px;" disabled="disabled">${pd.volunteer_text}</textarea>
<!-- 					<input type="text" name="volunteer_text" id="volunteer_text" disabled="disabled" value=""  -->
<!-- 						 style="height: 20px; width: 300px;" onblur="trim(this);" /> -->
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
<!-- 			<a class="btn  btn-danger" onclick="top.Dialog.close();">取消</a> -->
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
	<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
	<!-- 实例化编辑器 -->
	<script type="text/javascript">
	$(top.hangge());
		//关联下拉菜单
		$(function(){
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
		
			var tips=function(id,msg){
				$("#"+id).tips({
					side : 2,
					msg : msg,
					bg : '#FF5080',
					time : 2
				});
			}
			
		});
		
	</script>
</body>
</html>