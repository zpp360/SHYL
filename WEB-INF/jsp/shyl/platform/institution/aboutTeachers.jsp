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
<title>培训讲师一览_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<base href="<%=basePath%>">
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<script src="<%=basePath%>shyl/js/jquery-1.7.2.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js"
	type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js"
	type="text/javascript"></script>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/styleRegist.css">
</head>
<body id="top" style="background-color: #f7f7f7;">
	<jsp:include page="../../common/header.jsp"></jsp:include>
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param
				value="13" name="menuType" /></jsp:include>
		<div class="mypage_right">
			<h2>师资管理</h2>
			<div class="tab" style="margin-bottom: 0;">
				<a
					href="<%=basePath%>institutionCtrl/toAddTeacher.act?institutions_id=${pd.institutions_id}"
					class="more">+&nbsp;&nbsp;添加教师</a>
				<form action="<%=basePath%>institutionCtrl/toAboutTeachers.act"
					method="post" name="teachersForm" id="teachersForm">
					<input type="text" class="search" id="nameTitle" name="nameTitle"
						value="${pd.nameTitle}" placeholder="请输入教师姓名关键字"
						onblur="trim(this);" style="background-color: #ecf0f9;"> <input
						type="submit" class="sbtnNew" value="搜索" onclick="search();"
						style="margin-top: 0px; line-height: 46px; height: 46px; color: #ffffff; margin-left: 20px;">
				</form>
			</div>
			<div class="jianli">
				<table class="tableclass">
					<thead>
						<tr>
							<th style="width: 15%; padding-left:20px; text-align: left;">教师姓名</th>
							<th style="width: 16%; text-align: left;">职称</th>
							<th style="width: 20%; text-align: left;">毕业院校</th>
							<th style="width: 25%; text-align: left;">简介</th>
							<th style="width: 20%; text-align: center;">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty teacherlist}">
								<c:forEach items="${teacherlist}" var="var" varStatus="vs">
									<tr>
										<td title="${var.teacher_name}"><div
												style="width: 115px; padding-left:20px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${var.teacher_name}</div></td>
										<td title="${var.teacher_level}"><div
												style="width: 130px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${var.teacher_level}</td>
										<td title="${var.graduate}"><div
												style="width: 170px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${var.graduate}</div></td>
										<td title="${var.experience}"><div
												style="width: 280px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${var.experience}</div></td>
										<td style="width: 20%; text-align: center;"><a
											href="<%=basePath%>institutionCtrl/toEditTeachers.act?teacher_id=${var.teacher_id}&institutions_id=${pd.institutions_id}"
											class="modify">修改</a> <a href="#" data-toggle='modal'
											data-target='#deledu' id="deljob_${var.teacher_id}"
											onclick="delTeacher(${var.teacher_id});" class="delete">删除</a></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5" style="text-align: center;"><span
										style="color: #ff6a00">没有相关记录</span></td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<div class="page-header position-relative">
				<table style="width: 100%;">
					<tr>
						<td style="align: center;" align="center"><div
								class="pagination"
								style="padding-top: 15px; margin: 0 auto; font-size: 12px; display: inline-block;">${page.platformPageStr}</div></td>
					</tr>
				</table>
			</div>

		</div>
	</div>
	<div class="modal fade in" id="deledu" role="dialog"
		aria-labelledby="deledu" aria-hidden="false" data-backdrop="static">
		<div class="modal-dialog  modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<h4>您确定要删除吗？删除后不可恢复！</h4>
					<br> <br>
				</div>
				<input id="Conid" name="Conid" type="hidden" value="">
				<div class="modal-footer">
					<button id="EduButton" type="button" class="btn btn-success"
						onclick="Delete()">确认</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<input type="hidden" value="" id="delectinfoid">
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
			//模态框初始加载合同
				function delTeacher(id) {
					$("#delectinfoid").val(id);
					}
				</script>
	<script type="text/javascript">
						function Delete(){
							var id =$("#delectinfoid").val();
							$.ajax({
								type : "POST",
								url :'<%=basePath%>institutionCtrl/deleteTeacher.act',
				data : {
					id : id
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
					$('#deledu').modal('hide');
					location.reload();
				}
			});
		}
						
		//检索
		function search(){
			top.jzts();
			$("#teachersForm").submit();
		}
	</script>
	<%@ include file="../../common/footer.jsp"%>
</body>
</html>