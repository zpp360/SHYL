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
<!-- jsp文件头和头部 -->
<%@ include file="../../../system/admin/top.jsp"%>
<style type="text/css">
.btnlist {
	padding: 5px;
	margin: 5px;
	border: 1px solid #ddd;
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>
	<form action="companyInfo/payList.do" name="Form" id="Form"
		method="post">
		<div id="zhongxin">
			<table class="table ">
				<tr>
					<td style="width: 80px; text-align: right; padding-top: 7px;">标题：</td>
					<td 说通 ><input style="width: 200px" type="text" style="background: #FFF;" name="message_title" id="message_title"  value="${pd.MESSAGE_TITLE}"
						maxlength="32"   disabled="disabled" title="标题" /></td>
					
				</tr>
				<tr>
					<td style="width: 80px; text-align: right; padding-top: 13px;">类型：</td>
					<td style="width: 200px"><input type="text" style="background: #FFF;" name="message_content" id="message_content" value="${pd.MESSAGE_CONTENT}"
						maxlength="32" disabled="disabled"  title="内容：" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap"
						style="width: 80px; text-align: right; padding-top: 13px;">发表日期：</td>
					<td style="width: 200px"><input style="width: 150px; text-align: left; padding-top: 13px;" type="text" id="publish_date" name="publish_date" value="${pd.PUBLISH_DATE}"
						class="span10 date-picker" data-date-format="yyyy-mm-dd"
						disabled="disabled" style="width: 207px;background: #FFF;" >
					</td>
					
				</tr>
			
				<tr>
					<td style="width: 80px; text-align: right; padding-top: 13px;">姓名：</td>
					<td colspan = " 2 "><input type="text"  name="tenant_name" id="tenant_name" value="${pd.tenant_name}"
						maxlength="32" disabled="disabled" style="background: #FFF;" title="姓名" /></td>
						<td></td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: right; padding-top: 13px;">E-mail：</td>
					<td style="width: 200px"><input type="text" name="company_name" id="company_name" value="${pd.company_name}"
						maxlength="32" disabled="disabled" style="background: #FFF;" title="公司名称" /></td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: right; padding-top: 13px;">电话：</td>
					<td style="width: 200px"><input type="text" name="contact_phone" id="contact_phone" value="${pd.contact_phone}"
						maxlength="32"  disabled="disabled" style="background: #FFF;" title="紧急联系人电话" /></td>
				</tr>
				<tr>
					
					<td style="width: 80px; text-align: right; padding-top: 13px;">地址：</td>
					<td style="width: 200px"><input type="text" name="tenant_add" id="tenant_add" value="${pd.tenant_add}"
						maxlength="32" disabled="disabled" style="background: #FFF;" title="租户联系地址" /></td>
				</tr>
				
				<tr>
				    <td style="width: 80px; text-align: right; padding-top: 13px;">内容：</td>
				    <td style="width: 200px"><input type="textbox" name="pool_area" id="pool_area" value="${pd.pool_area}"
						maxlength="255" disabled="disabled"   style="background: #FFF;" title="公摊面积" /></td>
					
				</tr>
				<tr>
					<td style="text-align: center;" colspan="10"><a
						class="btn btn-mini btn-primary" onclick="save();">回复</a> <a
						class="btn btn-mini btn-danger" onclick="top.Dialog.close();">删除</a>
					</td>
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
	<script type="text/javascript" src="static/js/myjs/head.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript"
		src="static/js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript">
	$(top.hangge());
	</script>

</body>

</body>
</html>