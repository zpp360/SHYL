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
<html>
<head>
<meta charset="utf-8">
<title>需求管理_济南市服务外包公共服务平台</title>
<jsp:include page="../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<script src="<%=basePath%>shyl/js/jquery.validate.js"type="text/javascript" ></script>
<script src="<%=basePath%>shyl/js/jquery.tips.js"type="text/javascript" ></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<script type="text/javascript" src="<%=basePath%>/shyl/js/mainjs/jquery.placeholder.js"></script>
<style type="text/css">
div.mypage_right div.xiangmu ul li {
    line-height: 38px;
    height: 38px;
    float: left;
    display: inline-block;
    font-size: 0.9em;
    font-family: arial;
}
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
</style>
</head>
<body style="background-color: #f7f7f7;">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../common/left.jsp"><jsp:param value="7" name="menuType"/></jsp:include>
		<div class="mypage_right">
			<h2>需求管理</h2>
			<div class="tab" style="margin-bottom:0;">
				<a href="<%=basePath%>requirement/toAddProjectRequirement.act" id="addRequirement" class="more">+&nbsp;&nbsp;发布需求</a>
			</div>
			<div class="tab">
				<a href="javascript:;" id="xiangmubtn" onclick="xiangmuclick()">项目需求</a>
				<a href="javascript:;" class="hover" onclick="renyuanclick()" id="renyuanbtn">人员需求</a>
			</div>
			<div class="xiangmu" id="personalDiv">
				<form action="<%=basePath%>requirement/toPersonalRequirement.act" id="Form" method="post" name="Form">
					<ul class="bg1">
						<li class="a1" style="padding-left: 30px;text-align: left;width:30%;font-family: Hiragino Sans GB,STHeiti,Helvetica,Microsoft Yahei,微软雅黑,黑体,新細明體,Arial,Lucida Grande,sans-serif;">标题</li>																								
						<li style="text-align: center;width:12%;font-family: Hiragino Sans GB,STHeiti,Helvetica,Microsoft Yahei,微软雅黑,黑体,新細明體,Arial,Lucida Grande,sans-serif;">发布时间</li>
						<li style="text-align: center;width:15%;font-family: Hiragino Sans GB,STHeiti,Helvetica,Microsoft Yahei,微软雅黑,黑体,新細明體,Arial,Lucida Grande,sans-serif;">项目周期(月)</li>
						<li style="text-align: center;width:15%;font-family: Hiragino Sans GB,STHeiti,Helvetica,Microsoft Yahei,微软雅黑,黑体,新細明體,Arial,Lucida Grande,sans-serif;">竞标数</li>
						<li style="text-align: center;width:20%;font-family: Hiragino Sans GB,STHeiti,Helvetica,Microsoft Yahei,微软雅黑,黑体,新細明體,Arial,Lucida Grande,sans-serif;">操作</li>
					</ul>
					<c:choose>
						<c:when test="${not empty requirementList}">
							<c:forEach items="${requirementList}" var="var" varStatus="vs">
								<ul>
									<li class="a1 n-tit" style="width:30%;padding-left: 30px;text-align: left;">
									<a href="<%=basePath%>requirementdetail/personnelDetailinfo.act?Id=${var.personnel_id}&flag=true" target="_blank" title="${var.personnel_title}" style="font-family: Hiragino Sans GB,STHeiti,Helvetica,Microsoft Yahei,微软雅黑,黑体,新細明體,Arial,Lucida Grande,sans-serif;">${var.personnel_title}</a></li>						
									<li style="width:12%;text-align: center;font-family: Hiragino Sans GB,STHeiti,Helvetica,Microsoft Yahei,微软雅黑,黑体,新細明體,Arial,Lucida Grande,sans-serif;">${var.publish_date}</li>
									<li style="width:15%;text-align: center;font-family: Hiragino Sans GB,STHeiti,Helvetica,Microsoft Yahei,微软雅黑,黑体,新細明體,Arial,Lucida Grande,sans-serif;">${var.project_month}</li>
									<li style="width:15%;text-align: center;">														
									<a href="<%=basePath%>platform/bidCompanyList.act?personnelId=${var.personnel_id}&flag=1" style="font-family: Hiragino Sans GB,STHeiti,Helvetica,Microsoft Yahei,微软雅黑,黑体,新細明體,Arial,Lucida Grande,sans-serif;">${var.bided_count}</a></li>														
									<li style="width:20%;text-align: center;">
									<c:if test="${var.bided_count!=0}">
										-
									</c:if>
									<c:if test="${var.bided_count==0}">
										<a href="<%=basePath%>requirement/toUpdatePersonelRequirement.act?infoID=${var.personnel_id}" class="modify"style="font-family: Hiragino Sans GB,STHeiti,Helvetica,Microsoft Yahei,微软雅黑,黑体,新細明體,Arial,Lucida Grande,sans-serif;">修改</a>	
										<a class="delete" style="cursor: pointer;font-family: Hiragino Sans GB,STHeiti,Helvetica,Microsoft Yahei,微软雅黑,黑体,新細明體,Arial,Lucida Grande,sans-serif;" data-toggle="modal" title="删除项目需求" id="delpersonel_${var.personnel_id}" onclick="delp(${var.personnel_id},'delpersonel_${var.personnel_id}');" data-target="#delpersonel">删除</a>
									</c:if>
									</li>
								</ul>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<span class="message-nodate" style="color: #ff6a00; margin-left: 380px; font-size: 14px;">没有相关记录</span>
						</c:otherwise>
					</c:choose>
				</form>
			</div>
			<div id="pagePro" class="page-header position-relative" style="display: block;">
				<table style="width: 100%;">
					<tr>
						<td style="align: center;" align="center"><div
								class="pagination"
								style="padding-top: 15px; margin: 0 auto; font-size: 12px; display: inline-block;">${page.platformPageStr}</div></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="modal_h20 fade bs-example-modal-sm in" id="delpersonel"
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
						<p id="warntext">确认删除该人员需求吗？</p>
					</div>
					<div class="modal-footer">
						<input type="hidden" id="idp" value="">
						<button type="button" class="btn btn-success" onclick="DeleteP()"
							data-dismiss="modal">确认</button>
						<button type="button" class="btn btn-default"
							data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<!--<footer开始>-->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!--</footer结束>-->
	
	<script type="text/javascript">
		function xiangmuclick(){
			window.location.href='<%=basePath%>requirement/toProjectRequirement.act';
		}
	    function delp(id, divid) {
			$("#" + divid).attr("data-target", "#delpersonel");
			$("#delpersonel").attr("data-target", "");
			$("#idp").val(id);
		}
	    function DeleteP() {
	    	location.href = "<%=basePath%>requirement/deletePersonelRequirement.act?infoID="+ $("#idp").val();
		}
    </script>
</body>
</html>