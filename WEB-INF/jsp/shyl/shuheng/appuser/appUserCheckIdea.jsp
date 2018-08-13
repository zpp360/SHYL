<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<%@ include file="../../../system/admin/top.jsp"%>
		
<script type="text/javascript">
	top.hangge();
	//保存
	function save(){
		$("#form1").submit();
	}
	
	$(function(){
		var msg = $("#msg").val();
		if(msg=="success"){
			alert("退回成功");
			$("#zhongxin").hide();
			$("#zhongxin2").show();
			top.Dialog.close();
		}
	})
	
</script>
	</head>
<body>
		<form action="<%=basePath%>appuser/check_back.do" name="form1" id="form1"   method="post">
		<input name="msg" id="msg" value="${msg}" type="hidden">
		<input name="user_id" id="user_id" value="${pd.user_id}" type="hidden">
		<input name="check_type" id="check_type" value="${pd.check_type}" type="hidden">
			<div id="zhongxin">
			<table>
				<tr>
					<td><textarea type="text" name="check_idea" id="check_idea" placeholder="这里输入审核意见" maxlength="20" title="名称" style="margin: 0px 0px 10px; width: 376px; height: 126px;"></textarea></td>
				</tr>
				<tr>
					<td style="text-align: center;">
						<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
						<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
					</td>
				</tr>
			</table>
			</div>
		</form>
	
	<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
		<!-- 引入 -->
		<script src="static/1.9.1/jquery.min.js"></script>
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
</body>
</html>
