<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<meta charset="utf-8" />
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../../system/admin/top.jsp"%>
<link rel="stylesheet" href="shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="shyl/fileupload/css/jquery.fileupload-ui.css">
<script src="shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
<script src="shyl/fileupload/js/jquery.fileupload.js"></script>
<script src="shyl/fileupload/js/jquery.fileupload-process.js"></script>
<script src="shyl/fileupload/js/jquery.fileupload-validate.js"></script>
<script src="shyl/fileupload/js/jquery.iframe-transport.js"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<style>
.upload_img{
	float: left;width: 60%;position: relative;
}
.upload_img img{float: left;}
.upload_img a{
	position: absolute;
	left: 210px;
	top:0;
	font-size: 0.85em;
	border:0;
	background-color: #3961c2;
	color: #fff;
	padding: 0;
	width: 160px;
	text-align: center;
	height: 50px;
	line-height: 50px;
	display: inline-block;border-radius:4px;
    float: left;
    margin-top: 20px;
}
.upload_img p{
	position: absolute;
	bottom:50px;
	left: 210px;
	color: #737373;
	line-height: 30px;
	width: 60%;
	font-size: 1.1em;
	float: left;
}
.upload_img p i{
	color: #1c1c1c;font-weight: bold;
	font-size: 1.1em;
}
select, input[type="file"] {
    height: 45px;
    line-height: 30px;
}
.uploadbtn{
    position: absolute;
    top: 0;
    margin: 0;
    opacity: 0;
    -ms-filter: 'alpha(opacity=0)';
    font-size: 8px !important;
    direction: ltr;
    height: 100px;
    width: 300px;
    cursor: pointer;  
}
.a-upload {
    padding: 4px 10px;
    height: 20px;
    line-height: 20px;
    position: relative;
    cursor: pointer;
    color: #888;
    background: #fafafa;
    border: 1px solid #ddd;
    border-radius: 4px;
    overflow: hidden;
    display: inline-block;
    *display: inline;
    *zoom: 1
}
.a-upload input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
    filter: alpha(opacity=0);
    cursor: pointer
}
.upload a{
	position: absolute;
	left: 330px;
	font-size: 0.85em;
	border:0;
	background-color: #3961c2;
	color: #fff;
	padding: 0;
	width: 100px;
	text-align: center;
	height: 30px;
	line-height: 30px;
	display: inline-block;border-radius:4px;
    float: left;
    margin-left: 100px;
}
.upload p{
	bottom:50px;
	left: 100px;
	color: #737373;
	line-height: 30px;
	width: 60%;
	font-size: 1.1em;
}
</style>

</head>
<body>
<br>
	<form action="" name="Form" id="Form"
		method="post">
		<div id="zhongxin">
		<input type="hidden" name="attr_id" id="attr_id" value="${pd.attr_id }"/>
			<table class="table ">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>属性名称</B></td>
					<td><input type="text" disabled="disabled" value="${pd.attr_name}" name="unit_name_abbreviation" id="unit_name_abbreviation" maxlength="40"
						 style="height: 20px; width: 300px;" 
						title="属性名称" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>属性类型</B></td>
					<td><input type="text" disabled="disabled" value="${attr_type}" name="unit_name_full" id="unit_name_full" maxlength="60"
						 style="height: 20px; width: 300px;" 
						title="属性类型" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap"
						style="width: 80px; text-align: left; padding-top: 13px;"><B>属性简介</B></td>
					<td>
					<textarea id="introduction" name="introduction" readonly="readonly"
							style="min-height: 450px; margin: 0 auto;width:80%;float:left;" title="单位简介">${pd.attr_desc}</textarea>
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		<div align="center" style="margin-top: 10px;">
			<a class="btn  btn-light" onclick="returnback()"><i class=" icon-circle-arrow-left"></i>返回</a>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="<%=basePath%>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	<!-- 引入 -->
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript"
		src="static/js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->

	<!-- 日期框 -->
	<!-- 富文本编辑器start -->
	<!-- 配置文件 -->
	<script type="text/javascript" src="plugins/ueditor/ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript" src="plugins/ueditor/ueditor.all.js"></script>
	<!-- 实例化编辑器 -->
	<script type="text/javascript">
		var ue = UE.getEditor("introduction", {readonly:true});
		//ueditor有标签文本

		function getContent() {
			var arr = [];
			arr.push(UE.getEditor('introduction').getContent());
			return arr.join("");
		}

		function clean() {
			ue.setContent("");
		}

		function setFocus() {
			UE.getEditor('introduction').focus();
		}
	</script>
	<!-- 富文本编辑器end -->

	<script type="text/javascript">
	 function returnback(){
	    	window.location.href="<%=basePath%>extendAttr/list.do";
		}

</script>
<!-- 附件上传 -->
	<script type="text/javascript">
	var tips=function(id,msg){
		$("#"+id).tips({
			side : 2,
			msg : msg,
			bg : '#FF5080',
			time : 2
		});
	}
	//文件上传
	 $("#file_upload").fileupload({
		dataType :'iframe text',
		autoUpload: true,
		maxNumberOfFiles : 1,
		maxFileSize: 50000000,
        url: '<%=basePath%>news/upload.do',
		sequentialUploads : true,
		add: function (e, data) {
			var oldpath = $("#appendix_path").val();
			 data.url = '<%=basePath%>news/upload.do?oldpath='+oldpath;
			 data.submit();
		}
		}).bind('fileuploadchange', function(e, data) {			 
			if (data.files.length > 1) {
				tips("fileDiv", "只能上传一个文件。");
				return false;
			}
		}).bind('fileuploaddone', function(e, data) {
			var result=data.result;
			if ("no" == data.result) {
				tips("fileDiv", "请上传格式为.doc/.docx/.xls/.xlsx/.ppt/.pptx/.txt/.jpg格式的文档文件。");
			}else if(undefined == result){
				tips("fileDiv", "上传失败，可能是文件过大造成。");
			}else {
				$("#appendix_path").val(data.result);
				$("#appendix_name").val(data.originalFiles[0].name);				
				$("#appendix_path").text(data.result);
				$("#appendix_name").text(data.originalFiles[0].name);
				$("#docName").val(data.originalFiles[0].name);
			}
		});
	//附件删除
	function removeAppendix(id,path){
		$.post('<%=basePath%>news/deleteAppendix.do', {news_id:id,path:path}, function(data){
			if(data == 'success'){
				$("#docName").val('');
				$("#appendix_path").val('');
				$("#appendix_name").val('');
			}
		});
	}
	 </script>

</body>
</html>