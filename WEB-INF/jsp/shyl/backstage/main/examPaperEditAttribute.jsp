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

	//保存
	function save() {
		if ($("#paperNm").val() == "") {
			$("#paperNm").tips({
				side : 2,
				msg : '请输入试卷名称',
				bg : '#FF5080',
				time : 2
			});

			$("#paperNm").focus();
			return false;
		}
		var duration = $("#durations").val();
		if (duration == "") {
			$("#durations").tips({
				side : 2,
				msg : '请输入时长',
				bg : '#FF5080',
				time : 2
			});

			$("#durations").focus();
			return false;
		} else if (!(parseInt(duration) > 30 && parseInt(duration) < 241)) {
			$("#durations").tips({
				side : 2,
				msg : '数字范围无效，考试的时长必须设置在30到240的范围内',
				bg : '#FF5080',
				time : 2
			});
			$("#durations").focus();
			return false;
		}
		$("#form1").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
</script>
</head>
<body>
	<form action="<%=basePath%>examPaper/resetAttribute.do" name="form1" id="form1" method="post">
		<input type="hidden" name="paperId" id="paperId" value="${pd.id}" />
		<div id="zhongxin">
			<table class="table">
				<tr>
					<td><label class="control-label"
						style="padding-top: 8px; width: 100px; float: right;"
						for="paperNm">试卷名称：</label></td>
					<td><input type="text" name="paperNm" id="paperNm"
						maxlength="40" placeholder="输入试卷名称" title="试卷名称" onblur="trim(this);" value="${pd.name}"/></td>
				</tr>
				<tr>
					<td><label class="control-label"
						style="padding-top: 8px; width: 100px; float: right;"
						for="durations">时长（分钟）：</label></td>
					<td><input type="text" name="durations" id="durations"
						maxlength="12" placeholder="输入时长" title="时长" onblur="delZero(this);" 
						onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" value="${pd.duration}" /></td>
				</tr>
				<tr>
					<td><label class="control-label"
						style="padding-top: 8px; width: 100px; float: right;">题库类别：</label></td>
					<td>
						<select name="fieldId" id="fieldId" data-placeholder="请选择题库类别" style="width: 220px; margin-top: 7px;">
							<c:forEach items="${fieldList}" var="ind">
								<option value="${ind.fieldId }"
									<c:if test="${ind.fieldId == pd.field_id}">selected</c:if>>${ind.fieldName }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td style="text-align: center;" colspan="10"><a
						class="btn btn-mini btn-primary" onclick="save();">保存</a> <a
						class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
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