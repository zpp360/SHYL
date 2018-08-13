<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String localPath = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ localPath + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
<base href="<%=basePath%>">
<title>${schoolpd.school_name}_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link href="shyl/css/maincss/css.css" rel="stylesheet" type="text/css">
<link href="shyl/css/maincss/rencai.css" rel="stylesheet"
	type="text/css">
<script src="shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<jsp:include page="../../common/header.jsp"></jsp:include>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js"
	type="text/javascript"></script>
<script src="shyl/js/mainjs/box.js" type="text/javascript"></script>

<style type="text/css">
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

</head>
<body>
	<!--<header开始>-->
	<!--</header结束>-->
	<div class="clear"></div>
	<div class="rc_paihang clearfix">
		<div class="rc_content2">
			<div class="rc_content2_1">
				<div class="sjt">
					<img
						onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');"
						src="<%=basePath%>images/${schoolpd.representative_building}"
						style="width: 170px; height: 105px;">
				</div>
				<div class="img">
					<img
						onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');"
						src="<%=basePath%>images/${schoolpd.school_log}"
						style="width: 118px; height: 110px;">
				</div>
				<div class="xqp" style="margin-top: 25px;">
					<h1>${schoolpd.school_name}</h1>
					<sub>${schoolpd.school_nameen}</sub>
					<!-- <span>测评结果：优</span> -->
				</div>
			</div>
			<div class="rc_content2_2">
				<ul class="am">
					<li><span>创建时间<i>${schoolpd.creation_time}</i></span> <span
						class="r">重点学科<i>${schoolpd.key_subjects }个</i></span></li>
					<li><span>隶属于<i>${schoolpd.belonging1}</i></span> <span
						class="r">学校类型<i>${schoolpd.school_type1}</i></span></li>
					<li><span>学生人数<i>${schoolpd.student_num}人以上</i></span> <span
						class="r">博士点个数<i>${schoolpd.doctor_num}个</i></span></li>
					<li><span>院士人数<i>${schoolpd.academician_num}人</i></span> <span
						class="r">硕士点个数<i>${schoolpd.master_num}个</i></span></li>
				</ul>
				<c:if
					test='${schoolpd.school_detail!=null&&schoolpd.school_detail!=""}'>
					<h1>院校介绍</h1>
					<div class="cc" style="word-wrap: break-word; word-break: normal;">
						<pre>${schoolpd.school_detail}</pre> 
					</div>
				</c:if>
				<h1>校园状况</h1>
				<c:choose>
					<c:when test="${not empty schoolpitcureList}">
						<div class="scrollBox a">
							<div class="ohbox">
								<ul class="piclist">
									<c:forEach items="${schoolpitcureList}" var="var"
										varStatus="vs">
										<li><img
											onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');"
											onclick="showOriginalPhoto('<%=basePath%>','${var.file_path}');"
											src="<%=basePath%>images/${var.file_path}"
											style="width: 100%; height: 100%;" /></li>
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
						<div class="rc_qy_2">&nbsp;&nbsp;&nbsp;没有相关校园图片</div>
					</c:otherwise>
				</c:choose>
				<script id="jsID" type="text/javascript">
					$(".a").hover(function() {
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

					jQuery(".a").slide({
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
				<c:if test="${fn:length(selectnum)>0}">
					<h1>毕业生情况</h1>
				</c:if>
				<div class="bysqk">
					<c:forEach items="${pList}" var="vp" varStatus="vs">
						<dl>
							<dt>■ ${vp.professional_school}</dt>
							<c:forEach items="${map}" var="maps">
								<c:if test="${maps.key==vp.school_id}">
									<c:forEach items="${maps.value}" var="c">
										<dd>${c.profession}（${c.num}）</dd>
									</c:forEach>
								</c:if>
							</c:forEach>
						</dl>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="rc_cate2">
			<p>
				所处城市：${schoolpd.address_city1}<br /> 学校地址：
				${schoolpd.address_detail}<br /> 校招电话： ${schoolpd.contact_tel }<br />
				电子邮箱：${schoolpd.mail }
				<c:if test='${schoolpd.website!=null&&schoolpd.website!=""}'>
					<a href="${schoolpd.website}" target="_blank">进入官网</a>
				</c:if>
			</p>
		</div>
	</div>

	<div class="clear"></div>
	<!--<footer开始>-->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!--</footer结束>-->
</body>
<script type="text/javascript">
	//显示图片处理1
	function showOriginalPhoto(pathbas, path) {
		if (path.indexOf("shyl/images/mylogo.jpg") < 0) {
			var newwin = window.open();
			newwin.document
					.write("<div align='center'><img src='"+pathbas+"images/"+path+"'/></div>");
		}
	}
</script>
</html>