<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String localPath = request.getContextPath();
	String baseLocalPath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ localPath + "/";
	String nowPage = request.getParameter("id");
%>
<!--<header开始>-->
<html> 
<head>
<link rel="shortcut icon" href="<%=localPath%>/favicon.ico"/>
<link rel="bookmark" href="<%=localPath%>/favicon.ico"/>
<link href="/SHYL/shyl/css/maincss/css.css" rel="stylesheet" type="text/css">
<link href="/SHYL/shyl/css/maincss/mypage.css" rel="stylesheet" type="text/css">
<link href="/SHYL/shyl/css/maincss/banner.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/SHYL/shyl/css/maincss/pager.css" />
<script src="/SHYL/shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="/SHYL/shyl/js/mainjs/172.js" type="text/javascript"></script>
<script src="/SHYL/shyl/js/mainjs/new_JQ.js" type="text/javascript"></script>
<script src="/SHYL/shyl/js/mainjs/banner.js" type="text/javascript"></script>
<script src="/SHYL/shyl/js/mainjs/adasfZAf6b.js" type="text/javascript"></script>
<script src="/SHYL/shyl/js/mainjs/jquery.flexslider-min.js" type="text/javascript"></script>
<script type="text/javascript" src="/SHYL/shyl/js/common/head.js"></script>
<script type="text/javascript" src="/SHYL/shyl/js/bootstrap.min.js"></script>
<style type="text/css">
@media all and (max-width: 1200px) {
    html {
        width:1200px !important;
    }
}
body{
 min-height:100%
}


.now {
	background-color: #305abe;
}
.nowText {
		color: #FFFFFF;
}
.box-popmessage{ background:url(<%=baseLocalPath%>shyl/images/1.gif) no-repeat; width:350px; height:237px; position:fixed ; _position:absolute; z-index:200; right:0px; bottom:0px;
_top:expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight-this.offsetHeight-(parseInt(this.currentStyle.marginTop,10)||0)-(parseInt(this.currentStyle.marginBottom,10)||0)));}
.pop_title{ width:100%; float:left; height:33px; line-height:33px;}
.pop_title_left{float:left; padding-left:10px;}
.pop_title_left strong{ font-size:14px;}
.pop_title_right{float:right; padding-top:10px; padding-right:12px;}
.pop_title_right img{ margin-left:10px; cursor:pointer;}
.pop_Content{ width:338px; height:163px; padding-left:4px;}
.pop_Content img{ margin-top:15px;}

</style>

<style type="text/css">
/* .side-bar a,.chat-tips i {background: url(./shyl/images/icon/ios.png) no-repeat;} */
/* .side-bar a,.chat-tips i {background: url(android.png) no-repeat;} */
.side-bar {width: 64px;position: fixed;bottom: 50px;right: 25px;font-size: 0;line-height: 0;z-index: 100;}
.side-bar a {width: 64px;height: 64px;display: inline-block;background-color: #ddd;margin-bottom: 2px;}
.side-bar a:hover {background-color: #669fdd;}
.side-bar .icon-qq {background-position: 0 -62px;}
.side-bar .icon-chat {background-position: 0 -130px;position: relative;}
.side-bar .icon-chat:hover .chat-tips {display: block;}
.side-bar .icon-blog {background-position: 0 -198px;}
.side-bar .icon-mail {background-position: 0 -266px;}
.side-bar .icon-totop {background-position: 0 -334px;}
.chat-tips {padding: 20px;border: 1px solid #d1d2d6;position: absolute;right: 78px;top: -55px;background-color: #fff;display: none;}
.chat-tips i {width: 9px;height: 16px;display: inline-block;position: absolute;right: -9px;top: 80px;background-position:-88px -350px;}
.chat-tips img {width: 138px;height: 138px;}
.header img {
    vertical-align: middle  !important;
}
.header .nav ul li a {
    width: auto !important;
    height: 70px;
    display: block;
    text-align: center;
    line-height: 70px;
    font-size: 1em;
    border-bottom: 2px;
    text-decoration: none;
    transition: 0.2s;
    padding: 0 10px !important;
}
.header .nav ul {
    list-style: none !important;
    margin-left: 0px !important;
}
.header .nav ul li {
    width: auto !important;
}
.header .di1 a {
    margin-left: 0px !important;
}
</style>

<script>
$(document).ready(function(){
    $("#zwtd,#rctd,#pxjs,#cp,#zhfw,#zxfw").removeClass("now");
    $("#zwtd1,#rctd1,#pxjs1,#cp1,#zhfw1,#zxfw").removeClass("nowText");
    var evt = "onorientationchange" in window ? "orientationchange" : "resize";
	if('<%=nowPage%>' == "zwtd"){
		$("#zwtd").addClass("now");
		$("#zwtd1").addClass("nowText");
	} else if ('<%=nowPage%>' == "cp") {
		$("#cp").addClass("now");
		$("#cp1").addClass("nowText");
	} else if ('<%=nowPage%>' == "pxjs") {
		$("#pxjs").addClass("now");
		$("#pxjs1").addClass("nowText");
	} else if ('<%=nowPage%>' == "rctd") {
		$("#rctd").addClass("now");
		$("#rctd1").addClass("nowText");
	} else if ('<%=nowPage%>' == "zhfw") {
		$("#zhfw").addClass("now");
		$("#zhfw1").addClass("nowText");
	} else if ('<%=nowPage%>' == "zxfw") {
        $("#zxfw").addClass("now");
        $("#zxfw1").addClass("nowText");
    }
	// 屏蔽右键
// 	document.body.oncontextmenu=document.body.ondragstart= document.body.onselectstart=document.body.onbeforecopy=function(){return false;};
	document.body.oncontextmenu=document.body.ondragstart=document.body.onbeforecopy=function(){return false;};

	getStatus();
	
	//更新问候语
	updateRespects();
	
	/* window.onresize = function(){
		setTimeout(fixedBottom(),1000);
	} */
	/* $(".box-popmessage").hide();
	// 最小化按钮
    $("#contraction").click(function(){
        $(".box-popmessage").animate({
        height: '30px',bottom:'0px'
    }, 1000, 'linear', function() { $(".pop_Content").hide(); });
    $("#contraction").hide();
    $("#open_window").show();
    });
    // 最大化按钮
    $("#open_window").click(function(){
        $(".box-popmessage").animate({
        height: '200px'
    }, 10, 'linear', function() { $(".pop_Content").show(); });
    $("#open_window").hide();
    $("#contraction").show();
    });
    // 关闭弹窗
    $("#close_window").click(function(){
        $(".box-popmessage").hide();
    }); */
});

// 关闭弹窗
/* function closeDiv() {
  document.getElementById('pop').style.visibility='hidden';
 } */
</script>
</head>
<body>
	<div class="head">
		<div class="hea">
			<div class="header">
				<a href="<%=baseLocalPath%>platform/list.act">
					<div class="logo">
						<img style="margin-top:-10px;height:50px;width:221px;" src="<%=baseLocalPath%>shyl/images/miui-logo.png">
					</div>
				</a>
				<div class="nav">
					<ul>
						<li id="zwtd"><a href="<%=baseLocalPath%>affairs/affairsIndex.act"><span id="zwtd1">政务通道</span></a></li>
						<li id="rctd"><a href="<%=baseLocalPath%>joblist/toTalentChannel.act"><span id="rctd1">人才通道</span></a></li>
						<li id="pxjs"><a href="<%=baseLocalPath%>institution/institutionIndex.act"><span id="pxjs1">培训晋升</span></a></li>
						<li id="cp"><a href="<%=baseLocalPath%>evaluation/evaluationIndex.act"><span id="cp1">测评</span></a></li>
						<li id="zhfw"><a href="<%=baseLocalPath%>integrated/integratedIndex.act"><span id="zhfw1">接发包</span></a></li>
						<li id="zxfw"><a href="<%=baseLocalPath%>consultancy/consultancyIndex.act"><span id="zxfw1">咨询服务</span></a></li>
					</ul>
				</div>
				<div style="float: right;width: 200px;">
						<img style="margin-top:10px;height:50px;width:200px;" src="<%=baseLocalPath%>shyl/images/jn-logo.png">
				</div>
				<div class="rightlogin" id="notLoginDiv"  >
					<div class="di1">
						<a href="<%=baseLocalPath%>userLogin/goLogin.act" title="登录"><span>登录</span></a>
					</div>
					<div class="di">
						<a href="<%=baseLocalPath%>register/main.act" title="注册"><span>注册</span></a>
					</div>
					<div class="di2">
						<a href="<%=baseLocalPath%>platform/about/aboutPlatformInfo.act?TYPE=4" title="联系我们"><span>联系我们</span></a>
					</div>
				</div>
				
				<div class="rightlogin" id="loginDiv" style="display: none;">
					<input data-val="true" id="userType" name="userType" type="hidden"
						value="${platUser.USER_TYPE}" />
						<span id="respects" style="width: 45px">您好</span>
					<div class="new1">
						<a href="javascript:void(0);" title="${platUser.USERNAME}"
							style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;width:90px"><img  src="<%=baseLocalPath%>shyl/images/user.png" title="用户">${platUser.USERNAME} </a>
					</div>
					<div class="new3" id="control">
						<a href="" id="console" style="margin-left:5px;" title="控制台"></a>
					</div>
					<div class="new2">
						<a href="<%=baseLocalPath%>platform/about/aboutPlatformInfo.act?TYPE=4" title="联系我们"></a>
					</div>
					<div class="new4">
						<a href="<%=baseLocalPath%>userLogin/logout.act" title="退出"></a>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<%-- <div class="box-popmessage" id="pop">
    <div class="pop_title">
        <div class="pop_title_left" style="color:#F00">
            <strong>重要提示</strong>
        </div>
        <div class="pop_title_right">
            <img src="<%=baseLocalPath%>shyl/images/img01.gif" id="contraction" /><img src="<%=baseLocalPath%>shyl/images/img03.gif" id="open_window" style="display:none;" / ><img src="<%=baseLocalPath%>shyl/images/img02.gif" onClick="closeDiv()" />
        </div>
    </div>
    <div class="pop_Content">
        <p>非常抱歉的通知您，本系统将在2017年4月6日16:00进行系统维护，预计17:00恢复正常。给您带来的不便，我们深感歉意</p>
     </div>
</div> --%>
<div class="side-bar"> 
	<a href="javascript:void(0);" class="icon-chat" style="background-image:url(<%=baseLocalPath%>shyl/images/icon/ios.png);background-repeat: no-repeat;background-position: center;">苹果<div class="chat-tips"><i></i><img style="width:138px;height:138px;" src="<%=baseLocalPath%>shyl/images/icon/iosQRcode.png" alt="苹果"></div></a> 
	<a href="javascript:void(0);" class="icon-chat" style="background-image:url(<%=baseLocalPath%>shyl/images/icon/android.png);background-repeat: no-repeat;background-position: center;">安卓<div class="chat-tips"><i></i><img style="width:138px;height:138px;" src="<%=baseLocalPath%>shyl/images/icon/androidQRcode.png" alt="安卓"></div></a>
	<a href="javascript:void(0);" onclick="downloadManual();" class="icon-chat" style="background-image:url(<%=baseLocalPath%>shyl/images/icon/manual.png);background-repeat: no-repeat;background-position: center;" title="操作手册下载">操作手册下载</a>
</div>
</body>
<script type="text/javascript">
	
	//更新问候语
	function updateRespects(){
		var hr = new Date().getHours();
		//午夜
		if (hr == 0 || hr == 1||hr == 2 ||hr == 3) {
			$("#respects").html("午夜好");
		//凌晨
		}else if (hr == 4 || hr == 5 || hr == 6) {
			$("#respects").html("凌晨好");
		//早上
		}else if (hr == 7 ) {
			$("#respects").html("早上好");
		//上午
		}else if (hr == 8|| hr == 9 || hr == 10 || hr == 11) {
			$("#respects").html("上午好");
		//中午
		}else if (hr == 12) {
			$("#respects").html("中午好");
		//下午
		}else if (hr == 13|| hr == 14|| hr == 15|| hr == 16|| hr == 17) {
			$("#respects").html("下午好");
		//傍晚
		}else if (hr == 18) {
			$("#respects").html("傍晚好");
		//晚上
		}else if (hr == 19|| hr == 20|| hr == 21|| hr == 22) {
			$("#respects").html("晚上好");
		//深夜
		}else if (hr == 23) {
			$("#respects").html("深夜好");
		//穿越时间
		}else{
			$("#respects").html("您好");
		}
	}
	
	function getStatus() {
		var userType = $("#userType").val();
		var level = "${schoolLevel}";
		if (userType == null) {
			$("#notLoginDiv").show();
			$("#loginDiv").hide();
		} else if (userType == 1) {
			$("#notLoginDiv").hide();
			$("#loginDiv").show();
			document.getElementById("console").href = "<%=baseLocalPath%>myresume/list.act";
		} else if (userType == 2) {
			$("#notLoginDiv").hide();
			$("#loginDiv").show();
			document.getElementById("console").href="<%=baseLocalPath%>company/toCompanyUpdate.act";
		} else if (userType == 3) {
			$("#notLoginDiv").hide();
			$("#loginDiv").show();
			document.getElementById("console").href="<%=baseLocalPath%>institutionCtrl/toUpdateInstitution.act?institutions_id=${platUser.USER_ID}";
		} else if (userType == 4) {
			if(level == 0){
				$("#notLoginDiv").hide();
				$("#loginDiv").show();
				$("#control").show();
				document.getElementById("console").href="<%=baseLocalPath%>school/toUpdateInstitution.act";
			}else if(level == 1){
				$("#notLoginDiv").hide();
				$("#loginDiv").show();
				$("#control").show();
				document.getElementById("console").href="<%=baseLocalPath%>schoolContro/list.act";
			}
		} else if (userType == 5) {
			$("#notLoginDiv").hide();
			$("#loginDiv").show();
			document.getElementById("console").href="<%=baseLocalPath%>company/toCompanyUpdate.act";
		}
	}
	// 下载操作指南
	function downloadManual() {
		var fileName="操作手册.doc";
		var filePath="templateFiles/Manual.doc";
		var form = $("<form></form>");
		$(document.body).append(form);
        form.attr('action',"<%=baseLocalPath%>gov/downloadTemp.act?fileName="+encodeURI(fileName)+"&filePath="+filePath);
        form.attr('method','post');
        form.css('display','none');
        form.submit();  
        form.remove();
	}
</script>
</html>
