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
<title>找回密码1_济南市服务外包公共服务平台</title>
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
		} else {
			$("#reg_gr_email").hide();
			$("#reg_gr_mobile").show();
			$('#reg_gr_email')[0].reset();
			$('#reg_gr_mobile')[0].reset();
		}
	});
})
</script>
</head>
<body style="background-color: #f7f7f7;">
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
						<li><img src="<%=basePath%>shyl/images/step01.jpg"></li>
						<li><label>用户邮箱：<i>*</i></label><input onblur="trim(this);" type="text" name="Receiver" id="Receiver" class="inputtxt" style="width: 30%;" maxlength="50" placeholder="请输入注册时填写的邮箱"></li>
						<li><label>验证码：<i>*</i></label><input onblur="trim(this);" type="text" name="CheckCode" id="CheckCode" class="inputtxt duan" style="width: 20%;" maxlength="50" placeholder="请输入验证码"><img id="codeImg" style="width:80px; height:38px;padding: 3px 0px 0px 0px;" src="<%=basePath%>shyl/images/yzm.jpg"></li>
						<input type="button" class="submit" style="width: 10%; cursor: pointer;" onclick="nextSub();" value="下一步">
					</ul>
			    </form>
			    <form id="reg_gr_mobile" style="display: none;">
				    <ul>
						<li><img src="<%=basePath%>shyl/images/step01.jpg"></li>
						<li><label>用户手机号：<i>*</i></label><input type="text" maxlength="20" name="phone" id="phone" class="inputtxt" style="width: 30%;" placeholder="请输入注册时填写的手机号" onkeyup="value=value.replace(/[^0-9]/g,'')" style="ime-mode:disabled" maxlength="11"></li>
						<li><label>验证码：<i>*</i></label><input onblur="trim(this);" maxlength="50" type="text" name="CheckCodeP" id="CheckCodeP" class="inputtxt duan" style="width: 20%;" placeholder="请输入验证码"><img id="codePImg" style="width:80px; height:38px;padding: 3px 0px 0px 0px;" src="<%=basePath%>shyl/images/yzm.jpg"></li>
						<input type="button" class="submit" style="width: 10%; cursor: pointer;" onclick="nextPSub();" value="下一步">
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
	    	var Receiver = $("#Receiver").val();
		    var CkeckCode = $("#CheckCode").val();
		    var Method = document.getElementById("emailMethod").innerHTML;
		    $.ajax({
			    type : "POST",
			    url :  '<%=basePath%>findPwd/findPwdStep1.act',
				data : {
					Receiver : Receiver,
					CkeckCode : CkeckCode,
					Method : Method,
					tm : new Date().getTime()
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
					if ("success" == data.result) {
						sendEmail();
					} else if ("false" == data.result) {
						$("#Receiver").tips({
							side : 2,
							msg : "邮箱输入错误，请输入注册时的邮箱！",
							bg : '#AE81FF',
							time : 3
						});
						$("#Receiver").focus();
						$("#codeImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=m");
					} else if ("userCodeError" == data.result) {
						$("#CheckCode").tips({
							side : 3,
							msg : "验证码不一致",
							bg : '#AE81FF',
							time : 3
						});
						$("#CheckCode").focus();
						$("#codeImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=m");
					}
				}
			});
		}
	}

	function check() {
		// 邮箱验证
		var Receiver = $("#Receiver").val();
		var ReceiverFilter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		if (Receiver == "") {
			$("#Receiver").tips({
				side : 2,
				msg : '请输入邮箱',
				bg : '#AE81FF',
				time : 3
			});
			$("#Receiver").focus();
			return false;
		} else if (!(ReceiverFilter.test(Receiver))) {
			$("#Receiver").tips({
				side : 2,
				msg : '请输入正确的邮箱格式',
				bg : '#AE81FF',
				time : 3
			});
			$("#Receiver").focus();
			return false;
		}
		//图片验证码验证
		if ($("#CheckCode").val() == "") {
			$("#CheckCode").tips({
				side : 2,
				msg : '请输入图片验证码',
				bg : '#AE81FF',
				time : 3
			});
			$("#CheckCode").focus();
			return false;
		}
		return true;
	}
	
	function nextPSub() {
	    if (checkP()) {
	    	/* alert("待开发"); */
	    	var phoneno = $("#phone").val();
		    var CheckCodePno = $("#CheckCodeP").val();
		    var Method = document.getElementById("phoneMethod").innerHTML;
		    $.ajax({
			    type : "POST",
			    url :  '<%=basePath%>findPwd/findPwdStep1.act',
				data : {
					phoneno : phoneno,
					CheckCodePno : CheckCodePno,
					Method : Method,
					tm : new Date().getTime()
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
					if ("success" == data.result) {
						sendSmsMsg();
					} else if ("false" == data.result) {
						$("#phone").tips({
							side : 2,
							msg : "手机号输入错误，请输入注册时的手机号！",
							bg : '#AE81FF',
							time : 3
						});
						$("#phone").focus();
						$("#codePImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=n");
					} else if ("userCodeError" == data.result) {
						$("#CheckCodeP").tips({
							side : 3,
							msg : "验证码不一致",
							bg : '#AE81FF',
							time : 3
						});
						$("#CheckCodeP").focus();
						$("#codePImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=n");
					}
				}
		    });
		}
	}
	
	function checkP() {
		// 手机号验证
		var phone = $("#phone").val();
		var phoneFilter = /^1[3|4|5|8][0-9]\d{4,8}$/;
		if (phone == "") {
			$("#phone").tips({
				side : 2,
				msg : '请输入手机号',
				bg : '#AE81FF',
				time : 3
			});
			$("#phone").focus();
			return false;
		} else if (!(phoneFilter.test(phone))) {
			$("#phone").tips({
				side : 2,
				msg : '请输入正确的手机号格式',
				bg : '#AE81FF',
				time : 3
			});
			$("#phone").focus();
			return false;
		}
		
		//图片验证码验证
		if ($("#CheckCodeP").val() == "") {
			$("#CheckCodeP").tips({
				side : 2,
				msg : '请输入图片验证码',
				bg : '#AE81FF',
				time : 3
			});
			$("#CheckCodeP").focus();
			return false;
		}
		return true;
	}

	function sendEmail(){
		var Email = $("#Receiver").val();
		$.ajax({
		    type : "POST",
		    url :  '<%=basePath%>findPwd/sendmail.act',
			data : {
				Email : Email,
				tm : new Date().getTime()
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				if ("success" == data.result) {
					window.location.href = "<%=basePath%>findPwd/goFindPwdStep2.act?flag=1";
				} else if ("noemail" == data.result) {
					$("#Receiver").tips({
						side : 2,
						msg : '邮箱输入错误，请输入注册时的邮箱！',
						bg : '#AE81FF',
						time : 3
					});
					$("#Receiver").focus();
					return false;
				} else if ("emailError" == data.result) {
					$("#Receiver").tips({
						side : 2,
						msg : '邮件发送失败',
						bg : '#AE81FF',
						time : 3
					});
					$("#Receiver").focus();
					return false;
				}
			}
		});
	}
	
	function sendSmsMsg(){
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
					window.location.href = "<%=basePath%>findPwd/goFindPwdStep2.act?phone="+phonecd+"&flag=2";
				} else if ("noPhone" == data.result) {
					$("#phone").tips({
						side : 2,
						msg : '手机号输入错误，请重新输入或使用邮箱找回！',
						bg : '#AE81FF',
						time : 3
					});
					$("#phone").focus();
					return false;
				} else if ("phoneError" == data.result) {
					$("#phone").tips({
						side : 2,
						msg : '短信发送失败',
						bg : '#AE81FF',
						time : 3
					});
					$("#phone").focus();
					return false;
				}
			}
		});
	}
	
	$(document).ready(function() {
		changeCode();
		$("#codeImg").bind("click", changeCode);
		$("#codePImg").bind("click", changeCode);
	});

	function genTimestamp() {
		var time = new Date();
		return time.getTime();
	}

	function changeCode() {
		$("#codeImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=m");
		$("#codePImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=n");
	}
</script>

</html>