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
<title>理发添加页面</title>
<meta name="description" content="overview & stats"/>
<%@ include file="../../../system/admin/top.jsp"%>

<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>

<!-- 添加按钮 -->
<link rel="stylesheet" href="static/assets/css/font-awesome.css" />

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

.ques-remove-opt {
    color: #d2322d;
    cursor: pointer;
    margin-left: 5px;
    margin-top: 12px;
}

</style>
</head>
<body>
	<br>
	<form action="<%=basePath%>barber/saveBarber.do" name="Form" id="Form" method="post">
		<div id="zhongxin">
			<table class="table">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>理发师名称</B>
					</td>
					<td>
						<input type="text" name="barber_name" id="barber_name" maxlength="50" style="height: 20px; width: 300px;" placeholder="请输入理发师名称" title="理发师名称" onblur="trim(this);"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>性别</B>
					</td>
					<td>
						<select class="chzn-select" name="sex" id="sex" style="height: 20px; width: 315px;">
								<c:forEach items="${sexList}" var="list">
									<option value="${list.distinguish_id}">${list.value}</option>
								</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>技能经验</B>
					</td>
					<td>
						<input type="text" name="experience" id="experience" maxlength="3" style="height: 20px; width: 300px;" placeholder="默认为年" title="技能经验" onblur="trim(this);"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>理发场地</B></td>
					<td>
						<select class="chzn-select" name="placeId" id="placeId" data-placeholder="请选择理发场地"  style="height: 20px; width: 315px;">
							<option value=""></option>
								<c:forEach items="${placeAddressList}" var="list">
									<option value="${list.PLACE_ID}">${list.P_NAME}</option>
								</c:forEach>
					</select>
					</td> 
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>缩略图片</B></td>
					<td>
						<div class="upload_img">
							<input id="barber_path" name="barber_path" type="hidden" value="" />
							<img id="weixin_show" name="weixin_show" style="width: 158px; height: 190px;" src="<%=basePath%>shyl/images/temp.png"> 
							<a href="javascript:;" class="a-upload" style="text-decoration: none; color: #ffffff;">上传本地图片 
							<input type="file" id="weixin_image" placeholder="上传本地图片" name="weixin_image" multiple></a>
							<p>支持的文件格式为.gif、.jpeg、.jpg、.png</p>
						</div>
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
			<a class="btn  btn-success" onclick="save();"><i class="icon-save"></i>保存</a> 
			<a class="btn  btn-light" onclick="returnback()"><i class=" icon-circle-arrow-left"></i>返回</a>
		</div>
		<div id="zhongxin2" class="center" style="display: none">
			<br/> <br/> <br/> <br/> <img src="<%=basePath%>static/images/jiazai.gif" /><br/>
			<h4 class="lighter block green"></h4>
		</div>
	</form>
	<!-- 引入 -->
	<script type="text/javascript">
		window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>
	
	<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
	

	<script type="text/javascript">
		$(top.hangge());
		
		$(document).ready(function(){
			
			$("#weixin_image").fileupload({
				 dataType :'iframe text',
				 autoUpload: true,
				 maxNumberOfFiles : 1,
		         url: '<%=basePath%>barber/Upload.do',
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
		   		 $("#weixin_show").attr("src","<%=basePath%>"+data.result);
		            document.getElementById("barber_path").value=data.result;
		   	 }
		    });
			
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			
			
		});
		
		//返回
	    function returnback(){
	    	window.location.href="<%=basePath%>barber/list.do";
		}
		
	    /**
	     * 保存
	     */
	    function save() {
	    	
	    	//校验
	    	if ($("#barber_name").val() == ""){
	    		$("#barber_name").tips({
	    			side : 3,
	    			msg : '请输入理发师名称',
	    			bg : '#FF5080',
	    			time : 2
	    		});
	    		$("#barber_name").focus();
	    		return false;
	    	}
	    	if ($("#experience").val() == ""){
	    		$("#experience").tips({
	    			side : 3,
	    			msg : '请输入理发师名称',
	    			bg : '#FF5080',
	    			time : 2
	    		});
	    		$("#experience").focus();
	    		return false;
	    	}
	    	
	    	$("#Form").submit();
	    	$("#zhongxin").hide();
	    	$("#zhongxin2").show();
	    }
		
		
		
		
	</script>
</body>
</html>