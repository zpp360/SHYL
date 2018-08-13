<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv=”X-UA-Compatible” content=”IE=EmulateIE7″ />
<meta charset="utf-8">
<title>查看简历_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">
<jsp:include page="../../common/header.jsp"><jsp:param name="id" value="rctd" /></jsp:include>
<link href="<%=basePath%>shyl/css/maincss/rencai.css" rel="stylesheet" type="text/css">
<script src="<%=basePath%>shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/box.js" type="text/javascript"></script>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/maincss/resumeview.css">
<script src="<%=basePath%>shyl/js/bootstrap.min.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="<%=basePath%>/shyl/js/layer/layer.js"></script>
<script src="<%=basePath%>shyl/js/datepicker/WdatePicker.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<link rel="stylesheet" href="<%=basePath%>shyl/css/jobInvitation.css" />
</head>
<body>
<!--<header开始>-->
<!--</header结束>-->
<div class="clear"></div>
<div class="register-box clearfix">
<input id="userType" name="userType" type="hidden"
						value="${platUser.USER_TYPE}" />
	<div class="rticon"></div>
	<h2 style="width:100%;">个人简历</h2>
	<div class="register-box-1" style="width:100%;">
		<div class="register-box-left-800" style="height:100%;">
            <div class="col-md-9">
                <div class="form-horizontal form_txt form_view">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名：</label>
                        <div class="col-sm-4">
                            <p class="form-control-static">${pd.NAME}</p>
                        </div>
                        <label class="col-sm-2 control-label">性别：</label>
                        <div class="col-sm-4">
                                <p class="form-control-static">${pd.SEX}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">出生日期：</label>
                        <div class="col-sm-4">
                            <p class="form-control-static">${pd.BRITH_DATE}</p>
                        </div>
                        <label class="col-sm-2 control-label">参加工作年份：</label>
                        <div class="col-sm-4">
                            <p class="form-control-static">${pd.WORK_DATE }</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">婚姻状况：</label>
                        <div class="col-sm-4">
                            <p class="form-control-static">${pd.MARITAL_STATUS }</p>
                        </div>
                        <label class="col-sm-2 control-label">国家或地区：</label>
                        <div class="col-sm-4">
                            <p class="form-control-static">${pd.AREA }</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">证件类型：</label>
                        <div class="col-sm-4">
                            <p class="form-control-static">${pd.CERTIFICATE_TYPE}</p>
                        </div>
                        <label class="col-sm-2 control-label">证件号码：</label>
                        <div class="col-sm-4">
                            <p class="form-control-static">${pd.CERTIFICATE_NUM}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">海外工作经历：</label>
                        <div class="col-sm-4">
                                <p class="form-control-static">${pd.OVERSEAS_WORK}</p>
                        </div>
                        <label class="col-sm-2 control-label">政治面貌：</label>
                        <div class="col-sm-4">
                            <p class="form-control-static">${pd.POLITICAL_AFFILIATE }</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">户口所在地：</label>
                        <div class="col-sm-4">
                            <p class="form-control-static">${pd.REGISTERED_RESIDENCE }</p>
                        </div>
                        <label class="col-sm-2 control-label">居住地：</label>
                        <div class="col-sm-4">
                            <p class="form-control-static">${pd.RESIDENCE }</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">期望工作地：</label>
                        <div class="col-sm-4">
                            <p class="form-control-static">${cvpd.PROVINCE}&nbsp;${cvpd.CITY}</p>
                        </div>
                        <label class="col-sm-2 control-label">学历：</label>
                        <div class="col-sm-4">
                            <p class="form-control-static">${pd.EDUCATION}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">联系方式：</label>
                        <div class="col-sm-4">
                            <p class="form-control-static">${pd.CONTACT_INFO}</p>
                        </div>
                        <label class="col-sm-2 control-label">电子邮箱：</label>
                        <div class="col-sm-4">
                            <p class="form-control-static">${pd.MAIL}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="page-header">
                <h3 class="resume"><b>自我评价</b></h3>
            </div>
            <div class="col-md-9" style="padding-left: 30px;">
                <p>${cvpd.SELF_APPRAISAL}</p>
            </div>
            <div class="clearfix"></div>
            <div class="page-header">
                <h3 class="resume"><b>求职意向</b></h3>
            </div>
            <div class="col-md-9">
                <div class="form-horizontal form_txt form_view">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">期望工作性质：</label>
                        <div class="col-sm-6">
                            <p class="form-control-static">${cvpd.WORKTYPE}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">期望从事行业：</label>
                        <div class="col-sm-6">
                            <p class="form-control-static">
                            	<c:if test="${cvpd.INDEUSTRY1 !=null}">
                            		${cvpd.INDEUSTRY1}
                            	</c:if>
                            	<c:if test="${cvpd.INDEUSTRY2 !=null}">
                            		,${cvpd.INDEUSTRY2}
                            	</c:if>
                            	<c:if test="${cvpd.INDEUSTRY3 !=null}">
                            		,${cvpd.INDEUSTRY3}
                            	</c:if>
                            	<c:if test="${cvpd.INDEUSTRY4 !=null}">
                            		,${cvpd.INDEUSTRY4}
                            	</c:if>
                            	<c:if test="${cvpd.INDEUSTRY5 !=null}">
                            		,${cvpd.INDEUSTRY5}
                            	</c:if></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">期望从事职业：</label>
                        <div class="col-sm-6">
                            <p class="form-control-static">${cvpd.INDEUSTRY }</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">期望月薪（税前）：</label>
                        <div class="col-sm-6">
                            <p class="form-control-static">${cvpd.SALARY}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">工作状态：</label>
                        <div class="col-sm-6">

                            <p class="form-control-static">
	                            <c:choose>
		                            <c:when test="${cvpd.WORKINGSTATE==0}">
		                           		 我目前处于离职状态可立即上岗
		                            </c:when>
		                            <c:when test="${cvpd.WORKINGSTATE==1}">
		                           		 我目前在职，正考虑换个新环境（如有合适的工作机会，到岗时间一个月左右）
		                            </c:when>
		                            <c:when test="${cvpd.WORKINGSTATE==2}">
		                           		我对现有工作还算满意，如有更好的工作机会，我也可以考虑。（到岗时间另议）
		                            </c:when>
		                            <c:when test="${cvpd.WORKINGSTATE==3}">
		                           		应届毕业生
		                            </c:when>
	                            </c:choose>
                            </p>
                        </div>
                    </div>

                </div>
            </div>
            <div class="clearfix"></div>
            <c:if test="${not empty ediucationpdList}">
	            <div class="page-header">
	                <h3 class="resume"><b>教育经历</b></h3>
	            </div>
	                <div class="col-md-9">
	                    <div class="form-horizontal form_txt form_view">
	                    </div>
	                    <div class="col-sm-12">
	                    <c:forEach items="${ediucationpdList}" var="var" varStatus="vs">
	                        <p class="form-control-static">${var.timest} - ${var.timeend}：${var.school_name }&nbsp;/&nbsp;${var.specialty }&nbsp;/&nbsp;${var.education }&nbsp;/&nbsp;${var.overseas_study}海外工作经历</p>
	                        </c:forEach>
	                    </div>
	                </div>
	                <div class="clearfix"></div>
	                <hr style="border-style: dashed;">
            </c:if>
            <c:if test="${not empty languagepdList}">
	            <div class="page-header">
		            <h3 class="resume"><b>语言能力</b></h3>
		        </div>
                <div class="col-md-9">
                    <div class="col-sm-12">
                    <c:forEach items="${languagepdList}" var="var" varStatus="vs">
                        <p class="form-control-static">外语语种&nbsp;:&nbsp;${var.languages }&nbsp;/&nbsp;读写能力&nbsp;:&nbsp;${var.read_write_skill}&nbsp;/&nbsp;听写能力&nbsp;:&nbsp;${var.listen_say_skill}</p>
                        </c:forEach>
                    </div>
                </div>
                <div class="clearfix"></div>
                <hr style="border-style: dashed;">
            </c:if>
            <c:if test="${not empty experiencepdList}">
	            <div class="page-header">
	                <h3 class="resume"><b>工作经历</b></h3>
	            </div>
	            <div class="col-md-9">
	            <c:forEach items="${experiencepdList}" var="var" varStatus="vs">
	                 <div class="form-horizontal form_txt">
	                     <div class="form-group">
	                         <label class="col-sm-2 control-label">单位名称：</label>
	                         <div class="col-sm-4">
	                             <p class="form-control-static">${var.enterprise_name}
	                             </p>
	                         </div>
	                         <label for="inputPassword3" class="col-sm-2 control-label">时间：</label>
	                         <div class="col-sm-4">
	                             <p class="form-control-static">${var.timest } &nbsp;~ 
	                            		 <c:choose>
												<c:when test="${var.timeend !=null && var.timeend !=''}">
													${var.timeend}
												</c:when>
												<c:otherwise>
													至今
												</c:otherwise>
											</c:choose>
	                             </p>
	                         </div>
	                     </div>
	                     <div class="form-group">
	                         <label class="col-sm-2 control-label">公司性质：</label>
	                         <div class="col-sm-4">
	                             <p class="form-control-static">${var.enterprise_nature }</p>
	                         </div>
	                         <label class="col-sm-2 control-label">行业：</label>
	                         <div class="col-sm-4">
	                             <p class="form-control-static">${var.industry_type}</p>
	                         </div>
	                     </div>
	                     <div class="form-group">
	                         <label class="col-sm-2 control-label">部门：</label>
	                         <div class="col-sm-4">
	                             <p class="form-control-static">${var.department }</p>
	                         </div>
	                         <label class="col-sm-2 control-label">职位：</label>
	                         <div class="col-sm-4">
	                             <p class="form-control-static">${var.positions }</p>
	                         </div>
	                     </div>
	                     <div class="form-group">
	                         <label class="col-sm-2 control-label">工作描述：</label>
	                         <div class="col-sm-7">
	                             <p class="form-control-static">${var.job_description }</p>
	                         </div>
	                     </div>
	                     <div class="form-group">
	                         <label class="col-sm-2 control-label">下属人数：</label>
	                         <div class="col-sm-7">
	                             <p class="form-control-static">${var.subordinates }</p>
	                         </div>
	                     </div>
	                 </div>
	                 <c:if test="${vs.index != experiencepdList.size()-1}">
	              	   <hr style="border-style: dashed;">
	                 </c:if>
	                 </c:forEach>
	              </div>
	              <div class="clearfix"></div>
	              <hr style="border-style: dashed;">
            </c:if>
            <c:if test="${not empty projectpdList}">
	            <div class="page-header">
	                <h3 class="resume"><b>项目经验</b></h3>
	            </div>
	            <div class="col-md-9">
	             <c:forEach items="${projectpdList}" var="var" varStatus="vs">
	                <div class="form-horizontal form_txt">
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label">单位名称：</label>
	                        <div class="col-sm-4">
	                            <p class="form-control-static">${var.project_name }
	                            </p>
	                        </div>
	                       <label for="inputPassword3" class="col-sm-2 control-label">时间：</label>
	                        <div class="col-sm-4">
	                            <p class="form-control-static">${var.timest } ~ ${var.timeend }</p>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label">开发工具：</label>
	                        <div class="col-sm-4">
	                            <p class="form-control-static">${var.development_tool}</p>
	                        </div>
	                        <label class="col-sm-2 control-label">涉及技术：</label>
	                        <div class="col-sm-4">
	                            <p class="form-control-static">${var.technology}</p>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label">描述：</label>
	                        <div class="col-sm-7">
	                            <p class="form-control-static">${var.job_description}</p>
	                        </div>
	                        
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label">职责：</label>
	                        <div class="col-sm-7">
	                            <p class="form-control-static">${var.project_description}</p>
	                        </div>
	                    </div>
	                </div>
	                <c:if test="${vs.index != projectpdList.size()-1}">
	              	   <hr style="border-style: dashed;">
	                 </c:if>
	                </c:forEach>
	            </div>
	            <div class="clearfix"></div>
	            <hr style="border-style: dashed;">
            </c:if>
			<c:if test="${not empty traingpdList}">
	            <div class="page-header">
	                <h3 class="resume"><b>培训经历</b></h3>
	            </div>
                <div class="col-md-9">
                  <c:forEach items="${traingpdList}" var="var" varStatus="vs">
                    <div class="form-horizontal form_txt">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">培训机构：</label>
                            <div class="col-sm-7">
                                <p class="form-control-static">${var.training_institutions }
                                </p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">时间：</label>
                            <div class="col-sm-7">
                                <p class="form-control-static">${var.timest } ~ ${var.timeend}</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">证书：</label>
                            <div class="col-sm-7">
                                <p class="form-control-static">${var.certificate}</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">培训课程：</label>
                            <div class="col-sm-7">
                                <p class="form-control-static">${var.course }</p>
                            </div>
                        </div>
                    </div>
	                <c:if test="${vs.index != traingpdList.size()-1}">
	              	   <hr style="border-style: dashed;">
	                 </c:if>
                    </c:forEach>
                </div>
                <div class="clearfix"></div>
                <hr style="border-style: dashed;">
			</c:if>
			<c:if test="${not empty itList}">
	            <div class="page-header">
	                <h3 class="resume"><b>IT技能</b></h3>
	            </div>
	            <div class="col-md-9">
	                <div class="col-sm-12">
	                	<c:forEach items="${itList}" var="var" varStatus="vs">
	                    <p class="form-control-static">名称：${var.skill_name }&nbsp;/&nbsp;使用时间：${var.use_month}(月)&nbsp;/&nbsp;掌握程度&nbsp;:&nbsp;${var.skill_level}</p>
	                    </c:forEach>
	                </div>
	            </div>
	            <div class="clearfix"></div>
	            <hr style="border-style: dashed;">
			</c:if>
			<c:if test="${not empty itList}">
				<div class="page-header">
	                <h3 class="resume"><b>荣誉证书</b></h3>
	            </div>
	             <div class="col-md-9">
	                 <div class="form-group">
	                     <div class="col-sm-12">
	                     <c:forEach items="${certpdList}" var="var" varStatus="vs">
	                         <p class="form-control-static">名称&nbsp;:&nbsp;${var.certificate_name }&nbsp;/&nbsp;获奖时间&nbsp;:&nbsp;${var.c_time}</p>
	                         </c:forEach>
	                     </div>
	                 </div>
	             </div>
	             <div class="clearfix"></div>
			</c:if>
		</div>
		<div class="register-box-right-200">
            <div style="width:75%">
                    <p class="note_pic">
                        <c:if test="${pd.SEX == '女' }">
                        <img onerror="showImgDelay(this,'<%=basePath%>shyl/images/f-w.png');" src="<%=basePath%>images/${pd.USER_PICTURE}" alt="" style="max-width: 185px; max-height: 185px;margin-left: 15px;"/>
                        </c:if>
                        <c:if test="${pd.SEX != '女' }">
                        <img onerror="showImgDelay(this,'<%=basePath%>shyl/images/f-m.png');" src="<%=basePath%>images/${pd.USER_PICTURE}" alt="" style="max-width: 185px; max-height: 185px;margin-left: 15px;"/>
                        </c:if>
                        <a id="favresume" onclick="TipFav('favresume');" data-toggle="modal" class="btn btn-warning btn-lg btn-block" style="margin-top: 20px;">收&nbsp;&nbsp;&nbsp;藏</a>
                        <a href="#" id="favresume" onclick="JobInvitation();"  data-toggle="modal" class="btn btn-warning btn-lg btn-block" style="margin-top: 20px;">职位邀请</a>
                    </p>
            </div>
		</div>
	</div>
	<div class="modal fade bs-example-modal-sm" tabindex="-1" id="layhomewarn" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
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
	<div class='modal my-modal-alert' id='my-modal-job-alert'>
	      <div class='modal-dialog boxBodySmall'>
	          <div class='modal-content' style="width:350px;text-align:center;position:fixed;right:45%;bottom:50%;">
	              <div class='modal-body' id='modal-body-alert'>
	                  <img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;<label id="alertText">收藏成功!</label>
	              </div>
	          </div>
	      </div>
	</div>
	<input id="userId" type="hidden" value="${pd.USER_ID}"/>
    <input id="cvId" type="hidden" value="${pd.CV_ID}"/>
</div>
	<script type="text/javascript"
		src="<%=basePath%>static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript"
		src="<%=basePath%>static/js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>shyl/js/jquery.tips.js"></script>
	<script type="text/javascript">
		    function TipFav(divid) {
		    	// 简历用户Id
				var userId = $("#userId").val();
				// 简历Id
				var cvId =  $("#cvId").val();
		    	//登录用户ID
		    	var userType = $("#userType").val();
		    	if(userType == null || userType == ''||userType == 1 || userType == 4){
		    		$("#warntext").html("对不起，您无权限操作此功能！");
	                $("#" + divid).attr("data-target", "#layhomewarn");
		    	}else{
		        $.post('<%=basePath%>company/collectResume.act', {userId:userId,cvId:cvId}, function (data) {
		        	if (data.result == '0') {
		        		$("#my-modal-job-alert .modal-content").css("width", "200px");
		                $("#alertText").text("收藏成功！");
		              	$('#my-modal-job-alert').show().delay(3000).fadeOut();
		        	} else if (data.result == '1') {
		        		$("#my-modal-job-alert .modal-content").css("width", "350px");
		            	$("#alertText").text("该简历已收藏，无需重复收藏！");
		         		$('#my-modal-job-alert').show().delay(3000).fadeOut();
		        	} else {
		        		$("#my-modal-job-alert .modal-content").css("width", "200px");
		                $("#alertText").text("收藏失败！");
		              	$('#my-modal-job-alert').show().delay(3000).fadeOut();
		        	}
		        });
		    	}
		    }
		    //职位邀请
		    function JobInvitation(){
		    	// 简历用户Id
				var userId = $("#userId").val();
				// 简历Id
				var cvId =  $("#cvId").val();
				//登录用户ID
		    	var userType = $("#userType").val();
		    	if(userType == null || userType == ''||userType == 1 || userType == 4){
		    		$("#warntext").html("对不起，您无权限操作此功能！");
	            	$('#layhomewarn').modal('show');
		    	}else{
		    		$.post('<%=basePath%>company/jobList.act', {}, function(str){
		    			console.log(str);
						layer.open({
						 	 title:'已发布职位' ,
					         type: 1,
					         shadeClose : true,
					         scrollbar : false,
							 skin: 'layui-layer-rim', 
							 area: ['48%', 'auto'],
							 content: str						
					   	});						
					});
		    	}
		    }
	</script>
<div class="clear"></div>
<!--<footer开始>-->
<%@ include file="../../common/footer.jsp"%>
<!--</footer结束>-->
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
					<p id="warntext">该简历不存在，请浏览其它！</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" onclick="closePrompt();"
						id="d">关闭</button>
				</div>
				<script type="text/javascript">
        		function closePrompt(){
        			if (navigator.userAgent.indexOf("Firefox") != -1 || navigator.userAgent.indexOf("Chrome") !=-1) {  
        		        window.open(location, '_self').close(); 
        		    } else {  
        		        window.opener = null;  
        		        window.open("", "_self");  
        		        window.close();  
        		    }  
					}
				</script>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			if ($("#cvId").val() == "") {
				$("#prompt").modal('show');
			}
		})
	</script>
</body>
</html>