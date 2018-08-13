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
<script src="static/js/bootbox.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(top.hangge());

</script>
</head>
<body>
	<form action="operateCompany/resetPwd.do" name="Form" id="Form" method="post">
		<input type="hidden" id="user_id" name="user_id" value="${pd.user_id }">
		<div id="zhongxin">
			<table style="margin-left:20px;margin-top:20px;">
			<tbody>
				<tr>
					<td><label class="lbl" for="point_name" style="margin-bottom:5px;">重置密码：</label></td>
					<td><input name="user_password" id="user_password" placeholder="请输入新密码"  title="重置密码" type="password" maxlength="20" onblur="trim(this);"></td>
				</tr>
				<tr style="height: 20px;"></tr>
				<tr>
					<td></td>
					<td class="center;">
						<a class="btn btn-mini btn-primary" onclick="save();" style="margin-left:45px;">保存</a> 
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
	//保存
	function localcheck(){
		if ($("#user_password").val() == "") {
			$("#user_password").tips({
				side : 3,
				msg : '请选择图片类型',
				bg : '#FF5080',
				time : 2
			});
			$("#user_password").focus();
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