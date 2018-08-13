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
<meta http-equiv=”X-UA-Compatible” content=”IE=EmulateIE7″ />
<meta charset="utf-8">
<script>
	// 关闭当前画面
	function Close() {
		window.opener = null;
		window.open('', '_self');
		window.close();
	}
</script>
<base href="<%=basePath%>">
<title>行业信息详情_济南市服务外包公共服务平台</title>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<script src="shyl/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="<%=basePath%>/shyl/js/layer/layer.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if ($("#pdvalue").val() == "") {
		$("#prompt").modal('show');
	}else{
		var id = $("#category").val();
		$("#noticeLink"+id).addClass("hover");
	}
});
function getList(){
	var categoryid = $("#flag").val();
	if(categoryid==null || categoryid==""){
		window.location.href ='<%=basePath%>platform/policy/policyList.act';
	}else{
		window.location.href ='<%=basePath%>platform/policy/policyList.act?category='+categoryid;
	}
	$("#prompt").modal('hide');
}
</script>
</head>
<body>

<!--<header开始>-->
<jsp:include page="../../common/header.jsp"><jsp:param name="id" value="zwtd" /></jsp:include>
<!--</header结束>-->
<!--<banner开始>-->
<div class="clear"></div>
<div class="cmain">
	<div class="cml_1">
		<div class="cml_2 clearfix">
		
			<div class="cml_title">
				<h1 style="line-height: 28px;">行业信息</h1>
				<c:choose>
			    <c:when test="${not empty pdb.title}">
			    <a href="<%=basePath%>platform/policy/policyDetail.act?policies_id=${pdb.policies_id}&category=${pg.category}&flag=${pg.flag}">【下一篇】${pdb.title}</a>
				</c:when>
				<c:otherwise>
				<a href="javaScript:void(0);">没有下一篇了</a>
				</c:otherwise>
				</c:choose>
			</div>
			<div class="cml_content">
				<c:choose>
					<c:when test="${not empty pd}">
						<h2 style=" text-align:center;border-bottom: 0px dashed">${pd.title}</h2>
						<h2>
							<p class="tit">
								<a href="javaScript:void(0);">${pd.category_01}</a>
								<i></i>
								<span><a href="javaScript:void(0);">${pd.insert_timestamp}</a></span>
								<a href="javaScript:void(0);">来源：</a><a href="javaScript:void(0);">${pd.policies_sources}</a>
							</p>
						</h2>
						<div class="cml_content_main">
						${pd.policies_content}
						</div>
						<h5>
							<a href="javaScript:void(0);" onclick="dounfile('${pd.appendix_path}','${pd.appendix_name}')" id="appendix">
								${pd.appendix_name}
							</a>				
						</h5>
					</c:when>
					<c:otherwise>
						<input type="hidden" id="pdvalue" value="" />
					</c:otherwise>
				</c:choose>
				<c:choose>
			    <c:when test="${not empty pda.title}">
				<a href="<%=basePath%>platform/policy/policyDetail.act?policies_id=${pda.policies_id}&category=${pg.category}&flag=${pg.flag}" class="page-b">【上一篇】${pda.title}</a>
				</c:when>
				<c:otherwise>
				<a href="javaScript:void(0);" class="page-b">没有上一篇了</a>
				</c:otherwise>
				</c:choose>
				<input type="hidden" id="category" value="${pg.category}"/>
				<input type="hidden" id="flag" value="${pg.flag}"/>
			</div>
		</div>
	</div>
	<div class="cmr_1">
	<div class="cmr_2" style="height: 60px;">
		</div>
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
		<div class="cmr_2">
			<h1>相关推荐</h1>
			<ul class="rbest">
			<c:choose>
			<c:when test="${not empty listDay}">
			<c:forEach items="${listDay}" var="days" varStatus="vs">
		    <li>
					<a href="<%=basePath%>platform/policy/policyDetail.act?policies_id=${days.policies_id}&category=${pg.category}&flag=${pg.category}">${days.title}
					</a>
					<p class="zz"><a href="javaScript:void(0);" class="zuo" style="text-decoration: none;">来源：${days.policies_sources}</a><span>${days.insert_timestamp}</span></p>
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
					<a href="<%=basePath%>platform/news/newsDetail.act?NEWS_ID=${times.news_id}&CATEGORY=&category=${pg.category}&typeflag=1"><img onerror="showImgDelay(this,'<%=basePath%>shyl/images/ceshi1.jpg');" src="<%=basePath%>images/${times.news_thumbnail}">
						<p>${times.title}</p>
					</a>
				</c:if>
				<c:if test="${times.news_thumbnail == null || times.news_thumbnail ==''}">
					<a href="<%=basePath%>platform/news/newsDetail.act?NEWS_ID=${times.news_id}&CATEGORY=&category=${pg.category}&typeflag=1"><img src="<%=basePath%>shyl/images/ceshi1.jpg">
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
<div>
	<form id="forms" method="post" style="display: none;">
		<c:choose>
			<c:when test="${not empty pd}">
				<input id="filename" type="hidden" value="${pd.appendix_name}" name="fileName">
				<input id="filepath" type="hidden" value="${pd.appendix_path}" name="filePath">
			</c:when>
		</c:choose>					
	</form>
</div>
<!--<footer开始>-->
<jsp:include page="../../common/footer.jsp"></jsp:include>
<!--</footer结束>-->
<div class="modaldel fade in" id="prompt" tabindex="-1" role="dialog"
	aria-labelledby="delresume" aria-hidden="false" data-backdrop="static"
	data-target="" style="display: none;">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					onclick="getList()">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">提示</h4>
			</div>
			<div class="modal-body">
				<p id="warntext">该行业信息不存在，请浏览其它！</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" onclick="getList()"
					id="d">确认</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function dounfile(filepath,filename){
		$.ajax({
			type : "POST",
			url : '<%=basePath%>affairs/downfile.act',
			data : {filepath:filepath},
			dataType : 'json',
			cache : false,
			success : function(data) {
					if(data.responseStr=="OK"){
						$("#forms").attr("action","<%=basePath%>affairs/download.act");
						$("#forms").submit();
					}else{
						layer.open({
						 	 title:'温馨提示' ,
					         type: 0,
					         shadeClose : true,
					         scrollbar : false,
					         area: ['100px'],
					         icon: 2,
							 skin: 'layui-layer-rim', 
							 content: '下载文件不存在'
					   	});
					}
				}
		});
		return false;
	}
	</script>
</body>
</html>
