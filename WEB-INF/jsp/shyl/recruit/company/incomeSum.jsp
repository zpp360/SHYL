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
	<link rel="stylesheet" href="<%=basePath%>shyl/css/maincss/showLoading.css"> 
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js"
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
    display:none;
    float:left;
   /*  visibility:hidden */
}
.bar {
    height: 11px;
    border-radius: 6px;
    -webkit-border-radius: 6px;
    background: #428bca;
    color: #ffffff;
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 12px;
    padding: 0px;
    line-height: 11px;
    text-align: center;
}
.bar-error{
  width:100%;
  background:#f44336;
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
			<h2 class="h2_font13"><img id="catalogTree" src="<%=basePath%>/shyl/images/catalog.png" style="margin-bottom: 5px;"/>${lastYear}年度收入汇总表</h2>
			<div class="panel-heading">
				<form
					action="<%=basePath%>govUploadCommon/saveIncomeSummaryFile.act"
					class="form-inline" method="post" id="form1">
					<input type="hidden" name="info_id" id="info_id"
						value="${pd.info_id}" />
					<!-- 下一页 -->
					<input type="hidden" name="toPage" value="${pageMap.toPage}">
<%-- 				<input type="hidden" name="isCertificateModify" value="${pd.isCertificateModify}">
					<input type="hidden" name="isExpenseModify" value="${pd.isExpenseModify}">
					<input type="hidden" name="isContractModify" value="${pd.isContractModify}">
					<input type="hidden" name="isSettlementModify" value="${pd.isSettlementModify}"> --%>
					<span style="font-size: 12px; padding-left: 10px;margin-right:100px; display: inline-block; vertical-align: bottom;border:1px solid #d2c7c7; width:87%">
								<label style="color: red; ">※温馨提示：</label><label style="">合同资料和涉外收入资料文件如果过大的话，可以分割成多个文件上传。</label>
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
															<span style="margin-top: 50px;margin-right: 30px;">合同目录：</span>
															<a class="btn btn-link hover"><span
																class="btn btn-primary1 fileinput-button"
																style="width: 70px;"><span>上传</span><input
																	type="file" id="file_upload1" name="file_upload1"
																	multiple /></span></a>
															<span style="margin-top: 50px;font-size: 0.7em;color: red;">
															<font color="red">※</font>应至少包括：序号、合同号、合同名称、合同金额（万美元）以及执行额（万美元）</span>
															 <div id="progress1" class="progress" >
																<div class="bar" style="width: 0%;"></div>
															 </div>
														 <div style="margin-left: 240px; color: #818590;font-size: 0.7em;">支持的文件格式为.pdf</div>
														</div>
													</div>
													
													<div class="col-sm-12">
														<ul style="float: left;margin-left:30px" id="certificateFile">
															<li><span id="pdfShowName">${certificatePd.file_name}</span>
																<input type="hidden" id="certificate_type" value="${pd.certificate_type}"/>
																<span
																<c:if test="${empty certificatePd.file_name}"> style="display: none;"</c:if>
																id="xg"><a id="pdfcertificateView"
																	href='javascript:void(0);' target='_blank'
																	onclick="return viewPdf('0','0');" class='zview'>预览</a></span> <span
																<c:if test="${empty certificatePd.file_name}"> style="display: none;"</c:if>
																id="sc"><a id="pdfDelete1" data-toggle='modal' data-target='#delComAlterFile' onclick="delComAlterFile('${certificatePd.id}');"
																	class="delete" style="cursor: pointer;">删除</a></span></li>
															<li></li>
														</ul>
													</div>
													<div class="col-sm-10">
														<div class="caption" align="left"
															style="width: 500px; padding-top: 20px;">
															<span style="margin-top: 50px;margin-right: 30px;">合同资料：</span>
															<a class="btn btn-link hover"><span
																class="btn btn-primary1 fileinput-button"
																style="width: 70px;"><span>上传</span><input
																	type="file" id="file_upload2" name="file_upload2"
																	multiple /></span></a>
																	<span style="margin-top: 50px;font-size: 0.7em;color: red;">
															<font color="red">※</font>可以上传多个文件，文件格式为.pdf</span>
															<div id="progress2" class="progress" >
																<div class="bar" style="width: 0%;"></div>
															 </div>
														</div>
													</div>
													<div class="col-sm-12">
													<table class="tableclass" style="margin-left: 15px;width:60%">
														<thead>
															<tr>
																<th style="width: 500px; text-align: center;">上传文件名</th>
																<th style="width: 200px; text-align: center;">操作</th>
															</tr>
														</thead>
														<tbody id="fileID">
															<c:choose>
																<c:when test="${not empty expensePdList}">
																	<c:forEach items="${expensePdList}" var="var" varStatus="vs">
																		<tr>
																			<c:choose>
																				<c:when test="${fn:length(var.file_name) >30}">
																					<td title="${var.file_name}" style="width: 140px; taxt-align: center">${fn:substring(var.file_name,0, 30)}...</td>
																				</c:when>
																				<c:otherwise>
																					<td title="${var.file_name}"
																						style="width: 140px; text-align: center;">${var.file_name}</td>
																				</c:otherwise>
																			</c:choose>
																			<td style="text-align: center;"><a class="zview"
																				id="view${var.id}" href="<%=basePath%>register/showPdf.act?pdfFile=${var.file_path}" target="_blank"
																				onclick="return viewPdf('1','${vs.index}');">预览</a><a data-toggle='modal'
																				data-target='#delComAlterFile' onclick="delComAlterFile('${var.id}');" class="delete" href="javascript:void(0);">删除</a> 
																			<input id="expensePath${vs.index}" name="expensePath${vs.index}" type="hidden" value="${var.file_path}" />
																			</td>
																		</tr>
																	</c:forEach>
																</c:when>
																<c:otherwise>
																	<tr>
																		<td colspan="2" style="text-align: center;"><span style="color: #ff6a00">没有相关记录</span></td>
																	</tr>
																</c:otherwise>
															</c:choose>
														</tbody>
													</table>
													<input type="hidden" id="expense_type" value="${pd.expense_type}"/>
	<%-- 													<ul style="float: left;" id="expenseFile">
															<li><span id="pdfShowName">${expensePd.file_name}</span>
																<span
																<c:if test="${empty expensePd.file_name}"> style="display: none;"</c:if>
																id="xg"><a id="pdfexpenseView"
																	href='javascript:void(0);' target='_blank'
																	onclick="return viewPdf(1);" class='zview'>预览</a></span> <span
																<c:if test="${empty expensePd.file_name}"> style="display: none;"</c:if>
																id="sc"><a id="pdfDelete2" style="cursor: pointer;"
																	onclick="delFile('${expensePd.id}');" class="delete">删除</a></span>
															</li>
															<li></li>
														</ul> --%>
													</div>
													<div class="col-sm-10">
														<div class="caption" align="left"
															style="width: 670px; padding-top: 20px; padding-bottom: 30px;">
															<span style="margin-top: 50px">涉外收入目录：</span>
															<a class="btn btn-link hover"><span
																class="btn btn-primary1 fileinput-button"
																style="width: 70px;"><span>上传</span><input
																	type="file" id="file_upload3" name="file_upload3"
																	multiple /></span></a>
															<span style="margin-top: 50px;font-size: 0.7em;color: red;">
															<font color="red">※</font>应至少包括：序号、币种、金额以及收入日期</span>
															<div id="progress3" class="progress" >
																<div class="bar" style="width: 0%;"></div>
															 </div>
															 <div style="margin-left: 240px; color: #818590;font-size: 0.7em;">支持的文件格式为.pdf</div>
														</div>
													</div>
													<div class="col-sm-12">
														<ul style="float: left;margin-left:30px" id="contractFile">
															<li><span id="pdfShowName">${contractPd.file_name}</span>
																<input type="hidden" id="contract_type" value="${pd.contract_type}"/>
																<span
																<c:if test="${empty contractPd.file_name}"> style="display: none;"</c:if>
																id="xg"><a id="pdfcontratView"
																	href='javascript:void(0);' target='_blank'
																	onclick="return viewPdf('2','0');" class='zview'>预览</a></span> <span
																<c:if test="${empty contractPd.file_name}"> style="display: none;"</c:if>
																id="sc"><a id="pdfDelete3" data-toggle='modal' data-target='#delComAlterFile' onclick="delComAlterFile('${contractPd.id}');"
																 style="cursor: pointer;" class="delete">删除</a></span>
															</li>
															<li></li>
														</ul>
													</div>
													<div class="col-sm-10">
														<div class="caption" align="left"
															style="width: 500px; padding-top: 20px;">
															<span style="margin-top: 50px;">涉外收入资料：</span>
															<a class="btn btn-link hover"><span
																class="btn btn-primary1 fileinput-button"
																style="width: 70px;"><span>上传</span><input
																	type="file" id="file_upload4" name="file_upload4"
																	multiple /></span></a>
																	<span style="margin-top: 50px;font-size: 0.7em;color: red;">
															<font color="red">※</font>可以上传多个文件，文件格式为.pdf</span>
															<div id="progress4" class="progress" >
																<div class="bar" style="width: 0%;"></div>
															 </div>
														</div>
													</div>
													<div class="col-sm-12">
													<table class="tableclass" style="margin-left: 15px;width:60%">
														<thead>
															<tr>
																<th style="width: 500px; text-align: center;">上传文件名</th>
																<th style="width: 200px; text-align: center;">操作</th>
															</tr>
														</thead>
														<tbody id="fileID">
															<c:choose>
																<c:when test="${not empty settlementPdList}">
																	<c:forEach items="${settlementPdList}" var="var" varStatus="vs">
																		<tr>
																			<c:choose>
																				<c:when test="${fn:length(var.file_name) >30}">
																					<td title="${var.file_name}" style="width: 140px; taxt-align: center">${fn:substring(var.file_name,0, 30)}...</td>
																				</c:when>
																				<c:otherwise>
																					<td title="${var.file_name}"
																						style="width: 140px; text-align: center;">${var.file_name}</td>
																				</c:otherwise>
																			</c:choose>
																			<td style="text-align: center;"><a class="zview"
																				id="view${var.id}" href="<%=basePath%>register/showPdf.act?pdfFile=${var.file_path}" target="_blank"
																				onclick="return viewPdf('3','${vs.index}');">预览</a><a data-toggle='modal'
																				data-target='#delComAlterFile' onclick="delComAlterFile('${var.id}');" class="delete" href="javascript:void(0);">删除</a> 
																			<input id="settlementPath${vs.index}" name="settlementPath${vs.index}" type="hidden" value="${var.file_path}" />
																			</td>
																		</tr>
																	</c:forEach>
																</c:when>
																<c:otherwise>
																	<tr>
																		<td colspan="2" style="text-align: center;"><span style="color: #ff6a00">没有相关记录</span></td>
																	</tr>
																</c:otherwise>
															</c:choose>
														</tbody>
													</table>
													<input type="hidden" id="settlement_type" value="${pd.settlement_type}"/>
			<%-- 											<ul style="float: left;" id="settlementFile">
															<li><span id="pdfShowName">${settlementPd.file_name}</span>
																<span
																<c:if test="${empty settlementPd.file_name}"> style="display: none;"</c:if>
																id="xg"><a id="pdfsettlementView"
																	href='javascript:void(0);' target='_blank'
																	onclick="return viewPdf(3);" class='zview'>预览</a></span> <span
																<c:if test="${empty settlementPd.file_name}"> style="display: none;"</c:if>
																id="sc"><a id="pdfDelete4" style="cursor: pointer;"
																	onclick="delFile('${settlementPd.id}');" class="delete">删除</a></span>
															</li>
															<li></li>
														</ul> --%>
													</div>
													 <input id="certificatePath" name="certificatePath" type="hidden" value="${certificatePd.file_path}" /> 
													 <input id="contractPath" name="contractPath" type="hidden" value="${contractPd.file_path}" /> 
<%-- 													<input id="pdfPaths" name="pdfPaths" type="hidden"
														value="${resPd.file_path}" /> <input id="certificatePath"
														name="certificatePath" type="hidden"
														value="${certificatePd.file_path}" /> <input
														id="certificateName" name="certificateName" type="hidden"
														value="${certificatePd.file_name}" /> <input
														id="contractName" name="contractName" type="hidden"
														value="${contractPd.file_name}" />  <input id="expenseName"
														name="expenseName" type="hidden"
														value="${expensePd.file_name}" /> <input id="settlementPath"
														name="settlementPath" type="hidden"
														value="${settlementPd.file_path}" /> <input id="settlementName"
														name="settlementName" type="hidden"
														value="${settlementPd.file_name}" /> --%>
													<input id="pdfPath" name="pdfPath" type="hidden"/>
													<input id="pdfName" name="pdfName" type="hidden"/>
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
	<div class="modal_h20 modal fade bs-example-modal-sm in" id="delComAlterFile" data-toggle="modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="false" data-target="">
	<div class="modal-dialog modal-sm">
	   <div class="modal-content">
	       <div class="modal-header">
	           <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
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
		<div class='modal-dialog boxBodySmall'>
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
	<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
	<script
		src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
	<script
		src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
	<script
		src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
	<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.showLoading.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>shyl/js/jquery.tips.js"></script>
	<script src="<%=basePath%>shyl/js/jquery.validate.js"></script>
	<script type="text/javascript">
	var pictureindex = 0;
	var pathArray = new Array();
	function progressError(obj){
		$('#'+obj+' .bar').addClass("bar-error").text('上传失败').parent().fadeOut(3000);
	}
	function progress(obj,data){
		var progress = parseInt(data.loaded / data.total * 100, 10);
		 $("#"+obj).show();
		 $('#'+obj+' .bar').removeClass("bar-error").css('width', progress + '%').text(progress==100 ?'文件保存中，请稍等...':progress+'%');
	}
	$(function() {
		$("#file_upload1").fileupload({
			 autoUpload: true,
			 maxNumberOfFiles : 1,
			 url: '<%=basePath%>platform/uploadSjBc.act',
	       sequentialUploads: true
		 }).bind('fileuploadchange', function (e, data) {
			 if(data.files.length > 1){
				 $("#file_upload1").tips({
					 side : 2,
					 msg : "只能上传一个文件。",
					 bg : '#AE81FF',
					 time : 2
				 });
	          return false;
			 }
		}).bind('fileuploadprogress', function (e, data) {
			progress('progress1',data);
		}).bind('fileuploaddone', function (e, data) {
	  	 if("no"==data.result){
		   		 $("#file_upload1").tips({
						 side : 2,
						 msg : "请上传格式为.pdf格式的文件。",
						 bg : '#AE81FF',
						 time : 2
					 });
		   		progressError('progress1');
		   		 return false;
	  	 }else if("nosize"==data.result){
	   		 $("#file_upload1").tips({
				 side : 2,
				 msg : "请上传小于150MB的文件。",
				 bg : '#AE81FF',
				 time : 2
			 });
   		     return false;
		 } else {
/* 		   		index = ++pictureindex;
		   		var img = new Object();
		   		img.id = index;
				img.name = data.originalFiles[0].name;
				img.path = data.result;
		   		 // 设定pdf路径
		   		 $("#certificatePath").val(data.result);
		   		 // 设定pdf名称
		   		 $("#certificateName").val(data.originalFiles[0].name);
		   		 $("#certificateFile").children().remove();
			   	 $("#certificateFile").append(uphtml1(data.result,data.originalFiles[0].name,index)); */
			   	if(data.result!=undefined && data.result!=""){
			   		 // 设定pdf路径
			   		 $("#pdfPath").val(data.result);
			   		 // 设定pdf名称
			   		 $("#pdfName").val(data.originalFiles[0].name);
			   		 var path=$("#pdfPath").val();
			   		//通过Ajax向后台传值
			   		$.ajax({
			   			type : "POST",
			   			url : "<%=basePath%>govUploadCommon/saveSingleUpLoadFileAjax.act",
			   			data : {
			   				pdfPath : $("#pdfPath").val(),
			   				pdfName : $("#pdfName").val(),
			   				file_type : $("#certificate_type").val(),
			   				info_id : $("#info_id").val()
			   			},
			   			dataType : 'json',
			   			cache : false,
			   			success : function(data) {
			   				$('#progress1 .bar').text('完成').parent().fadeOut(3000);
			   				location.reload();
			   			},error:function(){
			   				progressError('progress1');
			   				location.reload();
			   			}
			   			
			   		});
		   		}else{
		   			location.reload();
		   		}
		   	 }
	   });
		$("#file_upload2").fileupload({
			 autoUpload: true,
			 maxNumberOfFiles : 1,
			 url: '<%=basePath%>platform/uploadSjBc.act',
	       sequentialUploads: true
		 }).bind('fileuploadchange', function (e, data) {
			 if(data.files.length > 1){
				 $("#file_upload2").tips({
					 side : 2,
					 msg : "只能上传一个文件。",
					 bg : '#AE81FF',
					 time : 2
				 });
	          return false;
			 }
	   }).bind('fileuploadprogress', function (e, data) {
			progress('progress2',data);
		}).bind('fileuploaddone', function (e, data) {
	  	 if("no"==data.result){
		   		 $("#file_upload2").tips({
						 side : 2,
						 msg : "请上传格式为.pdf格式的文件。",
						 bg : '#AE81FF',
						 time : 2
					 });
		   		progressError('progress2');
		   		 return false;
	  	 }else if("nosize"==data.result){
	   		 $("#file_upload2").tips({
				 side : 2,
				 msg : "文件已超过150MB，请分开上传。",
				 bg : '#AE81FF',
				 time : 2
			 });
	   		progressError('progress2');
   		 return false;
		} else {
/* 		   		index = ++pictureindex;
		   		var img = new Object();
		   		img.id = index;
				img.name = data.originalFiles[0].name;
				img.path = data.result;
				pathArray.push(img);
		   		 // 设定pdf路径
		   		 $("#expensePath").val(data.result);
		   		 // 设定pdf名称
		   		 $("#expenseName").val(data.originalFiles[0].name);
		   		 $("#expenseFile").children().remove();
			   	 $("#expenseFile").append(uphtml2(data.result,data.originalFiles[0].name,index)); */
			   	if(data.result!=undefined && data.result!=""){
		   		 // 设定pdf路径
		   		 $("#pdfPath").val(data.result);
		   		 // 设定pdf名称
		   		 $("#pdfName").val(data.originalFiles[0].name);
		   		 var path=$("#pdfPath").val();
		   		 
		   		//通过Ajax向后台传值
		   		$.ajax({
		   			type : "POST",
		   			url : "<%=basePath%>govUploadCommon/saveUpLoadFileAjax.act",
		   			data : {
		   				pdfPath : $("#pdfPath").val(),
		   				pdfName : $("#pdfName").val(),
		   				file_type : $("#expense_type").val(),
		   				info_id : $("#info_id").val()
		   			},
		   			dataType : 'json',
		   			cache : false,
		   			success : function(data) {
		   				$('#progress2 .bar').text('完成').parent().fadeOut(3000);
		   				location.reload();
		   			},error:function(){
		   				progressError('progress2');
		   				location.reload();
		   			}
		   			
		   		});
		   		}else{
		   			location.reload();
		   		}
		   	 }
	   });
		$("#file_upload3").fileupload({
			 autoUpload: true,
			 maxNumberOfFiles : 1,
			 url: '<%=basePath%>platform/uploadSjBc.act',
	       sequentialUploads: true
		 }).bind('fileuploadchange', function (e, data) {
			 if(data.files.length > 1){
				 $("#file_upload3").tips({
					 side : 2,
					 msg : "只能上传一个文件。",
					 bg : '#AE81FF',
					 time : 2
				 });
	          return false;
			 }
	   }).bind('fileuploadprogress', function (e, data) {
			progress('progress3',data);
		}).bind('fileuploaddone', function (e, data) {
	  	 if("no"==data.result){
		   		 $("#file_upload3").tips({
						 side : 2,
						 msg : "请上传格式为.pdf格式的文件。",
						 bg : '#AE81FF',
						 time : 2
					 });
		   		progressError('progress3');
		   		 return false;
	  	}else if("nosize"==data.result){
	   		 $("#file_upload3").tips({
				 side : 2,
				 msg : "请上传小于150MB的文件。",
				 bg : '#AE81FF',
				 time : 2
			 });
  		     return false;
		} else {
/* 		   		index = ++pictureindex;
		   		var img = new Object();
		   		img.id = index;
				img.name = data.originalFiles[0].name;
				img.path = data.result;
				pathArray.push(img);
		   		 // 设定pdf路径
		   		 $("#contractPath").val(data.result);
		   		 // 设定pdf名称
		   		 $("#contractName").val(data.originalFiles[0].name);
		   		 $("#contractFile").children().remove();
			   	 $("#contractFile").append(uphtml3(data.result,data.originalFiles[0].name,index)); */
			   	if(data.result!=undefined && data.result!=""){
		   		 // 设定pdf路径
		   		 $("#pdfPath").val(data.result);
		   		 // 设定pdf名称
		   		 $("#pdfName").val(data.originalFiles[0].name);
		   		 var path=$("#pdfPath").val();
		   		 
		   		//通过Ajax向后台传值
		   		$.ajax({
		   			type : "POST",
		   			url : "<%=basePath%>govUploadCommon/saveSingleUpLoadFileAjax.act",
		   			data : {
		   				pdfPath : $("#pdfPath").val(),
		   				pdfName : $("#pdfName").val(),
		   				file_type : $("#contract_type").val(),
		   				info_id : $("#info_id").val()
		   			},
		   			dataType : 'json',
		   			cache : false,
		   			success : function(data) {
		   				$('#progress3 .bar').text('完成').parent().fadeOut(3000);
		   				location.reload();
		   			},error:function(){
		   				progressError('progress3');
		   				location.reload();
		   			}
		   		});
			   	}else{
		   			location.reload();
		   		}
		   	 }
	   });
		$("#file_upload4").fileupload({
			 autoUpload: true,
			 maxNumberOfFiles : 1,
			 url: '<%=basePath%>platform/uploadSjBc.act',
	       sequentialUploads: true
		 }).bind('fileuploadchange', function (e, data) {
			 if(data.files.length > 1){
				 $("#file_upload4").tips({
					 side : 2,
					 msg : "只能上传一个文件。",
					 bg : '#AE81FF',
					 time : 2
				 });
	          return false;
			 }
	   }).bind('fileuploadprogress', function (e, data) {
			progress('progress4',data);
		}).bind('fileuploaddone', function (e, data) {
	  	 if("no"==data.result){
		   		 $("#file_upload4").tips({
						 side : 2,
						 msg : "请上传格式为.pdf格式的文件。",
						 bg : '#AE81FF',
						 time : 2
					 });
		   		progressError('progress4');
		   		 return false;
	  	}else if("nosize"==data.result){
	   		 $("#file_upload4").tips({
				 side : 2,
				 msg : "文件已超过150MB，请分开上传。",
				 bg : '#AE81FF',
				 time : 2
			 });
	   		progressError('progress4');
  		 return false;
		} else {
/* 		   		index = ++pictureindex;
		   		var img = new Object();
		   		img.id = index;
				img.name = data.originalFiles[0].name;
				img.path = data.result;
				pathArray.push(img);
		   		 // 设定pdf路径
		   		 $("#settlementPath").val(data.result);
		   		 // 设定pdf名称
		   		 $("#settlementName").val(data.originalFiles[0].name);
		   		 $("#settlementFile").children().remove();
			   	 $("#settlementFile").append(uphtml4(data.result,data.originalFiles[0].name,index)); */
			   	if(data.result!=undefined && data.result!=""){
			   		 // 设定pdf路径
			   		 $("#pdfPath").val(data.result);
			   		 // 设定pdf名称
			   		 $("#pdfName").val(data.originalFiles[0].name);
			   		 var path=$("#pdfPath").val();
			   		 
			   		//通过Ajax向后台传值
			   		$.ajax({
			   			type : "POST",
			   			url : "<%=basePath%>govUploadCommon/saveUpLoadFileAjax.act",
			   			data : {
			   				pdfPath : $("#pdfPath").val(),
			   				pdfName : $("#pdfName").val(),
			   				file_type : $("#settlement_type").val(),
			   				info_id : $("#info_id").val()
			   			},
			   			dataType : 'json',
			   			cache : false,
			   			success : function(data) {
			   				$('#progress4 .bar').text('完成').parent().fadeOut(3000);
			   				location.reload();
			   			},error:function(){
			   				progressError('progress4');
			   				location.reload();
			   			}
			   		});
				}else{
		   			location.reload();
		   		}
		   	 }
	   });
	});
	
/* 	function uphtml1(filePath,OriginalFileName,index){
		var html= '<li><span id="pdfcertificateName">'+OriginalFileName+'</span><span>';
		   html+='<a id="pdfcertificateView" href="javascript:void(0);" target="_blank" onclick="return viewPdf(0);"class="zview">预览</a>';
			html+='</span><a id="pdfDelete1" onclick="deleteLocalFile1('+index+');" class="delete" style="cursor: pointer;">删除</a>';
	        html+='</li>';
		return html;
	}
	function uphtml2(filePath,OriginalFileName,index){
		var html= '<li><span id="pdfexpenseName">'+OriginalFileName+'</span><span>';
		   html+='<a id="pdfexpenseView" href="javascript:void(0);" target="_blank" onclick="return viewPdf(1);"class="zview">预览</a>';
			html+='</span><a id="pdfDelete1" onclick="deleteLocalFile2('+index+');" class="delete" style="cursor: pointer;">删除</a>';
	        html+='</li>';
		return html;
	}
	function uphtml3(filePath,OriginalFileName,index){
		var html= '<li><span id="pdfcontractName">'+OriginalFileName+'</span><span>';
		   html+='<a id="pdfcontratView" href="javascript:void(0);" target="_blank" onclick="return viewPdf(2);"class="zview">预览</a>';
			html+='</span><a id="pdfDelete1" onclick="deleteLocalFile3('+index+');" class="delete" style="cursor: pointer;">删除</a>';
	        html+='</li>';
		return html;
	}
	function uphtml4(filePath,OriginalFileName,index){
		var html= '<li><span id="pdfsettlementName">'+OriginalFileName+'</span><span>';
		   html+='<a id="pdfsettlementView" href="javascript:void(0);" target="_blank" onclick="return viewPdf(3);"class="zview">预览</a>';
			html+='</span><a id="pdfDelete1" onclick="deleteLocalFile4('+index+');" class="delete" style="cursor: pointer;">删除</a>';
	        html+='</li>';
		return html;
	} */
	
	function deleteLocalFile1(index){
    	for (var i =0;i<pathArray.length;i++) {
    		if (index == pathArray[i].id) {
    			pathArray.splice(i,1);
    			break;
    		}
    	}
    	$("#certificatePath").val('');
    	$("#certificateName").val('');
    	$("#certificateFile").children().remove();
    }
	   function deleteLocalFile2(index){
	    	for (var i =0;i<pathArray.length;i++) {
	    		if (index == pathArray[i].id) {
	    			pathArray.splice(i,1);
	    			break;
	    		}
	    	}
	    	$("#expensePath").val('');
	    	$("#expenseName").val('');
	    	$("#expenseFile").children().remove();	
	    }
	   function deleteLocalFile3(index){
	    	for (var i =0;i<pathArray.length;i++) {
	    		if (index == pathArray[i].id) {
	    			pathArray.splice(i,1);
	    			break;
	    		}
	    	}
	    	$("#contractPath").val('');
	    	$("#contractName").val('');
	    	$("#contractFile").children().remove();
	    }
	   function deleteLocalFile4(index){
	    	for (var i =0;i<pathArray.length;i++) {
	    		if (index == pathArray[i].id) {
	    			pathArray.splice(i,1);
	    			break;
	    		}
	    	}
	    	$("#settlementPath").val('');
	    	$("#settlementName").val('');
	    	$("#settlementFile").children().remove();
	    }
	function OK() {
		 $("#form1").attr('action','<%=basePath%>govUploadCommon/toNextPage.act');
		 $("#form1").submit();
	 }
	// 预览PDF
    function viewPdf(id,subid) {
		var path;
 		if(id==0){
			path = $("#certificatePath").val();
		}else if(id==1){
			path = $("#expensePath"+subid).val();
		}else if(id==2){
			path = $("#contractPath").val();
		}else if(id==3){
			path = $("#settlementPath"+subid).val();
		} 
		var ret=false;
    	//通过Ajax向后台传值
		$.ajax({
			type : "POST",
			url :'<%=basePath%>register/isExistsFile.act',
			data : {
				filePath : path
			},
			dataType : 'json',
			async:false, 
			success : function(data) {
				if(data=="1"){
					if(id==0){
						$("#pdfcertificateView").attr('href','<%=basePath%>'+ 'register/showPdf.act?pdfFile='+ path);
					}else if(id==1){
						$("#pdfexpenseView").attr('href','<%=basePath%>'+ 'register/showPdf.act?pdfFile='+ path);
					}else if(id==2){
						$("#pdfcontratView").attr('href','<%=basePath%>'+ 'register/showPdf.act?pdfFile='+ path);
					}else if(id==3){
						$("#pdfsettlementView").attr('href','<%=basePath%>'+ 'register/showPdf.act?pdfFile='+ path);
					}
						ret = true;
					} else {
						$('#my-modal-errorfile-alert').show().delay(1000)
								.fadeOut();
					}

				}
			});
			return ret;
		}
/* 	function checkFiles(){
   		var certificateName = $("#certificateName").val();
   		var certificatePath =  $("#certificatePath").val();
   		var expenseName = $("#expenseName").val();
   		var expensePath =  $("#expensePath").val();
   		var contractName = $("#contractName").val();
   		var contractPath =  $("#contractPath").val();
   		var settlementName = $("#settlementName").val();
   		var settlementPath =  $("#settlementPath").val();
   		if(certificateName=="" && certificatePath==""){
   			$("#file_upload1").tips({
				side : 2,
				msg : "请上传文件。",
				bg : '#AE81FF',
				time : 2
			});
			$("#file_upload1").focus();
			return false;
   		}
   		if(expenseName=="" && expensePath==""){
   			$("#file_upload2").tips({
				side : 2,
				msg : "请上传文件。",
				bg : '#AE81FF',
				time : 2
			});
   			$("#file_upload2").focus();
			return false;
   		}
    		if(contractName=="" && contractPath==""){
   			$("#file_upload3").tips({
				side : 2,
				msg : "请上传文件。",
				bg : '#AE81FF',
				time : 2
			});
   			$("#file_upload3").focus();
			return false;
   		}
   		if(settlementName=="" && settlementPath==""){
   			$("#file_upload4").tips({
				side : 2,
				msg : "请上传文件。",
				bg : '#AE81FF',
				time : 2
			});
   			$("#file_upload4").focus();
			return false;
   		} 
   		return true;
	} */
	
	//模态框初始加载合同
	function delComAlterFile(id) {
		$("#delectAltid").val(id);
	}
	function delFile(){
		var id = $("#delectAltid").val();
		if(id !=''){
			$.ajax({
		type : "POST",
		url :'<%=basePath%>govUploadCommon/delCertificationFile.act',
					data : {
						id : id
					},
					dataType : 'json',
					cache : false,
					success : function(data) {
						if (data.ret > 0) {
							location.reload();
						} else {
							$('#my-modal-failure-alert').show().delay(1000)
									.fadeOut(function() {
										location.reload();
								});
						}
					}
				});
			} else {
				location.reload();
			}
	}
	</script>
	<jsp:include page="../../common/govCatalog.jsp"></jsp:include>
</body>
</html>