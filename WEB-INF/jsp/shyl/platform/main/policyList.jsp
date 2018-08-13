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
<title>行业信息_济南市服务外包公共服务平台</title>
<jsp:include page="../../common/header.jsp"><jsp:param name="id" value="zwtd" /></jsp:include>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<style>
div.cmr_2 input.sbtn1 {
    height: 34px;
    width: 28%;
    background-color: #305abe;
    color: #fff;
    border-radius: 3px;
    border: 0;
    cursor: pointer;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	var id = $("#category").val();
	$("#noticeLink"+id).addClass("hover");
});
</script>
</head>
<body>
<!--<cmain开始>-->
<div class="clear"></div>
<form action="<%=basePath%>platform/policy/policyList.act" method="post" name="Form" id="Form">
<div class="cmain">
	<div class="cml_1">
		<div class="cml_2 clearfix">
			<div class="cml_title">
				<h1>最新<i>热点</i></h1>
				<span>行业信息</span>
			</div>
			<div class="cml_content">
			<ul>
			<c:choose>
			<c:when test="${not empty newsList}">
				<c:forEach items="${newsList}" var="policy" varStatus="vs">
					<li>
						<a href="<%=basePath%>platform/policy/policyDetail.act?policies_id=${policy.policies_id}&category=${policy.categorys}&flag=${pg.category}" class="cml_c_1">
							<c:choose>
								<c:when test="${fn:length(policy.title) >50}">
									${fn:substring(policy.title, 0, 50)}...
								</c:when>
								<c:otherwise>
									${policy.title}
								</c:otherwise>
							</c:choose>
						</a>
						<i><span style="font-size: 0.85em;color: #a5abbb;"><c:choose>
								<c:when test="${fn:length(policy.policies_sources) >12}">
									${fn:substring(policy.policies_sources, 0, 12)}...
								</c:when>
								<c:otherwise>
									${policy.policies_sources}
								</c:otherwise>
							</c:choose></span>
						<span class="cml_c_3 cml_c_s">${policy.update_timestamp}</span><span style="font-size: 0.85em;color: #a5abbb;">${policy.category}</span></i>
						<a href="<%=basePath%>platform/policy/policyDetail.act?policies_id=${policy.policies_id}&category=${policy.categorys}&flag=${pg.category}" class="p">${policy.policies_content}
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
			<input type="submit" class="sbtn1" id="searchBtn">
		</div>
		<c:if test="${empty pd.category}">
		<div class="cmr_2">
			<h1>类别</h1>
			<ul class="cate">
				<li><a href="<%=basePath%>platform/news/noticeList.act?CATEGORY=0"><i>${pd.tzgg}</i>通知公告</a></li>
				<li><a href="#" class="hover"><i>${pd.zcfg}</i>行业信息</a></li>
				<li><a href="<%=basePath%>platform/news/noticeList.act?CATEGORY=3"><i>${pd.ywkd}</i>要闻快递</a></li>
				<li><a href="<%=basePath%>platform/news/noticeList.act?CATEGORY=1"><i>${pd.ztjj}</i>专题聚焦</a></li>
				<li><a href="<%=basePath%>platform/news/noticeList.act?CATEGORY=2"><i>${pd.ptxw}</i>平台新闻</a></li>
				<li><a href="<%=basePath%>platform/news/noticeList.act?CATEGORY="><i>${pd.qyxw}</i>企业新闻</a></li>
			</ul>
		</div>
		</c:if>
		<input name="category" id="category" type="hidden" value="${pd.category}"/>
		<c:if test="${not empty pd.category}">
			<div class="cmr_2">
				<h1>类别</h1>
				<ul class="cate">
				<c:choose>
				<c:when test="${not empty listType}">
				<c:forEach items="${listType}" var="types" varStatus="vs">
				<li ><a id="noticeLink${types.distinguish_id}"  href="<%=basePath%>platform/policy/policyList.act?category=${types.distinguish_id}"><i>${types.ct}</i>${types.dname}</a></li>
				</c:forEach>
				</c:when>
				</c:choose>
				</ul>
			</div>
		</c:if>
		<div class="cmr_2">
			<h1>时时关注</h1>
			<ul class="guanzhu">
				<c:forEach items="${allTimeNewsList}" var="allTimeNews" varStatus="vs">
					<li>
						<c:if test="${allTimeNews.news_thumbnail != null && allTimeNews.news_thumbnail !=''}">
							<a href="<%=basePath%>platform/policy/newsDetail.act?NEWS_ID=${allTimeNews.news_id}&CATEGORY=&category=${pd.category}&typeflag=1"><img onerror="showImgDelay(this,'<%=basePath%>shyl/images/ceshi1.jpg');" src="<%=basePath%>images/${allTimeNews.news_thumbnail}"/>
								<p>${allTimeNews.title}</p>
							</a>
						</c:if>
						<c:if test="${allTimeNews.news_thumbnail == null || allTimeNews.news_thumbnail ==''}">
							<a href="<%=basePath%>platform/policy/newsDetail.act?NEWS_ID=${allTimeNews.news_id}&CATEGORY=&category=${pd.category}&typeflag=1"><img src="<%=basePath%>shyl/images/ceshi1.jpg"/>
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
<jsp:include page="../../common/footer.jsp"></jsp:include>
<!--</footer结束>-->
</body>
</html>