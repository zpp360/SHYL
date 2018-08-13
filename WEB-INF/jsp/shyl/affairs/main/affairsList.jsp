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
<title>行业趋势_济南市服务外包公共服务平台</title>
<jsp:include page="../../common/header.jsp"><jsp:param name="id" value="zwtd" /></jsp:include>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var id = $("#category").val();
		$(".cate li a").removeClass("hover");
		$(".cate li:eq("+(id-1)+") a").addClass("hover");
		$(".cate li:eq("+(0)+") a").attr("href","<%=basePath%>affairs/affairsList.act?category="+1);
		$(".cate li:eq("+(1)+") a").attr("href","<%=basePath%>affairs/affairsList.act?category="+2);
		if (id ==1) {
			$(document).attr("title","科技创新券_济南市服务外包公共服务平台");
			$("#spId").html("科技创新券");
		} else {
			$(document).attr("title","行业趋势_济南市服务外包公共服务平台");
			$("#spId").html("行业趋势");
		}
	});
</script>
<style>
div.cmr_2 input.sbtn1 {
    height: 34px;
    width: 28%;
    background-color: #305abe;
    color: #fff;
    font-style: italic;
    border-radius: 3px;
    border: 0;
    cursor: pointer;
}
</style>
</head>
<body>
<!--<cmain开始>-->
<div class="clear"></div>
<form action="<%=basePath%>affairs/affairsList.act" method="post" name="Form" id="Form">
<div class="cmain">
	<div class="cml_1">
		<div class="cml_2 clearfix">
			<div class="cml_title">
				<h1>最新<i>热点</i></h1>
				<span id="spId">科技创新券</span>
			</div>
			<div class="cml_content">
			<ul>
				<c:forEach items="${affairsDataList}" var="affairs" varStatus="vs">
					<li>
						<a href="<%=basePath%>affairs/affairsDetail.act?ID=${affairs.ID}&category=${affairs.NEWS_TYPE}" class="cml_c_1">
							<c:choose>
								<c:when test="${fn:length(affairs.TITLE) >50}">
									${fn:substring(affairs.TITLE, 0, 50)}...
								</c:when>
								<c:otherwise>
									${affairs.TITLE}
								</c:otherwise>
							</c:choose>
						</a>
						<i><span style="font-size: 0.85em;color: #a5abbb;"></span>
						<span class="cml_c_3">${affairs.UPDATE_TIMESTAMP}</span></i>
						<a href="<%=basePath%>affairs/affairsDetail.act?ID=${affairs.ID}&category=${affairs.NEWS_TYPE}" class="p">${affairs.CONTENT}
						</a>
					</li>
				</c:forEach>
			</ul>
					</div>
			<div class="page-header position-relative">
				<table style="width: 100%;">
					<tr><td style="align: center;"><div class="pagination"
								style="float: left; padding-top: 0px; margin-top: 0px; margin-left: 50px; font-size:12px;">${page.platformPageStr}</div></td>
					</tr>
				</table>
			</div>
		</div>
			</div>
	<div class="cmr_1">
		<div class="cmr_2">
			<h1>搜索</h1>
			<input name="keyword" class="search" value="${pd.keyword}" onblur="trim(this);"/>
			<input type="submit" class="sbtn1" id="searchBtn">
		</div>
		<div class="cmr_2">
			<h1>类别</h1>
			<ul class="cate">
				<li><a href="#"><i>${pd.sbzn}</i>科技创新券</a></li>
				<li><a href="#" class="hover"><i>${pd.sbgg}</i>行业趋势</a></li>
			</ul>
			<input id="category" name="category" type="hidden" value="${pd.NEWS_TYPE}"/>
		</div>
		<div class="cmr_2">
			
		</div>
		<div class="cmr_2">
			<h1>时时关注</h1>
			<ul class="guanzhu">
				<c:forEach items="${allTimeNewsList}" var="allTimeNews" varStatus="vs">
					<li>
						<c:if test="${allTimeNews.news_thumbnail != null && allTimeNews.news_thumbnail !=''}">
							<a href="<%=basePath%>platform/policy/newsDetail.act?NEWS_ID=${allTimeNews.news_id}&CATEGORY=&category=${pd.NEWS_TYPE}&typeflag=4"><img onerror="showImgDelay(this,'<%=basePath%>shyl/images/ceshi1.jpg');" src="<%=basePath%>images/${allTimeNews.news_thumbnail}"/>
								<p>${allTimeNews.title}</p>
							</a>
						</c:if>
						<c:if test="${allTimeNews.news_thumbnail == null || allTimeNews.news_thumbnail ==''}">
							<a href="<%=basePath%>platform/policy/newsDetail.act?NEWS_ID=${allTimeNews.news_id}&CATEGORY=&category=${pd.NEWS_TYPE}&typeflag=4"><img src="<%=basePath%>shyl/images/ceshi1.jpg"/>
								<p>${allTimeNews.title}</p>
							</a>
						</c:if>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
</form>
<!--</cmain结束>-->
<div class="clear"></div>
<!--<footer开始>-->
<%@ include file="../../common/footer.jsp"%>
<!--</footer结束>-->
</body>
</html>