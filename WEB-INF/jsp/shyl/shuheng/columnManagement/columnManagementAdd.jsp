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
		<title>添加栏目</title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	</head>

<script type="text/javascript">
	$(top.hangge());
	$(document).ready(function(){		
	}); 


	//保存
	function save(){
		if($("#column_name").val()==""){
			
			$("#column_name").tips({
				side:3,
	            msg:'请输入栏目名称',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#column_name").focus();
			return false;
		}
		if($("#column_width").val()==""){
			
			$("#column_width").tips({
				side:3,
	            msg:'请输入裁切宽度',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#column_width").focus();
			return false;
		}
		if($("#column_height").val()==""){
			
			$("#column_height").tips({
				side:3,
		        msg:'请输入裁切高度',
		        bg:'#AE81FF',
		        time:2
		    });
			
			$("#column_height").focus();
			return false;
		}
		$("#menuForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>


<body>
	<form  action="columnManagement/saveColumnManagement.do" name="menuForm" id="menuForm" method="post" >
		<input type="hidden" id="parent_id" name="parent_id" value="${pd.column_id}"/>
		<input type="hidden" id="level" name="level" value="${pd.level}"/>
		<div id="zhongxin">
		<table>
			<tr>
				<td>
					栏目名称：<input type="text" name="column_name" id="column_name" placeholder="这里输入栏目名称" title="名称" maxlength="50" onblur="trim(this);"/>
					<span style="color: #C00; padding-right: 4px;">*</span>
				</td>
			</tr>
			<tr>
				<td>
					裁切宽度：<input type="text" id="column_width" name="column_width" placeholder="这里输入裁切宽度" title="宽度" maxlength="5"/>
					<span style="color: #C00; padding-right: 4px;">*</span>
				</td>
			</tr>
			<tr>
				<td>
					裁切高度：<input type="text" id="column_height" name="column_height" placeholder="这里输入裁切高度" title="高度" maxlength="5"/>
					<span style="color: #C00; padding-right: 4px;">*</span>
				</td>
			</tr>
			</br>
			<tr>
				<td style="text-align: center; padding-top: 30px;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
</body>
</html>