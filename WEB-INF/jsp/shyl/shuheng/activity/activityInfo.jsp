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
<title>活动管理详情画面</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
	<link rel="stylesheet" type="text/css" href="shyl/css/uploadify.css">
<%@ include file="../../../system/admin/top.jsp"%>
<style type="text/css">
input[disabled] {
background: #ffffff;
}
</style>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script src="<%=basePath%>/shyl/js/layer/layer.js"></script>
<!-- 日期框 -->
</head>
<body>
<br>
	<form action="<%=basePath%>activity/${msg }.do" name="Form" id="Form"
		method="post">
		<div id="zhongxin">
		<input type="hidden" name="ACTIVITY_ID" id="ACTIVITY_ID" value="${pd.ACTIVITY_ID }"/>
			<table class="table ">
			
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>活动标题</B></td>
					<td><input type="text" name="TITLE" id="TITLE" maxlength="40"
						style="height: 20px; width: 300px;margin-top:2px" placeholder="请输入活动标题"
						title="活动标题" value="${pd.TITLE}" onblur="trim(this);" disabled="disabled" /></td>
				</tr>
				
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>开始时间</B></td>
					<td><input type="text" value="${pd.START_TIME}" name="START_TIME" id="START_TIME"  placeholder="开始时间"  title="开始时间" style=" width: 300px" disabled="disabled"/></td>
				</tr>
				
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>结束时间</B></td>
					<td><input name="END_TIME" id="END_TIME" value="${pd.END_TIME}" type="text"  placeholder="结束时间"  title="结束时间" style=" width: 300px" disabled="disabled"/></td>
				</tr>
				
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>负责人</B></td>
					<td><input type="text" name="PERSION_CHARGE" id="PERSION_CHARGE"
						maxlength="40" style="height: 20px; width: 300px;"
						placeholder="请输入负责人" title="负责人" value="${pd.PERSION_CHARGE}" onblur="trim(this);" disabled="disabled" /></td>
				</tr>
				
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>负责人电话</B></td>
					<td><input type="text" name="TEL_NUM" id="TEL_NUM"
						maxlength="40" style="height: 20px; width: 300px;"
						placeholder="负责人电话" title="负责人电话" value="${pd.TEL_NUM}" onblur="trim(this);" disabled="disabled" /></td>
				</tr>
				
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>场所</B></td>
					<td><input type="text" name="PLACE_NAME" id="PLACE_NAME"
						maxlength="40" style="height: 20px; width: 300px;"
						placeholder="场所" title="场所" value="${pd.PLACE_NAME}" onblur="trim(this);" disabled="disabled" /></td>

				</tr>
				
				<tr>
					<td nowrap="nowrap"
						style="width: 80px; text-align: left; padding-top: 13px;"><B>活动内容</B></td>
					<td><textarea id="SUMMARY" name="SUMMARY"
							style="min-height: 450px; margin: 0 auto; width: 80%; float: left;"
							title="活动内容" disabled="disabled">${pd.SUMMARY}</textarea></td>
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
			<a class="btn  btn-light" onclick="returnback()"><i class=" icon-circle-arrow-left"></i>返回</a>

			<!-- <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a> -->
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="<%=basePath%>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	<!-- 引入 -->
	<!-- 引入 -->
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<script src="shyl/js/jquery.uploadify.min.js" type="text/javascript"></script>
	<!-- 下拉框 -->
	<script type="text/javascript"
		src="static/js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->

	<!-- 日期框 -->
	<!-- 富文本编辑器start -->
	<!-- 配置文件 -->
	<script type="text/javascript" src="plugins/ueditor/ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript" src="plugins/ueditor/ueditor.all.js"></script>
	<!-- 实例化编辑器 -->
	<script type="text/javascript">
		var ue = UE.getEditor("SUMMARY",{readonly:true});
		//ueditor有标签文本

		function getContent() {
			var arr = [];
			arr.push(UE.getEditor('SUMMARY').getContent());
			return arr.join("");
		}

		function clean() {
			ue.setContent("");
		}

		function setFocus() {
			UE.getEditor('SUMMARY').focus();
		}
	</script>
	<!-- 富文本编辑器end -->
	
	<script type="text/javascript">
		$(top.hangge());
		$(function() {
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			//日期框
			$('.date-picker').datepicker();
			$('.date-picker1').datepicker({
				 language:  'zh-CN',
		            format: 'yyyy-mm',
		            weekStart: 1,
		            todayBtn:  'linked',
		            autoclose: 1,
		            todayHighlight: 1,
		            minViewMode: 'months', //这里就设置了默认视图为年视图
		            minView: 3, //设置最小视图为年视图
		            forceParse: 0
			});
		});
	</script>
	
	<script type="text/javascript">
		//返回
	    function returnback(){
	    	window.location.href="<%=basePath%>activity/list.do";
		}
	    function checkUrl(url,name){
			$.ajax({
				url: url,
				type: 'GET',
				complete: function(response) {
				   if(response.status == 200) {
					   return true;
				   } else {
					   layer.open({
						 	 title:'温馨提示' ,
					         type: 0,
					         shadeClose : true,
					         scrollbar : false,
					         area: ['100px'],
					         icon: 2,
							 skin: 'layui-layer-rim', 
							 content: '下载文件不存在'
					   	});
					   return false;
				   }
				  }
			});
		}
	</script>

</body>
</html>