<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<title>修改咨询服务_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<base href="<%=basePath%>">
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link rel="stylesheet" href="shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<jsp:include page="../common/header.jsp"></jsp:include>
<script src="shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<style type="text/css">
.textareatxt2{
	background-color: #f7f7f7 !important ;
}
.edui-default .edui-editor {
	background-color: #ecf0f9;
}

.modal {
	z-index: 10176524 !important;
}
div.inputtxt2 {
    width: 275px;
    float: left;
}
div.inputtxt2 b{
    float: right;
    margin-top: 20px;
    margin-right: 7px;
}
* {
    box-sizing: content-box;
}
select.inputtxt3 {
    width: 275px;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../common/left.jsp"><jsp:param value="20" name="menuType"/></jsp:include>
		<div class="mypage_right">
			<h2 style="margin-top: 0px;">修改咨询服务</h2>
			<div class="input_class" style="margin-bottom: 100px;">
			<form class="form-horizontal company_list" role="form" id="Form"
							name="Form" action="<%=basePath%>consultancy/update.act" method="post">
				<ul style="margin-bottom: 20px;">
					<li style="width: 800px;">
					 	<span><small style="color: red">*</small>咨询标题：</span>
						<input type="text" class="inputtxt2" style="width: 600px;" id="title" name="title" maxlength="50" value="${pd.TITLE}" placeholder="请输入咨询服务标题" onblur="trim(this);">
					</li>
					<li>
						<span><small style="color: red">*</small>类型：</span>
						<select class="inputtxt3" id="type" name="type" style="font-size:14px;" onChange="pictureUrlChange();">
						<c:forEach items="${typeList}" var="var">
							<c:if test="${var.DISTINGUISH_ID == pd.DISTINGUISH_ID}">
								<option value="${var.DISTINGUISH_ID}" selected>${var.VALUE}</option>
							</c:if>
							<c:if test="${var.DISTINGUISH_ID != pd.DISTINGUISH_ID}">
								<option value="${var.DISTINGUISH_ID}">${var.VALUE}</option>
							</c:if>
						</c:forEach>
						</select>
					</li>
					<li style="width: 800px;">
					 	<span><small style="color: red">*</small>咨询人：</span>
						<input type="text" class="inputtxt2" style="width: 600px;" id="person" name="person" maxlength="30" value="${pd.PERSON}" placeholder="请输入联系人" onblur="trim(this);">
					</li>
					<li style="width: 800px;">
					 	<span><small style="color: red">*</small>联系电话：</span>
						<input type="text" class="inputtxt2" style="width: 600px;" id="tel" name="tel" maxlength="13" value="${pd.TEL}" placeholder="请输入联系电话" onblur="trim(this);">
					</li>
					<li style="height:120px;width: 100%;">
						<span id="PShow" style="display: none;"><small style="color: red;">*</small>缩略图：</span>
<!-- 						<span id="PNShow" style="display: block;">缩略图：</span> -->
                        <p class="pull-left">
                                <img onerror="showImgDelay(this,'<%=basePath%>shyl/images/mylogo.jpg');" src="<%=basePath%>images/${pd.LOGO}" class="upimg" id="imgP" name="imgP" style="width: 100px; padding: 3px; border: solid 1px #ccc; background: #fff;" />
                        </p>
                        <input id="pictureUrl" name="pictureUrl" type="hidden" value="${pd.LOGO}" />
                        <div class="pull-left" style="padding-left: 15px;">
                        <br>
                            	<span class="fileinput-button" style="width:131px;">
								<span style="text-align:left;width:131px;background-color: #4f70c0;color:#FFFFFF;border-radius: 5px;line-height: 42px;text-align: center;font-size:15px;">上传Logo图片</span>
								<input style="width:auto;" type="file" id="file_upload" name="file_upload" title="点击这里上传图片">
								</span><br><i>支持的图片格式为(*.jpg;*.png;*.jpeg;*.gif)</i>
                        </div>
                    </li>
					<li style="height:260px;width: 100%;">
						<span><small style="color: red">*</small>咨询内容：</span>
						<textarea id="contentc" name="contentc" class="textareatxt2"  style=" float: left;height:100%;">${pd.CONTENT}</textarea>
					</li>
					
				</ul>
			<input  name="ID" type="hidden"value="${pd.ID}">
			</form>
				<a href="javascript:void(0);" class="save3"  onclick="save();" style="margin-top: 60px;">保存</a>
				<a href="javascript:void(0);" class="sback" onclick="returnback();" style="margin-top: 60px;">返回</a>
			</div>
		</div>
	</div>
	<div class='modal my-modal-alert' id='my-modal-success-alert'>
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:150px;text-align:center;position:fixed;right:40%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;添加成功!
                    </div>
                </div>
            </div>
        </div>
	<div class="clear"></div>
	<%@ include file="../common/footer.jsp"%>
</body>
<!-- 富文本编辑器start -->
	<!-- 配置文件 -->
	<script src="shyl/js/jquery-1.7.2.js"></script>
	<script src="shyl/js/bootstrap.js"></script>
	<script src="shyl/js/scroll.js"></script>
	<!-- 新追加部分 -->
	<!--引入弹窗组件start-->
	<script src="plugins/attention/zDialog/zDrag.js"></script>
	<script src="plugins/attention/zDialog/zDialog.js"></script>
	<script type="text/javascript" src="plugins/ueditor/ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript" src="plugins/ueditor/ueditor.all.js"></script>
	<!-- 实例化编辑器 -->
	<script type="text/javascript">
		var ue = UE.getEditor("contentc",{
			autoHeightEnabled: false
		});
		//ueditor有标签文本

		function getContent() {
			var arr = [];
			arr.push(UE.getEditor('contentc').getContent());
			return arr.join("");
		}

		function clean() {
			ue.setContent("");
		}

		function setFocus() {
			UE.getEditor('contentc').focus();
		}
	</script>
	<!--引入表单验证start-->
	<script src="shyl/js/jquery.validate.js"></script>
	<script src="shyl/js/jquery.validate.unobtrusive.js"></script>
	<script type="text/javascript" src="shyl/js/jquery.tips.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
	<!--引入表单验证end-->
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
		    		 $("#imgP").attr("src","<%=basePath%>images/"+data.result);
		             document.getElementById("pictureUrl").value=data.result;
		    	 }
		     });
			 pictureUrlChange();
		});

		// 类型关联
		function pictureUrlChange(){
			var typeV = $("#type").val();
			if (typeV == "1" || typeV == "3") {
				$("#PShow").css("display","block");
				$("#PNShow").css("display","none");				
			} else {
				$("#PShow").css("display","block");
// 				$("#PNShow").css("display","block");
			}
		}
	    // 保存
		function save(){
		    var title = $("#title").val();
				if ($.trim(title) == "") {
					$("#title").tips({
						side : 2,
						msg : '请输入标题',
						bg : '#AE81FF',
						time : 3
					});
					return true;
			}
			// 咨询人验证
			var person = $("#person").val();
			if ($.trim(person) == "") {
				$("#person").tips({
					side : 2,
					msg : '请输入咨询人',
					bg : '#AE81FF',
					time : 3
				});
				return true;
			}
			// 电话验证
			var tel = $("#tel").val();
			if ($.trim(tel) == "") {
				$("#tel").tips({
					side : 2,
					msg : '请输入联系电话',
					bg : '#AE81FF',
					time : 3
				});
				return true;
 			}else if ((!/(^([048][0-9]{2,3}\-)+([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$)|(^((\(\d{3}\))|(\d{3}\-))?(1[34578]\d{9})$)/.test(tel))){ 
					$("#tel").tips({
		    			side : 2,
		    			msg : '请输入正确的联系电话格式！例如：(010-5280xxxx)或手机号码',
		    			bg : '#AE81FF',
		    			time : 3
		    		});
					return true;
			}
			// 缩略图
			var pictureUrl = $("#pictureUrl").val();
			var typeV = $("#type").val();
// 			if (typeV == "1" || typeV == "3"){
				if (pictureUrl == "") {
					$("#imgP").tips({
						side : 2,
						msg : '请上传缩略图',
						bg : '#AE81FF',
						time : 3
					});
					return false;
				}
// 			}
			// 咨询内容验证
			var contentc = $("#contentc").val();
			if($.trim(contentc) == ""){
				$("#edui1").tips({
					side : 2,
					msg : '请输入咨询内容',
					bg : '#AE81FF',
					time : 3
				});
				return true;
			}

			$("#Form").submit();
			$("#my-modal-success-alert").show().delay(4000).fadeOut(); 
		}
	    
		//返回
	    function returnback(){
	    	window.location.href="<%=basePath%>consultancy/list.act";}
	</script>
</html>