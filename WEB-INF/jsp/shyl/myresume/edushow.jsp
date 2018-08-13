<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String CV_ID = request.getParameter("CV_ID");//用request得到 
%>
<!DOCTYPE html>
<!--[if IE 8 ]> <html class="ie8"> <![endif]-->
<html lang="en">
<head>
<title>教育背景_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<jsp:include page="../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/styleRegist.css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/work.css">
<script src="/SHYL/shyl/js/datepicker/WdatePicker.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>

<style type="text/css">
h1 {
	text-align: center;
}
.rightspan{
font-weight:600;text-align:right;display:block;width:8%;float:left;
}
.ie8 .modal{
 position: fixed;
  top: 20%;
  right:0;
  bottom:0;
  left: 0;
  z-index: 1050;
  display: none;
  overflow: hidden;
  -webkit-overflow-scrolling: touch;
  outline: 0;
}
.ie8 .modalfire{
position: fixed;
  top: 15%;
  right:0;
  bottom:0;
  left: 0;
  z-index: 1050;
  display: none;
  overflow: hidden;
  -webkit-overflow-scrolling: touch;
  outline: 0;
}
.ie8 .modalediupdate{
position: fixed;
  top: 15%;
  right:0;
  bottom:0;
  left: 0;
  z-index: 1050;
  display: none;
  overflow: hidden;
  -webkit-overflow-scrolling: touch;
  outline: 0;
}
.page-header{
	height:30px;
}
.date_control{
	width:46%;
}
</style>
</head>
<body id="top">
<input type="hidden" value="<%=CV_ID%>" id="cvid">
	<div class="clear"></div>
	<div class="container-fluid">
		<div class="register-box p0">
			<!-- 导航条代码开始 -->
		<div class="rticon"></div>
		<jsp:include page="../common/left.jsp"><jsp:param value="10" name="menuType"/></jsp:include>
				<div class="mypage_right" id="makeresume">
				<div class="mypage_tab">
					<h2>简历管理</h2>
					<div class="hd">
				<ul>
					<li onclick="basicinfo()" id="basic">基本信息完善</li>
					<li class="on" onclick="eduinfo()" id="edu">教育和背景</li>
				</ul>
			</div>
					<div class="col-xs-12 company_content tester" id="jiaoyu"
						>
						<p class="text-primary notetip">完整的简历可以帮助你获取理想的工作机会，赶快开始创建吧！</p>
						<div class="page-header">
							<h3 class="pull-left">
								<b style="font-weight:600;">教育经历</b>
							</h3>
							<p class="pull-right">
								<a data-toggle="modal" data-target="#sEdu"
									class="btn btn-link hover">添加教育经历</a>
							</p>
						</div>
						<div id="edulist" class="clearfix">		
						</div>
						<div id="EduEdit" style="margin-left: 5em;">
						
						</div>
						<div class="clearfix"></div>
						<div class="page-header">
							<h3 class="pull-left">
								<b style="font-weight:600;">语言能力</b>
							</h3>
							<p class="pull-right">
								<a data-toggle="modal" data-target="#Lans"
									onclick="lanCreate();" class="btn btn-link hover">添加语言能力</a>
							</p>
						</div>
						<div id="lanlist" class="clearfix">
					
						</div>
						<div id="Lan1"></div>
						<div class="clearfix"></div>
						<div class="page-header">
							<h3 class="pull-left">
								<b style="font-weight:600;">工作经历</b>
							</h3>
							<p class="pull-right">
								<a data-toggle="modal" data-target="#Work"
									onclick="workCreate();" class="btn btn-link hover">添加工作经历</a>
							</p>
						</div>
						<div id="worklist" class="clearfix">
							<p class="text-muted txt_null">暂无工作经历，请添加。</p>

						</div>
						<div id="Works" style="margin-left: 5em;"></div>
						<div class="clearfix"></div>
						<div class="page-header">
							<h3 class="pull-left">
								<b style="font-weight:600;">项目经验</b>
							</h3>
							<p class="pull-right">
								<a data-toggle="modal" data-target="#Program" class="btn btn-link hover">添加项目经验</a>
							</p>
						</div>
						<div id="prolist" class="clearfix">
							<p class="text-muted txt_null">暂无项目经验，请添加。</p>
						</div>
						<div id="Programs" style="margin-left: 5em;"></div>
						<div class="clearfix"></div>
						<div class="page-header">
							<h3 class="pull-left">
								<b style="font-weight:600;">培训经历</b>
							</h3>
							<p class="pull-right">
								<a data-toggle="modal" data-target="#Tra" onclick="traCreate();"
									class="btn btn-link hover">添加培训经历</a>
							</p>
						</div>
						<div id="tralist" class="clearfix">

							<p class="text-muted txt_null">暂无培训经历，请添加。</p>


						</div>
						<div id="Tras" style="margin-left: 5em;"></div>
						<div class="clearfix"></div>
						<div class="page-header">
							<h3 class="pull-left">
								<b style="font-weight:600;">IT技能</b>
							</h3>
							<p class="pull-right">
								<a data-toggle="modal" data-target="#It" onclick="itCreate();"
									class="btn btn-link hover">添加IT技能</a>
							</p>
						</div>
						<div id="itlist" class="clearfix" >
							<p class="text-muted txt_null">暂无IT技能，请添加。</p>

						</div>
						<div id="Its" ></div>
						<div class="clearfix"></div>
						<div class="page-header">
							<h3 class="pull-left">
								<b style="font-weight:600;">荣誉证书</b>
							</h3>
							<p class="pull-right">
								<a data-toggle="modal" data-target="#hon"
									class="btn btn-link hover">添加荣誉证书</a>
							</p>
						</div>
						<div id="honlist" class="clearfix">
							<p class="text-muted txt_null">暂无荣誉证书，请添加。</p>

						</div>
						<div id="hons"></div>
						<input id="url" name="url" type="hidden"
							value="/CTalent/Resume/CreateNext?ResumeID=4513b3c1-8086-4e5e-b327-5c4fb187dd3c">
						<div>
							<br> <br>
							<div class="form-group">
								<div class="pull-right">
									<a class="btn btn-success btn-ok"
										href="<%=basePath%>myresume/list.act">完成</a>
								</div>
							</div>
						</div>

					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<!-- 中间部分结束 -->


			<!--添加教育经历  -->
		
		<div class="modal modalie8 fade in" id="sEdu" tabindex="-1" role="dialog"
				aria-labelledby="sEdu" aria-hidden="false" data-backdrop="static">
				<form action="" id="test1">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">
								添加教育经历<small>（&nbsp;<span class="red_tip">*</span>为必填项&nbsp;）
								</small>
							</h4>
						</div>
						<div class="modal-body">
							<div class="form_table_box">
								<table class="table">
									<tbody>
										<tr>
											<th><span class="red_tip">*</span>学校名称：</th>
											<td colspan="3"><input class="inputtxt6"
												data-val="true" data-val-length="长度<50"
												data-val-length-max="50" data-val-required="*" id="School"
												name="School" type="text" maxlength="50" value="${EducationPd.SCHOOL_NAME}" onblur="trim(this);">
												<span class="field-validation-valid"
												data-valmsg-for="School" data-valmsg-replace="true"></span>
												<input id="ID" name="ID" type="hidden" value=""></td>
										</tr>
										<tr>
											<th><span class="red_tip">*</span>时间：</th>
											<td><input
												class="inputtxt2 date_control" type="text"
												value="${EducationPd.START_TIME}" name="START_TIME"
												id="START_TIME" type="text" onFocus="WdatePicker({isShowWeek:true});"
												 placeholder="开始日期" title="开始日期">
												<span class="field-validation-valid"
												data-valmsg-for="BeginDate_Create"
												data-valmsg-replace="true"></span> - <input
												class="inputtxt2 date_control" type="text"
												value="${EducationPd.END_TIME}" name="END_TIME"
												id="END_TIME" type="text" onFocus="WdatePicker({isShowWeek:true});"
												 placeholder="结束日期" title="结束日期"> <span
												class="field-validation-valid" data-valmsg-for="EndDate"
												data-valmsg-replace="true"></span></td>
										</tr>
										<tr>
											<th><span class="red_tip">*</span>专业：</th>
											<td><input class="inputtxt6" data-val="true"
												data-val-length="长度<50" data-val-length-max="50"
												data-val-required="*" id="Major" name="Major" type="text" maxlength="50"
												value="${EducationPd.SPECIALTY}" onblur="trim(this);"> <span
												class="field-validation-valid" data-valmsg-for="Major"
												data-valmsg-replace="true"></span></td>

										</tr>
										<tr>
											<th><span class="red_tip">*</span>学历：</th>
											<td><select class="inputtxt6" id="EduBackground"
												name="EduBackground"><option value=""></option>
													<c:forEach items="${educationList}" var="role">
														<option value="${role.DISTINGUISH_ID }"
															<c:if test="${role.DISTINGUISH_ID == EducationPd.EDUCATION}">selected</c:if>>${role.VALUE}</option>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<th>海外学习经历：</th>
											<td colspan="3"><label class="radio-inline"> <input
													type="radio" name="HasOverseas" id="none" value="0"
													checked="checked">无
											</label> <label class="radio-inline"> <input type="radio"
													name="HasOverseas" id="have" value="1">有
											</label></td>
										</tr>


									</tbody>
								</table>
							</div>
							<input id="ResumeID" name="ResumeID" type="hidden" value="">
						</div>

						<div class="modal-footer">
							<button id="EduButtonedu" type="button" class="btn btn-success"
								data-dismiss="">确认</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
						</div>
					</div>
				</div>
				<input type="reset" style="display:none;" name="resedu"/> 
				</form>
			</div>
			<!-- 添加教育经历结束 -->

			<!-- 添加语言能力 -->
			<div class="modal fade in" id="Lans" tabindex="-1" role="dialog"
				aria-labelledby="Lans" aria-hidden="false" data-backdrop="static">
				<form action="" id="test44">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">
								添加语言能力<small>（&nbsp;<span class="red_tip">*</span>为必填项&nbsp;）
								</small>
							</h4>
						</div>
						<div class="modal-body">
							<div class="form_table_box">
								<table class="table">
									<tbody>
										<tr>
											<th><label class="control-label"><span
													class="red_tip">*</span>语言：</label></th>
											<td><select class="inputtxt6" data-val="true"
												data-val-required="*" id="LanguageID" name="LanguageID">
													<c:forEach items="${languageList}" var="role">
														<option value="${role.DISTINGUISH_ID }"
															<c:if test="${role.DISTINGUISH_ID == languagepd.LANGUAGES}">selected</c:if>>${role.VALUE}</option>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<th><label class="control-label"><span
													class="red_tip">*</span>读写能力：</label></th>
											<td><select class="inputtxt6" data-val="true"
												data-val-required="*" id="DWID" name="DWID">
													<c:forEach items="${skillList}" var="role">
														<option value="${role.DISTINGUISH_ID }"
															<c:if test="${role.DISTINGUISH_ID == languagepd.READ_WRITE_SKILL}">selected</c:if>>${role.VALUE}</option>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<th><label class="control-label"><span
													class="red_tip">*</span>听说能力：</label></th>
											<td><select class="inputtxt6" data-val="true"
												data-val-required="*" id="LSID" name="LSID">
													<c:forEach items="${skillList}" var="role">
														<option value="${role.DISTINGUISH_ID }"
															<c:if test=	"${role.DISTINGUISH_ID == languagepd.LISTEN_SAY_SKILL}">selected</c:if>>${role.VALUE}</option>
													</c:forEach>
											</select></td>
										</tr>
										<input id="ResumeID" name="ResumeID" type="hidden" value="">
									</tbody>
								</table>
							</div>
						</div>
						<div class="modal-footer">
							<button id="lanButton" type="button" class="btn btn-success"
								onclick="lanSave()" data-dismiss="modal">确认</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
						</div>
						<script type="text/javascript">
						
						</script>
					</div>
				</div>
				<input type="reset" style="display:none;" name="reslan"/> 
				</form>
			</div>
			<!-- 添加语言能力结束 -->

			<!-- 添加工作经历 -->
			<div class="modal modalie8 fade in" id="Work" tabindex="-1" role="dialog"
				aria-labelledby="Work" aria-hidden="false" data-backdrop="static">
				<form action="" id="test2">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">
								添加工作经历<small>（&nbsp;<span class="red_tip">*</span>为必填项&nbsp;）
								</small> 
							</h4>
						</div>
						<div class="modal-body form_table_box">

							<table class="table">
								<tbody>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>企业名称：</label></th>
										<td><input class="inputtxt6" data-val="true"
											data-val-length="长度<50" data-val-length-max="45"
											data-val-required="*" id="CompanyName" name="CompanyName"
											type="text" maxlength="45" value="${experiencepd.ENTERPRISE_NAME}" onblur="trim(this);"> <span
											class="field-validation-valid" data-valmsg-for="CompanyName"
											data-valmsg-replace="true"></span></td>
									</tr>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>企业性质：</label></th>
										<td><select class="inputtxt6" data-val="true"
											data-val-required="*" id="CompanyNatureID"
											name="CompanyNatureID">	<c:forEach items="${companytypeList}" var="role">
														<option value="${role.DISTINGUISH_ID }"
															<c:if test="${role.DISTINGUISH_ID == experiencepd.ENTERPRISE_NATURE}">selected</c:if>>${role.VALUE}</option>
													</c:forEach>
										</select> <span class="field-validation-valid"
											data-valmsg-for="CompanyNatureID" data-valmsg-replace="true"></span>
										</td>

									</tr>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>行业类别：</label></th>
										<td><select class="inputtxt6" data-val="true"
											data-val-required="*" id="CompanyIndustryID"
											name="CompanyIndustryID"><c:forEach items="${industryList}" var="role">
														<option value="${role.DISTINGUISH_ID }"
															<c:if test="${role.DISTINGUISH_ID == experiencepd.INDUSTRY_TYPE}">selected</c:if>>${role.VALUE}</option>
													</c:forEach>
										</select> <span class="field-validation-valid"
											data-valmsg-for="CompanyIndustryID"
											data-valmsg-replace="true"></span></td>
									</tr>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>部门：</label></th>
										<td><input class="inputtxt6" data-val="true"
											data-val-length="长度<30" data-val-length-max="35"
											data-val-required="*" id="Department" name="Department"
											type="text" maxlength="43" value="${experiencepd.DEPARTMENT }" onblur="trim(this);"> <span
											class="field-validation-valid" data-valmsg-for="Department"
											data-valmsg-replace="true"></span></td>

									</tr>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>职位：</label></th>
										<td><input class="inputtxt6" data-val="true"
											data-val-length="长度<43" data-val-length-max="43"
											data-val-required="*" id="Job" name="Job" type="text" maxlength="43"
											value="${experiencepd.POSITIONS }" onblur="trim(this);"> <span class="field-validation-valid"
											data-valmsg-for="Job" data-valmsg-replace="true"></span></td>
									</tr>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>时间：</label></th>
										<td><input id="BeginDate" name="BeginDate"
												class="inputtxt2 date_control" type="text"
												value="${experiencepd.START_TIME}" name="START_TIME"
												id="START_TIME" type="text" onFocus="WdatePicker({isShowWeek:true});"
												 placeholder="开始日期" title="开始日期">
										<span class="field-validation-valid"
												data-valmsg-for="BeginDate_Create"
												data-valmsg-replace="true"></span> - 
											<input id="EndDate" name="EndDate"
												class="inputtxt2 date_control" type="text"
												value="${experiencepd.END_TIME}" name="START_TIME"
												id="START_TIME" type="text" onFocus="WdatePicker({isShowWeek:true});"
												 placeholder="结束日期" title="结束日期">
										</td>

									</tr>
									<tr>
                        <th>
                            <label class="control-label">下属人数：</label></th>
                        <td>
                            <input class="inputtxt6" data-val="true" data-val-number="字段 下属人数 必须是一个数字。" data-val-required="下属人数 字段是必需的。" id="Underling" name="Underling" onkeyup="value=value.replace(/[^0-9]/g,'')" type="text" value="0" onblur="delZero(this);" style="ime-mode:disabled" maxlength="4">
                            <span class="field-validation-valid" data-valmsg-for="Underling" data-valmsg-replace="true"></span>
                        </td>
                    </tr>
									<tr>
										<th><label class="control-label">工作描述：</label></th>
										<td colspan="3"><input class="inputtxt6" data-val="true"
													maxlength="210"
													id="Description"
													name="Description" type="text"><span
											class="field-validation-valid" data-valmsg-for="Description"
											data-valmsg-replace="true"></span></td>
									</tr>

									<input id="ResumeID" name="ResumeID" type="hidden" value="">
								</tbody>
							</table>

						</div>

						<div class="modal-footer">
							<button id="WorkButton" type="button" class="btn btn-success" data-dismiss="">确认</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
						</div>
						<script type="text/javascript">
							
						</script>
					</div>
				</div>
				<input type="reset" name="reswork" style="display: none;">
				</form>
			</div>
			<!-- 添加爱工作经历结束 -->
			<!-- 添加项目经验 -->
			<div class="modal modalie8 fade in" id="Program" tabindex="-1" role="dialog"
				aria-labelledby="Program" aria-hidden="false" data-backdrop="static">
				<form action="" id="test3">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">
								添加项目经验<small>（&nbsp;<span class="red_tip">*</span>为必填项&nbsp;）
								</small>
							</h4>
						</div>
						<div class="modal-body form_table_box">

							<table class="table">
								<tbody>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>项目名称：</label></th>
										<td><input class="inputtxt6" data-val="true"
											data-val-length="长度<50" data-val-length-max="45"
											data-val-required="*" id="ProgramName" name="ProgramName"
											type="text" maxlength="45" value="" onblur="trim(this);"> <span
											class="field-validation-valid" data-valmsg-for="ProgramName"
											data-valmsg-replace="true"></span></td>
									</tr>
										<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>时间：</label></th>
										<td><input id="BeginDatepro" name="BeginDatepro"
												class="inputtxt2 date_control" type="text"
												value="" name="START_TIME"
												id="START_TIME" type="text" onFocus="WdatePicker({isShowWeek:true});"
												 placeholder="开始日期" title="开始日期">
										<span class="field-validation-valid"
												data-valmsg-for="BeginDate_Create"
												data-valmsg-replace="true"></span> - 
											<input id="EndDatepro" name="EndDatepro"
												class="inputtxt2 date_control" type="text"
												value="" name="START_TIME"
												id="START_TIME" type="text" onFocus="WdatePicker({isShowWeek:true});"
												 placeholder="结束日期" title="结束日期">
										</td>

									</tr>
									<tr>
										<th><label class="control-label">开发工具：</label></th>
										<td><input class="inputtxt6" data-val="true"
											data-val-length="长度<100" data-val-length-max="100" id="Tools"
											name="Tools" type="text" maxlength="50" value="" onblur="trim(this);"></td>

									</tr>
									<tr>
										<th><label class="control-label">涉及技术：</label></th>
										<td><input class="inputtxt6" id="ITTechID"
											name="ITTechID" type="text" maxlength="50" value="" onblur="trim(this);"></td>
									</tr>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>项目描述：</label></th>
										<td colspan="3"><input class="inputtxt6" data-val="true"
													maxlength="210"
													id="ProDescription"
													name="ProDescription" type="text">
											<span class="field-validation-valid"
											data-valmsg-for="ProDescription" data-valmsg-replace="true"></span>
										</td>
									</tr>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>职责：</label></th>
										<td colspan="3"><input class="inputtxt6"
											data-val="true" data-val-length="长度<200"
											data-val-length-max="200" data-val-required="*"
											id="Responsibility" name="Responsibility" type="text" maxlength="255"
											value="" onblur="trim(this);"> <span class="field-validation-valid"
											data-valmsg-for="Responsibility" data-valmsg-replace="true"></span>
										</td>
									</tr>
									<input id="ResumeID" name="ResumeID" type="hidden" value="">
								</tbody>
							</table>

						</div>

						<div class="modal-footer">
							<button id="ProgramButton" type="button" class="btn btn-success">确认</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
						</div>
					</div>
					<script type="text/javascript">
					
						
					</script>
				</div>
				<input type="reset" style="display: none;" name="respro">
				</form>
			</div>
			<!-- 项目经验结束 -->
			<!-- 添加培训经历 -->
			<div class="modal modalie8 fade in" id="Tra" tabindex="-1" role="dialog"
				aria-labelledby="Tra" aria-hidden="false" data-backdrop="static">
				<form action="" id="test5">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">
								添加培训经历<small>（&nbsp;<span class="red_tip">*</span>为必填项&nbsp;）
								</small>
							</h4>
						</div>
						<div class="modal-body form_table_box">

							<table class="table">
								<tbody>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>培训机构：</label></th>
										<td><input class="inputtxt6" data-val="true"
											data-val-length="长度<50" data-val-length-max="45"
											data-val-required="*" id="TrainCompany" name="TrainCompany"
											type="text" maxlength="45" value="${traingpd.TRAINING_INSTITUTIONS }" onblur="trim(this);"> <span
											class="field-validation-valid" data-valmsg-for="TrainCompany"
											data-valmsg-replace="true"></span></td>
									</tr>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>时间：</label></th>
										<td><input id="BeginDatetra" name="BeginDatetra"
												class="inputtxt2 date_control" type="text"
												value="${experiencepd.START_TIME}" name="START_TIME"
												id="START_TIME" type="text" onFocus="WdatePicker({isShowWeek:true});"
												 placeholder="开始日期" title="开始日期">
											<span class="field-validation-valid"
												data-valmsg-for="BeginDate_Create"
												data-valmsg-replace="true"></span> - 
											<input id="EndDatetra" name="EndDatetra"
												class="inputtxt2 date_control" type="text"
												value="${experiencepd.END_TIME}" name="START_TIME"
												id="START_TIME" type="text" onFocus="WdatePicker({isShowWeek:true});"
												 placeholder="结束日期" title="结束日期">
										</td>

									</tr>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>获得证书：</label></th>
										<td><input class="inputtxt6" data-val="true"
											data-val-length="长度<50" data-val-length-max="40"
											id="Certificate" name="Certificate" type="text" maxlength="40" value="${traingpd.CERTIFICATE }" onblur="trim(this);">

										</td>
									</tr>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>培训课程：</label></th>
										<td><input class="inputtxt6" data-val="true"
													maxlength="210"
													id="Course"
													name="Course" type="text"> <span
											class="field-validation-valid" data-valmsg-for="Course"
											data-valmsg-replace="true"></span></td>
									</tr>
									<input id="ResumeID" name="ResumeID" type="hidden" value="">
								</tbody>
							</table>

						</div>

						<div class="modal-footer">
							<button id="TraButton" type="button" class="btn btn-success" data-dismiss="">确认</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
						</div>
						<script type="text/javascript">
						
							
						</script>
					</div>
				</div>
				<input type="reset" name="restra" style="display: none;">
				</form>
			</div>
			<!-- 添加培训经历结束 -->
			<!-- 添加IT技能 -->
			<div class="modal modalie8 fade in" id="It" tabindex="-1" role="dialog"
				aria-labelledby="It" aria-hidden="false" data-backdrop="static">
				<form action="" id="test6">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">
								添加IT技能<small>（&nbsp;<span class="red_tip">*</span>为必填项&nbsp;）
								</small>
							</h4>
						</div>
						<div class="modal-body form_table_box">

							<table class="table">
								<tbody>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>名称：</label></th>
										<td colspan="3"><input class="inputtxt6"
											data-val="true" data-val-length="长度<50"
											data-val-length-max="50" data-val-required="*" id="TechName"
											name="TechName" type="text" maxlength="50" value="${IT.SKILL_NAME }" onblur="trim(this);"> <span
											class="field-validation-valid" data-valmsg-for="TechName"
											data-valmsg-replace="true"></span></td>
									</tr>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>使用时间(月)：</label></th>
										<td colspan="3"><input class="inputtxt6"
											data-val="true" data-val-number="字段 使用时间 必须是一个数字。"
											data-val-required="*" id="Duration" name="Duration" maxlength="3"
											onkeyup="value=value.replace(/[^0-9]/g,'')" type="text"
											value="${IT.USE_MONTH }" onblur="delZero(this);" style="ime-mode:disabled"> <span class="field-validation-valid"
											data-valmsg-for="Duration" data-valmsg-replace="true"></span>
										</td>
									</tr>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>掌握程度：</label></th>
										<td colspan="3"><select class="inputtxt6"
											data-val="true" data-val-required="*" id="SkillLevelID"
											name="SkillLevelID"><c:forEach items="${skillList}" var="role">
														<option value="${role.DISTINGUISH_ID }"
															<c:if test="${role.DISTINGUISH_ID == IT.SKILL_LEVEL }">selected</c:if>>${role.VALUE}</option>
													</c:forEach>
										</select></td>
									</tr>
									<input id="ResumeID" name="ResumeID" type="hidden" value="">
								</tbody>
							</table>

						</div>

						<div class="modal-footer">
							<button id="ItButton" type="button" class="btn btn-success" data-dismiss="">确认</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
						</div>
					</div>
					<script type="text/javascript">
			
						
					</script>
				</div>
				<input type="reset" name="resit" style="display: none;">
				</form>
			</div>
			<!-- 添加IT技能结束 -->
			<!-- 添加荣誉证书 -->
			<div class="modal modalie8 fade in" id="hon" tabindex="-1" role="dialog"
				aria-labelledby="hon" aria-hidden="false" data-backdrop="static">
				<form action="" id="test8">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">
								添加荣誉证书<small>（&nbsp;<span class="red_tip">*</span>为必填项&nbsp;）
								</small>
							</h4>
						</div>
						<div class="modal-body form_table_box">

							<table class="table">
								<tbody>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>名称：</label></th>
										<td colspan="3"><input class="inputtxt6"
											data-val="true" data-val-length="长度<50"
											data-val-length-max="40" data-val-required="*" id="HonorName"
											name="HonorName" type="text" maxlength="40" value="${certpd.CERTIFICATE_NAME }" onblur="trim(this);"> <span
											class="field-validation-valid" data-valmsg-for="HonorName"
											data-valmsg-replace="true"></span></td>
									</tr>

									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>时间：</label></th>
										<td><input id="BeginDatehon" name="BeginDatepro"
												class="inputtxt2 date_control" type="text"
												value="${experiencepd.c_time}" name="START_TIME"
												id="START_TIME" type="text" onFocus="WdatePicker({isShowWeek:true,startDate:'%y',dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-{%d-1}'});"
												 placeholder="开始日期" title="开始日期">
										</td>

									</tr>
									<input id="ResumeID" name="ResumeID" type="hidden" value="">
								</tbody>
							</table>

						</div>

						<div class="modal-footer">
							<button id="HonButton" type="button" class="btn btn-success">确认</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
						</div>
					</div>
					<script type="text/javascript">
					
					</script>
				</div>
				<input type="reset" name="reshon" style="display: none;">
				</form>
			</div>
			<!-- 添加荣誉证书 -->
			<!-- 教育背景模态框 -->
			<div class="modal fade in" id="eEdu" tabindex="-1" role="dialog"
				aria-labelledby="eEdu" aria-hidden="false" data-backdrop="static">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">
								修改教育经历<small>（&nbsp;<span class="red_tip">*</span>为必填项&nbsp;）
								</small>
							</h4>
						</div>
						<div class="modal-body">
							<div class="form_table_box">
								<table class="table">
									<tbody>
										<tr>
											<th><span class="red_tip">*</span>学校名称：</th>
											<td colspan="3"><input class="inputtxt6"
												data-val="true" data-val-length="长度<50"
												data-val-length-max="50" data-val-required="*" id="Schoolupdate"
												name="School" type="text" value="" maxlength="50" onblur="trim(this);"> <span
												class="field-validation-valid" data-valmsg-for="School"
												data-valmsg-replace="true"></span></td>
										</tr>
										<tr>
											<th><span class="red_tip">*</span>时间：</th>
											<td><input id="BeginDateupdate" name="BeginDate"
												value="2016-12-09" class="inputtxt2 date_control"
												type="text" placeholder=""
												onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'EndDate\')||\'9999-12-31\'}'})">
												<span class="field-validation-valid"
												data-valmsg-for="BeginDate" data-valmsg-replace="true"></span>
												- <input id="EndDateupdate" name="EndDate" value="2016-12-13"
												class="inputtxt2 date_control" type="text" placeholder=""
												onfocus="WdatePicker({minDate:'#F{$dp.$D(\'BeginDate\')}',maxDate:'9999-12-31'})">
												<span class="field-validation-valid"
												data-valmsg-for="EndDate" data-valmsg-replace="true"></span>
											</td>
										</tr>
										<tr>
											<th><span class="red_tip">*</span>专业：</th>
											<td><input class="inputtxt6" data-val="true"
												data-val-length="长度<50" data-val-length-max="50"
												data-val-required="*" id="Majorupdate" name="Majorupdate" type="text"
												value="" maxlength="50" onblur="trim(this);"> <span class="field-validation-valid"
												data-valmsg-for="Major" data-valmsg-replace="true"></span></td>
										</tr>
										<tr>
											<th><span class="red_tip">*</span>学历：</th>
											<td><select class="inputtxt6" id="EduBackgroundupdate"
												name="EduBackgroundupdate">
												<option value="" id="option1"></option>
													<c:forEach items="${educationList}" var="role">
														<option value="${role.DISTINGUISH_ID }"
															<c:if test="${role.DISTINGUISH_ID == EducationPd.EDUCATION}">selected</c:if>>${role.VALUE}</option>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<th>海外学习经历：</th>
											<td colspan="3"><label class="radio-inline"> <input
													 data-val="true" id="HasOverseas" name="HasOverseasupdate" type="radio" value="0">无
											</label> <label class="radio-inline" >
											 <input id="HasOverseas" name="HasOverseasupdate" type="radio" value="1">有
											</label></td>
										</tr>
										<input type="hidden" value="" id="info_id">
									</tbody>
								</table>
							</div>
						</div>
						<div class="modal-footer">
							<button id="EduButton" type="button" class="btn btn-success"
								onclick="Eduupdate()">确认</button>
							<button type="button" class="btn btn-default" onclick="Clear()"
								data-dismiss="modal">关闭</button>
						</div>
						<script type="text/javascript">
						
						</script>
					</div>
				</div>
			</div>
			<!-- 删除教育背景模态框 -->
			<div class="modal fade in" id="deledu" tabindex="-1" role="dialog"
				aria-labelledby="deledu" aria-hidden="false" data-backdrop="static">
				<div class="modal-dialog  modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">提示</h4>
						</div>
						<div class="modal-body">
							<h4>您确定要删除吗？取消后不可恢复！！</h4>
							<br> <br>
						</div>
						<input id="id" name="id" type="hidden"
							value="3cb0f512-66bd-4994-8220-2a4456777e34">
						<div class="modal-footer">
							<button id="EduButton" type="button" class="btn btn-success"
								onclick="Delete()">确认</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
								<input type="hidden" value="" id="delectinfoid">
						</div>
						<script type="text/javascript">
						
						</script>
					</div>
				</div>
			</div>
			<!-- 删除教育背景模态框结束 -->
			<!-- 教育背景模态框结束 -->
			<!-- 修改语言能力模态框 -->
			<div class="modal fade in" id="LansEdit" tabindex="-1" role="dialog"
				aria-labelledby="LansEdit" aria-hidden="false"
				data-backdrop="static">
					<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">
								修改语言能力<small>（&nbsp;<span class="red_tip">*</span>为必填项&nbsp;）
								</small>
							</h4>
						</div>
						<div class="modal-body">
							<div class="form_table_box">
								<table class="table">
									<tbody>
										<tr>
											<th><label class="control-label"><span
													class="red_tip">*</span>语言：</label></th>
											<td><select class="inputtxt6" data-val="true"
												data-val-required="*" id="LanguageIDupdate" name="LanguageID">
												<option value="" id="lan1"></option>
													<c:forEach items="${languageList}" var="role">
														<option value="${role.DISTINGUISH_ID }"
															<c:if test="${role.DISTINGUISH_ID == languagepd.languages}">selected</c:if>>${role.VALUE}</option>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<th><label class="control-label"><span
													class="red_tip">*</span>读写能力：</label></th>
											<td><select class="inputtxt6" data-val="true"
												data-val-required="*" id="DWIDupdate" name="DWID">
												<option value="" id="lan2"></option>
													<c:forEach items="${skillList}" var="role">
														<option value="${role.DISTINGUISH_ID }"
															<c:if test="${role.DISTINGUISH_ID == languagepd.read_write_skill}">selected</c:if>>${role.VALUE}</option>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<th><label class="control-label"><span
													class="red_tip">*</span>听说能力：</label></th>
											<td><select class="inputtxt6" data-val="true"
												data-val-required="*" id="LSIDupdate" name="LSID">
												<option value="" id="lan3"></option>
													<c:forEach items="${skillList}" var="role">
														<option value="${role.DISTINGUISH_ID }"
															<c:if test="${role.DISTINGUISH_ID == languagepd.listen_say_skill}">selected</c:if>>${role.VALUE}</option>
													</c:forEach>
											</select></td>
										</tr>
										<input type="hidden" value="" id="laninfo_id">
									</tbody>
								</table>
							</div>
						</div>
						<div class="modal-footer">
							<button id="lanButton" type="button" class="btn btn-success"
								onclick="LanUpdate()" data-dismiss="modal">确认</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
						</div>
						<script type="text/javascript">
						
						</script>
					</div>
				</div>
			</div>
			<div class="modal fade in" id="dellan" tabindex="-1" role="dialog"
				aria-labelledby="dellan" aria-hidden="false" data-backdrop="static">
				<div class="modal-dialog  modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">提示</h4>
						</div>
						<div class="modal-body">
							<h4>您确定要删除吗？取消后不可恢复！！</h4>
							<br> <br>
						</div>
						<input id="id" name="id" type="hidden"
							value="1e3f3e0a-501b-4fd5-a0a1-9d25a2bf33b5">
						<div class="modal-footer">
							<button id="EduButton" type="button" class="btn btn-success"
								onclick="Deletelan()">确认</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
								<input type="hidden" value="" id="dellaninfoid"> 
						</div>
						<script type="text/javascript">
						
						</script>
					</div>
				</div>
			</div>
			<!-- 语言能力模态框结束 -->
			<!-- 工作经历模态框 -->
			<div class="modalediupdate fade in" id="WorkEdit" tabindex="-1" role="dialog"
				aria-labelledby="WorkEdit" aria-hidden="false"
				data-backdrop="static">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">
								修改工作经历<small>（&nbsp;<span class="red_tip">*</span>为必填项&nbsp;）
								</small> 
							</h4>
						</div>
						<div class="modal-body form_table_box">

							<table class="table">
								<tbody>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>企业名称：</label></th>
										<td><input class="inputtxt6" data-val="true"
											data-val-length="长度<50" data-val-length-max="45"
											data-val-required="*" id="CompanyNameupdate" name="CompanyName"
											type="text" value="" maxlength="45" onblur="trim(this);"> <span
											class="field-validation-valid" data-valmsg-for="CompanyName"
											data-valmsg-replace="true"></span></td>
									</tr>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>企业性质：</label></th>
										<td><select class="inputtxt6" data-val="true"
											data-val-required="*" id="CompanyNatureIDupdate"
											name="CompanyNatureID">
											<c:forEach items="${companytypeList}" var="role">
														<option value="${role.DISTINGUISH_ID }"
															<c:if test="${role.DISTINGUISH_ID == experiencepd.ENTERPRISE_NATURE}">selected</c:if>>${role.VALUE}</option>
													</c:forEach>
										</select> <span class="field-validation-valid"
											data-valmsg-for="CompanyNatureID" data-valmsg-replace="true"></span>
										</td>

									</tr>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>行业类别：</label></th>
										<td><select class="inputtxt6" data-val="true"
											data-val-required="*" id="CompanyIndustryIDupdate"
											name="CompanyIndustryID">
											<c:forEach items="${industryList}" var="role">
														<option value="${role.DISTINGUISH_ID }"
															<c:if test="${role.DISTINGUISH_ID == experiencepd.INDUSTRY_TYPE}">selected</c:if>>${role.VALUE}</option>
													</c:forEach>
										</select> <span class="field-validation-valid"
											data-valmsg-for="CompanyIndustryID"
											data-valmsg-replace="true"></span></td>
									</tr>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>部门：</label></th>
										<td><input class="inputtxt6" data-val="true" maxlength="45"
											data-val-length="长度<45" data-val-length-max="45"
											data-val-required="*" id="Departmentupdate" name="Department"
											type="text" value=""  onblur="trim(this);"> <span
											class="field-validation-valid" data-valmsg-for="Department"
											data-valmsg-replace="true"></span></td>

									</tr>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>职位：</label></th>
										<td><input class="inputtxt6" data-val="true" maxlength="43"
											data-val-length="长度<43" data-val-length-max="43"
											data-val-required="*" id="Jobupdate" name="Job" type="text"
											value=""  onblur="trim(this);"> <span class="field-validation-valid"
											data-valmsg-for="Job" data-valmsg-replace="true"></span></td>
									</tr>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>时间：</label></th>
										<td><input id="BeginDateupdatework" name="BeginDate"
												class="inputtxt2 date_control" type="text"
												value="" name="START_TIME"
												id="START_TIME" type="text" onFocus="WdatePicker({isShowWeek:true});"
												 placeholder="开始日期" title="开始日期">

											<input id="EndDateupdatework" name="EndDate"
												class="inputtxt2 date_control" type="text"
												value="" name="START_TIME"
												id="START_TIME" type="text" onFocus="WdatePicker({isShowWeek:true});"
												 placeholder="结束日期" title="结束日期">
										</td>

									</tr>
									<tr>
                        <th>
                            <label class="control-label">下属人数：</label></th>
                        <td>
                            <input class="inputtxt6" data-val="true" data-val-number="字段 下属人数 必须是一个数字。" data-val-required="下属人数 字段是必需的。" id="Underlingupdate" name="Underling" onkeyup="value=value.replace(/[^0-9]/g,'')" type="text" value="0" onblur="delZero(this);" style="ime-mode:disabled" maxlength="4">
                            <span class="field-validation-valid" data-valmsg-for="Underling" data-valmsg-replace="true"></span>
                        </td>
                    </tr>
									<tr>
										<th><label class="control-label">工作描述：</label></th>
										<td colspan="3"><input class="inputtxt6" data-val="true"
													maxlength="210"
													id="Descriptionupdate"
													name="Descriptionupdate" type="text"><span
											class="field-validation-valid" data-valmsg-for="Description"
											data-valmsg-replace="true"></span></td>
									</tr>

									<input type="hidden" value="" id="workinfo_id">
								</tbody>
							</table>

						</div>

						<div class="modal-footer">
							<button id="WorkButton" type="button" class="btn btn-success"
								onclick="Workupdate()" data-dismiss="">确认</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
						</div>
						<script type="text/javascript">
							
						</script>
					</div>
				</div>
			</div>
			<div class="modal fade in" id="delwork" tabindex="-1" role="dialog"
				aria-labelledby="delwork" aria-hidden="false" data-backdrop="static">
				<div class="modal-dialog  modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">提示</h4>
						</div>
						<div class="modal-body">
							<h4>您确定要删除吗？取消后不可恢复！！</h4>
							<br> <br>
						</div>
						<input id="id" name="id" type="hidden"
							value="12dd6b44-94d3-47a0-b33d-4c26179ea879">
						<div class="modal-footer">
							<button id="EduButton" type="button" class="btn btn-success"
								onclick="DeleteWork()">确认</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
								<input type="hidden" value="" id="delworkinfoid">
						</div>
						<script type="text/javascript">
						
						</script>
					</div>
				</div>
			</div>
			<!-- 工作经历模态框结束 -->
			<!-- 项目经验模态框开始 -->
			<div class="modalediupdate fade in" id="Programedit" tabindex="-1" role="dialog"
				aria-labelledby="Program" aria-hidden="false" data-backdrop="static">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">
								修改项目经验<small>（&nbsp;<span class="red_tip">*</span>为必填项&nbsp;）
								</small>
							</h4>
						</div>
						<div class="modal-body form_table_box">

							<table class="table">
								<tbody>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>项目名称：</label></th>
										<td><input class="inputtxt6" data-val="true"
											data-val-length="长度<50" data-val-length-max="45"
											data-val-required="*" id="ProgramNameupdate" name="ProgramName"
											type="text" value="" maxlength="45" onblur="trim(this);"> <span
											class="field-validation-valid" data-valmsg-for="ProgramName"
											data-valmsg-replace="true"></span></td>
									</tr>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>时间：</label></th>
										<td><input id="BeginDateproupdate" name="BeginDatepro"
											class="inputtxt2 date_control" type="text" value=""
											name="START_TIME" id="START_TIME" type="text"
											onFocus="WdatePicker({isShowWeek:true});" placeholder="开始日期"
											title="开始日期"> <input id="EndDateproupdate"
											name="EndDateproupdate" class="inputtxt2 date_control"
											type="text" value="" name="START_TIME" id="START_TIME"
											type="text" onFocus="WdatePicker({isShowWeek:true});"
											placeholder="结束日期" title="结束日期"></td>

									</tr>
									<tr>
										<th><label class="control-label">开发工具：</label></th>
										<td><input class="inputtxt6" data-val="true"
											data-val-length="长度<100" data-val-length-max="100" id="Toolsupdate"
											name="Tools" type="text" value="" maxlength="50" onblur="trim(this);"></td>

									</tr>
									<tr>
										<th><label class="control-label">涉及技术：</label></th>
										<td><input class="inputtxt6" id="ITTechIDupdate"
											name="ITTechID" type="text" value="" maxlength="50" onblur="trim(this);"></td>
									</tr>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>项目描述：</label></th>
										<td colspan="3"><input class="inputtxt6" data-val="true"
											maxlength="210" id="ProDescriptionupdate"
											name="ProDescriptionupdate" type="text"><span
											class="field-validation-valid" data-valmsg-for="Description"
											data-valmsg-replace="true"> <span
												class="field-validation-valid"
												data-valmsg-for="ProDescription" data-valmsg-replace="true"></span></td>
									</tr>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>职责：</label></th>
										<td colspan="3"><input class="inputtxt6"
											data-val="true" data-val-length="长度<200"
											data-val-length-max="200" data-val-required="*"
											id="Responsibilityupdate" name="Responsibility" type="text"
											value="" maxlength="255" onblur="trim(this);"> <span class="field-validation-valid"
											data-valmsg-for="Responsibility" data-valmsg-replace="true"></span>
										</td>
									</tr>
									<input type="hidden" value="" id="proinfo_id">
								</tbody>
							</table>

						</div>

						<div class="modal-footer">
							<button id="ProgramButton" type="button" class="btn btn-success"
								onclick="proupdate()">确认</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
						</div>
					</div>
					<script type="text/javascript">
					
					</script>
				</div>
			</div>
			<div class="modal fade in" id="delpro" tabindex="-1" role="dialog"
				aria-labelledby="delpro" aria-hidden="false" data-backdrop="static">
				<div class="modal-dialog  modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">提示</h4>
						</div>
						<div class="modal-body">
							<h4>您确定要删除吗？取消后不可恢复！！</h4>
							<br> <br>
						</div>
						<input id="id" name="id" type="hidden"
							value="e8006c72-ae33-4610-8cf0-aa32b44b6d0c">
						<div class="modal-footer">
							<button id="EduButton" type="button" class="btn btn-success"
								onclick="prodelete()">确认</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
								<input type="hidden" value="" id="delproinfoid">
						</div>
						<script type="text/javascript">
						
						</script>
					</div>
				</div>
			</div>
			<!-- 项目经验模态框结束 -->
			<!-- 培训经历模态框 -->
			<div class="modal fade in" id="traedit" tabindex="-1" role="dialog" aria-labelledby="Tra" aria-hidden="false" data-backdrop="static">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">
								修改培训经历<small>（&nbsp;<span class="red_tip">*</span>为必填项&nbsp;）
								</small>
							</h4>
						</div>
						<div class="modal-body form_table_box">

							<table class="table">
								<tbody>
									<tr>
										<th><label class="control-label"><span class="red_tip">*</span>培训机构：</label></th>
										<td><input class="inputtxt6" data-val="true" data-val-length="长度<50" data-val-length-max="45" data-val-required="*" id="TrainCompanyupdate" name="TrainCompany" type="text" value="" maxlength="45" onblur="trim(this);"> <span class="field-validation-valid" data-valmsg-for="TrainCompany" data-valmsg-replace="true"></span></td>
									</tr>
									<tr>
										<th><label class="control-label"><span class="red_tip">*</span>时间：</label></th>
										<td><input id="BeginDatetraupdate" name="BeginDatetra" class="inputtxt2 date_control" type="text" value="" onfocus="WdatePicker({isShowWeek:true});" placeholder="开始日期" title="开始日期">

											<input id="EndDatetraupdate" name="EndDatetra" class="inputtxt2 date_control" type="text" value="" onfocus="WdatePicker({isShowWeek:true});" placeholder="结束日期" title="结束日期">
										</td>

									</tr>
									<tr>
										<th><label class="control-label"><span class="red_tip">*</span>获得证书：</label></th>
										<td><input class="inputtxt6" data-val="true" data-val-length="长度<50" data-val-length-max="40" id="Certificateupdate" name="Certificate" type="text" value="" maxlength="40" onblur="trim(this);">

										</td>
									</tr>
									<tr>
										<th><label class="control-label"><span class="red_tip">*</span>培训课程：</label></th>
										<td><input class="inputtxt6" data-val="true"
											maxlength="210" id="Courseupdate" name="Courseupdate"
											type="text"><span class="field-validation-valid"
											data-valmsg-for="Description" data-valmsg-replace="true"><span
												class="field-validation-valid" data-valmsg-for="Course"
												data-valmsg-replace="true"></span></td>
									</tr>
									<input type="hidden" value="" id="trainfo_id">
								</tbody>
							</table>

						</div>

						<div class="modal-footer">
							<button id="TraButton" type="button" class="btn btn-success" onclick="updatetra()" data-dismiss="modal">确认</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						</div>
						<script type="text/javascript">
						
						</script>
					</div>
				</div>
			</div>
			<div class="modal fade in" id="deltra" tabindex="-1" role="dialog"
				aria-labelledby="deltra" aria-hidden="false" data-backdrop="static">
				<div class="modal-dialog  modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">提示</h4>
						</div>
						<div class="modal-body">
							<h4>您确定要删除吗？取消后不可恢复！！</h4>
							<br> <br>
						</div>
						<input id="id" name="id" type="hidden"
							value="278be63d-6561-4c93-9049-06f7d8eccf19">
						<div class="modal-footer">
							<button id="EduButton" type="button" class="btn btn-success"
								onclick="tradelete()">确认</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
								<input type="hidden" value="" id="deltrainfoid">
						</div>
						<script type="text/javascript">
						function tradelete(){
							var CV_ID=$("#cvid").val();
							var INFO_ID=$("#deltrainfoid").val();
							$.ajax({
								type : "POST",
								url :  '<%=basePath%>edu/deletetra.act',
								data : {
									CV_ID:CV_ID,
									INFO_ID:INFO_ID,
									tm : new Date().getTime()
								},
								dataType : 'json',
								cache : false,
								success : function(data) {
									showinfo();
									$('#deltra').modal('hide');
								}
							});
						}
						</script>
					</div>
				</div>
			</div>
			<!-- 培训经历模态框结束 -->
			<!-- IT技能 -->
			<div class="modal fade in" id="Itedit" tabindex="-1" role="dialog" aria-labelledby="It" aria-hidden="false" data-backdrop="static">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">
								修改IT技能<small>（&nbsp;<span class="red_tip">*</span>为必填项&nbsp;）
								</small>
							</h4>
						</div>
						<div class="modal-body form_table_box">

							<table class="table">
								<tbody>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>名称：</label></th>
										<td colspan="3"><input class="inputtxt6"
											data-val="true" data-val-length="长度<50"
											data-val-length-max="50" data-val-required="*" id="TechNameupdate"
											name="TechName" type="text" value="${IT.SKILL_NAME }"> <span
											class="field-validation-valid" data-valmsg-for="TechName"
											data-valmsg-replace="true"></span></td>
									</tr>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>使用时间(月)：</label></th>
										<td colspan="3"><input class="inputtxt6"
											data-val="true" data-val-number="字段 使用时间 必须是一个数字。"
											data-val-required="*" id="Durationupdate" name="Duration"
											onkeyup="value=value.replace(/[^0-9]/g,'')" type="text"
											value="${IT.USE_MONTH }" maxlength="3" onblur="delZero(this)" style="ime-mode:disabled"> <span class="field-validation-valid"
											data-valmsg-for="Duration" data-valmsg-replace="true"></span>
										</td>
									</tr>
									<tr>
										<th><label class="control-label"><span
												class="red_tip">*</span>掌握程度：</label></th>
										<td colspan="3"><select class="inputtxt6"
											data-val="true" data-val-required="*" id="SkillLevelIDupdate"
											name="SkillLevelID">
											<c:forEach items="${skillList}" var="role">
														<option value="${role.DISTINGUISH_ID }"
															<c:if test="${role.DISTINGUISH_ID == IT.SKILL_LEVEL }">selected</c:if>>${role.VALUE}</option>
													</c:forEach>
										</select></td>
									</tr>
									<input type="hidden" value="" id="itinfo_id">
								</tbody>
							</table>

						</div>

						<div class="modal-footer">
							<button id="ItButton" type="button" class="btn btn-success"
								onclick="Itupdate()" data-dismiss="modal">确认</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
						</div>
					</div>
					<script type="text/javascript">
					
					</script>
				</div>
			</div>
			<div class="modal fade in" id="delit" tabindex="-1" role="dialog"
				aria-labelledby="delit" aria-hidden="false" data-backdrop="static">
				<div class="modal-dialog  modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">提示</h4>
						</div>
						<div class="modal-body">
							<h4>您确定要删除吗？取消后不可恢复！！</h4>
							<br> <br>
						</div>
						<input id="id" name="id" type="hidden"
							value="8d526a68-28ac-4e7d-ad19-510f4f17ad1e">
						<div class="modal-footer">
							<button id="EduButton" type="button" class="btn btn-success"
								onclick="Deleteit()">确认</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<input type="hidden" id="delitinfoid" value="">
						</div>
						<script type="text/javascript">
						function Deleteit(){
							var CV_ID=$("#cvid").val();
							var INFO_ID=$("#delitinfoid").val();
							$.ajax({
								type : "POST",
								url :  '<%=basePath%>edu/deleteit.act',
								data : {
									CV_ID:CV_ID,
									INFO_ID:INFO_ID,
									tm : new Date().getTime()
								},
								dataType : 'json',
								cache : false,
								success : function(data) {
									showinfo();
									$('#delit').modal('hide');
								}
							});
						}
						</script>
					</div>
				</div>
			</div>
			<!-- IT技能结束 -->
			<!--荣誉证书开始  -->
			<div class="modal fade in" id="honedit" tabindex="-1" role="dialog" aria-labelledby="hon" aria-hidden="false" data-backdrop="static">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">
								修改荣誉证书<small>（&nbsp;<span class="red_tip">*</span>为必填项&nbsp;）
								</small>
							</h4>
						</div>
						<div class="modal-body form_table_box">

							<table class="table">
								<tbody>
									<tr>
										<th><label class="control-label"><span class="red_tip">*</span>名称：</label></th>
										<td colspan="3"><input class="inputtxt6" data-val="true" data-val-length="长度<50" data-val-length-max="50" data-val-required="*" id="HonorNameupdate" name="HonorName" type="text" value="" maxlength="40" onblur="trim(this);"> <span class="field-validation-valid" data-valmsg-for="HonorName" data-valmsg-replace="true"></span></td>
									</tr>

									<tr>
										<th><label class="control-label"><span class="red_tip">*</span>时间：</label></th>
										<td><input id="BeginDatehonupdate" name="BeginDatepro" class="inputtxt2 date_control" type="text" value="" onfocus="WdatePicker({isShowWeek:true});" placeholder="开始日期" title="开始日期">
										</td>

									</tr>
									<input type="hidden" value="" id="honinfo_id">
								</tbody>
							</table>

						</div>

						<div class="modal-footer">
							<button id="HonButton" type="button" class="btn btn-success" onclick="Honupdate()" data-dismiss="modal">确认</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						</div>
					</div>
					<script type="text/javascript">
					
					</script>
				</div>
			</div>
			<div class="modal fade in" id="delhon" tabindex="-1" role="dialog"
				aria-labelledby="delhon" aria-hidden="false" data-backdrop="static">
				<div class="modal-dialog  modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">提示</h4>
						</div>
						<div class="modal-body">
							<h4>您确定要删除吗？取消后不可恢复！！</h4>
							<br> <br>
						</div>
						<input id="id" name="id" type="hidden"
							value="1f8647a9-a8ad-46d1-b677-a4395b94121c">
						<div class="modal-footer">
							<button id="EduButton" type="button" class="btn btn-success"
								onclick="Deletehon()">确认</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
								<input type="hidden" id="delhoninfoid" value="">
						</div>
						<script type="text/javascript">
						
						</script>
					</div>
				</div>
			</div>
			<!-- 荣誉证书结束 -->
			<script type="text/javascript"
		src="<%=basePath%>static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript"
		src="<%=basePath%>static/js/bootstrap-datepicker.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
			<script type="text/javascript">
			
			
			</script>

		</div>
	</div>

	<!--<footer开始>-->
	<jsp:include page="../common/footer.jsp"></jsp:include>
    <!--</footer结束>-->
	<p id="back-to-top" style="display: none;">
		<a href="#top"><span></span></a>
	</p>

	<div class="modal fade bs-example-modal-sm" tabindex="-1"
		id="layhomewarn" role="dialog" aria-labelledby="mySmallModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="mySmallModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<p id="warntext">
						请登录后操作！点此&nbsp;<a
							href="/account/logon?returnUrl=/mconsole/resumemt/index"
							class="button btn-succes"><b
							style="text-decoration: underline">登录</b></a>
					</p>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
		<script src="<%=basePath%>shyl/js/myresume/edushow.js" type="text/javascript"></script>
	</div>
	<!-- /.modal -->

</body>
</html>