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
<title>服务外包荣誉及境外商标注册_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">
<link rel="stylesheet" href="shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/styleRegist.css">
<jsp:include page="../../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet"
	href="shyl/fileupload/css/jquery.fileupload-ui.css">
<link rel="stylesheet" href="shyl/css/font-awesome.css">
<link rel="stylesheet" href="shyl/css/non-responsive.css">
<script src="shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script type="text/javascript" src="shyl/js/bootstrap.js"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript"
	src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
</head>
<body id="top" style="background-color: #f7f7f7;">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param
				value="2" name="menuType" /></jsp:include>
		<!--  服务外包企业品牌建设-->
		<div class="mypage_right">
			<h2  class="h2_font13">${pageMap.levelMap.levelMenu}服务外包荣誉及境外商标注册</h2>
			<div class="panel-heading">
				<form action="<%=basePath%>govUploadCommon/saveBrandUpLoadFile.act"
					class="form-inline" method="post" id="form">
					<input type="hidden" name="info_id" id="info_id"
						value="${pd.info_id}" /> <input type="hidden" name="id"
						value="${resPd.id}" />
					<!-- 下一页 -->
					<input type="hidden" name="toPage" value="${pageMap.toPage}">
					<input type="hidden" name="isCopyModify" value="${pd.isCopyModify}">
					<input type="hidden" name="isBrandModify" value="${pd.isBrandModify}">
					<table class="table">
						<tbody>
							<tr>
								<td>
									<div class="row">
										<div class="col-md-12">
											<div>
												<div class="form-group">
													<div class="col-sm-12">

													</div>
													<div class="col-sm-10">
														<div class="caption" align="left"
															style="width: 500px; padding-top: 20px; padding-bottom: 30px;">
															<span style="margin-top: 50px"><font color="red">*</font>品牌获奖资料</span>
															<a class="btn btn-link hover"><span
																class="btn btn-primary1 fileinput-button"
																style="width: 70px; margin-left: 20px"><span>上传</span><input
																	type="file" id="file_upload1" name="file_upload1"
																	multiple /></span></a>
																	<div style="margin-left:125px; margin-top:3px; color: #818590;">支持的文件格式为.pdf</div>
														</div>
														</div>
														<div class="col-sm-12">
														<ul style="float: left;" id="BrandId">
															<li><span id="pdfBrandName">${brandPdData.file_name}</span>
																<span
																<c:if test="${empty brandPdData.file_name}"> style="display: none;"</c:if>
																id="xg"><a id="pdfBrandView"
																	 href='javascript:void(0);' target='_blank' onclick="return viewPdf(0);"
																	class='zview'>预览</a></span> <span
																<c:if test="${empty brandPdData.file_name}"> style="display: none;"</c:if>
																id="sc"><a id="pdfDelete"
																	onclick="delFile('${brandPdData.id}');" class="delete">删除</a></span>
															</li>
														</ul>
													</div>
														<div class="col-sm-10">
														<div class="caption" align="left"
															style="width: 500px; padding-top: 20px; padding-bottom: 30px;">
															<span style="margin-top: 50px"><font color="red">*</font>费用复印件</span>
															<a class="btn btn-link hover"><span
																class="btn btn-primary1 fileinput-button"
																style="width: 70px; margin-left: 35px"><span>上传</span><input
																	type="file" id="file_upload2" name="file_upload2"
																	multiple /></span></a>
																	<div style="margin-left:125px; margin-top:3px; color: #818590;">支持的文件格式为.pdf</div>
														</div>
													</div>
													<div class="col-sm-12">
														<ul style="float: left;" id="CopyId">
															<li><span id="pdfCopyName">${copyPdData.file_name}</span>
																<span
																<c:if test="${empty copyPdData.file_name}"> style="display: none;"</c:if>
																id="xgCopy"><a id="pdfCopyView"
																	 href='javascript:void(0);' target='_blank' onclick="return viewPdf(1);"
																	class='zview'>预览</a></span> <span
																<c:if test="${empty copyPdData.file_name}"> style="display: none;"</c:if>
																id="scCopy"><a id="pdfDelete"
																	onclick="delFile('${copyPdData.id}');" class="delete">删除</a></span>
															</li>
														</ul>
													</div>
													<input id="pdfPaths" name="pdfPaths" type="hidden"
														value="${brandPdData.file_path}" />
													<input id="pdfBrandPath" name="pdfBrandPath" type="hidden"
														value="${brandPdData.file_path}" /> <input id="BrandName"
														name="BrandName" type="hidden" value="${brandPdData.file_name}" />
													<input type="hidden" id="BrandType" name="BrandType"
														value="${brandPdData.file_type}">
													<input id="pdfCopyPath" name="pdfCopyPath" type="hidden"
														value="${copyPdData.file_path}" /> <input id="CopyName"
														name="CopyName" type="hidden" value="${copyPdData.file_name}" />
													<input type="hidden" id="CopeType" name="CopeType"
														value="${copyPdData.file_type}">
												</div>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tr>
							<td style="font-size: 18px; font-weight: 700; width:100px;">
								申请金额
							<td width="15%">
							<input id="type" name="num" type="hidden" value="${pageMap.type}" />
							<input type="text" class="form-control"
								value="${pd.support_capital}" onkeypress="return myNumberic(event)"
								onkeyup="value=value.replace(/[^\d.]/g,'')" id="support_capital"
								onblur="checkMoney();" name="support_capital"
								style="width: 100px; font-size: 18px; font-weight: 700; height: 28px; border-radius: 5px; background-color: #ecf0f9;"></td>
							<td>&nbsp;万元</td>
						</tr>
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
					<div class="col-sm-2" style="margin-top: 40px;margin-left:15px">
						<a href="<%=basePath%>${pageMap.fromPage}?&info_id=${pd.info_id}"
							class="btn btn-default btn-block"><span
							class="glyphicon glyphicon-circle-arrow-left"></span>&nbsp;&nbsp;上一步</a>
					</div>
				</c:if>


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
	<script type="text/javascript" src="shyl/js/jquery.tips.js"></script>
	<script src="shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
	<script src="shyl/fileupload/js/jquery.fileupload.js"></script>
	<script src="shyl/fileupload/js/jquery.fileupload-process.js"></script>
	<script src="shyl/fileupload/js/jquery.fileupload-validate.js"></script>
	<script src="shyl/fileupload/js/jquery.iframe-transport.js"></script>
	<script type="text/javascript">
	var pictureindex = 0;
	var pathArray = new Array();
	$(function() {
		$("#file_upload1").fileupload({
			 autoUpload: true,
			 maxNumberOfFiles : 3,
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
	   }).bind('fileuploaddone', function (e, data) {
	  	 if("no"==data.result){
		   		 $("#file_upload1").tips({
						 side : 2,
						 msg : "请上传格式为.pdf格式的文件。",
						 bg : '#AE81FF',
						 time : 2
					 });
		   		 return false;
		   	 } else {
		   		index = ++pictureindex;
		   		var img = new Object();
		   		img.id = index;
				img.name = data.originalFiles[0].name;
				img.path = data.result;
				pathArray.push(img);
		   		 // 设定pdf路径
		   		 $("#pdfBrandPath").val(data.result);
		   		 // 设定pdf名称
		   		 $("#BrandName").val(data.originalFiles[0].name);
		   	 $("#BrandId").children().remove();
		   	 $("#BrandId").append(uphtml2(data.result,data.originalFiles[0].name,index));
		   	 }
	   });
		$("#file_upload2").fileupload({
			 autoUpload: true,
			 maxNumberOfFiles : 3,
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
	   }).bind('fileuploaddone', function (e, data) {
	  	 if("no"==data.result){
		   		 $("#file_upload2").tips({
						 side : 2,
						 msg : "请上传格式为.pdf格式的文件。",
						 bg : '#AE81FF',
						 time : 2
					 });
		   		 return false;
		   	 } else {
		   		index = ++pictureindex;
		   		var img = new Object();
		   		img.id = index;
				img.name = data.originalFiles[0].name;
				img.path = data.result;
				pathArray.push(img);
		   		 // 设定pdf路径
		   		 $("#pdfCopyPath").val(data.result);
		   		 // 设定pdf名称
		   		 $("#CopyName").val(data.originalFiles[0].name);
		   		$("#CopyId").children().remove();
		   		 $("#CopyId").append(uphtml1(data.result,data.originalFiles[0].name,index));
		   	 }
	   });
});
	function uphtml1(filePath,OriginalFileName,index){
		var html= '<li><span id="pdfCopy1Name">'+OriginalFileName+'</span><span>';
		   html+='<a id="pdfCopyView" href="javascript:void(0);" target="_blank" onclick="return viewPdf(1);"class="zview">预览</a>';
			html+='</span><a id="pdfDelete1" onclick="deleteLocalFile1('+index+');" class="delete">删除</a>';
	        html+='</li>';
		return html;
	}
	function uphtml2(filePath,OriginalFileName,index){
		var html= '<li><span id="pdfBrand1Name">'+OriginalFileName+'</span><span>';
		   html+='<a id="pdfBrandView" href="javascript:void(0);" target="_blank" onclick="return viewPdf(0);"class="zview">预览</a>';
			html+='</span><a id="pdfDelete2" onclick="deleteLocalFile2('+index+');" class="delete">删除</a>';
			html+='</li>';
		return html;
	}
	    function deleteLocalFile2(index){
	    	for (var i =0;i<pathArray.length;i++) {
	    		if (index == pathArray[i].id) {
	    			pathArray.splice(i,1);
	    			break;
	    		}
	    	}
	    	 // 设定pdf路径
	   		 $("#pdfBrandPath").val('');
	   		 // 设定pdf名称
	   		 $("#BrandName").val('');
	    	$("#BrandId").children().remove();
	    }
		   function deleteLocalFile1(index){
		    	for (var i =0;i<pathArray.length;i++) {
		    		if (index == pathArray[i].id) {
		    			pathArray.splice(i,1);
		    			break;
		    		}
		    	}
		    	 // 设定pdf路径
		   		 $("#pdfCopyPath").val('');
		   		 // 设定pdf名称
		   		 $("#CopyName").val('');
		    	$("#CopyId").children().remove();
		    }
	// 预览保险权益记录单
    function viewPdf(id) {
		var path;
		if(id==0){
			path = $("#pdfBrandPath").val();
			
		}else{
			path = $("#pdfCopyPath").val();
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
						$("#pdfBrandView").attr('href','<%=basePath%>'+ 'register/showPdf.act?pdfFile='+ path);
					}else{
						$("#pdfCopyView").attr('href','<%=basePath%>'+ 'register/showPdf.act?pdfFile='+ path);
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
	function OK() {
		 if(checkFiles()){
		 $("#form").submit();
		 }
	 }
	function checkFiles(){
   		var BrandName = $("#BrandName").val();
   		var pdfBrandPath =  $("#pdfBrandPath").val();
   		var CopyName = $("#CopyName").val();
   		var pdfCopyPath =  $("#pdfCopyPath").val();
   		if(BrandName!=""&&pdfBrandPath!=""){
   		}else{
			$("#file_upload1").tips({
				side : 2,
				msg : "请上传文件。",
				bg : '#AE81FF',
				time : 2
			});
			return false;
   		}
   		if(CopyName!="" && pdfCopyPath!=""){
   		}else{
   			$("#file_upload2").tips({
				side : 2,
				msg : "请上传文件。",
				bg : '#AE81FF',
				time : 2
			});
			return false;
   			
   		}
   		return true;
	}
	function delFile(id){
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
							$('#my-modal-success-alert').show().delay(2000)
									.fadeOut(function() {
										location.reload();
									});
						} else {
							$('#my-modal-failure-alert').show().delay(2000)
									.fadeOut(function() {
										location.reload();
									});
						}
					}
				});
			} else {
				$('#my-modal-success-alert').show().delay(2000).fadeOut(
						function() {
							location.reload();
						});
			}
		}
	
	function myNumberic(e,len) {
	    var obj=e.srcElement || e.target;
	    var dot=obj.value.indexOf(".");//alert(e.which);
	    len =(typeof(len)=="undefined")?2:len;
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
    function checkMoney(){
    	var support_capital = $("#support_capital").val();
    	var reg=/^\d*\.?\d{0,2}$/;
    	var PsdFilter = /^\d{0,7}(\.\d{0,2})?$/;
    	if(support_capital != null || support_capital != ''){
    		if(!reg.test(support_capital)){
    			$("#support_capital").tips({
    				side : 2,
    				msg : '"support_capital","申请金额必须大于0且小数位数不超过2位！"',
    				bg : '#AE81FF',
    				time : 3
    			});
    			return true;
        	}
    	}
		if (!(PsdFilter.test(support_capital))) {
			$("#support_capital").tips({
				side : 2,
				msg : '申请扶持金额最大值不能超过9999999.99',
				bg : '#AE81FF',
				time : 3
			});
			$("#support_capital").focus();
			return false;
		}
    }
	</script>
</body>
</html>