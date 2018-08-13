<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv=”X-UA-Compatible” content=”IE=EmulateIE7″ />
<meta charset="utf-8">
<title>人才通道_济南市服务外包公共服务平台</title>
<link href="<%=basePath%>shyl/css/maincss/rencai.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<script src="<%=basePath%>shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<jsp:include page="../../common/header.jsp"><jsp:param name="id" value="rctd" /></jsp:include>
<script src="<%=basePath%>shyl/js/jquery-1.7.2.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<script src="<%=basePath%>shyl/js/affairs/box.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/jquery.bxslider.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="<%=basePath%>shyl/css/maincss/jquery.bxslidernew.css" />
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	var listSize = $("#listSize").val();
	if (listSize > 6) {
		 $(".bxslider").bxSlider({auto: true,controls:false});
	} else {
		$(".bxslider").bxSlider({auto: false,controls:false});
	}
});
</script>
<style type="text/css">
div.rc_qy_2{
	 word-wrap: break-word; 
	 word-break: normal; 
}
.test{
vertical-align: 
}
.s1{
	width:85px;
	display: block;
	overflow: hidden;
	float:left;
 	white-space: nowrap;   
 	text-overflow: ellipsis; 
 	white-space: nowrap;   
 	text-overflow: ellipsis;
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
<div class="rc_qy_paihang clearfix">
	<div class="rc_qy_1">
		<div class="rc_qy_1_1">
			 <div class="mypage_image" style="width:100%;height:100%;">
			  <img onerror="showImgDelay(this,'<%=basePath%>shyl/images/mylogo.jpg');" src="<%=basePath%>images/${pd.LOGO}" alt="LOGO" style="width: 100%; height: 100%;" >
			</div>
		</div>
		<div class="rc_qy_1_2">
			<ul>
				<c:if test="${pd.COMPANY_TYPE=='0'}">
				<li title="${pd.COMPANY_NAME}" style="display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">公司名称：${pd.COMPANY_NAME}</li>
				</c:if>
				<c:if test="${pd.COMPANY_TYPE=='1'}">
				<li title="${pd.COMPANY_NAME}" style="display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">单位名称：${pd.COMPANY_NAME}</li>
				</c:if>
				<c:if test="${pd.COMPANY_TYPE=='2'}">
				<li title="${pd.COMPANY_NAME}" style="display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">机构名称：${pd.COMPANY_NAME}</li>
				</c:if>
				<li>组织机构代码：${pd.ORGANIZE_CODE}</li>
				<c:if test="${pd.COMPANY_TYPE=='0'}">
				<li>公司地址：${pd.ADDRESS_PROVINCE}</li>
				</c:if>
				<c:if test="${pd.COMPANY_TYPE=='1'}">
				<li>单位地址：${pd.ADDRESS_PROVINCE}</li>
				</c:if>
				<c:if test="${pd.COMPANY_TYPE=='2'}">
				<li>机构地址：${pd.ADDRESS_PROVINCE}</li>
				</c:if>
				<li>注册日期：${pd.REGISTRATION_TIME}</li>
				<c:if test="${pd.COMPANY_TYPE=='0'}">
				<li>公司性质：${pd.ENTERPRISE_NATURE}</li>
				</c:if>
				<c:if test="${pd.COMPANY_TYPE=='1'}">
				<li>单位性质：${pd.ENTERPRISE_NATURE}</li>
				</c:if>
				<c:if test="${pd.COMPANY_TYPE=='2'}">
				<li>机构性质：${pd.ENTERPRISE_NATURE}</li>
				</c:if>
				<li title="<c:if test="${pd.industy_name == '' || pd.industy_name == null}">无</c:if><c:if test="${pd.industy_name != '' && pd.industy_name != null}">${pd.industy_name}</c:if>" style="display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">行业范围：<c:if test="${pd.industy_name == '' || pd.industy_name == null}">无</c:if><c:if test="${pd.industy_name != '' && pd.industy_name != null}">${pd.industy_name}</c:if></li>
				<li>注册资金：<c:if test="${pd.REGISTERED_CAPITAL == '' || pd.REGISTERED_CAPITAL == null}">0</c:if><c:if test="${pd.REGISTERED_CAPITAL != '' && pd.REGISTERED_CAPITAL != null}">${pd.REGISTERED_CAPITAL}</c:if></li>
				<li>员工数：<c:if test="${pd.SCALE == '' || pd.SCALE == null}">0</c:if><c:if test="${pd.SCALE != '' && pd.SCALE != null}">${pd.SCALE}</c:if>人</li>
				<li>联系人：${pd.CONTACT}</li>
				<li>联系电话：${pd.CONTACT_TEL}</li>
				<li style="display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">官    网：${pd.WEBSITE}</li>
				<li>E_mail：${pd.MAIL}</li>
			</ul>
		</div>
	</div>
	<h1>发展简介</h1>
	<div class="rc_qy_2">
    <pre>${pd.COMPANY_INTRODUCTION}</pre> 
	</div>
	<c:if test="${pd.COMPANY_TYPE=='0'}">
	<h1>公司环境</h1>
	</c:if>
	<c:if test="${pd.COMPANY_TYPE=='1'}">
	<h1>公司环境</h1>
	</c:if>
	<c:if test="${pd.COMPANY_TYPE=='2'}">
	<h1>机构环境</h1>
	</c:if>
		<c:choose>
			<c:when test="${not empty comPictUploadList}">
				<div class="scrollBox b">
					<div class="ohbox">
						<ul class="piclist">
							<c:forEach items="${comPictUploadList}" var="var">
								<li><img style="width: 100%; height: 100%;"
									onerror="showImgDelay(this,'<%=basePath%>shyl/images/mylogo.jpg');"
									onclick="showOriginalPhoto('<%=basePath%>','${var.path}')"
									src="<%=basePath%>images/${var.path}" id="${var.id}"
									name="imgC" /></li>
							</c:forEach>
						</ul>
					</div>
					<div class="pageBtn">
						<span class="prev">&lsaquo;</span> <span class="next">&rsaquo;</span>
						<ul class="list">
							<c:forEach var="i" begin="1" end="${pd.picCount}">
								<li></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="rc_qy_2">&nbsp;&nbsp;&nbsp;没有相关公司环境图片</div>
			</c:otherwise>
		</c:choose>
		<script type="text/javascript">
		$(".b").hover(function(){
			$(this).find(".prev,.next").fadeTo("show",0.3);
		},function(){
			$(this).find(".prev,.next").hide();
		})
		/*鼠标移过某个按钮 高亮显示*/
		$(".prev,.next").hover(function(){
			$(this).fadeTo("show",0.8);
		},function(){
			$(this).fadeTo("show",0.3);
		})
	
		jQuery(".b").slide({ titCell:".list li", mainCell:".piclist", effect:"left",vis:4,scroll:4,delayTime:800,trigger:"click",easing:"easeOutCirc"});
	</script>
	<c:if test="${pd.COMPANY_TYPE=='0'}">
	<h1>企业招聘</h1>
	</c:if>
	<c:if test="${pd.COMPANY_TYPE=='1'}">
	<h1>企业招聘</h1>
	</c:if>
	<c:if test="${pd.COMPANY_TYPE=='2'}">
	<h1>机构招聘</h1>
	</c:if>
	<c:choose>
			<c:when test="${not empty comPositionList}">
				<div class="scrollBox a" style="height: 200px;">
					<ul class="bxslider">
						<li>
							<div class="qyzp" id="qyzp1"
								style="overflow: hidden; position: relative; margin-top: 0px; height: 200px;">
								<input type="hidden" id="listSize"
									value="${fn:length(comPositionList)}">
								<dl class="dllist">
									<c:forEach items="${comPositionList}" var="var" varStatus="vs">
										<dt>
											<h1
												style="display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${var.POSITION_NAME}</h1>
											<i
												style="display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${var.COMPANY_NAME}</i>
											<div class="hang">
												<span class="s1" title="${var.WORK_PLACE_CITY}">${var.WORK_PLACE_CITY}</span><span
													class="s4">${var.UPDATE_TIMESTAMP}</span>
											</div>
											<a
												href="<%=basePath%>job/detail/info.act?companyId=${var.USER_ID}&positionId=${var.RECRUITMENT_INFO_ID}&flag=findJob"
												class="viewbtn" target="_blank">立即查看</a>
										</dt>
									</c:forEach>

								</dl>
							</div>
						</li>
					</ul>
					<div class="pageBtn">
						<span class="prev">&lsaquo;</span> <span class="next">&rsaquo;</span>
						<ul class="list">
							<c:forEach var="i" begin="1" end="2">
								<li></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="rc_qy_2">&nbsp;&nbsp;&nbsp;没有相关招聘信息</div>
			</c:otherwise>
		</c:choose>
		<script type="text/javascript">
			$(".a").hover(function() {
				$(this).find(".prev,.next").fadeTo("show", 0.3);
			}, function() {
				$(this).find(".prev,.next").hide();
			})
			/*鼠标移过某个按钮 高亮显示*/
			$(".prev,.next").hover(function() {
				$(this).fadeTo("show", 0.8);
			}, function() {
				$(this).fadeTo("show", 0.3);
			})
	
			jQuery(".a").slide({
				titCell : ".list li",
				mainCell : ".dllist",
				effect : "left",
				vis : 6,
				scroll : 6,
				delayTime : 800,
				trigger : "click",
				easing : "easeOutCirc"
			});
		</script>
</div>

<div class="clear"></div>
<%@ include file="../../common/footer.jsp"%>
</body>
<script type="text/javascript">
	//显示图片处理1
	function showOriginalPhoto(pathbas, path) {
		if (path.indexOf("shyl/images/mylogo.jpg") < 0) {
			var newwin = window.open();
			newwin.document
					.write("<div align='center'><img src='"+pathbas+"images/"+path+"'/></div>");
		}
	}
</script>
</html>
