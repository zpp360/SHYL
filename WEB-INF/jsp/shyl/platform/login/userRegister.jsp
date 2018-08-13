<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String localPath = request.getContextPath();
    String baseLocalPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+localPath+"/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
<base href="<%=baseLocalPath%>">
<title>用户注册_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->

<!-- 引入jQuery UI的css文件 -->
<!-- 引入jQuery UI的css文件 -->
<link href="<%=baseLocalPath%>shyl/css/maincss/jquery-ui.css" rel="stylesheet">
<link rel="stylesheet" href="shyl/css/bootstrap.css">
<link rel="stylesheet" href="shyl/css/styleRegist.css">
<link href="<%=baseLocalPath%>shyl/css/maincss/jquery.autocomplete.css" rel="stylesheet">
<script src="shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script type="text/javascript" src="shyl/js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="shyl/js/bootstrap.min.js"></script>
<script type="text/javascript" src="shyl/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=baseLocalPath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<!--<header开始>-->
<jsp:include page="../../common/header.jsp"></jsp:include>
<!--</header结束>-->
<!-- 引入jQuery UI的js文件 -->
<script type="text/javascript" src="<%=baseLocalPath%>shyl/js/mainjs/jquery-ui.js"></script>
<script src="<%=baseLocalPath%>shyl/js/mainjs/jquery.placeholderReg.js"></script>
<script src="<%=baseLocalPath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<style type="text/css"> 
/*密码强度*/
.pw-strength {clear: both;position: relative;top: 8px;width: 180px;}
.pw-bar{background: url(shyl/images/pwd-1.png) no-repeat;height: 14px;overflow: hidden;width: 179px;}
.pw-bar-on{background:  url(shyl/images/pwd-2.png) no-repeat; width:0px; height:14px;position: absolute;top: 1px;left: 2px;transition: width .5s ease-in;-moz-transition: width .5s ease-in;-webkit-transition: width .5s ease-in;-o-transition: width .5s ease-in;}
.pw-weak .pw-defule{ width:0px;}
.pw-weak .pw-bar-on {width: 60px;}
.pw-medium .pw-bar-on {width: 120px;}
.pw-strong .pw-bar-on {width: 179px;}
.pw-txt {padding-top: 2px;width: 180px;overflow: hidden;}
.pw-txt span {color: #707070;float: left;font-size: 12px;text-align: center;width: 58px;}
</style>
<script>
$(function(){
	$(".register-c-1 a").click(function(){
		var param=$(this).attr("param");
		$(".register-c-1 a").removeClass("hover");
		$(this).addClass("hover");
		if(param=="1"){
			$("#reg_gr").show();
			$("#reg_td").hide();
			$('#reg_gr_email')[0].reset();
			$('#reg_gr_mobile')[0].reset();
			$('#reg_qy')[0].reset();
			$('#reg_pxjg')[0].reset();
			$('#reg_yx')[0].reset();
			$('#reg_qp')[0].reset();
			$("#weixin_show").attr("src","<%=baseLocalPath%>shyl/images/img.png");
			$("#weixin_showI").attr("src","<%=baseLocalPath%>shyl/images/img.png");
			$("#weixin_showS").attr("src","<%=baseLocalPath%>shyl/images/img.png");
			$("#weixin_showP").attr("src","<%=baseLocalPath%>shyl/images/img.png");
			$("#license").val('');
			$("#licenseI").val('');
			$("#licenseS").val('');
			$("#licenseP").val('');
			document.getElementById("level").className="pw-strength";
			document.getElementById("level1").className="pw-strength";
			document.getElementById("level2").className="pw-strength";
			document.getElementById("level3").className="pw-strength";
			document.getElementById("level4").className="pw-strength";
			document.getElementById("level5").className="pw-strength";
		} else {
			$("#reg_gr").hide();
			$("#reg_td").show();
			$('#reg_gr_email')[0].reset();
			$('#reg_gr_mobile')[0].reset();
			$('#reg_qy')[0].reset();
			$('#reg_pxjg')[0].reset();
			$('#reg_yx')[0].reset();
			$('#reg_qp')[0].reset();
			$("#weixin_show").attr("src","<%=baseLocalPath%>shyl/images/img.png");
			$("#weixin_showI").attr("src","<%=baseLocalPath%>shyl/images/img.png");
			$("#weixin_showS").attr("src","<%=baseLocalPath%>shyl/images/img.png");
			$("#weixin_showP").attr("src","<%=baseLocalPath%>shyl/images/img.png");
			$("#license").val('');
			$("#licenseI").val('');
			$("#licenseS").val('');
			$("#licenseP").val('');
			document.getElementById("level").className="pw-strength";
			document.getElementById("level1").className="pw-strength";
			document.getElementById("level2").className="pw-strength";
			document.getElementById("level3").className="pw-strength";
			document.getElementById("level4").className="pw-strength";
			document.getElementById("level5").className="pw-strength";
		}
	});
	$("#grtab a").click(function(){
		var param=$(this).attr("param");
		$("#grtab a").removeClass("tabbtn_hover");
		$(this).addClass("tabbtn_hover");
		if(param=="email"){
			$("#reg_gr_email").show();
			$("#reg_gr_mobile").hide();
			$('#reg_gr_email')[0].reset();
			$('#reg_gr_mobile')[0].reset();
			$('#reg_qy')[0].reset();
			$('#reg_pxjg')[0].reset();
			$('#reg_yx')[0].reset();
			$('#reg_qp')[0].reset();
			document.getElementById("level").className="pw-strength";
			document.getElementById("level1").className="pw-strength";
			document.getElementById("level2").className="pw-strength";
			document.getElementById("level3").className="pw-strength";
			document.getElementById("level4").className="pw-strength";
			document.getElementById("level5").className="pw-strength";
		} else {
			$("#reg_gr_email").hide();
			$("#reg_gr_mobile").show();
			$('#reg_gr_email')[0].reset();
			$('#reg_gr_mobile')[0].reset();
			$('#reg_qy')[0].reset();
			$('#reg_pxjg')[0].reset();
			$('#reg_yx')[0].reset();
			$('#reg_qp')[0].reset();
			document.getElementById("level").className="pw-strength";
			document.getElementById("level1").className="pw-strength";
			document.getElementById("level2").className="pw-strength";
			document.getElementById("level3").className="pw-strength";
			document.getElementById("level4").className="pw-strength";
			document.getElementById("level5").className="pw-strength";
		}
	});
	$("#tdtab a").click(function(){
		var param=$(this).attr("param");
		$("#tdtab a").removeClass("tabbtn_hover");
		$(this).addClass("tabbtn_hover");
		if(param=="qy"){
			$("#reg_qy").show();
			$("#reg_pxjg").hide();
			$("#reg_yx").hide();
			$("#reg_qp").hide();
			$('#reg_gr_email')[0].reset();
			$('#reg_gr_mobile')[0].reset();
			$('#reg_qy')[0].reset();
			$('#reg_pxjg')[0].reset();
			$('#reg_yx')[0].reset();
			$('#reg_qp')[0].reset();
			$("#weixin_show").attr("src","<%=baseLocalPath%>shyl/images/img.png");
			$("#weixin_showI").attr("src","<%=baseLocalPath%>shyl/images/img.png");
			$("#weixin_showS").attr("src","<%=baseLocalPath%>shyl/images/img.png");
			$("#weixin_showP").attr("src","<%=baseLocalPath%>shyl/images/img.png");
			$("#license").val('');
			$("#licenseI").val('');
			$("#licenseS").val('');
			$("#licenseP").val('');
			document.getElementById("level").className="pw-strength";
			document.getElementById("level1").className="pw-strength";
			document.getElementById("level2").className="pw-strength";
			document.getElementById("level3").className="pw-strength";
			document.getElementById("level4").className="pw-strength";
			document.getElementById("level5").className="pw-strength";
		} else if(param=="pxjg"){
			$("#reg_qy").hide();
			$("#reg_pxjg").show();
			$("#reg_yx").hide();
			$("#reg_qp").hide();
			$('#reg_gr_email')[0].reset();
			$('#reg_gr_mobile')[0].reset();
			$('#reg_qy')[0].reset();
			$('#reg_pxjg')[0].reset();
			$('#reg_yx')[0].reset();
			$('#reg_qp')[0].reset();
			$("#weixin_show").attr("src","<%=baseLocalPath%>shyl/images/img.png");
			$("#weixin_showI").attr("src","<%=baseLocalPath%>shyl/images/img.png");
			$("#weixin_showS").attr("src","<%=baseLocalPath%>shyl/images/img.png");
			$("#weixin_showP").attr("src","<%=baseLocalPath%>shyl/images/img.png");
			$("#license").val('');
			$("#licenseI").val('');
			$("#licenseS").val('');
			$("#licenseP").val('');
			document.getElementById("level").className="pw-strength";
			document.getElementById("level1").className="pw-strength";
			document.getElementById("level2").className="pw-strength";
			document.getElementById("level3").className="pw-strength";
			document.getElementById("level4").className="pw-strength";
			document.getElementById("level5").className="pw-strength";
		} else if(param=="yx"){
			$("#reg_qy").hide();
			$("#reg_pxjg").hide();
			$("#reg_yx").show();
			$("#reg_qp").hide();
			$('#reg_gr_email')[0].reset();
			$('#reg_gr_mobile')[0].reset();
			$('#reg_qy')[0].reset();
			$('#reg_pxjg')[0].reset();
			$('#reg_yx')[0].reset();
			$('#reg_qp')[0].reset();
			$("#weixin_show").attr("src","<%=baseLocalPath%>shyl/images/img.png");
			$("#weixin_showI").attr("src","<%=baseLocalPath%>shyl/images/img.png");
			$("#weixin_showS").attr("src","<%=baseLocalPath%>shyl/images/img.png");
			$("#weixin_showP").attr("src","<%=baseLocalPath%>shyl/images/img.png");
			$("#license").val('');
			$("#licenseI").val('');
			$("#licenseS").val('');
			$("#licenseP").val('');
			document.getElementById("level").className="pw-strength";
			document.getElementById("level1").className="pw-strength";
			document.getElementById("level2").className="pw-strength";
			document.getElementById("level3").className="pw-strength";
			document.getElementById("level4").className="pw-strength";
			document.getElementById("level5").className="pw-strength";
		} else if(param=="qp"){
			$("#reg_qy").hide();
			$("#reg_pxjg").hide();
			$("#reg_yx").hide();
			$("#reg_qp").show();
			$('#reg_gr_email')[0].reset();
			$('#reg_gr_mobile')[0].reset();
			$('#reg_qy')[0].reset();
			$('#reg_pxjg')[0].reset();
			$('#reg_yx')[0].reset();
			$('#reg_qp')[0].reset();
			$("#weixin_show").attr("src","<%=baseLocalPath%>shyl/images/img.png");
			$("#weixin_showI").attr("src","<%=baseLocalPath%>shyl/images/img.png");
			$("#weixin_showS").attr("src","<%=baseLocalPath%>shyl/images/img.png");
			$("#weixin_showP").attr("src","<%=baseLocalPath%>shyl/images/img.png");
			$("#license").val('');
			$("#licenseI").val('');
			$("#licenseS").val('');
			$("#licenseP").val('');
			document.getElementById("level").className="pw-strength";
			document.getElementById("level1").className="pw-strength";
			document.getElementById("level2").className="pw-strength";
			document.getElementById("level3").className="pw-strength";
			document.getElementById("level4").className="pw-strength";
			document.getElementById("level5").className="pw-strength";
		}
	});
	
	$('#userPassWord').keyup(function () { 
		var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g"); 
		var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g"); 
		var enoughRegex = new RegExp("(?=.{6,}).*", "g"); 
	
		if (false == enoughRegex.test($(this).val())) { 
			$('#level').removeClass('pw-weak'); 
			$('#level').removeClass('pw-medium'); 
			$('#level').removeClass('pw-strong'); 
			$('#level').addClass(' pw-defule'); 
			 //密码小于六位的时候，密码强度图片都为灰色 
		} 
		else if (strongRegex.test($(this).val())) { 
			$('#level').removeClass('pw-weak'); 
			$('#level').removeClass('pw-medium'); 
			$('#level').removeClass('pw-strong'); 
			$('#level').addClass(' pw-strong'); 
			 //密码为八位及以上并且字母数字特殊字符三项都包括,强度最强 
		} 
		else if (mediumRegex.test($(this).val())) { 
			$('#level').removeClass('pw-weak'); 
			$('#level').removeClass('pw-medium'); 
			$('#level').removeClass('pw-strong'); 
			$('#level').addClass(' pw-medium'); 
			 //密码为七位及以上并且字母、数字、特殊字符三项中有两项，强度是中等 
		} 
		else { 
			$('#level').removeClass('pw-weak'); 
			$('#level').removeClass('pw-medium'); 
			$('#level').removeClass('pw-strong'); 
			$('#level').addClass('pw-weak'); 
			 //如果密码为6为及以下，就算字母、数字、特殊字符三项都包括，强度也是弱的 
		} 
		return true; 
	}); 
	$('#userPassWordP').keyup(function () { 
		var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g"); 
		var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g"); 
		var enoughRegex = new RegExp("(?=.{6,}).*", "g"); 
	
		if (false == enoughRegex.test($(this).val())) { 
			$('#level1').removeClass('pw-weak'); 
			$('#level1').removeClass('pw-medium'); 
			$('#level1').removeClass('pw-strong'); 
			$('#level1').addClass(' pw-defule'); 
			 //密码小于六位的时候，密码强度图片都为灰色 
		} 
		else if (strongRegex.test($(this).val())) { 
			$('#level1').removeClass('pw-weak'); 
			$('#level1').removeClass('pw-medium'); 
			$('#level1').removeClass('pw-strong'); 
			$('#level1').addClass(' pw-strong'); 
			 //密码为八位及以上并且字母数字特殊字符三项都包括,强度最强 
		} 
		else if (mediumRegex.test($(this).val())) { 
			$('#level1').removeClass('pw-weak'); 
			$('#level1').removeClass('pw-medium'); 
			$('#level1').removeClass('pw-strong'); 
			$('#level1').addClass(' pw-medium'); 
			 //密码为七位及以上并且字母、数字、特殊字符三项中有两项，强度是中等 
		} 
		else { 
			$('#level1').removeClass('pw-weak'); 
			$('#level1').removeClass('pw-medium'); 
			$('#level1').removeClass('pw-strong'); 
			$('#level1').addClass('pw-weak'); 
			 //如果密码为6为及以下，就算字母、数字、特殊字符三项都包括，强度也是弱的 
		} 
		return true; 
	}); 
	$('#passWordG').keyup(function () { 
		var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g"); 
		var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g"); 
		var enoughRegex = new RegExp("(?=.{6,}).*", "g"); 
	
		if (false == enoughRegex.test($(this).val())) { 
			$('#level2').removeClass('pw-weak'); 
			$('#level2').removeClass('pw-medium'); 
			$('#level2').removeClass('pw-strong'); 
			$('#level2').addClass(' pw-defule'); 
			 //密码小于六位的时候，密码强度图片都为灰色 
		} 
		else if (strongRegex.test($(this).val())) { 
			$('#level2').removeClass('pw-weak'); 
			$('#level2').removeClass('pw-medium'); 
			$('#level2').removeClass('pw-strong'); 
			$('#level2').addClass(' pw-strong'); 
			 //密码为八位及以上并且字母数字特殊字符三项都包括,强度最强 
		} 
		else if (mediumRegex.test($(this).val())) { 
			$('#level2').removeClass('pw-weak'); 
			$('#level2').removeClass('pw-medium'); 
			$('#level2').removeClass('pw-strong'); 
			$('#level2').addClass(' pw-medium'); 
			 //密码为七位及以上并且字母、数字、特殊字符三项中有两项，强度是中等 
		} 
		else { 
			$('#level2').removeClass('pw-weak'); 
			$('#level2').removeClass('pw-medium'); 
			$('#level2').removeClass('pw-strong'); 
			$('#level2').addClass('pw-weak'); 
			 //如果密码为6为及以下，就算字母、数字、特殊字符三项都包括，强度也是弱的 
		} 
		return true; 
	}); 
	$('#passWordI').keyup(function () { 
		var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g"); 
		var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g"); 
		var enoughRegex = new RegExp("(?=.{6,}).*", "g"); 
	
		if (false == enoughRegex.test($(this).val())) { 
			$('#level3').removeClass('pw-weak'); 
			$('#level3').removeClass('pw-medium'); 
			$('#level3').removeClass('pw-strong'); 
			$('#level3').addClass(' pw-defule'); 
			 //密码小于六位的时候，密码强度图片都为灰色 
		} 
		else if (strongRegex.test($(this).val())) { 
			$('#level3').removeClass('pw-weak'); 
			$('#level3').removeClass('pw-medium'); 
			$('#level3').removeClass('pw-strong'); 
			$('#level3').addClass(' pw-strong'); 
			 //密码为八位及以上并且字母数字特殊字符三项都包括,强度最强 
		} 
		else if (mediumRegex.test($(this).val())) { 
			$('#level3').removeClass('pw-weak'); 
			$('#level3').removeClass('pw-medium'); 
			$('#level3').removeClass('pw-strong'); 
			$('#level3').addClass(' pw-medium'); 
			 //密码为七位及以上并且字母、数字、特殊字符三项中有两项，强度是中等 
		} 
		else { 
			$('#level3').removeClass('pw-weak'); 
			$('#level3').removeClass('pw-medium'); 
			$('#level3').removeClass('pw-strong'); 
			$('#level3').addClass('pw-weak'); 
			 //如果密码为6为及以下，就算字母、数字、特殊字符三项都包括，强度也是弱的 
		} 
		return true; 
	});
	$('#passWordS').keyup(function () { 
		var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g"); 
		var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g"); 
		var enoughRegex = new RegExp("(?=.{6,}).*", "g"); 
	
		if (false == enoughRegex.test($(this).val())) { 
			$('#level4').removeClass('pw-weak'); 
			$('#level4').removeClass('pw-medium'); 
			$('#level4').removeClass('pw-strong'); 
			$('#level4').addClass(' pw-defule'); 
			 //密码小于六位的时候，密码强度图片都为灰色 
		} 
		else if (strongRegex.test($(this).val())) { 
			$('#level4').removeClass('pw-weak'); 
			$('#level4').removeClass('pw-medium'); 
			$('#level4').removeClass('pw-strong'); 
			$('#level4').addClass(' pw-strong'); 
			 //密码为八位及以上并且字母数字特殊字符三项都包括,强度最强 
		} 
		else if (mediumRegex.test($(this).val())) { 
			$('#level4').removeClass('pw-weak'); 
			$('#level4').removeClass('pw-medium'); 
			$('#level4').removeClass('pw-strong'); 
			$('#level4').addClass(' pw-medium'); 
			 //密码为七位及以上并且字母、数字、特殊字符三项中有两项，强度是中等 
		} 
		else { 
			$('#level4').removeClass('pw-weak'); 
			$('#level4').removeClass('pw-medium'); 
			$('#level4').removeClass('pw-strong'); 
			$('#level4').addClass('pw-weak'); 
			 //如果密码为6为及以下，就算字母、数字、特殊字符三项都包括，强度也是弱的 
		} 
		return true; 
	});
	$('#passWordP').keyup(function () { 
		var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g"); 
		var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g"); 
		var enoughRegex = new RegExp("(?=.{6,}).*", "g"); 
	
		if (false == enoughRegex.test($(this).val())) { 
			$('#level5').removeClass('pw-weak'); 
			$('#level5').removeClass('pw-medium'); 
			$('#level5').removeClass('pw-strong'); 
			$('#level5').addClass(' pw-defule'); 
			 //密码小于六位的时候，密码强度图片都为灰色 
		} 
		else if (strongRegex.test($(this).val())) { 
			$('#level5').removeClass('pw-weak'); 
			$('#level5').removeClass('pw-medium'); 
			$('#level5').removeClass('pw-strong'); 
			$('#level5').addClass(' pw-strong'); 
			 //密码为八位及以上并且字母数字特殊字符三项都包括,强度最强 
		} 
		else if (mediumRegex.test($(this).val())) { 
			$('#level5').removeClass('pw-weak'); 
			$('#level5').removeClass('pw-medium'); 
			$('#level5').removeClass('pw-strong'); 
			$('#level5').addClass(' pw-medium'); 
			 //密码为七位及以上并且字母、数字、特殊字符三项中有两项，强度是中等 
		} 
		else { 
			$('#level5').removeClass('pw-weak'); 
			$('#level5').removeClass('pw-medium'); 
			$('#level5').removeClass('pw-strong'); 
			$('#level5').addClass('pw-weak'); 
			 //如果密码为6为及以下，就算字母、数字、特殊字符三项都包括，强度也是弱的 
		} 
		return true; 
	});
	
	//合并$(function(){});
	$("#weixin_image").fileupload({
		 dataType :'iframe text',
		 autoUpload: true,
		 maxNumberOfFiles : 1,
       url: '<%=baseLocalPath%>register/Upload.act',
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
  		$("#weixin_show").attr("src","<%=baseLocalPath%>shyl/images/img.png");
		return false;
  	 }else if("nosize"==data.result){
  		$("#weixin_show").tips({
			side : 2,
			msg : '请上传小于10MB的图片。',
			bg : '#AE81FF',
			time : 3
		});
  		$("#weixin_show").attr("src","<%=baseLocalPath%>shyl/images/img.png");
		return false;
  	 } else {
  		 $("#weixin_show").attr("src",document.getElementsByTagName('base')[0].href+"images/"+data.result);
           document.getElementById("license").value=data.result;
  	 }
   });
	
	$("#weixin_imageI").fileupload({
		 dataType :'iframe text',
		 autoUpload: true,
		 maxNumberOfFiles : 1,
       url: '<%=baseLocalPath%>register/Upload.act',
       sequentialUploads: true
	 }).bind('fileuploadchange', function (e, data) {
		 if(data.files.length > 1){
			 $("#weixin_showI").tips({
					side : 2,
					msg : '只能上传一张照片。',
					bg : '#AE81FF',
					time : 3
			 });
            return false;
		 }
   }).bind('fileuploaddone', function (e, data) {
  	 if("no"==data.result){
  		$("#weixin_showI").tips({
			side : 2,
			msg : '请上传格式为.jpg/.jpeg/.png./gif格式的图片。',
			bg : '#AE81FF',
			time : 3
		});
  		$("#weixin_showI").attr("src","<%=baseLocalPath%>shyl/images/img.png");
		return false;
  	 }else if("nosize"==data.result){
   		$("#weixin_showI").tips({
 			side : 2,
 			msg : '请上传小于10MB的图片。',
 			bg : '#AE81FF',
 			time : 3
 		});
   		$("#weixin_showI").attr("src","<%=baseLocalPath%>shyl/images/img.png");
 		return false;
  	 } else {
  		 $("#weixin_showI").attr("src",document.getElementsByTagName('base')[0].href+"images/"+data.result);
           document.getElementById("licenseI").value=data.result;
  	 }
   });
	
	$("#weixin_imageS").fileupload({
		 dataType :'iframe text',
		 autoUpload: true,
		 maxNumberOfFiles : 1,
       url: '<%=baseLocalPath%>register/Upload.act',
       sequentialUploads: true
	 }).bind('fileuploadchange', function (e, data) {
		 if(data.files.length > 1){
			 $("#weixin_showS").tips({
					side : 2,
					msg : '只能上传一张照片。',
					bg : '#AE81FF',
					time : 3
			 });
            return false;
		 }
   }).bind('fileuploaddone', function (e, data) {
  	 if("no"==data.result){
  		$("#weixin_showS").tips({
			side : 2,
			msg : '请上传格式为.jpg/.jpeg/.png./gif格式的图片。',
			bg : '#AE81FF',
			time : 3
		});
  		$("#weixin_showS").attr("src","<%=baseLocalPath%>shyl/images/img.png");
		return false;
  	}else if("nosize"==data.result){
   		$("#weixin_showS").tips({
 			side : 2,
 			msg : '请上传小于10MB的图片。',
 			bg : '#AE81FF',
 			time : 3
 		});
   		$("#weixin_showS").attr("src","<%=baseLocalPath%>shyl/images/img.png");
 		return false;
  	 } else {
  		 $("#weixin_showS").attr("src",document.getElementsByTagName('base')[0].href+"images/"+data.result);
           document.getElementById("licenseS").value=data.result;
  	 }
   });
	
	$("#weixin_imageP").fileupload({
		 dataType :'iframe text',
		 autoUpload: true,
		 maxNumberOfFiles : 1,
       url: '<%=baseLocalPath%>register/Upload.act',
       sequentialUploads: true
	 }).bind('fileuploadchange', function (e, data) {
		 if(data.files.length > 1){
			 $("#weixin_showP").tips({
					side : 2,
					msg : '只能上传一张照片。',
					bg : '#AE81FF',
					time : 3
			 });
            return false;
		 }
   }).bind('fileuploaddone', function (e, data) {
  	 if("no"==data.result){
  		$("#weixin_showP").tips({
			side : 2,
			msg : '请上传格式为.jpg/.jpeg/.png./gif格式的图片。',
			bg : '#AE81FF',
			time : 3
		});
  		$("#weixin_showP").attr("src","<%=baseLocalPath%>shyl/images/img.png");
		return false;
  	}else if("nosize"==data.result){
   		$("#weixin_showP").tips({
 			side : 2,
 			msg : '请上传小于10MB的图片。',
 			bg : '#AE81FF',
 			time : 3
 		});
   		$("#weixin_showP").attr("src","<%=baseLocalPath%>shyl/images/img.png");
 		return false;
  	 } else {
  		 $("#weixin_showP").attr("src",document.getElementsByTagName('base')[0].href+"images/"+data.result);
           document.getElementById("licenseP").value=data.result;
  	 }
   });
})
</script>
</head>
<style>
div.register-box{
	background-color: #fff;
	width: 1140px;
	min-height: 500px;
	padding: 30px;
	padding-bottom: 130px;
	margin: 0 auto;
	box-shadow:0 0 30px #e1e1e1;
	border: 1px solid #edf1fc;
	position: relative;
	margin-top: 130px;
	overflow: hidden;
}
div.register-box div.rticon{
	position: absolute;
	right:0;top:0;
	width:326px;height: 179px;
	background: url(shyl/images/rticon.png) no-repeat right top;
}
div.register-box div.lbicon{
	position: absolute;
	left:0;bottom:0;
	width:181px;height: 170px;
	background: url(shyl/images/lbicon.png) no-repeat left bottom;
}
div.register-box h1{
	font-size: 1.3em;
	line-height: 30px;
}
div.register-box h1 i{
	font-size: 0.75em;
	border-left:1px solid #3d68ce;padding-left: 15px;margin-left: 15px;
	line-height: 30px;
}
div.register-c{
	width: 80%;
	margin: 0 auto;
	margin-top: 50px;
}
div.register-c .register-c-1{
	width: 75%;
	margin-left: 25%;
    float: left;
}
div.register-c .register-c-1 a{
	font-size: 0.85em;
	background-color: #e8eaf0;
	color: #bcbfc7;
	width: 180px;
	text-align: center;
	height: 50px;
	line-height: 50px;
	display: inline-block;border-radius:4px;
    text-shadow: #fff 0 1px 1px;
    float: left;
    margin-right: 10px;
}
.submit{
	font-size: 0.85em;border:0;
	background-color: #3961c2;
	color: #fff;
	padding: 0;
	width: 360px;
	height: 50px;
	line-height: 50px;
	display: inline-block;border-radius:4px;
    float: left;
    margin-top: 30px;
    margin-left: 30%;
    margin-right: 10px;
    cursor:pointer;
}
a.smssend{
	font-size: 0.85em;border:0;
	background-color: #b8bdc3;
	color: #424c59;
	padding: 0;
	width: 150px;
	text-align: center;
	height: 46px;
	line-height: 46px;
	display: inline-block;border-radius:4px;
    float: left;
    margin-left: 0px;
}
a.smssend:hover{
	background-color: #e54161;
	color: #fff;
}
div.register-c .register-c-1 a:hover,div.register-c .register-c-1 a.hover{
	background-color: #3961c2;
	color: #fff;
    text-shadow: none;
}
div.register-c .register-c-2{
	width: 100%;
    float: left;margin-top: 10px;
}
div.register-c .register-c-2 ul{
	width: 100%;
}
div.register-c .register-c-2 ul li{
	width: 100%;
	margin-top: 18px;
	float:left;
}
div.register-c .register-c-2 ul li span{
	line-height:50px;font-size: 0.85em;color: #404653;
}
div.register-c .register-c-2 ul li span a{
	color: #404653;text-decoration: underline;padding: 0 3px;
}
div.register-c .register-c-2 ul li label{
	width: 22%;
	display: inline-block;
	float: left;
	text-align: right;
	padding-right: 3%;
	line-height: 50px;
	height: 50px;
	color: #404653;
	font-size: 0.85em;
	position: relative;
}
div.register-c .register-c-2 ul li label i{
	color: #e54161;
	position: absolute;right: 11%;top:0;line-height: 56px;
}
div.register-c .register-c-2 ul li a.tabbtn{
	font-size: 0.85em;
	color: #9a9a9a;
	padding: 0;
	width: 140px;
	text-align: center;
	height: 48px;
	margin-right: 10px;
	line-height: 48px;
	display: inline-block;border-radius:4px;
	border: 1px solid #9a9a9a;transition: 0s;
}
div.register-c .register-c-2 ul li a.tabbtn:hover,div.register-c .register-c-2 ul li a.tabbtn_hover{
	border: 1px solid #416cc5;
	background: url(shyl/images/jb_1.png) no-repeat right top;
	color: #416cc5;
}
.inputtxt{
	height: 44px;line-height: 44px;border: 1px solid #9a9a9a; color:#9a9a9a; border-radius:4px;width: 56%;padding-left: 1%;font-size: 0.85em;float:left;
}
.inputtxt:hover{
	border: 1px solid #566ef9;
}
.inputselect{
	height: 46px;line-height: 46px;border: 1px solid #9a9a9a;border-radius:4px;width: 57%;font-size: 0.85em;float:left;background: #f7f7f7;*margin-top: 15px;
}
.duan{
	width: 15%;margin-right: 10px;
}
.upload_img{
	float: left;width: 60%;position: relative;
}
.upload_img img{float: left;}
.upload_img a{
	position: absolute;
	left: 210px;top:0;
	font-size: 0.85em;border:0;
	background-color: #3961c2;
	color: #fff;
	padding: 0;
	width: 160px;
	text-align: center;
	height: 50px;
	line-height: 50px;
	display: inline-block;border-radius:4px;
    float: left;
    margin-top: 0px;
}
.upload_img p{
	position: absolute;
	bottom:10px;
	left: 210px;
	color: #737373;
	line-height: 30px;
	width: 60%;
	font-size: 0.75em;
	float: left;
}
.upload_img p i{
	color: #1c1c1c;font-weight: bold;
	font-size: 1.1em;
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
.a-upload  input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
    filter: alpha(opacity=0);
    cursor: pointer
}
.select_btn {
    margin-bottom: 0;
    font-size: 14px;
    line-height: 20px;
    color: #333;
    text-align: center;
    text-shadow: 0 1px 1px rgba(255,255,255,0.75);
    vertical-align: middle;
    cursor: pointer;
    background-color: #f5f5f5;
    background-image: linear-gradient(to bottom,#fff,#e6e6e6);
    background-repeat: repeat-x;
    border: 1px solid #ccc;
    border-color: rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);
    border-bottom-color: #b3b3b3;
    border-radius: 4px;
}
</style>
<body style="background-color: #f7f7f7;">

	<div class="register-box">
		<div class="rticon"></div>
		<div class="lbicon"></div>
		<h1>欢迎注册<i>济南市服务外包公共服务</i></h1>
		<div class="register-c">
			<input type="hidden" id="typeReg" value="1" />
			<div class="register-c-1">
				<a href="javascript:;" param="1" class="hover">个人注册</a>
				<a href="javascript:;" param="2">团体注册</a>
			</div>
			<div id="reg_gr" class="register-c-2">
				<ul>
					<li id="grtab"><label>注册方式：</label><a href="javascript:;" id="emailMethod" param="email" class="tabbtn tabbtn_hover">邮箱注册</a><a href="javascript:;" id="phoneMethod" param="mobile" class="tabbtn">手机注册</a></li>
					<form id="reg_gr_email">
						<li><label><span style="color: red">*</span>邮箱：</label><input type="text" name="userEmail" id="userEmail" class="inputtxt" maxlength="50" placeholder="请输入邮箱" onBlur="trim(this);userEmailBlur();"></li>
						<li><label><span style="color: red">*</span>用户名：</label><input type="text" name="userName" id="userName" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" class="inputtxt" maxlength="30" placeholder="只能是A-Z、a-z及数字间的组合" onBlur="trim(this);userNameBlur();"></li>
						<li><label><span style="color: red">*</span>密码：</label><input type="password" name="userPassWord" id="userPassWord" class="inputtxt" maxlength="20" placeholder="只能是字母、数字、特殊符号中的两种及以上的组合，且长度不少于6位" onBlur="userPassWordBlur();"></li>
						<li id="level" class="pw-strength" style="margin-left: 240px;">
							<div class="pw-bar"></div>
							<div class="pw-bar-on"></div>
							<div class="pw-txt">
								<span>弱</span>
								<span>中</span>
								<span>强</span>
							</div>
						</li>
						<li><label><span style="color: red">*</span>确认密码：</label><input type="password" name="userCPassWord" id="userCPassWord" class="inputtxt" maxlength="20" placeholder="请与密码保持一致" onBlur="userCPassWordBlur();"></li>
						<li><label><span style="color: red">*</span>验证码：</label><input type="text" name="userCkeckCode" id="userCkeckCode" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" class="inputtxt duan" maxlength="4" placeholder="" onBlur="trim(this);userCkeckCodeBlur();"><img id="codeImg" style="width:80px; height:38px;padding: 3px 0px 0px 0px;" src="<%=baseLocalPath%>shyl/images/yzm.jpg"></li>
						<li><label><span style="color: red">*</span>注册条款：</label><input type="checkbox" name="userCheck" id="userCheck" onchange="changeval();"> <span>我已经仔细阅读并接受<a href="<%=baseLocalPath%>register/goRegistration.act" target="_blank;">注册条款</a></span></li>
						<input type="button" class="submit" onclick="emailSub();" value="立即注册">
					</form>
					<form id="reg_gr_mobile" style="display: none;">
						<li><label><span style="color: red">*</span>手机：</label><input type="text" name="userPhone" id="userPhone" onkeyup="value=value.replace(/[^0-9]/g,'')" class="inputtxt" maxlength="20" placeholder="请输入中国大陆手机号码" onBlur="userPhoneBlur();trim(this)" style="ime-mode:disabled"></li>
						<li><label><span style="color: red">*</span>用户名：</label><input type="text" name="userNameP" id="userNameP" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" class="inputtxt" maxlength="30" placeholder="只能是A-Z、a-z及数字间的组合" onBlur="trim(this);userNamePBlur();"></li>
						<li><label><span style="color: red">*</span>密码：</label><input type="password" name="userPassWordP" id="userPassWordP" class="inputtxt" maxlength="20" placeholder="只能是字母、数字、特殊符号中的两种及以上的组合，且长度不少于6位" onBlur="userPassWordPBlur();"></li>
						<li id="level1" class="pw-strength" style="margin-left: 240px;">
							<div class="pw-bar"></div>
							<div class="pw-bar-on"></div>
							<div class="pw-txt">
								<span>弱</span>
								<span>中</span>
								<span>强</span>
							</div>
						</li>
						<li><label><span style="color: red">*</span>确认密码：</label><input type="password" name="userCPassWordP" id="userCPassWordP" class="inputtxt" maxlength="20" placeholder="请与密码保持一致" onBlur="userCPassWordPBlur();"></li>
						<li><label><span style="color: red">*</span>验证码：</label><input type="text" name="userCkeckCodeP" id="userCkeckCodeP" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" class="inputtxt duan" maxlength="4" placeholder="" onBlur="trim(this);userCkeckCodePBlur();"><img id="codePImg" style="width:80px; height:38px;padding: 3px 0px 0px 0px;" src="<%=baseLocalPath%>shyl/images/yzm.jpg"></li>
						<li><label><span style="color: red">*</span>短信验证码：</label><input type="text" name="userCkeckPhoneCode" id="userCkeckPhoneCode" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" class="inputtxt duan" placeholder="" onBlur="trim(this);userCkeckPCodeBlur();"><a href="javascript:;" id="smsS" class="smssend" onclick="smsSend();">发送验证码</a></li>
						<li><label><span style="color: red">*</span>注册条款：</label><input type="checkbox" name="userCheckP" id="userCheckP"  onchange="changevalP();"> <span>我已经仔细阅读并接受<a href="<%=baseLocalPath%>register/goRegistration.act" target="_blank;">注册条款</a></span></li>
						<input type="button" class="submit" onclick="phoneSub();" value="立即注册">
					</form>
				</ul>
			</div>
			<div id="reg_td" class="register-c-2" style="display: none;">
				
				<ul>
					<li id="tdtab"><label>注册方式：</label><a href="javascript:;" id="groupMethod" param="qy" class="tabbtn tabbtn_hover">企业注册</a><a href="javascript:;" id="groupMethodI" param="pxjg" class="tabbtn">培训机构注册</a><a href="javascript:;" id="groupMethodS" param="yx" class="tabbtn">院校注册</a><a href="javascript:;" id="groupMethodP" param="qp" class="tabbtn">其他用户注册</a></li>
					<form id="reg_qy">
						<li><label><span style="color: red">*</span>用户名：</label><input type="text" name="userNm" id="userNm" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" class="inputtxt" maxlength="30" placeholder="只能是A-Z、a-z及数字间的组合" onBlur="trim(this);userNmBlur();"></li>
						<li><label><span style="color: red">*</span>电子邮箱：</label><input type="text" name="email" id="email" class="inputtxt" maxlength="50" placeholder="请输入联系邮箱" onBlur="trim(this);emailBlur();"></li>
						<li><label><span style="color: red">*</span>密码：</label><input type="password" name="passWordG" id="passWordG" class="inputtxt" maxlength="20" placeholder="只能是字母、数字、特殊符号中的两种及以上的组合，且长度不少于6位" onBlur="passWordGBlur();"></li>
						<li id="level2" class="pw-strength" style="margin-left: 240px;">
							<div class="pw-bar"></div>
							<div class="pw-bar-on"></div>
							<div class="pw-txt">
								<span>弱</span>
								<span>中</span>
								<span>强</span>
							</div>
						</li>
						<li><label><span style="color: red">*</span>确认密码：</label><input type="password" name="cPassWordG" id="cPassWordG" class="inputtxt" maxlength="20" placeholder="请与密码保持一致" onBlur="cPassWordGBlur();"></li>
						<li><label><span style="color: red">*</span>企业名称：</label><input type="text" name="groupName" id="groupName" class="inputtxt" maxlength="50" placeholder="" onBlur="trim(this);groupNmBlur();"></li>
						<li><label><span style="color: red">*</span>组织代码：</label><input type="text" name="ocode" id="ocode" class="inputtxt" maxlength="50" placeholder="请输入组织机构代码或统一社会信用代码"  onBlur="trim(this);ocodeBlur();"></li>
						<li><label><span style="color: red">*</span>营业执照扫描件：</label>
						<div class="upload_img">
						    <input id="license" name="license" type="hidden" value=""/>
							<img id="weixin_show" name="weixin_show" style="width: 158px; height: 190px;" src="<%=baseLocalPath%>shyl/images/img.png">
							<a href="javascript:;" class="a-upload" style="text-decoration:none; color:#ffffff;">上传本地图片<input type="file" id="weixin_image" placeholder="上传本地图片" name="weixin_image" multiple></a>
							<p>本平台面向企业提供业务对接，<br/>
							为了保证信息的准确性，请提供营业执照扫描件<br/>
							<i>支持的文件格式为.gif、.jpeg、.jpg、.png</i>
							<br><i>建议图片最大为10MB，尺寸在4000*4000以内</i></p>
						</div></li>
						<li><label><span style="color: red">*</span>公司行业：</label>
						<a class="btn select_btn btn-block" data-toggle="modal"
						        id="inText" data-target="#myIndustry" onclick="InChecked()" style="width: 520px; height: 20px; padding: 12px;">请选择公司行业&nbsp;<b
						        class="caret"></b></a> <input id="inId" name="inId" type="hidden"
						        value=""> <input id="Industry" name="Industry" type="hidden" value="" />
						</li>
						<li><label><span style="color: red">*</span>注册地：</label>
							<select class="inputselect" id="province" name="province" style="width: 26%; padding: 12px 0;">
								<option>---省---</option>
								<c:forEach items="${ProvinceList}" var="pd">
									<option value="${pd.region_id}"
									<c:if test="${pd.region_id == '16'}">selected</c:if>>${pd.region_name}</option>
								</c:forEach>
							</select>
							<select class="inputselect" id="city" name="city" style="width: 26%;margin-left: 3%; padding: 12px 0;">
								<option>---市---</option>
								<c:forEach items="${CityList}" var="cit">
									<option value="${cit.region_id}"
									<c:if test="${cit.region_id == '170'}">selected</c:if>>${cit.region_name}</option>
								</c:forEach>
							</select>
						</li>
						<li id="areali" style="display: block;"><label><span style="color: red">*</span>审核机关：</label>
							<select class="inputselect" id="auditOrgan" name="auditOrgan" style="width: 55%; padding: 12px 0;">
								<option>---商务局---</option>
								<c:forEach items="${areaList}" var="area">
									<option value="${area.region_id}">${area.region_name}商务局</option>
								</c:forEach>
							</select>
						</li>
						<li><label><span style="color: red">*</span>地址：</label><input type="text" name="address" id="address" class="inputtxt" maxlength="255" placeholder="" onBlur="trim(this);addressBlur();"></li>
						<li><label><span style="color: red">*</span>联系人：</label><input type="text" name="contact" id="contact" class="inputtxt" maxlength="50" placeholder="" onBlur="trim(this);contactBlur();"></li>
						<li><label><span style="color: red">*</span>电话：</label><input type="text" name="phone" id="phone" class="inputtxt" maxlength="20" placeholder="输入3-4位区号，7-8位直播号码，1-4位分机号或手机号" onBlur="trim(this);phoneBlur();"></li>
						<li style="height: 20px;margin-top: -25px;"><span style="font-size:12px;color:#AAA;margin-left: 240px;">尽量输入手机号，以便后期找回密码用</span></li>
						<li><label>QQ：</label><input type="text" name="qq" id="qq" class="inputtxt" maxlength="50" placeholder="输入QQ号或QQ邮箱"></li>
						<li><label><span style="color: red">*</span>验证码：</label><input type="text" name="ckeckCode" id="ckeckCode" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" maxlength="4" class="inputtxt duan" placeholder=""><img id="cCodeImg" style="width:80px; height:38px;padding: 3px 0px 0px 0px;" src="<%=baseLocalPath%>shyl/images/yzm.jpg"></li>
						<li><label><span style="color: red">*</span>注册条款：</label><input type="checkbox" name="checkG" id="checkG" onchange="changeV();"> <span>我已经仔细阅读并接受<a href="<%=baseLocalPath%>register/goRegistration.act" target="_blank;">注册条款</a></span></li>
						<input type="button" class="submit" onclick="groupSub();" value="立即注册">
					</form>
					<form id="reg_pxjg" style="display: none">
						<li><label><span style="color: red">*</span>用户名：</label><input type="text" name="userNmI" id="userNmI" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" class="inputtxt" maxlength="30" placeholder="只能是A-Z、a-z及数字间的组合" onBlur="trim(this);userNmIBlur();"></li>
						<li><label><span style="color: red">*</span>电子邮箱：</label><input type="text" name="emailI" id="emailI" class="inputtxt" maxlength="50" placeholder="请输入联系邮箱" onBlur="trim(this);emailIBlur();"></li>
						<li><label><span style="color: red">*</span>密码：</label><input type="password" name="passWordI" id="passWordI" class="inputtxt" maxlength="20" placeholder="只能是字母、数字、特殊符号中的两种及以上的组合，且长度不少于6位" onBlur="passWordIBlur();"></li>
						<li id="level3" class="pw-strength" style="margin-left: 240px;">
							<div class="pw-bar"></div>
							<div class="pw-bar-on"></div>
							<div class="pw-txt">
								<span>弱</span>
								<span>中</span>
								<span>强</span>
							</div>
						</li>
						<li><label><span style="color: red">*</span>确认密码：</label><input type="password" name="cPassWordI" id="cPassWordI" class="inputtxt" maxlength="20" placeholder="请与密码保持一致" onBlur="cPassWordIBlur();"></li>
						<li><label><span style="color: red">*</span>培训机构名称：</label><input type="text" name="groupNameI" id="groupNameI" class="inputtxt" maxlength="50" placeholder="" onBlur="trim(this);groupNmIBlur();"></li>
						<li><label><span style="color: red">*</span>组织代码：</label><input type="text" name="ocodeI" id="ocodeI" class="inputtxt" maxlength="50" placeholder="请输入组织机构代码或统一社会信用代码" onBlur="trim(this);ocodeIBlur();"></li>
						<li><label><span style="color: red">*</span>营业执照扫描件：</label>
						<div class="upload_img">
							<input id="licenseI" name="licenseI" type="hidden" value=""/>
							<img id="weixin_showI" name="weixin_showI" style="width: 158px; height: 190px;" src="<%=baseLocalPath%>shyl/images/img.png">
							<a href="javascript:;" class="a-upload" style="text-decoration:none; color:#ffffff;">上传本地图片<input type="file" id="weixin_imageI" placeholder="上传本地图片" name="weixin_imageI" multiple></a>
							<p>本平台面向培训机构提供业务对接，<br/>
							为了保证信息的准确性，请提供营业执照扫描件<br/>
							<i>支持的文件格式为.gif、.jpeg、.jpg、.png</i>
							<br><i>建议图片最大为10MB，尺寸在4000*4000以内</i></p>
						</div></li>
						<li><label><span style="color: red">*</span>注册地：</label>
							<select class="inputselect" name="provinceI" id="provinceI"style="width: 26%; padding: 12px 0;">
								<option>---省---</option>
								<c:forEach items="${ProvinceList}" var="pd">
									<option value="${pd.region_id}"
									<c:if test="${pd.region_id == '16'}">selected</c:if>>${pd.region_name}</option>
								</c:forEach>
							</select>
							<select class="inputselect" id="cityI" name="cityI" style="width: 26%;margin-left: 3%; padding: 12px 0;">
								<option>---市---</option>
								<c:forEach items="${CityList}" var="cit">
									<option value="${cit.region_id}"
									<c:if test="${cit.region_id == '170'}">selected</c:if>>${cit.region_name}</option>
								</c:forEach>
							</select>
						</li>
						<li id="arealiI" style="display: block;"><label><span style="color: red">*</span>审核机关：</label>
							<select class="inputselect" id="auditOrganI" name="auditOrganI" style="width: 55%; padding: 12px 0;">
								<option>---商务局---</option>
								<c:forEach items="${areaList}" var="area">
									<option value="${area.region_id}">${area.region_name}商务局</option>
								</c:forEach>
							</select>
						</li>
						<li><label><span style="color: red">*</span>地址：</label><input type="text" name="addressI" id="addressI" class="inputtxt" maxlength="255" placeholder="" onBlur="trim(this);addressIBlur();"></li>
						<li><label><span style="color: red">*</span>联系人：</label><input type="text" name="contactI" id="contactI" class="inputtxt" maxlength="255" placeholder="" onBlur="trim(this);contactIBlur();"></li>
						<li><label><span style="color: red">*</span>电话：</label><input type="text" name="phoneI" id="phoneI" class="inputtxt" maxlength="20" placeholder="输入3-4位区号，7-8位直播号码，1-4位分机号或手机号" onBlur="trim(this);phoneIBlur();"></li>
						<li style="height: 20px;margin-top: -25px;"><span style="font-size:12px;color:#AAA;margin-left: 240px;">尽量输入手机号，以便后期找回密码用</span></li>
						<li><label>QQ：</label><input type="text" name="qqI" id="qqI" class="inputtxt" maxlength="50" placeholder="输入QQ号或QQ邮箱" ></li>
						<li><label><span style="color: red">*</span>验证码：</label><input type="text" name="ckeckCodeI" id="ckeckCodeI" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" maxlength="4" class="inputtxt duan" placeholder="" onBlur="trim(this);ckeckCodeIBlur();"><img id="cCodeIImg" style="width:80px; height:38px;padding: 3px 0px 0px 0px;" src="<%=baseLocalPath%>shyl/images/yzm.jpg"></li>
						<li><label><span style="color: red">*</span>注册条款：</label><input type="checkbox" name="checkI" id="checkI" onchange="changeI();"> <span>我已经仔细阅读并接受<a href="<%=baseLocalPath%>register/goRegistration.act" target="_blank;">注册条款</a></span></li>
						<input type="button" class="submit" onclick="institutionSub();" value="立即注册">
					</form>
					<form id="reg_yx" style="display:none">
						<li><label><span style="color: red">*</span>用户名：</label><input type="text" name="userNmS" id="userNmS" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" class="inputtxt" maxlength="30" placeholder="只能是A-Z、a-z及数字间的组合" onBlur="trim(this);userNmSBlur();"></li>
						<li><label><span style="color: red">*</span>电子邮箱：</label><input type="text" name="emailS" id="emailS" class="inputtxt" maxlength="50" placeholder="请输入联系邮箱" onBlur="trim(this);emailSBlur();"></li>
						<li><label><span style="color: red">*</span>密码：</label><input type="password" name="passWordS" id="passWordS" class="inputtxt" maxlength="20" placeholder="只能是字母、数字、特殊符号中的两种及以上的组合，且长度不少于6位" onBlur="passWordSBlur();"></li>
						<li id="level4" class="pw-strength" style="margin-left: 240px;">
							<div class="pw-bar"></div>
							<div class="pw-bar-on"></div>
							<div class="pw-txt">
								<span>弱</span>
								<span>中</span>
								<span>强</span>
							</div>
						</li>
						<li><label><span style="color: red">*</span>确认密码：</label><input type="password" name="cPassWordS" id="cPassWordS" class="inputtxt" maxlength="20" placeholder="请与密码保持一致" onBlur="cPassWordSBlur();"></li>
						<li><label><span style="color: red">*</span>院校名称：</label><input type="hidden" id="school_id"/><input type="text" name="groupNameS" id="groupNameS" class="inputtxt" maxlength="50" placeholder="" onBlur="trim(this);groupNmSBlur();"></li>
						<li><label><span style="color: red">*</span>组织代码：</label><input type="text" name="ocodeS" id="ocodeS" class="inputtxt" maxlength="50" placeholder="请输入组织机构代码或统一社会信用代码" onBlur="trim(this);ocodeSBlur();"></li>
						<li><label><span style="color: red">*</span>事业单位法人证书 ：</label>
						<div class="upload_img">
							<input id="licenseS" name="licenseS" type="hidden" value=""/>
							<img id="weixin_showS" name="weixin_showS" style="width: 158px; height: 190px;" src="<%=baseLocalPath%>shyl/images/img.png">
							<a href="javascript:;" class="a-upload" style="text-decoration:none; color:#ffffff;">上传本地图片<input type="file" id="weixin_imageS" placeholder="上传本地图片" name="weixin_imageS" multiple></a>
							<p>本平台面向院校提供业务对接，<br/>
							为了保证信息的准确性，请提供事业单位法人证书 <br/>
							<i>支持的文件格式为.gif、.jpeg、.jpg、.png</i>
							<br><i>建议图片最大为10MB，尺寸在4000*4000以内</i></p>
						</div></li>
						<li><label><span style="color: red">*</span>注册地：</label>
							<select class="inputselect" id="provinceS" name="provinceS" style="width: 26%; padding: 12px 0;">
								<option>---省---</option>
								<c:forEach items="${ProvinceList}" var="pd">
									<option value="${pd.region_id}"
									<c:if test="${pd.region_id == '16'}">selected</c:if>>${pd.region_name}</option>
								</c:forEach>
							</select>
							<select class="inputselect" id="cityS" name="cityS" style="width: 26%;margin-left: 3%; padding: 12px 0;">
								<option>---市---</option>
								<c:forEach items="${CityList}" var="cit">
									<option value="${cit.region_id}"
									<c:if test="${cit.region_id == '170'}">selected</c:if>>${cit.region_name}</option>
								</c:forEach>
							</select>
						</li>
						<li id="arealiS" style="display: block;"><label><span style="color: red">*</span>审核机关：</label>
							<select class="inputselect" id="auditOrganS" name="auditOrganS" style="width: 55%; padding: 12px 0;">
								<option>---商务局---</option>
								<c:forEach items="${areaList}" var="area">
									<option value="${area.region_id}">${area.region_name}商务局</option>
								</c:forEach>
							</select>
						</li>
						<li><label><span style="color: red">*</span>地址：</label><input type="text" name="addressS" id="addressS" class="inputtxt" maxlength="255" placeholder="" onBlur="trim(this);addressSBlur();"></li>
						<li><label><span style="color: red">*</span>联系人：</label><input type="text" name="contactS" id="contactS" class="inputtxt" maxlength="255" placeholder="" onBlur="trim(this);contactSBlur();"></li>
						<li><label><span style="color: red">*</span>电话：</label><input type="text" name="phoneS" id="phoneS" class="inputtxt" maxlength="20" placeholder="输入3-4位区号，7-8位直播号码，1-4位分机号或手机号" onBlur="trim(this);phoneSBlur();"></li>
						<li style="height: 20px;margin-top: -25px;"><span style="font-size:12px;color:#AAA;margin-left: 240px;">尽量输入手机号，以便后期找回密码用</span></li>
						<li><label><span style="color: red">*</span>验证码：</label><input type="text" name="ckeckCodeS" id="ckeckCodeS" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" maxlength="4" class="inputtxt duan" placeholder="" onBlur="ckeckCodeSBlur();"><img id="cCodeSImg" style="width:80px; height:38px;padding: 3px 0px 0px 0px;" src="<%=baseLocalPath%>shyl/images/yzm.jpg"></li>
						<li><label><span style="color: red">*</span>注册条款：</label><input type="checkbox" name="checkS" id="checkS" onchange="changeS();"> <span>我已经仔细阅读并接受<a href="<%=baseLocalPath%>register/goRegistration.act" target="_blank;">注册条款</a></span></li>
						<input type="button" class="submit" onclick="academySub();" value="立即注册">
					</form>
					<form id="reg_qp" style="display: none">
						<li><label><span style="color: red">*</span>用户名：</label><input type="text" name="userNmP" id="userNmP" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" class="inputtxt" maxlength="30" placeholder="只能是A-Z、a-z及数字间的组合" onBlur="trim(this);userNmPBlur();"></li>
						<li><label><span style="color: red">*</span>电子邮箱：</label><input type="text" name="emailP" id="emailP" class="inputtxt" maxlength="50" placeholder="请输入联系邮箱" onBlur="trim(this);emailPBlur();"></li>
						<li><label><span style="color: red">*</span>密码：</label><input type="password" name="passWordP" id="passWordP" class="inputtxt" maxlength="20" placeholder="只能是字母、数字、特殊符号中的两种及以上的组合，且长度不少于6位" onBlur="passWordPBlur();"></li>
						<li id="level5" class="pw-strength" style="margin-left: 240px;">
							<div class="pw-bar"></div>
							<div class="pw-bar-on"></div>
							<div class="pw-txt">
								<span>弱</span>
								<span>中</span>
								<span>强</span>
							</div>
						</li>
						<li><label><span style="color: red">*</span>确认密码：</label><input type="password" name="cPassWordP" id="cPassWordP" class="inputtxt" maxlength="20" placeholder="请与密码保持一致" onBlur="cPassWordPBlur();"></li>
						<li><label>名称：</label><input type="text" name="groupNameP" id="groupNameP" class="inputtxt" maxlength="50" placeholder="" onBlur="trim(this);groupNmPBlur();"></li>
						<li><label>组织代码：</label><input type="text" name="ocodeP" id="ocodeP" class="inputtxt" maxlength="50" placeholder="请输入组织机构代码或统一社会信用代码"  onBlur="trim(this);ocodePBlur();"></li>
						<li><label>营业执照扫描件：</label>
						<div class="upload_img">
						    <input id="licenseP" name="licenseP" type="hidden" value=""/>
							<img id="weixin_showP" name="weixin_showP" style="width: 158px; height: 190px;" src="<%=baseLocalPath%>shyl/images/img.png">
							<a href="javascript:;" class="a-upload" style="text-decoration:none; color:#ffffff;">上传本地图片<input type="file" id="weixin_imageP" placeholder="上传本地图片" name="weixin_imageP" multiple></a>
							<p>为了保证信息的准确性，请提供营业执照扫描件<br/>
							<i>支持的文件格式为.gif、.jpeg、.jpg、.png</i>
							<br><i>建议图片最大为10MB，尺寸在4000*4000以内</i></p>
						</div></li>
						<li><label>行业：</label>
						<a class="btn select_btn btn-block" data-toggle="modal"
						        id="inTextP" data-target="#myIndustryP" onclick="InCheckedP()" style="width: 520px; height: 20px; padding: 12px;">请选择公司行业&nbsp;<b
						        class="caret"></b></a> <input id="inIdP" name="inIdP" type="hidden"
						        value=""> <input id="IndustryP" name="IndustryP" type="hidden" value="" />
						</li>
						<li><label>注册地：</label>
							<select class="inputselect" id="provinceP" name="provinceP" style="width: 26%; padding: 12px 0;">
								<option>---省---</option>
								<c:forEach items="${ProvinceList}" var="pd">
									<option value="${pd.region_id}"
									<c:if test="${pd.region_id == '16'}">selected</c:if>>${pd.region_name}</option>
								</c:forEach>
							</select>
							<select class="inputselect" id="cityP" name="cityP" style="width: 26%;margin-left: 3%; padding: 12px 0;">
								<option>---市---</option>
								<c:forEach items="${CityList}" var="cit">
									<option value="${cit.region_id}"
									<c:if test="${cit.region_id == '170'}">selected</c:if>>${cit.region_name}</option>
								</c:forEach>
							</select>
						</li>
						<li id="arealiP" style="display: block;"><label>审核机关：</label>
							<select class="inputselect" id="auditOrganP" name="auditOrganP" style="width: 55%; padding: 12px 0;">
								<option>---商务局---</option>
								<c:forEach items="${areaList}" var="area">
									<option value="${area.region_id}">${area.region_name}商务局</option>
								</c:forEach>
							</select>
						</li>
						<li><label>地址：</label><input type="text" name="addressP" id="addressP" class="inputtxt" maxlength="255" placeholder="" onBlur="trim(this);addressPBlur();"></li>
						<li><label><span style="color: red">*</span>联系人：</label><input type="text" name="contactP" id="contactP" class="inputtxt" maxlength="50" placeholder="" onBlur="trim(this);contactPBlur();"></li>
						<li><label><span style="color: red">*</span>电话：</label><input type="text" name="phoneP" id="phoneP" class="inputtxt" maxlength="20" placeholder="输入3-4位区号，7-8位直播号码，1-4位分机号或手机号" onBlur="trim(this);phonePBlur();"></li>
						<li style="height: 20px;margin-top: -25px;"><span style="font-size:12px;color:#AAA;margin-left: 240px;">尽量输入手机号，以便后期找回密码用</span></li>
						<li><label>QQ：</label><input type="text" name="qqP" id="qqP" class="inputtxt" maxlength="50" placeholder="输入QQ号或QQ邮箱"></li>
						<li><label><span style="color: red">*</span>验证码：</label><input type="text" name="ckeckCodeP" id="ckeckCodeP" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" maxlength="4" class="inputtxt duan" placeholder="" onBlur="trim(this);ckeckCodePBlur();"><img id="cCodePImg" style="width:80px; height:38px;padding: 3px 0px 0px 0px;" src="<%=baseLocalPath%>shyl/images/yzm.jpg"></li>
						<li><label><span style="color: red">*</span>注册条款：</label><input type="checkbox" name="checkP" id="checkP" onchange="changeP();"> <span>我已经仔细阅读并接受<a href="<%=baseLocalPath%>register/goRegistration.act" target="_blank;">注册条款</a></span></li>
						<input type="button" class="submit" onclick="resourcesSub();" value="立即注册">
					</form>
				</ul>
			</div>
		</div>

        <!-- Modal -->
		<div class="modal fade in" id="myIndustry" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
			data-backdrop="static">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							onclick="Clear()">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">请选择行业</h4>
					</div>
					<div class="modal-body" style="font-size: 13px;">
						<ul class="list-inline xz_list">
							<c:forEach items="${DistinguishList}" var="pdD">
								<li>
									<div class="checkbox">
										<label><input type="checkbox"
											id="aa_${pdD.distinguish_id}" name="Ind"
											value="${pdD.distinguish_id}">${pdD.value}</label>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success"
							onclick="Industrycheck()" data-dismiss="modal">确认</button>
						<button type="button" class="btn btn-default" onclick="Clear()"
							data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal fade in" id="myIndustryP" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabelP" aria-hidden="true"
			data-backdrop="static">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							onclick="ClearP()">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabelP">请选择行业</h4>
					</div>
					<div class="modal-body" style="font-size: 13px;">
						<ul class="list-inline xz_list">
							<c:forEach items="${DistinguishList}" var="pdD">
								<li>
									<div class="checkbox">
										<label><input type="checkbox"
											id="bb_${pdD.distinguish_id}" name="IndP"
											value="${pdD.distinguish_id}">${pdD.value}</label>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success"
							onclick="IndustrycheckP()" data-dismiss="modal">确认</button>
						<button type="button" class="btn btn-default" onclick="ClearP()"
							data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
		
	</div>

    <!--<footer开始>-->
    <jsp:include page="../../common/footer.jsp"></jsp:include>
    <!--</footer结束>-->
</body>

<script type="text/javascript" src="shyl/js/jquery.tips.js"></script>
<link rel="stylesheet" href="shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="shyl/fileupload/css/jquery.fileupload-ui.css">
<script src="shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
<script src="shyl/fileupload/js/jquery.fileupload.js"></script>
<script src="shyl/fileupload/js/jquery.fileupload-process.js"></script>
<script src="shyl/fileupload/js/jquery.fileupload-validate.js"></script>
<script src="shyl/fileupload/js/jquery.iframe-transport.js"></script>
<script type="text/javascript" src="shyl/js/regist.js"></script>
<script type="text/javascript" src="shyl/js/registCheck.js"></script>

<script type="text/javascript">
    //邮箱注册
	function emailSub() {
		if (emailCheck()) {
			var UserEmail = $("#userEmail").val();
			var UserName = $("#userName").val();
			var UserPassWord = $("#userPassWord").val();
			var UserCkeckCode = $("#userCkeckCode").val();
			var RegistMethod = document.getElementById("emailMethod").innerHTML;
			$.ajax({
				type : "POST",
				url : '<%=baseLocalPath%>register/userRegister.act',
				data : {
					UserEmail : UserEmail,
					UserName : UserName,
					UserPassWord : UserPassWord,
					UserCkeckCode : UserCkeckCode,
					RegistMethod : RegistMethod,
					tm : new Date().getTime()
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
					if ("success" == data.result) {
						window.location.href = "<%=baseLocalPath%>register/goSuccess.act";
					} else if ("userError" == data.result) {
						$("#userName").tips({
							side : 2,
							msg : "该用户名已经被注册",
							bg : '#AE81FF',
							time : 5
						});
						$("#userName").focus();
						$("#codeImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=a");
					} else if ("emailError" == data.result) {
						$("#userEmail").tips({
							side : 2,
							msg : "该邮箱已经被注册",
							bg : '#AE81FF',
							time : 5
						});
						$("#userEmail").focus();
						$("#codeImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=a");
					} else if ("userCodeError" == data.result) {
						$("#userCkeckCode").tips({
							side : 3,
							msg : "验证码不一致",
							bg : '#AE81FF',
							time : 5
						});
						$("#userCkeckCode").focus();
						$("#codeImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=a");
					}
				}
			});
		}
	}
    
	// 手机号注册
	function phoneSub() {
		if (phoneCheck()) {
			var UserPhone = $("#userPhone").val();
			var UserName = $("#userNameP").val();
			var UserPassWord = $("#userPassWordP").val();
			var UserCkeckCode = $("#userCkeckCodeP").val();
			var userCkeckPhoneCode = $("#userCkeckPhoneCode").val();
			var RegistMethod = document.getElementById("phoneMethod").innerHTML;
			$.ajax({
				type : "POST",
				url : '<%=baseLocalPath%>register/userRegister.act',
				data : {
					UserPhone : UserPhone,
					UserName : UserName,
					UserPassWord : UserPassWord,
					UserCkeckCode : UserCkeckCode,
					userCkeckPhoneCode : userCkeckPhoneCode,
					RegistMethod : RegistMethod,
					tm : new Date().getTime()
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
					if ("success" == data.result) {
						window.location.href = "<%=baseLocalPath%>register/goSuccess.act";
					} else if ("userError" == data.result) {
						$("#userNameP").tips({
							side : 2,
							msg : "该用户名已经被注册",
							bg : '#AE81FF',
							time : 5
						});
						$("#userNameP").focus();
						$("#codePImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=b");
					} else if ("phoneError" == data.result) {
						$("#userPhone").tips({
							side : 2,
							msg : "该手机号已经被注册",
							bg : '#AE81FF',
							time : 5
						});
						$("#userPhone").focus();
						$("#codePImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=b");
					} else if ("userCodeError" == data.result) {
						$("#userCkeckCodeP").tips({
							side : 3,
							msg : "验证码不一致",
							bg : '#AE81FF',
							time : 5
						});
						$("#userCkeckCodeP").focus();
						$("#codePImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=b");
					} else if ("userPhoneCodeError" == data.result) {
						$("#userCkeckPhoneCode").tips({
							side : 3,
							msg : "短信验证码不一致",
							bg : '#AE81FF',
							time : 5
						});
						$("#userCkeckCodeP").focus();
						$("#codePImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=b");
					}
				}
			});
		}
	}
	
	// 发送短信验证码
	function smsSend(){
		var phonecd = $("#userPhone").val();
		if(phonecd==""){
			$("#userPhone").tips({
				side : 2,
				msg : '请输入手机号',
				bg : '#AE81FF',
				time : 3
			});
			$("#userPhone").focus();
			return false;
		}else{
			$.ajax({
			    type : "POST",
			    url :  '<%=baseLocalPath%>register/sendPhoneMsgCd.act',
				data : {
					phonecd : phonecd,
					tm : new Date().getTime()
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
					if ("success" == data.result) {
						updateButtonStatus();
					} else if ("noPhone" == data.result) {
						$("#userPhone").tips({
							side : 2,
							msg : '该手机号已经被注册',
							bg : '#AE81FF',
							time : 3
						});
						$("#userPhone").focus();
						return false;
					} else if ("nosend" == data.result) {
						$("#userPhone").tips({
							side : 2,
							msg : '短信发送失败',
							bg : '#AE81FF',
							time : 3
						});
						$("#userPhone").focus();
						return false;
					}
				}
			});
		}
	}
	var countdown=60;
	function updateButtonStatus(){
	    var phone = $("#smsS");
	    if (countdown == 0) {
	        phone.attr("disabled","false");
	        phone.attr("onclick","smsSend();");
	        $("a.smssend").hover(function(){
	            $("a.smssend").css("background-color","#e54161");
	            $("a.smssend").css("color","#fff");
	        })
	        document.getElementById("smsS").innerHTML = "发送验证码";
	        countdown = 60;
	        return;
	    } else {
	        phone.attr("disabled","true");
	        phone.removeAttr("onclick");
	        $("a.smssend").hover(function(){
	            $("a.smssend").css("background-color","#b8bdc3");
	            $("a.smssend").css("color","#424c59");
	        })
	        document.getElementById("smsS").innerHTML = "重新发送(" + countdown + ")";
	        countdown--;
	    }
	    setTimeout(function() {updateButtonStatus()},1000)
	}
	
	// 企业注册
	function groupSub() {
		if (groupCheck()) {
			var UserNm = $("#userNm").val();
			var Email = $("#email").val();
			var PassWord = $("#passWordG").val();
			var GroupName = $.trim($("#groupName").val());
			var Ocode = $("#ocode").val();
			var License = $("#license").val();
			var inId = $("#inId").val();
			var Industry = $("#Industry").val();
			var Province = $("#province").val();
			var City = $("#city").val();
			var auditOrgan = $("#auditOrgan").val();
			if(auditOrgan == "---商务局---"){
				auditOrgan = -1;
			}
			var Address = $.trim($("#address").val());
			var Contact = $.trim($("#contact").val());
			var Phone = $("#phone").val();
			var qq = $("#qq").val();
			var CkeckCode = $("#ckeckCode").val();
			var RegistMethod = document.getElementById("groupMethod").innerHTML;
			$.ajax({
				type : "POST",
				url : '<%=baseLocalPath%>register/teamRegister.act',
				data : {
					UserNm : UserNm,
					Email : Email,
					PassWord : PassWord,
					GroupName : GroupName,
					Ocode : Ocode,
					License : License,
					inId : inId,
					Industry : Industry,
					Province : Province,
					City : City,
					auditOrgan : auditOrgan,
					Address : Address,
					Contact : Contact,
					Phone : Phone,
					qq : qq,
					CkeckCode : CkeckCode,
					RegistMethod : RegistMethod,
					tm : new Date().getTime()
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
					if ("success" == data.result) {
						window.location.href = "<%=baseLocalPath%>register/goSuccess.act";
					} else if ("userError" == data.result) {
						$("#userNm").tips({
							side : 2,
							msg : "该用户名已经被注册",
							bg : '#AE81FF',
							time : 5
						});
						$("#userNm").focus();
						$("#cCodeImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=c");
					} else if ("emailError" == data.result) {
						$("#email").tips({
							side : 2,
							msg : "该邮箱已经被注册",
							bg : '#AE81FF',
							time : 5
						});
						$("#email").focus();
						$("#cCodeImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=c");
					} else if ("nameError" == data.result) {
						$("#groupName").tips({
							side : 2,
							msg : "该企业已经被注册",
							bg : '#AE81FF',
							time : 5
						});
						$("#groupName").focus();
						$("#cCodeImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=c");
					} else if ("phoneError" == data.result) {
						$("#phone").tips({
							side : 2,
							msg : "该电话已经被注册",
							bg : '#AE81FF',
							time : 5
						});
						$("#phone").focus();
						$("#cCodeImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=c");
					} else if ("userCodeError" == data.result) {
						$("#ckeckCode").tips({
							side : 3,
							msg : "验证码不一致",
							bg : '#AE81FF',
							time : 5
						});
						$("#ckeckCode").focus();
						$("#cCodeImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=c");
					}
				}
			});
		}
	}
	
	// 培训机构注册
	function institutionSub() {
		if (institutionCheck()) {
			var UserNm = $("#userNmI").val();
			var Email = $("#emailI").val();
			var PassWord = $("#passWordI").val();
			var InstitutionName = $.trim($("#groupNameI").val());
			var Ocode = $("#ocodeI").val();
			var License = $("#licenseI").val();
			var Province = $("#provinceI").val();
			var City = $("#cityI").val();
			var auditOrgan = $("#auditOrganI").val();
			if(auditOrgan == "---商务局---"){
				auditOrgan = -1;
			}
			var Address = $.trim($("#addressI").val());
			var Contact = $.trim($("#contactI").val());
			var Phone = $("#phoneI").val();
			var qq = $("#qqI").val();
			var CkeckCode = $("#ckeckCodeI").val();
			var RegistMethod = document.getElementById("groupMethodI").innerHTML;
			$.ajax({
				type : "POST",
				url : '<%=baseLocalPath%>register/teamRegister.act',
				data : {
					UserNm : UserNm,
					Email : Email,
					PassWord : PassWord,
					GroupName : InstitutionName,
					Ocode : Ocode,
					License : License,
					Province : Province,
					City : City,
					auditOrgan : auditOrgan,
					Address : Address,
					Contact : Contact,
					Phone : Phone,
					qq : qq,
					CkeckCode : CkeckCode,
					RegistMethod : RegistMethod,
					tm : new Date().getTime()
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
					if ("success" == data.result) {
						window.location.href = "<%=baseLocalPath%>register/goSuccess.act";
					} else if ("userError" == data.result) {
						$("#userNmI").tips({
							side : 2,
							msg : "该用户名已经被注册",
							bg : '#AE81FF',
							time : 5
						});
						$("#userNmI").focus();
						$("#cCodeIImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=d");
					} else if ("emailError" == data.result) {
						$("#emailI").tips({
							side : 2,
							msg : "该邮箱已经被注册",
							bg : '#AE81FF',
							time : 5
						});
						$("#emailI").focus();
						$("#cCodeIImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=d");
					} else if ("nameError" == data.result) {
						$("#groupNameI").tips({
							side : 2,
							msg : "该培训机构已经被注册",
							bg : '#AE81FF',
							time : 5
						});
						$("#groupNameI").focus();
						$("#cCodeIImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=d");
					} else if ("phoneError" == data.result) {
						$("#phoneI").tips({
							side : 2,
							msg : "该电话已经被注册",
							bg : '#AE81FF',
							time : 5
						});
						$("#phoneI").focus();
						$("#cCodeIImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=d");
					} else if ("userCodeError" == data.result) {
						$("#ckeckCodeI").tips({
							side : 3,
							msg : "验证码不一致",
							bg : '#AE81FF',
							time : 5
						});
						$("#ckeckCodeI").focus();
						$("#cCodeIImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=d");
					}
				}
			});
		}
	}
	
	// 院校注册
	function academySub() {
		if (academyCheck()) {
			var UserNm = $("#userNmS").val();
			var Email = $("#emailS").val();
			var PassWord = $("#passWordS").val();
			var AcademyName = $.trim($("#groupNameS").val());
			var Ocode = $("#ocodeS").val();
			var License = $("#licenseS").val();
			var Province = $("#provinceS").val();
			var City = $("#cityS").val();
			var auditOrgan = $("#auditOrganS").val();
			if(auditOrgan == "---商务局---"){
				auditOrgan = -1;
			}
			var Address = $.trim($("#addressS").val());
			var Contact = $.trim($("#contactS").val());
			var Phone = $("#phoneS").val();
			var CkeckCode = $("#ckeckCodeS").val();
			var RegistMethod = document.getElementById("groupMethodS").innerHTML;
			$.ajax({
				type : "POST",
				url : '<%=baseLocalPath%>register/teamRegister.act',
					data : {
						UserNm : UserNm,
						Email : Email,
						PassWord : PassWord,
						AcademyName : AcademyName,
						Ocode : Ocode,
						License : License,
						Province : Province,
						City : City,
						auditOrgan : auditOrgan,
						Address : Address,
						Contact : Contact,
						Phone : Phone,
						CkeckCode : CkeckCode,
						RegistMethod : RegistMethod,
						tm : new Date().getTime()
					},
					dataType : 'json',
					cache : false,
					success : function(data) {
						if ("success" == data.result) {
							window.location.href = "<%=baseLocalPath%>register/goSuccess.act";
						} else if ("userError" == data.result) {
							$("#userNmS").tips({
								side : 2,
								msg : "该用户名已经被注册",
								bg : '#AE81FF',
								time : 5
							});
							$("#userNmS").focus();
							$("#cCodeSImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=e");
						} else if ("emailError" == data.result) {
							$("#emailS").tips({
								side : 2,
								msg : "该邮箱已经被注册",
								bg : '#AE81FF',
								time : 5
							});
							$("#emailS").focus();
							$("#cCodeSImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=e");
						} else if ("nameError" == data.result) {
							$("#groupNameS").tips({
								side : 2,
								msg : "该院校已经被注册",
								bg : '#AE81FF',
								time : 5
							});
							$("#groupNameS").focus();
							$("#cCodeSImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=e");
						} else if ("phoneError" == data.result) {
							$("#phoneS").tips({
								side : 2,
								msg : "该电话已经被注册",
								bg : '#AE81FF',
								time : 5
							});
							$("#phoneS").focus();
							$("#cCodeSImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=e");
						} else if ("userCodeError" == data.result) {
							$("#ckeckCodeS").tips({
								side : 3,
								msg : "验证码不一致",
								bg : '#AE81FF',
								time : 5
							});
							$("#ckeckCodeS").focus();
							$("#cCodeSImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=e");
						}
					}
				});
			}
		}
	
	// 其他用户注册
	function resourcesSub() {
		if (resourcesCheck()) {
			var UserNm = $("#userNmP").val();
			var Email = $("#emailP").val();
			var PassWord = $("#passWordP").val();
			var GroupName = $.trim($("#groupNameP").val());
			var Ocode = $("#ocodeP").val();
			var License = $("#licenseP").val();
			var inId = $("#inIdP").val();
			var Industry = $("#IndustryP").val();
			var Province = $("#provinceP").val();
			if(Province == "---省---"){
				Province = -1;
			}
			var City = $("#cityP").val();
			if(City == "---市---"){
				City = -1;
			}
			var auditOrgan = $("#auditOrganP").val();
			if(auditOrgan == "---商务局---"){
				auditOrgan = -1;
			}
			var Address = $.trim($("#addressP").val());
			var Contact = $.trim($("#contactP").val());
			var Phone = $("#phoneP").val();
			var qq = $("#qqP").val();
			var CkeckCode = $("#ckeckCodeP").val();
			var RegistMethod = document.getElementById("groupMethodP").innerHTML;
			$.ajax({
				type : "POST",
				url : '<%=baseLocalPath%>register/teamRegister.act',
				data : {
					UserNm : UserNm,
					Email : Email,
					PassWord : PassWord,
					GroupName : GroupName,
					Ocode : Ocode,
					License : License,
					inId : inId,
					Industry : Industry,
					Province : Province,
					City : City,
					auditOrgan : auditOrgan,
					Address : Address,
					Contact : Contact,
					Phone : Phone,
					qq : qq,
					CkeckCode : CkeckCode,
					RegistMethod : RegistMethod,
					tm : new Date().getTime()
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
					if ("success" == data.result) {
						window.location.href = "<%=baseLocalPath%>register/goSuccess.act";
					} else if ("userError" == data.result) {
						$("#userNmP").tips({
							side : 2,
							msg : "该用户名已经被注册",
							bg : '#AE81FF',
							time : 5
						});
						$("#userNmP").focus();
						$("#cCodePImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=f");
					} else if ("emailError" == data.result) {
						$("#emailP").tips({
							side : 2,
							msg : "该邮箱已经被注册",
							bg : '#AE81FF',
							time : 5
						});
						$("#emailP").focus();
						$("#cCodePImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=f");
					} else if ("nameError" == data.result) {
						$("#groupNameP").tips({
							side : 2,
							msg : "该用户已经被注册过",
							bg : '#AE81FF',
							time : 5
						});
						$("#groupNameP").focus();
						$("#cCodePImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=f");
					} else if ("phoneError" == data.result) {
						$("#phoneP").tips({
							side : 2,
							msg : "该电话已经被注册",
							bg : '#AE81FF',
							time : 5
						});
						$("#phoneP").focus();
						$("#cCodePImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=f");
					} else if ("userCodeError" == data.result) {
						$("#ckeckCodeP").tips({
							side : 3,
							msg : "验证码不一致",
							bg : '#AE81FF',
							time : 5
						});
						$("#ckeckCodeP").focus();
						$("#cCodePImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=f");
					}
				}
			});
		}
	}
	
	//院校自动输入
    $("#groupNameS").autocomplete({
        source: function( request, response ) {
            $.ajax({
                url: '<%=baseLocalPath%>register/getschool.act', // 后台请求路径
                dataType: "json",
                data:{
                    "inputStr": request.term    // 获取输入框内容
                },
                type:"POST",
                contentType:"application/x-www-form-urlencoded; charset=utf-8",
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
        	$("#groupNameS").val(ui.item.label);
        	$("#school_id").val(ui.item.schoolId);
          }
    });
</script>
</html>