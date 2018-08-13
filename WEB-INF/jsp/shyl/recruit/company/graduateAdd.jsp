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
<title>添加毕业生信息_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../common/header.jsp"%>
<link rel="stylesheet" href="<%=basePath%>shyl/css/work.css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css">
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<!-- 引入jQuery UI的js文件 -->
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery-ui.js"></script>
<link href="<%=basePath%>shyl/css/maincss/jquery-ui.css" rel="stylesheet">
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<style type="text/css">
.inputtxt2NNew {
	width: 275px;
	padding-left: 5px;
	background-color: #ecf0f9;
	line-height: 42px;
	height: 42px;
	border: 0;
	border-radius: 5px;
	font-size: 0.85em;
}
</style>
</head>
<body id="top" style="background-color: #f7f7f7;">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param value="2" name="menuType"/></jsp:include>
	    <div class="mypage_right" style="min-height:800px">
			<h2>添加毕业生信息</h2>
			<div class="input_class">
				<form
					action="<%=basePath%>graduate/addGraduate.act"
					class="form-horizontal" id="form1" method="post" role="form">
					<input type="hidden" id="info_id" name="info_id" value="${pd.info_id}">
					<ul style="margin-bottom: 20px;">
						<li>
							<span><small style="color: red">*</small>&nbsp;毕业生姓名：</span>
							<input type="text" class="inputtxt2" style="width: 275px;" maxlength="5" onblur="trim(this);checkName();" id="graduateName" name="graduateName">
						</li>
						<li>
						<span><small style="color: red">*</small>&nbsp;身份证号：</span>
							<input id="graduateIdNumber" name="graduateIdNumber" class="inputtxt2" style="width: 275px;" type="text" maxlength="20" onblur="trim(this);"/>
						</li>
						<li><span><small style="color: red">*</small>&nbsp;学历：</span>
						<select class="inputtxt2NNew" name="education"
							id="education">
							<c:forEach items="${educationList}" var="education">
								<option value="${education.DISTINGUISH_ID}">${education.VALUE}</option>
							</c:forEach>
						</select>
						</li>
						<li><span><small style="color: red">*</small>毕业院校：</span>
						    <input class="inputtxt2" style="width:275px;" data-val="true" data-val-required="*" id="school" name="school" maxlength="14" type="text" value="" onblur="trim(this);checkTeacherGraduate();"/>
						</li>
						<li><span><small style="color: red">*</small>专业：</span> 
						<select class="inputtxt2NNew" name="major"
							id="major">
							<c:forEach items="${majorList}" var="major">
								<option value="${major.DISTINGUISH_ID}" >${major.VALUE}</option>
							</c:forEach>
						</select>
						</li>
						</ul>
						<ul style="height:200px;">
						<li >
					    <span><small style="color: red">*</small>身份证：</span>                    
                        <p class="pull-left">
                                <img onerror="showImgDelay(this,'<%=basePath%>shyl/images/mylogo.jpg');" src="<%=basePath%>images/${pd.diploma}" class="upimg" id="img_idNumber" name="img_idNumber" style="width: 100px;padding: 3px; border: solid 1px #ccc; background: #fff;" />
                        </p>
                        <input id="pictureUrl_idNumber" name="pictureUrl_idNumber" type="hidden"/>
                        <div>
                            	<span class="fileinput-button" style="padding-left:18px;">
								<span style="text-align:right;width:100px;background-color: #4f70c0;color:#FFFFFF;border-radius: 5px;line-height: 42px;text-align: center;font-size:15px;">上传身份证</span>
								<input style="width:auto;" type="file" id="file_upload_idNumber" name="file_upload_idNumber" title="点击这里上传图片">
								</span><br><i style="line-height:10px;">支持的图片格式为(*.jpg;*.png;*.jpeg;*.gif)</i>
                        </div>
				        </li>
						<li>
					    <span><small style="color: red">*</small>毕业证：</span>                    
                        <p class="pull-left">
                                <img onerror="showImgDelay(this,'<%=basePath%>shyl/images/mylogo.jpg');" src="<%=basePath%>images/${pd.diploma}" class="upimg" id="img_diploma" name="img_diploma" style="width: 100px;padding: 3px; border: solid 1px #ccc; background: #fff;" />
                        </p>
                        <input id="pictureUrl_diploma" name="pictureUrl_diploma" type="hidden"/>
                        <div>
                            	<span class="fileinput-button" style="padding-left:18px;">
								<span style="text-align:right;width:100px;background-color: #4f70c0;color:#FFFFFF;border-radius: 5px;line-height: 42px;text-align: center;font-size:15px;">上传毕业证</span>
								<input style="width:auto;" type="file" id="file_upload_diploma" name="file_upload_diploma" title="点击这里上传图片">
								</span><br><i style="line-height:10px;">支持的图片格式为(*.jpg;*.png;*.jpeg;*.gif)</i>
                        </div>
				</li>
				</ul>
				<ul style="height:200px;">
				<li style="line-height:30px;">
					    <span>学位证：</span>                    
                        <p class="pull-left">
                                <img onerror="showImgDelay(this,'<%=basePath%>shyl/images/mylogo.jpg');" src="<%=basePath%>images/${pd.degree}" class="upimg" id="img_degree" name="img_degree" style="width: 100px;padding: 3px; border: solid 1px #ccc; background: #fff;" />
                        </p>
                        <a class="delete" style="margin:0 40px" onclick="deleteDegree();">删除</a>
                        <input id="pictureUrl_degree" name="pictureUrl_degree" type="hidden"/>
                        <div>
                            	<span class="fileinput-button" style="padding-left:18px;">
								<span style="text-align:right;width:100px;background-color: #4f70c0;color:#FFFFFF;border-radius: 5px;line-height: 42px;text-align: center;font-size:15px;">上传学位证</span>
								<input style="width:auto;" type="file" id="file_upload_degree" name="file_upload_degree" title="点击这里上传图片">
								</span><br><table style="font-size:0.85em;border:1px;"><tr><td>支持的图片格式为<br>(*.jpg;*.png;*.jpeg;*.gif)</td></tr></table>
                        </div>
				</li>
				<li>
				<table>
				<tr>
				   <td><span><small style="color: red">*</small>&nbsp;劳动合同：</span></td>
				   <td style="width:50%;"><div class="col-sm-12"><ul id="pdfName" style="font-size:0.85em;"></ul></div></td>
				</tr>
				<tr>
				<td></td>
				<td align="center" valign="middle" style="width:70%;">
				<div>
                            	<span class="fileinput-button">
								<span style="text-align:right;width:100px;background-color: #4f70c0;color:#FFFFFF;border-radius: 5px;line-height: 42px;text-align: center;font-size:15px;">上传合同</span>
								<input style="width:auto;" type="file" id="file_upload_labour" name="file_upload_labour" title="点击这里上传图片">
								</span><i style="line-height:10px;">支持的文件格式为(*.pdf)</i>
                </div>
                <input id="labour_name" name="labour_name" type="hidden">
                <input id="labour_path" name="labour_path" type="hidden">
                <td>
				</tr>
				</table>
				</li>
				</ul>
				<br>
				<br>
			    <div>
				<div class="col-sm-2 col-sm-offset-2" style="margin-top: 20px;">
					<button type="button" onclick="sub();" class="btn btn-success btn-block" id="subm"><span class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp;保存
	                </button>
				</div>
				<div class="col-sm-2" style="margin-top: 20px;">
					<a onclick="GO('graduate/toGraduateList.act')"
						class="btn btn-default btn-block"><span
						class="glyphicon glyphicon-circle-arrow-left"></span>&nbsp;&nbsp;返回</a>
				</div>
		</div>
	        </form>
			</div>
		</div>
	</div>
	<%@ include file="../../common/footer.jsp"%>
<script src="<%=basePath%>shyl/js/jquery.uploadify.min.js" ></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
<script type="text/javascript">
	// 毕业生姓名验证
	function checkName() {
		var graduateName = $("#graduateName").val();
		if (graduateName == "") {
			$("#graduateName").tips({
				side : 2,
				msg : '请输入毕业生姓名',
				bg : '#AE81FF',
				time : 3
			});
			return true;
		}
	}
	// 身份证号验证
	function checkIdNumber() {
		var graduateIdNumber = $("#graduateIdNumber").val();
		var filter = /^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/;
		
		if (graduateIdNumber == "") {
			$("#graduateIdNumber").tips({
				side : 2,
				msg : '请输入毕业生身份证号',
				bg : '#AE81FF',
				time : 3
			});
			return true;
		}
		if (graduateIdNumber != "" && !(filter.test(graduateIdNumber))) {
			$("#graduateIdNumber").tips({
				side : 2,
				msg : '请输入正确的身份证号格式',
				bg : '#AE81FF',
				time : 3
			});
			return true;
		}
	}
    // 毕业院校
    function checkSchool() {
    	// 毕业院校验证
    	var school = $("#school").val();
    	if (school == "") {
    		$("#school").tips({
    			side : 1,
    			msg : '请输入毕业院校',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
    	}
    }
    
    // 身份证图片
    function checkPicId() {
    	var pictureUrl_idNumber = $("#pictureUrl_idNumber").val();
    	if (pictureUrl_idNumber == "") {
    		$("#img_idNumber").tips({
    			side : 1,
    			msg : '请上传身份证！',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
    	}
    }
    
    // 毕业证图片
    function checkPicDiploma() {
    	var pictureUrl_diploma = $("#pictureUrl_diploma").val();
    	if (pictureUrl_diploma == "") {
    		$("#img_diploma").tips({
    			side : 1,
    			msg : '请上传毕业证！',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
    	}
    }
    
    // 劳动合同
    function checkPicLabour() {
    	var labour_name = $("#labour_name").val();
    	if (labour_name == "") {
    		$("#pdfName").tips({
    			side : 1,
    			msg : '请上传劳动合同！',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
    	}
    }
    
    //提交表单
	function sub() {
    	// 毕业生姓名
    	if (checkName()) {
    		$("#graduateName").focus(); 
    		return;
    	}
    	// 身份证号验证
        if (checkIdNumber()) {
    		$("#graduateIdNumber").focus(); 
    		return;
    	}
    	// 毕业院校
    	if (checkSchool()) {
    		$("#school").focus(); 
    		return;
    	}
    	// 身份证
    	if (checkPicId()) {
    		return;
    	}
    	// 毕业证
    	if (checkPicDiploma()) {
    		return;
    	}
    	// 劳动合同
    	if (checkPicLabour()) {
    		return;
    	}
    	
		$("#form1").submit();
		
	}
	// 返回
    function GO(url) {
    	location.href =  '<%=basePath%>'+url+'?&info_id='+$("#info_id").val();
    }
	// 删除学位证
	function deleteDegree(){
		$("#img_degree").attr("src","<%=basePath%>shyl/images/mylogo.jpg");
        document.getElementById("pictureUrl_degree").value="";
	}
</script>
<script type="text/javascript">
$(function() {
	var tips=function(id,msg){
		$("#"+id).tips({
			side : 2,
			msg : msg,
			bg : '#AE81FF',
			time : 3
		});
	}

	 // 身份证上传处理
	 $("#file_upload_idNumber").fileupload({
		 dataType :'iframe text',
		 autoUpload: true,
		 maxNumberOfFiles : 1,
         url: '<%=basePath%>graduate/Upload.act',
         sequentialUploads: true
	 }).bind('fileuploadchange', function (e, data) {
		 if(data.files.length > 1){
			 tips("file_upload_idNumber","只能上传一张照片。");
             return false;
		 }
     }).bind('fileuploaddone', function (e, data) {
    	 if("no"==data.result){
    		 tips("file_upload_idNumber","请上传格式为.jpg/.jpeg/.png./gif格式的图片。");
    		 $("#img_idNumber").attr("src","<%=basePath%>shyl/images/upimg.jpg");
    	 } else {
    		 $("#img_idNumber").attr("src","<%=basePath%>images/"+data.result);
             document.getElementById("pictureUrl_idNumber").value=data.result;
    	 }
     });
	 
	 // 毕业证上传处理
	 $("#file_upload_diploma").fileupload({
		 dataType :'iframe text',
		 autoUpload: true,
		 maxNumberOfFiles : 1,
         url: '<%=basePath%>graduate/Upload.act',
         sequentialUploads: true
	 }).bind('fileuploadchange', function (e, data) {
		 if(data.files.length > 1){
			 tips("file_upload_diploma","只能上传一张照片。");
             return false;
		 }
     }).bind('fileuploaddone', function (e, data) {
    	 if("no"==data.result){
    		 tips("file_upload_diploma","请上传格式为.jpg/.jpeg/.png./gif格式的图片。");
    		 $("#img_diploma").attr("src","<%=basePath%>shyl/images/upimg.jpg");
    	 } else {
    		 $("#img_diploma").attr("src","<%=basePath%>images/"+data.result);
             document.getElementById("pictureUrl_diploma").value=data.result;
    	 }
     });
	 
	 // 学位证上传处理
	 $("#file_upload_degree").fileupload({
		 dataType :'iframe text',
		 autoUpload: true,
		 maxNumberOfFiles : 1,
         url: '<%=basePath%>graduate/Upload.act',
         sequentialUploads: true
	 }).bind('fileuploadchange', function (e, data) {
		 if(data.files.length > 1){
			 tips("file_upload_degree","只能上传一张照片。");
             return false;
		 }
     }).bind('fileuploaddone', function (e, data) {
    	 if("no"==data.result){
    		 tips("file_upload_degree","请上传格式为.jpg/.jpeg/.png./gif格式的图片。");
    		 $("#img_degree").attr("src","<%=basePath%>shyl/images/upimg.jpg");
    	 } else {
    		 $("#img_degree").attr("src","<%=basePath%>images/"+data.result);
             document.getElementById("pictureUrl_degree").value=data.result;
    	 }
     });
	 
	 // 劳动合同处理
	 $("#file_upload_labour").fileupload({
		 autoUpload: true,
		 maxNumberOfFiles : 3,
		 url: '<%=basePath%>graduate/uploadContract.act',
         sequentialUploads: true
	 }).bind('fileuploadchange', function (e, data) {
		 if(data.files.length > 1){
			 $("#file_upload_labour").tips({
				 side : 2,
				 msg : "只能上传一个文件。",
				 bg : '#AE81FF',
				 time : 2
			 });
            return false;
		 }
     }).bind('fileuploaddone', function (e, data) {
    	 if("no"==data.result){
	   		 $("#file_upload_labour").tips({
					 side : 2,
					 msg : "请上传格式为.pdf格式的文件。",
					 bg : '#AE81FF',
					 time : 2
				 });
	   		 return false;
	   	 } else {
	   		 $("#labour_path").val(data.result);
	   		 $("#pdfName").text(data.originalFiles[0].name);
	   		 $("#labour_name").val(data.originalFiles[0].name);
	   	 }
     });

});

//院校自动输入
$("#school").autocomplete({
    source: function( request, response ) {
        $.ajax({
        	type:"POST",
            url: '<%=basePath%>register/getschool.act', // 后台请求路径
            dataType: "json",
            data:{
                "inputStr": request.term    // 获取输入框内容
            },
            success: function( data ) {
                response($.map(data, function(item) {
                    return {
                         // 设置item信息
                         label: item.name, // 下拉项显示内容
                         value: item.name,  // 下拉项对应数值
                         schoolId: item.id
                    }
                }));
            }
        });
    },
    minLength: 1,  // 输入框字符个等于2时开始查询
    select: function( event, ui ) { // 选中某项时执行的操作
    	// 存放选中选项的信息
    	$("#school").val(ui.item.label);
      }
});
</script>
</body>

</html>