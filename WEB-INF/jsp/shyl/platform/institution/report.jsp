<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>
<html>
<head>
<meta charset="utf-8">
<title></title>
<base href="<%=basePath%>">    
<meta charset="UTF-8"/>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"/> -->
<link rel="stylesheet" href="/SHYL/shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/styleRegist.css">
<jsp:include page="../../common/header.jsp"></jsp:include>
<script src="/SHYL/shyl/js/datepicker/WdatePicker.js"
	type="text/javascript"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="shyl/js/images/apply/report.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<style>
a {
	cursor: pointer;
	color: #333;
}

.mypage_tab a:hover, a:focus {
	color: #333;
}

#docNameImpExcel li {
	width: 50%; /*如果显示三列 则width改为30%*/
	float: left;
	display: block;
}

.inputtxt2NNew {
	width: 275px;
	padding-left: 5px;
	border: 1px solid #ccc !important;
	line-height: 34px;
	height: 34px;
	border: 0;
	border-radius: 5px;
	font-size: 0.85em;
}
</style>
<script type="text/javascript">
	var url = ""
	// 合并 $(function(){}) 4
	var pictureindex = 0;
	var pathArray = new Array();
	var person = new Object();
	// 合并 $(function(){}) 5
	var fileindex = 0;
	var pathArray = new Array();
	var person = new Object();
	//隐藏审计报告预览删除
	function hidesjbg() {
		var filename = $("#dddd").attr("filename");
		var fildd = $("#apply_report_namesj").val();
		$("#finame").html(fildd);
		$("#sc a").attr("data-target", "#delSjBg");
		$("#sc a").attr("onclick", "deleteSjBg('${pg.id}')");
		if (filename != null && filename != "") {
			$("#xg").show();
			$("#sc").show();
		}
	}
	function hidewtht() {
		var filename = $("#ssss").attr("filename");
		var fildd = $("#apply_report_namewtht").val();
		$("#wtfiname").html(fildd);
		$("#wtsc a").attr("data-target", "#delWtht");
		$("#wtsc a").attr("onclick", "delWtht('${pt.id}')");
		if (filename != null && filename != "") {
			$("#wtxg").show();
			$("#wtsc").show();
		}
	}
</script>
</head>
<body style="background-color: #f7f7f7;">
	<input type="hidden" value="${pd.contryflag}" id="contry">
	<input type="hidden" value="" id="listurl">
	<input type="hidden" value="" id="inserturl">
	<input type="hidden" value="" id="updateurl">
	<input type="hidden" value="<%=basePath%>" id="baseurl">
	<input type="hidden" value="${lastYear}" id="lastYear">
	<input type="hidden" value="${pageMap.levelMap.levelMenu}" id="levelMenu">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param
				value="2" name="menuType" /></jsp:include>
		<div class="mypage_right">
			<h2 id="title" class="h2_font13">收入汇总表</h2>
			<div class="mypage_tab" style="width: 80%; display: none;" id="years">
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
			<div class="mypage_tab" style="width: 80%; display: none;"
				id="contryyea">
				<div class="hd">
					<ul>
						<li class="on" id="years15"><a href="javascript:void(0);"
							data-var="${previousYear}">国家级</a></li>
					</ul>
				</div>
			</div>
			<p class="pull-right">
				<a data-toggle="modal" data-target="#upExcel" onclick="upExcel();"
					class="btn btn-link hover"><span
					class="btn btn-primary1 fileinput-button"> <span>批量导入</span>
				</span> </a> <a data-toggle="modal" data-target="#wtht"
					class="btn btn-link hover"><span
					class="btn btn-primary1 fileinput-button" onclick="hidewtht()">
						<span>上传委托合同</span>
				</span> </a> <a data-toggle="modal" data-target="#sEdu"
					class="btn btn-link hover"><span
					class="btn btn-primary1 fileinput-button"> <span>添加新合同</span>
				</span> </a>
			</p>
			<div class="jianli">
				<input type="hidden" id="info_id" name="info_id"
					value="${pd.info_id}" />
				<table class="tableclass">
					<thead>
						<tr class="active">
							<th style="width: 7%; text-align: center;">ID</th>
							<th style="width: 13%; text-align: center;">合同登记证书号</th>
							<th style="width: 13%; text-align: center;">合同号</th>
							<th style="width: 14%; text-align: center;">合同名</th>
							<th style="width: 9%; text-align: center;">货币类型</th>
							<th style="width: 9%; text-align: center;">合同金额（万美元）</th>
							<th style="width: 9%; text-align: center;">离岸执行额（万美元）</th>
							<th style="width: 22%; text-align: center;">操作</th>
						</tr>
					</thead>
					<tbody id="tbodyId">
					</tbody>
				</table>
			</div>
			<div>
				<div class="col-sm-2 col-sm-offset-2" style="margin-top: 20px;">
					<button type="button" onclick="OK('${pageMap.toPage}');"
						class="btn btn-success btn-block" style="width: 172px">
						<span class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp;${pageMap.toText}
					</button>
				</div>
				<div class="col-sm-2" style="margin-top: 20px; margin-left: 8px">
					<a onclick="GO('${pageMap.fromPage}');"
						class="btn btn-default btn-block"><span
						class="glyphicon glyphicon-circle-arrow-left"></span>&nbsp;&nbsp;上一步</a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../../common/importExcel.jsp"></jsp:include>
	<div class="modal fade bs-example-modal-sm in" id="sEdu" role="dialog"
		aria-labelledby="sEdu" aria-hidden="false" data-backdrop="static">
		<form action="" id="test1">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							添加合同<small>（&nbsp;<span class="red_tip">*</span>为必填项&nbsp;）
							</small>
						</h4>
					</div>
					<div class="modal-body">
						<div class="form_table_box">
							<table class="table">
								<tbody>
									<tr>
										<th style="width: 195px">合同登记证书号：</th>
										<td colspan="3"><input class="form-control"
											data-val="true" data-val-length="长度<50"
											data-val-length-max="50" data-val-required="*"
											id="certificateNo" name="certificateNo" type="text"
											placeholder="请输入合同登记证书号" maxlength="30" onblur="trim(this);"></td>
									</tr>
									<tr>
										<th style="width: 195px"><span class="red_tip">*</span>合同号：</th>
										<td><input class="form-control" data-val="true"
											data-val-length="长度<50" data-val-length-max="50"
											data-val-required="*" id="contractNo" name="contractNo"
											type="text" placeholder="请输入合同号" maxlength="30"
											onblur="trim(this);"></td>

									</tr>
									<tr>
										<th style="width: 195px"><span class="red_tip">*</span>合同名称：</th>
										<td><input class="form-control" data-val="true"
											data-val-length="长度<50" data-val-length-max="50"
											data-val-required="*" id="contractName" name="contractName"
											type="text" placeholder="请输入合同名称" maxlength="30"
											onblur="trim(this);"></td>
									</tr>
									<tr>
										<th style="width: 195px"><span class="red_tip">*</span>货币类型：</th>
										<td><select class="inputtxt2NNew" name="currency_type"
											id="currency_type">
												<c:forEach items="${currencyList}" var="type">
											<!-- TODO暂时只显示【美元】类型 -->
												<c:if test="${type.DISTINGUISH_ID == 2}">
													<option value="${type.DISTINGUISH_ID}">${type.VALUE}</option>
												</c:if>
											<!-- TODO暂时只显示【美元】类型 -->
												</c:forEach>
										</select></td>
									</tr>
									<tr>
										<th style="width: 195px"><span class="red_tip">*</span>合同金额（万美元）：</th>
										<td><input class="form-control" data-val="true"
											data-val-length="长度<50" data-val-length-max="50"
											data-val-required="*" id="contractMoney" name="contractMoney"
											type="text" placeholder="请输入合同金额（万美元）只允许为数字" maxlength="10"
											onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
											onblur="changeFloat(this);" maxlength="10"
											style="ime-mode: disabled" value="0.00"></td>
									</tr>
									<tr>
										<th style="width: 195px"><span class="red_tip">*</span>离岸执行额（万美元）：</th>
										<td><input class="form-control" data-val="true"
											data-val-length="长度<50" data-val-length-max="50"
											data-val-required="*" id="exportVolume" name="exportVolume"
											type="text" placeholder="请输入离岸执行额（万美元）只允许为数字" maxlength="10"
											onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
											onblur="changeFloat(this);" maxlength="10"
											style="ime-mode: disabled" value="0.00"></td>
									</tr>
									<tr>
										<th>备注：</th>
										<td><input class="form-control" data-val="true"
											data-val-length="长度<50" data-val-length-max="50"
											data-val-required="*" id="remarks" name="remarks"
											placeholder="请输入备注(最多15个字)" maxlength="15"></td>
									</tr>
									<tr>
										<th><span class="red_tip">*</span>相关资料：</th>
										<td><input id="uploadFileId" class="form-control"
											data-val="true" readonly></td>
									</tr>
								</tbody>
							</table>
							<span id="file_upload1" class="btn btn-primary fileinput-button"
								style="margin-top: 5px; margin-left: 220px"> <span>上传相关资料</span>
								<input type="file" id="file_upload1" name="file_upload1"
								multiple> <input type="hidden" id="file_path1"
								name="file_path1">
							</span>
							<div class="help-block"
								style="margin-top: 5px; margin-left: 220px; color: #818590;">支持的文件格式为.pdf</div>
						</div>
					</div>
					<div class="modal-footer">
						<button id="EduButtonedu" type="button" class="btn btn-success"
							onclick="certificateSave()" data-toggle="modal">确认</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
			<input type="reset" style="display: none;" name="reportedu">
		</form>
	</div>
	<!-- 上传审计报告 -->
	<div class="modal fade in" id="ssj" role="dialog"
		aria-labelledby="adoptModal" aria-hidden="false"
		data-backdrop="static">

		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						审计报告上传<small> </small>
					</h4>
				</div>
				<form class="form-horizontal" role="form" action="" method="post"
					id="form1" name="form1">
					<table class="table">
						<tbody>
							<tr>
								<th style="width: 195px"><span class="red_tip">*</span>审计报告：</th>
								<td>
									<div class="row">
										<div class="col-md-12">
											<div>
												<div class="form-group">
													<div class="col-sm-12">
														<ul id="docName" style="float: left;">
															<li id="dddd" filename="${pg.file_name}"><span
																id="finame">${pg.file_name}</span> <span
																style="display: none;" id="xg"><a
																	id="view${pg.id}" href='javascript:void(0);'
																	target='_blank'
																	onclick="return sjbg('view${pg.id}','${pg.id}');"
																	class='zview'>预览</a></span> <span style="display: none;"
																id="sc"><a data-toggle="modal"
																	data-target="#delSjBg" onclick="deleteSjBg('${pg.id}')"
																	class="delete">删除</a></span></li>
														</ul>
													</div>
													<div class="col-sm-5" style="margin-left: 7%">
														<div class="caption" align="center" style="width: 100px;">
															<span id="file_uploadCon"
																class="btn btn-primary fileinput-button"
																style="margin-top: 20px;"> <span>上传审计报告</span> <input
																type="file" id="file_uploadCon" name="file_uploadCon"
																multiple />
															</span>
														</div>
														<div style="margin-top: 5px; color: #818590;">支持的文件格式为.pdf</div>
													</div>
													<input
														style="height: 0.5px; width: 0px; padding: 0px; margin: 0px; position: absolute;"
														maxlength="255" onblur="trim(this);"
														id="apply_report_pathsj" name="apply_report_path"
														type="text" value="${pg.file_path}" /> <input
														style="height: 0.5px; width: 0px; padding: 0px; margin: 0px; position: absolute;"
														maxlength="255" onblur="trim(this);"
														id="apply_report_namesj" name="apply_report_name"
														type="text" value="${pg.file_name}" />
												</div>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="modal-footer">
						<button id="EduButton" type="button" class="btn btn-success"
							onclick="updateSjFile()">确认</button>
						<button type="button" class="btn btn-default" onclick="clear()"
							data-dismiss="modal">关闭</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 上传委托合同 -->
	<div class="modal fade in" id="wtht" role="dialog"
		aria-labelledby="adoptModal" aria-hidden="false">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						委托合同 上传<small> </small>
					</h4>
				</div>
				<form class="form-horizontal" role="form" action="" method="post"
					id="form1" name="form1">
					<table class="table">
						<tbody>
							<tr>
								<th style="width: 195px"><span class="red_tip">*</span>委托合同
									：</th>
								<td>
									<div class="row">
										<div class="col-md-12">
											<div>
												<div class="form-group">
													<div class="col-sm-12">
														<ul id="docNamewtht" style="float: left;">
															<li id="ssss" filename="${pt.file_name}"><span
																id="wtfiname">${pt.file_name}</span> <span id="wtxg"
																style="display: none;"><a id="vie${pt.id}"
																	href='javascript:void(0);' target='_blank'
																	onclick="return wtht('vie${pt.id}','${pt.id}');"
																	class='zview'>预览</a></span> <span id="wtsc"
																style="display: none;"><a data-toggle="modal"
																	data-target="#delWtht" onclick="delWtht('${pt.id}')"
																	class="delete">删除</a></span></li>
														</ul>
													</div>
													<div class="col-sm-5" style="margin-left: 7%">
														<div class="caption" align="center" style="width: 100px;">
															<span id="file_uploadwtht"
																class="btn btn-primary fileinput-button"
																style="margin-top: 20px;"> <span>上传委托合同 </span> <input
																type="file" id="file_uploadwtht" name="file_uploadwtht"
																multiple />
															</span>
														</div>
														<div style="margin-top: 5px; color: #818590;">支持的文件格式为.pdf</div>
													</div>
													<input
														style="height: 0.5px; width: 0px; padding: 0px; margin: 0px; position: absolute;bottom:1000px;"
														id="apply_report_pathwtht" maxlength="255"
														onblur="trim(this);" name="apply_report_pathwtht"
														type="text" value="${pt.file_path}" /> <input
														style="height: 0.5px; width: 0px; padding: 0px; margin: 0px; position: absolute;bottom:1000px;"
														id="apply_report_namewtht" maxlength="255"
														onblur="trim(this);" name="apply_report_pathwtht"
														type="text" value="${pt.file_name}" />
												</div>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="modal-footer">
						<button id="EduButton" type="button" class="btn btn-success"
							onclick="updateWthtFile()">确认</button>
						<button type="button" class="btn btn-default" onclick="Clear()"
							data-dismiss="modal">关闭</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="<%=basePath%>shyl/js/jquery.tips.js"></script>
	<link rel="stylesheet"
		href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
	<link rel="stylesheet"
		href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
	<script
		src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
	<script
		src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
	<script
		src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
	<script
		src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
	<script src="<%=basePath%>shyl/js/mainjs/errImage.js"
		type="text/javascript"></script>
	<!-- 添加合同结束 -->
	<!-- 修改合同模态框开始 -->
	<div class="modal fade in" id="eEdu" role="dialog"
		aria-labelledby="eEdu" aria-hidden="false" data-backdrop="static">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						修改合同<small>（&nbsp;<span class="red_tip">*</span>为必填项&nbsp;）
						</small>
					</h4>
				</div>
				<div class="modal-body">
					<div class="form_table_box">
						<table class="table">
							<tbody>
								<tr>
									<th style="width: 195px">合同登记证书号：</th>
									<td colspan="3"><input class="form-control"
										data-val="true" data-val-length="长度<50"
										data-val-length-max="50" data-val-required="*"
										id="certificateNoUpd" name="certificateNoUpd" type="text"
										value="" placeholder="请输入合同登记证书号" maxlength="50"
										onblur="trim(this);"></td>
								</tr>
								<tr>
									<th style="width: 195px"><span class="red_tip">*</span>合同号：</th>
									<td><input class="form-control" data-val="true"
										data-val-length="长度<50" data-val-length-max="50"
										data-val-required="*" id="contractNoUpd" name="contractNoUpd"
										type="text" value="" placeholder="请输入合同号" maxlength="50"
										onblur="trim(this);"></td>

								</tr>
								<tr>
									<th style="width: 195px"><span class="red_tip">*</span>合同名称：</th>
									<td><input class="form-control" data-val="true"
										data-val-length="长度<50" data-val-length-max="50"
										data-val-required="*" id="contractNameUpd"
										name="contractNameUpd" type="text" value=""
										placeholder="请输入合同名称" maxlength="50" onblur="trim(this);"></td>
								</tr>
								<tr>
									<th style="width: 195px"><span class="red_tip">*</span>货币类型：</th>
									<td><select class="inputtxt2NNew" name="currencyTypeUpd"
										id="currencyTypeUpd">
											<c:forEach items="${currencyList}" var="type">
											<!-- TODO暂时只显示【人民币】类型 -->
												<c:if test="${type.DISTINGUISH_ID == 2}">
													<option value="${type.DISTINGUISH_ID}">${type.VALUE}</option>
												</c:if>
											<!-- TODO暂时只显示【人民币】类型 -->
											</c:forEach>
									</select></td>
								</tr>

								<tr>
									<th style="width: 195px"><span class="red_tip">*</span>合同金额（万美元）：</th>
									<td><input class="form-control" data-val="true"
										data-val-length="长度<50" data-val-length-max="50"
										data-val-required="*" id="contractMoneyUpd"
										name="contractMoneyUpd" type="text" value=""
										placeholder="请输入合同金额（万美元）只允许为数字" maxlength="10"
										onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
										onblur="changeFloat(this);" maxlength="10"
										style="ime-mode: disabled" value="0.00"></td>
								</tr>
								<tr>
									<th style="width: 195px"><span class="red_tip">*</span>离岸执行额（万美元）：</th>
									<td><input class="form-control" data-val="true"
										data-val-length="长度<50" data-val-length-max="50"
										data-val-required="*" id="exportVolumeUpd"
										name="exportVolumeUpd" type="text" value=""
										placeholder="请输入离岸执行额（万美元）只允许为数字" maxlength="10"
										onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
										onblur="changeFloat(this);" maxlength="10"
										style="ime-mode: disabled" value="0.00"></td>
								</tr>
								<tr>
									<th>备注：</th>
									<td><input class="form-control" data-val="true"
										data-val-length="长度<50" data-val-length-max="50"
										data-val-required="*" id="remarksUpd" name="remarksUpd"
										type="text" value="" placeholder="请输入备注(最多15个字)"
										maxlength="15" onblur="trim(this);"></td>
								</tr>
								<tr>
									<th><span class="red_tip">*</span>相关资料：</th>
									<td><input id="fileUpd" name="fileUpd"
										class="form-control" data-val="true" readonly></td>
								</tr>
							</tbody>
						</table>
						<span id="file_upload" class="btn btn-primary fileinput-button"
							style="margin-top: 5px; margin-left: 220px"> <span>上传相关资料</span>
							<input type="file" id="file_upload2" name="file_upload2" multiple>
							<input type="hidden" id="file_path2" name="file_path2">
						</span>
						<div class="help-block"
							style="margin-top: 5px; margin-left: 220px">支持的文件格式为.pdf</div>
					</div>
					<input id="cerid" name="cerid" type="hidden" value="">

				</div>
				<div class="modal-footer">
					<button id="EduButton" type="button" class="btn btn-success"
						onclick="updateCon()">确认</button>
					<button type="button" class="btn btn-default" onclick="Clear()"
						data-dismiss="modal">关闭</button>
				</div>
				<script type="text/javascript" src="shyl/js/jquery.validate.js"></script>
				<script src="shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
				<script src="shyl/fileupload/js/jquery.fileupload.js"></script>
				<script src="shyl/fileupload/js/jquery.fileupload-process.js"></script>
				<script src="shyl/fileupload/js/jquery.fileupload-validate.js"></script>
				<script src="shyl/fileupload/js/jquery.iframe-transport.js"></script>
				<script type="text/javascript" src="shyl/js/jquery.tips.js"></script>
			</div>
		</div>
	</div>
	<!-- 修改合同模态框结束-->
	<!--上传文件模态框开始-->
	<script src="shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
	<script src="shyl/fileupload/js/jquery.fileupload.js"></script>
	<script src="shyl/fileupload/js/jquery.fileupload-process.js"></script>
	<script src="shyl/fileupload/js/jquery.fileupload-validate.js"></script>
	<script src="shyl/fileupload/js/jquery.iframe-transport.js"></script>
	<!--上传文件模态框结束-->
	<!-- 删除合同模态框开始 -->
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
					<h4>您确定要删除吗？删除后不可恢复！！</h4>
					<br> <br>
				</div>
				<input id="Conid" name="Conid" type="hidden" value="">
				<div class="modal-footer">
					<button id="EduButton" type="button" class="btn btn-success"
						onclick="Delete()" data-dismiss="modal">确认</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<input type="hidden" value="" id="delectinfoid">
				</div>
			</div>
		</div>
	</div>
	<!-- 删除合同模态框框结束 -->
	<!-- 删除审计报告模态框开始 -->
	<div class="modal fade in" id="delSjBg" role="dialog"
		aria-labelledby="deledu" aria-hidden="false" data-backdrop="static">
		<div class="modal-dialog  modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						onclick="colosesjbg()">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<h4>您确定要删除吗？删除后不可恢复！！</h4>
					<br> <br>
				</div>
				<input id="Conid" name="Conid" type="hidden" value="">
				<div class="modal-footer">
					<button id="EduButton" type="button" class="btn btn-success"
						onclick="delSjBg()" data-dismiss="modal">确认</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<input type="hidden" value="" id="defauinfo_id">
				</div>
			</div>
		</div>
	</div>
	<!-- 删除委托合同 -->
	<div class="modal fade in" id="delWtht" role="dialog"
		aria-labelledby="deledu" aria-hidden="false" data-backdrop="static">
		<div class="modal-dialog  modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						onclick="colosewtht()">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<h4>您确定要删除吗？删除后不可恢复！！</h4>
					<br> <br>
				</div>
				<input id="Conid" name="Conid" type="hidden" value="">
				<div class="modal-footer">
					<button id="wthtbutton" type="button" class="btn btn-success"
						onclick="delWTHT()" data-dismiss="modal">确认</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<input type="hidden" value="" id="defauwthtinfo_id">
				</div>
			</div>
		</div>
	</div>
	<!-- 提示上传信息模态框（Modal）开始 -->
	<div class="modal fade in" id="promptModal" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">上传文件温馨提示</h4>
				</div>
				<div class="modal-body">
					支持的文件<font color="red">小于1MB</font><br /> 支持的文件格式为<font
						color="red">.jpg、.png、.jpeg、.gif</font><br /> <br />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 提示上传信息模态框（Modal）结束 -->
	<div class='modal my-modal-alert' id='my-modal-success-alert'>
		<div class='modal-dialog boxBodySmall'>
			<div class='modal-content'
				style="width: 260px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
				<div class='modal-body' id='modal-body-alert'>
					<img alt="" src="<%=basePath%>shyl/images/mark.png">&nbsp;&nbsp;预览文件不存在!
				</div>
			</div>
		</div>
	</div>
	<!--上传文件合同模态框结束-->
	<div class="clear"></div>
	<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
</html>
