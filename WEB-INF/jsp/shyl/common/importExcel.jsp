<%@ page import="java.util.*"%>
<%@ page import="com.shyl.framework.entity.system.User"%>
<%@ page import="com.shyl.framework.util.PageData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#docNameImpExcel li { 
	/*如果显示三列 则width改为30%*/ 
	width: 50%; 
	float: left; 
	display: block; 
}
.red_tip {
    color: red;
    padding-right: 10px;
}
</style>
<script>
var fileName,filePath;
var url="<%=basePath%>govUploadCommon/uploadExcel.act";
function fileuploadExcel(options){
	fileName=options.fileNmae;
	filePath=options.filePath;
	if(options.url !=null){
		url= options.url;
	}
	
	$("#file_uploadExcel").fileupload({
		 dataType :'json',
		 autoUpload: true,
		 maxNumberOfFiles :1,
		 formData:options.data,
        url: url,
        sequentialUploads: true
	 }).bind('fileuploadchange', function (e, data) {
		 if(data.files.length > 1){
			 $(this).tips({
				 side : 2,
				 msg : "一次最多导入一个excel文件",
				 bg : '#AE81FF',
				 time : 2
			 });
            return false;
		 }
    }).bind('fileuploaddone', function (e, data) {
   	 if(data.files.length > 1){
			 $(this).tips({
				 side : 2,
				 msg : "一次最多导入一个excel文件",
				 bg : '#AE81FF',
				 time : 2
			 });
            return false;
		 }
    }).bind('fileuploaddone', function (e, data) {
   	 $("#errorList").hide();
		 $("#docNameImpExcel").empty();
   	 if("no"==data.result.fileExtError){
   		 $(this).tips({
				 side : 2,
				 msg : "请上传格式为.xls,.xlsx格式的文档文件。",
				 bg : '#AE81FF',
				 time : 2
			 });
   		 return false;
   	 }else if('failed'==data.result.fileExtError){
   		$(this).tips({
			 side : 2,
			 msg : "导入失败",
			 bg : '#AE81FF',
			 time : 2
		 });
		 return false;
   	 } else if(data.result.errorList !=null && data.result.errorList.length>0){
   		 $("#errorList").show();
   		 $.each(data.result.errorList,function(index,item){
   			 if(index <10){
   				 $("#docNameImpExcel").append("<li>"+item+"</li>");
   			 }
   		 })
   	 } 
   	 else {
   		 $('#upExcel').modal('hide');
   		 $('#my-excel-success-alert').show().delay(1000).fadeOut (function(){options.getresult();});
   	 }
   	 
    });
}
function Clear() {
	 $("#errorList").hide();
}
function downloadFile() {	
	$("#importform").attr("action","<%=basePath%>gov/downloadTemp.act?fileName="+encodeURI(fileName)+"&filePath="+filePath);
	$("#importform").submit();			
}
</script>
</head>
<body>
	<div class='modal my-modal-alert' id='my-excel-success-alert'>
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:200px;text-align:center;position:fixed;right:40%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;导入成功!
                    </div>
                </div>
            </div>
        </div>
        
		<!-- 批量导入 -->
	<div class="modal fade in" id="upExcel" role="dialog" style="margin-top: 0%;dispaly:block" 
			aria-labelledby="adoptModal" aria-hidden="false" data-backdrop="static">
			
			<div class="modal-dialog modal-lg" style="top: 145px; left: -15px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							批量导入 
						</h4>
					</div>
					<form class="form-horizontal" role="form" action="" method="post"
						id="importform" name="form1">
						<table class="table">
							<tbody>
								<tr>
									<td>
										<div class="row">
											<div class="col-md-12">
												<div>
													<div class="form-group">	
														<div class="col-sm-12" style="margin-left: 30px;margin-top:5px;">
															<div class="caption" align="left" >
															<span  class="red_tip">*</span><span >选择导入文件 ：</span>
																<span id="file_uploadExcel" class="btn btn-primary fileinput-button"> <span>导入本地Excel文件  </span> <input
																	type="file" id="file_uploadExcel" name="file_uploadExcel" multiple />
																</span> <span style="margin-top:5px; color: #818590;">支持的文件格式为.xls,.xlsx</span>
																<span style="margin-top:5px;margin-left: 30px;"><a class="zdown" href="javascript:void(0);" title="下载模板" onclick="downloadFile('1301');">下载模板</a></span>
															</div>
															
														</div>
														<div id="errorList" class="col-sm-12"  style="margin-left: 30px;margin-top:5px; display: none">
															<span class="red_tip">错误提示如下：</span>
															<ul id="docNameImpExcel" style="font-size: 14px; color: #f22b2b;">
															
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" onclick="Clear()"
								data-dismiss="modal">关闭</button>
						</div>
					</form>
				</div>
			</div>
		</div>
</body>
</html>