<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<title>咨询管理_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<base href="<%=basePath%>">
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<script src="shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/jquery.min.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.js"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>

<style type="text/css">
.n-tit a{
    color:#0a7295;
    display:block;
    width:280px;
    float:left;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    font-size: 13px;
}
.tds p {
    width: 200px;
    word-break:keep-all;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
    font-size: 13px;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../common/left.jsp"><jsp:param value="20" name="menuType"/></jsp:include>
		<div class="mypage_right">
			<h2>咨询管理</h2>
			<div class="tab" style="margin-bottom:0;">
				<a href="<%=basePath%>consultancy/toCreate.act" class="more" style="font-size: 1em;">&nbsp;+&nbsp;&nbsp;新增&nbsp;</a>
				<form action="<%=basePath%>consultancy/list.act" method="post" name="consultancyform" id="consultancyform">
					<input type="text" class="search" id="consultancyTitle" maxlength="50" name="consultancyTitle" value="${pd.consultancyTitle}" placeholder="请输入标题关键字" style="background-color: #ecf0f9;" onblur="trim(this);">
					<input type="submit" class="sbtnNew" value="搜索" onclick="search();" style="margin-top:0px;line-height: 46px;height: 46px;color: #ffffff;margin-left: 20px;">
				</form>
			</div>
			<div class="jianli">
				<table class="tableclass">
					<thead>
						<tr>
							<th style="width: 200px;padding-left: 30px;text-align: left;">标题</th>
							<th style="width: 160px;text-align: center;">类型</th>
							<th style="width: 160px;text-align: center;">发布时间</th>
							<th style="text-align: center;">操作</th>
						</tr>
					</thead>
					<tbody>
					    <c:choose>
					        <c:when test="${not empty consultancyList}">
					            <c:forEach items="${consultancyList}" var="var" varStatus="vs">
									<tr>
										<td class="n-tit" style="width: 280px;padding-left: 30px;text-align: left;">
 										   		<a href="<%=basePath%>consultancy/consultancyDetail.act?id=${var.ID}"target="_blank" title="${var.TITLE}">${var.TITLE}</a> 
										</td>
										<td style="width: 120px;text-align: center;">${var.VALUE}</td>
										<td style="width: 120px;text-align: center;">${var.INSERT_DATE}</td>
										<td style="text-align: center;">
										    <a href="<%=basePath%>consultancy/toUpdate.act?&id=${var.ID}" class="modify">修改</a>
 										    <a class="delete" style="cursor: pointer;" data-toggle="modal" title="删除" id="delnews_${var.ID}" onclick="del(${var.ID},'delnews_${var.ID}');" data-target="#delnews">删除</a>
										</td>
									</tr>
							    </c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" style="text-align: center;"><span
										style="color: #ff6a00">没有相关记录</span></td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<!-- 分页开始 -->
			<div class="page-header position-relative">
				<table style="width: 100%;">
					<tr>
						<td style="align: center;" align="center"><div
							class="pagination"
							style="padding-top: 15px; margin: 0 auto; font-size:12px; display: inline-block;">${page.platformPageStr}</div></td>
					</tr>
				</table>
			</div>
			<!-- 分页结束 -->		
		</div>
	<div class="modal_h20 fade bs-example-modal-sm in" id="delnews"
			data-toggle="modal" tabindex="-1" role="dialog"
			aria-labelledby="mySmallModalLabel" aria-hidden="false"
			data-target="">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							onclick="Clear()">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">提示</h4>
					</div>
					<div class="modal-body">
						<p id="warntext">确认删除该咨询服务吗？</p>
					</div>
					<div class="modal-footer">
						<input type="hidden" id="id" value=""> <input
							type="hidden" id="company_id" value="${pd.COMPANY_ID}">
						<button type="button" class="btn btn-success" onclick="Delete()"
							data-dismiss="modal">确认</button>
						<button type="button" class="btn btn-default"
							data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<%@ include file="../common/footer.jsp"%>
</body>
<script type="text/javascript">

	function Delete() {
    	location.href = "<%=basePath%>consultancy/todelete.act?id="+ $("#id").val();
	}
    
    function del(id, divid) {
		$("#" + divid).attr("data-target", "#delnews");
		$("#delnews").attr("data-target", "");
		$("#id").val(id);
	}  
    //检索
	function search(){
		top.jzts();
		$("#consultancyform").submit();
	}
</script>
</html>