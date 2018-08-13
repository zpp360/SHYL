<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv=”X-UA-Compatible” content=”IE=EmulateIE7″ charset="utf-8"/>
<title>职位详情_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">
<jsp:include page="../../common/header.jsp"><jsp:param name="id" value="rctd" /></jsp:include>
<script src="<%=basePath%>shyl/js/mainjs/box.js" type="text/javascript"></script>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css"/>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/job/jobDetail.js" type="text/javascript"></script>
<link href="<%=basePath%>shyl/css/maincss/rencai.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
div.zwms_cc{
	 word-wrap: break-word; 
	 word-break: normal; 
}
pre { 
border:dashed 0px ;
background:transparent;
color:#8a8a8a;
font-size:14px;
font-family:微软雅黑,黑体,新細明體;
white-space: pre-wrap; /*css-3*/ 
white-space: -moz-pre-wrap; /*Mozilla,since1999*/ 
white-space: -pre-wrap; /*Opera4-6*/ 
white-space: -o-pre-wrap; /*Opera7*/ 
word-wrap: break-word; /*InternetExplorer5.5+*/ 
} 
</style>

</head>
<body>	

<div class="clear"></div>
<div class="register-box clearfix">
	<div class="rticon"></div>
	<h2 style="width:100%;">
		职位名称：<c:if test="${fn:length(resultPd.position_name) >=30}"><span title="${resultPd.position_name}">${fn:substring(resultPd.position_name,0, 30)}...</span></c:if><c:if test="${fn:length(resultPd.position_name) < 30}">${resultPd.position_name}</c:if><i>${resultPd.update_time}</i>
	</h2>
	<div class="register-box-1" style="width:100%;">
		<div class="register-box-left" style="width:55%;height:100%;">
			<c:if test="${resultPd.company_type=='0'}">
			<h3>公司名称：<a href="<%=basePath%>company/info.act?companyId=${resultPd.company_id}">${resultPd.company_name}</a></h3>
			</c:if>
			<c:if test="${resultPd.company_type=='1'}">
			<h3>单位名称：<a href="<%=basePath%>company/info.act?companyId=${resultPd.company_id}">${resultPd.company_name}</a></h3>
			</c:if>
			<c:if test="${resultPd.company_type=='2'}">
			<h3>机构名称：<a href="<%=basePath%>company/info.act?companyId=${resultPd.company_id}">${resultPd.company_name}</a></h3>
			</c:if>
			<br>
			<br>
			<ul>
				<li title="${resultPd.position_name}" style="display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">职位类别：${resultPd.position_type_name}</li>
				<li>招聘范围：${resultPd.oriented_group}</li>
				<li>薪资待遇：<span>
					<c:if test="${resultPd.salary == null or resultPd.salary == '' }">不限</c:if>
					<c:if test="${resultPd.salary != null and resultPd.salary != '' }">${resultPd.salary}</c:if>
				</span></li>
				<li>招聘人数：${resultPd.recruitment_number}人</li>
				<li>工作年限：
					<c:if test="${resultPd.working_life == null or resultPd.working_life == '' }">不限</c:if>
					<c:if test="${resultPd.working_life != null and resultPd.working_life != '' }">${resultPd.working_life}</c:if>
				</li>
				<li>工作类型：
					<c:if test="${resultPd.job_type == null or resultPd.job_type == '' }">不限</c:if>
					<c:if test="${resultPd.job_type != null and resultPd.job_type != '' }">${resultPd.job_type}</c:if>
				</li>
				<li>学历要求：
					<c:if test="${resultPd.education == null or resultPd.education == '' }">不限</c:if>
					<c:if test="${resultPd.education != null and resultPd.education != '' }">${resultPd.education}</c:if>
				</li>
				<li>工作地点：${resultPd.work_place_city}</li>
			</ul>
			<div class="zwms" style="height:50%;margin-top:25px;">
				<h1>职位描述</h1>
				<div class="zwms_cc" style=" word-wrap: break-word; word-break: normal;"id="job_description" >
				<pre>${resultPd.job_description}</pre> 
				</div>
				</div>
		</div>
		<div class="register-box-right">
			<div class="sc">
			<p class="text-center" data-toggle="modal" id="favsqzw">
			<a href="#" onclick="Tip('favsqzw');" class="qy_shoucang" style="float: left;">投简历</a></p><p class="text-center" data-toggle="modal" id="favpost"><a href="#" onclick="TipFav('favpost');" class="qy_shoucang">收藏</a></p></div>
				<h1><img onerror="showImgDelay(this,'<%=basePath%>shyl/images/mylogo.jpg');" src="<%=basePath%>images/${resultPd.logo}" style="height:185px;width:185px;margin-top:25px;display: inline-block;background-color: #fff;box-shadow: 0 0 15px #eef1fb;text-align: center;margin-bottom: 40px;line-height: 185px;"/></h1>
				<h1>${resultPd.company_name}</h1>
				<c:if test="${resultPd.company_type=='0'}">
				<p>
					公司行业：${resultPd.industry}<br/>
					公司规模：${resultPd.scale}人<br/>
					公司性质：<c:if test="${resultPd.enterprise_nature != null || resultPd.enterprise_nature !=''}">${resultPd.enterprise_nature}</c:if><c:if test="${resultPd.enterprise_nature == null || resultPd.enterprise_nature ==''}">无</c:if>
				</p>
				</c:if>
				<c:if test="${resultPd.company_type=='1'}">
				<p>
					所属行业：${resultPd.industry}<br/>
					单位规模：${resultPd.scale}人<br/>
					单位性质：<c:if test="${resultPd.enterprise_nature != null || resultPd.enterprise_nature !=''}">${resultPd.enterprise_nature}</c:if><c:if test="${resultPd.enterprise_nature == null || resultPd.enterprise_nature ==''}">无</c:if>
				</p>
				</c:if>
				<c:if test="${resultPd.company_type=='2'}">
				<p>
					所属行业：${resultPd.industry}<br/>
					机构规模：${resultPd.scale}人<br/>
					机构性质：<c:if test="${resultPd.enterprise_nature != null || resultPd.enterprise_nature !=''}">${resultPd.enterprise_nature}</c:if><c:if test="${resultPd.enterprise_nature == null || resultPd.enterprise_nature ==''}">无</c:if>
				</p>
				</c:if>
		</div>
	</div>
	<input type = "hidden" id ="companyId" value="${resultPd.company_id}"/>
	<input type = "hidden" id ="recruitmentId" value="${resultPd.recruitment_info_id}"/>
	<input type = "hidden" id ="userId" value="${sessionScope.platUser.USER_ID}"/>
	<div class="modal fade bs-example-modal-sm in" id="sqzw11" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm" style="margin-top:250px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="mySmallModalLabel">申请职位</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label class=" control-label">请选择要投递的简历 ：</label> 
						<select class="form-control input-sm" id="resume" name="resume">
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<button id="sendcv" class="btn btn-success" onclick="sendCv('sendcv');">确定</button>
					<button data-dismiss="modal" class="btn btn-default">关闭</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade bs-example-modal-sm" tabindex="-1"
		id="layhomewarn" role="dialog" aria-labelledby="mySmallModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm" style="margin-top:250px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="mySmallModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<p id="warntext">
						请登录后操作！点此&nbsp;<a href="<%=basePath%>userLogin/goLogin.act?returnUrl=job/detail/info.act?companyId=${resultPd.company_id}%26positionId=${resultPd.recruitment_info_id}"
							class="button btn-succes"><b
							style="text-decoration: underline">登录</b></a>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
<div class='modal my-modal-alert' id='my-modal-job-alert'>
      <div class='modal-dialog boxBodySmall'>
          <div class='modal-content' style="width:350px;text-align:center;position:fixed;right:45%;bottom:50%;">
              <div class='modal-body' id='modal-body-alert'>
                  <img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;<label id="alertText">修改成功!</label>
              </div>
          </div>
      </div>
</div>
<div class="clear"></div>
<%@ include file="../../common/footer.jsp"%>
	<div class="modaldel fade in" id="prompt" tabindex="-1" role="dialog"
		aria-labelledby="delresume" aria-hidden="false" data-backdrop="static"
		data-target="" style="display: none;">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						onclick="closePrompt();">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<p id="warntext">该职位已删除，请浏览其它！</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" onclick="closePrompt();"
						id="d">关闭</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
