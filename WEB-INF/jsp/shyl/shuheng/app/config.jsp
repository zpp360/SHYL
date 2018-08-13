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
<%@ include file="../../../system/admin/top.jsp"%>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script type="text/javascript">
	$(top.hangge());

	//更新
	function update(){
		if($("#android_download_path").val()==""){
			
			$("#android_download_path").tips({
				side:3,
	            msg:'请输入安卓app下载地址',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#android_download_path").focus();
			return false;
		}
		
		if($("#ios_download_path").val()==""){
			
			$("#ios_download_path").tips({
				side:3,
	            msg:'请输入苹果app下载地址',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#ios_download_path").focus();
			return false;
		}
		
		$("#configForm").submit();

	}

</script>
</head>
<body>
	<form action="app/config_update.do" name="configForm" id="configForm"
		method="post">
		<div id="zhongxin">
			<table class="table ">
				<tr>
					<td><label class="control-label"
						style="padding-top: 8px; width: 100px; float: right;"
						for="loginname">安卓下载地址：</label></td>
					<td><input type="text" name="android_download_path" id="android_download_path"
						value="${pd.android_download_path}" maxlength="200" class="gbkOrAbc"
						placeholder="这里输入安卓下载地址" title="安卓下载地址" onblur="trim(this);"/></td>

					<td><label class="control-label"
						style="padding-top: 8px; width: 100px; float: right;" for="NUMBER">苹果下载地址：</label></td>
					<td><input type="text" name="ios_download_path" id="ios_download_path"
						value="${pd.ios_download_path }" maxlength="200" class="gbkOrAbc"
						placeholder="这里输入苹果下载地址" title="苹果下载地址" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td><label class="control-label"
						style="padding-top: 8px; width: 100px; float: right;"
						for="contact_us">联系我们：</label></td>
					<td colspan="3"><textarea id="contact_us" name="contact_us" maxlength="10000" 
							style="min-height: 200px; margin: 0 auto; width: 80%;float:left" 
							title="联系我们">${pd.contact_us }</textarea></td>
				</tr>
				<tr>
					<td><label class="control-label"
						style="padding-top: 8px; width: 100px; float: right;"
						for="function_desc">功能介绍：</label></td>
					<td colspan="3"><textarea id="function_desc" name="function_desc" maxlength="10000" 
							style="min-height: 200px; margin: 0 auto; width: 80%;float:left" 
							title="功能介绍">${pd.function_desc }</textarea></td>
				</tr>
				<tr>
					<td><label class="control-label"
						style="padding-top: 8px; width: 100px; float: right;"
						for="user_agreement">用户协议：</label></td>
					<td colspan="3"><textarea id="user_agreement" name="user_agreement" maxlength="10000" 
							style="min-height: 200px; margin: 0 auto; width: 80%;float:left" 
							title="功能介绍">${pd.user_agreement }</textarea></td>
				</tr>
				<tr>
					<td style="text-align: center;" colspan="10">
					<a class="btn btn-mini btn-primary" onclick="update();">更新</a> 
					</td>
				</tr>
			</table>
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
	<script type="text/javascript" src="plugins/ueditor/ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript" src="plugins/ueditor/ueditor.all.js"></script>
	<!-- 下拉框 -->

	<script type="text/javascript">
		var ue = UE.getEditor("contact_us");
		var ue = UE.getEditor("function_desc");
		var ue = UE.getEditor("user_agreement");
		//ueditor有标签文本
	
		function getContent() {
			var arr = [];
			arr.push(UE.getEditor('user_desc').getContent());
			return arr.join("");
		}
	
		function clean() {
			ue.setContent("");
		}
	
		function setFocus() {
			UE.getEditor('user_desc').focus();
		}
		$(function() {

			//单选框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			
			

		});
	</script>

</body>
</html>