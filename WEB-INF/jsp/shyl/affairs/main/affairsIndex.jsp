<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv=”X-UA-Compatible” content=”IE=EmulateIE7″ />
<meta charset="utf-8">
<title>政务通道_济南市服务外包公共服务平台</title>
<jsp:include page="../../common/header.jsp"></jsp:include>
<script src="/SHYL/shyl/js/affairs/box.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".nav ul li a").removeClass("hover");
	$(".nav ul li:first a").addClass("hover");
});
</script>
</head>
<body>
<!--<banner开始>-->
<div class="clear"></div>
<div class="cmain bf9 clearfix" style="padding-bottom: 20px;">
	<div class="cml_1 w01">
			<div class="cml_cc">
				<div class="dnews_l" style="height: 320px; overflow: hidden;">
					<h1>
						<a href="<%=basePath%>platform/policy/policyList.act?category=2"
							style="float: right; font-size: 0.85em; color: #333333; margin-top: 5px;">更多</a><i><span style="border-left: 5px solid #3d68ce; line-height: 20px;height: 20px;margin-top: 10px;float: left;padding-left: 15px;">济南市行业信息</span></i>

					</h1>
					<ul>
						<li class="dnews_l_img" style="margin-bottom:-3px">
						<c:if test="${jnzc != null and jnzc != ''}">
							<img src="<%=basePath%>images/${jnzc.file_path}" style="width:92px;">
						</c:if>
						<c:if test="${jnzc == null or jnzc == ''}">
							<img src="<%=basePath%>shyl/images/affairs/ceshi3.jpg">
						</c:if>
						
								<div class="dnews_l_img_r">
									<c:forEach items="${cityPolicyList}" var="citydata"
										varStatus="vs">
										<c:if test="${vs.index == 0}">
											<a
												href="<%=basePath%>platform/policy/policyDetail.act?policies_id=${citydata.POLICIES_ID}&category=2&flag=2"
												class="n_h">${citydata.TITLE}</a>
										</c:if>
									</c:forEach>
								</div></li>

						<c:forEach items="${cityPolicyList}" var="citydata" varStatus="vs">
							<c:if test="${vs.index != 0 && vs.index<6}">
								<li><a
									href="<%=basePath%>platform/policy/policyDetail.act?policies_id=${citydata.POLICIES_ID}&category=2&flag=2"><span>${citydata.UPDATE_TIMESTAMP}</span>
									<div class="policy" title="${citydata.TITLE}">${citydata.TITLE}</div></a></li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
				<div class="cml_4">
					<div class="banner">
					<input type="hidden" name="number" id="number" value="${num.num}"/>
					    <ul class="b2" style="margin-left:30px;">
					    	<c:choose>
					        <c:when test="${not empty bannerList}">
					    		
					    		<c:forEach items="${bannerList}" var="banner" varStatus="vs">
					    			<li><a href="" title="" target=""><img src="<%=basePath%>images/${banner.file_path}" style="height:319px;"></a></li>
					    		</c:forEach>
					    	</c:when>
					    	<c:otherwise>
						        <li><a  title="" target=""><img src="<%=basePath%>shyl/images/affairs/banner.jpg"></a></li>
						        <li><a  title="" target=""><img src="<%=basePath%>shyl/images/affairs/banner2.jpg"></a></li>
						        <li><a  title="" target=""><img src="<%=basePath%>shyl/images/affairs/banner3.jpg"></a></li>
					    	</c:otherwise>
					    	</c:choose>
					    </ul>
						<div class="num">
							<ul>
							</ul>
						</div>
					</div>
					<script>
					/*鼠标移过，左右按钮显示*/
					var number = $('#number').val();
					var width_banner = '';
					if(number == 0){
						width_banner = -3*10;
					}else{
						width_banner = -number*10;
					}
					$('.num').css("margin-left",width_banner);
					$(".banner").slide({ titCell:".num ul" , mainCell:".b2" , effect:"fold", autoPlay:true, delayTime:500 , autoPage:true});
					</script>
					<!-- 代码 结束 -->
	
				</div>
			</div>
		<div class="cml_cc">
			<div class="cnews">
				<div class="cnews_l" style="height:380px;overflow:hidden;">
					<h1><a href="<%=basePath%>platform/policy/policyList.act?category=0">更多</a><i><span>国家行业信息</span></i></h1>
					<ul>
						<li class="cnews_l_img">
							<c:if test="${gjOne != null and gjOne != ''}">
								<img src="<%=basePath%>images/${gjOne.file_path}" style="width:150px;height:110px;">
							</c:if>
							<c:if test="${gjOne == null or gjOne == ''}">
								<img src="<%=basePath%>shyl/images/affairs/ceshi1.jpg">
							</c:if>
						<div class="cnews_l_img_r">
						<c:forEach items="${nationPolicyList}" var="nationdata" varStatus="vs">
						<c:if test = "${vs.index == 0}">
						<a href="<%=basePath%>platform/policy/policyDetail.act?policies_id=${nationdata.POLICIES_ID}&category=0&flag=0" class="n_h">${nationdata.TITLE}</a>
						</c:if>
						</c:forEach>
						</div>
						</li>
						<li class="cnews_l_img">
							<c:if test="${gjTwo != null and gjTwo != ''}">
								<img src="<%=basePath%>images/${gjTwo.file_path}" style="width:150px;height:110px;">
							</c:if>
							<c:if test="${gjTwo == null or gjTwo == ''}">
								<img src="<%=basePath%>shyl/images/affairs/ceshi2.jpg">
							</c:if>
						<div class="cnews_l_img_r">
						<c:forEach items="${nationPolicyList}" var="nationdata" varStatus="vs">
						<c:if test = "${vs.index == 1}">
						<a href="<%=basePath%>platform/policy/policyDetail.act?policies_id=${nationdata.POLICIES_ID}&category=0&flag=0" class="n_h">${nationdata.TITLE}</a>
						</c:if>
						</c:forEach>
						</div>
						<c:forEach items="${nationPolicyList}" var="nationdata" varStatus="vs">
						<c:if test = "${vs.index != 0 && vs.index != 1 && vs.index < 13}">
						<li><a href="<%=basePath%>platform/policy/policyDetail.act?policies_id=${nationdata.POLICIES_ID}&category=0&flag=0"><span>${nationdata.UPDATE_TIMESTAMP}</span><div class="policy" title="${nationdata.TITLE}">${nationdata.TITLE}</div></a></li>
						</c:if>
						</c:forEach>
						</li>
					</ul>
				</div>
			</div>
		</div>
		
		
		<div class="cml_2 clearfix" style="margin-left:-20px">
			<div class="dnews">
			<div class="dnews_r" style="height:360px;overflow:hidden;">
					<h1><a href="<%=basePath%>platform/policy/policyList.act?category=3" style="float:right;font-size: 0.85em;color: #333333;margin-top: 5px;">更多</a><i><span style="border-left: 5px solid #3d68ce; line-height: 20px;height: 20px;margin-top: 10px;float: left;padding-left: 15px;">其他省市行业信息</span></i></h1>
					<ul>
						<li class="dnews_l_img" style="margin-bottom:-5px">
							<c:if test="${qtzc != null and qtzc != '' }">
								<img src="<%=basePath%>images/${qtzc.file_path}" style="width:92px;">
							</c:if>
							<c:if test="${qtzc == null or qtzc == '' }">
								<img src="<%=basePath%>shyl/images/affairs/ceshi4.jpg">
							</c:if>
						<div class="dnews_l_img_r">
						<c:forEach items="${otherPolicyList}" var="otherdata" varStatus="vs">
						<c:if test = "${vs.index == 0}">
						<a href="<%=basePath%>platform/policy/policyDetail.act?policies_id=${otherdata.POLICIES_ID}&category=3&flag=3" class="n_h">${otherdata.TITLE}</a>
						</c:if>
						</c:forEach>
						</div>
						</li>
						<c:forEach items="${otherPolicyList}" var="otherdata" varStatus="vs">
						<c:if test = "${vs.index != 0 && vs.index<6}">
						<li><a href="<%=basePath%>platform/policy/policyDetail.act?policies_id=${otherdata.POLICIES_ID}&category=3&flag=3"><span>${otherdata.UPDATE_TIMESTAMP}</span><div class="policy" title="${otherdata.TITLE}">${otherdata.TITLE}</div></a></li>
						</c:if>
						</c:forEach>
					</ul>
				</div>
				<div class="dnews_r" style="height:360px;overflow: hidden;margin-left:32px">
			<h1><a href="<%=basePath%>affairs/affairsList.act?category=1" style="float:right;font-size: 0.85em;color: #333333;margin-top: 5px;">更多</a><i><span  style="border-left: 5px solid #3d68ce; line-height: 20px;height: 20px;margin-top: 10px;float: left;padding-left: 15px;">科技创新券</span></i></h1>
			<ul>
				<c:forEach items="${affairsDataList}" var="data" varStatus="vs">
				<c:if test = "${vs.index < 8}">
				<li>
					<a href="<%=basePath%>affairs/affairsDetail.act?ID=${data.ID}&category=${data.NEWS_TYPE}"><span>${data.UPDATE_TIMESTAMP}</span><div class="policy" title="${data.TITLE}">${data.TITLE}</div></a>
				</li>
				</c:if>
				</c:forEach>
			</ul>
		</div>
			</div>
		</div>
	</div>
	<div class="cmr_1">
		<div class="cmr_4" style="height:341px;overflow: hidden;">
			<h1><a href="<%=basePath%>platform/policy/policyList.act?category=1">更多</a><span>山东省行业信息</span></h1>
			<ul>
				<c:forEach items="${provincePolicyList}" var="prodata" varStatus="vs">
				<c:if test = "${vs.index < 8}">
				<li  title="${prodata.TITLE}">
					<a href="<%=basePath%>platform/policy/policyDetail.act?policies_id=${prodata.POLICIES_ID}&category=1&flag=1">${prodata.TITLE}</a>
				</li>
				</c:if>
				</c:forEach>
			</ul>
		</div>
		<div class="cmr_4" style="width:336px;height:360px;overflow:hidden;margin-top:-30px">
			<h1><a href="<%=basePath%>platform/policy/policyList.act?category=4">更多</a><span>行业信息分析</span></h1>
			<ul>
				<c:forEach items="${analisePolicyList}" var="analisedata" varStatus="vs">
				<c:if test = "${vs.index < 9}">
				<li title="${analisedata.TITLE}">
					<a href="<%=basePath%>platform/policy/policyDetail.act?policies_id=${analisedata.POLICIES_ID}&category=4&flag=4">${analisedata.TITLE}</a>
				</li>
				</c:if>
				</c:forEach>
			</ul>
		</div>
		<div class="cml_3" style="margin-top:-5px">
					<h2><a href="<%=basePath%>affairs/affairsList.act?category=2"  style="float:right;margin-right: 10px;color: #848588;font-size: 0.9em;">更多</a><span>行业趋势</span></h2>
					<div class="cml_3_1" style="height:125px;overflow: hidden;">
					<c:forEach items="${affairsNoticeList}" var="notice0" varStatus="vs">
					<c:if test = "${vs.index == 0}">
						<a href="<%=basePath%>affairs/affairsDetail.act?ID=${notice0.ID}&category=${notice0.NEWS_TYPE}"><h3><div style="width:310px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title="${notice0.TITLE}">${notice0.TITLE}</div></h3>
						<p>${notice0.CONTENT}</p>
						</a>
					</c:if>
					</c:forEach>
					</div>
					<ul class="cml_3_2" style="height:125px;overflow: hidden;">
					<c:forEach items="${affairsNoticeList}" var="notice" varStatus="vs">
					<c:if test = "${vs.index != 0 && vs.index < 5}">
						<li title="${notice.TITLE}"><a href="<%=basePath%>affairs/affairsDetail.act?ID=${notice.ID}&category=${notice.NEWS_TYPE}"><i style="margin-left:12px"> ${notice.TITLE}</i></a></li>
					</c:if>
					</c:forEach>
					</ul>
		</div>
		</div>
</div>
<div class="clear"></div>
<!--<footer开始>-->
<jsp:include page="../../common/footer.jsp"></jsp:include>

<!--</footer结束>-->
</body>
</html>
