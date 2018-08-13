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
<title>问题反馈详情_济南市服务外包公共服务平台</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="shyl/css/uploadify.css">
<%@ include file="../../../system/admin/top.jsp"%>
<link rel="stylesheet" href="static/css/thing.css" />
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<style type="text/css">
input[disabled] {
background: #ffffff;
}
</style>
</head>
<body>
<br>
	<form action="" name="Form" id="Form"
		method="post">
		<div id="zhongxin">
		<input type="hidden" name="id" id="id" value="${pd.id }"/>
			<table class="table ">				
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>意见标题</B></td>
					<td><input type="text" name="title" id="title" value="${pd.title}" maxlength="40" disabled="disabled"
						style="height: 30px; width: 300px" placeholder="" title="" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>反馈者</B></td>
					<td><input type="text" name="title" id="title" value="${pd.insert_user}" maxlength="40" disabled="disabled"
						style="height: 30px; width: 300px" placeholder="" title="" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>反馈时间</B></td>
					<td><input type="text" name="title" id="title" value="${pd.insert_date}" maxlength="40" disabled="disabled"
						style="height: 30px; width: 300px" placeholder="" title="" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>Email</B></td>
					<td><input type="text" name="title" id="title" value="${pd.email}" maxlength="40" disabled="disabled"
						style="height: 30px; width: 300px" placeholder="" title="" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap"
						style="width: 80px; text-align: left; padding-top: 13px;"><B>意见描述</B></td>
					<td>
					<div id="content" style="min-height: 450px; margin: 0 auto;width:80%;float:left;margin-top:5px;" title="事件内容">${pd.description}</div>
					</td>
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
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="<%=basePath%>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>

	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
			
	<script type="text/javascript">
		//返回
	    function returnback(){
	    	window.location.href="<%=basePath%>feedback/questionFeedbacklist.do";
		}
	</script>

</body>
</html>