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
<title>活动管理追加画面</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../../system/admin/top.jsp"%>
<link rel="stylesheet" href="shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="shyl/fileupload/css/jquery.fileupload-ui.css">
<link rel="stylesheet" href="static/css/jquery.datetimepicker.css">
<script src="static/js/jquery.datetimepicker.full.js"></script>
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
<script type="text/javascript">
	// 合并$(function(){});
	$(top.hangge());
	$(function() {
		$("#weixin_image").fileupload({
			 dataType :'iframe text',
			 autoUpload: true,
			 maxNumberOfFiles : 1,
	        url: '<%=basePath%>register/Upload.do',
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
		
		// 合并$(function(){});
		//下拉框
		$(".chzn-select").chosen();
		$(".chzn-select-deselect").chosen({
			allow_single_deselect : true
		});
		//日期框
		$.datetimepicker.setLocale('ch');
		$('#START_TIME').datetimepicker({
		dayOfWeekStart : 1,
		lang:'ch',
		startDate:	currentDay()
		});

		$('#START_TIME').datetimepicker({value:currentTime(),step:10});
		
		$('#END_TIME').datetimepicker({
			dayOfWeekStart : 1,
			lang:'ch',
			startDate:	currentDay()
		});
		$('#END_TIME').datetimepicker({value:currentTime(),step:10});
		
		function currentTime(){
		var d = new Date(),str = '';
		 str += d.getFullYear()+'年';
		 str  += d.getMonth() + 1+'月';
		 str  += d.getDate()+'日';
		 str += d.getHours()+'时'; 
		 str  += d.getMinutes()+'分'; 
		return str;
		}

		function currentDay(){
		var d = new Date(),str = '';
		 str += d.getFullYear()+'年';
		 str  += d.getMonth() + 1+'月';
		 str  += d.getDate()+'日';
		return str;
		}		
	});
</script>
<!-- 日期框 -->
<script type="text/javascript">

	//保存
	function save() {
		if ($("#TITLE").val() == "") {
			$("#TITLE").tips({
				side : 3,
				msg : '请选择活动标题',
				bg : '#FF5080',
				time : 2
			});
			$("#TITLE").focus();
			return false;
		}
		if ($("#START_TIME").val() == "") {
			$("#START_TIME").tips({
				side : 3,
				msg : '请输入开始时间',
				bg : '#FF5080',
				time : 2
			});
			$("#START_TIME").focus();
			return false;
		}
		
		if ($("#END_TIME").val() == "") {
			$("#END_TIME").tips({
				side : 3,
				msg : '请输入结束时间',
				bg : '#FF5080',
				time : 2
			});
			$("#END_TIME").focus();
			return false;
		}
		
		if ($("#PERSION_CHARGE").val() == "") {
			$("#PERSION_CHARGE").tips({
				side : 3,
				msg : '请输入负责人',
				bg : '#FF5080',
				time : 2
			});
			$("#PERSION_CHARGE").focus();
			return false;
		}
		if ($("#TEL_NUM").val() == "") {
			$("#TEL_NUM").tips({
				side : 3,
				msg : '请输入负责人电话',
				bg : '#FF5080',
				time : 2
			});
			$("#TEL_NUM").focus();
			return false;
		}
		
		if ($("#PLACE_NAME").val() == "") {
			$("#PLACE_NAME").tips({
				side : 3,
				msg : '请输入场所',
				bg : '#FF5080',
				time : 2
			});
			$("#PLACE_NAME").focus();
			return false;
		}
		if ($("#SUMMARY").val() == "") {
			$("#SUMMARY").tips({
				side : 3,
				msg : '请输入活动内容',
				bg : '#FF5080',
				time : 3
			});
			$("#SUMMARY").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
</script>
</head>
<body>
<br>
	<form action="<%=basePath%>activity/${msg }.do" name="Form" id="Form"
		method="post">
		<div id="zhongxin">
		<input type="hidden" name="ACTIVITY_ID" id="ACTIVITY_ID" value="${pd.ACTIVITY_ID }"/>
			<table class="table ">
			
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>活动标题</B></td>
					<td><input type="text" name="TITLE" id="TITLE" maxlength="40"
						style="height: 20px; width: 300px;margin-top:2px" placeholder="请输入活动标题"
						title="活动标题" value="${pd.TITLE}" onblur="trim(this);" /></td>
				</tr>
				
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>开始时间</B></td>
					<td><input type="text" value="${pd.START_TIME}" name="START_TIME" id="START_TIME"  placeholder="开始时间"  title="开始时间" style=" width: 300px"/></td>
				</tr>
				
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>结束时间</B></td>
					<td><input name="END_TIME" id="END_TIME" value="${pd.END_TIME}" type="text"  placeholder="结束时间"  title="结束时间" style=" width: 300px"/></td>
				</tr>
				
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>负责人</B></td>
					<td><input type="text" name="PERSION_CHARGE" id="PERSION_CHARGE"
						maxlength="40" style="height: 20px; width: 300px;"
						placeholder="请输入负责人" title="负责人" value="${pd.PERSION_CHARGE}" onblur="trim(this);" /></td>
				</tr>
				
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>负责人电话</B></td>
					<td><input type="text" name="TEL_NUM" id="TEL_NUM"
						maxlength="40" style="height: 20px; width: 300px;"
						placeholder="负责人电话" title="负责人电话" value="${pd.TEL_NUM}" onblur="trim(this);" /></td>
				</tr>
				
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>场所</B></td>
					<td><input type="text" name="PLACE_NAME" id="PLACE_NAME"
						maxlength="40" style="height: 20px; width: 300px;"
						placeholder="场所" title="场所" value="${pd.PLACE_NAME}" onblur="trim(this);" /></td>

				</tr>
				
				<tr>
					<td nowrap="nowrap"
						style="width: 80px; text-align: left; padding-top: 13px;"><B>活动内容</B></td>
					<td><textarea id="SUMMARY" name="SUMMARY"
							style="min-height: 450px; margin: 0 auto; width: 80%; float: left;"
							title="活动内容"></textarea></td>
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
		var ue = UE.getEditor("SUMMARY");
		//ueditor有标签文本

		function getContent() {
			var arr = [];
			arr.push(UE.getEditor('SUMMARY').getContent());
			return arr.join("");
		}

		function clean() {
			ue.setContent("");
		}

		function setFocus() {
			UE.getEditor('SUMMARY').focus();
		}
	</script>
	<!-- 富文本编辑器end -->

	<script type="text/javascript">
	 function returnback(){
	    	window.location.href="<%=basePath%>activity/list.do";
		}

</script>
</body>
</html>