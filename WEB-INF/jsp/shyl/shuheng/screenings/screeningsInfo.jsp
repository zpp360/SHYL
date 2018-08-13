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
<title>电影编辑画面</title>
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
<!-- 日期框 -->
<script type="text/javascript">
		$(top.hangge());
		//返回
		$(function() {
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

			
			$('#END_TIME').datetimepicker({
				dayOfWeekStart : 1,
				lang:'ch',
				startDate:	currentDay()
			});
			
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
<script type="text/javascript">
	//保存
	function save() {
		if ($("#film_name").val() == "") {
			$("#film_name").tips({
				side : 3,
				msg : '请选择电影名称',
				bg : '#FF5080',
				time : 2
			});
			$("#film_name").focus();
			return false;
		}
		if ($("#sc_address").val() == "") {
			$("#sc_address").tips({
				side : 3,
				msg : '请选择放映场所',
				bg : '#FF5080',
				time : 2
			});
			$("#sc_address").focus();
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
		top.jzts();
		$("#Form").submit();
		/* $("#zhongxin").hide();
		$("#zhongxin2").show();  */
	}
</script>
<style type="text/css">
.upload_img {
	float: left;
	width: 60%;
	position: relative;
}

.upload_img img {
	float: left;
}

.upload_img a {
	position: absolute;
	left: 210px;
	top: 0;
	font-size: 0.85em;
	border: 0;
	background-color: #3961c2;
	color: #fff;
	padding: 0;
	width: 160px;
	text-align: center;
	height: 50px;
	line-height: 50px;
	display: inline-block;
	border-radius: 4px;
	float: left;
	margin-top: 20px;
}

.upload_img p {
	position: absolute;
	bottom: 50px;
	left: 210px;
	color: #737373;
	line-height: 30px;
	width: 60%;
	font-size: 1.1em;
	float: left;
}

.upload_img p i {
	color: #1c1c1c;
	font-weight: bold;
	font-size: 1.1em;
}

select, input[type="file"] {
	height: 45px;
	line-height: 30px;
}

.uploadbtn {
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
	filter: alpha(opacity = 0);
	cursor: pointer
}

.upload a {
	position: absolute;
	left: 330px;
	font-size: 0.85em;
	border: 0;
	background-color: #3961c2;
	color: #fff;
	padding: 0;
	width: 100px;
	text-align: center;
	height: 30px;
	line-height: 30px;
	display: inline-block;
	border-radius: 4px;
	float: left;
	margin-left: 100px;
}

.upload p {
	bottom: 50px;
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
	<form action="<%=basePath%>screenings/${msg }.do" name="Form" id="Form" method="post">
		<div id="zhongxin">
		<input type="hidden" name="screenings_id" id="screenings_id" value="${pd.screenings_id }"/>
			<table class="table ">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>电影名称</B>
					</td>
					
					<td><select class="chzn-select" name="film_name" id="film_name" disabled="disabled"
						data-placeholder="请选择电影名称"  style="height: 20px; width: 315px;">
										<option value=""></option>
										<c:forEach items="${filmlist}" var="fl">
											<option value="${fl.id }" <c:if test="${fl.id == pd.film_name}">selected</c:if>>${fl.value }</option>
										</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>放映场所</B>
					</td>
					
					<td><select class="chzn-select" name="sc_address" id="sc_address" disabled="disabled"
						data-placeholder="请选择放映场所"  style="height: 20px; width: 315px;">
										<option value=""></option>
										<c:forEach items="${scaddresslist}" var="adr">
											<option value="${adr.id }" <c:if test="${adr.id == pd.sc_address}">selected</c:if>>${adr.value }</option>
										</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>开始时间</B></td>
					<td><input type="text" readonly="readonly" value="${pd.screenings_start_time}"  name="START_TIME" id="START_TIME"  placeholder="开始时间"  title="开始时间" style=" width: 300px"/></td>
				</tr>
				
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>结束时间</B></td>
					<td><input name="END_TIME" readonly="readonly" id="END_TIME" value="${pd.screenings_end_time}" type="text"  placeholder="结束时间"  title="结束时间" style=" width: 300px"/></td>
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

			<a class="btn  btn-light" onclick="top.Dialog.close();"><i class=" icon-circle-arrow-left"></i>返回</a>

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
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script>
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
		var ue = UE.getEditor("summary");
		//ueditor有标签文本

		function getContent() {
			var arr = [];
			arr.push(UE.getEditor('summary').getContent());
			return arr.join("");
		}

		function clean() {
			ue.setContent("");
		}

		function setFocus() {
			UE.getEditor('summary').focus();
		}
		
	</script>
	<!-- 富文本编辑器end -->

	<script type="text/javascript">
		$(top.hangge());
		//返回
	    function returnback(){
	    	window.location.href="<%=basePath%>screenings/list.do";
		}
		$(function() {
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			//日期框
			$('.date-picker').datepicker({
				language : 'zh-CN',
				format : 'yyyy-mm-dd',
				weekStart : 1,
				todayBtn : 'linked',
				autoclose : 1,
				todayHighlight : 1,
				minViewMode : 'dd', //这里就设置了默认视图为年视图
				minView : 2, //设置最小视图为年视图
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