<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<link rel="stylesheet" href="static/assets/css/font-awesome.css" />
		<!-- ace styles -->
		<link rel="stylesheet" href="static/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
		<%@ include file="../../../system/admin/top.jsp"%>
	</head>
<body>
	<form action="<%=basePath%>workflow/submit_task.do" name="Form" id="Form" method="post">
		<input type="hidden" name="task_id" value="${pd.task_id}" />
		<input type="hidden" name="apply_id" value="${pd.apply_id}" />
		<input type="hidden" name="outcome" value="" />
		<div id="zhongxin">
		<table style="width:95%;" >
			<tr>
				<td style="width: 100px; text-align: left;padding-left:20px; padding-top: 13px;"><B>申请类型：</B></td>
				<td style="padding-top: 20px;"><input type="text" id="apply_card_type" disabled="disabled" <c:if test='${pd.apply_card_type==5}'>value="活动证"</c:if><c:if test='${pd.apply_card_type==6}'>value="舞厅证"</c:if><c:if test='${pd.apply_card_type==7}'>value="停车证"</c:if> name="apply_card_type" style="width:250px;" /></td>
			</tr>
			<tr>
				<td style="width: 100px; text-align: left;padding-left:20px; padding-top: 13px;"><B>用户名：</B></td>
				<td style="padding-top: 20px;"><input type="text" id="apply_user_id" name="apply_user_id" disabled="disabled" value="${pd.user_name}" style="width:250px;" /></td>
			</tr>
			<tr>
				<td style="width: 100px; text-align: left;padding-left:20px; padding-top: 13px;"><B>单位：</B></td>
				<td style="padding-top: 20px;"><input type="text" id="apply_user_id" name="apply_user_id" disabled="disabled" value="${pd.unit_name}" style="width:250px;" /></td>
			</tr>
			<c:choose>
				<c:when  test="${pd.apply_card_type==7}">
					<tr>
						<td style="width: 100px; text-align: left; padding-left:20px; padding-top: 13px;"><B>车牌号：</B></td>
						<td style="padding-top: 20px;"><input type="text" id="apply_car_number" name="apply_car_number" readonly="readonly" value="${pd.apply_car_number}" style="width:250px;"/></td>
					</tr>
					<tr>
					<td style="width: 100px; text-align: left;padding-left:20px; padding-top: 13px;"><B>行车证：</B></td>
					<td style="padding-top: 20px;"><img style="width:400px;" src="${img_host}${pd.apply_car_img}" title="行车证"/></td>
					</tr>
					<tr>
					<td style="width: 100px; text-align: left;padding-left:20px; padding-top: 13px;"><B>驾驶证：</B></td>
					<td style="padding-top: 20px;"><img style="width:400px;" src="${img_host}${pd.apply_drive_img}" title="驾驶证"/></td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td style="width: 100px; text-align: left;padding-left:20px; padding-top: 13px;"><B>用户头像：</B></td>
						<td style="padding-top: 20px;"><img style="width:400px;" src="${img_host}${pd.apply_user_img}" title="用户头像"/></td>
					</tr>
					<tr>
					<td style="width: 100px; text-align: left;padding-left:20px; padding-top: 13px;"><B>退休证：</B></td>
					<td style="padding-top: 20px;"><img style="width:400px;" src="${img_host}${pd.apply_retire_img}" title="退休证"/></td>
					</tr>
				</c:otherwise>
			</c:choose>
			
			<tr>
				<td style="width: 100px; text-align: left;padding-left:20px; padding-top: 13px;"><B>备注：</B></td>
				<td style="padding-top: 20px;"><textarea type="text" id="apply_remark" name="apply_remark" readonly="readonly" style="width:500px; height:90px;">${pd.apply_remark} </textarea></td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="2">
					<c:forEach items="${linkList}" var="item" varStatus="vs">
						<a class="btn btn-mini btn-primary" onclick="submitTask('${item}')">${item}</a>
					</c:forEach>
				</td>
			</tr>
		</table>
		</div>
	</form>	
		<table id="table_report"
			class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th class="center" style="width:5%;">序号</th>
					<th class="center" style="width:20%;">时间</th>
					<th class="center" style="width:20%;">批注单位</th>
					<th class="center" style="width:55%;">批注信息</th>
				</tr>
			</thead>
			<tbody>
				<!-- 开始循环 -->
				<c:choose>
					<c:when test="${not empty commentList}">
							<c:forEach items="${commentList}" var="list" varStatus="vs">
								<tr>
									<td class='center' >${vs.index+1}</td>
									<td class='center' ><fmt:formatDate value="${list.time }"  pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td class="center">${list.userId }</td>
									<td class="center">${list.message }</td>
								</tr>
							</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="100" class="center">没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
	
	
			</tbody>
		</table>
			
		<div id="zhongxin2" class="center" style="display:none"><br/><img src="static/images/jzx.gif" /><br/><h4 class="lighter block green"></h4></div>
		
	
	
	
		<!-- 引入 -->
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='static/assets/js/jquery.js'>"+"<"+"/script>");
		</script>
		<!-- <![endif]-->
		<!--[if IE]>
		<script type="text/javascript">
		 	window.jQuery || document.write("<script src='static/assets/js/jquery1x.js'>"+"<"+"/script>");
		</script>
		<![endif]-->
		<script src="static/js/bootstrap.min.js"></script>
		<!-- ace scripts -->
		<script src="static/assets/js/ace/elements.fileinput.js"></script>
		<script src="static/assets/js/ace/ace.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		</script>
	
</body>
</html>