<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String info_id= request.getParameter("info_id");//用request得到 
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>专线明细信息修改_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/uploadify.css">
<script src="<%=basePath%>shyl/js/jquery-1.7.2.js"></script>
<script src="<%=basePath%>shyl/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>shyl/js/jquery.min.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.min.js"></script>
<script src="<%=basePath%>shyl/js/datepicker/WdatePicker.js"
	type="text/javascript"></script>
<link href="<%=basePath%>shyl/css/maincss/mypage.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet"
	href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<script src="<%=basePath%>shyl/js/mainjs/errImage.js"
	type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/jquery.placeholder.js"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<style type="text/css">
.textareatxt2 {
	background-color: #f7f7f7 !important;
}

.edui-default .edui-editor {
	background-color: #ecf0f9 !important;
}

div.mypage_right div.input_class ul li span {
	width: 130px !important;
}

.select_btnNew {
	display: inline-block;
	margin-bottom: 0;
	font-size: 14px;
	line-height: 42px;
	color: #333;
	text-align: center;
	text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
	vertical-align: middle;
	cursor: pointer;
	background-color: #f5f5f5;
	background-repeat: repeat-x;
	border: 1px solid #ccc;
	border-color: #e6e6e6 #e6e6e6 #bfbfbf;
	border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
	border-bottom-color: #b3b3b3;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff',
		endColorstr='#ffe6e6e6', GradientType=0);
	filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
	-webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	-moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
		rgba(0, 0, 0, 0.05);
}

.btnNew {
	float: left;
	margin-top: 5px;
	width: 275px;
}
</style>
<script type="text/javascript">
$(function() {
	$("#file_upload").fileupload({
		 autoUpload: true,
		 maxNumberOfFiles : 3,
		 url: '<%=basePath%>line/uploadline.act',
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
     }).bind('fileuploaddone', function (e, data) {
    	 if("no"==data.result){
	   		 $("#file_uploadCon").tips({
					 side : 2,
					 msg : "请上传格式为.pdf格式的文件。",
					 bg : '#AE81FF',
					 time : 2
				 });
	   		 return false;
	   	 } else {
	   		 $("#voucher_path").val(data.result);
	   		 $("#voucher_name").val(data.originalFiles[0].name);
	   		 $("#docName").text(data.originalFiles[0].name);
	   	 }
     });
});

//保存
function save(){
	if(localcheck()){
		$("#lineForm").attr('action','<%=basePath%>line/updateLine.act');
		$("#lineForm").submit();
	}
}

	function localcheck(){
	if($("#apply_abstract").val() == ""){
		$("#apply_abstract").tips({
			side : 2,
			msg : "请输入专线明细摘要",
			bg : '#AE81FF',
			time : 2
		});
		$("#apply_abstract").focus();
		return false;
	}
	if($("#apply_amount").val() == ""){
		$("#apply_amount").tips({
			side : 2,
			msg : "请输入申请金额",
			bg : '#AE81FF',
			time : 2
		});
		$("#apply_amount").focus();
		return false;
	}
	if($("#apply_time").val() == ""){
		$("#apply_time").tips({
			side : 2,
			msg : "请选择申请时间",
			bg : '#AE81FF',
			time : 2
		});
		return false;
	}
	if($("#voucher_num").val() == ""){
		$("#voucher_num").tips({
			side : 2,
			msg : "请输入凭证号",
			bg : '#AE81FF',
			time : 2
		});
		$("#voucher_num").focus();
		return false;
	}
	if($("#voucher_path").val() == ""){
		$("#file_upload").tips({
			side : 2,
			msg : "请上传凭证",
			bg : '#AE81FF',
			time : 2
		});
		return false;
	}
	return true;
} 

//返回
function returnback(){
	var info_id=$("#info_id").val();
	window.location.href='<%=basePath%>line/list.act?info_id='+info_id;
	}
</script>
</head>
<body id="top" style="background-color: #f7f7f7;">
	<jsp:include page="../../common/header.jsp"></jsp:include>
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>

		<jsp:include page="../../common/left.jsp"><jsp:param value="2" name="menuType"/></jsp:include>

		<div class="mypage_right">
			<h2>修改专线明细信息</h2>
			<form class="form-horizontal company_list" role="form" id="lineForm" name="lineForm" action="" method="post">
				<input type="hidden" id="id" name="id" value="${pd.id}"/>
				<input type="hidden" id="info_id" name="info_id" value="${pd.info_id}"/>
				<!-- end -->
				<div class="input_class">
					<ul style="margin-bottom: 20px;">
					<li style="width: 800px;">
					 	<span><small style="color: red">*</small>摘要：</span>
						<input type="text" class="inputtxt2" style="width: 500px;" maxlength="20" id="apply_abstract" name="apply_abstract" placeholder="请输入专线明细摘要" onblur="trim(this);" value="${pd.apply_abstract}">
					</li>
					<li style="width: 800px;">
					 	<span><small style="color: red">*</small>金额：</span>
						<input type="text" class="inputtxt2" style="width: 500px;" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" maxlength="10" id="apply_amount" name="apply_amount" placeholder="请输入申请金额" onblur="changeFloat(this);" style="ime-mode:disabled" value="${pd.apply_amount}">
					</li>
					<li style="width: 800px;">
					 	<span><small style="color: red">*</small>日期：</span>
					 	<input class="inputtxt2" id="apply_time" name="apply_time" style="width:500px;" onfocus="WdatePicker({isShowWeek:true});" value="${pd.apply_date}" type="text" placeholder="请选择申请时间">
					</li>
					<li style="width: 800px;">
					 	<span><small style="color: red">*</small>凭证号：</span>
						<input type="text" class="inputtxt2" style="width: 500px;" onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="15" id="voucher_num" name="voucher_num" placeholder="请输入凭证号" onblur="trim(this);" value="${pd.voucher_num}">
					</li>
				</ul>
				<div class="form-group">
					<div class="col-sm-12">
						<div style="margin-left: 13%" id="docName"></div>
					</div>
					<div class="col-sm-5" style="margin-left: 13%">
						<div class="caption" align="center" style="width: 100px;">
							<span id="file_uploadCon" class="btn btn-primary fileinput-button" style="margin-top: 20px;"> 
								<span>上传专线明细凭证</span> 
								<input type="file" id="file_upload" name="file_upload" multiple />
							</span>
						</div>
						<div class="help-block" style="margin-top: 30px;">支持文件格式为.pdf</div>
					</div>
					<input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="voucher_path" maxlength="255" onblur="trim(this);" name="voucher_path" type="text" value="${pd.voucher_path}" />
					<input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="voucher_name" maxlength="255" onblur="trim(this);" name="voucher_name" type="text" value="${pd.voucher_name}" />
				</div>
				</div>
			</form>
			<a href="javascript:void(0);" class="save3" onclick="save();">保存</a>
				<a href="javascript:void(0);" class="sback" onclick="returnback();">返回</a>
		</div>
	</div>

	<!-- Modal -->
	
	<script src="<%=basePath%>shyl/js/jquery.uploadify.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>shyl/js/jquery.tips.js"></script>
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
	</script>
	<%@ include file="../../common/footer.jsp"%>
</body>
</html>