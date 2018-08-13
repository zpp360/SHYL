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
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
<script type="text/javascript">
	top.hangge();
	//保存
	function save(){
		if($("#group_name").val()==""){
			$("#group_name").tips({
				side:1,
	            msg:'请输入分组名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#group_name").focus();
			return false;
		}
		if($("#order_number").val()==""){
			$("#order_number").tips({
				side:1,
	            msg:'请输入序号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#order_number").focus();
			return false;
		}
		$("#form1").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
	
</script>
	</head>
<body>
		<form action="<%=basePath%>group/add.do" name="form1" id="form1"  method="post">
		<input name="group_pid" id="group_pid" value="${pd.group_pid }" type="hidden">
			<div id="zhongxin">
			<table>
				<tr>
					<td><input type="text" name="group_name" id="group_name" placeholder="请输入分组名称" title="分组名称"/></td>
				</tr>
				<tr>
					<td><input type="number" name="order_number" id="order_number" value="1" min="1" onkeyup="value=value.replace(/[^0-9]/g,'')" placeholder="请输入排序数字" title="排序数字"/></td>
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
</body>
</html>
