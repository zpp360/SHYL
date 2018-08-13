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
<title>申请报告_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<jsp:include page="../../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/work.css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/uploadify.css">
<link rel="stylesheet"
	href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet"
	href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<script type="text/javascript"
	src="<%=basePath%>/shyl/js/mainjs/jquery.placeholder.js"></script>
<style>
.table {
	border: 1px solid;
	border-color: #ddd;
	margin-bottom: 0px !important;
}

.tdtxt {
	border: 1px solid;
	border-color: #ddd;
	border-collapse: collapse;
	text-align: left;
	vertical-align: middle !important;
}

.tdtxtcenter {
	border: 1px solid;
	border-color: #ddd;
	border-collapse: collapse;
	text-align: center;
	vertical-align: middle !important;
}

.moneytypetxt {
	padding-left: 10px;
	background-color: #ecf0f9;
	height: 42px;
	border: 0;
	font-size: 0.85em;
}

.table td label {
	font-size: 0.85em;
}

.inputtxt2 {
	width: 95% !important;
}

.cheackboxError {
	outline: 1px solid red;
}

.inputError {
	border: 1px solid #f00 !important;
}

.vertical {
	width: 20px;
	font-size: 12px;
	word-wrap: break-word;
	letter-spacing: 20px;
}

.width70 {
	width: 70% !important;
}

.font-size85 {
	color: #b6b6b6;
	font-size: 0.85em;
}

* {
	box-sizing: content-box;
}

.viewa {
	color: #818590;
	padding: 5px 10px;
	margin: 0 2px;
	border-radius: 3px;
	padding-left: 10px;
	font-size: 14px;
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
			<div class='modal my-modal-alert' id='my-modal-success-alert'>
				<div class='modal-dialog boxBodySmall'>
					<div class='modal-content'
						style="width: 200px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
						<div class='modal-body' id='modal-body-alert'>
							<img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;上传成功!
						</div>
					</div>
				</div>
			</div>

			<div class='modal my-modal-alert' id='my-modal-failure-alert'>
				<div class='modal-dialog boxBodySmall'>
					<div class='modal-content'
						style="width: 200px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
						<div class='modal-body' id='modal-body-alert'>
							<img alt="" src="<%=basePath%>shyl/images/fail.png">&nbsp;&nbsp;上传失败，请重新上传!
						</div>
					</div>
				</div>
			</div>
			<div class='modal my-modal-alert' id='my-modal-view-alert'>
				<div class='modal-dialog boxBodySmall'>
					<div class='modal-content'
						style="width: 200px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
						<div class='modal-body' id='modal-body-alert'>
							<img alt="" src="<%=basePath%>shyl/images/mark.png">&nbsp;&nbsp;请先上传文件，再预览。
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
			<h2>申请报告</h2>
			<div class="input_class" style="margin-bottom: 100px;">
				<form action="" class="form-inline" method="post" id="form1">
					<input type="hidden" name="info_id" value="${pd.info_id}" /> <input
						type="hidden" name="toPage" value="${pageMap.toPage}">
					<table id="appTable" class="table"
						style="width: 85%; background-color: #ecf0f9">
						<tr style="height: 200px;">
							<td><label id="filepath">&nbsp;
									详见《<label>${pd.declaration_year}</label>年国家服务外包扶持资金申请报告》
							</label>
								<div style="margin-top: 50px; margin-left: 20px;">
									<span id="pdfShowName">${pd.filename}</span> <span
										<c:if test="${empty pd.filepath}"> style="display: none;"</c:if>
										id="xg"><a id="pdfView"
										 href='javascript:void(0);' target='_blank' onclick="return viewPdf('${pd.filepath}');"
										class='zview'>预览</a></span> <span
										<c:if test="${empty pd.filepath}"> style="display: none;"</c:if>
										id="sc"><a id="pdfDelete" onclick="delFile();"
										class="delete">删除</a></span>
										<c:choose>
										  <c:when test="${empty pd.filepath}">
										      <input type="hidden" name="pdfFlag" id="pdfFlag" value="0" />
										  </c:when>
										  <c:otherwise>
										      <input type="hidden" name="pdfFlag" id="pdfFlag" value="1" />
										  </c:otherwise>
										</c:choose>
								</div></td>
							<td style="padding-top: 150px;"><a data-toggle="modal"
								data-target="#sEdu" class="btn btn-link hover"><span
									class="btn btn-primary1 fileinput-button"> <span id="fileUpload">上传申请报告</span>
								</span> </a></td>
						</tr>
						<tr style="height: 300px;">
							<td colspan="2" style="border-top: #ddd 1px solid;"><label
								class="control-label">企业（单位）声明：</br>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本人谨代表申请单位作出声明，完全明白服务外包扶持资金有关规定及本申请书表格内的所有内容。本人确认：本单
									位所填报的各项申请材料，均真实无误。本人也知道如误报或瞒报材料，以欺诈手段取得服务外包扶持资金，均属违规行
									为，将承担相应责任。</br>
								</br>
								</br>
								</br>
								</br>
								</br>

							</label> <label class="control-label" style="float: right;">法定代表人（单位负责人）签字及申请企业（单位）印章</label>
							</td>
						</tr>
					</table>
					</br> <label class="control-label">备注：申请报告请按照申报材料相关要求说明申请理由、申请金额等，可另加附页。</label>
				</form>
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-2" style="margin-top: 40px;">
						<button type="button" onclick="OK();"
							class="btn btn-success btn-block">
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

			<div class="modal fade in" id="sEdu" role="dialog"
				style="margin-top: 20%;" ;
						aria-labelledby="sEdu"
				aria-hidden="false" data-backdrop="static">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">添加申请报告</h4>
						</div>
						<div class="modal-body">
							<table>
								<tbody>
									<tr>
										<td style="padding-left: 50px; width: 20%;"><span
											style="color: #FF0000">*</span>申请报告名称：</td>
										<td style="width: 60%;"><input id="uploadFileId"
											class="form-control" data-val="true" value="${pd.filename}"
											readonly></td>
										<td style="width: 10%;"><span id="file_upload"
											class="btn btn-primary fileinput-button" style="float: right">
												<span>上传</span> <input type="file" id="file_upload"
												name="file_upload" multiple> <input type="hidden"
												id="file_path" name="file_path" value="${pd.filepath}">
										</span></td>
									</tr>
								</tbody>
							</table>
							<div class="help-block"
								style="margin-top: 5px; margin-left: 220px">支持的文件格式为.doc,.docx或者.pdf</div>
						</div>
						<div class="modal-footer">
							<button id="EduButtonedu" type="button" class="btn btn-success"
								onclick="updateFile()" data-dismiss="">确认</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
						</div>
					</div>
				</div>
				<input type="reset" style="display: none;" name="reportedu">
			</div>
		</div>
	</div>

	<%@ include file="../../common/footer.jsp"%>
	<p id="back-to-top" style="display: block;">
		<a href="#top"><span></span></a>
	</p>
	<script type="text/javascript"
		src="<%=basePath%>shyl/js/jquery.tips.js"></script>
	<script src="<%=basePath%>shyl/js/jquery.validate.js"></script>
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
	<script type="text/javascript">
	$(function() {
		 $("#file_upload").fileupload({
			 dataType :'json',
			 autoUpload: true,
			 maxNumberOfFiles :1,
	         url: '<%=basePath%>orgApp/uploadContractFiles.act',
	         sequentialUploads: true
		 }).bind('fileuploadchange', function (e, data) {
			 if(data.files.length > 1){
				 alert("一次最多上传1个文档");
	             return false;
			 }
	     }).bind('fileuploaddone', function (e, data) {
	    	 if("no"==data.result.fileExtError){
	    		 //alert("请上传格式为.doc或者docx格式的文档文件。");
	    		 $("#file_upload").tips({
	 				side : 2,
	 				msg : "请上传格式为.doc，docx或pdf格式的文档文件。",
	 				bg : '#AE81FF',
	 				time : 3
	 			});
	 			$("#file_upload").focus();
	    	 } else {
	    		 if(data.result.filePath!=""){
	    			 $("#uploadFileId").val(data.result.OriginalFileName);
		    		 $("#file_path").val(data.result.filePath);
		    		 $("#pdfShowName").text(data.result.OriginalFileName);
		    		 $("#pdfView").attr("href",'<%=basePath%>'+'register/showPdf.act?pdfFile='+data.result.filePath);
		    		 $("#xg").show();
			   		 $("#sc").show();
	    		 }else{
	    			 $('#my-modal-failure-alert').show().delay(3000).fadeOut(
	 						function() {
	 							location.reload();
	 						}); 
	    		 }
	    		 
		           
	    	 }
	     });
});	
	</script>
	<script type="text/javascript">
	 
	function OK() {
		// 如果已经上传PDF则进行更新处理。如未上传，则提示信息
		if ($("#pdfFlag").val() == "1") {
			$("#form1").attr('action','<%=basePath%>orgApp/savereport.act');
			$("#form1").submit();
		} else {
	         $("#fileUpload").tips({
	                side : 2,
	                msg : '请选择申请报告',
	                bg : '#AE81FF',
	                time : 2
	            });
	            return false;
		}
	}
	
	function updateFile(){
		var filepath = $("#file_path").val();
		var filename = $("#uploadFileId").val();
		var info_id = ${pd.info_id};
		// 报告验证
		if (filepath == "" && filepath2 == "") {
			$("#file_upload").tips({
				side : 2,
				msg : '请选择申请报告',
				bg : '#AE81FF',
				time : 2
			});
			return false;
		}
		//通过Ajax向后台传值
		$.ajax({
			type : "POST",
			url : '<%=basePath%>orgApp/upLoadFile.act',
			data : {
				filename : filename,
				filepath : filepath,
				info_id : info_id
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				if ("success" == data.result) {
					$('#sEdu').modal('hide');
					$("#pdfFlag").val("1");
					$('#my-modal-success-alert').show().delay(1000).fadeOut ();
				} else {
					$('#sEdu').modal('hide');
					$('#my-modal-failure-alert').show().delay(1000).fadeOut ();
				} 
			}
		});
	}
	function delFile(){
		var info_id = ${pd.info_id};
		//通过Ajax向后台传值
		$.ajax({
			type : "POST",
			url : '<%=basePath%>orgApp/delFile.act',
			data : {
				info_id : info_id
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				if ("success" == data.result) {
					 $("#uploadFileId").val("");
					 $("#file_path").val("");
					 $("#pdfShowName").text("");
					 $("#xg").hide();
			   		 $("#sc").hide();
			   		$("#pdfFlag").val("0");
				} else {
					$('#sEdu').modal('hide');
					$('#my-modal-failure-alert').show().delay(1000).fadeOut ();
				} 
			}
		});
		 
	}
	// 预览资金申请报告
    function viewPdf(path) {
		var ret=false;
    	//通过Ajax向后台传值
		$.ajax({
			type : "POST",
			url :'<%=basePath%>'+'register/isExistsFile.act',
			data : {
				filePath : path
			},
			dataType : 'json',
			async:false, 
			success : function(data) {
				if(data=="1"){
					$("#pdfView").attr('href','<%=basePath%>'+'register/showPdf.act?pdfFile='+path);
					ret=true;
				}else{
					$('#my-modal-errorfile-alert').show ().delay (1000).fadeOut ();
				}
				
			}
		});
    	return ret;
		
	}
	
	
	</script>
	<script src="<%=basePath%>shyl/js/mainjs/errImage.js"
		type="text/javascript"></script>

</body>
</html>