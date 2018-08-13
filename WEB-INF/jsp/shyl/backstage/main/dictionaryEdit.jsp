<%@page import="org.apache.ibatis.annotations.Case"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<%@ include file="../../../system/admin/top.jsp"%>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
</head>
<body>
<br/><br/>
<form action="<%=basePath%>dict/${msg}.do" name="Form" id="Form" method="post">
        <input type="hidden" name="distinguish_id" id="distinguish_id" value="${pd.distinguish_id}"/>
		<div id="zhongxin">
		<table style="margin-left:5px;">
			<tbody>
			<tr>
			    <td><label class="lbl" for="distinguish_key">区分Key：</label></td>
				<td><input name="distinguish_key" id="distinguish_key" placeholder="区分Key"  title="区分Key" value="${pd.distinguish_key}"  maxlength="20" readonly="readonly" type="text" onblur="trim(this);"></td>
			</tr>
			<tr>
			    <td><label class="lbl" for="distinguish_name">区分名称：</label></td>
				<td><input name="distinguish_name" id="distinguish_name" placeholder="区分名称"  title="区分名称"  maxlength="50" value="${pd.distinguish_name}" type="text" onblur="trim(this);"></td>
			</tr>
			<tr>
			    <td><label class="lbl" for="value">区分内容：</label></td>
				<td><input name="value" id="value" placeholder="区分内容"  maxlength="255" title="区分内容"  value="${pd.value}"type="text" onblur="trim(this);"></td>
			</tr>
			<tr>
			    <td><label class="lbl" for="sort">区分排序：</label></td>
				<td><input name="sort" id="sort" placeholder="区分排序" maxlength="3" onkeyup="value=value.replace(/[^0-9]/g,'')" title="区分排序" value="${pd.sort}" type="text" onblur="delZero(this)" style="ime-mode:disabled" ></td>
			</tr>
			<tr style="height: 20px;"></tr>
			<tr>
			 <td></td>
				<td class="center;">
					<a class="btn btn-mini btn-primary" onclick="save();" style="margin-left: 40px;">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</tbody></table>
		</div>
	</form>
	

	<div id="zhongxin2" class="center" style="display: none;">
		<img src="<%=basePath%>static/images/jzx.gif" style="width: 50px;" /><br />
		<h4 class="lighter block green"></h4>
	</div>
	
	<!-- 引入 -->
	<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<!-- 显示文本框里的提示信息 -->
	<script type="text/javascript" src="static/js/myjs/head.js"></script>
	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script>
	<!-- 日期框 -->
	<script type="text/javascript" src="static/js/bootbox.min.js"></script>
	<!-- 确认窗口 -->
	<!-- 引入 -->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());
	</script>
	<script type="text/javascript">
	//保存
	function save(){
		if ($("#distinguish_key").val() == "") {
			$("#distinguish_key").tips({
				side : 3,
				msg : '请输入区分Key',
				bg : '#FF5080',
				time : 2
			});
			$("#distinguish_key").focus();
			return false;
		}
		if ($("#distinguish_id").val() == "") {
			$("#distinguish_id").tips({
				side : 3,
				msg : '请输入区分ID',
				bg : '#FF5080',
				time : 2
			});
			$("#distinguish_id").focus();
			return false;
		}
		if ($("#distinguish_name").val() == "") {
			$("#distinguish_name").tips({
				side : 3,
				msg : '请输入区分名称',
				bg : '#FF5080',
				time : 2
			});
			$("#distinguish_name").focus();
			return false;
		}
		else if ($("#value").val() == "") {
			$("#value").tips({
				side : 3,
				msg : '请输入区分内容',
				bg : '#FF5080',
				time : 2
			});
			$("#value").focus();
			return false;
		}else{
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
	}
	</script>
</body>
</html>
