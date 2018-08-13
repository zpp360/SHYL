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
<html>
<head>
<meta charset="utf-8">
<title>账户信息_济南市服务外包公共服务平台</title>
<!--<header开始>-->
 <%@ include file="../../common/header.jsp"%>
<!--</header结束>-->
<base href="<%=basePath%>">
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link href="<%=basePath%>shyl/css/maincss/css.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>shyl/css/maincss/mypage.css" rel="stylesheet" type="text/css">

<script src="<%=basePath%>shyl/js/mainjs/box.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/jquery.validate.js"type="text/javascript" ></script>
<script src="<%=basePath%>shyl/js/jquery.tips.js"type="text/javascript" ></script>
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<script type="text/javascript" src="<%=basePath%>/shyl/js/mainjs/jquery.placeholder.js"></script>

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
             document.getElementById("pictureUrlfile").value=data.result;
    	 }
     });

	$('input, textarea').placeholder({customClass:'my-placeholder'});
});

</script>
</head>
<body style="background-color: #f7f7f7;">
<div class="clear"></div>
<div class="register-box p0">
	<div class="rticon"></div>
	<jsp:include page="../../common/left.jsp"><jsp:param value="8" name="menuType"/></jsp:include>
	<div class="mypage_right">
		<h2>账号信息</h2>
		<div class="mypage_tab">
			<div class="hd">
				<ul>
					<li>修改密码</li>
					<li>修改邮箱</li>
					<li>修改头像</li>
				</ul>
			</div>
			<div class="bd">
				<ul>
					<div class="inputmodify">
						<dl>
							<dd><span><lable style="color: #FF0000">*</lable>当前密码 ： </span><input type="password" id="PassWord" name="PassWord" placeholder="请输入当前密码" class="inputtxt3" maxlength="20"></dd>
							<dd><span><lable style="color: #FF0000">*</lable>新密码 ： </span><input type="password" id="NewPassWord" name="NewPassWord" placeholder="请输入新密码" class="inputtxt3" maxlength="20"></dd>
							<dd><span><lable style="color: #FF0000">*</lable>确认密码 ： </span><input type="password" id="CPassWord" name="CPassWord" placeholder="与新密码一致" class="inputtxt3" maxlength="20"></dd>
						</dl>
						<a class="save" onclick="savePwd();" style="cursor: pointer;">确认修改</a>
					</div>
				</ul>
				<ul>
					<div class="inputmodify">
						<dl>
							<dd><span>邮箱 ： </span><input type="text" id="Email" name="Email" placeholder="请输入邮箱地址" class="inputtxt3" maxlength="50" onblur="trim(this);"></dd>
						</dl>
						<a class="save" onclick="saveEml();" style="cursor: pointer;">确认修改</a>
					</div>
				</ul>
				<ul>
					<div class="inputmodify">
						<dl>
							<dd style="height: 120px;"><span>当前头像 ： </span><img onerror="showImgDelay(this,'<%=basePath%>shyl/images/upimg.jpg');"  src="<%=basePath%>images/${pd.user_picture}" class="upimg" id="imgP"></dd>
							<dd>
								<span>请上传 ： </span>
								<span class="fileinput-button" style="width:131px;">
								<span style="text-align:left;width:131px;background-color: #4f70c0;color:#FFFFFF;border-radius: 5px;line-height: 42px;text-align: center;">上传本地图片</span>
								<input style="width:auto;" type="file" id="file_upload" name="file_upload1">
								</span><i>支持的图片格式为.jpg、.png、.jpeg、.gif</i>
							</dd>
						</dl>
						<input id="pictureUrlfile" name="pictureUrlfile" type="hidden" value=""> 
						<input id="pictureUrl" name="pictureUrl" type="hidden" value=""> 
						<input id="pictureUrlOld" name="pictureUrlOld" type="hidden" value="${pd.user_picture}">
						<a onclick="saveImg();" class="save2" style="cursor: pointer;">确认修改</a>
					</div>
				</ul>
			</div>
		</div>
		<script id="jsID" type="text/javascript">
		 	var ary = location.href.split("&");
			jQuery(".mypage_tab").slide( { 
							effect:"fade",autoPlay:"false",
							trigger:"click",easing:"swing",
							delayTime:"500",pnLoop:"true" 
							});
		</script>
	</div>
</div>
<div class="clear"></div>
 
 <!--<footer开始>-->
 	<jsp:include page="../../common/footer.jsp"></jsp:include>
 	 <div class='modal my-modal-alert' id='my-modal-success-alert'>
      <div class='modal-dialog boxBodySmall'>
          <div class='modal-content' style="width:150px;text-align:center;position:fixed;right:40%;bottom:45%;">
              <div class='modal-body' id='modal-body-alert'>
                  <img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;修改成功!
              </div>
          </div>
      </div>
  </div>
  <div class='modal my-modal-alert' id='my-modal-pwd-alert'>
      <div class='modal-dialog boxBodySmall'>
          <div class='modal-content' style="width:350px;text-align:center;position:fixed;right:40%;bottom:45%;">
              <div class='modal-body' id='modal-body-alert'>
                  <img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;修改成功! <span style="color: red" id="num">3</span>秒后将自动跳转至登录页
              </div>
          </div>
      </div>
  </div>
 <div class='modal my-modal-alert' id='my-modal-failure-alert'>
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:150px;text-align:center;position:fixed;right:40%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/uploadify-cancel.png">&nbsp;&nbsp;修改失败!
                    </div>
                </div>
            </div>
        </div>
 <!--</footer结束>-->
 <!-- 修改密码 -->
 <script type="text/javascript">
   
 	function pwdCheck(){
 		if($("#PassWord").val() == ""){
 			$("#PassWord").tips({
				side : 2,
				msg : "请输入当前密码",
				bg : '#AE81FF',
				time : 3
			});
			$("#PassWord").focus();
			return false;
 		}else if($("#NewPassWord").val() == ""){
 			$("#NewPassWord").tips({
				side : 2,
				msg : "请输入新密码",
				bg : '#AE81FF',
				time : 3
			});
			$("#NewPassWord").focus();
			return false;
 		}else if($("#NewPassWord").val() == $("#PassWord").val()){
 			$("#NewPassWord").tips({
				side : 2,
				msg : "不能与旧密码相同",
				bg : '#AE81FF',
				time : 3
			});
			$("#NewPassWord").focus();
			return false;
 		}else if($("#NewPassWord").val().length < 6 || $("#NewPassWord").val().length > 20){
 			$("#NewPassWord").tips({
				side : 2,
				msg : "密码长度为6~20个字符",
				bg : '#AE81FF',
				time : 3
			});
			$("#NewPassWord").focus();
			return false;
 		}else if($("#CPassWord").val() == ""){
 			$("#CPassWord").tips({
				side : 2,
				msg : "请再次输入密码",
				bg : '#AE81FF',
				time : 3
			});
			$("#CPassWord").focus();
			return false;
 		}else if($("#CPassWord").val() != $("#NewPassWord").val()){
 			$("#CPassWord").tips({
				side : 2,
				msg : "两次密码输入不一致",
				bg : '#AE81FF',
				time : 3
			});
			$("#CPassWord").focus();
			return false;
 		}
 		return true;
 	}
 	function savePwd(){
 		if(pwdCheck()){
 			$.ajax({
				type : "POST",
				url : '<%=basePath%>accountInfo/updatePwd.act',
				data : {
					password:$("#PassWord").val(),
					newpassword:$("#NewPassWord").val(),
					cpassword:$("#CPassWord").val()
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
					if (data.result == '2') {
						$("#PassWord").tips({
							side : 2,
							msg : "密码填写错误",
							bg : '#AE81FF',
							time : 3
						});
						$("#PassWord").focus();
						return;
					}
					if (data.result == '-1') {
						$("#NewPassWord").tips({
							side : 2,
							msg : "不能与旧密码相同",
							bg : '#AE81FF',
							time : 3
						});
						$("#NewPassWord").focus();
						return;
					} 
					if(data.result == '1'){
						 $('#my-modal-pwd-alert').show ().delay (3000).fadeOut ();
						 jump(3);
					}
					if(data.result == '0'){
						$('#my-modal-failure-alert').show ().delay (1000).fadeOut ();
					}
				}
			});
 		}
 	}
</script>
 <!-- 修改邮箱 -->
 <script type="text/javascript">
 	function emlCheck(){
 		var p = /^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT)$/;
 		if($("#Email").val() == ""){
 			$("#Email").tips({
				side : 2,
				msg : "请输入邮箱地址",
				bg : '#AE81FF',
				time : 3
			});
			$("#Email").focus();
			return false;
 		}else if(!p.test($("#Email").val())){
 			$("#Email").tips({
				side : 2,
				msg : "请输入正确的邮箱格式",
				bg : '#AE81FF',
				time : 3
			});
			$("#Email").focus();
			return false;
 		}
 		return true;
 	}
 	
 	function saveEml(){
 		if(emlCheck()){
 			$.ajax({
				type : "POST",
				url : '<%=basePath%>accountInfo/saveEmail.act',
				data : {
					Email:$("#Email").val()
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
					if(data.msg == '1'){
						$('#my-modal-success-alert').show ().delay (1000).fadeOut ();
					}
					if(data.msg == '-1'){
						$("#Email").tips({
							side : 2,
							msg : "该邮箱已存在",
							bg : '#AE81FF',
							time : 3
						});
						$("#Email").focus();
					}
					if(data.msg == '0'){
						$('#my-modal-failure-alert').show ().delay (1000).fadeOut ();
					}
				}
			});
 		}
 	}
 	function jump(count) { 
        window.setTimeout(function(){ 
            count--; 
            if(count > 0) { 
                $('#num').text(count); 
                jump(count); 
            } else { 
            	location.href = '<%=basePath%>userLogin/goLogin.act'
            }
         }, 1000);
	}
 </script>
 <!-- 头像修改 -->
 <script type="text/javascript">
    function saveImg() {
    	var pictureUrl=$("#pictureUrlfile").val();
    	if(pictureUrl!=""){
    		$.post('<%=basePath%>accountInfo/savePicture.act', {
							user_picture : $("#pictureUrl").val(),
							old_picture : $("#pictureUrlOld").val()
						}, function(data) {
							if (data.result == 1) {
								 $('#my-modal-success-alert').show ().delay (1000).fadeOut ();
								 location.replace(location);
								$(".mypage_image").find("img").attr("src","<%=basePath%>"+$("#pictureUrl").val());
								$("#pictureUrlfile").val("");
    	        	  }else{
    	        		  $('#my-modal-failure-alert').show ().delay (1000).fadeOut ();
    	        	  }
    	          });
    	}else{
    		$("#file_upload").tips({
				side : 2,
				msg : "请上传本地图片",
				bg : '#AE81FF',
				time : 3
			});
    	}
            
    }
</script>
</body>
</html>
