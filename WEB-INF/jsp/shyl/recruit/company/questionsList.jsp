<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>试题管理_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">
<jsp:include page="../../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<script src="js/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/jquery-1.7.1.js"></script>
<script src="<%=basePath%>shyl/js/jquery.min.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<script src="<%=basePath%>shyl/js/question/question-list.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="<%=basePath%>shyl/css/question/question-list.css" />
</head>
<body id="top" style="background-color: #f7f7f7;">
	<div class="modal_h20 modal fade in" id="delquestion"
		data-toggle="modal" role="dialog" aria-labelledby="mySmallModalLabel"
		aria-hidden="false" data-backdrop="static">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						onclick="Clear()">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<p id="warntext">试题删除后不可恢复，确定删除吗？</p>
				</div>
				<div class="modal-footer">
					<input type="hidden" id="questionID" value="">
					<button type="button" class="btn btn-success" onclick="Delete()"
						data-dismiss="modal">确认</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /.modal -->
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param
				value="35" name="menuType" /></jsp:include>
		<div class="mypage_right" style="min-height: 920px;">
			<h2>试题一览</h2>
			<form action="<%=basePath%>company/toQuestionsList.act" method="post"
				name="Form" id="Form">
				<div class="tab" style="margin-bottom: 0;">
					<table style="width: 113%;">
						<tr>
							<td><span style="font-size: 1em;">题库：</span><select
								class="inputtxtst" style="width: 143px;" name="field_id"
								id="field_id">
									<option value="">全部</option>
									<c:forEach items="${fieldList}" var="field">
								<c:if test="${field.fieldId==8}">
										<option value="${field.fieldId}"
											<c:if test="${field.fieldId == pd.field_id }">selected</c:if>>${field.fieldName}</option>
								</c:if>
									</c:forEach>
							</select></td>
							<td><span style="font-size: 1em;">&nbsp;知识分类：</span><select
								class="inputtxtst" style="width: 200px;" name="point_id"
								id="point_id">
									<option value="">全部</option>
									<c:forEach items="${knowledgeList}" var="knowledge">
										<option value="${knowledge.pointId}"
											<c:if test="${knowledge.pointId == pd.point_id }">selected</c:if>>${knowledge.pointName}</option>
									</c:forEach>
							</select></td>
							<td><span style="font-size: 1em;">&nbsp;试题分类：</span><select
								class="inputtxtst" style="width: 70px;" name="question_type_id"
								id="question_type_id">
									<option value="">全部</option>
									<c:forEach items="${questionTypeList}" var="questionType">
										<option value="${questionType.id}"
											<c:if test="${questionType.id == pd.question_type_id}">selected</c:if>>${questionType.name}</option>
									</c:forEach>
							</select></td>
							<td><input type="submit" class="sbtnNew" value="搜索"
								style="margin-top: 0px; line-height: 46px; height: 46px; color: #ffffff; margin-left: 5px;"></td>
							<td><a href="javaScript:void(0);" onclick="addQuestion();"
								class="more" style="font-size: 1em;">+&nbsp;&nbsp;添加试题</a></td>
						</tr>
					</table>
				</div>
				<div class="jianli">
					<table class="tableclass">
						<thead>
							<tr>
								<th style="width: 20%; text-align: left; padding-left:30px">试题名称</th>
								<th style="width: 7%; text-align: center;">类型</th>
								<th style="width: 15%; text-align: center;">专业</th>
								<th style="width: 25%; text-align: center;">知识类</th>
								<th style="width: 10%; text-align: center;">关键字</th>
								<th style="width: 15%; text-align: center;">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty questionList}">
									<c:forEach items="${questionList}" var="items" varStatus="vs">
										<tr>
											<td style="width: 20%; text-align:left;padding-left:30px"><span
												title='<c:out value="${items.name}"></c:out>'
												style="width: 170px; display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
													<a
													href="<%=basePath%>company/previewQuestion.act?question_id=${items.id}"
													target="_blank"><xmp style="font-size:1.1em">${items.name}</xmp></a>
											</span></td>
											<td style="width: 7%; text-align: center;">
												${items.questionTypeName }</td>
											<td style="width: 15%; text-align: center;"><span
												title="${items.fieldName }"
												style="width: 130px; display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${items.fieldName }</span></td>
											<td style="width: 25%; text-align: center;"><span
												title="${items.pointName }"
												style="width: 220px; display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${items.pointName }</span></td>
											<td style="width: 10%; text-align: center;"><span
												title="${items.keyword }"
												style="width: 100px; display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${items.keyword }</span></td>
											<td style="width: 15%; text-align: center;"><a style="cursor:pointer;"
												data-toggle="modal" data-target="#ssj"
												onclick="showUpdateQuestionTp('${items.field_id}','${items.point_id}','${items.id}')"
												class="modify">修改</a> <a data-toggle="modal"
												id="delquestion_${items.id}"
												onclick="dels(${items.id},'delquestion_${items.id }');"
												class="delete" style="cursor:pointer;">删除</a></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="6" style="text-align: center;"><span
											style="color: #ff6a00">没有相关数据</span></td>
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
			</form>
		</div>
	</div>
	<div class="clear"></div>
	<!-- 修改分类 -->
	<div class="modal_h20 fade in" id="ssj" role="dialog"
		aria-labelledby="adoptModal" aria-hidden="false"
		data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						onclick="clearAll();">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						修改分类<small> </small>
					</h4>
				</div>
				<form class="form-horizontal" role="form" action="" method="post"
					id="form1" name="form1">
					<table class="table">
						<tbody>
							<tr>
								<td class="divtd"><span style="color: red;">*</span>专业：</td>
								<td style="width: 70%;"><select class="inputtxt2"
									name="field_id_a" id="field_id_a">
<!-- 										<option value="">全部</option> -->
										<c:forEach items="${fieldList}" var="field">
										<c:if test="${field.fieldId==8}">
											<option value="${field.fieldId}">${field.fieldName}</option>
										</c:if>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td class="divtd"><span style="color: red;">*</span>知识类：</td>
								<td style="width: 70%;"><select class="inputtxt2"
									name="point_id_a" id="point_id_a">
										<option value="">全部</option>
										<c:forEach items="${knowledgeList}" var="knowledge">
											<option value="${knowledge.pointId}"
												<c:if test="${knowledge.pointId == pd.point_id }">selected</c:if>>${knowledge.pointName}</option>
										</c:forEach>
								</select></td>
							</tr>
						</tbody>
					</table>
					<div class="modal-footer">
						<input type="hidden" value="" id="defauinfo_id">
						<button id="EduButton" type="button" class="btn btn-success"
							onclick="updateQuestionPoint()">确认</button>
						<button type="button" class="btn btn-default"
							onclick="clearAll();" data-dismiss="modal">关闭</button>
						<input type="hidden" value="" id="question_id" name="question_id">
					</div>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
</html>
