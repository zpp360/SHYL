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
<base href="<%=basePath%>">

<meta charset="utf-8" />
<title>指南修改_济南市服务外包公共服务平台</title>
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
	width: 140px;
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
</style>
<script type="text/javascript">
	//合并 $(function(){});
	$(top.hangge());
	$(function() {
		$("#weixin_image").fileupload({
			 dataType :'iframe text',
			 autoUpload: true,
			 maxNumberOfFiles : 1,
	        url: '<%=basePath%>register/Upload.act',
	        sequentialUploads: true
		 }).bind('fileuploadchange', function (e, data) {
			 if(data.files.length > 1){
				 $("#weixin_show").tips({
						side : 2,
						msg : '只能上传一张照片。',
						bg : '#AE81FF',
						time : 3
				 });
	             return false;
			 }
	    }).bind('fileuploaddone', function (e, data) {
	   	 if("no"==data.result){
	   		$("#weixin_show").tips({
				side : 2,
				msg : '请上传格式为.jpg/.jpeg/.png./gif格式的图片。',
				bg : '#AE81FF',
				time : 3
			});
	   		$("#weixin_show").attr("src","<%=basePath%>shyl/images/temp.png");
			return false;
	   	 } else {
	   		 $("#weixin_show").attr("src","<%=basePath%>images/"+data.result);
	            document.getElementById("license").value=data.result;
	   	 }
	    });
		
		//合并 $(function(){});
		//下拉框
		$(".chzn-select").chosen();
		$(".chzn-select-deselect").chosen({
			allow_single_deselect : true
		});
		
	});
</script>
<script type="text/javascript">
	//保存
	function save() {
		if ($("#category").val() == "") {
			$("#category").tips({
				side : 3,
				msg : '请选择指南类型',
				bg : '#FF5080',
				time : 2
			});
			$("#category").focus();
			return false;
		}
		if ($("#title").val() == "") {
			$("#title").tips({
				side : 3,
				msg : '请输入指南名称',
				bg : '#FF5080',
				time : 2
			});
			$("#title").focus();
			return false;
		}
		if ($("#guide_sources").val() == "") {
			$("#guide_sources").tips({
				side : 3,
				msg : '请输入指南来源',
				bg : '#FF5080',
				time : 2
			});
			$("#guide_sources").focus();
			return false;
		}
		if ($("#guide_content").val() == "") {
			$("#guide_content").tips({
				side : 3,
				msg : '请输入指南内容',
				bg : '#FF5080',
				time : 3
			});
			$("#guide_content").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
	//返回
    function returnback(){
    	window.location.href="<%=basePath%>guide/list.do";
	}
</script>
</head>
<body>
	<br>
	<form action="<%=basePath%>guide/${msg}.do" name="Form" id="Form" method="post">
		<div id="zhongxin">
			<input type="hidden" name="employment_id" id="employment_id"
				value="${pd.employment_id}" />
			<table class="table ">
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>指南类别</B></td>
					<td><select class="chzn-select" name="category" id="category"
						data-placeholder="请选择指南类别" style="height: 20px; width: 315px">
							<option value=""></option>
							<c:forEach items="${NList}" var="ind">
								<option value="${ind.distinguish_id }"
									<c:if test="${ind.distinguish_id == pd.category}">selected</c:if>>${ind.value }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>指南名称</B></td>
					<td><input type="text" name="title" id="title"
						value="${pd.title}" maxlength="50"
						style="height: 30px; width: 300px;margin-top:2px;" placeholder="请输入指南名称"
						title="指南名称" onblur="trim(this);" /></td>
				</tr>

				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>指南来源</B></td>
					<td><input type="text" name="guide_sources" id="guide_sources"
						value="${pd.guide_sources}" maxlength="50"
						style="height: 30px; width: 300px;margin-top:2px;" placeholder="请输入指南来源"
						title="指南来源" onblur="trim(this);" /></td>
				</tr>
				<tr>
				    <td style="width: 80px; text-align: left; padding-top: 13px;"><B>缩略图片</B></td>
					<td>
						<div class="form-group" id="businessDiv">
						    <div class="upload_img">
							    <input id="license" name="license" type="hidden" value=""/>
							    <c:if test="${empty pd.guide_thumbnail}">
									<img id="weixin_show" name="weixin_show" style="width: 158px; height: 190px;" src="<%=basePath%>shyl/images/temp.png">
								</c:if>
								<c:if test="${!empty pd.guide_thumbnail}">
						        	<img id="weixin_show" name="weixin_show" style="width: 158px; height: 190px;" onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="<%=basePath%>images/${pd.guide_thumbnail}">
						        </c:if>
								<a href="javascript:;" class="a-upload" style="text-decoration:none; color:#ffffff;">上传本地图片
								<input type="file" id="weixin_image" placeholder="上传本地图片" name="weixin_image" multiple></a>
								<p>支持的文件格式为.gif、.jpeg、.jpg、.png</p>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td nowrap="nowrap"
						style="width: 80px; text-align: left; padding-top: 13px;"><B>指南内容</B></td>
					<td><textarea id="guide_content" name="guide_content"
							style="min-height: 450px; margin: 0 auto; width: 80%;float:left"
							title="指南内容">${pd.guide_content}</textarea></td>
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
		</div>
		<div id="zhongxin2" class="center" style="display: none">
			<br /> <br /> <br /> <br /> <img src="<%=basePath%>static/images/jiazai.gif" /><br />
			<h4 class="lighter block green">提交中...</h4>
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
	<!-- 实例化编辑器 -->
	<script type="text/javascript">
		var ue = UE.getEditor("guide_content");
		//ueditor有标签文本

		function getContent() {
			var arr = [];
			arr.push(UE.getEditor('guide_content').getContent());
			return arr.join("");
		}

		function clean() {
			ue.setContent("");
		}

		function setFocus() {
			UE.getEditor('guide_content').focus();
		}
	</script>
	<!-- 富文本编辑器end -->
</body>
</html>