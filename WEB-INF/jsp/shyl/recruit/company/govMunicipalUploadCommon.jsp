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
<title>${name}_济南市服务外包公共服务平台</title>
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
<link rel="stylesheet" href="<%=basePath%>shyl/css/maincss/showLoading.css"> 
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js"
	type="text/javascript"></script>
<style>
.progress {
    padding: 1px;
    width: 220px;
    height: 11px;
    overflow: hidden;
    border: 1px solid #428bca;
    -webkit-border-radius: 6px;
    margin-bottom: 0px;
    border-radius: 6px;
    display:none;
    float:left;
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
		<!--  我的简历管理部分页面-->
		<div class="mypage_right">
			<h2 class="h2_font13"><img id="catalogTree" src="<%=basePath%>/shyl/images/catalog.png" style="margin-bottom: 5px;"/>${pageMap.levelMap.levelMenu}${name}</h2>
			<form action="<%=basePath%>govUploadCommon/saveUpLoadFile.act" method="post" id="form">
			<input type="hidden" name="info_id" id="info_id" value="${pd.info_id}" />
			<input id="type" type="hidden" value="${pageMap.type}" />
			<div>
				<ul>
					
					<li>
					<c:if test="${not empty wenxinTs}">
						<span
							style="font-size: 12px; padding-left: 10px;margin-right:100px; display: inline-block; vertical-align: bottom;border:1px solid #d2c7c7; ">
								<label style="color: red; ">※温馨提示：</label><label style="">${wenxinTs}</label>
						</span>
								</c:if>
						<div>
							<span id="file_uploadCon1"
								class="btn btn-primary fileinput-button"
								style="margin-top: 20px; margin-left: 30px"><span>+上传${uploadBut}目录</span>
								<input type="file" id="file_uploadCon1" name="file_uploadCon1"
								multiple /></span> <span
								style="font-size: 12px; color: red; padding-left: 50px; display: inline-block; height: 30px; vertical-align: bottom;">
								<label>※文件格式为.pdf</label>
							</span>
							<div id="files" class="col-sm-10">
								<div style="height: 30px;">
									<div id="progress1" class="progress"
										style="float: left; margin-top: 10px; margin-left: 28px;">
										<div class="bar" style="width: 0%;"></div>
									</div>
								</div>
								<table class="tableclass" style="margin-left: 15px">
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
														<td style="text-align: center;"><a class="zview"
															id="view${certificatePd.id}"
															href="javascript:void(0);"
															target="_blank" onclick="viewPdf('${certificatePd.id}')">预览</a><a data-toggle='modal'
															data-target='#delComAlterFile'
															onclick="delComAlterFile('${certificatePd.id}');"
															class="delete" href="javascript:void(0);">删除</a><input
															id="ViewPath${certificatePd.id}"
															name="ViewPath${certificatePd.id}" type="hidden"
															value="${certificatePd.file_path}" /></td>
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
						</div>
					</li>
						<li><span id="file_uploadCon"
						class="btn btn-primary fileinput-button"
						style="margin-top: 20px; margin-left: 30px"><span>+上传${uploadBut}文件</span>
						<input type="file" id="file_uploadCon" name="file_uploadCon" multiple /></span>
						<span
						style="font-size: 12px; color: red; padding-left: 50px; display: inline-block; height: 30px; vertical-align: bottom;">
							<label>※可以上传多个文件，文件格式为.pdf</label>
					</span> 
					<div style=" height: 20px;">
						<div id="progress2" class="progress" style="float: left;margin-top: 10px; margin-left: 28px;">
							<div class="bar" style="width: 0%;"></div>
						</div>
					</div>
					<input id="pdfPath" name="pdfPath" type="hidden"/>
					<input id="pdfName" name="pdfName" type="hidden"/>
					<input type="hidden" id="certificate_type" name="file_type" value="${pd.certificate_type}">
					<input type="hidden" id="contract_type" name="file_type" value="${pd.contract_type}">
					
					<!-- 下一页 -->
					<input type="hidden" name="toPage" value="${pageMap.toPage}">
					<input type="hidden" name="returnMe" value="1">
					<input type="hidden" name="meUrl" value="shyl/recruit/company/pickUpRdCenter">
					</li>
				</ul>
			</div>
			<div id="files" class="col-sm-10">
				<table class="tableclass" style="margin-left: 15px">
					<thead>
						<tr>
							<th style="width: 500px; text-align: center;">上传文件名</th>
							<th style="width: 200px; text-align: center;">操作</th>
						</tr>
					</thead>
					<tbody id="fileID">
						<c:choose>
							<c:when test="${not empty contractList}">
								<c:forEach items="${contractList}" var="var" varStatus="vs">
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
										<td style="text-align: center;"><a class="zview"
											id="view${var.id}" href="javascript:void(0);" target="_blank"
											onclick="return viewPdf('${var.id}');">预览</a><a data-toggle='modal'
											data-target='#delComAlterFile' onclick="delComAlterFile('${var.id}');" class="delete" href="javascript:void(0);">删除</a> 
										<input id="ViewPath${var.id}" name="ViewPath${var.id}" type="hidden" value="${var.file_path}" />
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="2" style="text-align:center;"><span style="color: #ff6a00">没有相关记录</span></td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
					<table>
						<tr>
							<td style="font-size: 18px; font-weight: 700; width:100px;">
								申请金额
							<td width="15%"><input id="num" name="num" type="hidden"
								value="${pd.num}" /><input type="text"
								class="form-control" value="${pd.support_capital}"
								onkeyup="value=value.replace(/[^\d.]/g,'')" maxlength="10" id="support_capital"
								onblur="checkMoney(this);" onfocus = "clearInput(this,'0.0000')" name="support_capital"
								style="width: 100px; font-size: 18px; font-weight: 700; height: 28px; border-radius: 5px; background-color: #ecf0f9;"></td>
							<td>&nbsp;万元</td>
							<c:if test="${pageMap.type==8}">
							<td style="font-size: 18px; font-weight: 700; width:100px;">
								培训人数
							<td width="15%"><input id="num" name="num" type="hidden"
								value="${pageMap.type}"/><input type="text"
								class="form-control" value="${pd.trainningNums}"
								onkeypress="return myNumberic(event)"
								onkeyup="value=value.replace(/[^0-9]/g,'')" maxlength="5" id="trainningNums"
								onblur="delZero(this);" name="trainningNums"
								style="width: 100px; font-size: 18px; font-weight: 700; height: 28px; border-radius: 5px; background-color: #ecf0f9;"></td>
							<td>&nbsp;人</td>
							</c:if>
							<c:if test="${pageMap.type==2}">
								<td style="font-size: 18px; font-weight: 700; width:160px;">
								国际资质认证个数</td>
								<td width="15%"><input id="num" name="num" type="hidden"
									value="${pageMap.type}"/><input type="text"
									class="form-control" value="${pd.numbergrants}" 
									onkeyup="value=value.replace(/[^0-9]/g,'')" onblur="delZero(this);"
									id="nubresule" name="nubresule" maxlength="3"
									style="width: 100px; font-size: 18px; font-weight: 700; height: 28px; border-radius: 5px; background-color: #ecf0f9;"></td>
								<td>&nbsp;人</td>
							</c:if>
							<td><input type="text" style="display:none"/></td>
						</tr>
					</table>
				</div>
			<div class="form-group">
				<div class="col-sm-2 col-sm-offset-2" style="margin-top: 40px;">
					<button type="button" onclick="OK('${pageMap.toPage}');"
									class="btn btn-success btn-block" style="width:172px">
						<span class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp;${pageMap.toText}
					</button>
				</div>
				<c:if test="${not empty pageMap.fromPage}">
					<div class="col-sm-2" style="margin-top: 40px;">
						<a href="<%=basePath%>${pageMap.fromPage}?info_id=${pd.info_id}"
										class="btn btn-default btn-block"><span
										class="glyphicon glyphicon-circle-arrow-left"></span>&nbsp;&nbsp;上一步</a>
					</div>
				</c:if>
			</div>
			</form>
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
	<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.showLoading.min.js"></script>
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
	var locat;
	$(function() {
		locat=document.getElementsByTagName('base')[0].href;
		$("#file_uploadCon1").fileupload({
			 autoUpload: true,
			 maxNumberOfFiles : 3,
			 url: '<%=basePath%>platform/uploadSjBc.act',
	       sequentialUploads: true
		 }).bind('fileuploadchange', function (e, data) {
			 if(data.files.length > 1){
				 $("#file_uploadCon1").tips({
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
		   		 $("#file_uploadCon1").tips({
						 side : 2,
						 msg : "请上传格式为.pdf格式的文件。",
						 bg : '#AE81FF',
						 time : 2
					 });
		   		progressError('progress1');
		   		 return false;
	  	 }else if("nosize"==data.result){
	   		 $("#file_uploadCon1").tips({
				 side : 2,
				 msg : "文件已超过150MB，请分开上传。",
				 bg : '#AE81FF',
				 time : 2
			 });
	   		progressError('progress1');
 		 return false;
		} else {
			if(data.result!=undefined && data.result!=""){
		   		 var file_path = data.result
		   		var file_name = data.originalFiles[0].name;
		   		var certificate_type = $("#certificate_type").val();
		   		var info_id = $("#info_id").val();
		   		//通过Ajax向后台传值
		   		$.ajax({
		   			type : "POST",
		   			url : "<%=basePath%>municipalUploadCommon/saveSingleUpLoadFileAjax.act",
		   			data : {
		   				pdfPath : file_path,
		   				pdfName : file_name,
		   				file_type : certificate_type,
		   				info_id :info_id 
		   			},
		   			dataType : 'json',
		   			cache : false,
		   			success : function(data) {
		   			 $('#progress1 .bar').text('完成').parent().fadeOut(3000);
		   				if(data.certificatePd!=null && data.certificatePd!=""){
		   					var file_path = data.certificatePd.file_path;
		   					var file_name= data.certificatePd.file_name;
		   					var index = data.certificatePd.id;
		   					$("#certificateFileId").empty();
		   					$("#certificateFileId").append(htmlAppend(file_name,index,file_path));
		   					}
		   			},error:function(){
		   				progressError('progress');
		   			}
		   		});
		   	 }else{
					progressError('progress');
			 }
		  }
	   });
		$("#file_uploadCon").fileupload({
			 autoUpload: true,
			 maxNumberOfFiles : 3,
			 url: '<%=basePath%>platform/uploadSjBc.act',
	       sequentialUploads: true
		 }).bind('fileuploadchange', function (e, data) {
			 if(data.files.length > 1){
				 $("#file_uploadCon").tips({
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
		   		 $("#file_uploadCon").tips({
						 side : 2,
						 msg : "请上传格式为.pdf格式的文件。",
						 bg : '#AE81FF',
						 time : 2
					 });
		   		progressError('progress2');
		   		 return false;
	  	 }else if("nosize"==data.result){
	   		 $("#file_uploadCon").tips({
				 side : 2,
				 msg : "文件已超过150MB，请分开上传。",
				 bg : '#AE81FF',
				 time : 2
			 });
	   		progressError('progress2');
  		 return false;
		} else {
			if(data.result!=undefined && data.result!=""){
		   		 // 设定pdf路径
		   		 $("#pdfPath").val(data.result);
		   		 // 设定pdf名称
		   		 $("#pdfName").val(data.originalFiles[0].name);
		   		//通过Ajax向后台传值
		   		$.ajax({
		   			type : "POST",
		   			url : "<%=basePath%>municipalUploadCommon/saveUpLoadFileAjax.act",
		   			data : {
		   				pdfPath : $("#pdfPath").val(),
		   				pdfName : $("#pdfName").val(),
		   				file_type : $("#contract_type").val(),
		   				info_id : $("#info_id").val()
		   			},
		   			dataType : 'json',
		   			cache : false,
		   			success : function(data) {
		   			 	$('#progress1 .bar').text('完成').parent().fadeOut(3000);
						$("#fileID").empty();
						var List = data.expensePdList; 
						if(List.length > 0){
							for (var i = 0; i < List.length; i++) {
								var file_name ;
								if (List[i].file_name.length > 30) {
									file_name = List[i].file_name.substring(0,
											30)
											+ "...";
								} else {
									file_name = List[i].file_name;
								}
								$("#fileID")
								.append(htmlAppend(List[i].file_name,List[i].id,List[i].file_path));
							}
						}else{
							$("#fileID")
							.append("<tr><td colspan='2' style='text-align: center;'><span style='color: #ff6a00'>没有相关记录</span></td></tr>");
						}
		   			}
		   		});
			}else{
				progressError('progress');
			}
		  }
	   });
	});
	
	//模态框初始加载合同
	function delComAlterFile(id) {
		$("#delectAltid").val(id);
	}
	
	function delFile() {
		var id = $("#delectAltid").val();
		// 文件类型：离岸收入汇总表合同目录
	    var certificate_type = $("#certificate_type").val();
	    // 文件类型：离岸收入汇总表合同内容
	    var contract_type = $("#contract_type").val();
	    var info_id = $("#info_id").val();
		if (id != '') {
			$.ajax({
				type : "POST",
				url : locat+'municipalUploadCommon/delCertificationFileMuti.act',
				data : {
					id : id,
					info_id:info_id,
					certificate_type:certificate_type,
					contract_type:contract_type
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
					if (data.ret > 0) {
						 var certificatePd = data.certificatePd;
						 var contractList = data.contractList;
				         //合同目录
				         $("#certificateFileId").empty();
				         //合同内容
				         $("#fileID").empty();
						if(data.certificatePd!=null && data.certificatePd!=""){
							var file_path = data.certificatePd.file_path;
							var file_name= data.certificatePd.file_name;
							var index = data.certificatePd.id;
							$("#certificateFileId").append(htmlAppend(file_name,index,file_path));
							}
						//合同内容
						if(contractList.length > 0){
							reloadAjaxData(contractList,1);
						}else{
							$("#fileID")
							.append("<tr><td colspan='2' style='text-align: center;'><span style='color: #ff6a00'>没有相关记录</span></td></tr>");
						}
						$('#delComAlterFile').modal('hide');
					} else {
						$('#my-modal-failure-alert').show().delay(1000).fadeOut(
								function() {
									location.reload();
								});
					}
				}
			});
		} else {
			location.reload();
		}
		
	}
	 function OK(url) {
		 if(checkMoney(document.getElementById('support_capital'))){
		 $("#form").attr('action','<%=basePath%>govUploadCommon/toNextPage.act');
		 $("#form").submit();
		 }
	 }
		
		function myNumberic(e,len) {
		    var obj=e.srcElement || e.target;
		    var dot=obj.value.indexOf(".");//alert(e.which);
		    len =(typeof(len)=="undefined")?4:len;
		    var  key=e.keyCode|| e.which;
		    if(key==8 || key==9 || key==46 || (key>=37  && key<=40))//这里为了兼容Firefox的backspace,tab,del,方向键
		        return true;
		    if (key<=57 && key>=48) { //数字
		        if(dot==-1)//没有小数点
		            return true;
		        else if(obj.value.length<=dot+len)//小数位数
		            return true;
		        } else if((key==46) && dot==-1){//小数点
		            return true;
		    }       
		    return false;
		}
		 //文本框失去焦点后
	    function checkMoney(obj){
	    	var support_capital = $("#support_capital").val();
	    	var reg=/^(?!0+(?:\.0+)?$)(?:[1-9]\d*|0)(?:\.\d{1,4})?$/;
	    	var PsdFilter = /^\d{0,5}(\.\d{0,4})?$/;
	    	if(support_capital != null || support_capital != ''){
	    		if(!reg.test(support_capital)){
	    			$("#support_capital").tips({
	    				side : 2,
	    				msg : '申请金额必须大于0且小数位数不超过4位！',
	    				bg : '#AE81FF',
	    				time : 3
	    			});
	    			$("#support_capital").focus();
	    			return false;
	        	}
	    	}
			if (!(PsdFilter.test(support_capital))) {
				$("#support_capital").tips({
					side : 2,
					msg : '申请扶持金额最大值不能超过99999.9999',
					bg : '#AE81FF',
					time : 3
				});
				$("#support_capital").focus();
				return false;
			}
			changeFloat(obj,'0.0000',4);
			return true;
	    }
	    function reloadAjaxData(List,type){
	    	for (var i = 0; i < List.length; i++) {
	    		if(type==1){
	    		$("#fileID")
	    		.append(htmlAppend(List[i].file_name,List[i].id,List[i].file_path));
	    		}else if(type==2){
	    		$("#fileID1")
	    			.append(htmlAppend(List[i].file_name,List[i].id,List[i].file_path));
	    		}
	    	}
	    }

		function htmlAppend(file_name, id, file_path) {
			if (file_name.length > 30) {
				file_name = file_name.substring(0,
						30)
						+ "...";
			} else {
				file_name = file_name;
			}
			var html = "<tr>"
					+ "<td style='width: 140px; text-align: center' title='"
	    		+ file_name
	    		+ "'>"
					+ file_name
					+ "</td>"
					+ "<td style='text-align: center;'><a  id='view"
					+ id
					+ "' href='javascript:void(0);' target='_blank' class='zview' onclick='viewPdf("
					+id
					+ ")'>预览</a><a data-toggle='modal' data-target='#delComAlterFile' onclick='delComAlterFile("
					+ id
					+ ")' class='delete' href='javascript:void(0);'>删除</a><input id='ViewPath"
					+ id
					+ "' name='ViewPath"
					+id
					+"' type='hidden' value='"
					+file_path
					+"'/></td>"
					+ "</tr>";
			return html;
		}
		// 预览PDF
		function viewPdf(id) {
			var path;
				path = $("#ViewPath"+id).val();
			$("#view"+id).attr('href',"javascript:void(0);");
			var ret = false;
			// 通过Ajax向后台传值
			$.ajax({
				type : "POST",
				url : locat+'register/isExistsFile.act',
				data : {
					filePath : path
				},
				dataType : 'json',
				async : false,
				success : function(data) {
					if (data == "1") {
							$("#view"+id).attr('href',locat+ 'register/showPdf.act?pdfFile='+ path);
						ret = true;
					} else {
						$('#my-modal-errorfile-alert').show().delay(1000).fadeOut();
					}
				}
			});
			return ret;
		}
	</script>
	<jsp:include page="../../common/govCatalog.jsp"></jsp:include>
</body>
</html>