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
<title>培训课程信息添加_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<jsp:include page="../../common/header.jsp"></jsp:include>
<link href="<%=basePath%>shyl/css/maincss/jquery-ui.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link rel="stylesheet"
	href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet"
	href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<script src="<%=basePath%>shyl/js/mainjs/jquery-v1.10.2.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="<%=basePath%>shyl/js/jquery-1.7.1.js"></script>
<script type="text/javascript"
	src="<%=basePath%>shyl/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>shyl/js/mainjs/jquery-ui.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js"
	type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<script type="text/javascript">
//ie8支持placeholder
$(function(){
	$('input, textarea').placeholder({customClass:'my-placeholder'});
	
	// 合并$(function(){});
	var tips=function(id,msg){
		$("#"+id).tips({
			side : 2,
			msg : msg,
			bg : '#AE81FF',
			time : 3
		});
	}
	
	 $("#file_upload").fileupload({
		 dataType :'iframe text',
		 autoUpload: true,
		 maxNumberOfFiles : 1,
         url: '<%=basePath%>register/Upload.act',
         sequentialUploads: true
	 }).bind('fileuploadchange', function (e, data) {
		 if(data.files.length > 1){
			 tips("file_upload","只能上传一张照片。");
             return false;
		 }
     }).bind('fileuploaddone', function (e, data) {
    	 if("no"==data.result){
    		 tips("file_upload","请上传格式为.jpg/.jpeg/.png./gif格式的图片。");
    		 $("#imgP").attr("src","<%=basePath%>shyl/images/upimg.jpg");
    	 } else {
    		 $("#imgP").attr("src","<%=basePath%>images/" + data.result);
				document.getElementById("course_path").value = data.result;
			}
		});
	});
	//$.ajaxSetup({ async: false });

	$(document).ready(function() {
		var result = $('#result').val();
		if (result == "success") {
			$('#my-modal-success-alert').show().delay(1000).fadeOut();
		} else if (result == "error") {
			$('#my-modal-failure-alert').show().delay(1000).fadeOut();
		}
		$('#result').val('');
		if ($("#period").val() == "0") {
			$("#period").val("");
		}
		if ($("#course_time").val() == "0") {
			$("#course_time").val("");
		}
		return;
	});
	// 课程名称
	function checkCourseName() {
		// 课程名称验证
		var course_name = $("#course_name").val();
		if (course_name == "") {
			$("#course_name").tips({
				side : 2,
				msg : '请输入课程名称',
				bg : '#AE81FF',
				time : 3
			});
			return true;
		}
	}
	// 课时
	function checkPeriod() {
		// 课时验证
		var period = $("#period").val();
		if (period == "0") {
			$("#period").val("");
			$("#period").tips({
				side : 2,
				msg : '请检查课时是否大于0',
				bg : '#AE81FF',
				time : 3
			});
			return true;
		} else if (period == "") {
			$("#period").tips({
				side : 2,
				msg : '请填写课时',
				bg : '#AE81FF',
				time : 3
			});
			return true;
		} else {
			var PsdFilter = /^\d+(?=\.{0,1}\d+$|$)/;
			if (!(PsdFilter.test(period))) {
				$("#period").tips({
					side : 2,
					msg : '课时只允许为数字',
					bg : '#AE81FF',
					time : 3
				});
				$("#period").focus();
				return false;
			} else {
				if ($("#period").val() == "0") {
					$("#period").val("");
				}
			}
		}
	}
	// 时长
	function checkCourseTime() {
		//时长
		var course_time = $("#course_time").val();
		if (course_time == "0") {
			$("#course_time").val("");
			$("#course_time").tips({
				side : 2,
				msg : '请检查输入时长是否大于0',
				bg : '#AE81FF',
				time : 3
			});
			return true;
		} else if (course_time == "") {
			$("#course_time").tips({
				side : 2,
				msg : '请填写时长',
				bg : '#AE81FF',
				time : 3
			});
			return true;
		} else {
			if ($("#course_time").val() == "0") {
				$("#course_time").val("");
			}
		}
	}
	// 讲师
	function checkTeacher() {
		// 讲师验证
		var teacher = $("#teacher").val();
		if (teacher == "") {
			$("#teacher").tips({
				side : 2,
				msg : '请选择讲师姓名',
				bg : '#AE81FF',
				time : 3
			});
			return true;
		}
		//名字中包含不能包含特殊字符
		var ze = new RegExp(
				"[`~!@#$%^&*()-=|\"{}':;',\/\\[\\].<>/?~！@#￥……&*（）—=+|{}【】《》‘；：”“'。，、？]");
		if (ze.test(teacher)) {
			$("#teacher").tips({
				side : 2,
				msg : '讲师名字不能包含特殊字符或数字',
				bg : '#AE81FF',
				time : 3
			});
			return true;
		}
		// 讲师名字验证不能涵盖特殊字符
		if (teacher.length < 1) {
			$("#teacher").tips({
				side : 2,
				msg : '讲师名字最少一个字符',
				bg : '#AE81FF',
				time : 3
			});
			return true;
		}
	}
	// 上传图片
	function checkImgp() {
		// 课程名称验证
		var course_path = $("#course_path").val();
		if (course_path == "") {
			$("#imgP").tips({
				side : 2,
				msg : '请上传课程图片',
				bg : '#AE81FF',
				time : 3
			});
			return true;
		}
	}
	//提交表单
	function sub() {
		// 课程名称验证
		if (checkCourseName()) {
			$("#teache_name").focus();
			return;
		}
		// 课程课时验证
		if (checkPeriod()) {
			$("#Period").focus();
			return;
		}
		// 课程时间验证
		if (checkCourseTime()) {
			$("#course_time").focus();
			return;
		}
		// 课程讲师验证
		if (checkTeacher()) {
			$("#teacher").focus();
			return;
		}
		// 上传图片验证
		if (checkImgp()) {
			$("#course_path").focus();
			return;
		}
		$("#form1").submit();
		$("#my-modal-success-alert").show().delay(2000).fadeOut();

	}
</script>
<script type="text/javascript">
	var checkSubmitFlg = false;
	function checkSubmit() {
		if (checkSubmitFlg == true) {
			return false; //当表单被提交过一次后checkSubmitFlg将变为true,根据判断将无法进行提交。
		}
		checkSubmitFlg == true;
		return true;
	}
</script>
</head>
<body id="top" style="background-color: #f7f7f7;">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param
				value="14" name="menuType" /></jsp:include>
		<div class="mypage_right">
			<h2>课程信息</h2>
			<form action="<%=basePath%>institutionCtrl/toAddCourses.act"
				class="form-horizontal" id="form1" method="post"
				onsubmit="return checkSubmit();">
				<!-- start -->
				<input type="hidden" id="result" name="result" value="${pd.result}">
				<input type="hidden" id="institutions_id" name="institutions_id"
					value="${pd.institutions_id}">
				<div class='modal my-modal-alert' id='my-modal-success-alert'>
					<div class='modal-dialog boxBodySmall'>
						<div class='modal-content'
							style="width: 150px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
							<div class='modal-body' id='modal-body-alert'>
								<img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;添加成功!
							</div>
						</div>
					</div>
				</div>

				<div class='modal my-modal-alert' id='my-modal-failure-alert'>
					<div class='modal-dialog boxBodySmall'>
						<div class='modal-content'
							style="width: 150px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
							<div class='modal-body' id='modal-body-alert'>
								<img alt="" src="<%=basePath%>shyl/images/fail.png">&nbsp;&nbsp;添加失败!
							</div>
						</div>
					</div>
				</div>
				<!-- end -->
				<div class="input_class">
					<ul>
						<li><span><small style="color: red">*</small>课程名称：</span> <input
							class="inputtxt2" data-val="true" data-val-required="*"
							onblur="checkCourseName();" id="course_name" onblur="trim(this);"
							name="course_name" size="50" maxlength="20" type="text" value=""
							placeholder="请输入培训课程名称" /> <span class="field-validation-valid"
							data-valmsg-for="Contact" data-valmsg-replace="true"></span></li>
						<li><span><small style="color: red">*</small>课时(节)：</span> <input
							class="inputtxt2" data-val="true" data-val-required="*"
							onblur="checkPeriod();"
							onkeyup="value=value==0?'':value.replace(/[^0-9]/g,'')" id=period
							name="period" maxlength="10" type="text" value="0"
							placeholder="请输入培训课程课时" style="ime-mode: disabled" /> <span
							class="field-validation-valid" data-valmsg-for="Phone"
							data-valmsg-replace="true"></span></li>
					</ul>
					<ul>
						<li><span><small style="color: red">*</small>时长(分钟)：</span> <input
							class="inputtxt2" data-val="true" data-val-required="*"
							onblur="checkCourseTime();"
							onkeyup="value=value==0?'':value.replace(/[^0-9]/g,'')"
							id="course_time" name="course_time" size="50" maxlength="10"
							type="text" value="0" placeholder="请输入培训课程时长"
							style="ime-mode: disabled" /> <span
							class="field-validation-valid" data-valmsg-for="Contact"
							data-valmsg-replace="true"></span></li>
						<li><span><small style="color: red">*</small>讲师：</span> <select
							class="inputtxt2" id="teacher" name="teacher"><option
									value="">--选择讲师--</option>
								<c:forEach items="${teacherList}" var="vars">
									<option>${vars.teacher_name}</option>
								</c:forEach>
						</select></li>
					</ul>
					<ul>
						<li style="height: 120px; width: 100%;"><span><small
								style="color: red">*</small>课程图片：</span>
							<p class="pull-left">
								<img src="<%=basePath%>shyl/images/mylogo.jpg;" class="upimg"
									id="imgP" name="imgP"
									style="width: 100px; padding: 3px; border: solid 1px #ccc; background: #fff;" />
							</p> <input id="course_path" name="course_path" type="hidden"
							value="" />
							<div class="pull-left" style="padding-left: 15px;">
								<br> <span class="fileinput-button" style="width: 131px;">
									<span
									style="text-align: left; width: 131px; background-color: #4f70c0; color: #FFFFFF; border-radius: 5px; line-height: 42px; text-align: center; font-size: 15px;">上传课程图片</span>
									<input style="width: auto;" type="file" id="file_upload"
									name="file_upload" title="点击这里上传图片">
								</span><br> <i>支持的图片格式为(*.jpg;*.png;*.jpeg;*.gif)</i>
							</div></li>
					</ul>
				</div>
			</form>
			<div class="col-sm-offset-5 col-sm-2">
				<button type="button" class="btn btn-success btn-block"
					onclick="sub();" id="subm">
					<span class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp;保存
				</button>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<script src="<%=basePath%>shyl/js/jquery.uploadify.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>shyl/js/jquery.tips.js"></script>
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
	<script src="<%=basePath%>shyl/js/mainjs/jquery.placeholder.js"></script>

	<%@ include file="../../common/footer.jsp"%>
</body>
</html>