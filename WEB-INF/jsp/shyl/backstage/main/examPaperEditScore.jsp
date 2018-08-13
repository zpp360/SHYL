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
<script type="text/javascript" src="<%=basePath%>static/js/jquery.tips.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>

<script type="text/javascript">
	$(top.hangge());
	
	$(function() {
		var indexno = $("#indexno").val();
		$("#qt-point-target-index").text(parseInt(indexno) + 1);
	});

	//仅修改第**题
	function pointu() {
		var generatedId = $("#generatedId").val();
		var targetno = parseInt($("#qt-point-target-index").text());
		var newPoint = parseFloat($("#score").val());
		if(targetno<=0 || isNaN(targetno)||newPoint<=0||isNaN(newPoint)){
			return false;
		}else{
			$("#flag").val("1");
			window.parent.Dialog.close();
		}
	}
	// 批量更新该题型
	function pointType() {
		var generatedId = $("#generatedId").val();
		var targetno = parseInt($("#qt-point-target-index").text());
		var newPoint = parseFloat($("#score").val());
		if(targetno<=0 || isNaN(targetno)||newPoint<=0||isNaN(newPoint)){
			return false;
		}else{
			$("#flag").val("2");
			window.parent.Dialog.close();
		}
	}
</script>
</head>
<body>
	<form action="" name="form1" id="form1" method="post">
	    <input type="hidden" id="indexno" value="${pd.indexno}" />
	    <input type="hidden" id="flag" value="" />
		<div id="zhongxin">
			<table class="table">
				<tr>
					<td><label class="control-label"
						style="padding-top: 8px; width: 100px; float: right;"
						for="score">分数：</label></td>
					<td><input type="text" name="score" id="score"
						maxlength="4" placeholder="输入分数" title="分数" onblur="delZero(this);"
						onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" value="${pd.score}" /></td>
				</tr>
				<tr>
					<td style="text-align: center;" colspan="10">
						<a class="btn btn-mini btn-primary" id="update-point-btn" onclick="pointu();">仅修改第<span id="qt-point-target-index"></span>题</a>
						<a class="btn btn-mini btn-danger" id="update-point-type-btn" onclick="pointType();">批量更新该题型</a>
					</td>
				</tr>
			</table>
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
	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->

</body>
</html>