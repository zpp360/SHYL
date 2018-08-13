<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>人才通道_济南市服务外包公共服务平台</title>
<jsp:include page="common/header.jsp"><jsp:param name="id" value="rctd" /></jsp:include>
<script src="/SHYL/shyl/js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="/SHYL/shyl/js/affairs/box.js" type="text/javascript"></script>
<script src="/SHYL/shyl/js/mainjs/jquery.bxslider.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="<%=basePath%>shyl/css/maincss/jquery.bxslidernew.css" />
<link href="/SHYL/shyl/css/maincss/rencai.css" rel="stylesheet" type="text/css">
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<style type="text/css">
.imgNew{
	-moz-box-shadow:0px 0px 5px #999 inset !important ;               /* For Firefox3.6+ */
	-webkit-box-shadow:0px 0px 5px #999 inset !important ;            /* For Chrome5+, Safari5+ */
	box-shadow:0px 0px 5px #999 inset !important ;                    /* For Latest Opera */
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	 $("#resume_li").mouseover(function(){
		  $("#mrckRenCai").hide();
		  $("#bxSliderComp").hide();
		  $("#bxSlider").show();
		});
	 $("#talent_li").mouseover(function(){
		  $("#bxSlider").hide();
		  $("#mrckRenCai").show();
		  $("#bxSliderComp").hide();
		});
	 $("#enterprise_li").mouseover(function(){
		  $("#bxSlider").hide();
		  $("#mrckRenCai").hide();
		  $("#bxSliderComp").show();
		});
     var varListSize = $("#varList_listSize").val();
     if (varListSize > 8) {
    	 $(".bxSlider").bxSlider({
    		 useCSS: false,
    		  infiniteLoop: true,
    		  hideControlOnEnd: true,
    		  easing: 'easeOutElastic'});
     }
     // 展会服务list
     var companyListSize = $("#companyList_listSize").val();
     if (companyListSize > 2) {
    	   $(".bxSliderComp").bxSlider({useCSS: false,
    		  infiniteLoop: true,
    		  hideControlOnEnd: true,
    		  easing: 'easeOutElastic'});
     }
	 var userType = $("#userType").val();
	 if (userType == null || userType == '') {
		 $("#talent").hide();

	 } else if (userType == 1||userType == 4||userType==5) {
		 //个人或院校用户，不显示人才库
		 $("#talent").hide();
	 } else if (userType == 2 || userType == 3) {
	 }
});
</script>
</head>
<body>
<!--<banner开始>-->
<input type="hidden" id="varList_listSize" value="${fn:length(varList)}"/>
<input type="hidden" id="companyList_listSize" value="${fn:length(companyList)}"/>
<div class="mbanner" style="height:373px">
<input type="hidden" name="number" id="number" value="${num.num}"/>
    <ul class="b2">
    <c:choose>
	        <c:when test="${not empty bannerList}">
	    		<c:forEach items="${bannerList}" var="banner" varStatus="vs">
	    			<li><a href="" title="" target=""><img src="<%=basePath%>images/${banner.file_path}" style="width:1920px;"></a></li>
	    		</c:forEach>
	    	</c:when>
	    	<c:otherwise>
        <li><a><img src="<%=basePath%>shyl/images/banner/recruit.jpg"></a></li>
        <li><a><img src="<%=basePath%>shyl/images/banner/recruit2.jpg"></a></li>
        <li><a><img src="<%=basePath%>shyl/images/banner/recruit3.jpg"></a></li>
       </c:otherwise>
       </c:choose>
    </ul>
	<div class="num">
		<ul>
		</ul>
	</div>
</div>
<script>
var number = $('#number').val();
var width_banner = '';
if(number == 0){
	width_banner = -3*10;
}else{
	width_banner = -number*10;
}
$('.num').css("margin-left",width_banner);
$(".mbanner").slide({ titCell:".num ul" , mainCell:".b2" , effect:"fold", autoPlay:true, delayTime:500 , autoPage:true });
</script>

<div class="clear"></div>
	<div class="cmain rc clearfix" style="min-height:648px">
		<div class="cmain_l_2 clearfix">
			<i></i>
			<ul>
				<c:forEach items="${pList}" var="vp" varStatus="vs">
					<c:if test="${!vs.last}" >
					<li>
						<h1>
							<a style="text-decoration:none;">${vp.POSITION_NAME}</a>
						</h1> 
						<c:forEach items="${map}" var="maps">
						<c:if test="${maps.key==vp.POSITION_ID}">
						<c:forEach var="c" items="${maps.value}">
						<a href="javascript:void(0);" id="${c.POSITION_ID}"
									onclick="test('${c.POSITION_ID}')">${c.POSITION_NAME}</a>
						</c:forEach> 
						  </c:if>
						</c:forEach>
					</li>
					</c:if>
					<c:if test="${vs.last && go.count%2==1}  " >
						<li style="border-right: 7px solid #fff;">
						<h1>
							<a style="text-decoration:none;">${vp.POSITION_NAME}</a>
						</h1> 
						<c:forEach items="${map}" var="maps">
						<c:if test="${maps.key==vp.POSITION_ID}">
						<c:forEach var="c" items="${maps.value}">
						<a href="javascript:void(0);" id="${c.POSITION_ID}"
									onclick="test('${c.POSITION_ID}')">${c.POSITION_NAME}</a>
						</c:forEach> 
						  </c:if>
						</c:forEach>
					</li>
					</c:if>
				</c:forEach>
				<li style="float: left;margin-top: -18px;"><a style="color: #3864cd;" href="<%=basePath%>joblist/tolist.act?Oriented_group=0">更多</a></li>
			</ul>
			
		</div>
		<div class="cmain_r_2">
			<ul>
			<c:forEach items="${recruitmentAllList}" var="ra" >
			<c:if test="${not empty recruitmentAllList}">
				<li >
								<a href="<%=basePath%>job/detail/info.act?companyId=${ra.user_id}&positionId=${ra.RECRUITMENT_INFO_ID}&flag=findJob" target="_blank"><i>${ra.SALARY }</i><div style="display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">${ra.POSITION_NAME}</div></a>
								<span>${ra.jobType} |  ${ra.WORK_PLACE_CITY}  | ${ra.COMPANY_NAME}</span>
								<div class="cmain_r_2_i">
								<i><a href="<%=basePath%>job/detail/info.act?companyId=${ra.user_id}&positionId=${ra.RECRUITMENT_INFO_ID}&flag=findJob" target="_blank">详细</a></i>
								</div>
								</li>
			</c:if>
			</c:forEach>
			</ul>
		</div>
	</div>

<div class="clear"></div>
<div class="cmainnew rck clearfix">
  <div class="m-slide2"> 
   <ul class="tab"> 
    <li id="resume_li"> <a id="resume" href="<%=basePath%>joblist/tolist.act?Oriented_group=1">校园招聘</a> </li>
    <li id="talent_li"> <a id="talent" href="<%=basePath%>company/toPersonnelList.act">人才库</a> </li>
    <li id="enterprise_li"> <a id="enterprise" href="<%=basePath%>joblist/toCompanyList.act">企业库</a> </li>
   </ul> 
   <ul class="img imgNew" id="Arr"> 
   <li class="bxSlider" id="bxSlider">
    	<div class="jltj" id="recruitment1" style="overflow:hidden;margin-top:0px;height: 433px;">
	    	<dl>
	    	<c:choose>
					<c:when test="${not empty varList}">
						<c:forEach items="${varList}" var="var" varStatus="vs">
						<c:if test="${vs.index < 8 }">
					    	<dt>
					    	 <h1 style="display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">${var.POSITION_NAME}</h1>
					    	 <i  style="display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">${var.COMPANY_NAME}</i>
					    	 <div class="hang"><span class="s1">${var.WORK_PLACE_CITY}</span><br><span class="s4">${var.UPDATE_TIMESTAMP}</span></div>
							 <a href="<%=basePath%>job/detail/info.act?companyId=${var.USER_ID}&positionId=${var.RECRUITMENT_INFO_ID}&flag=findJob" class="viewbtn" target="_blank">立即查看</a>
				    		</dt>
				    	</c:if>
						</c:forEach>
					</c:when>
		     <c:otherwise>
						<dt>
							<h1>没有相关数据</h1>
						</dt>
					</c:otherwise>
				</c:choose>
	    	</dl>
    	</div>
    	<div class="jltj" id="recruitment2" style="overflow:hidden;margin-top:0px;height: 433px;width:50%;">
	    	<dl>
	    		    	<c:choose>
					<c:when test="${not empty varList}">
						<c:forEach items="${varList}" var="var" varStatus="vs">
						  <c:if test="${vs.index >= 8 }">
					    	<dt>
					    	 <h1 style="display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">${var.POSITION_NAME}</h1>
					    	 <i style="display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">${var.COMPANY_NAME}</i>
					    	 <div class="hang"><span class="s1">${var.WORK_PLACE_CITY}</span><br><span class="s4">${var.UPDATE_TIMESTAMP}</span></div>
							 <a href="<%=basePath%>job/detail/info.act?companyId=${var.USER_ID}&positionId=${var.RECRUITMENT_INFO_ID}&flag=findJob" class="viewbtn" target="_blank">立即查看</a>
				    		</dt>
				    	</c:if>
						</c:forEach>
					</c:when>
		     <c:otherwise>
						<dt>
							<h1>没有相关数据</h1>
						</dt>
					</c:otherwise>
				</c:choose>
	    	</dl>
    	</div>
    </li>
    <li class="mrckRenCai" id="mrckRenCai">
    	<div class="mrck">
	    	<dl>
	    		    	<c:choose>
					<c:when test="${not empty personnelList}">
						<c:forEach items="${personnelList}" var="var" varStatus="vs">
					    	<dt>
					    	    <c:if test="${var.SEX == '女' }">
					    	    <img onerror="showImgDelay(this,'<%=basePath%>shyl/images/f-w.png');" src="<%=basePath%>images/${var.USER_PICTURE}"/>
					    	    </c:if>
                                <c:if test="${var.SEX != '女' }">
                                <img onerror="showImgDelay(this,'<%=basePath%>shyl/images/f-m.png');" src="<%=basePath%>images/${var.USER_PICTURE}"/>
                                </c:if>
					    		<h1 style="display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">${var.NAME}</h1>
					    		<p><i>简历名称:</i>${var.CV_NAME}</p>
					    		<p><i>期望地点:</i><span class="color_f45e5e">${var.EXPECTED_WORK_CITY}</span></p>
					    		<p><i>期望薪资:</i>${var.EXPECTED_SALARY}</p>
					    		<a href="<%=basePath%>company/showResume.act?userId=${var.USER_ID}&cvId=${var.CV_ID}&flag=personel" class="viewbtn2">查看详细履历</a>
					    	</dt>
						</c:forEach>
					</c:when>
		     <c:otherwise>
						<dt>
							<h1>没有相关数据</h1>
						</dt>
					</c:otherwise>
				</c:choose>

	    	</dl>
    	</div>
    </li>
    <li class="bxSliderComp" id="bxSliderComp">
    	<div class="mqyk" id="company1" style="overflow:hidden;margin-top:10px;height: 433px;">
	    	<dl>
	    	<c:choose>
					<c:when test="${not empty companyList}">
						<c:forEach items="${companyList}" var="var" varStatus="vs">
						<c:if test = "${vs.index == 0 || vs.index == 1}">
						    	<dt>
						    		<c:if test="${var.LOGO != null && var.LOGO !=''}">
					    		      <img onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="<%=basePath%>images/${var.LOGO}">
					    		    </c:if>
					    		    <c:if test="${var.LOGO == null || var.LOGO ==''}">
					    		     <img src="<%=basePath%>shyl/images/temp.png">
					    		    </c:if>
						    		<div class="mqyk_rr"><h1>企业名称：<a style="display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" href="<%=basePath%>company/info.act?companyId=${var.USER_ID}" target="_blank" title="">${var.COMPANY_NAME}</a></h1>
						    		<i>规模：${var.SCALE}人</i>
						    		</div>
						    		<span style="display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title="<c:if test="${var.industy_name == '' || var.industy_name == null}">无</c:if><c:if test="${var.industy_name != '' && var.industy_name != null}">${var.industy_name}</c:if>">行业： <c:if test="${var.industy_name == '' || var.industy_name == null}">无</c:if><c:if test="${var.industy_name != '' && var.industy_name != null}">${var.industy_name}</c:if>  </span><span>性质：  <c:if test="${var.ENTERPRISE_NATURE == '' || var.ENTERPRISE_NATURE == null}">无</c:if><c:if test="${var.ENTERPRISE_NATURE != '' && var.ENTERPRISE_NATURE != null}">${var.ENTERPRISE_NATURE}</c:if></span>
						    		<p>${var.COMPANY_INTRODUCTION}</p>
						    	</dt>
						 </c:if>
						</c:forEach>
					</c:when>
		     <c:otherwise>
						<dt>
							<h1>没有相关数据</h1>
						</dt>
					</c:otherwise>
				</c:choose>
	    	</dl>
    	</div>
    	
    	<div class="mqyk" id="company2" style="overflow:hidden;margin-top:10px;height: 433px;">
	    	<dl>
	    	<c:choose>
					<c:when test="${not empty companyList}">
						<c:forEach items="${companyList}" var="var" varStatus="vs">
						<c:if test = "${vs.index == 2 || vs.index == 3}">
						    	<dt>
						    		<c:if test="${var.LOGO != null && var.LOGO !=''}">
					    		      <img onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="<%=basePath%>images/${var.LOGO}">
					    		    </c:if>
					    		    <c:if test="${var.LOGO == null || var.LOGO ==''}">
					    		     <img src="<%=basePath%>shyl/images/temp.png">
					    		    </c:if>
						    		<div class="mqyk_rr"><h1>企业名称：<a style="display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" href="<%=basePath%>company/info.act?companyId=${var.USER_ID}" target="_blank" title="">${var.COMPANY_NAME}</a></h1>
						    		<i>规模：${var.SCALE}人</i>
						    		</div>
						    		<span style="display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title="<c:if test="${var.industy_name == '' || var.industy_name == null}">无</c:if><c:if test="${var.industy_name != '' && var.industy_name != null}">${var.industy_name}</c:if>">行业： <c:if test="${var.industy_name == '' || var.industy_name == null}">无</c:if><c:if test="${var.industy_name != '' && var.industy_name != null}">${var.industy_name}</c:if>  </span><span>性质：  <c:if test="${var.ENTERPRISE_NATURE == '' || var.ENTERPRISE_NATURE == null}">无</c:if><c:if test="${var.ENTERPRISE_NATURE != '' && var.ENTERPRISE_NATURE != null}">${var.ENTERPRISE_NATURE}</c:if></span>
						    		<p>${var.COMPANY_INTRODUCTION}</p>
						    	</dt>
						 </c:if>
						</c:forEach>
					</c:when>
		     <c:otherwise>
						<dt>
							<h1>没有相关数据</h1>
						</dt>
					</c:otherwise>
				</c:choose>
	    	</dl>
    	</div>
    </li>
   </ul>
  </div> 
  <script type="text/javascript">
		$(".m-slide2").slide({ titCell:".tab li", mainCell:".img",effect:"fold", delayTime:200});
  </script> 
</div>

<div class="clear"></div>
<div class="cmainnew qzzl clearfix">
  <div class="m-slide"> 
   <ul class="tab"> 
    <li> <a href="<%=basePath%>joblist/typeList.act?CATEGORY=0">求职指南</a> </li>
    <li> <a href="<%=basePath%>joblist/goSchoolRanking.act">校园展示</a> </li>

   </ul> 
   <ul class="img"> 
    <li>
    	<div class="qiuzhi">
	    	<div class="qiuzhi_l">
		    	<dl>
		    		<c:choose>
		    			<c:when test="${not empty skillList}">
		    				<c:forEach items="${skillList}" var="skillVar" varStatus="vs">
		    					<dt class="qiuzhi_image">
		    						<c:if test="${skillVar.GUIDE_THUMBNAIL != null && skillVar.GUIDE_THUMBNAIL !=''}">
					    		      <img onerror="showImgDelay(this,'<%=basePath%>shyl/images/ceshi1.jpg');" src="<%=basePath%>images/${skillVar.GUIDE_THUMBNAIL}">
					    		    </c:if>
					    		    <c:if test="${skillVar.GUIDE_THUMBNAIL == null || skillVar.GUIDE_THUMBNAIL ==''}">
					    		     <img src="<%=basePath%>shyl/images/ceshi1.jpg">
					    		    </c:if>
					    		    <div class="qiuzhi_l_c">
					    		    	<a href="<%=basePath%>joblist/employmentGuide.act?EMPLOYMENT_ID=${skillVar.EMPLOYMENT_ID}&CATEGORY=1&flag=1">
								    		<h1>${skillVar.TITLE}</h1>
								    		<p>${skillVar.GUIDE_CONTENT}</p>
							    		</a>
						    		</div>
		    					</dt>
		    				</c:forEach>
		    			</c:when>
		    			<c:otherwise>
							<dt class="qiuzhi_image">
					    		<img src="<%=basePath%>shyl/images/ceshi1.jpg">
					    		<div class="qiuzhi_l_c">
						    		<h1>没有相关数据</h1>
					    		</div>
				    		</dt>
						</c:otherwise>
		    		</c:choose>
		    		
		    		<c:choose>
		    			<c:when test="${not empty questionList}">
		    				<c:forEach items="${questionList}" var="questionVar" varStatus="vs">
		    					<dd><a href="<%=basePath%>joblist/employmentGuide.act?EMPLOYMENT_ID=${questionVar.EMPLOYMENT_ID}&CATEGORY=0&flag=0">
		    						<i>${questionVar.UPDATE_TIMESTAMP1}</i> |  ${questionVar.TITLE}</a></dd>
		    				</c:forEach>
		    			</c:when>
		    			<c:otherwise>
		    			    <dd>没有相关数据</dd>
						</c:otherwise>
		    		</c:choose>
		    	</dl>
	    	</div>
	    	<div class="qiuzhi_r">
		    	<dl>
		    		<c:choose>
		    			<c:when test="${not empty careerList}">
		    				<c:forEach items="${careerList}" var="careerVar" varStatus="vs">
		    					<dd><a href="<%=basePath%>joblist/typeList.act?CATEGORY=${careerVar.CATEGORY}"><i>${careerVar.MNAME}</i></a>
		    						<a href="<%=basePath%>joblist/employmentGuide.act?EMPLOYMENT_ID=${careerVar.EMPLOYMENT_ID}&CATEGORY=${careerVar.CATEGORY}&flag=${careerVar.CATEGORY}">
			    						<h2>${careerVar.TITLE}</h2>
			    						<p>${careerVar.GUIDE_CONTENT}</p>
		    						</a>
		    					</dd>
		    				</c:forEach>
		    			</c:when>
		    			<c:otherwise>
		    			    <dd>没有相关数据</dd>
						</c:otherwise>
		    		</c:choose>
		    	</dl>
	    	</div>
    	</div>
    </li>
    <li>
    	<div class="xuexiao">
	    	<c:choose>
		    			<c:when test="${not empty schoolList}">
		    				<c:forEach items="${schoolList}" var="schoolVar" varStatus="vs">
		    					<dd><a href="<%=basePath%>joblist/goUniversity.act?school_id=${schoolVar.school_id}" style="display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"><img onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="<%=basePath%>images/${schoolVar.school_log}" alt="LOGO" style="width: 102px; height: 102px;" ><h2>${schoolVar.school_name}</h2><span>${schoolVar.creation_time}</span></a></dd>
		    				</c:forEach>
		    			</c:when>
		    			<c:otherwise>
		    			    <dd>没有相关数据</dd>
						</c:otherwise>
		    </c:choose>
    	</div>
    </li>
   </ul>
  </div> 
  <script type="text/javascript">
		jQuery(".m-slide").slide({ titCell:".tab li", mainCell:".img",effect:"fold", delayTime:200});
		function test(POSITION_ID){
			$.ajax({
				type : "POST",
				url :  '<%=basePath%>joblist/test.act',
					data : {
						POSITION_ID : POSITION_ID,
						tm : new Date().getTime()
					},
					dataType : 'json',
					cache : false,
					success : function(data) {
						$(".cmain_r_2 ul").html("");
						if (data.result == "success") {
							var html = "";
							var recrulist = data.recruitmentList;
							for (var i = 0; i < recrulist.length; i++) {
								if(recrulist.length%2==1 && i==recrulist.length-1){
									html += '<li style="border-right: 7px solid #fff;">';
								}else{
									html += '<li >';
								}
								html += '<a href="<%=basePath%>job/detail/info.act?companyId='+recrulist[i].user_id+'&positionId='+recrulist[i].RECRUITMENT_INFO_ID+'&flag=findJob" target="_blank" style="display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">' + '<i>'+ recrulist[i].SALARY + '</i>'+ recrulist[i].POSITION_NAME+ '</a>', 
								html += '<span>'+ recrulist[i].jobType + ' | '+ recrulist[i].WORK_PLACE_CITY+ ' | '+ recrulist[i].COMPANY_NAME+ '</span>',
								html +=  '<div class="cmain_r_2_i">',
								html +=  '<i><a href="<%=basePath%>job/detail/info.act?companyId='+recrulist[i].user_id+'&positionId='+recrulist[i].RECRUITMENT_INFO_ID+'&flag=findJob" target="_blank">详细</a></i>',
								html +=  '</div>',
								html +=  '</li>'
							}
							$(".cmain_r_2 ul").append(html);
						}
					}
				});
			}
  </script> 
</div>

<div class="clear"></div>
<jsp:include page="common/footer.jsp"></jsp:include>
</body>

</html>