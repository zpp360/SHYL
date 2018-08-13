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
<title>建言献策 查看图片</title>
<meta name="description" content="overview & stats" />
<%@ include file="../../../system/admin/top.jsp"%>

</head>
<body>
<br>
	<form action="<%=basePath%>address/saveAddress.do" name="Form" id="Form" method="post">
		<input type="hidden" name="url" value="${url}" />
		<div id="zhongxin">
			<table class="table ">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<B>图片</B>
					</td>
					<td>
						<img id="sugg_path" name="sugg_path" alt="暂无图片查看"/>
					</td>
				</tr>
				<tr>
					<td nowrap="nowrap" style="width: 80px; text-align: left; padding-top: 13px;"><B>建议</B>
					</td>
					<td><textarea id="pContent" name="pContent" readonly="readonly" style="min-height: 450px; margin: 0 auto; width: 80%;float:left">${pd.sugg_content}</textarea>
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
	</form>
</body>

<script type="text/javascript">
		
	$(function() {
			
		var sugg_path = "${pd.sugg_path}";
			
		$("#sugg_path").attr("src","<%=basePath%>"+sugg_path);
			
			
	});
		
		
</script>

</html>