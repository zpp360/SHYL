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
<title>用户登录_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link href="shyl/css/maincss/css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="shyl/js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="shyl/js/jquery-1.7.2.js"></script>
<script src="<%=baseLocalPath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
</head>
<style>
.yin{
	box-shadow:0 5px 5px #e9e8e8; /*底边阴影*/
	height:2px;
	margin-top:-2px;
	width:100%;
}
.deng{
	width:1168px;
	min-height:740px;
	background: #fff url(shyl/images/login.jpg) no-repeat left top;
	background-size: 100%;
	box-shadow:0 0 30px #e7e7e7;
	border: 1px solid #edf1fc;
	margin: 0 auto;
}
.p img{
	float:left;
	margin-top:45px;}
.denglu{
	width:40%;
	float:right;background-color: #fff;
	box-shadow:0 0 10px #dbdbdb; /*底边阴影*/
    border: 1px solid #e9e8e8;
	margin-top:30px;
	margin-right:30px;
	padding-bottom: 30px;}
.huan span{
	font-family:"微软雅黑";
	font-size:18px;
	float:left;
	color:#4b4b4b;
	margin-top:51px;
	margin-left:47px;}
.huan p{
	color:#9b9999;
	font-size:12px;
	margin-top:50px;
	margin-left:16px;
	float:left;}
.yonghu span{
	margin-top:30px;
	float:left;
	font-size:14px;
	color:#9b9999;
	margin-left:47px;
	font-weight:700;}
.yonghu1 span{
	margin-top:22px;
	float:left;
	font-size:14px;
	color:#9b9999;
	margin-left:47px;
	font-weight:700;}
#skeywords{
	width:80%;
	padding-left: 10px;
	height:50px;
	line-height: 50px;
	border:1px solid #c6d1eb;
	border-radius:4px;
	margin-top:12px;
	margin-left:47px;}
#skeywords:hover{
	border:1px solid #4671d6;}
#skeywordsP{
	width:80%;
	padding-left: 10px;
	height:50px;
	line-height: 50px;
	border:1px solid #c6d1eb;
	border-radius:4px;
	margin-top:12px;
	margin-left:47px;}
#skeywordsP:hover{
	border:1px solid #4671d6;}
#sdxr{
	width:18px;
	height:18px;
	float:left;
	background:#fff;
	margin-left:47px;
	margin-top:20px;}
.waq{
	font-size:14px;
	color:#9b9999;
	float:left;
	margin-left:6px;
	margin-top:18px;}
.wangji a{
	font-size:14px;
	color:#9b9999;
	float:right;
	margin-right:34px;
	margin-top:18px;
	}
.wangji span{
	border-bottom:1px solid #9b9999;
	height:20px;}
.an a{
	width:80%;
	height:50px;
	background:#4671d6;
	font-size:14px;
	color:#fff;
	display:block;
	text-align:center;
	line-height:50px;
	float:left;
	border-radius:4px;
	margin-left:47px;
	margin-top:35px;
	cursor:pointer;}
.an a:hover{
	color:#ffffff;}
.hai{
	font-size:14px;
	color:#9b9999;
	float:right;
	margin-right:34px;
	margin-top:25px;}
.hai a{
	font-size:14px;
	color:#9b9999;
	}
.footer1{
	height:60px;
	background:#ededed;
	margin-top:96px;}
</style>
<body style="background-color: #f7f7f7;">
    <jsp:include page="../../common/header.jsp"></jsp:include>
    <br /><br /><br /><br /><br />
	<div class="deng">
		<div class="denglu">
			<div class="huan"><span>欢迎登录</span><p>济南市服务外包公共服务平台</p></div>
			<div class="clear"></div>
			<input type="hidden" id="returnUrl" value="${pd.returnUrl}"/>
			<div class="yonghu"><span>用户名</span>
				<div class="clear"></div>
				<input value="" type="text" id="skeywords" name="skeywords" autocomplete="off" disableautocomplete="" class="form-control" type="form-control" onFocus="userNameFocus();" onBlur="trim(this);userNameBlur();" title="关键字必须至少有一个汉字或英文字母" maxlength="30" style="color: #4671d6;">
			</div>
			<div class="yonghu1"><span>密码</span>
				<div class="clear"></div>
				<input value="" type="password" id="skeywordsP" name="skeywordsP" autocomplete="off" disableautocomplete="" class="form-control" type="form-control" onFocus="pwdFocus();" onBlur="pwdBlur();" title="关键字必须至少有一个汉字或英文字母" maxlength="20" style="color: #4671d6;">
			</div>
			<label><input type="checkbox" id="sdxr" onclick="savePaw();"><p class="waq">记住密码</p></label>
			<div class="wangji">
				<a href="<%=baseLocalPath%>findPwd/goFindPwd.act?flag=1"><span>忘记密码</span>？</a>
			</div>
		
			<div class="an" id="to-recover" onclick="severCheck();"><a>登 录</a></div>
			<div class="clear"></div>
			<div class="hai"><span>还没有用户名？<a href="<%=baseLocalPath%>register/main.act">立即注册</a></span></div>
		</div>
	</div>
 <!--<footer开始>-->
<jsp:include page="../../common/footer.jsp"></jsp:include>
    <!--</footer结束>-->
</body>

<script type="text/javascript" src="shyl/js/jquery.tips.js"></script>
<script type="text/javascript" src="shyl/js/jquery.cookie.js"></script>

<script type="text/javascript">
	//服务器校验
	function severCheck() {
		if (check()) {
			var UserName = $("#skeywords").val();
			var PassWord = $("#skeywordsP").val();
			var code = "qq313596790fh" + UserName + ",fh," + PassWord;
			var url=$("#returnUrl").val();
			
			$.ajax({
				type : "POST",
				url : '<%=baseLocalPath%>userLogin/userLogin.act',
				data : {
					KEYDATA : code,
					returnUrl:url,
					tm : new Date().getTime()
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
					var url=data.url;
					if ("success" == data.result) {
					    saveCookie();
					    if(!(url.length<=0||""==url||null==url)){
					    	window.location.href="<%=baseLocalPath%>"+url;	
					    }else{
					    	//--2017-2-28zhangbin updateS 
					    	console.info(data);
							if (data.userType == "1") {
								window.location.href="<%=baseLocalPath%>myresume/list.act";
							} else if (data.userType == "2") {
								window.location.href="<%=baseLocalPath%>company/toCompanyUpdate.act";
							} else if (data.userType == "3") {
								window.location.href="<%=baseLocalPath%>institutionCtrl/toUpdateInstitution.act?institutions_id=${platUser.USER_ID}";
							} else if (data.userType == "4") {
								if(data.level == "0"){
									window.location.href="<%=baseLocalPath%>school/toUpdateInstitution.act";
								}else if(data.level == "1"){
									window.location.href="<%=baseLocalPath%>schoolContro/list.act";
								}
							} else if (data.userType == "5") {
								window.location.href="<%=baseLocalPath%>company/toCompanyUpdate.act";
							}
							//--2017-2-28zhangbin updateE 
					    }
					} else if ("usererror" == data.result){
						$("#skeywords").tips({
							side : 3,
							msg : "您输入的密码和用户名不匹配，请重新输入。",
							bg : '#AE81FF',
							time : 5
						});
					} else if ("userStatusError" == data.result){
						$("#skeywords").tips({
							side : 3,
							msg : "您注册的用户正在审核中，请稍后...",
							bg : '#AE81FF',
							time : 5
						});
					}else if ("userStatusLockError" == data.result){
						$("#skeywords").tips({
							side : 3,
							msg : "您注册的用户已被锁定，请联系管理员",
							bg : '#AE81FF',
							time : 5
						});
					}else if ("userStatusNotPass" == data.result){
						$("#skeywords").tips({
							side : 3,
							msg : "您注册的用户审核未通过",
							bg : '#AE81FF',
							time : 5
						});
					} else {
						$("#skeywords").tips({
							side : 1,
							msg : "缺少参数",
							bg : '#AE81FF',
							time : 15
						});
						$("#skeywords").focus();
					}
				}
			});
		}
	}
	
	$(document).keyup(function(event) {
		if (event.keyCode == 13) {
			$("#to-recover").trigger("click");
		}
	});
	
	function savePaw() {
		if (!$("#sdxr").prop("checked")) {
			$.cookie('skeywords', '', {
				expires : -1
			});
			$.cookie('skeywordsP', '', {
				expires : -1
			});
		}
	}

	function saveCookie() {
		if ($("#sdxr").prop("checked")) {
			$.cookie('skeywords', $("#skeywords").val(), {
				expires : 7
			});
			$.cookie('skeywordsP', $("#skeywordsP").val(), {
				expires : 7
			});
		}
	}

	//客户端校验
	function check() {
		// 用户名验证
		if ($("#skeywords").val() == "") {
			$("#skeywords").tips({
				side : 3,
				msg : '请您输入用户名',
				bg : '#AE81FF',
				time : 3
			});
			$("#skeywords").focus();
			return false;
		}

		// 密码验证
		if ($("#skeywordsP").val() == "") {
			$("#skeywordsP").tips({
				side : 3,
				msg : '请您输入密码',
				bg : '#AE81FF',
				time : 3
			});
			$("#skeywordsP").focus();
			return false;
		}
		return true;
	}

	// 用户名验证
	function userNameBlur() {
		if ($("#skeywords").val() == "") {
			$("#skeywords").tips({
				side : 3,
				msg : '请您输入用户名',
				bg : '#AE81FF',
				time : 3
			});
		} else {
			document.getElementById('skeywords').style.color="#ccc";
		}
	}

	// 密码验证
	function pwdBlur() {
		if ($("#skeywordsP").val() == "") {
			$("#skeywordsP").tips({
				side : 3,
				msg : '请您输入密码',
				bg : '#AE81FF',
				time : 3
			});
		} else {
			document.getElementById('skeywordsP').style.color="#ccc";
		}
	}
	
	// 用户名获取焦点验证
	function userNameFocus() {
		if ($("#skeywords").val() != "") {
			document.getElementById('skeywords').style.color="#333333";
		}
	}

	// 密码获取焦点验证
	function pwdFocus() {
		if ($("#skeywordsP").val() != "") {
			document.getElementById('skeywordsP').style.color="#333333";
		}
	}
	
	jQuery(function() {
		var skeywords = $.cookie('skeywords');
		var skeywordsP = $.cookie('skeywordsP');
		if (typeof(skeywords) != "undefined"
				&& typeof(skeywordsP) != "undefined") {
			$("#skeywords").val(skeywords);
			$("#skeywordsP").val(skeywordsP);
			$("#sdxr").attr("checked", true);
		}
	});
</script>

</html>