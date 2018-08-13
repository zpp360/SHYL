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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<title>济南市服务外包公共服务平台</title>
<meta http-equiv="”X-UA-Compatible”" content="”IE=EmulateIE7″">
<!-- <style type="text/css">
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
</style> -->

<jsp:include page="common/header.jsp"></jsp:include>
<script src="/SHYL/shyl/js/mainjs/jquery.bxslider.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="<%=basePath%>shyl/css/maincss/jquery.bxslider.css" />
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$(".flexslider").flexslider();
		$("div#notice").myScroll({
			speed : 40,
			rowHeight : 25
		});
		$(".bxslider").bxSlider();
	});
	(function($) {
		$.fn.myScroll = function(options) {
			//默认配置
			var defaults = {
				speed : 40, //滚动速度,值越大速度越慢
				rowHeight : 24
			//每行的高度
			};
			var opts = $.extend({}, defaults, options), intId = [];

			function marquee(obj, step) {
				obj.find("ul").animate({
					marginTop : '-=1'
				}, 0, function() {
					var s = Math.abs(parseInt($(this).css("margin-top")));
					if (s >= step) {
						$(this).find("li").slice(0, 1).appendTo($(this));
						$(this).css("margin-top", 0);
					}
				});
			}

			this
					.each(function(i) {
						var sh = opts["rowHeight"], speed = opts["speed"], _this = $(this);
						intId[i] = setInterval(function() {
							if (_this.find("ul").height() <= _this.height()) {
								clearInterval(intId[i]);
							} else {
								marquee(_this, sh);
							}
						}, speed);

						_this.hover(function() {
							clearInterval(intId[i]);
						}, function() {
							intId[i] = setInterval(
									function() {
										if (_this.find("ul").height() <= _this
												.height()) {
											clearInterval(intId[i]);
										} else {
											marquee(_this, sh);
										}
									}, speed);
						});

					});

		}

	})(jQuery);
</script>
</head>
<body>
	<div class="clear"></div>
	<div id="main">
		<div class="flexslider">
			<ul class="slides">
				<li><a href="<%=basePath%>platform/about/aboutPlatformInfo.act?TYPE=0" target="_blank"><img
					src="<%=basePath%>shyl/images/banner/banner11.jpg" alt="" /></a>
					</li>
				<li><a href="<%=basePath%>joblist/toTalentChannel.act" target="_blank"><img
					src="<%=basePath%>shyl/images/banner/banner12.jpg" alt="" /></a>
					</li>
				<li><a href="<%=basePath%>institution/institutionIndex.act" target="_blank"><img
					src="<%=basePath%>shyl/images/banner/banner13.jpg" alt="" /></a>
					</li>
			</ul>
		</div>
	</div>
	<div class="da" style="width: 1200px; margin: 0 auto;">
		<section style="width: 1200px;">
		<a href="<%=basePath%>platform/policy/policyList.act">
		<div class="tu">
			<span>关于服务外包行业发展、产业建设、人才支持的分析</span>
		</div></a>
		<a href="<%=basePath%>joblist/tolist.act">
		<div class="tu2">
			<span>只为简化人才管理丰富人才服务</span>
			<div class="clear"></div>
			<p>入口简单方便，多服务轻松集成</p>
		</div>
		</a>
		<a href="<%=basePath%>evaluation/evaluationIndex.act">
		<div class="tu3">
			<span>人才自评<br>人才自评，自我评价更轻松 </span>
		</div>
		</a>
		<div class="clear"></div>
		<div class="new" id="ddddd">
			<div class="new_top">
				<ul>
					<li class="t"><span>POLICY</span>
						<p>行业信息</p></li>
					<li class="w"><span>FOCUS</span>
						<p>专题聚焦</p></li>
					<li class="s"><span>TRAIN
					</span>
						<p>培训</p></li>
				</ul>
			</div>
			<div class="we">
				<ul>
					<c:forEach items="${policieList}" var="var" varStatus="vs">
						<li><a
							href="<%=basePath%>platform/policy/policyDetail.act?policies_id=${var.POLICIES_ID}&category=${var.CATEGORY}&flag=${var.CATEGORY}"
							target="">
							<p>${var.UPDATE_TIMESTAMP}</p>
							<div class="n-tit" id="test">${var.TITLE}</div>
							</a>
							</li>
					</c:forEach>
				</ul>
				<a class="liuao" href="<%=basePath%>platform/policy/policyList.act"><span>了解更多</span></a>
			</div>
			<div class="v_out v_out_p">
				<div class="v_show">
						<ul class="bxslider">
							<c:forEach items="${spotlightList}" var="var" varStatus="vs">
								<a href="<%=basePath%>platform/news/newsDetail.act?NEWS_ID=${var.NEWS_ID}&CATEGORY=1&category=&types=1&typeflag=2">
								<li index="${vs.index}" class="yi" onclick="">
								<img style="width: 119px;height: 78px;" src="<%=basePath%>images/${var.NEWS_THUMBNAIL}" onerror="showImgDelay(this,'<%=basePath%>shyl/images/xiao_11.png');"/>
								<span>${var.TITLE}</span>
								<c:choose>
								<c:when test="${fn:length(var.NEWS_CONTENT)>0}">
								<p>${fn:substring(var.NEWS_CONTENT,0,40)}...</p>
								</c:when>
								</c:choose>
								</li>
								</a>
							</c:forEach>
						</ul>
				</div>
				<a class="liuao1" href="<%=basePath%>platform/news/noticeList.act?CATEGORY=1"><span>了解更多</span></a>
			</div>

			<div class="peixun">
			<a href="<%=basePath%>institution/institutionlist.act">
				<img src="<%=basePath%>shyl/images/xun_17.png">
					<div class="clear"></div><span style="color:#666666;">完整的培训体系，全面提升你的能力</span>
			</div>
			</a>
		</div>

		<div class="zuigao">
			<span>最新关注</span>
			<p>随时掌控第一手资讯内容</p>
		</div>
		<div class="xx">
			<div class="a_left">
				<img src="<%=basePath%>shyl/images/a1_15.png">
			</div>
			<div class="a_right">
			<a href="<%=basePath%>platform/news/noticeList.act?CATEGORY=2">
				<img src="<%=basePath%>shyl/images/a5_15.png"></a>
			</div>
			<a href="<%=basePath%>platform/news/noticeList.act?CATEGORY=2"><span class="sp">平台新闻</span></a>
			<div class="clear"></div>
			<div class="xian"></div>

			<c:forEach items="${platformNewsList}" var="var" varStatus="vs">
				<c:if test="${vs.index==0}">
					<div class="ds">
						<a href="<%=basePath%>platform/news/noticeList.act?CATEGORY=2">
							<img src="<%=basePath%>images/${var.NEWS_THUMBNAIL}" width="146"
							onerror="showImgDelay(this,'<%=basePath%>shyl/images/eee_21.png');"
							style="width: 146px; height: 101px;">
						</a>
					</div>
					<a
						href="<%=basePath%>platform/news/newsDetail.act?NEWS_ID=${var.NEWS_ID}&CATEGORY=2&category=&types=2&typeflag=2">
						<div class="oi">
							<span style="">${fn:substring(var.TITLE, 0, 20)}...</span><input
								type="hidden" value="${fn:length(var.NEWS_CONTENT)}"> <c:choose>
									<c:when test="${fn:length(var.NEWS_CONTENT)> 0}">
										<p>${fn:substring(var.NEWS_CONTENT, 0, 30)}...</p>
									</c:when>
									<c:otherwise>
										<div class="detaildiv"
											style="display: inline-block; height: 43px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;">
											${var.NEWS_CONTENT}</div>
									</c:otherwise>
								</c:choose>
						</div>
					</a>
					<div class="shijian">
						<a href="#">${var.UPDATE_TIMESTAMP}</a>
					</div>

				</c:if>
				<c:if test="${vs.index>0}">
				<div class="clear"></div>
				<div class="xv"></div>
				<div class="xinwen">
						<ul>
							<li><a
								href="<%=basePath%>platform/news/newsDetail.act?NEWS_ID=${var.NEWS_ID}&CATEGORY=2&category=&types=2&typeflag=2">
									<p>${var.UPDATE_TIMESTAMP}</p>
									<div class="n-tit" style="margin-left: 4px; color: #333333;">${var.TITLE}</div>
							</a></li>

						</ul>
					</div>
				</c:if>
			</c:forEach>
			<div class="clear"></div>
			<div class="xv"></div>
		</div>

		<div class="yw">
			<div class="a_left">
				<img src="<%=basePath%>shyl/images/a2_17.png">
			</div>
			<div class="a_right">
				<a href="<%=basePath%>platform/news/noticeList.act?CATEGORY=3">
				<img src="<%=basePath%>shyl/images/a5_15.png"></a>
			</div>
			<a href="<%=basePath%>platform/news/noticeList.act?CATEGORY=3"><span class="sp">要闻快递</span></a>
			<div class="clear"></div>
			<div class="xian"></div>
			<div class="clear"></div>
			<div class="xinwen1">
				<ul>
					<c:forEach items="${newsdeLiveryList}" var="var" varStatus="vs">
						<li>
						<a href="<%=basePath%>platform/news/newsDetail.act?NEWS_ID=${var.NEWS_ID}&CATEGORY=3&category=&types=3&typeflag=2" >
						<p>${var.UPDATE_TIMESTAMP}</p>
						<div class="n-tit" id="ywkd" style="margin-left:4px;">${var.TITLE}</div>
						</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="clear"></div>

		</div>


		<div class="xx2">
			<div class="a_left">
				<img src="<%=basePath%>shyl/images/a3_20.png">
			</div>
			<div class="a_right">
				<a href="<%=basePath%>platform/news/noticeList.act?CATEGORY=0">
				<img src="<%=basePath%>shyl/images/a5_15.png"></a>
			</div>
			<a href="<%=basePath%>platform/news/noticeList.act?CATEGORY=0"><span class="sp">平台公告</span></a>
			<div class="clear"></div>
			<div class="xian"></div>
			<div class="clear"></div>
			<div class="aqs">
				<a href="<%=basePath%>platform/news/noticeList.act?CATEGORY=0">
				<c:if test="${ptgg != null and ptgg != ''}">
					<img src="<%=basePath%>images/${ptgg.file_path}" style="margin-bottom:5px;width:390px;height:105px;">
				</c:if>
				<c:if test="${ptgg == null or ptgg == ''}">
					<img src="<%=basePath%>shyl/images/a6_18.png" style="margin-bottom:5px">
				</c:if>
				</a>
				<div class="aqs" id="notice" style="margin-top:10px;height:135px;overflow: hidden;">
				<ul>
					<c:forEach items="${noticeList}" var="var" varStatus="vs">
						<li>
						<a href="<%=basePath%>platform/news/newsDetail.act?NEWS_ID=${var.NEWS_ID}&CATEGORY=0&category=&types=0&typeflag=2">
						<p style="float: right;font-size:0.8em">${var.UPDATE_TIMESTAMP}</p>
						<div class="n-tit" id="ywkd" style="margin-left:4px;">${var.TITLE}</div></a>
						</li>
					</c:forEach>
				</ul>
				</div>
			</div>

		</div>
		<div class="clear"></div>

		<div class="clear"></div>
		<div class="kuang">
			<div class="sk">
				<a href="<%=basePath%>platform/news/noticeList.act?CATEGORY="><span>企业新闻</span></a>
			</div>
			<div class="geng">
				<a href="<%=basePath%>platform/news/noticeList.act?CATEGORY=">更多</a>
			</div>
			<div class="clear"></div>
			<div class="bn">
				<ul>
					<c:forEach items="${companyList}" var="var" varStatus="vs">
						<li><span></span><a href="<%=basePath%>platform/news/companyNewsDetail.act?companyId=${var.COMPANY_ID}&id=${var.ID}&types=&typeflag=3" class="n-tit">${var.TITLE}</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		</section>
	</div>
<jsp:include page="common/footer.jsp"></jsp:include>
	<script type="text/javascript">
		
	</script>
	<%-- <div class="side-bar"> 
		<a href="#" class="icon-chat" style="background-image:url(<%=basePath%>shyl/images/icon/ios.png);background-repeat: no-repeat;background-position: center;">苹果<div class="chat-tips"><i></i><img style="width:138px;height:138px;" src="<%=basePath%>shyl/images/icon/iosQRcode.png" alt="苹果"></div></a> 
		<a href="#" class="icon-chat" style="background-image:url(<%=basePath%>shyl/images/icon/android.png);background-repeat: no-repeat;background-position: center;">安卓<div class="chat-tips"><i></i><img style="width:138px;height:138px;" src="<%=basePath%>shyl/images/icon/androidQRcode.png" alt="安卓"></div></a>
	</div> --%>
</body>
</html>