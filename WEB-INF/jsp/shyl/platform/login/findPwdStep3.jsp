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
<title>找回密码3_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<script src="shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script type="text/javascript" src="shyl/js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="shyl/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<jsp:include page="../../common/header.jsp"></jsp:include>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery-ui.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/jquery.placeholderReg.js"></script>

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
	var flag = $("#flag").val();
	if(flag=="1"){
		$("#phoneMethod").removeClass("hover");
		$("#emailMethod").addClass("hover");
	} else {
		$("#emailMethod").removeClass("hover");
		$("#phoneMethod").addClass("hover");
	}
	$(".register-c-1 a").click(function(){
		var param=$(this).attr("param");
		$(".register-c-1 a").removeClass("hover");
		$(this).addClass("hover");
		if(param=="1"){
			$('#reg_gr_email')[0].reset();
			window.location.href = "<%=basePath%>findPwd/goFindPwd.act?flag=1";
		} else {
			$('#reg_gr_email')[0].reset();
			window.location.href = "<%=basePath%>findPwd/goFindPwd.act?flag=2";
		}
	});
	
	$('#NewPwd').keyup(function () { 
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
						<li><img src="<%=basePath%>shyl/images/step03.jpg"></li>
						<li><label>新密码：<i>*</i></label><input type="password" name="NewPwd" id="NewPwd" class="inputtxt" style="width: 30%;" maxlength="20" placeholder="请输入新密码" onBlur="newPwd();"></li>
						<li id="level" class="pw-strength" style="margin-left: 230px;">
							<div class="pw-bar"></div>
							<div class="pw-bar-on"></div>
							<div class="pw-txt">
								<span>弱</span>
								<span>中</span>
								<span>强</span>
							</div>
						</li>
						<li><label>确认密码：<i>*</i></label><input type="password" name="CNewPwd" id="CNewPwd" class="inputtxt" style="width: 30%;" maxlength="20" placeholder="请输入确认密码" onBlur="cNewPwd();"></li>
						<input type="button" class="submit" style="width: 10%; cursor: pointer;" onclick="nextSub();" value="提交">
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
		    var NewPwd = $("#NewPwd").val();
		    $.ajax({
			    type : "POST",
			    url :  '<%=basePath%>findPwd/findPwdStep3.act',
				data : {
					NewPwd : NewPwd,
					tm : new Date().getTime()
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
				if ("success" == data.result) {
					window.location.href = "<%=basePath%>findPwd/goSuccess.act";
				} else if ("userError" == data.result) {
					$("#NewPwd").tips({
						side : 2,
						msg : "新密码不能和原密码一致",
						bg : '#FF5080',
						time : 5
					});
					$("#NewPwd").focus();
				}
			}
			});
		}
	}

	function check() {
		// 新密码验证
		var NewPwd = $("#NewPwd").val();
		var NewPwdFilter = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,16}$/;
		if (NewPwd == "") {
			$("#NewPwd").tips({
				side : 2,
				msg : '请输入新密码',
				bg : '#AE81FF',
				time : 3
			});
			$("#NewPwd").focus();
			return false;
		} else if (NewPwd.length < 6) {
			$("#NewPwd").tips({
				side : 2,
				msg : '新密码至少包含6个字符',
				bg : '#AE81FF',
				time : 3
			});
			$("#NewPwd").focus();
			return false;
		}
		if (!(NewPwdFilter.test(NewPwd))) {
			$("#NewPwd").tips({
				side : 2,
				msg : '密码应是字母、数字、特殊符号中的两种及以上的组合。',
				bg : '#AE81FF',
				time : 3
			});
			$("#NewPwd").focus();
			return false;
		}
		// 确认密码验证
		var CNewPwd = $("#CNewPwd").val();
		if (CNewPwd == "") {
			$("#CNewPwd").tips({
				side : 2,
				msg : '请输入确认密码',
				bg : '#AE81FF',
				time : 3
			});
			$("#CNewPwd").focus();
			return false;
		} else if (!(NewPwdFilter.test(CNewPwd))) {
			$("#CNewPwd").tips({
				side : 2,
				msg : '密码应是字母、数字、特殊符号中的两种及以上的组合。',
				bg : '#AE81FF',
				time : 3
			});
			$("#CNewPwd").focus();
			return false;
		}
		if (CNewPwd != NewPwd) {
			$("#CNewPwd").tips({
				side : 2,
				msg : '确认密码和新密码不一致',
				bg : '#AE81FF',
				time : 3
			});
			$("#CNewPwd").focus();
			return false;
		}
		return true;
	}
	
	function newPwd() {
		// 新密码验证
		var NewPwd = $("#NewPwd").val();
		var NewPwdFilter = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,16}$/;
		if (NewPwd == "") {
			$("#NewPwd").tips({
				side : 2,
				msg : '请输入新密码',
				bg : '#AE81FF',
				time : 3
			});
			return false;
		} else if (NewPwd.length < 6) {
			$("#NewPwd").tips({
				side : 2,
				msg : '新密码至少包含6个字符',
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
		if (!(NewPwdFilter.test(NewPwd))) {
			$("#NewPwd").tips({
				side : 2,
				msg : '密码应是字母、数字、特殊符号中的两种及以上的组合。',
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
	}
	
	function cNewPwd() {
		// 确认密码验证
		var NewPwd = $("#NewPwd").val();
		var CNewPwdFilter = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,16}$/;
		var CNewPwd = $("#CNewPwd").val();
		if (CNewPwd == "") {
			$("#CNewPwd").tips({
				side : 2,
				msg : '请输入确认密码',
				bg : '#AE81FF',
				time : 3
			});
			return false;
		} else if (!(CNewPwdFilter.test(CNewPwd))) {
			$("#CNewPwd").tips({
				side : 2,
				msg : '密码应是字母、数字、特殊符号中的两种及以上的组合。',
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
		if (CNewPwd != NewPwd) {
			$("#CNewPwd").tips({
				side : 2,
				msg : '确认密码和新密码不一致',
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
	}
</script>

</html>