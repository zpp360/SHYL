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
<html lang="en">
<head>
<title>机构详情_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width,inital-scale=1,maximum-scale=1,user-scalable=no;" />
<jsp:include page="../../common/header.jsp"></jsp:include>
<link href="shyl/css/maincss/css.css" rel="stylesheet" type="text/css">
<link href="shyl/css/maincss/rencai.css" rel="stylesheet"
	type="text/css">
<script src="shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/jquery-1.7.2.js"
	type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/jquery.bxslider.min.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="<%=basePath%>shyl/css/maincss/jquery.bxslidernew.css" />
<script src="shyl/js/mainjs/box.js" type="text/javascript"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<style type="text/css">
div.rc_jigou_main div.jigouview div.jigouview_mNew {
	display: inline-block;
	text-align: justify;
	float: left;
	margin-left: 20px;
	line-height: 45px;
	font-size: 0.85em;
}
div.jigoushizinew ul li div p {
    word-wrap: break-word;
}
pre { 
border:dashed 0px ;
background:transparent;
color:#8a8a8a;
font-size:14px;
font-family:微软雅黑,黑体,新細明體;
white-space: pre-wrap; /*css-3*/ 
white-space: -moz-pre-wrap; /*Mozilla,since1999*/ 
white-space: -pre-wrap; /*Opera4-6*/ 
white-space: -o-pre-wrap; /*Opera7*/ 
word-wrap: break-word; /*InternetExplorer5.5+*/ 
} 
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var winWidth;
		// 课程list
		var courselistSize = $("#course_listSize").val();
		// 师资list
		var teacherlist = $("#teacherlist").val();
		if (courselistSize > 3) {
			$("#bxslider_courselist").bxSlider({
				auto : true
			});
		} else {
			$("#bxslider_courselist").bxSlider({
				auto : false
			});
		}

		if (teacherlist > 4) {
			$("#bxslider_teacherlist").bxSlider({
				auto : true
			});
		} else {
			$("#bxslider_teacherlist").bxSlider({
				auto : false
			});
		}
		if (window.innerWidth){
			winWidth = window.screen.width;
			}else if ((document.body) && (document.body.clientWidth)){
			winWidth = window.screen.width;}
			if(winWidth<1360){
			document.getElementById("rc_jigou_cateId").style.left="5%";
			}else if(winWidth>=1360 && winWidth<=1440){
			document.getElementById("rc_jigou_cateId").style.left="10%";
			}else if(winWidth>1440 && winWidth<=1680){
			document.getElementById("rc_jigou_cateId").style.left="15%";
			}else{
			document.getElementById("rc_jigou_cateId").style.left="20%";
			}
	});
function digResize(){
	location.reload();
	if (window.innerWidth){
		winWidth = window.screen.width;
		}else if ((document.body) && (document.body.clientWidth)){
		winWidth = window.screen.width;}
		if(winWidth<1360){
		document.getElementById("rc_jigou_cateId").style.left="5%";
		}else if(winWidth>=1360 && winWidth<=1440){
		document.getElementById("rc_jigou_cateId").style.left="10%";
		}else if(winWidth>1440 && winWidth<=1680){
		document.getElementById("rc_jigou_cateId").style.left="15%";
		}else{
		document.getElementById("rc_jigou_cateId").style.left="20%";
		}
}
</script>
</head>
<body onresize="digResize()">
<div id="introduce"></div>
	<!--</header结束>-->
	<div class="clear"></div>
	<div class="rc_jigou clearfix">
		<div class="rc_jigou_view" style="padding-bottom: 0px;">
			
			<div class="rc_jigou_main">
			<div id ="rc_jigou_cateId" class="rc_jigou_cate" style="position:fixed;top:12%;height:auto;width:200px;">
				<h1>机构咨询</h1>
				<ul>
				   <li><a
						href="<%=basePath%>institution/toEdit.act?institutions_id=${pd.institutions_id}#introduce">机构详情</a></li>
					<li><a
						href="<%=basePath%>institution/toEdit.act?institutions_id=${pd.institutions_id}#employment">就业情况</a></li>
					<li><a
						href="<%=basePath%>institution/toEdit.act?institutions_id=${pd.institutions_id}#equirment">机构环境</a></li>
					<li><a
						href="<%=basePath%>institution/toEdit.act?institutions_id=${pd.institutions_id}#inCourse">机构课程</a></li>
					<li><a
						href="<%=basePath%>institution/toEdit.act?institutions_id=${pd.institutions_id}#inTeacher">机构师资</a></li>
				</ul>
			</div>
				<h2 id="employment">机构详情</h2>
				<div class="jigouview">
					<div class="mypage_image" style="width: 100%; height: 100%;">
						<p>
							<img
								onerror="showImgDelay(this,'<%=basePath%>shyl/images/mylogo.jpg');"
								src="<%=basePath%>images/${pd.logo}"
								style="margin-right: 10px; float: left; width: 40%; height: 50%; border-radius: 5px;"
								alt="LOGO"> <span style="font-size: 0.85em"><pre>${pd.introduction_detail}</pre></span>
						</p>
					</div>
					<br>
					<h1 id="equirment">就业情况</h1>
						<c:if test="${pd.employment == null or pd.employment ==''}">
						<ul>
								<li
									style="height: 10% !important; margin-top: 15px; float: left; margin-left: 45%;color: rgb(255, 106, 0);">
									<span style="font-size: 0.9em;">
										&nbsp;&nbsp;&nbsp;没有相关机构就业情况 </span>
								</li>
						</ul>
						</c:if>
					<c:if test="${pd.employment != null and pd.employment !=''}">
						<ul>
							<li style="height: 10% !important; float: left; color: rgb(255, 106, 0);">
								<pre>${pd.employment}</pre>
							</li>
						</ul>
					</c:if>
					<h1>机构环境</h1>
					<c:choose>
						<c:when test="${not empty environmentlist}">
							<div class="scrollBox c">
								<div class="ohbox">
									<ul class="piclist">
										<c:forEach items="${environmentlist}" var="var" varStatus="vs">
											<li><img
												onerror="showImgDelay(this,'<%=basePath%>shyl/images/mylogo.jpg');"
												style="width: 275px; height: 174px"
												onclick="showOriginalPhoto('<%=basePath%>images/','${var.file_path}');"
												src="<%=basePath%>images/${var.file_path}" /></li>
										</c:forEach>
									</ul>
								</div>
								<div class="pageBtn">
									<span class="prev">&lsaquo;</span> <span class="next">&rsaquo;</span>
									<ul class="list">
										<c:forEach var="i" begin="1" end="${pd.picCount}">
											<li></li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<ul>
								<li
									style="height: 10% !important; margin-top: 15px; float: left; margin-left: 45%;color: rgb(255, 106, 0);">
									<span style="font-size: 0.9em;">
										&nbsp;&nbsp;&nbsp;没有相关机构环境图片 </span>
								</li>
							</ul>
						</c:otherwise>
					</c:choose>
					<script type="text/javascript">
						$(".c").hover(function() {
							$(this).find(".prev,.next").fadeTo("show", 0.3);
						}, function() {
							$(this).find(".prev,.next").hide();
						})
						/*鼠标移过某个按钮 高亮显示*/
						$(".prev,.next").hover(function() {
							$(this).fadeTo("show", 0.8);
						}, function() {
							$(this).fadeTo("show", 0.3);
						})

						jQuery(".c").slide({
							titCell : ".list li",
							mainCell : ".piclist",
							effect : "left",
							vis : 3,
							scroll : 3,
							delayTime : 800,
							trigger : "click",
							easing : "easeOutCirc"
						});
					</script>
					<input type="hidden" id="course_listSize"
						value="${fn:length(courselist)}">
					<h1 id="inCourse">机构课程</h1>
					<div class="jigoukechengnew">
						<c:choose>
							<c:when test="${not empty courselist}">
								<ul class=bxslider_course id="bxslider_courselist"style="right: 35px;">
									<li><c:forEach items="${courselist}" var="var"
											varStatus="vs">
											<ul>
												<c:if test="${vs.index < 3 }">
													<li><a><img
															onerror="showImgDelay(this,'<%=basePath%>shyl/images/default/course.jpg');"
															src="<%=basePath%>images/${var.course_path}">
															<h3>${var.course_name}</h3> <span class="time">${var.period}课时${var.course_time}分钟</span></a>
													</li>
												</c:if>
											</ul>
										</c:forEach></li>
									<li><c:forEach items="${courselist}" var="var"
											varStatus="vs">
											<ul>
												<c:if test="${vs.index <6 && vs.index>2}">
													<li><a><img
															onerror="showImgDelay(this,'<%=basePath%>shyl/images/default/course.jpg');"
															src="<%=basePath%>images/${var.course_path}">
															<h3>${var.course_name}</h3> <span class="time">${var.period}课时${var.course_time}分钟</span></a>
													</li>
												</c:if>
											</ul>
										</c:forEach></li>
								</ul>
							</c:when>
							<c:otherwise>
								<ul>
									<li
										style="height: 10% !important; margin-top: 15px; float: left; margin-left: 45%;color: rgb(255, 106, 0);">
										<span style="font-size: 0.9em;">
											&nbsp;&nbsp;&nbsp;没有相关机构课程信息 </span>
									</li>
								</ul>
							</c:otherwise>
						</c:choose>
					</div>
					<h1>机构师资</h1>
					<input type="hidden" id="teacherlist"
						value="${fn:length(teacherlist)}">
					<div class="jigoushizinew" id="inTeacher" style="height: 20%;">
						<c:choose>
							<c:when test="${not empty teacherlist}">
								<ul class="bxslider_teacher" id="bxslider_teacherlist">
									<li><c:forEach items="${teacherlist}" var="var"
											varStatus="vs">
											<c:if test="${vs.index < 4 }">
												<div>
													<img
														onerror="showImgDelay(this,'<%=basePath%>shyl/images/default/teacher.png');"
														src="<%=basePath%>images/${var.teacher_picture}"><i></i>
													<h3>${var.teacher_name}</h3>
													<span>${var.teacher_level}</span>
													<p>
														毕业院校： ${var.graduate}<br />简介：
														<c:if
															test="${var.experience == null || var.experience == ''}">无</c:if>
														<c:if
															test="${var.experience != null && var.experience != ''}">${var.experience}</c:if>
													</p>
												</div>
											</c:if>
										</c:forEach></li>
									<li style="width: 15%"><c:forEach items="${teacherlist}"
											var="var" varStatus="vs">
											<c:if test="${vs.index> 3 && vs.index <8}">
												<div>
													<img
														onerror="showImgDelay(this,'<%=basePath%>shyl/images/default/teacher.png');"
														src="<%=basePath%>images/${var.teacher_picture}"><i></i>
													<h3>${var.teacher_name}</h3>
													<span>${var.teacher_level}</span>
													<p>
														毕业院校： ${var.graduate}<br />简介：
														<c:if
															test="${var.experience == null || var.experience == ''}">无</c:if>
														<c:if
															test="${var.experience != null && var.experience != ''}">${var.experience}</c:if>
													</p>
												</div>
											</c:if>
										</c:forEach></li>
								</ul>
							</c:when>
							<c:otherwise>
								<ul>
									<li style="width: 500px; height: 10% !important;margin-left: 45%;color: rgb(255, 106, 0);"><span
										style="font-size: 0.9em;"> &nbsp;&nbsp;&nbsp;没有相关机构师资信息
									</span></li>
								</ul>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div class="clear"></div>
	<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
</html>