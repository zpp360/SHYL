<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
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
<script src="static/js/bootbox.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(top.hangge());

</script>
</head>
<body>
	<form action="courseSale/excel.do" name="Form" id="Form" method="post">
		<input type="hidden" id="user_id" name="user_id" value="${pd.user_id }">
		<input type="hidden" id="type" name="type" value="">
		<div id="zhongxin">
			<table style="margin-left: 20px; margin-top: 20px;">
				<tbody>
					<tr>
						<td><label class="lbl" style="margin-left:20px;">开始日期：</label></td>
						<td><input class="date-picker" name="start_timestamp" id="start_timestamp" 
							    value="${pd.start_timestamp}" type="text" data-date-format="yyyy-mm-dd" 
							    readonly="readonly" style="width:206px;" placeholder="开始日期" /></td>
					</tr>
					<tr>
						<td><label class="lbl" style="margin-left:20px;">结束日期：</label></td>
						<td><input class="date-picker" name="end_timestamp" id="end_timestamp" 
							    value="${pd.end_timestamp}" type="text" data-date-format="yyyy-mm-dd" 
							    readonly="readonly" style="width:206px;" placeholder="结束日期" /></td>
					</tr>
					<tr style="height: 20px;"></tr>
					<tr>
						<td></td>
						<td class="center;"><a class="btn btn-mini btn-primary"
							onclick="save();" style="margin-left: 45px;">确认</a> <a
							class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
	<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>

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
	<!-- 日期框 -->
	<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript">
	$(function() {
		//日期框
		$('.date-picker').datepicker();
		//下拉框
		$(".status-select").chosen();
	});
	//保存
	function localcheck(){
		var start_time=$("#start_timestamp").val();
		var end_time=$("#end_timestamp").val();
		if(start_time.length>0&&end_time.length>0){
			if(start_time>end_time)
			{
			$("#start_timestamp").tips({
				side : 3,
				msg : '开始时间不能大于结束时间！',
				bg : '#FF5080',
				time : 2
			});
			$("#start_timestamp").focus();
			return false;		
			}
		}
		return true;
			
	}
	
	function browerCheck(){
		var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
		var isFF = userAgent.indexOf("Firefox") > -1; //判断是否Firefox浏览器
		if(isFF){
			$("#type").val("isFF");
		}else{
			$("#type").val("isIE");
		}
	}
	
	
	function save(){
		if(localcheck()){
			browerCheck();
			$("#Form").submit();
// 			$("#zhongxin").hide();
// 			$("#zhongxin2").show();
		}
	}
	
	
	</script>
</body>
</html>