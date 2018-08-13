<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>收入汇总表_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<jsp:include page="../../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/work.css">
<script type="text/javascript"
	src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="<%=basePath%>/shyl/js/mainjs/jquery.placeholder.js"></script>
<link rel="stylesheet"
	href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet"
	href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<link rel="stylesheet"
	href="<%=basePath%>shyl/css/maincss/showLoading.css">
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js"
	type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/images/apply/municipalIncomeSum.js"
	type="text/javascript"></script>
<style>
.progress {
	padding: 1px;
	width: 220px;
	height: 11px;
	overflow: hidden;
	/* background: #999; */
	border: 1px solid #428bca;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	display: none;
	float: left;
	/*  visibility:hidden */
}

.bar {
	height: 11px;
	border-radius: 6px;
	-webkit-border-radius: 6px;
	background: #428bca;
	color: #ffffff;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 12px;
	padding: 0px;
	line-height: 11px;
	text-align: center;
}

.bar-error {
	width: 100%;
	background: #f44336;
}

a {
	cursor: pointer;
	color: #333;
}

.mypage_tab a:hover, a:focus {
	color: #333;
}
</style>
</head>
<body id="top" style="background-color: #f7f7f7;">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param
				value="2" name="menuType" /></jsp:include>
		<!--  国际通行的资质认证资助-->
		<div class="mypage_right">
			<h2 class="h2_font13">
				<img id="catalogTree" src="<%=basePath%>/shyl/images/catalog.png"
					style="margin-bottom: 5px;" />${pageMap.levelMap.levelMenu}<span id="title">收入汇总表</span>
			</h2>
			<div class="mypage_tab" style="display:none; width: 80%;" id="years">
				<div class="hd">
					<ul>
						<li class="on" id="years15"><a
							style="display: block; outline: none;" href="javascript:void(0);"
							data-var="${previousYear}">${previousYear}年度</a></li>
						<li id="years16" style=""><a
							style="display: block; outline: none;" href="javascript:void(0);"
							data-var="${lastYear}">${lastYear}年度 </a></li>
					</ul>
				</div>
			</div>
			<div class="panel-heading">
				<form
					action="<%=basePath%>govUploadCommon/saveIncomeSummaryFile.act"
					class="form-inline" method="post" id="form1">
					<input type="hidden" name="previousYear" id="previousYear"
						value="${previousYear}"/>
					<input type="hidden" name="lastYear" id="lastYear"
						value="${lastYear}"/>
						<input type="hidden" name="info_id" id="info_id"
						value="${pd.info_id}"/>	
						<input type="hidden" id="certificate_type" value="${pd.certificate_type}" />
						<input type="hidden" id="expense_type" value="${pd.expense_type}" />
						<input type="hidden" id="contract_type" value="${pd.contract_type}" />
						<input type="hidden" id="settlement_type" value="${pd.settlement_type}" /> 
					<!-- 下一页 -->
					<input type="hidden" name="toPage" value="${pageMap.toPage}">
					<span
						style="font-size: 12px; padding-left: 10px; margin-right: 100px; display: inline-block; vertical-align: bottom; border: 1px solid #d2c7c7; width: 87%">
						<label style="color: red;">※温馨提示：</label><label style="">合同资料和涉外收入资料文件如果过大的话，可以分割成多个文件上传。</label>
					</span>
					<table class="table">
						<tbody>
							<tr>
								<td>
									<div class="row">
										<div class="col-md-12">
											<div>
												<div class="form-group">
													<div class="col-sm-10">
														<div class="caption" align="left"
															style="width: 700px; padding-top: 20px; padding-bottom: 30px;">
															<span style="margin-top: 50px; margin-right: 30px;">合同目录：</span>
															<a class="btn btn-link hover"><span
																class="btn btn-primary1 fileinput-button"
																style="width: 70px;"><span>上传</span><input
																	type="file" id="file_upload1" name="file_upload1"
																	multiple /></span></a> <span
																style="margin-top: 50px; font-size: 0.7em; color: red;">
																<font color="red">※</font>应至少包括：序号、合同号、合同名称、合同金额（万美元）以及执行额（万美元）
															</span>
															<div id="progress1" class="progress">
																<div class="bar" style="width: 0%;"></div>
															</div>
															<div
																style="margin-left: 240px; color: #818590; font-size: 0.7em;">支持的文件格式为.pdf</div>
														</div>
													</div>

													<div class="col-sm-12">
													<table class="tableclass"
															style="margin-left: 15px; width: 80%">
															<thead>
																<tr>
																	<th style="width: 500px; text-align: center;">上传文件名</th>
																	<th style="width: 200px; text-align: center;">操作</th>
																</tr>
															</thead>
															<tbody id="certificateFileId">
																<c:choose>
																	<c:when test="${not empty certificatePd}">
																			<tr>
																				<c:choose>
																					<c:when test="${fn:length(certificatePd.file_name) >30}">
																						<td title="${certificatePd.file_name}"
																							style="width: 140px; text-align: center">${fn:substring(certificatePd.file_name,0, 30)}...</td>
																					</c:when>
																					<c:otherwise>
																						<td title="${certificatePd.file_name}"
																							style="width: 140px; text-align: center;">${certificatePd.file_name}</td>
																					</c:otherwise>
																				</c:choose>
																				<td style="text-align: center;"><a
																					class="zview" id="view${certificatePd.id}"
																					href="javascript:void(0);"
																					target="_blank" onclick="viewPdf('${certificatePd.id}')">预览</a><a
																					data-toggle='modal' data-target='#delComAlterFile'
																					onclick="delComAlterFile('${certificatePd.id}');"
																					class="delete" href="javascript:void(0);">删除</a>
																					<input
																					id="ViewPath${certificatePd.id}"
																					name="ViewPath${certificatePd.id}" type="hidden"
																					value="${certificatePd.file_path}" />
																					</td>
																			</tr>
																	</c:when>
																	<c:otherwise>
																		<tr>
																			<td colspan="2" style="text-align: center;"><span
																				style="color: #ff6a00">没有相关记录</span></td>
																		</tr>
																	</c:otherwise>
																</c:choose>
															</tbody>
														</table>
													</div>
													<div class="col-sm-10">
														<div class="caption" align="left"
															style="width: 500px; padding-top: 20px;">
															<span style="margin-top: 50px; margin-right: 30px;">合同资料：</span>
															<a class="btn btn-link hover"><span
																class="btn btn-primary1 fileinput-button"
																style="width: 70px;"><span>上传</span><input
																	type="file" id="file_upload2" name="file_upload2"
																	multiple /></span></a> <span
																style="margin-top: 50px; font-size: 0.7em; color: red;">
																<font color="red">※</font>可以上传多个文件，文件格式为.pdf
															</span>
															<div style="height: 35px;">
																<div id="progress2" class="progress"
																	style="float: left; margin-top: 0px; margin-left: 28px;">
																	<div class="bar" style="width: 0%;"></div>
																</div>
															</div>
														</div>
													</div>
													<div class="col-sm-12">
														<table class="tableclass"
															style="margin-left: 15px; width: 80%">
															<thead>
																<tr>
																	<th style="width: 500px; text-align: center;">上传文件名</th>
																	<th style="width: 200px; text-align: center;">操作</th>
																</tr>
															</thead>
															<tbody id="fileID">
																<c:choose>
																	<c:when test="${not empty expensePdList}">
																		<c:forEach items="${expensePdList}" var="var"
																			varStatus="vs">
																			<tr>
																				<c:choose>
																					<c:when test="${fn:length(var.file_name) >30}">
																						<td title="${var.file_name}"
																							style="width: 140px; text-align: center">${fn:substring(var.file_name,0, 30)}...</td>
																					</c:when>
																					<c:otherwise>
																						<td title="${var.file_name}"
																							style="width: 140px; text-align: center;">${var.file_name}</td>
																					</c:otherwise>
																				</c:choose>
																				<td style="text-align: center;"><a
																					class="zview" id="view${var.id}"
																					href="javascript:void(0);"
																					target="_blank" onclick="viewPdf('${var.id}')">预览</a><a
																					data-toggle='modal' data-target='#delComAlterFile'
																					onclick="delComAlterFile('${var.id}');"
																					class="delete" href="javascript:void(0);">删除</a><input
																					id="ViewPath${var.id}"
																					name="ViewPath${var.id}" type="hidden"
																					value="${var.file_path}" /></td>
																			</tr>
																		</c:forEach>
																	</c:when>
																	<c:otherwise>
																		<tr>
																			<td colspan="2" style="text-align: center;"><span
																				style="color: #ff6a00">没有相关记录</span></td>
																		</tr>
																	</c:otherwise>
																</c:choose>
															</tbody>
														</table>
													</div>
													<div class="col-sm-10">
														<div class="caption" align="left"
															style="width: 670px; padding-top: 20px; padding-bottom: 30px;">
															<span style="margin-top: 50px">涉外收入目录：</span> <a
																class="btn btn-link hover"><span
																class="btn btn-primary1 fileinput-button"
																style="width: 70px;"><span>上传</span><input
																	type="file" id="file_upload3" name="file_upload3"
																	multiple /></span></a> <span
																style="margin-top: 50px; font-size: 0.7em; color: red;">
																<font color="red">※</font>应至少包括：序号、币种、金额以及收入日期
															</span>
															<div id="progress3" class="progress">
																<div class="bar" style="width: 0%;"></div>
															</div>
															<div
																style="margin-left: 240px; color: #818590; font-size: 0.7em;">支持的文件格式为.pdf</div>
														</div>
													</div>
													<div class="col-sm-12">
													<table class="tableclass"
															style="margin-left: 15px; width: 80%">
															<thead>
																<tr>
																	<th style="width: 500px; text-align: center;">上传文件名</th>
																	<th style="width: 200px; text-align: center;">操作</th>
																</tr>
															</thead>
															<tbody id="contractFileId">
																<c:choose>
																	<c:when test="${not empty contractPd}">
																			<tr>
																				<c:choose>
																					<c:when test="${fn:length(contractPd.file_name) >30}">
																						<td title="${contractPd.file_name}"
																							style="width: 140px; text-align: center">${fn:substring(contractPd.file_name,0, 30)}...</td>
																					</c:when>
																					<c:otherwise>
																						<td title="${contractPd.file_name}"
																							style="width: 140px; text-align: center;">${contractPd.file_name}</td>
																					</c:otherwise>
																				</c:choose>
																				<td style="text-align: center;"><a
																					class="zview" id="view${contractPd.id}"
																					href="javascript:void(0);"
																					target="_blank" onclick="viewPdf('${contractPd.id}')">预览</a><a
																					data-toggle='modal' data-target='#delComAlterFile'
																					onclick="delComAlterFile('${contractPd.id}');"
																					class="delete" href="javascript:void(0);">删除</a>
																					<input
																					id="ViewPath${contractPd.id}"
																					name="ViewPath${contractPd.id}" type="hidden"
																					value="${contractPd.file_path}" />
																					</td>
																			</tr>
																	</c:when>
																	<c:otherwise>
																		<tr>
																			<td colspan="2" style="text-align: center;"><span
																				style="color: #ff6a00">没有相关记录</span></td>
																		</tr>
																	</c:otherwise>
																</c:choose>
															</tbody>
														</table>
													</div>
													<div class="col-sm-10">
														<div class="caption" align="left"
															style="width: 500px; padding-top: 20px;">
															<span style="margin-top: 50px;">涉外收入资料：</span> <a
																class="btn btn-link hover"><span
																class="btn btn-primary1 fileinput-button"
																style="width: 70px;"><span>上传</span><input
																	type="file" id="file_upload4" name="file_upload4"
																	multiple /></span></a> <span
																style="margin-top: 50px; font-size: 0.7em; color: red;">
																<font color="red">※</font>可以上传多个文件，文件格式为.pdf
															</span>
															<div style="height: 35px;">
																<div id="progress4" class="progress"
																	style="float: left; margin-top: 0px; margin-left: 28px;">
																	<div class="bar" style="width: 0%;"></div>
																</div>
															</div>
														</div>
													</div>
													<div class="col-sm-12">
														<table class="tableclass"
															style="margin-left: 15px; width: 80%">
															<thead>
																<tr>
																	<th style="width: 500px; text-align: center;">上传文件名</th>
																	<th style="width: 200px; text-align: center;">操作</th>
																</tr>
															</thead>
															<tbody id="fileID1">
																<c:choose>
																	<c:when test="${not empty settlementPdList}">
																		<c:forEach items="${settlementPdList}" var="var"
																			varStatus="vs">
																			<tr>
																				<c:choose>
																					<c:when test="${fn:length(var.file_name) >30}">
																						<td title="${var.file_name}"
																							style="width: 140px; text-align: center">${fn:substring(var.file_name,0, 30)}...</td>
																					</c:when>
																					<c:otherwise>
																						<td title="${var.file_name}"
																							style="width: 140px; text-align: center;">${var.file_name}</td>
																					</c:otherwise>
																				</c:choose>
																				<td style="text-align: center;"><a
																					class="zview" id="view${var.id}"
																					href="javascript:void(0);"
																					target="_blank" onclick="viewPdf('${var.id}')">预览</a><a
																					data-toggle='modal' data-target='#delComAlterFile'
																					onclick="delComAlterFile('${var.id}');"
																					class="delete" href="javascript:void(0);">删除</a> <input
																					id="ViewPath${var.id}"
																					name="ViewPath${var.id}" type="hidden"
																					value="${var.file_path}" /></td>
																			</tr>
																		</c:forEach>
																	</c:when>
																	<c:otherwise>
																		<tr>
																			<td colspan="2" style="text-align: center;"><span
																				style="color: #ff6a00">没有相关记录</span></td>
																		</tr>
																	</c:otherwise>
																</c:choose>
															</tbody>
														</table>
													</div>
													<input id="certificatePath" name="certificatePath"
														type="hidden" value="${certificatePd.file_path}" /> <input
														id="contractPath" name="contractPath" type="hidden"
														value="${contractPd.file_path}" />
													<input id="pdfPath" name="pdfPath" type="hidden" /> <input
														id="pdfName" name="pdfName" type="hidden" />
												</div>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div class="form-group">
				<div class="col-sm-2 col-sm-offset-2" style="margin-top: 40px;">
					<button type="button" onclick="OK();"
						class="btn btn-success btn-block" style="width: 172px">
						<span class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp;${pageMap.toText}
					</button>
				</div>
				<c:if test="${not empty pageMap.fromPage}">
					<div class="col-sm-2" style="margin-top: 40px;">
						<a href="<%=basePath%>${pageMap.fromPage}?&info_id=${pd.info_id}"
							class="btn btn-default btn-block"><span
							class="glyphicon glyphicon-circle-arrow-left"></span>&nbsp;&nbsp;上一步</a>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<!-- 删除企业信息变更情况模态框开始 -->
	<div class="modal_h20 modal fade bs-example-modal-sm in"
		id="delComAlterFile" data-toggle="modal" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="false" data-target="">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<p id="warntext">您确定要删除吗？删除后不可恢复！！</p>
				</div>
				<div class="modal-footer">
					<button id="EduButton" type="button" class="btn btn-success"
						onclick="delFile();">确认</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<input type="hidden" value="" id="delectAltid">
				</div>
			</div>
		</div>
	</div>
	<div class='modal my-modal-alert' id='my-modal-failure-alert'>
			<div class='modal-content'
				style="width: 200px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
				<div class='modal-body' id='modal-body-alert'>
					<img alt="" src="<%=basePath%>shyl/images/fail.png">&nbsp;&nbsp;删除失败!
				</div>
			</div>
		</div>
	</div>
	<div class='modal my-modal-alert' id='my-modal-success-alert'>
		<div class='modal-dialog boxBodySmall'>
			<div class='modal-content'
				style="width: 150px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
				<div class='modal-body' id='modal-body-alert'>
					<img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;删除成功!
				</div>
			</div>
		</div>
	</div>
	<div class='modal my-modal-alert' id='my-modal-errorfile-alert'>
		<div class='modal-dialog boxBodySmall'>
			<div class='modal-content'
				style="width: 260px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
				<div class='modal-body' id='modal-body-alert'>
					<img alt="" src="<%=basePath%>shyl/images/mark.png">&nbsp;&nbsp;预览文件不存在!
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../../common/footer.jsp"%>
	<p id="back-to-top" style="display: block;">
		<a href="#top"><span></span></a>
	</p>
	<script
		src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
	<script
		src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
	<script
		src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
	<script
		src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>shyl/js/mainjs/jquery.showLoading.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>shyl/js/jquery.tips.js"></script>
	<script src="<%=basePath%>shyl/js/jquery.validate.js"></script>
	<script type="text/javascript">
	function progressError(obj){
		$('#'+obj+' .bar').addClass("bar-error").text('上传失败').parent().fadeOut(3000);
	}
	function progress(obj,data){
		var progress = parseInt(data.loaded / data.total * 100, 10);
		 $("#"+obj).show();
		 $('#'+obj+' .bar').removeClass("bar-error").css('width', progress + '%').text(progress==100 ?'文件保存中，请稍等...':progress+'%');
	}
	</script>
	<jsp:include page="../../common/govCatalog.jsp"></jsp:include>
</body>
</html>