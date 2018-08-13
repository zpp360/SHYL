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
<script type="text/javascript" src="static/js/bootbox.min.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>

<script type="text/javascript">
	$(top.hangge());
	
	function save() {
		var values = new Array();
		var checkboxs = $("#qt-selector-iframe").contents().find("table input:checked");
		var checkedIds = $("#qt-selector-iframe").contents().find("#checkedIds").val();
		$.each(checkboxs, function() {
			var id = $(this).val();
			values.push(id);
		});
		if (checkboxs.length == 0) {
			bootbox.alert("请选择需要添加的试题!");
		}else{
			$("#values").val(values);
			$("#checkedIdValues").val(checkedIds);
			window.parent.Dialog.close();
		}
	}
</script>
</head>
<body>
	<form action="" name="form1" id="form1" method="post">
	    <input type="hidden" id="values" value="" />
	     <input type="hidden" id="checkedIdValues" value="" />
	    <input type="hidden" id="pointns" value="${pd.pointNum}" />
		<div id="zhongxin">
			<table class="table">
				<tr>
					<td>
						<div>
				            <iframe style="height: 675px; border: none; box-shadow:inset 0 0 5px 5px #ccc;"
				             id="qt-selector-iframe" src="<%=basePath%>examPaper/getAllField.do?fieldNum=${pd.fieldNum}&pointNum=${pd.pointNum}" width="100%"></iframe>
				        </div>
		            </td>
				</tr>
				<tr>
					<td style="text-align: center;" colspan="10"><a
						class="btn btn-mini btn-primary" onclick="save();">添加选中</a> <a
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