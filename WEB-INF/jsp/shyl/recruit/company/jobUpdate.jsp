<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>修改招聘职位_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<base href="<%=basePath%>">
<link rel="stylesheet" href="<%=basePath%>shyl/css/work.css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css">
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/job/job.js"></script>
<%@ include file="../../common/header.jsp"%>
<link rel="stylesheet" href="<%=basePath%>shyl/css/job/job.css">
</head>
<body id="top" style="background-color: #f7f7f7;">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param value="4" name="menuType"/></jsp:include>
		<div class="mypage_right">
			<h2>修改招聘信息</h2>
			<div class="input_class" style="margin-bottom: 100px;">
				<form action="<%=basePath%>company/updateJob.act?companyId=${pd.USER_ID}&infoID=${pd.RECRUITMENT_INFO_ID}"
					class="form-horizontal" id="form1" method="post" role="form">
					<ul style="margin-bottom: 20px;">
						<li>
							<span>
								<small style="color: red">*</small>&nbsp;职位名称：
							</span>
							<input type="text" class="inputtxt2" style="width: 275px;" maxlength=50 value="${pd.POSITION_NAME}" id="position_name" name="position_name" onblur="trim(this);checkPosition_name();"/>
						</li>
						<li >
							<span>招聘范围：</span>
			                <input type="radio" id="orientedGroup1" name="orientedGroup" value="0" <c:if test="${pd.ORIENTED_GROUP == 0 || pd.ORIENTED_GROUP == '' || pd.ORIENTED_GROUP == null}">checked</c:if>/>&nbsp;<i onclick="radioSelect(0)">社会招聘</i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                <input type="radio" id="orientedGroup2" name="orientedGroup" value="1" <c:if test="${pd.ORIENTED_GROUP == 1}">checked</c:if>/>&nbsp;<i onclick="radioSelect(1)">校园招聘</i>
                        </li>
						<li>
							<span>
								<small style="color: red">*</small>&nbsp;职位类别：
							</span>
							<input data-val="true" style="height: 0.5px; width: 0px; padding: 0px; margin: 0px; position: absolute; top: -100px;" id="JobType" name="JobType" type="text" value="${pd.POSITION_TYPE}" />
							<div class="inputtxt2" data-toggle="modal" id="JobTypeText" data-target="#myJob" onclick="DB()">${pd.POSITION_TYPE_NAME}&nbsp;<b class="caret"></b></div> 
						</li>
						<li>
							<span>
								<small style="color: red">*</small>&nbsp;招聘人数：
							</span>
							<input type="text" class="inputtxt2" style="width:275px !important;" id="recruitment_number" name="recruitment_number" maxlength=4 value="${pd.RECRUITMENT_NUMBER}" onkeyup="this.value=this.value.replace(/\D/g,'')" onblur="delZero(this);" style="ime-mode:disabled"/>
						<li>
							<span>薪资待遇：</span>
							<select class="inputtxt2NNew" style="height:42px !important;" name="SalaryID" id="SalaryID">
								<c:forEach items="${salRangeList}" var="salRanger">
									<option value="${salRanger.DISTINGUISH_ID}"
										<c:if test="${salRanger.DISTINGUISH_ID == pd.SALARY }">selected</c:if>>${salRanger.VALUE}
									</option>
								</c:forEach>
							</select>
						</li>
						<li>
							<span>工作年限：</span> 
							<select class="inputtxt2NNew" name="WorkYear" id="WorkYear">
							<option value="">不限</option>
							<c:forEach items="${jobTimeList}" var="jobTime">
								<option value="${jobTime.DISTINGUISH_ID}"
									<c:if test="${jobTime.DISTINGUISH_ID == pd.WORKING_LIFE }">selected</c:if>>${jobTime.VALUE}
								</option>
							</c:forEach>
							</select>
						</li>
						<li>
							<span>学历要求：</span>
							<select class="inputtxt2NNew" name="EduBackground" id="EduBackground">
							<option value="">不限</option>
							<c:forEach items="${educationList}" var="education">
								<option value="${education.DISTINGUISH_ID}"
									<c:if test="${education.DISTINGUISH_ID == pd.EDUCATION }">selected</c:if>>${education.VALUE}
								</option>
							</c:forEach>
							</select>
						</li>
						<li>
							<span>工作性质：</span> 
							<select class="inputtxt2NNew" name="WorkType" id="WorkType">
							<option value="">不限</option>
							<c:forEach items="${jobTypeList}" var="jobType">
								<option value="${jobType.DISTINGUISH_ID}"
									<c:if test="${jobType.DISTINGUISH_ID == pd.JOB_TYPE }">selected</c:if>>${jobType.VALUE}
								</option>
							</c:forEach>
							</select>
						</li>
						<li>
							<span>
								<small style="color: red">*</small>&nbsp;工作地点：
							</span>
							<select class="inputtxt2NNew" name="work_place_province" id="work_place_province" data-val="true" data-val-required="*">
							<option id="" value="">---省---</option>
							<c:forEach items="${provincesList}" var="provinces">
								<option value="${provinces.REGION_ID}"
									<c:if test="${provinces.REGION_ID == pd.WORK_PLACE_PROVINCE }">selected</c:if>>${provinces.REGION_NAME}
								</option>
							</c:forEach>
							</select>
						</li>
						<li>
							<span>市：</span> 
							<select id="work_place_city" name="work_place_city" class="inputtxt2NNew" data-val="true" data-val-required="*">
							<option id="" value="">---市---</option>
							<c:forEach items="${cityList}" var="cityList">
								<option value="${cityList.REGION_ID}"
									<c:if test="${cityList.REGION_ID == pd.WORK_PLACE_CITY }">selected</c:if>>${cityList.REGION_NAME}
								</option>
							</c:forEach>
							</select> 
						</li>
						<li style="height: 260px; width: 100%;">
							<span>职位描述：</span> 
							<textarea id="job_description" name="job_description" class="textareatxt2" style="float: left; height: 220px;resize: none;">${pd.JOB_DESCRIPTION}</textarea>
						</li>
						<li style="width: 800px;">
							<span>
								<small style="color: red">*</small>&nbsp;简历接收方式：
							</span>
							<input class="inputtxt2" id="receive_email" name="receive_email" type="text" value="${pd.RECEIVE_EMAIL}"  maxlength="50" onblur="trim(this);checkEmail();"/> 
							<i>简历转发到我的邮箱</i></li>
					</ul>
				</form>
				<a href="javascript:void(0);" class="save3" onclick="sub()">发布</a> 
				<a href="javascript:void(0);" class="sback" onclick="GO('${pd.USER_ID}');">返回</a>
			</div>
			<div class="clearfix"></div>
		</div>
		<!-- 中间部分结束 -->
		
		<div class="modal fade" id="myJob" tabindex="-1" role="dialog" aria-labelledby="myJob" aria-hidden="true" data-backdrop="static">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						onclick="Clear()">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">请选择职位类别</h4>
				</div>
				<div class="modal-body">
					<div class="bs-example bs-example-tabs">
						<ul id="myTab" class="nav nav-tabs">
							<c:forEach items="${jobPareCateList}" var="jobPareCate">
								<li><a href="<%="#"%>${jobPareCate.POSITION_ID}"
									data-toggle="tab">${jobPareCate.POSITION_NAME}</a></li>
							</c:forEach>
						</ul>
						<div id="myTabContent" class="tab-content">
							<c:forEach items="${jobPareCateList}" var="jobPareCate">
								<c:if test="${jobPareCate.POSITION_ID == 2}">
									<div class="tab-pane fade in active"
										id="${jobPareCate.POSITION_ID}">
										<ul class="list-inline xz_list">
											<c:forEach items="${jobChilCateList}" var="jobChilCate">
												<c:if
													test="${jobPareCate.POSITION_ID == jobChilCate.PARENT_ID}">
													<li>
														<div class="checkbox">
															<label> <input type="checkbox"
																id="postion_${jobChilCate.POSITION_ID}" name="Job"
																value="${jobChilCate.POSITION_ID}" />${jobChilCate.POSITION_NAME}
															</label>
														</div>
													</li>
												</c:if>
											</c:forEach>
										</ul>
									</div>
								</c:if>
								<c:if test="${jobPareCate.POSITION_ID != 2}">
									<div class="tab-pane fade" id="${jobPareCate.POSITION_ID}">
										<ul class="list-inline xz_list">
											<c:forEach items="${jobChilCateList}" var="jobChilCate">
												<c:if
													test="${jobPareCate.POSITION_ID == jobChilCate.PARENT_ID}">
													<li>
														<div class="checkbox">
															<label> <input type="checkbox"
																id="postion_${jobChilCate.POSITION_ID}" name="Job"
																value="${jobChilCate.POSITION_ID}" />${jobChilCate.POSITION_NAME}
															</label>
														</div>
													</li>
												</c:if>
											</c:forEach>
										</ul>
									</div>
								</c:if>

							</c:forEach>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" onclick="Jobcheck()" data-dismiss="modal">确认</button>
					<button type="button" class="btn btn-default" onclick="Clear()" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	</div>
<%@ include file="../../common/footer.jsp"%>
<script src="<%=basePath%>shyl/js/jquery-1.7.2.js"></script>
<script src="shyl/js/scroll.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.js"></script>
<script type="text/javascript" src="shyl/js/jquery.tips.js"></script>
<script src="<%=basePath%>shyl/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/job/job.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/ueditor/ueditor.all.js"></script>
<script type="text/javascript">
	// 监听单选框内容是否被点击
	function radioSelect(no){
		if(no==0){
			$("#orientedGroup2").removeAttr("checked");
			$("#orientedGroup1").attr("checked","checked");
		}else if(no==1){
			$("#orientedGroup1").removeAttr("checked");
			$("#orientedGroup2").attr("checked","checked");
		}
	}
	//控制用户最多只能选择1个checkbox选项
	$("[name='Job']").bind("click", function () {
	    var n = $("input[name='Job']:checked").length;
	    if (n >= 1) {
	        $("[name='Job']").each(function () {
	            if (!$(this).is(":checked")) {
	                $(this).attr("disabled", true);
	            }
	        });
	    } else {
	        $("[name='Job']").each(function () {
	            $(this).attr("disabled", false);
	        });
	    }
	})
</script>

</body>
</html>