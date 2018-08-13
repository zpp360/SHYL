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
<html lang="en">
<head>
<title>发布招聘职位_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<base href="<%=basePath%>">
<link rel="stylesheet" href="<%=basePath%>shyl/css/maincss/mypage.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/work.css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/job/job.css">
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<%@ include file="../../common/header.jsp"%>
<script type="text/javascript" src="<%=basePath%>shyl/js/job/job.js"></script>
</head>
<body id="top" style="background-color: #f7f7f7;">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param value="4" name="menuType"/></jsp:include>
		<div class="mypage_right">
			<h2>发布职位</h2>
			<div class="input_class" style="margin-bottom: 100px;">
				<form action="<%=basePath%>recruitment/save.act" class="form-horizontal" id="form1" method="post" role="form">
					<ul style="margin-bottom: 20px;">
						<c:if test="${pd.COMPANY_TYPE=='0'}">
							<li style="width: 800px;">
								<span>公司名称：</span><input type="text" class="inputtxt2New" style="width: 600px;" value="${pd.COMPANY_NAME }" disabled="disabled">
							</li>
						</c:if>
						<c:if test="${pd.COMPANY_TYPE=='1'}">
							<li style="width: 800px;">
								<span>单位名称：</span><input type="text" class="inputtxt2New" style="width: 600px;" value="${pd.COMPANY_NAME }" disabled="disabled">
							</li>
						</c:if>
						<c:if test="${pd.COMPANY_TYPE=='2'}">
							<li style="width: 800px;">
								<span>机构名称：</span><input type="text" class="inputtxt2New" style="width: 600px;" value="${pd.COMPANY_NAME }" disabled="disabled">
							</li>
						</c:if>
						<li>
							<span>
								<small style="color:red">*</small>&nbsp;职位名称：
							</span><input type="text" class="inputtxt2" style="width: 275px;" value="" maxlength=50 id="position_name" name="position_name" onblur="trim(this);checkPosition_name();"></li>
					    <li>
							<span>招聘范围：</span>
			                <label for ="orientedGroup1"><input type="radio" id="orientedGroup1" name="orientedGroup" value="0" checked>&nbsp;<i>社会招聘</i></label>
			                <label for ="orientedGroup2"><input type="radio" id="orientedGroup2" name="orientedGroup" value="1" >&nbsp;<i>校园招聘</i></label>
                        </li>
						<li>
							<span><small style="color:red">*</small>&nbsp;职位类别：</span>
							<input style="height: 0.5px; width: 0px; padding: 0px; margin: 0px; position: absolute; top: -200px;" id="JobType" name="JobType" type="text" value="${pd.POSITION_TYPE}" maxlength="50" onblur="trim(this);"/>
							<div class="inputtxt2" data-toggle="modal" id="JobTypeText" data-target="#myJob" onclick="DB()">请选择职位类别&nbsp;
								<b class="caret"></b>
							</div>
						</li>
						<li>
							<span>
								<small style="color:red">*</small>&nbsp;招聘人数：
							</span>
							<input onblur="delZero(this);" onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" class="inputtxt2" style="width:275px;" id="recruitment_number" maxlength=4 name="recruitment_number">
						</li>
						<li>
							<span>薪资待遇：</span>
							<select class="inputtxt2NNew" id="Salary" name="salary">
								<c:forEach items="${salRangeList}" var="salRange">
								<option value="${salRange.DISTINGUISH_ID}">${salRange.VALUE}</option>
								</c:forEach>
							</select>
						</li>
						<li>
							<span>工作年限：</span>
							<select class="inputtxt2NNew" id="working_life" name="working_life"><option value="">不限</option>
								<c:forEach items="${jobTimeList}" var="jobTime">
								<option value="${jobTime.DISTINGUISH_ID}">${jobTime.VALUE}</option>
								</c:forEach>
							</select>
					    </li>
					    <li>
					   		<span>学历要求：</span>
					   		<select class="inputtxt2NNew"  id="education" name="education">
					   		<option value="">不限</option>
					   		<c:forEach items="${educationList}" var="education">
								<option value="${education.DISTINGUISH_ID}">${education.VALUE}</option>
							</c:forEach>
							</select>
					   	</li>
					   	<li>
					   		<span>工作性质：</span>
					   		<select class="inputtxt2NNew" id="job_type" name="job_type">
					   		<option value="">不限</option>
							<c:forEach items="${jobTypeList}" var="jobType">
							<option value="${jobType.DISTINGUISH_ID}">${jobType.VALUE}</option>
							</c:forEach>
							</select>
						</li>
				     	<li>
				     		<span><small style="color:red">*</small>&nbsp;工作地点：
				     		</span>
				     		<select class="inputtxt2NNew" id="work_place_province" name="work_place_province">
				     		<option value="">--选择省--</option>
							<c:forEach items="${provincesList}" var="provinces">
							<option value="${provinces.REGION_ID}">${provinces.REGION_NAME}</option>
							</c:forEach>
							</select>
						</li>
				    	<li>
				    		<span>市：</span>
				    		<select class="inputtxt2NNew" id="work_place_city" name="work_place_city" class="inputtxt2">
							<option value="">--选择市--</option>
							</select>
						</li>
				   		<li style="height:260px;width: 100%;">
							<span>职位描述：</span>
							<textarea id="job_description" name="job_description" class="textareatxt2" style=" float: left;height:220px;resize:none;"></textarea>
				  		</li>
				  		<li style="width: 800px;">
				  			<span><small style="color:red">*</small>&nbsp;简历接收方式：
				  			</span><input class="inputtxt2" id="receive_email" name="receive_email" placeholder="" type="text" value="" maxlength="50" onblur="trim(this);checkEmail();"/>
				  			<i>简历转发到我的邮箱</i>
				  		</li>
			</ul>
			</form>
			<a href="javascript:void(0);" class="save3" onclick="sub()">发布</a>
			<a href="javascript:void(0);" class="sback" onclick="GO()">返回</a>
		</div>
		<div class="clearfix"></div></div>
			<!-- 中间部分结束 -->
			<div class="modal fade" id="delresume" tabindex="-1" role="dialog"
			aria-labelledby="delresume" aria-hidden="true" data-backdrop="static"></div>

			<div class="modal fade" id="shieldcom" tabindex="-1" role="dialog"
			aria-labelledby="shieldcom" aria-hidden="true" data-backdrop="static"></div>
			<div class="modal fade" id="myJob" tabindex="-1" role="dialog"
			aria-labelledby="myJob" aria-hidden="true" data-backdrop="static">
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
							<button type="button" class="btn btn-success"
							onclick="Jobcheck()" data-dismiss="modal">确认</button>
							<button type="button" class="btn btn-default" onclick="Clear()"
							data-dismiss="modal">关闭</button>
						</div>
					</div>
				</div>
			</div>
		</div>

<%@ include file="../../common/footer.jsp"%>
<script src="<%=basePath%>shyl/js/jquery-1.7.2.js"></script>
<script src="<%=basePath%>shyl/js/scroll.js"></script>
<script src="<%=basePath%>plugins/attention/zDialog/zDrag.js"></script>
<script src="<%=basePath%>plugins/attention/zDialog/zDialog.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/ueditor/ueditor.all.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.js"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
<script type="text/javascript">
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