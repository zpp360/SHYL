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
<title>培训课程一览_济南市服务外包公共服务平台</title>
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
				value="14" name="menuType" /></jsp:include>
		<div class="mypage_right">
			<h2>课程管理</h2>
			<div class="tab" style="margin-bottom: 0;">
				<a
					href="<%=basePath%>institutionCtrl/toAddCourse.act?institutions_id=${pd.institutions_id}"
					class="more">+&nbsp;&nbsp;添加课程</a>
				<form action="<%=basePath%>institutionCtrl/toAboutCourses.act"
					method="post" name="coursesForm" id="coursesForm">
					<input type="text" class="search" id="nameTitle" name="nameTitle"
						value="${pd.nameTitle}" placeholder="请输入课程名称关键字"
						onblur="trim(this);" style="background-color: #ecf0f9;"> <input
						type="submit" class="sbtnNew" value="搜索" onclick="search();"
						style="margin-top: 0px; line-height: 46px; height: 46px; color: #ffffff; margin-left: 20px;">
				</form>
			</div>
			<div class="jianli">
				<table class="tableclass">
					<thead>
						<tr>
							<th style="width: 33%; padding-left:20px; text-align: left;">课程名称</th>
							<th style="width: 15%; text-align: left;">课时(节)</th>
							<th style="width: 15%; text-align: left;">时长(分钟)</th>
							<th style="width: 17%; text-align: left;">讲师</th>
							<th style="width: 20%; text-align: center;">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty courselist}">
								<c:forEach items="${courselist}" var="var" varStatus="vs">
									<tr>
										<td title="${var.course_name}"
											style="width: 140px; padding-left:20px; text-align: left;"><div
												style="width: 275px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${var.course_name}</div></td>
										<td title="${var.period}"
											style="width: 140px; text-align: left;">${var.period}</td>
										<td title="${var.course_time}"
											style="width: 140px; text-align: left;">${var.course_time}</td>
										<td title="${var.teacher}"
											style="width: 140px; text-align: left;"><div
												style="width: 140px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${var.teacher}</div></td>
										<td style="text-align: center;"><a
											href="<%=basePath%>institutionCtrl/toEditCourses.act?course_id=${var.course_id}&institutions_id=${pd.institutions_id}"
											class="modify">修改</a> <a href="#" data-toggle="modal"
											data-target="#deledu" onclick="delCourse(${var.course_id});"
											class="delete">删除</a></td>
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

	<div class="modal_h20 fade in" id="deledu" data-toggle="modal"
		role="dialog" aria-labelledby="deledu" aria-hidden="false"
		data-backdrop="static">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<p id="warntext">您确定要删除该课程吗？删除后不可恢复！</p>
				</div>
				<div class="modal-footer">
					<input type="hidden" id="questionID" value="">
					<button type="button" class="btn btn-success" onclick="Delete()"
						data-dismiss="modal">确认</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<input type="hidden" value="" id="delectinfoid">
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
       //模态框初始加载合同
       function delCourse(id) {
           $("#delectinfoid").val(id);
           }
       function Delete(){
                   var id =$("#delectinfoid").val();
                   $.ajax({
                       type : "POST",
                       url :document.getElementsByTagName('base')[0].href+'institutionCtrl/deleteCourse.act',
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
			$("#coursesForm").submit();
		}
	    </script>
	<%@ include file="../../common/footer.jsp"%>
</body>
</html>