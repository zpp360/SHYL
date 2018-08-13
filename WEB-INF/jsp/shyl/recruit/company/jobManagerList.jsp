<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>招聘管理_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">

<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<script src="js/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/jquery-1.7.1.js"></script>
<script src="<%=basePath%>shyl/js/jquery.min.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/job/job.js"></script>
<link rel="stylesheet" href="<%=basePath%>shyl/css/job/job.css">
<jsp:include page="../../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
</head>
<body style="background-color: #f7f7f7;">
<div class="modal_h20 modal fade bs-example-modal-sm in" id="deljob" data-toggle="modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="false" data-target="">
	<div class="modal-dialog modal-sm">
	   <div class="modal-content">
	       <div class="modal-header">
	           <button type="button" class="close" data-dismiss="modal" onclick="Clear()"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
	           <h4 class="modal-title" id="myModalLabel">提示</h4>
	       </div>
	       <div class="modal-body">
	           <p id="warntext">招聘信息取消后不可恢复，确定取消吗？</p>
	       </div>
	       <div class="modal-footer">
	           <input type="hidden" id="recruitmentInfoID" value="">
	           <input type="hidden" id="companyId" value="${pd.USERID}">
	           <button type="button" class="btn btn-success" onclick="Delete()" data-dismiss="modal">确认</button>
	           <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	       </div>
	   </div>
	</div>
</div>
<div class="clear"></div>
<div class="register-box p0">
	<div class="rticon"></div>
	<jsp:include page="../../common/left.jsp"><jsp:param value="4" name="menuType"/></jsp:include>
	<div class="mypage_right" style="min-height:920px;">
		<h2>招聘管理</h2>
		<div class="tab">
			<a href="javascript:void(0);" class="hover" id="a1">招聘管理</a>
			<a href="javascript:void(0);" id="a2" onclick="tab1()">职位邀请</a>
		</div>
		<form action="<%=basePath%>company/toJobManager.act" method="post" name="Form" id="Form">
		<div class="tab" style="margin-bottom:0;">
			<a href="<%=basePath%>recruitment/create.act" class="more">+&nbsp;&nbsp;发布职位</a>
		</div>
		<div class="jianli">
			<table class="tableclass">
				<thead>
					<tr>
						<th style="padding-left: 30px;text-align: left;">职位</th>
						<th style="text-align: center;">应聘数</th>
						<th style="text-align: center;">发布时间</th>
						<th style="text-align: center;">操作</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
				<c:when test="${not empty jobManagerList}">
					<c:forEach items="${jobManagerList}" var="var" varStatus="vs">
						<tr>
							<td class="tds" style="width: 400px;padding-left: 30px;text-align: left;" title="${var.POSITION_NAME}">
							<a href="<%=basePath%>job/detail/info.act?companyId=${var.USER_ID}&positionId=${var.RECRUITMENT_INFO_ID}&flag=control" target="_blank">
							${var.POSITION_NAME}
							</a></td>
							<c:if test="${var.TOTAL != null && var.TOTAL != ''}">
							<td style="width: 100px;text-align: center;">
								<a href="<%=basePath%>company/toApplicantList.act?infoID=${var.RECRUITMENT_INFO_ID}">${var.TOTAL}</a>
							</td>
							</c:if>
							<c:if test="${var.TOTAL == null || var.TOTAL == ''}">
                                <td style="width: 100px;text-align: center;">0</td>
                            </c:if>
							<td style="width: 140px;text-align: center;">${var.UPDATE_TIMESTAMP}</td>
							<td style="text-align: center;"><a href="<%=basePath%>company/toUpdateJob.act?&infoID=${var.RECRUITMENT_INFO_ID}" class="modify">修改</a>
							<a href="#" data-toggle="modal" id="deljob_${var.RECRUITMENT_INFO_ID}" onclick="dels(${var.RECRUITMENT_INFO_ID},'deljob_${var.RECRUITMENT_INFO_ID}');" class="delete">删除</a></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4" style="text-align: center;">
							<span style="color: #ff6a00">没有相关数据</span>
						</td>
					</tr>
				</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div>
		<div class="page-header position-relative">
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
<script type="text/javascript">
function tab1() {
	window.location.href = '<%=basePath%>company/toInvitation.act';
}
</script>
<!--<footer开始>-->
<jsp:include page="../../common/footer.jsp"></jsp:include>
<!--</footer结束>-->
</html>
