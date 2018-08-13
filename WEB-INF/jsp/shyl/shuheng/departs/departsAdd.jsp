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
<title>部门管理_老干部APP</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../../system/admin/top.jsp"%>
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<!-- 日期框 -->
<script type="text/javascript">
	//保存
	function save() {
		if ($("#UNIT_ID").val() == "") {
			$("#UNIT_ID").tips({
				side : 3,
				msg : '请选择单位名称',
				bg : '#FF5080',
				time : 2
			});
			$("#UNIT_ID").focus();
			return false;
		}
		if ($("#DEPART_NAME").val() == "") {
			$("#DEPART_NAME").tips({
				side : 3,
				msg : '请输入部门名称',
				bg : '#FF5080',
				time : 2
			});
			$("#DEPART_NAME").focus();
			return false;
		}
		if ($("#INTRODUCTION").val() == "") {
			$("#INTRODUCTION").tips({
				side : 3,
				msg : '请输入简介',
				bg : '#FF5080',
				time : 3
			});
			$("#policies_content").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
</script>
<style type="text/css">
.upload{
	float: left;width: 60%;position: relative;
}
.upload a{
	position: absolute;
	left: 230px;
	top:0;
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
.upload p i{
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
</style>
</head>
<body>
<br>
	<form action="<%=basePath%>departs/${msg }.do" name="Form" id="Form" method="post">
		<div id="zhongxin">
			<table class="table ">
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>单位名称</B></td>
					<td><select class="chzn-select" name="UNIT_ID" id="UNIT_ID"
						data-placeholder="请选择单位名称"  style="height: 20px; width: 315px;">
										<c:forEach items="${NList}" var="ind">
											<option value="${ind.UNIT_ID }" <c:if test="${ind.UNIT_ID == pd.UNIT_ID}">selected</c:if>>${ind.UNIT_NAME_ABBREVIATION }</option>
										</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>部门名称</B></td>
					<td><input type="text" name="DEPART_NAME" id="DEPART_NAME" maxlength="40"
						 style="height: 20px; width: 300px;" placeholder="请输入部门名称"
						title="部门名称" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap"
						style="width: 80px; text-align: left; padding-top: 13px;"><B>简介</B></td>
					<td><textarea id="policies_content" name="INTRODUCTION" maxlength="10000" 
							style="min-height: 450px; margin: 0 auto; width: 80%;float:left" 
							title="简介"></textarea></td>
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

			<a class="btn  btn-success" onclick="save();"><i class="icon-save"></i>保存</a> 
			<a class="btn  btn-light" onclick="returnback()"><i class=" icon-circle-arrow-left"></i>返回</a>

			<!-- <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a> -->
		</div>
		<div id="zhongxin2" class="center" style="display: none">
			<br /> <br /> <br /> <br /> <img src="<%=basePath%>static/images/jiazai.gif" /><br />
			<h4 class="lighter block green"></h4>
		</div>
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
	<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
	<!-- 实例化编辑器 -->
	<script type="text/javascript">
		var ue = UE.getEditor("policies_content");
		//ueditor有标签文本

		function getContent() {
			var arr = [];
			arr.push(UE.getEditor('policies_content').getContent());
			return arr.join("");
		}

		function clean() {
			ue.setContent("");
		}

		function setFocus() {
			UE.getEditor('policies_content').focus();
		}
	</script>
	<!-- 富文本编辑器end -->

	<script type="text/javascript">
		$(top.hangge());
		//返回
	    function returnback(){
	    	window.location.href="<%=basePath%>policies/list.do";
		}
		$(function() {
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			//日期框
			$('.date-picker').datepicker();
			$('.date-picker1').datepicker({
				language : 'zh-CN',
				format : 'yyyy-mm',
				weekStart : 1,
				todayBtn : 'linked',
				autoclose : 1,
				todayHighlight : 1,
				minViewMode : 'months', //这里就设置了默认视图为年视图
				minView : 3, //设置最小视图为年视图
				forceParse : 0
			});
		});
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
        url: '<%=basePath%>policies/upload.do',
		sequentialUploads : true,
		add: function (e, data) {
			var oldpath = $("#appendix_path").val();
			 data.url = '<%=basePath%>policies/upload.do?oldpath='+oldpath;
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
			}else if('outsize' == result){
				tips("fileDiv", "上传失败，文件最大为50M。");
			}else {
				$("#appendix_path").val(data.result);
				$("#appendix_name").val(data.originalFiles[0].name);				
				$("#appendix_path").text(data.result);
				$("#appendix_name").text(data.originalFiles[0].name);
				$("#docName").val(data.originalFiles[0].name);
			}
		});
	//附件删除
	function removeAppendix(){
		var path = $("#appendix_path").val();
		$.post('<%=basePath%>government/deleteAppendix.do', {path:path}, function(data){
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