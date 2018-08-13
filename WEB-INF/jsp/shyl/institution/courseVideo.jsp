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
<base href="<%=basePath%>">
<title>培训晋升课程播放_济南市服务外包公共服务平台</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<link rel="stylesheet"
	href="<%=basePath%>shyl/css/institution/allclass.css" type="text/css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/institution/app.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=basePath%>shyl/css/institution/class.css" type="text/css">
<link rel="stylesheet"
	href="<%=basePath%>shyl/css/institution/fatstyle.css" type="text/css">
<link rel="stylesheet"
	href="<%=basePath%>shyl/css/institution/findCourse.css" type="text/css">

<link rel="stylesheet" href="<%=basePath%>shyl/css/institution/head.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=basePath%>shyl/css/institution/header.css" type="text/css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/institution/user.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=basePath%>shyl/css/institution/jquery.mCustomScrollbar.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=basePath%>shyl/css/institution/videoCss.css" type="text/css">
<!-- 乐视视频 -->
<script type="text/javascript" charset="utf-8"
	src="http://yuntv.letv.com/player/vod/bcloud.js"></script>

<style>
:focus {
	outline: none;
}
</style>

</head>
<body scroll="no">
	<div class="title">
		<input type="hidden" id="rootPath" value="<%=basePath%>"> <input
			type="hidden" id="classTypeId" value="${classTypeId}"> <i
			class="iconfont btn-return video-css" style="cursor: pointer;"></i>
		<em id="shipin"></em>
		<div class="login-area">
			<ul class="header-unlogin clear">
				<c:choose>
					<c:when test="${platUser.USERNAME !=null}">
						<li class="set_btn user-card-box"
							style="line-height: 60px; font-size: 14px;">
							<div class="dropdown setting">
								<div class="user-item">
									<div class="down-content clear">
										<a href="javascript:void(0);" title="${platUser.USERNAME}"
											style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; width: 90px"><img
											src="<%=basePath%>shyl/images/institution/head_top.png"
											alt="" style="width: 20px; margin-top: 20px;" />
											${platUser.USERNAME} </a>
										<c:choose>
											<c:when test="${platUser.USER_TYPE==1}">
												<a href="<%=basePath%>myresume/list.act" class="fl">我的控制台</a>

											</c:when>
											<c:when test="${platUser.USER_TYPE==2}">
												<a href="<%=basePath%>company/toCompanyUpdate.act"
													class="fl">我的控制台</a>
											</c:when>
											<c:when test="${platUser.USER_TYPE==3}">
												<a
													href="<%=basePath%>institutionCtrl/toUpdateInstitution.act?institutions_id=${platUser.USER_ID}"
													class="fl">我的控制台</a>
											</c:when>
											<c:when test="${platUser.USER_TYPE==4}">
												<c:if test="${schoolLevel==0}">
													<a href="<%=basePath%>school/toUpdateInstitution.act"
														class="fl">我的控制台</a>
												</c:if>
												<c:if test="${schoolLevel==1}">
													<a href="<%=basePath%>schoolContro/list.act" class="fl">我的控制台</a>
												</c:if>
											</c:when>
											<c:when test="${platUser.USER_TYPE==5}">
												<a href="<%=basePath%>company/toCompanyUpdate.act"
													class="fl">我的控制台</a>
											</c:when>
										</c:choose>
										<a href="<%=basePath%>userLogin/logout.act" class="fr mr30">退出</a>
										<a
											href="<%=basePath%>platform/about/aboutPlatformInfo.act?TYPE=4"
											class="fr">联系我们</a>
									</div>
								</div>
							</div>
						</li>

					</c:when>
					<c:otherwise>
						<li class="header-signin"><a
							href="<%=basePath%>userLogin/goLogin.act">登录</a></li>
						<li class="header-signup"><a
							href="<%=basePath%>register/main.act">注册</a></li>
						<li class="header-signup"><a
							href="<%=basePath%>platform/about/aboutPlatformInfo.act?TYPE=4">联系我们</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
	<div class="section aside-hide" style="height: 590px;">
		<div class="content" style="right: 0px;">
			<div id="video" class="video"
				style="height: 540px; overflow: hidden; background-color: #000000;">

				<div class="mask gobuy">
					<div class="word">
						<p>该视频属于收费视频，如想继续收看请您购买课程</p>
						<button onclick="javascript:buyclass();">立即购买</button>
					</div>
				</div>
				<div class="mask pause">
					<div class="word">
						<p>点击确定继续观看</p>
						<button onclick="javascript:cuntinue();">确定</button>
					</div>
				</div>
				<div class="mask coursetest">
					<div class="word q-word none">
						<p></p>
						<button onclick="javascript:gocy();">开始测验</button>
					</div>
					<div class="word q-word2 none">
						<p>
							<i class="q-icon"></i>您还有未完成的测验
						</p>
					</div>
				</div>
				<div class="mask audioimg">
					<div class="word q-word3 none"></div>
				</div>
			</div>
			<div class="bottom btom" style="opacity: 0; visibility: hidden;">
			</div>
			<div class="bottom" style="margin-top: -50px">
			</div>
			<div class="rightFix" style="top: 10px;">
				<ul>
					<li class="cursor active"
						style="opacity: 1; background-color: rgb(0, 186, 238);">
						<p class="iconfont xtb_right"></p>
						<p class="btn_wz">章节</p>
					</li>
				</ul>
			</div>
		</div>
		<!--content结束-->
		<div class="aside close">
			<!--这是右侧章节-->
			<div id="zhangjie" class="zhangjie_right right_flag">
				<div class="neirong zhangjie_neirong mCustomScrollbar _mCS_1">
					<%-- <c:out value="${videoid}"/> --%>
					<c:if test="${retMap.data !=null}">
						<c:forEach items="${retMap.data}" var="data" varStatus="vs">
							<div class="zj_title">&nbsp;第${vs.index+1}章：${data.chapterName}</div>
							<c:forEach items="${data.lectures}" var="var" varStatus="levs">
								<ul>
									<li class="study zjlieb" title="${var.lectureName}"
										data-ststatus="${var.studyStatus}"
										data-chapterid="${data.moduleId}" data-videoid="${var.id}"
										data-uuid="${data.letv.letv_uuid}"
										data-cuid="${data.letv.letv_user_id}"
										data-utoken="${data.letv.letv_api_key}"
										data-vuid="${var.webVideoId}"
										data-overFlowTime="${var.overFlowTime}"
										data-freeFlag="${var.freeFlag}"><c:choose>
											<c:when test="${var.id==videoid}">
												<div class="zj_name zhangjie_active">
													<i class="q-iconfont iconfont"></i> ${levs.index+1}.
													${var.lectureName}
												</div>
											</c:when>
											<c:otherwise>
												<div class="zj_name">
													<i class="q-iconfont iconfont"></i> ${levs.index+1}.
													${var.lectureName}
												</div>
											</c:otherwise>
										</c:choose>
										<div class="constant_width">
											<div class="dur">&nbsp;${var.videoTime}</div>
										</div></li>
								</ul>
							</c:forEach>
						</c:forEach>
					</c:if>
					<c:if test="${retMap.data ==null}">
						<div
							style="font-size: 14px; margin-top: 30px; margin-left: 100px;">目录加载失败，请刷新重试</div>
					</c:if>
				</div>
			</div>
			<!--章节结束-->
		</div>
	</div>
	<div class="clear"></div>
	<script type="text/javascript"
		src="<%=basePath%>shyl/js/jquery-1.9.1.min.js"></script>
	<script src="<%=basePath%>shyl/js/institution/courselist/common.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="<%=basePath%>shyl/js/institution/courselist/jquery.mCustomScrollbar.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>shyl/js/institution/courselist/jquery.mousewheel.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>shyl/js/institution/courselist/video.js"></script>
	<script src="<%=basePath%>shyl/js/institution/courselist/swfobject.js"></script>
	<script src="<%=basePath%>shyl/js/institution/courselist/flexpaper.js"></script>
	<div class="side-bar side-bar-fixed"></div>
</body>
</html>