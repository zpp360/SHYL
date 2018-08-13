<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>我的简历_济南市服务外包公共服务平台</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/pagination.css">
<link href="css/mypage.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<script src="js/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<!--分页  -->
<script type="text/javascript" src="<%=basePath%>shyl/js/common/head.js"></script>
    <style type="text/css">
    -webkit-box-sizing: content-box;
    </style>
    <style type="text/css">

table{  
    table-layout:fixed; 
}  
.tds a{  
    width:100%;  
    word-break:keep-all;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
}
.tds {  
    width:100%;  
    word-break:keep-all;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
}
.jianli ul li{
font-family:"Hiragino Sans GB","STHeiti",Helvetica,"Microsoft Yahei",微软雅黑,黑体,新細明體,Arial,"Lucida Grande",sans-serif!important;
color:#000000;
font-size: 0.9em!important;
}
</style>
</head>
<body style="background-color: #f7f7f7;margin-top:-24px">
	<!--<header开始>-->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!--</header结束>-->
	<div class="clear"></div>
	<div class="register-box p0" style="margin-top: 155px;">
		<div class="rticon"></div>
		<jsp:include page="../common/left.jsp"><jsp:param value="10" name="menuType"/></jsp:include>
			
		<div class="mypage_right">
			<h2>简历管理</h2>
			<div class="tab">
					<a href="javascript:;"  id="a2" onclick="tab0()">我的简历</a>
					<a href="javascript:;" class="hover" onclick="tab1()" id="a3">谁看了我的简历</a>
					<a href="javascript:;" onclick="tab2()" id="a4">简历投递记录</a>
					<a href="javascript:;" onclick="tab3()" id="a5">我的职位邀请</a>
			</div>
			<div class="jianli" id="jianli" style="display: none;">
			<span style="position: relative;bottom: 6px;color: #666">（共可创建三分简历）</span>
				<ul class="bg1">
					<li class="a1">简历名称</li>
					<li class="a2">更新日期</li>
					<li class="a3">默认简历设置</li>
					<li class="a4">刷新</li>
					<li class="a5">公开设置</li>
					<li class="a6">操作</li>
				</ul>
				<c:choose>
			   <c:when test="${not empty varList}">
				<c:forEach items="${varList}" var="var" varStatus="vs">
					<ul>
						<li class="a1 n-tit"><a href="<%=basePath%>myresume/show.act?CV_ID=${var.CV_ID}"
							target="_blank" id="CVID" name="${var.CV_ID}">${var.CV_NAME}</a></li>
						<input id="dv" type="hidden" value="${var.CV_ID}">
						<li class="a2">${var.UPDATE_TIMESTAMP}</li>
						<li class="a3"><a href="<%=basePath%>myresume/defaultcv.act?CV_ID=${var.CV_ID}" id="defaultcv">${var.DEFAULT_CV1}</a></li>
						<li class="a4"><a href="<%=basePath%>myresume/refresh.act?CV_ID=${var.CV_ID}">刷新</a></li>
						<li class="a5"><a href="javascript:;"
							onclick="setpub('${var.CV_ID}','${vs.index }')"
							id="yes${vs.index}" value="${var.PUBLIC_SET}">${var.PUBLIC_SET1 }</a></li>
						<li class="a6">
							<a href="javascript:;" class="modify" onclick="showDetails('${var.CV_ID}')">修改</a>
							<a href="javascript:;" class="delete" data-target="" data-toggle="modal" onclick="deletecv('${var.CV_ID}','${vs.index}')" id="delectcvd${vs.index}">删除</a>
							</li>
					<input value="${fn:length(varList)} " id="opendd" type="hidden">
					</ul>
				</c:forEach>
				</c:when>
				<c:otherwise>
								<ul>
									<li style="margin-left:40%"><span style="color: #ff6a00;">没有相关记录</span></li>
								</ul>
							</c:otherwise>
							</c:choose>
			</div>
			<form action="<%=basePath%>myresume/list1.act" method="post" name="Form" id="Form">
			<div id="seejianli" style="" class="jianli">
				<ul class="bg1">
					
					<li class="a2" style="text-align: left;padding-left: 20px;">公司名称</li>
					<li class="a3" style="text-align: center;padding-left: 5px;">公司规模</li>
					<li class="a4" style="text-align: left;padding-left: 5px;">公司类型</li>
					<li class="a4" style="text-align: left;padding-left: 5px;">浏览日期</li>
					<li class="a5" style="text-align: center;padding-left: 5px;">浏览次数</li>
					<li class="a6" style="text-align: left;padding-left: 5px;">被查看的简历</li>
				</ul>
				<c:choose>
			   <c:when test="${not empty scnnList}">
				<c:forEach items="${scnnList}" var="var" varStatus="vs">
					<ul>
						
						<li class="a2 n-tit" style="text-align: left;padding-left: 5px;"><a href="<%=basePath%>company/info.act?companyId=${var.company_id}" target="_blank">${var.companyname }</a></li>
						<li class="a3" style="text-align: center;padding-left: 5px;">${var.scale}</li>
						<li class="a4" style="text-align: left;padding-left: 5px;">${var.enterprise }</li>
						<li class="a4" style="text-align: left;padding-left: 5px;">${var.recruitment_date }</li>
						<li class="a5" style="text-align: center;padding-left: 5px;">${var.scanned_times }</li>
						<li class="a6 n-tit" style="text-align: left;padding-left: 5px;">${var.cvname}</li>
					</ul>
				</c:forEach>
				</c:when>
				<c:otherwise>
								<ul>
									<li style="margin-left:40%"><span style="color: #ff6a00;">没有相关记录</span></li>
								</ul>
							</c:otherwise>
							</c:choose>
							<input value="${fn:length(scnnList)} " id="opendd" type="hidden">
			</div>
				<div id="sendjianli" style="display: none;" class="jianli">
				<ul class="bg1">
					<li class="a1">申请日期</li>
					<li class="a2">职位名称</li>
					<li class="a3">公司名称</li>
					<li class="a4">工作地点</li>
					<li class="a5">简历名称</li>
					<li class="a6">查阅状态</li>
				</ul>
				<c:choose>
			   <c:when test="${not empty cvsendList}">
				<c:forEach items="${cvsendList}" var="var" varStatus="vs">
					<ul>
						<li class="a1">${var.update_timestamp}</li>
						<li class="a2 n-tit"><a href="<%=basePath%>job/detail/info.act?companyId=${var.company_id}&positionId=${var.recruitment_info_id}" target="_blank">${var.positionname}</a></li>
						<li class="a3 n-tit"><a href="<%=basePath%>company/info.act?companyId=${var.company_id}" target="_blank">${var.companyname }</a></li>
						<li class="a4">${var.city }</li>
						<li class="a5">${var.cvname}</li>
						<li class="a6">${var.been_viewed}</li>
					</ul>
				</c:forEach>
				</c:when>
				<c:otherwise>
								<ul>
									<li style="margin-left:40%"><span style="color: #ff6a00;">没有相关记录</span></li>
								</ul>
							</c:otherwise>
							</c:choose>
			</div>
			<div id="invitationlist" style="display: none;" class="jianli">
				<ul class="bg1">
					<li class="a1">企业名称</li>
					<li class="a2">职位名称</li>
					<li class="a3">面试时间</li>
					<li class="a4">备注信息</li>
				</ul>
				<c:choose>
			   <c:when test="${not empty invitationlist}">
				<c:forEach items="${invitationlist}" var="var" varStatus="vs">
					<ul>
						<li class="a1 n-tit"><a href="<%=basePath%>company/info.act?companyId=${var.company_id}" target="_blank">${var.COMPANY_NAME}</a></li>
						<li class="a2">${var.POSITION_NAME}</li>
						<li class="a3">${var.application_time }</li>
						<li class="a4">${var.remarks}</li>
					</ul>
				</c:forEach>
				</c:when>
				<c:otherwise>
								<ul>
									<li style="margin-left:40%"><span style="color: #ff6a00;">没有相关记录</span></li>
								</ul>
							</c:otherwise>
							</c:choose>
				
			</div>
			<div class="page-header position-relative" id="fenye">
				<table style="width: 100%;">
					<tr>
						<td style="align: center;" align="center"><div
							class="pagination"
							style="padding-top: 15px; margin: 0 auto; font-size:12px; display: inline-block;">${page.platformPageStr}</div></td>
					</tr>
				</table>
			</div>
				</form>
		</div>

	</div>
	<div class="clear"></div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!--<footer开始>-->
	<!-- 删除简历 -->
	<div class="modaldel fade in" id="delresume" tabindex="-1" role="dialog" aria-labelledby="delresume" aria-hidden="false" data-backdrop="static" data-target="" style="display: none;"><div class="modal-dialog modal-sm">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" onclick="Clear()"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="myModalLabel">提示</h4>
        </div>
        <div class="modal-body">
            <p id="warntext">简历取消后不可恢复，确定取消吗？</p>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-success" onclick="" data-dismiss="modal" id="d">确认</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        </div>
    </div>
</div>

</div>
	<div class="modaldel fade in" id="makesure" tabindex="-1" role="dialog" aria-labelledby="delresume" aria-hidden="false" data-backdrop="static" data-target="" style="display: none;"><div class="modal-dialog modal-sm">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" onclick="Clear()"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="myModalLabel">提示</h4>
        </div>
        <div class="modal-body">
            <p id="warntext">只能创建三份简历！</p>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        </div>
    </div>
</div>
</div>
<script type="text/javascript" src="<%=basePath%>shyl/js/myresume/myresume1.js"></script>
	<!--</footer结束>-->
</body>
</html>
