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
<title>添加试卷_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<base href="<%=basePath%>">
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<jsp:include page="../../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link href="css/mypage.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="<%=basePath%>shyl/css/maincss/question-add.css" />
<script src="shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/jquery.min.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.js"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript" src="shyl/js/jquery.tips.js"></script>
<script type="text/javascript" src="shyl/js/mainjs/rcptCommon.js"></script>
</head>

<body style="background-color: #f7f7f7;">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param
				value="32" name="menuType" /></jsp:include>
		<div class="mypage_right" style="min-height: 920px;">
			<h2 style="color: color:black;">添加试卷</h2>
			<div class="container"
				style="min-height: 500px; font-size: 0.85em !important; color: black;">
				<div class="row">
					<div class="col-xs-9">
						<div class="page-content row">
							<form id="form-exampaper-add">
								<div class="form-line add-update-exampapername">
									<span class="form-label"><span class="warning-label"
										style="color: #FF0000">*</span>试卷名称：</span> <input type="text"
										class="df-input-narrow " id="paperName" name="paperName"
										maxlength="35" placeholder="请输入试卷名称" title="试卷名称"> <span class="form-message"></span>
								</div>
								<div class="form-line add-update-exampaper-creat-type">
									<span class="form-label"><span class="warning-label"
										style="color: #FF0000">*</span>组卷方式：</span> <select
										class="df-input-narrow" name="creatType" id="creatType"
										onchange="changeCreatType();">
										<option value="2">自动组卷</option>
										<option value="1">手动组卷</option>

									</select> <span class="form-message"></span>
								</div>
								<div class="form-line add-update-duration">
									<span class="form-label"><span class="warning-label"
										style="color: #FF0000">*</span>时长（分钟）：</span> <input type="text"
										class="df-input-narrow"
										onkeyup="this.value=this.value.replace(/\D/g,'')"
										name="duration" id="duration" maxlength="3"
										placeholder="请输入时长" title="时长" onblur="delZero(this);">
									<span class="form-message"></span>
								</div>
								<div class="form-line add-update-exampaper-scope"
									style="display: block;" id="field-select-div">
									<span class="form-label"><span class="warning-label"
										style="color: #FF0000">*</span>知识点：</span>
									<fieldset>
										<legend> 知识点范围 </legend>
										<div>
											<div class="clearfix">
												<div id="aq-course1"
													style="padding: 0px; float: left; width: 23%;">
													<select id="field-select" class="df-input-narrow" size="4"
														style="width: 100%;">
														<c:forEach items="${fieldList }" var="item">
														<c:if test="${item.fieldId==8}">
															<option value="${item.fieldId }" >${item.fieldName }</option>
															</c:if>
														</c:forEach>
													</select>
												</div>
												<div id="aq-course2"
													style="padding: 0px; float: left; width: 23%; margin-left: 3px;">
													<select id="point-from-select" class="df-input-narrow"
														size="4" style="width: 100%;">
													</select>
												</div>
												<div style="padding: 0px; float: left; margin-left: 13px;">
													<button id="add-point-btn" class="btn btn-primary btn-xs">选择知识点</button>
													<br />
													<button id="del-point-btn" class="btn btn-danger btn-xs">删除知识点</button>
													<br />
													<button id="remove-all-point-btn"
														class="btn btn-warning btn-xs">清除列表</button>
												</div>
												<div id="kn-selected"
													style="padding-left: 0px;; margin-bottom: 20px; margin-left: 14px;">
													<select id="point-to-select" class="df-input-narrow"
														size="4" style="width: 35%; margin-left: 14px;">
													</select>
												</div>
											</div>


										</div>
									</fieldset>
									<span class="form-message"></span>
								</div>
								<div class="form-line add-update-types" style="display: block;"
									id="ques-type-div">
									<span class="form-label"><span class="warning-label"
										style="color: #FF0000">*</span>题型：</span>
									<fieldset>
										<legend> 选择题型分布 </legend>
										<span class="add-ques-type"> <label
											style="display: inherit;">单选题</label> <input type="hidden"
											class="ques-id" value="1"> <input type="text"
											class="df-input-narrow add-ques-amount"
											style="width: 50px; height: 28px;" maxlength="3"
											onkeyup="this.value=this.value.replace(/\D/g,'')"> <span>道</span>
											<label style="display: inherit;">每道题</label> <input
											type="text" class="df-input-narrow add-ques-score"
											style="width: 50px; height: 28px;" maxlength="3"
											onkeyup="this.value=this.value.replace(/\D/g,'')"> <span>分</span><span
											style="margin-left: 30px; cursor: normal; color: red"
											id="Num1"></span>
										</span> <br> <span class="add-ques-type"
											style="position: relative; top: 3px;"> <label
											style="display: inherit;">多选题</label> <input type="hidden"
											class="ques-id" value="2"> <input type="text"
											class="df-input-narrow add-ques-amount"
											style="width: 50px; height: 28px;" maxlength="3"
											onkeyup="this.value=this.value.replace(/\D/g,'')"> <span>道</span>
											<label style="display: inherit;">每道题</label> <input
											type="text" class="df-input-narrow add-ques-score"
											style="width: 50px; height: 28px;" maxlength="3"
											onkeyup="this.value=this.value.replace(/\D/g,'')"> <span>分</span><span
											style="margin-left: 30px; cursor: normal; color: red"
											id="Num2"></span>
										</span> <br> <span class="add-ques-type"
											style="position: relative; top: 6px;"> <label
											style="display: inherit;">判断题</label> <input type="hidden"
											class="ques-id" value="3"> <input type="text"
											class="df-input-narrow add-ques-amount"
											style="width: 50px; height: 28px;" maxlength="3"
											onkeyup="this.value=this.value.replace(/\D/g,'')"> <span>道</span>
											<label style="display: inherit;">每道题</label> <input
											type="text" class="df-input-narrow add-ques-score"
											style="width: 50px; height: 28px;" maxlength="3"
											onkeyup="this.value=this.value.replace(/\D/g,'')"> <span>分</span><span
											style="margin-left: 30px; cursor: normal; color: red"
											id="Num3"></span>
										</span> <br>
									</fieldset>
									<span class="form-message"></span>
								</div>
								<div class="form-line add-total-point" id="tatol-point-div">
									<span class="form-label"><span class="warning-label"
										style="color: #FF0000">*</span>总分：</span> <input id="tatolPoint"
										type="text" class="df-input-narrow" name="tatolPoint"
										id="tatolPoint" maxlength="4" title="总分"
										onblur="delZero(this);" value="0" readonly> <span
										class="form-message"></span>
								</div>
								<div class="form-line add-update-pass-point">
									<span class="form-label"><span class="warning-label"
										style="color: #FF0000">*</span>及格分数：</span> <input type="text"
										class="df-input-narrow"
										onkeyup="this.value=this.value.replace(/\D/g,'')"
										name="passPoint" id="passPoint" maxlength="4"
										placeholder="请输入及格分数" title="及格分数" onblur="delZero(this);">
									<span class="form-message"></span>
								</div>
								<div class="form-line add-total-point">
									<span class="form-label" style="margin-top: 8px">测评结果：</span>
									<table class="tableclass"
										style="width: 88%; position: relative; bottom: 6px; border-collapse: separate; border-spacing: 4px;">
										<tbody id="fm2_table_body">
											<tr style="border-collapse: separate; border-spacing: 10px;">
												<td class="bgc_tt short" colspan="1"><input type="text"
													class="inputtxt2" style="width: 93%; font-size: 1.2em;"
													id="start_number0" placeholder="请输入开始分数" maxlength="5"
													name="start_number0"
													onkeyup="this.value=this.value.replace(/\D/g,'')"></td>
												<td class="bgc_tt short" colspan="1"><input type="text"
													class="inputtxt2" style="width: 93%; font-size: 1.2em;"
													id="end_number0" placeholder="请输入结束分数" maxlength="5"
													name="end_number0"
													onkeyup="this.value=this.value.replace(/\D/g,'')"></td>
												<td class="bgc_tt short" colspan="1" style="width: 10%">评分阶段:</td>
												<td class="bgc_tt short" colspan="1"><input type="text"
													class="inputtxt2" style="width: 93%; font-size: 1.2em;"
													id="stage0" maxlength="10" name="stage0"></td>
												<td class="bgc_tt short" colspan="1" style="width: 5%">描述:</td>
												<td class="bgc_tt short" colspan="1"><input type="text"
													class="inputtxt2" style="width: 93%; font-size: 1.2em;"
													id="description0" maxlength="1000" name="description0"></td>
												<td class="bgc_tt_short" colspan="1"><input
													type="button" class="btn btn-success btn-block" value="增加"
													style="width: 63px; height: 37px; margin-left: 10%"
													onclick="addNewPersonRow()"></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="form-group">
									<div class="col-sm-2 col-sm-offset-2">
										<button type="button" onclick="save();"
											class="btn btn-success btn-block" id="nextr">下一步</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<div class="modaldel fade in" id="messageresult" tabindex="-1"
		role="dialog" aria-labelledby="delresume" aria-hidden="false"
		data-backdrop="static" data-target="" style="display: none;">
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
					<p id="warntext"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" onclick="loadeval()"
						data-dismiss="modal" id="d">确认</button>
					<button type="button" class="btn btn-default" onclick="loadeval()"
						data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<script type="text/javascript"
		src="<%=basePath%>shyl/js/question/evalexaperAdd.js"></script>
	<%@ include file="../../common/footer.jsp"%>
</body>
</html>