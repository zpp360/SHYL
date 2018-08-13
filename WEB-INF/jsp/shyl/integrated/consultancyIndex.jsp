<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>咨询服务_济南市服务外包公共服务平台</title>
<jsp:include page="../common/header.jsp">
<jsp:param name="id" value="zxfw" /></jsp:include>
<link href="shyl/css/maincss/rencai.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="<%=basePath%>shyl/css/maincss/jquery.bxslidernew.css" />
<link href="/SHYL/shyl/css/integrated/zxcss.css" rel="stylesheet" type="text/css" />
<link href="/SHYL/shyl/css/integrated/zxsy.css" rel="stylesheet"  type="text/css" />
<link href="shyl/css/maincss/css.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/SHYL/shyl/js/focus.js"></script>
<script type="text/javascript" src="/SHYL/shyl/js/jquery.caroufredsel-6.0.4-packed.js"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="shyl/js/mainjs/box.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/jquery.bxslider.min.js" type="text/javascript"></script>
<style type="text/css">
.advice-tit{ position:relative; text-align:center; height:100px; line-height:100px; font-size:24px; font-family:"微软雅黑";}3
.advice-tit span{ position:absolute; right:20px;}
.w450{width: 450px; margin:0 auto; text-overflow: ellipsis;}
p.zhfw-tit-s {
	width: 720px; 
	display: block; 
 	overflow: hidden; 
  	white-space: nowrap;    
  	text-overflow: ellipsis;  
	}
.zhfw-tit-t { 	
	width: 610px; 
	display: block;
	overflow: hidden;
	float:left;
 	white-space: nowrap;   
 	text-overflow: ellipsis; 
 	}
.zhfw-tit-d { 	
	width: 100px; 
	display: block;
	overflow: hidden;
	float:right;
 	white-space: nowrap;   
 	text-overflow: ellipsis; 
 	}
.zhfw-tit-rlzy-t{
	color:#fff;
	display: block;
 	width: 260px; 
 	overflow: hidden;  
 	white-space: nowrap;   
 	text-overflow: ellipsis; 
	}
.zhfw-tit-zscq-t{
	color:#fff;
	display: block;
 	width: 400px; 
 	overflow: hidden;  
 	white-space: nowrap;   
 	text-overflow: ellipsis; 
	}
p.zhfw-tit {
	display: block;
 	width: 260px; 
 	overflow: hidden;  
 	white-space: nowrap;   
 	text-overflow: ellipsis; 
	}
.zhfw-name{
 	padding:0 10px;
 	overflow: hidden; 
 	white-space: nowrap;  
	text-overflow: ellipsis;
 }
 .zhfw-name-c{
 	padding:0 10px;
    color: #ff9900;
 	float:left;
 	width: 150px;
 	overflow: hidden; 
 	white-space: nowrap;  
	text-overflow: ellipsis;
	font-size: 14px;
 }
 .zhfw-name-x{
    color: #ff9900;
 	padding:0 0px;
 	float:right;
 	width: 50px;
 	overflow: hidden; 
 	white-space: nowrap;  
	text-overflow: ellipsis;
	font-size: 14px;
 }
 .zhfw-name-s{
 	padding:0 10px;
 }
.zhfw-name a{ color:#ff9900; text-decoration:underline; font-size:14px;}
.zhfw-name span a{ float:right; text-decoration:none;}
/*数字按钮样式*/
.num { overflow:hidden; height: 25px; position: absolute; bottom:12px; left: 50%; zoom:1; z-index:3; }
.num li { width: 8px; height: 8px; line-height: 20px; text-align: center; font-weight: 400; font-family: Arial; color: #FFFFFF; background: #fff; margin-right: 10px; border: 3px solid #fff; border-radius:50%; cursor:pointer; float: left;font-size: 0.75em;text-indent: -9999px; }
.num li.on { background: #7f9bdc; }
</style>

</head>
<body style="background: #f7f7f7;">
	<div class="clear"></div>
	<!--banner-->
	<div>
		<div class="banner_show" id="banner_show">
		<input type="hidden" name="number" id="number" value="${num.num}"/>
			<ul class="b2">
			<c:choose>
	        <c:when test="${not empty bannerList}">
	    		
	    		<c:forEach items="${bannerList}" var="banner" varStatus="vs">
	    			<li><a  target="_blank" class="bannger_inbox"><img src="<%=basePath%>images/${banner.file_path}" style="width:1920px;height:430px"></a></li>
	    		</c:forEach>
	    	</c:when>
	    	<c:otherwise>
				<li>
					<a  target="_blank" class="bannger_inbox"> 
						<img src="<%=basePath%>shyl/images/banner/banner14.jpg" width="1920" height="430" />
					</a> 
				</li>
				<li>
					<a  target="_blank" class="bannger_inbox">
						<img src="<%=basePath%>shyl/images/banner/banner15.jpg" width="1920" height="430" />
					</a> 
				</li>
				<li>
					<a  target="_blank" class="bannger_inbox"> 
						<img src="<%=basePath%>shyl/images/banner/banner16.jpg" width="1920" height="430" />
					</a>
				</li>
				</c:otherwise>
			</c:choose>
			</ul>
			<div class="num">
				<ul>
				</ul>                                                                                                                                                                                                                                    
			</div>
	</div>
	<script>
	var number = $('#number').val();
	var width_banner = '';
	if(number == 0){
		width_banner = -3*10;
	}else{
		width_banner = -number*10;
	}
	$('.num').css("margin-left",width_banner);
	$(".banner_show").slide({ titCell:".num ul" , mainCell:".b2" , effect:"fold", autoPlay:true, delayTime:500 , autoPage:true });
	</script>
	</div>
	<!--content-->·
	<div class="w1200 advice-top">
		<div class="advice-tit">
			-&nbsp;展会服务&nbsp;-<span><a
				href="<%=basePath%>consultancy/consultancyList.act?TYPE=3">MORE</a></span>
		</div>
		<input type="hidden" id="consultancy_listSize" value="${fn:length(zhfwList)}"/>
		<div class="zhfw-list" >
				<!-- 开始循环 -->
				<c:choose>
					<c:when test="${not empty zhfwList}">
					<ul class="bxslider_course" id="consultancy">
						<li>
						<c:forEach items="${zhfwList}" var="var" varStatus="vs">
							<c:if test="${vs.index < 4}">
								<div style="float:left;height:295px;width:270px;margin-left: 13px;margin-right: 13px;border: 1px solid #e3e3e3;background: #fff;">
										<a>
											<c:if test="${var.LOGO == '' || var.LOGO == null}">
												<img src="<%=basePath%>shyl/images/mylogo.jpg"  />
											</c:if>
											<c:if test="${var.LOGO != '' && var.LOGO != null}">
												<img onerror="showImgDelay(this,'<%=basePath%>shyl/images/mylogo.jpg');" src="<%=basePath%>images/${var.LOGO}"/>
											</c:if>
										</a>
										<p class="zhfw-tit" style="padding: 10px 10px;" title="${var.TITLE}">
											${var.TITLE}
										</p>
										<p class="zhfw-nr" style="padding: 10px 10px;height:40px">
											${var.CONTENT}
										</p>
										<p> <a class="zhfw-name-c" 
												href="<%=basePath%>company/info.act?companyId=${var.COMPANY_ID}"
												target="_blank" title="${var.COMPANY_NAME}">${var.COMPANY_NAME}</a>
											<span><a class="zhfw-name-x" 
												href="<%=basePath%>consultancy/consultancyDetail.act?id=${var.ID}">详情>></a></span>
										</p>
								</div>
							</c:if>
						</c:forEach>
						</li>
						<li>
						<c:forEach items="${zhfwList}" var="var" varStatus="vs">
							<c:if test="${vs.index < 8 && vs.index > 3}">
								<div class="zhfw-list"  style="float:left;height:295px;width:270px;margin-left: 13px;margin-right: 13px;border: 1px solid #e3e3e3;background: #fff;">
										<a><c:if test="${var.LOGO == '' || var.LOGO == null}">
												<img src="<%=basePath%>shyl/images/mylogo.jpg"  />
											</c:if> <c:if test="${var.LOGO != '' && var.LOGO != null}">
												<img onerror="showImgDelay(this,'<%=basePath%>shyl/images/mylogo.jpg');" src="<%=basePath%>images/${var.LOGO}"/>
											</c:if></a>
											<p class="zhfw-tit" style="padding: 10px 10px;">
												${var.TITLE}
											</p>
											<p class="zhfw-nr" style="padding: 10px 10px;height:40px">
												${var.CONTENT}
											</p>
											<p> <a class="zhfw-name-c" 
													href="<%=basePath%>company/info.act?companyId=${var.COMPANY_ID}"
													target="_blank" title="${var.COMPANY_NAME}">${var.COMPANY_NAME}</a>
												<span><a class="zhfw-name-x"
													href="<%=basePath%>consultancy/consultancyDetail.act?id=${var.ID}">详情>></a></span>
											</p>
								</div>
							</c:if>
						</c:forEach>
						</li>
					</ul>
					</c:when>
					<c:otherwise>
						<p style="width: 200px;color: #ff9900; padding-left: 30px; text-align: left;">没有相关数据</p>
					</c:otherwise>
				</c:choose>
		</div>
	</div>
	<div class="clear"></div>
	<!--中间信息-->
	<div class="advice-content">
		<div class="w1200">
			<div class="advice-content-left">
				<div class="widget-toolbar">
					<ul id="recent-tab">
						<li class="active" id="li_1" onclick="cutTab('1');">招商信息发布</li>
						<li id="li_2" onclick="cutTab('2');">一般商务服务</li>
						<li id="li_3" onclick="cutTab('3');">法律</li>
						<li id="li_4" onclick="cutTab('4');">知识产权</li>
					</ul>
					<div class="clear"></div>
				</div>
				<div id="div_1">
					<div class="gd">
						<a href="<%=basePath%>consultancy/consultancyList.act?TYPE=5">【更多】</a>
					</div>
					<ul>
						<!-- 开始循环 -->
						<c:choose>
							<c:when test="${not empty zsxxList}">
								<c:forEach items="${zsxxList}" var="var" varStatus="vs">
									<c:if test="${vs.index < 4}">
										<li style="list-style:none;">
											<p class="zhfw-tit-s">
												<b class="zhfw-tit-t">${var.TITLE}</b>
												<span class="zhfw-tit-d"><img src="<%=basePath%>shyl/images/time.png" />${var.UPDATE_DATE}</span>
											</p>
											<p class="zhfw-name">
												<a class="zhfw-tit-t"
													href="<%=basePath%>company/info.act?companyId=${var.COMPANY_ID}"
													target="_blank" title="${var.COMPANY_NAME}">${var.COMPANY_NAME}</a>
												<span class="zhfw-tit-d"><a
													href="<%=basePath%>consultancy/consultancyDetail.act?id=${var.ID}">详情>></a></span>
											</p>
										</li>
									</c:if>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<p style="width: 200px;color: #ff9900; padding-left: 30px; text-align: left;">没有相关数据</p>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<div id="div_2" style="display: none">
					<div class="gd">
						<a href="<%=basePath%>consultancy/consultancyList.act?TYPE=4">【更多】</a>
					</div>
					<ul>
						<!-- 开始循环 -->
						<c:choose>
							<c:when test="${not empty ybswList}">
								<c:forEach items="${ybswList}" var="var" varStatus="vs">
									<c:if test="${vs.index < 4}">
										<li style="list-style:none;">
											<p class="zhfw-tit-s">
												<b class="zhfw-tit-t">${var.TITLE}</b> 
												<span class="zhfw-tit-d"><img	src="<%=basePath%>shyl/images/time.png" />${var.UPDATE_DATE}</span>
											</p>
											<p class="zhfw-name">
												<a class="zhfw-tit-t"
													href="<%=basePath%>company/info.act?companyId=${var.COMPANY_ID}"
													target="_blank" title="${var.COMPANY_NAME}">${var.COMPANY_NAME}</a>
												<span class="zhfw-tit-d"><a
													href="<%=basePath%>consultancy/consultancyDetail.act?id=${var.ID}">详情>></a></span>
											</p>
										</li>
									</c:if>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<p style="width: 200px;color: #ff9900; padding-left: 30px; text-align: left;">没有相关数据</p>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<div id="div_3" style="display: none">
					<div class="gd">
						<a href="<%=basePath%>consultancy/consultancyList.act?TYPE=0">【更多】</a>
					</div>
					<ul>
						<!-- 开始循环 -->
						<c:choose>
							<c:when test="${not empty flList}">
								<c:forEach items="${flList}" var="var" varStatus="vs">
									<c:if test="${vs.index < 4}">
										<li style="list-style:none;">
											<p class="zhfw-tit-s">
												<b class="zhfw-tit-t">${var.TITLE}</b> 
												<span class="zhfw-tit-d"><img	src="<%=basePath%>shyl/images/time.png" />${var.UPDATE_DATE}</span>
											</p>
											<p class="zhfw-name">
												<a class="zhfw-tit-t"
													href="<%=basePath%>company/info.act?companyId=${var.COMPANY_ID}"
													target="_blank" title="${var.COMPANY_NAME}">${var.COMPANY_NAME}</a>
												<span class="zhfw-tit-d"><a
													href="<%=basePath%>consultancy/consultancyDetail.act?id=${var.ID}">详情>></a></span>
											</p>
										</li>
									</c:if>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<p style="width: 200px;color: #ff9900; padding-left: 30px; text-align: left;">没有相关数据</p>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<div id="div_4" style="display: none">
					<div class="gd">
						<a href="<%=basePath%>consultancy/consultancyList.act?TYPE=0">【更多】</a>
					</div>
					<ul>
						<!-- 开始循环 -->
						<c:choose>
							<c:when test="${not empty zscqList}">
								<c:forEach items="${zscqList}" var="var" varStatus="vs">
									<c:if test="${vs.index < 4}">
										<li style="list-style:none;">
											<p class="zhfw-tit-s">
												<b class="zhfw-tit-t">${var.TITLE}</b> 
												<span class="zhfw-tit-d"><img	src="<%=basePath%>shyl/images/time.png" />${var.UPDATE_DATE}</span>
											</p>
											<p class="zhfw-name">
												<a class="zhfw-tit-t"
													href="<%=basePath%>company/info.act?companyId=${var.COMPANY_ID}"
													target="_blank" title="${var.COMPANY_NAME}">${var.COMPANY_NAME}</a>
												<span class="zhfw-tit-d"><a
													href="<%=basePath%>consultancy/consultancyDetail.act?id=${var.ID}">详情>></a></span>
											</p>
										</li>
									</c:if>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<p style="width: 200px;color: #ff9900; padding-left: 30px; text-align: left;">没有相关数据</p>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
			<div class="advice-content-right">
				<p class="rlzy-tit">
					人力资源<span><a
						href="<%=basePath%>consultancy/consultancyList.act?TYPE=2">了解更多>></a></span>
				</p>
				<ul class="rlzy-list">
					<!-- 开始循环 -->
					<c:choose>
						<c:when test="${not empty rlzyList}">
							<c:forEach items="${rlzyList}" var="var" varStatus="vs">
								<c:if test="${vs.index < 3}">
									<li>
										<p>
											<a class="zhfw-tit-rlzy-t" href="<%=basePath%>consultancy/consultancyDetail.act?id=${var.ID}">${var.TITLE}</a>
										</p >
										<p><a
                                        href="<%=basePath%>company/info.act?companyId=${var.COMPANY_ID}"
                                        target="_blank" title="${var.COMPANY_NAME}">${var.COMPANY_NAME}</a></p>
									</li>
								</c:if>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<p style="width: 200px;color: #ff9900; padding-left: 30px; text-align: left;">没有相关数据</p>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<div class="w1200 advice-bottom" >
	<div class="advice-tit" style="height: 80px">
		-&nbsp;科技创新劵&nbsp;-<span><a
			href="<%=basePath%>consultancy/consultancyList.act?TYPE=7">MORE</a></span>
	</div>
		<input type="hidden" id="zscq_listSize" value="${fn:length(kjcxList)}"/>
			<!-- 开始循环 -->
			<ul class="bxslider_course" id = "zscq" style="right:65px;width:1200px;">
			<c:choose>
				<c:when test="${not empty kjcxList}">
					<li style="height:270px;padding:15px;">
					<c:forEach items="${kjcxList}" var="var" varStatus="vs">
						<c:if test="${vs.index < 4}">
						<div class="w450" style="border:1px solid #e3e3e3; background:#fff; width:520px;padding:10px 15px 10px 40px; float:left; margin:10px;">
							<c:if test="${var.LOGO == '' || var.LOGO == null}">
									<img src="<%=basePath%>shyl/images/mylogo.jpg" />
								</c:if> <c:if test="${var.LOGO != '' && var.LOGO != null}">
									<img
										onerror="showImgDelay(this,'<%=basePath%>shyl/images/mylogo.jpg');" src="<%=basePath%>images/${var.LOGO}" />
								</c:if>
								<p class="zscq-nr">
									<a style="color:#0a7295;" class="zhfw-tit-zscq-t" href="<%=basePath%>consultancy/consultancyDetail.act?id=${var.ID}">${var.TITLE}</a>
								</p>
								<p class="zhfw-name">
									<a
										href="<%=basePath%>company/info.act?companyId=${var.COMPANY_ID}"
										target="_blank" title="${var.COMPANY_NAME}">${var.COMPANY_NAME}</a>
								</p>
							</div>
						</c:if>
					</c:forEach>
					</li>
					<li style="height:270px;padding:15px;">		
					<c:forEach items="${kjcxList}" var="var" varStatus="vs">
						<c:if test="${vs.index < 8 && vs.index > 3}">
						<div class="w450" style="border:1px solid #e3e3e3; background:#fff; width:520px;padding:10px 15px 10px 40px; float:left; margin:10px;">
							<c:if test="${var.LOGO == '' || var.LOGO == null}">
									<img src="<%=basePath%>shyl/images/mylogo.jpg" />
							</c:if> <c:if test="${var.LOGO != '' && var.LOGO != null}">
									<img
										onerror="showImgDelay(this,'<%=basePath%>shyl/images/mylogo.jpg');" src="<%=basePath%>images/${var.LOGO}" />
								</c:if>
								<p class="zscq-nr">
									<a style="color:#0a7295;" class="zhfw-tit-zscq-t" href="<%=basePath%>consultancy/consultancyDetail.act?id=${var.ID}">${var.TITLE}</a>
								</p>
								<p class="zhfw-name">
									<a
										href="<%=basePath%>company/info.act?companyId=${var.COMPANY_ID}"
										target="_blank" title="${var.COMPANY_NAME}">${var.COMPANY_NAME}</a>
								</p>
							</div>
						</c:if>
					</c:forEach>
					</li>
				</c:when>
				<c:otherwise>
					<p style="width: 200px;color: #ff9900; padding-left: 30px; text-align: left;">没有相关数据</p>
				</c:otherwise>
			</c:choose>
			</li>
			</ul>
	</div>
	<script>
		//切换菜单
		function cutTab(type) {
			$("#li_1").attr('class', '');
			$("#li_2").attr('class', '');
			$("#li_3").attr('class', '');
			$("#li_4").attr('class', '');
			$('#li_' + type).addClass('active');
			$("#div_1").hide();
			$("#div_2").hide();
			$("#div_3").hide();
			$("#div_4").hide();
			$('#div_' + type).show();
		}
		$(document).ready(function() {
			// 展会服务list
			var consultancylistSize = $("#consultancy_listSize").val();
			// 展会服务list
			var zscqlistSize = $("#zscq_listSize").val();
			// 移动判断
			if (consultancylistSize > 4) {
				$("#consultancy").bxSlider({auto: true});
			} else {
				 $("#consultancy").bxSlider({auto: false});
			}
			// 移动判断
			if (zscqlistSize > 4) {
				$("#zscq").bxSlider({auto: true});
			} else {
				 $("#zscq").bxSlider({auto: false});
			}
		});
	</script>
	 <!--<footer开始>-->
    <jsp:include page="../common/footer.jsp"></jsp:include>
    <!--</footer结束>-->
</body>
</html>
