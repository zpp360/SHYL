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
		<title></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<link rel="stylesheet" href="static/assets/css/font-awesome.css" />
		<!-- ace styles -->
		<link rel="stylesheet" href="static/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
		<script type="text/javascript">
			
			//保存
			function save(){
		
				$("#Form").submit();
				$("#zhongxin").hide();
				$("#zhongxin2").show();
			}
			
			
		</script>
	</head>
<body>
	<form action="<%=basePath%>cardApply/add.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
		<div id="zhongxin">
		<table style="width:95%;" >
			<tr>
				<td style="width: 100px; text-align: left; padding-top: 13px;"><B>申请类型：</B></td>
				<td style="padding-top: 20px;"><input type="text" id="apply_card_type" name="apply_card_type" style="width:250px;" /></td>
			</tr>
			<tr>
				<td style="width: 100px; text-align: left; padding-top: 13px;"><B>用户id：</B></td>
				<td style="padding-top: 20px;"><input type="text" id="apply_user_id" name="apply_user_id" style="width:250px;" /></td>
			</tr>
			<tr>
				<td style="width: 100px; text-align: left; padding-top: 13px;"><B>备注：</B></td>
				<td style="padding-top: 20px;"><input type="text" id="apply_remark" name="apply_remark" style="width:250px;" /></td>
			</tr>
			<tr>
				<td style="width: 100px; text-align: left; padding-top: 13px;"><B>头像：</B></td>
				<td style="padding-top: 20px;"><input type="file" id="apply_user_img" name="apply_user_img" style="width:250px;" /></td>
			</tr>
			<tr>
				<td style="width: 100px; text-align: left; padding-top: 13px;"><B>退休证：</B></td>
				<td style="padding-top: 20px;"><input type="file" id="apply_retire_img" name="apply_retire_img" style="width:250px;" /></td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="2">
					<a class="btn btn-mini btn-primary" onclick="save();">导入</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><img src="static/images/jzx.gif" /><br/><h4 class="lighter block green"></h4></div>
		
	</form>
	
	
		<!-- 引入 -->
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='static/assets/js/jquery.js'>"+"<"+"/script>");
		</script>
		<!-- <![endif]-->
		<!--[if IE]>
		<script type="text/javascript">
		 	window.jQuery || document.write("<script src='static/assets/js/jquery1x.js'>"+"<"+"/script>");
		</script>
		<![endif]-->
		<script src="static/js/bootstrap.min.js"></script>
		<!-- ace scripts -->
		<script src="static/assets/js/ace/elements.fileinput.js"></script>
		<script src="static/assets/js/ace/ace.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			//上传
			$('#apply_user_img').ace_file_input({
				no_file:'请选择照片 ...',
				btn_choose:'选择',
				btn_change:'更改',
				droppable:false,
				onchange:null,
				thumbnail:false, //| true | large
				whitelist:'gif|png|jpg|jpeg',
				blacklist:'zip|rar'
				//onchange:''
				//
			});
			
			$('#apply_retire_img').ace_file_input({
				no_file:'请选择照片 ...',
				btn_choose:'选择',
				btn_change:'更改',
				droppable:false,
				onchange:null,
				thumbnail:false, //| true | large
				whitelist:'gif|png|jpg|jpeg',
				blacklist:'zip|rar'
				//onchange:''
				//
			});
			
			
		});
		
		</script>
	
</body>
</html>