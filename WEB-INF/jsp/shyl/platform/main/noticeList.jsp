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
<title>通知公告_济南市服务外包公共服务平台</title>
<jsp:include page="../../common/header.jsp"></jsp:include>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
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
<script type="text/javascript">
	$(document).ready(function(){
		var id = $("#CATEGORY").val();
		$("#noticeLink"+id).addClass("hover");
		$("#categoryName").html($("#noticeDiv" + id).html());
		$("title").html($("#noticeDiv" + id).html()+'_济南市服务外包公共服务平台');
	});
	
	//显示选择的新闻内容
	function showNewsList(category){
		document.getElementById("CATEGORY").value=category;
		var url = document.forms[0].getAttribute("action");
		document.forms[0].action=url+"?CATEGORY="+category;
		document.forms[0].submit();
	}
</script>
</head>
<body>
<!--<cmain开始>-->
<div class="clear"></div>
<form action="<%=basePath%>platform/news/noticeList.act" method="post" name="Form" id="Form">
<div class="cmain">
	<div class="cml_1">
		<div class="cml_2 clearfix">
			<div class="cml_title">
				<h1>最新<i>热点</i></h1>
				<span id="categoryName"></span>
			</div>
			<div class="cml_content">
			<ul>
			<c:choose>
			<c:when test="${not empty newsList}">
				<c:forEach items="${newsList}" var="news" varStatus="vs">
					<c:if test="${pd.CATEGORY == ''}">
						<c:set var="url" value="platform/news/companyNewsDetail.act?companyId=${news.COMPANY_ID}&id=${news.ID}&types=${pd.CATEGORY}&typeflag=3"/>
					</c:if>
					<c:if test="${pd.CATEGORY != ''}">
						<c:set var="url" value="platform/news/newsDetail.act?NEWS_ID=${news.NEWS_ID}&CATEGORY=${pd.CATEGORY}&types=${pd.CATEGORY}&typeflag=2"/>
					</c:if>
					<li>
						<a href="<%=basePath%>${url}" class="cml_c_1">
							<c:choose>
								<c:when test="${fn:length(news.TITLE) >50}">
									${fn:substring(news.TITLE, 0, 50)}...
								</c:when>
								<c:otherwise>
									${news.TITLE}
								</c:otherwise>
							</c:choose>
						</a>
						<i><span style="font-size: 0.85em;color: #a5abbb;"><c:choose>
								<c:when test="${fn:length(news.NEWS_SOURCES) >12}">
									${fn:substring(news.NEWS_SOURCES, 0, 12)}...
								</c:when>
								<c:otherwise>
									${news.NEWS_SOURCES}
								</c:otherwise>
							</c:choose></span>
						<span class="cml_c_3 cml_c_s">${news.UPDATE_TIMESTAMP}</span></i>
						<a href="<%=basePath%>${url}" class="p">${news.NEWS_CONTENT}
						</a>
					</li>
				</c:forEach>
				</c:when>
				<c:otherwise>
								
									<span style="color: #ff6a00; margin-left:40%">没有相关记录</span>
								
							</c:otherwise>
				</c:choose>
			</ul>
			</div>
			<div class="page-header position-relative">
				<table style="width: 100%;">
					<tr><td style="align: center;" align="center"><div class="pagination"
								style="padding-top: 0px; margin:0 auto;  display: inline-block;">${page.platformPageStr}</div></td>
					</tr>
				</table>
			</div>
		</div>
			</div>
	<div class="cmr_1">
		<div class="cmr_2">
			<h1>搜索</h1>
			<input name="keyword" class="search" value="${pd.keyword}"/>
			<input type="hidden" id="CATEGORY" name="CATEGORY" value="${pd.CATEGORY}"/>
			<input type="submit" class="sbtn1" id="searchBtn">
		</div>
		<div class="cmr_2">
			<h1>类别</h1>
			<ul class="cate">
				<li><a href="#" id="noticeLink0" onclick="showNewsList('0')"><i>${pd.tzgg}</i><div id="noticeDiv0">通知公告</div></a></li>
				<li><a href="<%=basePath%>platform/policy/policyList.act"><i>${pd.zcfg}</i>行业信息</a></li>
				<li><a href="#" id="noticeLink3" onclick="showNewsList('3')"><i>${pd.ywkd}</i><div id="noticeDiv3">要闻快递</div></a></li>
				<li><a href="#" id="noticeLink1" onclick="showNewsList('1')"><i>${pd.ztjj}</i><div id="noticeDiv1">专题聚焦</div></a></li>
				<li><a href="#" id="noticeLink2" onclick="showNewsList('2')"><i>${pd.ptxw}</i><div id="noticeDiv2">平台新闻</div></a></li>
				<li><a href="#" id="noticeLink" onclick="showNewsList('')"><i>${pd.qyxw}</i><div id="noticeDiv">企业新闻</div></a></li>
			</ul>
			<input name="category" type="hidden" value="${pd.category}"/>
		</div>
		<div class="cmr_2">
			<h1>时时关注</h1>
			<ul class="guanzhu">
				<c:forEach items="${allTimeNewsList}" var="allTimeNews" varStatus="vs">
					<li>
						<c:if test="${allTimeNews.news_thumbnail != null && allTimeNews.news_thumbnail !=''}">
							<c:if test="${not empty pd.CATEGORY}">
							<a href="<%=basePath%>platform/policy/newsDetail.act?NEWS_ID=${allTimeNews.news_id}&CATEGORY=${pd.CATEGORY}&category=&types=4&typeflag=2"><img onerror="showImgDelay(this,'<%=basePath%>shyl/images/ceshi1.jpg');" src="<%=basePath%>images/${allTimeNews.news_thumbnail}"/>
								<p>${allTimeNews.title}</p>
							</a>
							</c:if>
							<c:if test="${empty pd.CATEGORY}">
							<a href="<%=basePath%>platform/policy/newsDetail.act?NEWS_ID=${allTimeNews.news_id}&CATEGORY=${pd.CATEGORY}&category=&types=4&typeflag=3"><img onerror="showImgDelay(this,'<%=basePath%>shyl/images/ceshi1.jpg');" src="<%=basePath%>images/${allTimeNews.news_thumbnail}"/>
								<p>${allTimeNews.title}</p>
							</a>
							</c:if>
						</c:if>
						<c:if test="${allTimeNews.news_thumbnail == null || allTimeNews.news_thumbnail ==''}">
							<c:if test="${not empty pd.CATEGORY}">
							<a href="<%=basePath%>platform/policy/newsDetail.act?NEWS_ID=${allTimeNews.news_id}&CATEGORY=${pd.CATEGORY}&category=&types=4&typeflag=2"><img src="<%=basePath%>shyl/images/ceshi1.jpg"/>
								<p>${allTimeNews.title}</p>
							</a>
							</c:if>
							<c:if test="${empty pd.CATEGORY}">
							<a href="<%=basePath%>platform/policy/newsDetail.act?NEWS_ID=${allTimeNews.news_id}&CATEGORY=${pd.CATEGORY}&category=&types=4&typeflag=3"><img src="<%=basePath%>shyl/images/ceshi1.jpg"/>
								<p>${allTimeNews.title}</p>
							</a>
							</c:if>
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
<jsp:include page="../../common/footer.jsp"></jsp:include>
<!--</footer结束>-->
</body>
</html>