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
<meta name="description" content="overview & stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@ include file="../../../system/admin/top.jsp"%>
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<!-- 日期框 -->
<script type="text/javascript">
	//保存
	function save() {
		if ($("#user_relation").val() == "") {
			$("#user_relation").tips({
				side : 3,
				msg : '请输入用户名',
				bg : '#FF5080',
				time : 2
			});
			$("#user_relation").focus();
			return false;
		}
		if ($("#link_name").val() == "") {
			$("#link_name").tips({
				side : 3,
				msg : '请输入用户名',
				bg : '#FF5080',
				time : 2
			});
			$("#link_name").focus();
			return false;
		}
		var myreg = /^(((13[0-9]{1})|159)+\d{8})$/;
		if($("#link_phone").val()==""){
			
			$("#link_phone").tips({
				side:3,
	            msg:'请输入手机号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#link_phone").focus();
			return false;
		}else if($("#link_phone").val().length != 11 && !myreg.test($("#link_phone").val())){
			$("#link_phone").tips({
				side:3,
	            msg:'请输入正确的手机号格式',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#link_phone").focus();
			return false;
		}
		var tel = $("#link_tel").val();
		if(tel!=null&&tel!=""){
			var reg = /^((\d{3,4}-)|\d{3.4}-)?\d{7,8}$/;
			if(!reg.test(tel)){
				console.log("座机号不匹配")
				$("#link_tel").tips({
					side:3,
		            msg:'请输入正确的座机电话格式',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#link_tel").focus();
				return false;
			}
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
<style type="text/css">
.upload_img {
	float: left;
	width: 60%;
	position: relative;
}

.upload_img img {
	float: left;
}

.upload_img a {
	position: absolute;
	left: 210px;
	top: 0;
	font-size: 0.85em;
	border: 0;
	background-color: #3961c2;
	color: #fff;
	padding: 0;
	width: 160px;
	text-align: center;
	height: 50px;
	line-height: 50px;
	display: inline-block;
	border-radius: 4px;
	float: left;
	margin-top: 20px;
}

.upload_img p {
	position: absolute;
	bottom: 50px;
	left: 210px;
	color: #737373;
	line-height: 30px;
	width: 60%;
	font-size: 1.1em;
	float: left;
}

.upload_img p i {
	color: #1c1c1c;
	font-weight: bold;
	font-size: 1.1em;
}

select, input[type="file"] {
	height: 45px;
	line-height: 30px;
}

.uploadbtn {
	position: absolute;
	top: 0;
	margin: 0;
	opacity: 0;
	-ms-filter: 'alpha(opacity=0)';
	font-size: 8px !important;
	direction: ltr;
	height: 100px;
	width: 300px;
	cursor: pointer;
}

.a-upload {
	padding: 4px 10px;
	height: 20px;
	line-height: 20px;
	position: relative;
	cursor: pointer;
	color: #888;
	background: #fafafa;
	border: 1px solid #ddd;
	border-radius: 4px;
	overflow: hidden;
	display: inline-block;
	*display: inline;
	*zoom: 1
}

.a-upload input {
	position: absolute;
	font-size: 100px;
	right: 0;
	top: 0;
	opacity: 0;
	filter: alpha(opacity = 0);
	cursor: pointer
}

.upload a {
	position: absolute;
	left: 330px;
	font-size: 0.85em;
	border: 0;
	background-color: #3961c2;
	color: #fff;
	padding: 0;
	width: 100px;
	text-align: center;
	height: 30px;
	line-height: 30px;
	display: inline-block;
	border-radius: 4px;
	float: left;
	margin-left: 100px;
}

.upload p {
	bottom: 50px;
	left: 100px;
	color: #737373;
	line-height: 30px;
	width: 60%;
	font-size: 1.1em;
}
</style>

</head>
<body>
<br>
	<form action="<%=basePath%>appuser/${msg}.do" name="Form" id="Form" method="post">
		<input type="hidden" name="user_id" value="${pd.user_id}"/>
		<input type="hidden" name="link_id" value="${pd.link_id}"/>
		<div id="zhongxin">
			<table class="table ">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color:#C00;padding-right: 4px;">*</span><B>联系人关系</B>
					</td>
					<td>
						<select class="chzn-select" name="user_relation" id="user_relation" data-placeholder="请选择联系人关系" style="height: 20px; width: 315px;">
							<option value="">---请选择联系人关系---</option>
							<c:forEach items="${linkmanType}" var="list">
								<option value="${list.distinguish_id }" <c:if test="${list.distinguish_id == pd.user_relation}">selected</c:if> >${list.value}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>联系人姓名</B></td>
					<td><input type="text" name="link_name" id="link_name" maxlength="40"  value="${pd.link_name}"
						 style="height: 20px; width: 300px;" placeholder="请输入联系人姓名"
						title="联系人姓名" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>手机号</B></td>
					<td><input type="text" name="link_phone" id="link_phone" maxlength="11" onkeyup="value=value.replace(/[^0-9]/g,'')"  
						 style="height: 20px; width: 300px;" placeholder="请输入手机号" value="${pd.link_phone}"
						title="手机号" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>座机号码</B></td>
					<td><input type="text" name="link_tel" id="link_tel" maxlength="18" value="${pd.link_tel}"
						 style="height: 20px; width: 300px;" placeholder="请输入座机号码" 
						title="座机号码" onblur="trim(this);" /></td>
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

			<a class="btn  btn-success" onclick="save();"><i class="icon-save"></i>提交</a> 
			<a class="btn  btn-light" onclick="returnback()"><i class=" icon-circle-arrow-left"></i>返回</a>

			<!-- <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a> -->
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


	<script type="text/javascript">
		$(top.hangge());
		//返回
	    function returnback(){
			history.back();
		}
		
		$(function() {
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			
		});
		
	</script>
</body>
</html>