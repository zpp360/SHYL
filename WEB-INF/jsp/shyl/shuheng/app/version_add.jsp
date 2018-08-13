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
		<title>菜单</title>
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

	//保存
	function save(){
		if($("#version_type").val()==""){
			
			$("#version_type").tips({
				side:3,
	            msg:'请选择版本类型',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#version_type").focus();
			return false;
		}
		
		if($("#version_text").val()==""){
			
			$("#version_text").tips({
				side:3,
	            msg:'请输入版本号',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#version_text").focus();
			return false;
		}
		
		var reg = /^\d+(\.\d+){0,2}$/;
		if(!reg.test($("#version_text").val())){
			$("#version_text").tips({
				side:3,
	            msg:'请输入正确格式的版本号',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#version_text").focus();
			return false;
		}
		
		$("#versionForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
	
</script>


<body>
	<form  action="<%=basePath%>app/version_add.do" name="versionForm" id="versionForm" method="post" >
		<div id="zhongxin">
		<table>
			<tr>
				<td>
					<select name="version_type" id="version_type" class="input_txt"   title="版本类型" placeholder="请选择版本类型">
						<option value="0">Android</option>
						<option value="1">IOS</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><input type="version_text" name="version_text" id="version_text" placeholder="这里输入版本号" value="" title="版本号" maxlength="32" onblur="trim(this);"/></td>
			</tr>
			<tr>
				<td style="text-align: center; padding-top: 10px;">
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