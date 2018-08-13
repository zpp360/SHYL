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
<meta charset="UTF-8">
<title>管理系统</title>
<link rel="shortcut icon" href="favicon.ico"/>
<link rel="bookmark" href="favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="static/login/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="static/login/ajs/jquery.js"></script>
<script src="static/login/ajs/cloud.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$('.loginbox').css({
			'position' : 'absolute',
			'left' : ($(window).width() - 692) / 2
		});
		$(window).resize(function() {
			$('.loginbox').css({
				'position' : 'absolute',
				'left' : ($(window).width() - 692) / 2
			});
		})
	});
</script>
<style type="text/css">
.commitopacity {
	position: absolute;
	width: 100%;
	height: 100%;
	background: #7f7f7f;
	filter: alpha(opacity = 50);
	-moz-opacity: 0.8;
	-khtml-opacity: 0.5;
	opacity: 0.5;
	top: 0px;
	z-index: 99999;
}
.loginbox ul li {
    margin-bottom: 12px;
}
</style>
</head>
<body style="background-color:#1c77ac; background-image:url('<%=basePath%>static/login/images/addimages/light.png'); background-repeat:no-repeat; background-position:center top; overflow:hidden;">
<div id="mainBody">
		<div id="cloud1" class="cloud"></div>
		<div id="cloud2" class="cloud"></div>
	</div>
	<form action="" method="post" name="loginForm" id="loginForm">
		<div class="loginbody">

			<span class="systemlogo"></span>
			<div class="loginbox">

				<ul>
					<li><input type="text" name="loginname" id="loginname"
						value="" class="loginuser" placeholder="请输入用户名" style="color: #90a2bc;"/></li>
					<li><input type="password" name="password" id="password"
						class="loginpwd"  readonly onfocus="this.removeAttribute('readonly');" style="font-weight:bold" placeholder="请输入密码" value="" maxlength="20" onBlur="trim(this);"/></li>
					
					<!-- 去掉验证码  edit yanghaibo 2017-11-09 -->
					<!-- <li><input type="text" name="code" id="code"
						class="logincode"  style="font-weight:bold" placeholder="请输入验证码" value="" maxlength="20" onBlur="trim(this);"/>
						<i><img style="height: 37px;position: absolute;margin-top: 5px;margin-left: 20px;" id="codeImg" alt="点击更换" 
								title="点击更换" src="" /></i></li> -->
							
					<li><input name="" type="button" class="loginbtn" value="登录"
						onclick="severCheck();" id="to-recover"/>
						<label><input name="form-field-checkbox" id="saveid" type="checkbox"
							onclick="savePaw();" style="padding-top: 0px;" />记住密码 </label>
					</li>
				</ul>
			</div>
		</div>
	</form>
	<div class="loginbm">
		<div class="controls">
			<div class="main_input_box" style="text-align: center;">
				<font color="black"> <span id="nameerr"> 版权所有：©2017
						管理系统 </span>
				</font>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
		//服务器校验
		function severCheck(){
			if(check()){
				
				var loginname = $("#loginname").val();
				var password = $("#password").val();
				var code = "qq290490808fh"+loginname+",fh,"+password+"QQ751596222fh"+",fh,"+$("#code").val();
				$.ajax({
					type: "POST",
					url: 'login_login',
			    	data: {KEYDATA:code,tm:new Date().getTime()},
					dataType:'json',
					cache: false,
					success: function(data){
						if("success" == data.result){
							saveCookie();
							window.location.href="index";
						}else if("usererror" == data.result){
							$("#loginname").tips({
								side : 1,
								msg : "用户名或密码有误",
								bg : '#FF5080',
								time : 15
							});
							$("#loginname").focus();
						}else if("codeerror" == data.result){
							$("#code").tips({
								side : 1,
								msg : "验证码输入有误",
								bg : '#FF5080',
								time : 15
							});
							$("#code").focus();
						}else{
							$("#loginname").tips({
								side : 1,
								msg : "缺少参数",
								bg : '#FF5080',
								time : 15
							});
							$("#loginname").focus();
						}
					}
				});
			}
		}
	
		$(document).ready(function() {
			changeCode();
			$("#codeImg").bind("click", changeCode);
		});

		$(document).keyup(function(event) {
			if (event.keyCode == 13) {
				$("#to-recover").trigger("click");
			}
		});

		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		}

		function changeCode() {
			$("#codeImg").attr("src", "code.do?t=" + genTimestamp());
		}

		//客户端校验
		function check() {

			if ($("#loginname").val() == "") {

				$("#loginname").tips({
					side : 2,
					msg : '请输入用户名',
					bg : '#AE81FF',
					time : 3
				});

				$("#loginname").focus();
				return false;
			} else {
				$("#loginname").val(jQuery.trim($('#loginname').val()));
			}

			if ($("#password").val() == "") {

				$("#password").tips({
					side : 2,
					msg : '请输入密码',
					bg : '#AE81FF',
					time : 3
				});

				$("#password").focus();
				return false;
			}
			if ($("#code").val() == "") {

				$("#code").tips({
					side : 1,
					msg : '请输入验证码',
					bg : '#AE81FF',
					time : 3
				});

				$("#code").focus();
				return false;
			}

			$("#loginbox").tips({
				side : 1,
				msg : '正在登录 , 请稍后 ...',
				bg : '#68B500',
				time : 10
			});

			return true;
		}

		function savePaw() {
			if (!$("#saveid").attr("checked")) {
				$.cookie('loginname', '', {
					expires : -1
				});
				$.cookie('password', '', {
					expires : -1
				});
				$("#loginname").val('');
				$("#password").val('');
			}
		}

		function saveCookie() {
			if ($("#saveid").attr("checked")) {
				$.cookie('loginname', $("#loginname").val(), {
					expires : 7
				});
				$.cookie('password', $("#password").val(), {
					expires : 7
				});
			}
		}
		function quxiao() {
			$("#loginname").val('');
			$("#password").val('');
		}
		
		jQuery(function() {
			var loginname = $.cookie('loginname');
			var password = $.cookie('password');
			if (typeof(loginname) != "undefined"
					&& typeof(password) != "undefined") {
				$("#loginname").val(loginname);
				$("#password").val(password);
				$("#saveid").attr("checked", true);
				$("#code").focus();
			}
		});
	</script>
	<script>
		//TOCMAT重启之后 点击左侧列表跳转登录首页 
		if (window != top) {
			top.location.href = location.href;
		}
	</script>

	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/jquery-1.7.2.js"></script>
	<script src="static/login/js/jquery.easing.1.3.js"></script>
	<script src="static/login/js/jquery.mobile.customized.min.js"></script>
	<script src="static/login/js/camera.min.js"></script>
	<script src="static/login/js/templatemo_script.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
</body>

</html>