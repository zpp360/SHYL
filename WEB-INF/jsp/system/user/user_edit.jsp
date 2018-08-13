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
		<title>个人资料修改页面</title>
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
		<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
	</head>
<body>
	<form action="user/${msg }.do" name="userForm" id="userForm" method="post">
		<input type="hidden" name="USER_ID" id="user_id" value="${pd.USER_ID }"/>
		<div id="zhongxin">
		<table class="table ">
			<tr>
				<td>
					<label class="control-label" style="padding-top: 8px; width: 100px; float: right;" for="role_id"> 用户名：</label>
				</td>
				<td>
					<input type="text" name="USERNAME" id="loginname" value="${pd.USERNAME }" maxlength="32" placeholder="这里输入用户名" title="用户名" onblur="trim(this);"/>
				</td>
			</tr>
			<tr>
				<td>
					<label class="control-label" style="padding-top: 8px; width: 100px; float: right;" for="role_id"> 新密码：</label>
				</td>
				<td>
					<input type="password" name="PASSWORD" id="password"  maxlength="20" placeholder="这里输入新密码" title="新密码"/>
				</td>
			</tr>
			<tr>
				<td>
					<label class="control-label" style="padding-top: 8px; width: 100px; float: right;" for="role_id"> 确认密码：</label>
				</td>
				<td>
					<input type="password" name="chkpwd" id="chkpwd"  maxlength="20" placeholder="这里输入确认密码" title="确认密码" />
				</td>
			</tr>
			<tr>
				<td>
					<label class="control-label" style="padding-top: 8px; width: 100px; float: right;" for="role_id"> 联系人：</label>
				</td>
				<td>
					<input type="text" name="NAME" id="name"  value="${pd.NAME }"  maxlength="32" placeholder="这里输入联系人" title="联系人" onblur="trim(this);"/>
				</td>
			</tr>
			<tr>
				<td>
					<label class="control-label" style="padding-top: 8px; width: 100px; float: right;" for="role_id"> 手机号：</label>
				</td>
				<td>
					<input type="text" name="PHONE" id="PHONE"  value="${pd.PHONE }"  maxlength="20" placeholder="这里输入手机号" title="手机号" onkeyup="value=value.replace(/[^0-9]/g,'')" onblur="delZero(this);" style="ime-mode:disabled"/>
				</td>
			</tr>
<!-- 			<tr> -->
<!-- 				<td> -->
<%-- 					<input type="email" name="EMAIL" id="EMAIL"  value="${pd.EMAIL }" maxlength="32" placeholder="这里输入邮箱" title="邮箱" onblur="trim(this);hasE('${pd.USERNAME }')"/> --%>
<!-- 				</td> -->
<!-- 			</tr> -->
			<tr>
				<td style="text-align: center;" colspan="10">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
		
	</form>
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		
<script type="text/javascript">
		
	$(function() {
		$(top.hangge());
	});
	
	//判断用户名是否存在
	function hasU(){
		var USERNAME = $.trim($("#loginname").val());
		var userId = $("#user_id").val();
		$.ajax({
			type: "POST",
			url: '<%=basePath%>sysUser/hasU.do',
	    	data: 
	    		{
	    			USERNAME:USERNAME,
	    			userId:userId,
	    			tm:new Date().getTime()
	    		},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" == data.result){
					$("#userForm").submit();
					$("#zhongxin").hide();
					$("#zhongxin2").show();
				 }else{
					$("#loginname").tips({
						side:3,
			            msg:'此用户已存在！',
			            bg:'#AE81FF',
			            time:2
			        });
					$("#loginname").focus();
				 }
			}
		});
	}
	
	//保存
	function save(){
		if($("#loginname").val()==""){
			$("#loginname").tips({
				side:3,
	            msg:'请输入用户名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#loginname").focus();
			return false;
		}
		if($("#password").val()==""){
			$("#password").tips({
				side:3,
	            msg:'请输入密码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#password").focus();
			return false;
		}
		if($("#chkpwd").val()==""){
			$("#chkpwd").tips({
				side:3,
	            msg:'请输入确认密码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#chkpwd").focus();
			return false;
		}
		if($("#password").val()!=$("#chkpwd").val()){
			$("#chkpwd").tips({
				side:3,
	            msg:'两次密码不相同',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#chkpwd").focus();
			return false;
		}
		if($("#name").val()==""){
			$("#name").tips({
				side:3,
	            msg:'请输入姓名',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#name").focus();
			return false;
		}
		
		var myreg = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9]|17[0|1|2|3|5|6|7|8|9])\d{8}$/;
		if($("#PHONE").val()==""){
			$("#PHONE").tips({
				side:3,
	            msg:'请输入手机号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#PHONE").focus();
			return false;
		}else if($("#PHONE").val().length != 11 || !myreg.test($("#PHONE").val())){
			$("#PHONE").tips({
				side:3,
	            msg:'请输入正确的手机号格式',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#PHONE").focus();
			return false;
		}
		
		hasU()
		
		
	}
	
</script>
	
</body>
</html>