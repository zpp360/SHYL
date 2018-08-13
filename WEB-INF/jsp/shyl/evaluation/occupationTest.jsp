<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN" class="ua-www">
<head>
<base href="<%=basePath%>">
<title>职业倾向测试_济南市服务外包公共服务平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, maximum-scale=1.0">
<jsp:include page="../common/header.jsp"><jsp:param name="id" value="cp" /></jsp:include>
<link href="shyl/css/question/css/style.css" rel="stylesheet">
<link href="shyl/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="shyl/css/bootstrap.css">
<link href="shyl/css/question/bootstrap/css/bootstrap-huan1.css"
	rel="stylesheet">
<link href="shyl/css/question/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="shyl/css/question/css/exam1.css" rel="stylesheet"
	type="text/css">
<style>
a:hover {
   color:#2e2e2e;
   text-decoration: none;
}
.nl-btn1{ background:#37a607;}
.nl-btn2{ background:#358cce;}
.nl-btn3{ background:#f87a1e;}
.nl-btn1:hover{ background:#308f07;}
.nl-btn2:hover{ background:#1b7ac1;}
.nl-btn3:hover{ background:#eb6b0e;}
.zycp-tit{ background:url(/SHYL/shyl/images/zycs-tit.png) no-repeat; width:1130px; height:180px;}
.zycp{ width:1130px; margin:0 auto;}
.zycp-nr{ background:url(/SHYL/shyl/images/zycp-bg.png) no-repeat; width:1130px; height:780px;}
.zycp-st{ padding:60px 80px 20px;}
.zycp-st form label{ width:300px; text-align:left;    display: block;float: left; margin-left:20px;}
.nlcp-btn{ width:800px; margin:0 auto; text-align:center;}
.nlcp-btn button{ padding:8px 15px; border-radius:3px; border:none; color:#fff; cursor:pointer;}
.newfooter {
	height: 100px;
	background: #ededed;
	font-size: 0.85em;
	border-top: 2px solid #3155C8;
	padding-top: 20px;
	padding-bottom: 20px;
	margin: 0 auto;
	position: relative;
	top: 10px;
}

.wanew p {
	color: #4b4b4b;
	font-size: 1.0em;
	margin: 0 auto;
	font-family: arial;
	text-align: center;
}

.wanew span {
	color: #4b4b4b;
	margin-left: 0px;
}
</style>
</head>
<body onLoad="goPage(1,5);">
	<div class="zycp" style="margin-top: 90px;">
		<div class="zycp-tit"></div>
		<div class="zycp-nr">
			<input type="hidden" value="<%=basePath%>" id="methodurl"> <input
				type="hidden" value="10" id="leng"> <input type="hidden"
				value="${pd.id}" id="hist-id"> <input type="hidden"
				value="${pd.id}" id="paper-id"> <input type="hidden"
				value="${pd.field_id}" id="field_id"> <input type="hidden"
				value="${platUser.USER_ID}" id="loginstatus"> <input
				type="hidden" value="${platUser.USER_TYPE}" id="user_type">
			<div class="zycp-st">
				<div style="height: 600px;">
					<form id="form1" name="form1" method="post" action="">
						<div class="cpst" id="questionIndex_1">
							<p>
								<b>1.&nbsp;&nbsp;&nbsp;你走路时是……</b>
							</p>
							<p>
								<label> <input type="radio"
									name="question-radio1" value="6" /> <span
									style="width: 700px; color: black;"> A:大步的快走</span>
								</label> <label> <input type="radio"
									name="question-radio1" value="4" /> <span
									style="width: 700px; color: black;"> B:小步的快走</span>
								</label> <label> <input type="radio"
									name="question-radio1" value="7" /> <span
									style="width: 700px; color: black;"> C:不快，仰著头面对著世界</span>
								</label> <label> <input type="radio"
									name="question-radio1" value="2" /> <span
									style="width: 700px; color: black;"> D:不快，低著头</span>
								</label> <label> <input type="radio"
									name="question-radio1" value="1" /> <span
									style="width: 700px; color: black;">E:很慢</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_2">
							<p>
								<b>2.&nbsp;&nbsp;&nbsp;和人说话时，你……</b>
							</p>
							<p>
								<label> <input type="radio"
									name="question-radio2" value="4" /> <span
									style="width: 700px; color: black;"> A:手臂交叠的站著</span>
								</label> <label> <input type="radio"
									name="question-radio2" value="2" /> <span
									style="width: 700px; color: black;"> B:双手紧握著</span>
								</label> <label> <input type="radio"
									name="question-radio2" value="5" /> <span
									style="width: 700px; color: black;"> C:一只手或两手放在臀部</span>
								</label> <label> <input type="radio"
									name="question-radio2" value="7" /> <span
									style="width: 700px; color: black;"> D:碰著或推著与你说话的人</span>
								</label> <label style="width:350px"> <input type="radio"
									name="question-radio2" value="6" /> <span
									style="width: 700px; color: black;">E:玩著你的耳朵、摸著你的下巴、或用手整理头发</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_3">
							<p>
								<b>3.&nbsp;&nbsp;&nbsp;你何时感觉最好？</b>
							</p>
							<p>
								<label> <input type="radio"
									name="question-radio3" value="2" /> <span
									style="width: 700px; color: black;"> A:早晨</span>
								</label> <label> <input type="radio"
									name="question-radio3" value="4" /> <span
									style="width: 700px; color: black;"> B:下午及傍晚</span>
								</label> <label> <input type="radio"
									name="question-radio3" value="6" /> <span
									style="width: 700px; color: black;"> C:夜里</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_4">
							<p>
								<b>4.&nbsp;&nbsp;&nbsp;坐著休息时，你的……</b>
							</p>
							<p>
								<label> <input type="radio"
									name="question-radio4" value="4" /> <span
									style="width: 700px; color: black;"> A:两膝盖并拢</span>
								</label> <label> <input type="radio"
									name="question-radio4" value="6" /> <span
									style="width: 700px; color: black;"> B:两腿交叉</span>
								</label> <label> <input type="radio"
									name="question-radio4" value="2" /> <span
									style="width: 700px; color: black;"> C:两腿伸直</span>
								</label> <label> <input type="radio"
									name="question-radio4" value="1" /> <span
									style="width: 700px; color: black;"> D:一腿卷在身下</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_5">
							<p>
								<b>5.&nbsp;&nbsp;&nbsp;碰到你感到发笑的事时，你的反应是……</b>
							</p>
							<p>
								<label> <input type="radio"
									name="question-radio5" value="6" /> <span
									style="width: 700px; color: black;"> A:一个欣赏的大笑</span>
								</label> <label> <input type="radio"
									name="question-radio5" value="4" /> <span
									style="width: 700px; color: black;"> B:笑著，但不大声</span>
								</label> <label> <input type="radio"
									name="question-radio5" value="3" /> <span
									style="width: 700px; color: black;"> C:轻声的咯咯地笑</span>
								</label> <label> <input type="radio"
									name="question-radio5" value="5" /> <span
									style="width: 700px; color: black;"> D:羞怯的微笑</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_6">
							<p>
								<b>6.&nbsp;&nbsp;&nbsp;当你去一个派对或社交场合时，你……</b>
							</p>
							<p>
								<label> <input type="radio" name="question-radio6"
									value="6" /> <span style="width: 700px; color: black;">
										A:很大声地入场以引起注意</span>
								</label> <label> <input type="radio" name="question-radio6"
									value="4" /> <span style="width: 700px; color: black;">
										B:安静地入场，找你认识的人</span>
								</label> <label> <input type="radio" name="question-radio6"
									value="2" /> <span style="width: 700px; color: black;">
										C:非常安静地入场，尽量保持不被注意</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_7">
							<p>
								<b>7.&nbsp;&nbsp;&nbsp;当你非常专心工作时，有人打断你，你会……</b>
							</p>
							<p>
								<label> <input type="radio" name="question-radio7"
									value="6" /> <span style="width: 700px; color: black;">
										A:欢迎他</span>
								</label> <label> <input type="radio" name="question-radio7"
									value="2" /> <span style="width: 700px; color: black;">
										B:感到非常恼怒</span>
								</label> <label> <input type="radio" name="question-radio7"
									value="4" /> <span style="width: 700px; color: black;">
										C:在上两极端之间</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_8">
							<p>
								<b>8.&nbsp;&nbsp;&nbsp;下列颜色中，你最喜欢哪一颜色?</b>
							</p>
							<p>
								<label> <input type="radio" name="question-radio8"
									value="6" /> <span style="width: 700px; color: black;">
										A:红或橘色</span>
								</label> <label> <input type="radio" name="question-radio8"
									value="7" /> <span style="width: 700px; color: black;">
										B:黑色</span>
								</label> <label> <input type="radio" name="question-radio8"
									value="5" /> <span style="width: 700px; color: black;">
										C:黄或浅蓝色</span>
								</label> <label> <input type="radio" name="question-radio8"
									value="4" /> <span style="width: 700px; color: black;">
										D:绿色</span>
								</label> <label> <input type="radio" name="question-radio8"
									value="3" /> <span style="width: 700px; color: black;">E:深蓝或紫色</span>
								</label> <label> <input type="radio" name="question-radio8"
									value="2" /> <span style="width: 700px; color: black;">F:白色</span>
								</label> <label> <input type="radio" name="question-radio8"
									value="1" /> <span style="width: 700px; color: black;">G:棕或灰色</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_9">
							<p>
								<b>9.&nbsp;&nbsp;&nbsp;你经常梦到你在……</b>
							</p>
							<p>
								<label> <input type="radio" name="question-radio9"
									value="4" /> <span style="width: 700px; color: black;">
										A:落下</span>
								</label> <label> <input type="radio" name="question-radio9"
									value="2" /> <span style="width: 700px; color: black;">
										B:打架或挣扎</span>
								</label> <label> <input type="radio" name="question-radio9"
									value="3" /> <span style="width: 700px; color: black;">
										C:找东西或人</span>
								</label> <label> <input type="radio" name="question-radio9"
									value="5" /> <span style="width: 700px; color: black;">
										D:飞或漂浮</span>
								</label> <label> <input type="radio" name="question-radio9"
									value="6" /> <span style="width: 700px; color: black;">E:你平常不做梦</span>
								</label> <label> <input type="radio" name="question-radio9"
									value="1" /> <span style="width: 700px; color: black;">F:你的梦都是愉快的</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_10">
							<p>
								<b>10.&nbsp;&nbsp;&nbsp;临入睡的前几分钟，你在床上的姿势是……</b>
							</p>
							<p>
								<label> <input type="radio" name="question-radio10"
									value="7" /> <span style="width: 700px; color: black;">
										A:仰躺，伸直</span>
								</label> <label> <input type="radio" name="question-radio10"
									value="6" /> <span style="width: 700px; color: black;">
										B:俯躺，伸直</span>
								</label> <label> <input type="radio" name="question-radio10"
									value="4" /> <span style="width: 700px; color: black;">
										C:侧躺，微卷</span>
								</label> <label> <input type="radio" name="question-radio10"
									value="2" /> <span style="width: 700px; color: black;">
										D:头睡在一手臂上</span>
								</label> <label> <input type="radio" name="question-radio10"
									value="1" /> <span style="width: 700px; color: black;">E:被盖过头</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
					</form>
				</div>
				<div class="nlcp-btn" id="barcon"></div>
			</div>
		</div>
		<div class="modal fade bs-example-modal-sm" id="confirmDialog"
			role="dialog" aria-labelledby="mySmallModalLabel">
			<div class="modal-dialog modal-sm" style="margin-top: 250px">
				<div class="modal-content" style="width: 410px">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="mySmallModalLabel">提示</h4>
					</div>
					<div class="modal-body">
						<div class="modal-body"
							style="width: 410px; height: 60px; padding-top: 0px">
							<h4>您确定要交卷吗？交卷后本次测评结束！！</h4>
							<br> <br>
						</div>
						<div class="modal-footer" style="height: 40px"
							id="occupationtestPaperSubmit">
							<button id="EduButton" type="button" class="btn btn-success"
								data-dismiss="modal">确认</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade bs-example-modal-sm" id="layhomewarn"
			role="dialog" aria-labelledby="mySmallModalLabel">
			<div class="modal-dialog modal-sm" style="margin-top: 250px">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="mySmallModalLabel">提示</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" value="" id="startid" name="startid">
						请登录后操作！点此&nbsp;<a style="cursor: pointer;"
							href="<%=basePath%>userLogin/goLogin.act?returnUrl=evaluation/evaluationIndex.act">
							<b style="text-decoration: underline; color: #0a7295;">登录</b>
						</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 无权访问开始 -->
		<div class="modal fade bs-example-modal-sm" id="wqfw" role="dialog"
			aria-labelledby="mySmallModalLabel">
			<div class="modal-dialog modal-sm" style="margin-top: 250px">
				<div class="modal-content" style="width: 410px">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="mySmallModalLabel">提示</h4>
					</div>
					<div class="modal-body">
						<div class="modal-body"
							style="width: 410px; height: 60px; padding-top: 0px">
							<h4>您无权限进行操作，请以个人用户登录！！</h4>
							<br> <br>
						</div>
						<div class="modal-footer" style="height: 40px"
							id="testPaperSubmit">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
						</div>
					</div>
				</div>
			</div>
		</div>
        <div class='modal my-modal-alert' id='my-modal-success-alert'>
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:200px;text-align:center;position:fixed;right:45%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;<label>添加成功!</label>
                    </div>
                </div>
            </div>
        </div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="shyl/js/question/ability-examing.js"></script>
<script type="text/javascript" src="shyl/js/question/all.js?v=0712"></script>
<script type="text/javascript">
	function logint() {
		var userid = $('#loginstatus').val();
		var usertype = $('#user_type').val();
		if (userid == "") {
			$("#layhomewarn").modal('show');
		} else if (usertype == 1) {
			$('#confirmDialog').modal('show');
		} else {
			$('#wqfw').modal('show');
		}
	}

	// 分页
	function goPage(pno, psize) {
		var num = $("#leng").val(); // 所有记录数
		var totalPage = 0; //总页数
		var pageSize = psize; //每页显示行数
		//总共分几页
		if (num / pageSize > parseInt(num / pageSize)) {
			totalPage = parseInt(num / pageSize) + 1;
		} else {
			totalPage = parseInt(num / pageSize);
		}
		var currentPage = pno;//当前页数
		var startRow = (currentPage - 1) * pageSize + 1;//开始显示的行
		var endRow = currentPage * pageSize;//结束显示的行
		endRow = (endRow > num) ? num : endRow;
		//遍历显示数据实现分页
		for (var i = 1; i < (num + 1); i++) {
			var irow = $("#questionIndex_" + i).val();
			if (i >= startRow && i <= endRow) {
				$("#questionIndex_" + i).css("display", "block");
			} else {
				$("#questionIndex_" + i).css("display", "none");
			}
		}
		var tempStr = "";
		if (currentPage == 1 && totalPage == 1) {
			tempStr += "<button class=\"nl-btn1\" style=\"margin-right: 5px;\" onClick=\"goPage("
					+ (1) + "," + psize + ")\">首页</button>";
			tempStr += "<button class=\"nl-btn2\" style=\"margin-right: 5px;\" onclick=\"alertPage("+3+")\">上一页</button>";
			tempStr += "<button class=\"nl-btn2\" style=\"margin-right: 5px;\" onclick=\"alertPage("+3+")\">下一页</button>";
			tempStr += "<button class=\"nl-btn3\" style=\"margin-right: 5px;\" onclick=\"logint()\">交卷</button><label>共10道题</label>";
		}
		if (currentPage == 1 && totalPage > 1) {
			tempStr += "<button class=\"nl-btn1\" style=\"margin-right: 5px;\" onClick=\"goPage("
					+ (1) + "," + psize + ")\">首页</button>";
			tempStr += "<button class=\"nl-btn2\" style=\"margin-right: 5px;\" onclick=\"alertPage("+1+")\">上一页</button>"
			tempStr += "<button class=\"nl-btn2\" style=\"margin-right: 5px;\" onClick=\"goPage("
					+ (currentPage + 1) + "," + psize + ")\">下一页</button>";
			tempStr += "<button class=\"nl-btn3\" style=\"margin-right: 5px;\" onclick=\"logint()\">交卷</button><label>共10道题</label>";
		}
		if (currentPage > 1 && currentPage < totalPage) {
			tempStr += "<button class=\"nl-btn1\" style=\"margin-right: 5px;\" onClick=\"goPage("
					+ (1) + "," + psize + ")\">首页</button>";
			tempStr += "<button class=\"nl-btn2\" style=\"margin-right: 5px;\" onClick=\"goPage("
					+ (currentPage - 1) + "," + psize + ")\">上一页</button>";
			tempStr += "<button class=\"nl-btn2\" style=\"margin-right: 5px;\" onClick=\"goPage("
					+ (currentPage + 1) + "," + psize + ")\">下一页</button>";
			tempStr += "<button class=\"nl-btn3\" style=\"margin-right: 5px;\" onclick=\"logint()\">交卷</button><label>共10道题</label>";
		}
		if (currentPage > 1 && currentPage == totalPage) {
			tempStr += "<button class=\"nl-btn1\" style=\"margin-right: 5px;\" onClick=\"goPage("
					+ (1) + "," + psize + ")\">首页</button>";
			tempStr += "<button class=\"nl-btn2\" style=\"margin-right: 5px;\" onClick=\"goPage("
					+ (currentPage - 1) + "," + psize + ")\">上一页</button>";
			tempStr += "<button class=\"nl-btn2\" style=\"margin-right: 5px;\" onclick=\"alertPage("+2+")\">下一页</button>";
			tempStr += "<button class=\"nl-btn3\" style=\"margin-right: 5px;\" onclick=\"logint()\">交卷</button><label>共10道题</label>";
		}

		document.getElementById("barcon").innerHTML = tempStr;
	}
	 function alertPage(page){
		 if(page==1){
			  $('#my-modal-success-alert .modal-body label').text("已经是首页了!");
		 }else if(page==2){
			  $('#my-modal-success-alert .modal-body label').text("已经是尾页了!");
		 }else{
			  $('#my-modal-success-alert .modal-body label').text("共一页!");
		 }
		  $('#my-modal-success-alert').show ().delay (1000).fadeOut ();
	 }
</script>
</html>