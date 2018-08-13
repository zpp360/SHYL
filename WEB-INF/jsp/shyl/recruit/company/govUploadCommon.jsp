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
<title>${name}_济南市服务外包公共服务平台</title>
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
	<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<style>
.progress {
    padding: 1px;
    width: 220px;
    height: 11px;
    overflow: hidden;
    border: 1px solid #428bca;
    -webkit-border-radius: 6px;
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
			<div class="panel-heading">
				<form action="<%=basePath%>govUploadCommon/saveUpLoadFile.act"
					class="form-inline" method="post" id="form">
					<input type="hidden" name="info_id" id="info_id"
						value="${pd.info_id}" /> <input type="hidden" name="id"
						value="${resPd.id}" />
					<input id="type1" name="num1" type="hidden" value="${pageMap.type}" />	
					<!-- 下一页 -->
					<input type="hidden" name="toPage" value="${pageMap.toPage}">
					<input type="hidden" name="supportCapital" value="${pd.support_capital}">
					<table class="table">
						<tbody>
							<tr>
								<td>
									<div class="row">
										<div class="col-md-12">
											<div>
												<div class="form-group">
													<div class="col-sm-12">
														<ul style="float: left;">
															<li><span id="pdfShowName">${resPd.file_name}</span>
																<span
																<c:if test="${empty resPd.file_name}"> style="display: none;"</c:if>
																id="xg"><a id="pdfView"
																	 href='javascript:void(0);' target='_blank' onclick="return viewPdf();"
																	class='zview'>预览</a></span> <span
																<c:if test="${empty resPd.file_name}"> style="display: none;"</c:if>
																id="sc"><a id="pdfDelete"
																	onclick="delFile('${resPd.id}');" class="delete">删除</a></span>
															</li>
															<li></li>
														</ul>
													</div>
													<div class="col-sm-12" style="margin-left: 7%">
														<div class="caption" align="center" style="width: 400px;">
															<span id="file_uploadCon"
																class="btn btn-primary fileinput-button"
																style="margin-top: 20px;float:left"><span>上传${uploadBut}</span><input
																type="file" id="file_uploadCon" name="file_uploadCon"
																multiple /></span>
																<div style="margin-top: 30px; color: #818590; float: left;margin-left: 10px;">支持的文件格式为.pdf</div>
														</div>
														<div style=" height: 50px; margin-top: 60px;">
														<div id="progress" class="progress" style="float: left;margin-top: 10px;">
																	<div class="bar" style="width: 0%;"></div>
																</div>
																</div>
													</div>

													<input id="pdfPath" name="pdfPath" type="hidden"
														value="${resPd.file_path}" /> <input id="pdfName"
														name="pdfName" type="hidden" value="${resPd.file_name}" />
													<input type="hidden" id="file_type" name="file_type"
														value="${pd.file_type}">
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
							<c:if test="${pageMap.type!=3 && pageMap.type!=0}">
							<td style="font-size: 18px; font-weight: 700; width:100px;">
								申请金额
							<td width="15%">
							<input id="type" name="num" type="hidden" value="${pageMap.type}" />
							<input type="text" class="form-control"
								value="${pd.support_capital}" maxlength="10"
								onkeyup="value=value.replace(/[^\d.]/g,'')" id="support_capital"
								onblur="checkMoney(this);" onfocus = "clearInput(this,'0.0000')" name="support_capital"
								style="width: 100px; font-size: 18px; font-weight: 700; height: 28px; border-radius: 5px; background-color: #ecf0f9;"></td>
							<td>&nbsp;万元</td>
							</c:if>
							<c:if test="${pageMap.type==3}">
							<span style="font-size: 12px; color: red; padding-left: 50px; display: inline-block; height: 30px; vertical-align: bottom;">
									<label>※ 温馨提示：申请金额在 （3-2. 中高端境外人才实训 ）画面录入</label>
							</span> 
							</c:if>
							<td><input type="text" style="display:none"/></td>
						</tr>
					</table>
				</form>
					
			</div>

			<div class="form-group">
				<div class="col-sm-2 col-sm-offset-2" style="margin-top: 40px;">
					<button type="button" onclick="OK();"
						class="btn btn-success btn-block" style="width:172px">
						<span class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp;${pageMap.toText}
					</button>
				</div>
				<c:if test="${not empty pageMap.fromPage}">
					<div class="col-sm-2" style="margin-top: 40px;" >
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
          <div class='modal-content' style="width:150px;text-align:center;position:fixed;right:40%;bottom:45%;">
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
		 $('#'+obj+' .bar').removeClass("bar-error").css('width', progress + '%').text(progress==100 ?'完成':progress+'%');
	}
	$(function() {
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
			progress('progress',data);
		}).bind('fileuploaddone', function (e, data) {
	  	 if("no"==data.result){
		   		 $("#file_uploadCon").tips({
						 side : 2,
						 msg : "请上传格式为.pdf格式的文件。",
						 bg : '#AE81FF',
						 time : 2
					 });
		   		progressError('progress');
		   		 return false;
	  	 }else if("nosize"==data.result){
	   		 $("#file_uploadCon").tips({
				 side : 2,
				 msg : "请上传小于150MB的文件。",
				 bg : '#AE81FF',
				 time : 2
			 });
   		     return false;
		 } else {
				 if(data.result!=undefined && data.result!=""){
					 $('#progress').fadeOut(3000); 
			   		 // 设定pdf路径
			   		 $("#pdfPath").val(data.result);
			   		 // 设定pdf名称
			   		 $("#pdfName").val(data.originalFiles[0].name);
			   		 // 显示pdf名称
			   		 $("#pdfShowName").text(data.originalFiles[0].name);
			   		 var path=$("#pdfPath").val();
			   		 $("#pdfView").attr('href','<%=basePath%>'+'register/showPdf.act?pdfFile='+path);
			   		 $("#xg").show();
			   		 $("#sc").show();
			   		
				 }else{
					 progressError('progress');
				 }
				 
		   	 }
	   });
});
	function OK() {
		var type =$("#type1").val();
		if(type!=3 && type!=0){
		if(checkMoney(document.getElementById('support_capital'))){
			$("#form").submit();
		}
		}else if(type==0){
			var fileName = $("#pdfShowName").text();
	   		if(fileName=="" && fileName==""){
	   			$("#file_uploadCon").tips({
					side : 2,
					msg : "请上传审计报告文件。",
					bg : '#AE81FF',
					time : 2
				});
				$("#file_uploadCon").focus();
				return false;
	   		}
			$("#form").submit();
		}else{
			$("#form").submit();
		}
		
	 }
	function delFile(id){
		if(id !=''){
			var file_type= $("#file_type").val();
			$.ajax({
		type : "POST",
		url :'<%=basePath%>govUploadCommon/delFile.act',
					data : {
						id : id,
						file_type : file_type
					},
					dataType : 'json',
					cache : false,
					success : function(data) {
						if (data.ret > 0) {
							$('#my-modal-success-alert').show().delay(3000)
									.fadeOut(function() {
										location.reload();
									});
						} else {
							$('#my-modal-failure-alert').show().delay(3000)
									.fadeOut(function() {
										location.reload();
									});
						}
					}
				});
			} else {
				$('#my-modal-success-alert').show().delay(3000).fadeOut(
						function() {
							location.reload();
						});
			}
		}
	// 预览保险权益记录单
    function viewPdf() {
		var path = $("#pdfPath").val();
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
	function myNumberic(e,len) {
	    var obj=e.srcElement || e.target;
	    var dot=obj.value.indexOf(".");//alert(e.which);
	    len =(typeof(len)=="undefined")?4:len;
	    alert(len);
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
	</script>
	<jsp:include page="../../common/govCatalog.jsp"></jsp:include>
</body>
</html>