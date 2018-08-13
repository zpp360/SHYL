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
<script src="<%=basePath%>/shyl/js/layer/layer.js"></script>
<jsp:include page="../../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
</head>
<body style="background-color: #f7f7f7;">
<div class="clear"></div>
<div class="register-box p0">
	<div class="rticon"></div>
	<jsp:include page="../../common/left.jsp"><jsp:param value="4" name="menuType"/></jsp:include>
	<div class="mypage_right" style="min-height:920px;">
		<h2>职位邀请</h2>
		<div class="tab">
			<a href="javascript:void(0);" onclick="tab0()" id="a1">招聘管理</a>
			<a href="javascript:void(0);" id="a2" class="hover" >职位邀请</a>
		</div>
		<form action="<%=basePath%>company/toInvitation.act" method="post" name="Form" id="Form">
		<div class="tab" style="margin-bottom:0;">
		</div>
		<div class="jianli">
			<table class="tableclass">
				<thead>
					<tr>
						<th style="padding-left: 30px;text-align: left;width: 32%">职位</th>
						<th style="padding-left: 5px;text-align: left;width: 10%">面试者</th>
						<th style="text-align: center;width: 25%">面试时间</th>
						<th style="text-align: left;width: 33%">备注</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
				<c:when test="${not empty companyInvitationList}">
					<c:forEach items="${companyInvitationList}" var="var" varStatus="vs">
						<tr>
							<td class="tds" style="padding-left: 30px;text-align: left;" title="${var.POSITION_NAME}">
								<a id="postion_id${vs.index}" href="javascript:void(0);" target="_blank" onclick="return showJob('postion_id${vs.index}','${var.company_id}','${var.recruitment_info_id}');">
								${var.POSITION_NAME}
								</a>
							</td>
							<td class="tds" style="text-align: left;padding-left: 5px;" title="${var.NAME}">
								<a id="cv_id${vs.index}" href="javascript:void(0);" target="_blank" onclick="return showCv('cv_id${vs.index}','${var.cv_user_id}','${var.cv_id}');">
								${var.NAME}
								</a>							
							</td>
							<td style="text-align: center;">${var.application_time}</td>
							<td class="tds" style="text-align: left;" title="${var.remarks}">
								<a href="javaScript:void(0)" onclick="invitationDetail('${var.remarks}')">${var.remarks}</a>
							</td>
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
	<div class='modal my-modal-alert' id='my-modal-errorfile-alert'>
		<div class='modal-dialog boxBodySmall'>
			<div class='modal-content'
				style="width: 260px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
				<div class='modal-body' id='modal-body-alert'>
					<div style="float:left;margin-bottom:15px;"><img alt="" src="<%=basePath%>shyl/images/mark.png"></div><div style="float:right;margin-right:50px;margin-top:5px;" id="warntext"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="clear"></div>
<script type="text/javascript">
function tab0() {
	window.location.href = '<%=basePath%>company/toJobManager.act';
}
function invitationDetail(str){
	layer.alert(str);
	return false;
}
//打开职位
function showJob(id, companyId, recruitmentInfoId) {
		var ret=false;
    	//通过Ajax向后台传值
		$.ajax({
			type : "POST",
			url :'<%=basePath%>'+'company/existJob.act',
			data : {
				company_id : companyId,
				recruitment_info_id : recruitmentInfoId
			},
			dataType : 'json',
			async:false, 
			success : function(data) {
				if(data.result=="0"){
					$("#" + id).attr('href',"<%=basePath%>job/detail/info.act?companyId="+companyId+"&positionId="+recruitmentInfoId+"&flag=control");
					ret=true;
				}else{
					$('#warntext').html("该职位已被删除！");
					$('#my-modal-errorfile-alert').show ().delay (1000).fadeOut ();
				}
				
			}
		});
    	return ret;		
}

//打开简历
function showCv(id, cvUserId, cvId) {
		var ret=false;
    	//通过Ajax向后台传值
		$.ajax({
			type : "POST",
			url :'<%=basePath%>'+'company/existCv.act',
			data : {
				userId : cvUserId,
				cvId : cvId
			},
			dataType : 'json',
			async:false, 
			success : function(data) {
				if(data.result=="0"){
					
					$("#" + id).attr('href',"<%=basePath%>company/showResume.act?userId="+ cvUserId +"&cvId=" + cvId + "&flag=personel");
					ret=true;
				}else{
					$('#warntext').html("该简历已被删除！");
					$('#my-modal-errorfile-alert').show ().delay (1000).fadeOut ();
				}
				
			}
		});
    	return ret;		
}
</script>
<!--<footer开始>-->
<jsp:include page="../../common/footer.jsp"></jsp:include>
<!--</footer结束>-->
</html>
