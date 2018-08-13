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
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta http-equiv=”X-UA-Compatible” content=”IE=EmulateIE7″ />
<meta charset="utf-8">
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<style type="text/css">
 div.cml_content_main{
	 word-wrap: break-word; 
	 word-break: normal; 
}
</style>
<script>
	// 关闭当前画面
	function Close() {
		window.opener = null;
		window.open('', '_self');
		window.close();
	}
</script>
<base href="<%=basePath%>">
<title>企业新闻详情_济南市服务外包公共服务平台</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/pagination.css">
<link href="css/mypage.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<script src="<%=basePath%>shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<!--分页  -->
<script type="text/javascript" src="<%=basePath%>shyl/js/common/head.js"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/myresume/myresume.js"></script>
</head>
<body>

<!--<header开始>-->
<jsp:include page="../../common/header.jsp"></jsp:include>

<!--</header结束>-->
<!--<banner开始>-->
<div class="clear"></div>
<div class="cmain">
	<div class="cml_1">
		<div class="cml_2 clearfix">
			<div class="cml_title">
				<h1 style="line-height: 28px;">企业新闻</h1>
				<c:choose>
			    <c:when test="${not empty pdb.TITLE}">
			    <a href="<%=basePath%>platform/news/companyNewsDetail.act?companyId=${pdb.COMPANY_ID}&id=${pdb.ID}">【下一篇】${pdb.TITLE}</a>
				</c:when>
				<c:otherwise>
				<a href="javaScript:void(0);">没有下一篇了</a>
				</c:otherwise>
				</c:choose>
			</div>
			<div class="cml_content">
			<c:choose>
			    <c:when test="${not empty pd}">
				<h2 class="center_title">${pd.TITLE}
					<p class="tit">
						<a href="javaScript:void(0);">发布日期：${pd.INSERT_TIMESTAMP}</a>
						<span></span>
						&#12288;&#12288;&#12288;<a href="javaScript:void(0);"></a>
					</p>
				</h2>
				<div class="cml_content_main">
				${pd.CONTENT}
				</div>
				</c:when>
				<c:otherwise>
					<input type="hidden" id="pdvalue" value=""/>
				</c:otherwise>
				</c:choose>
				<c:choose>
			    <c:when test="${not empty pda.TITLE}">
				<a href="<%=basePath%>platform/news/companyNewsDetail.act?companyId=${pda.COMPANY_ID}&id=${pda.ID}" class="page-b">【上一篇】${pda.TITLE}</a>
				</c:when>
				<c:otherwise>
				<a href="javaScript:void(0);" class="page-b">没有上一篇了</a>
				</c:otherwise>
				</c:choose>
				
			</div>
		</div>
		<input type="hidden" id="category" value="${pd.CATEGORY}"/>
	</div>
	<div class="cmr_1">
	    <div class="cmr_2" style="height: 60px;">
		</div>
		<div class="cmr_2">
			<h1>类别</h1>
			<ul class="cate">
				<li><a href="<%=basePath%>platform/news/noticeList.act?CATEGORY=0"><i>${pd.tzgg}</i>通知公告</a></li>
				<li><a href="<%=basePath%>platform/policy/policyList.act" ><i>${pd.zcfg}</i>行业信息</a></li>
				<li><a href="<%=basePath%>platform/news/noticeList.act?CATEGORY=3"><i>${pd.ywkd}</i>要闻快递</a></li>
				<li><a href="<%=basePath%>platform/news/noticeList.act?CATEGORY=1"><i>${pd.ztjj}</i>专题聚焦</a></li>
				<li><a href="<%=basePath%>platform/news/noticeList.act?CATEGORY=2"><i>${pd.ptxw}</i>平台新闻</a></li>
				<li><a href="<%=basePath%>platform/news/noticeList.act?CATEGORY=4" class="hover"><i>${pd.qyxw}</i>企业新闻</a></li>
			</ul>
		</div>
		<div class="cmr_2">
			<h1>相关推荐</h1>
			<ul class="rbest">
			<c:choose>
			<c:when test="${not empty listDay}">
			<c:forEach items="${listDay}" var="days" varStatus="vs">
		    <li>
					<div><a href="<%=basePath%>platform/news/companyNewsDetail.act?companyId=${days.COMPANY_ID}&id=${days.ID}">${days.TITLE}
					</a></div>
					<div style="width: 230px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;float:left">
						<a href="<%=basePath%>company/info.act?companyId=${days.COMPANY_ID}" class="zuo" style="color: #505a78;font-size: 0.75em;" title="${days.USERNAME}">${days.USERNAME}</a>
					</div>
					<div style="float:right;margin-right:20px;font-size: 0.75em;">
						<span>${days.INSERT_TIMESTAMP}</span>
					</div>
			</li>
			</c:forEach>
			</c:when>
			</c:choose>
			</ul>
		</div>
		<div class="cmr_2">
			 <h1>时时关注</h1>
			<ul class="guanzhu">
			<c:choose>
			<c:when test="${not empty listTime}">
			<c:forEach items="${listTime}" var="times" varStatus="vs">
			<li>
				<c:if test="${times.news_thumbnail != null && times.news_thumbnail !=''}">
					<a href="<%=basePath%>platform/news/newsDetail.act?NEWS_ID=${times.news_id}&CATEGORY=&category=&types=4&typeflag=3"><img onerror="showImgDelay(this,'<%=basePath%>shyl/images/ceshi1.jpg');" src="<%=basePath%>images/${times.news_thumbnail}">
						<p>${times.title}</p>
					</a>
				</c:if>
				<c:if test="${times.news_thumbnail == null || times.news_thumbnail ==''}">
					<a href="<%=basePath%>platform/news/newsDetail.act?NEWS_ID=${times.news_id}&CATEGORY=&category=&types=4&typeflag=3"><img src="<%=basePath%>shyl/images/ceshi1.jpg">
						<p>${times.title}</p>
					</a>
				</c:if>
		    </li>
			</c:forEach>
			</c:when>
			</c:choose>
			</ul> 
		</div>
	</div>
</div>
<div class="clear"></div>
<!--<footer开始>-->
<jsp:include page="../../common/footer.jsp"></jsp:include>
<div class="modaldel fade in" id="prompt" tabindex="-1" role="dialog" aria-labelledby="delresume" aria-hidden="false" data-backdrop="static" data-target="" style="display:none;">
<div class="modal-dialog modal-sm">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" onclick="getList()"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="myModalLabel">提示</h4>
        </div>
        <div class="modal-body">
            <p id="warntext">该企业新闻不存在，请浏览其它！</p>
        </div>
        <div class="modal-footer">
        <button type="button" class="btn btn-success" onclick="getList()" id="d">确认</button>
        </div>
        <script type="text/javascript">
        function getList(){
        	window.location.href ='<%=basePath%>platform/news/noticeList.act?CATEGORY=';
        	$("#prompt").modal('hide');
        }
        </script>
    </div>
</div>
</div>
<script type="text/javascript">
$(function(){
	if($("#pdvalue").val() == ""){
		$("#prompt").modal('show');
	}
})



</script>
<!--</footer结束>-->
</body>
</html>
