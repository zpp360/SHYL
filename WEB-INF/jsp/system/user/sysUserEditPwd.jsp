<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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

<script type="text/javascript">
	$(top.hangge());
	$(document).ready(function() {
		if ($("#user_id").val() != "") {
			$("#loginname").attr("readonly", "readonly");
			$("#loginname").css("color", "gray");
		}
	});

	//保存
	function save() {
		if ($("#PASSWORD").val() == "") {

			$("#PASSWORD").tips({
				side : 2,
				msg : '请输入密码',
				bg : '#FF5080',
				time : 2
			});

			$("#PASSWORD").focus();
			return false;
		}
		if ($("#chkpassword").val() == "") {

			$("#chkpassword").tips({
				side : 2,
				msg : '请输入密码',
				bg : '#FF5080',
				time : 2
			});

			$("#chkpassword").focus();
			return false;
		}
		if (!$("#PASSWORD").val().match(/^([a-zA-Z0-9! @ # $ % ?_]){6,100}$/)
				&& $("#PASSWORD").val() != "") {
			$("#PASSWORD").tips({
				side : 2,
				msg : "密码由6位以上字母、数字或符号组成",
				bg : '#FF5080',
				time : 2
			});
			$("#PASSWORD").focus();
			return false;
		}
		if ($("#PASSWORD").val() !== $("#chkpassword").val()) {
			$("#chkpassword").tips({
				side : 2,
				msg : "两次输入密码不一致",
				bg : '#FF5080',
				time : 2
			});
			$("#chkpassword").focus();
			return false;
		}
		$("#userForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
</script>
</head>
<body>
	<form action="sysUser/resetPass.do" name="userForm" id="userForm"
		method="post">
		<input type="hidden" name="USER_ID" id="user_id"
			value="${pd.USER_ID }" /> <input type="hidden" name="USERNAME"
			id="loginname" value="${pd.USERNAME}" />
		<div id="zhongxin">
			<table class="table">
				<tr>
					<td><label class="control-label"
						style="padding-top: 8px; width: 100px; float: right;"
						for="password">新密码：</label></td>
					<td><input type="password" name="PASSWORD" id="PASSWORD"
						maxlength="12" placeholder="新密码" title="新密码" /></td>
				</tr>
				<tr>
					<td><label class="control-label"
						style="padding-top: 8px; width: 100px; float: right;"
						for="chkpassword">确认密码：</label></td>
					<td><input type="password" name="chkpassword" id="chkpassword"
						maxlength="12" placeholder="确认密码" title="确认密码" /></td>
				</tr>
				<tr>
					<td style="text-align: center;" colspan="10"><a
						class="btn btn-mini btn-primary" onclick="save();">保存</a> <a
						class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
					</td>
				</tr>
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

</body>
</html>