<%@page import="org.apache.ibatis.annotations.Case"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<%@ include file="../../../system/admin/top.jsp"%>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
</head>
<body>
<br/><br/>
	<form action="<%=basePath%>question/saveField.do" name="Form" id="Form" method="post">
		<div id="zhongxin">
		<table style="margin-left:5px;">
			<tbody>
			<tr>
			    <td><label class="lbl" for="field_name">题库类型：</label></td>
				<td><input name="field_name" id="field_name" placeholder="请输入题库类型"  title="题库类型" type="text" maxlength="20" onblur="trim(this);"></td>
			</tr>
			<tr>
			    <td><label class="lbl" for="memo" >题库描述：</label></td>
				<td><textarea rows="5" cols="" name="memo" id="memo" placeholder="请输入题库描述"></textarea></td>
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
	</form>
	

	<div id="zhongxin2" class="center" style="display: none;">
		<img src="<%=basePath%>static/images/jzx.gif" style="width: 50px;" /><br />
		<h4 class="lighter block green"></h4>
	</div>
	
	<!-- 引入 -->
	<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<!-- 显示文本框里的提示信息 -->
	<script type="text/javascript" src="static/js/myjs/head.js"></script>
	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script>
	<!-- 日期框 -->
	<script type="text/javascript" src="static/js/bootbox.min.js"></script>
	<!-- 确认窗口 -->
	<!-- 引入 -->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());
	</script>
	<script type="text/javascript">
	//保存
	function localcheck(){
		if ($("#field_name").val() == "") {
			$("#field_name").tips({
				side : 3,
				msg : '请输入题库类型',
				bg : '#FF5080',
				time : 2
			});
			$("#field_name").focus();
			return false;
		}
		if ($("#memo").val() == "") {
			$("#memo").tips({
				side : 3,
				msg : '请输入题库描述',
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
