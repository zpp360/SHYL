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
<title>找回密码2_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<script src="shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script type="text/javascript" src="shyl/js/jquery-1.7.1.js"></script>
<jsp:include page="../../common/header.jsp"></jsp:include>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery-ui.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/jquery.placeholderReg.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script>
$(function(){
	var flag = $("#flag").val();
	if(flag=="1"){
		$("#phoneMethod").removeClass("hover");
		$("#emailMethod").addClass("hover");
		$("#reg_gr_email").show();
		$("#reg_gr_mobile").hide();
		$('#reg_gr_email')[0].reset();
		$('#reg_gr_mobile')[0].reset();
	} else {
		$("#emailMethod").removeClass("hover");
		$("#phoneMethod").addClass("hover");
		$("#reg_gr_email").hide();
		$("#reg_gr_mobile").show();
		$('#reg_gr_email')[0].reset();
		$('#reg_gr_mobile')[0].reset();
	}
	$(".register-c-1 a").click(function(){
		var param=$(this).attr("param");
		$(".register-c-1 a").removeClass("hover");
		$(this).addClass("hover");
		if(param=="1"){
			$("#reg_gr_email").show();
			$("#reg_gr_mobile").hide();
			$('#reg_gr_email')[0].reset();
			$('#reg_gr_mobile')[0].reset();
			window.location.href = "<%=basePath%>findPwd/goFindPwd.act?flag=1";
		} else {
			$("#reg_gr_email").hide();
			$("#reg_gr_mobile").show();
			$('#reg_gr_email')[0].reset();
			$('#reg_gr_mobile')[0].reset();
			window.location.href = "<%=basePath%>findPwd/goFindPwd.act?flag=2";
		}
	});
})
</script>
</head>
<body style="background-color: #f7f7f7;">
    <input type="hidden" id="phone" value="${pd.phone}"/>
    <input type="hidden" id="flag" value="${pd.flag}"/>
    <div class="register-box">
		<div class="rticon"></div>
		<div class="lbicon"></div>
		<div class="register-c">
			<div class="register-c-1">
				<a href="javascript:;" id="emailMethod" param="1" class="hover">邮箱找回</a>
				<a href="javascript:;" id="phoneMethod" param="2" class="">手机找回</a>
			</div>
			<div id="reg_gr" class="register-c-2">
			    <form id="reg_gr_email">
				    <ul>
						<li><img src="<%=basePath%>shyl/images/step02.jpg"></li>
						<li style="text-align: center;">密码重置邮件已发送到您的邮箱，请查收，并在下方填写您收到的验证码。</li>
						<li><label>邮箱验证码：<i>*</i></label><input maxlength="50" type="text" name="EmailCode" id="EmailCode" class="inputtxt duan" style="width: 20%;" placeholder="请输入邮箱验证码" onBlur="trim(this);emailCode();"></li>
						<input type="button" class="submit" style="width: 10%; cursor: pointer;" onclick="nextSub();" value="下一步"/>
					</ul>
			    </form>
			    <form id="reg_gr_mobile" style="display: none;">
				    <ul>
						<li><img src="<%=basePath%>shyl/images/step02.jpg"></li>
						<li style="text-align: center;">密码重置短信已发送到您的手机，请查收，并在下方填写您收到的验证码。</li>
						<li><label>短信验证码：<i>*</i></label><input maxlength="50" type="text" name="PhoneCode" id="PhoneCode" class="inputtxt duan" style="width: 20%;" placeholder="请输入短信验证码" onBlur="trim(this);phoneCode();"><a href="javascript:;" id="smsS" class="smssend" onclick="smsSend();">发送验证码</a></li>
						<input type="button" class="submit" style="width: 10%; cursor: pointer;" onclick="nextPSub();" value="下一步"/>
					</ul>
			    </form>
			</div>
		</div>
	</div>
	
	<%@ include file="../../common/footer.jsp"%>
</body>

<script type="text/javascript" src="shyl/js/jquery.tips.js"></script>
<script type="text/javascript">
    function nextSub() {
	    if (check()) {
		    var EmailCode = $("#EmailCode").val();
		    $.ajax({
			    type : "POST",
			    url :  '<%=basePath%>findPwd/findPwdStep2.act',
				data : {
					EmailCode : EmailCode,
					tm : new Date().getTime()
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
				if ("success" == data.result) {
					window.location.href = "<%=basePath%>findPwd/goFindPwdStep3.act?flag=1";
				} else if ("userCodeError" == data.result) {
					$("#EmailCode").tips({
						side : 2,
						msg : "输入的验证码和邮箱验证码不一致",
						bg : '#AE81FF',
						time : 5
					});
					$("#EmailCode").focus();
					return false;
				}
			}
			});
		}
	}

	function check() {
		//邮箱验证码验证
		if ($("#EmailCode").val() == "") {
			$("#EmailCode").tips({
				side : 2,
				msg : '请输入邮箱验证码',
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
		return true;
	}
	
	function nextPSub() {
	    if (checkP()) {
		    var PhoneCode = $("#PhoneCode").val();
		    $.ajax({
			    type : "POST",
			    url :  '<%=basePath%>findPwd/findPwdStepSms.act',
				data : {
					PhoneCode : PhoneCode,
					tm : new Date().getTime()
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
					if ("success" == data.result) {
						window.location.href = "<%=basePath%>findPwd/goFindPwdStep3.act?flag=2";
					} else if ("userCodeError" == data.result) {
						$("#PhoneCode").tips({
							side : 2,
							msg : "输入的验证码和短信验证码不一致",
							bg : '#AE81FF',
							time : 5
						});
						$("#PhoneCode").focus();
						return false;
					}
				}
			});
		}
	}

	function checkP() {
		//短信验证码验证
		if ($("#PhoneCode").val() == "") {
			$("#PhoneCode").tips({
				side : 2,
				msg : '请输入短信验证码',
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
		return true;
	}
	
	function smsSend(){
		var phonecd = $("#phone").val();
		$.ajax({
		    type : "POST",
		    url :  '<%=basePath%>findPwd/sendPhoneMsgCd.act',
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
					$("#PhoneCode").tips({
						side : 2,
						msg : '手机号输入错误，请重新输入或使用邮箱找回！',
						bg : '#AE81FF',
						time : 3
					});
					$("#PhoneCode").focus();
					return false;
				} else if ("phoneError" == data.result) {
					$("#PhoneCode").tips({
						side : 2,
						msg : '短信发送失败',
						bg : '#AE81FF',
						time : 3
					});
					$("#PhoneCode").focus();
					return false;
				}
			}
		});
	}
	
	var countdown=60;
	function updateButtonStatus(){
	    var phone = $("#smsS");
	    if (countdown == 0) {
	        phone.attr("disabled","false");
	        document.getElementById("smsS").innerHTML = "发送验证码";
	        countdown = 60;
	        return;
	    } else {
	        phone.attr("disabled","true");
	        document.getElementById("smsS").innerHTML = "重新发送(" + countdown + ")";
	        countdown--;
	    }
	    setTimeout(function() {updateButtonStatus()},1000)
	}
	
	function emailCode() {
		//邮箱验证码验证
		if ($("#EmailCode").val() == "") {
			$("#EmailCode").tips({
				side : 2,
				msg : '请输入邮箱验证码',
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
	}
	
	function phoneCode() {
		//短信验证码验证
		if ($("#PhoneCode").val() == "") {
			$("#PhoneCode").tips({
				side : 2,
				msg : '请输入短信验证码',
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
	}
</script>

</html>