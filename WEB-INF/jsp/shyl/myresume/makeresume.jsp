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
<!--[if IE 8 ]> <html class="ie8"> <![endif]-->
<head>
<title>简历制作_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<jsp:include page="../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<%=basePath%>shyl/css/work.css">
<link rel="stylesheet" href="/SHYL/shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/styleRegist.css">
<script src="/SHYL/shyl/js/datepicker/WdatePicker.js"
	type="text/javascript"></script>
<!-- 日期框 -->
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<link href="<%=basePath%>shyl/css/jquery.autocomplete.css" rel="stylesheet">
<link href="<%=basePath%>shyl/css/maincss/jquery-ui.css" rel="stylesheet">
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery-ui.js"></script>
<!--[if IE 8]>
<link rel="stylesheet" type="text/css" media="all" href="<%=basePath%>shyl/css/maincss/ie8.css" />
<![endif]--> 
<style type="text/css">
.rightspan{
font-weight:600;text-align:right;display:block;width:8%;float:left;
</style>
<style type="text/css">
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
.ie8 .modaltop{
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
.ui-widget {
z-index: 1051;
}
.page-header{
	height:30px;
}
</style>
</head>
<body id="top">
<input id="CVID" name="CVID" type="hidden" value="${pd.CV_ID}">
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
					<li class="on" id="li1">基本信息完善</li>
					<li id="li2">教育和背景</li>
					<li>完成预览</li>
				</ul>
			</div>
					<div id="jbxx" style="margin-left: 3px;font-size: .9em;width: 100%">
						<form class="form-horizontal" role="form" action="" method="post"
							id="form1" name="form1">
							<div class="col-md-12 reg_form" id="UserDiv">
								<div class="form-group" id="EmailDiv">
								<div class="test">
									<span class="test2 col-sm-3 control-label"><span
										style="color: #FF0000">*</span>简历名称</span>
								</div>
									<div class="col-sm-6 test1">
										<input class="inputtxt6" id="ResumeName" name="ResumeName"
											type="text" maxlength="50" value="" onblur="trim(this);">
									</div>
								</div>
								<div class="form-group" id="PhoneDiv">
								<div class="test">
									<span class="test2 col-sm-3 control-label"><span
										style="color: #FF0000">*</span>姓名 </span>
								</div>
									<div class="col-sm-6 test1">
										<input class="inputtxt6" id="UserName" name="UserName"
											type="text" maxlength="50" value="${jbpd.name}" readonly>
									</div>
								</div>
								<div class="form-group" id="UserNmDiv">
								<div class="test">
									<span class="col-sm-3 control-label test2"><span
										style="color: #FF0000">*</span>性别 </span>
										</div>
									<div class="col-sm-6 test1">
										<input class="inputtxt6" id="UserSex" name="UserSex"
											type="text" value="${jbpd.sex}" readonly>
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="col-sm-3 control-label test2"><span
										style="color: #FF0000">*</span>出生日期 </span>
								</div>
									<div class="col-sm-6 test1">
										<input class="inputtxt6" id="UserBirthday"
											name="UserBirthday" type="text" value="${jbpd.brith_date}"
											readonly>
									</div>
								</div>
								<div class="form-group">
							<div class="test">
									<span class="col-sm-3 control-label test2">参加工作日期 </span>
							</div>
									<div class="col-sm-6 test1">
										<input class="inputtxt6" id="JoinJobDay" name="JoinJobDay"
											type="text" value="${jbpd.work_date}" readonly>
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="col-sm-3 control-label test2"><span
										style="color: #FF0000">*</span>婚姻状况 </span>
								</div>
									<div class="col-sm-6 test1">
										<select class="selectpicker show-tick inputtxt6"
											id="MaritalStatus" name="MaritalStatus" disabled="disabled">
											<option value=""></option>
											<c:forEach items="${maritalList}" var="role">
												<option value="${role.DISTINGUISH_ID }"
													<c:if test="${role.DISTINGUISH_ID == jbpd.marital_status }">selected</c:if>>${role.VALUE }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="col-sm-3 control-label test2"><span
										style="color: #FF0000">*</span>国家或地区 </span>
										</div>
									<div class="col-sm-6 test1">
										<select class="selectpicker show-tick inputtxt6"
											id="Countries" name="Countries" disabled="disabled">
											<option value=""></option>
											<c:forEach items="${areaList}" var="role">
												<option value="${role.DISTINGUISH_ID }"
													<c:if test="${role.DISTINGUISH_ID == jbpd.area }">selected</c:if>>${role.VALUE }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="col-sm-3 control-label test2"> <span
										style="color: #FF0000">*</span>证件类型</span>
								</div>
									<div class="col-sm-6 test1">
										<select class="selectpicker show-tick inputtxt6"
											id="Countries" name="Countries" disabled="disabled">
											<option value=""></option>
											<c:forEach items="${certificateList}" var="role">
												<option value="${role.DISTINGUISH_ID }"
													<c:if test="${role.DISTINGUISH_ID == jbpd.certificate_type}">selected</c:if>>${role.VALUE}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="col-sm-3 control-label test2"><span
										style="color: #FF0000">*</span>证件号码</span>
								</div>
									<div class="col-sm-6 test1">
										<input class="inputtxt6" id="CertificatesNum"
											name="CertificatesNum" type="text"
											 maxlength="50" value="${jbpd.certificate_num}" readonly>
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="col-sm-3 control-label test2"><span
										style="color: #FF0000">*</span>海外工作经历</span>
								</div>
									<div class="col-sm-6 test1" style="margin-top: 6px;">
										<label style="float: left; padding-left: 12px;"><input
											name="form-field-radio" id="form-field-radio1" disabled
											onclick="setType('1');"
											<c:if test="${jbpd.overseas_work == '0' }">checked="checked"</c:if>
											type="radio" value=""><span class="lbl">有</span></label>
										<label style="float: left; padding-left: 5px;"><input
											name="form-field-radio" id="form-field-radio2" disabled
											onclick="setType('2');"
											<c:if test="${jbpd.overseas_work == '1' }"> checked="checked"</c:if>
											type="radio" value=""><span class="lbl">无</span></label>
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="col-sm-3 control-label test2"><span
										style="color: #FF0000">*</span>政治面貌</span>
								</div>
									<div class="col-sm-6 test1">
										<select class="selectpicker show-tick inputtxt6"
											id="PoliticalLandscape" name="PoliticalLandscape"
											disabled="disabled">
											<option value=""></option>
											<c:forEach items="${politicalList}" var="role">
												<option value="${role.DISTINGUISH_ID }"
													<c:if test="${role.DISTINGUISH_ID == jbpd.political_affiliate}">selected</c:if>>${role.VALUE}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="col-sm-3 control-label test2"><span
										style="color: #FF0000">*</span>学历</span>
								 </div>
									<div class="col-sm-6 test1">
										<select class="selectpicker show-tick inputtxt6"
											id="Record" name="Record" disabled="disabled">
											<option value=""></option>
											<c:forEach items="${educationList}" var="role">
												<option value="${role.DISTINGUISH_ID }"
													<c:if test="${role.DISTINGUISH_ID ==jbpd.education}">selected</c:if>>${role.VALUE}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="col-sm-3 control-label test2">毕业院校 </span>
								</div>
									<div class="col-sm-6 test1">
										<input class="inputtxt6" id="graduate" name="graduate"
											type="text" value="${jbpd.graduate_school}" readonly>
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="col-sm-3 control-label test2">户口所在地</span>
								</div>
									<div class="col-sm-6 test1">
										<input class="inputtxt6" id="located" name="located"
											type="text" value="${jbpd.registered_residence }" readonly>
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="col-sm-3 control-label test2">居住地</span>
								</div>
									<div class="col-sm-6 test1">
										<input class="inputtxt6" id="address" name="address"
											type="text" value="${jbpd.residence}" readonly>
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="col-sm-3 control-label test2"><span
										style="color: #FF0000">*</span>期望工作地点省</span>
								</div>
									<div class="col-sm-6 test1">
										<select class="selectpicker show-tick inputtxt6"
											id="Province" name="Province">
											<option value="">${pd.EXPECTED_WORK_PROVINCE}</option>
											<c:forEach items="${ProvinceList}" var="pd">
												<option value="${pd.region_id }">${pd.region_name }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="col-sm-3 control-label test2"><span
										style="color: #FF0000">*</span>期望工作地点市</span>
								</div>
									<div class="col-sm-6 test1">
										<select class="selectpicker show-tick inputtxt6" id="City"
											name="City">
											<option value="">${pd.EXPECTED_WORK_CITY}</option>
										</select>
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="col-sm-3 control-label test2"><span
										style="color: #FF0000">*</span>联系方式</span>
								</div>
									<div class="col-sm-6 test1">
										<input class="inputtxt6" id="contact" name="contact"
											type="text" value="${jbpd.contact_info}" readonly>
									</div>
								</div>
								<div class="form-group">
                                <div class="test">
                                    <span class="col-sm-3 control-label test2"><span
                                        style="color: #FF0000">*</span>QQ</span>
                                </div>
                                    <div class="col-sm-6 test1">
                                        <input class="inputtxt6" id="qq" name="qq" maxlength="20"
                                            type="text" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onafterpaste="this.value=this.value.replace(/[^0-9]/g,'')"
                                            onblur="delZero(this);" style="ime-mode:disabled">
                                    </div>
                                </div>
								<div class="form-group">
								<div class="test">
									<span class="col-sm-3 control-label test2"><span
										style="color: #FF0000">*</span>电子邮箱</span>
								</div>
									<div class="col-sm-6 test1">
										<input class="inputtxt6" id="Email" name="Email"
											type="text" value="${jbpd.mail}" readonly>
									</div>
								</div>
								<div style="background-color: #E6E6FA; height: 30px;">
									<span style="position: relative; top: 5px; font-weight: bold;">自我评价</span>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="col-sm-3 control-label test2"><span
										style="color: #FF0000">*</span>自我评价</span>
								</div>
									<div class="col-sm-6 test1">
										<textarea style="margin-top: 10px; resize : none;" name="CommentContent"
											id="CommentContent" rows="12" cols="85" maxlength="210"
											onblur="iniWordNum(document.getElementById('maxWord1'),document.getElementById('maxWord2'),'限500字以内','eg3')"
											mzpmodule="resumeChEnFac" tiptext="" lang="en">${pd.SELF_APPRAISAL}</textarea>
									</div>
								</div>
								<div style="background-color: #E6E6FA; height: 30px;">
									<span style="position: relative; top: 5px; font-weight: bold;">求职意向</span>
								</div>
								<div class="form-group">
								<div class="test" style="margin-top: 12px;">
									<span class="col-sm-3 control-label test2" ><span
										style="color: #FF0000">*</span>期望工作性质</span>
								</div>
									<div class="col-sm-6 test1">
										<select class="selectpicker show-tick inputtxt6"
											id="PoliticalLandscape1" name="PoliticalLandscape1">
											<option value=""></option>
											<c:forEach items="${worktypeList}" var="role">
												<option value="${role.DISTINGUISH_ID }"
													<c:if test="${role.DISTINGUISH_ID ==pd.EXPECTED_WORK_TYPE}">selected</c:if>>${role.VALUE}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="col-sm-3 control-label test2" style="margin-top: -2px;"><span
										style="color: #FF0000">*</span>行业类别</span>
								</div>
									<div class="col-sm-6 test1">
										<a class="btn select_btn  btn-block" onclick="D()"
											data-toggle="modal" id="Industry" data-target="#myIndustry" style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">请选择行业类别&nbsp;<b
											class="caret" ></b></a> <input type="hidden" id="AddIndustry"
											value="" name="AddIndustry" /> <input type="hidden"
											id="inId" name="inId" value="" />
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="col-sm-3 control-label test2" style="margin-top: -3px;"><span
										style="color: #FF0000;">*</span>职位类别</span>
								</div>
									<div class="col-sm-6 test1">
										<a class="btn select_btn  btn-block" onclick="DB()"
											data-toggle="modal" id="JobText" data-target="#myJob">请选择职位类别&nbsp;<b
											class="caret"></b></a> <input type="hidden" id="JobTypeText"
											value="" name="JobTypeText" /> <input type="hidden"
											id="JobType" name="JobType" value="" />
									</div>

								</div>
								<div class="form-group">
								<div class="test">
									<span class="col-sm-3 control-label test2"><span
										style="color: #FF0000">*</span>期望职位月薪</span>
								</div>
									<div class="col-sm-6 test1">
										<select class="selectpicker show-tick inputtxt6"
											id="HopeSalaryID" name="HopeSalaryID">
											<option value=""></option>
											<c:forEach items="${sqlaryList}" var="role">
												<option value="${role.DISTINGUISH_ID }"
													<c:if test="${role.DISTINGUISH_ID ==pd.EXPECTED_SALARY}">selected</c:if>>${role.VALUE}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="col-sm-3 control-label test2"><span
										style="color: #FF0000">*</span>工作状态</span>
								</div>
									<div class="col-sm-6 test1">
										<label for="status1">
											<input type="radio" name="status1" id="status1" value="0" checked="checked" />我目前处于离职状态可立即上岗<br> 
										</label>
										<label for="status2">
											<input type="radio" name="status1" id="status2" value="1" />我目前在职，正考虑换个新环境（如有合适的工作机会，到岗时间一个月左右）<br>
										</label>
										<label for="status3">
											<input type="radio" name="status1" id="status3" value="2">我对现有工作还算满意，如有更好的工作机会，我也可以考虑。（到岗时间另议）<br>
										</label>
										<label for="status4">
											<input type="radio" name="status1" id="status4" value="3">应届毕业生
										</label>											
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-3 col-sm-9">
										<button type="button" onclick="saveinfo();"
											class="btn btn-success btn-ok">保存并进一步填写信息</button>
									</div>
								</div>
							</div>


							<div class="modal fade" id="myJob" tabindex="-1" role="dialog"
								aria-labelledby="myJob" aria-hidden="true"
								data-backdrop="static">
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
																						id="${jobChilCate.POSITION_ID}" name="Job"
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
															<div class="tab-pane fade"
																id="${jobPareCate.POSITION_ID}">
																<ul class="list-inline xz_list">
																	<c:forEach items="${jobChilCateList}" var="jobChilCate">
																		<c:if
																			test="${jobPareCate.POSITION_ID == jobChilCate.PARENT_ID}">
																			<li>
																				<div class="checkbox">
																					<label> <input type="checkbox"
																						id="${jobChilCate.POSITION_ID}" name="Job"
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
											<button type="button" class="btn btn-default"
												onclick="Clear()" data-dismiss="modal">关闭</button>
										</div>
									</div>
								</div>
							</div>

							<div class="modal fade" id="myIndustry" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
								data-backdrop="static" style="-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												onclick="Clear()">
												<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
											</button>
											<h4 class="modal-title" id="myModalLabel">请选择行业</h4>
										</div>
										<div class="modal-body">
											<ul class="list-inline xz_list">
												<c:forEach items="${industryList}" var="industry">
													<li>
														<div class="checkbox">
															<label> <input type="checkbox"
																id="${industry.DISTINGUISH_ID}" name="Ind"
																value="${industry.DISTINGUISH_ID}" />${industry.VALUE}
															</label>
														</div>
													</li>
												</c:forEach>
											</ul>
											<span style="color: #f00; font-size: 12px">(最多只能选择5个选项)</span>
										</div>
										<div class="modal-footer">

											<button type="button" class="btn btn-success"
												onclick="Industrycheck()" data-dismiss="modal">确认</button>
											<button type="button" class="btn btn-default"
												onclick="Clear()" data-dismiss="modal">关闭</button>
										</div>
									</div>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="row">
								<div class="col-sm-6 col-sm-offset-3"></div>
							</div>
						</form>
					</div>

					<div class="col-xs-12 company_content" id="jiaoyu"
						style="display: none">
						<p class="text-primary notetip">完整的简历可以帮助你获取理想的工作机会，赶快开始创建吧！</p>
						<div class="page-header">
							<h3 class="pull-left">
								<b>教育经历</b>
							</h3>
							<p class="pull-right">
								<a data-toggle="modal" data-target="#sEdu"
									class="btn btn-link hover">添加教育经历</a>
							</p>
						</div>
						<div id="edulist" class="clearfix">
						<ul></ul>
						</div>
						<div id="EduEdit" ></div>
						<div class="clearfix"></div>
						<div class="page-header">
							<h3 class="pull-left">
								<b>语言能力</b>
							</h3>
							<p class="pull-right">
								<a data-toggle="modal" data-target="#Lans"
									class="btn btn-link hover">添加语言能力</a>
							</p>
						</div>
						<div id="lanlist" class="clearfix">
						
						</div>
						<div id="Lan1">
						<ul></ul>
						</div>
						<div class="clearfix"></div>
						<div class="page-header">
							<h3 class="pull-left">
								<b>工作经历</b>
							</h3>
							<p class="pull-right">
								<a data-toggle="modal" data-target="#Work"
									class="btn btn-link hover">添加工作经历</a>
							</p>
						</div>
						<div id="worklist" class="clearfix">
						<ul></ul>
						</div>
						<div id="Works"></div>
						<div class="clearfix"></div>
						<div class="page-header">
							<h3 class="pull-left">
								<b>项目经验</b>
							</h3>
							<p class="pull-right">
								<a data-toggle="modal" data-target="#Program"
									 class="btn btn-link hover">添加项目经验</a>
							</p>
						</div>
						<div id="prolist" class="clearfix">
						<ul></ul>
						</div>
						<div id="Programs"></div>
						<div class="clearfix"></div>
						<div class="page-header">
							<h3 class="pull-left">
								<b>培训经历</b>
							</h3>
							<p class="pull-right">
								<a data-toggle="modal" data-target="#Tra" onclick="traCreate();"
									class="btn btn-link hover">添加培训经历</a>
							</p>
						</div>
						<div id="tralist" class="clearfix">
						<ul></ul>
						</div>
						<div id="Tras">
						
						</div>
						<div class="clearfix"></div>
						<div class="page-header">
							<h3 class="pull-left">
								<b>IT技能</b>
							</h3>
							<p class="pull-right">
								<a data-toggle="modal" data-target="#It"
									class="btn btn-link hover">添加IT技能</a>
							</p>
						</div>
						<div id="itlist" class="clearfix">
						<ul></ul>
						</div>
						<div id="Its"></div>
						<div class="clearfix"></div>
						<div class="page-header">
							<h3 class="pull-left">
								<b>荣誉证书</b>
							</h3>
							<p class="pull-right">
								<a data-toggle="modal" data-target="#hon" onclick="honCreate();"
									class="btn btn-link hover">添加荣誉证书</a>
							</p>
						</div>
						<div id="honlist" class="clearfix">
						<ul></ul>		
						</div>
						<div id="hons">
						</div>
						<input id="url" name="url" type="hidden"
							value="/CTalent/Resume/CreateNext?ResumeID=4513b3c1-8086-4e5e-b327-5c4fb187dd3c">
						<div>
							<br> <br>
							<div class="form-group">
								<div class="pull-right">
									<a class="btn btn-success btn-ok" onclick="show();">完成并预览</a>
								</div>
							</div>
						</div>

					</div>
					<div class="clearfix"></div>
				</div>
				<!-- 中间部分结束 -->


				<!--添加教育经历  -->
				<div class="modal fade" id="sEdu" tabindex="-1" role="dialog"
					aria-labelledby="sEdu" aria-hidden="false" data-backdrop="static">
					<form action="" id="make1">
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
														name="School" type="text"  maxlength="50"
														value="" maxlength="50" onblur="trim(this);"> 
														<input type="hidden" id="school_id">
														</td>
												</tr>
												<tr>
													<th><span class="red_tip">*</span>时间：</th>
													<td><input class="inputtxt6 date_control"
														type="text" value="" name="START_TIME_EDU"
														id="START_TIME_EDU" type="text"
														onFocus="WdatePicker({isShowWeek:true});"
														placeholder="开始日期" title="开始日期"> <span
														class="field-validation-valid"
														data-valmsg-for="BeginDate_Create"
														data-valmsg-replace="true"></span> - <input
														class="inputtxt6 date_control" type="text"
														onFocus="WdatePicker({isShowWeek:true});" value=""
														name="END_TIME_EDU" id="END_TIME_EDU" type="text"
														placeholder="结束日期" title="结束日期"> <span
														class="field-validation-valid" data-valmsg-replace="true"></span></td>
												</tr>
												<tr>
													<th><span class="red_tip">*</span>专业：</th>
													<td><input class="inputtxt6" data-val="true"
														data-val-length="长度<50" data-val-length-max="50"
														data-val-required="*" id="Major" name="Major" type="text"  maxlength="50"
														value="${EducationPd.SPECIALTY}" maxlength="50" onblur="trim(this);"> <span
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
													<td colspan="3"><label><input type="radio"
															id="HasOverseas" name="HasOverseas11"
															<c:if test="${pd.overseas_work == 0|| pd.overseas_work == null || pd.overseas_work ==''}">checked="checked"</c:if>
															 value="0"> 无</label><label> <input
															type="radio" id="HasOverseasss"
															<c:if test="${pd.overseas_work == 1 }">checked="checked"</c:if>
															name="HasOverseas11" value="1">有
													</label></td>
												</tr>


											</tbody>
										</table>
									</div>
 								</div>

								<div class="modal-footer">
									<button id="EduButtonedu" type="button" class="btn btn-success"
										>确认</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
								</div>
							</div>
						</div>
						<input type="reset" name="editedu" style="display: none;">
					</form>
					<script type="text/javascript">
					  
				</script>
				</div>
				<!-- 添加教育经历结束 -->

				<!-- 添加语言能力 -->
				<div class="modal fade" id="Lans" tabindex="-1" role="dialog"
					aria-labelledby="Lans" aria-hidden="false" data-backdrop="static">
					<form id="test44" action="">
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
																<c:if test="${role.DISTINGUISH_ID == languagepd.LISTEN_SAY_SKILL}">selected</c:if>>${role.VALUE}</option>
														</c:forEach>
												</select></td>
											</tr>
											<input id="ResumeID" name="ResumeID" type="hidden" value="">
										</tbody>
									</table>
								</div>
							</div>
							<div class="modal-footer">
								<button id="lanButtonsave" type="button" class="btn btn-success"
									 >确认</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
							</div>
							<script type="text/javascript">
						$("#lanButtonsave").click(function(){
							var CV_ID=$("#CVID").val();
							var LanguageID=$("#LanguageID").val();
							if (LanguageID == "") {
								$("#LanguageID").tips({
									side : 2,
									msg : '请选择语言',
									bg : '#AE81FF',
									time : 3
								});
								$("#LanguageID").focus();
								return false;
							}
							var DWID=$("#DWID").val();
							if (DWID == "") {
								$("#DWID").tips({
									side : 2,
									msg : '请选择读写能力',
									bg : '#AE81FF',
									time : 3
								});
								$("#DWID").focus();
								return false;
							}
							var LSID=$("#LSID").val();
							if (LSID == "") {
								$("#LSID").tips({
									side : 2,
									msg : '请选择听力能力',
									bg : '#AE81FF',
									time : 3
								});
								$("#LSID").focus();
								return false;
							}
							$.ajax({
								type : "POST",
								url :  '<%=basePath%>edu/lansave.act',
								data : {
									CV_ID:CV_ID,
									LanguageID: LanguageID,
									DWID:DWID,
									LSID:LSID,
									tm : new Date().getTime()
								},
								dataType : 'json',
								cache : false,
								success : function(data) {
									$('#Lans').modal('hide');
									showinfo();
									$("input[name='reslan']").trigger("click");
								}
							});
						})
							
						</script>
						</div>
					</div>
					<input type="reset" name="reslan" style="display: none;">
					</form>
				</div>
				<!-- 添加语言能力结束 -->

				<!-- 添加工作经历 -->
				<div class="modal fade" id="Work" tabindex="-1" role="dialog"
					aria-labelledby="sEdu" aria-hidden="false" data-backdrop="static">
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
													data-val-required="*" id="CompanyName" name="CompanyName" maxlength="45"
													type="text" value="${experiencepd.ENTERPRISE_NAME}" onblur="trim(this);" maxlength="50">
													<span class="field-validation-valid"
													data-valmsg-for="CompanyName" data-valmsg-replace="true"></span></td>
											</tr>
											<tr>
												<th><label class="control-label"><span
														class="red_tip">*</span>企业性质：</label></th>
												<td><select class="inputtxt6" data-val="true"
													data-val-required="*" id="CompanyNatureID"
													name="CompanyNatureID">
														<c:forEach items="${companytypeList}" var="role">
															<option value="${role.DISTINGUISH_ID }"
																<c:if test="${role.DISTINGUISH_ID == experiencepd.ENTERPRISE_NATURE}">selected</c:if>>${role.VALUE}</option>
														</c:forEach>
												</select> <span class="field-validation-valid"
													data-valmsg-for="CompanyNatureID"
													data-valmsg-replace="true"></span></td>

											</tr>
											<tr>
												<th><label class="control-label"><span
														class="red_tip">*</span>行业类别：</label></th>
												<td><select class="inputtxt6" data-val="true"
													data-val-required="*" id="CompanyIndustryID"
													name="CompanyIndustryID"><c:forEach
															items="${industryList}" var="role">
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
												<td><input class="inputtxt6" data-val="true" maxlength="43"
													data-val-length="长度<43" data-val-length-max="43"
													data-val-required="*" id="Department" name="Department"
													type="text" value="${experiencepd.DEPARTMENT }" onblur="trim(this);"> <span
													class="field-validation-valid" data-valmsg-for="Department"
													data-valmsg-replace="true"></span></td>

											</tr>
											<tr>
												<th><label class="control-label"><span
														class="red_tip">*</span>职位：</label></th>
												<td><input class="inputtxt6" data-val="true" maxlength="43"
													data-val-length="长度<43" data-val-length-max="43"
													data-val-required="*" id="Job" name="Department"
													type="text" value="" onblur="trim(this);"> <span
													class="field-validation-valid" data-valmsg-for="Job"
													data-valmsg-replace="true"></span></td>

											</tr>
											<tr>
												<th><label class="control-label"><span
														class="red_tip">*</span>时间：</label></th>
												<td><input id="BeginDate" name="BeginDate"
													class="inputtxt6 date_control" type="text"
													onFocus="WdatePicker({isShowWeek:true});"
													value="${experiencepd.START_TIME}" name="START_TIME"
													id="START_TIME" type="text" placeholder="开始日期" title="开始日期">-

													<input id="EndDate" name="EndDate"
													class="inputtxt6 date_control" type="text"
													onFocus="WdatePicker({isShowWeek:true});"
													value="${experiencepd.END_TIME}" name="START_TIME"
													id="START_TIME" type="text" placeholder="结束日期" title="结束日期">
												</td>

											</tr>
											<tr>
												<th><label class="control-label">下属人数：</label></th>
												<td><input class="inputtxt6" data-val="true"
													data-val-number="字段 下属人数 必须是一个数字。" maxlength="10"
													data-val-required="下属人数 字段是必需的。" id="Underling"
													name="Underling"
													onkeyup="value=value.replace(/[^0-9]/g,'')" type="text"
													value="0" onblur="delZero(this);" style="ime-mode:disabled"> <span class="field-validation-valid"
													data-valmsg-for="Underling" data-valmsg-replace="true"></span>
												</td>
											</tr>
											<tr>
												<th><label class="control-label">工作描述：</label></th>
												<td colspan="3"><input class="inputtxt6" data-val="true"
													maxlength="210"
													id="Description"
													name="Description" type="text">
													<span class="field-validation-valid"
													data-valmsg-for="Description" data-valmsg-replace="true"></span></td>
											</tr>

											<input id="ResumeID" name="ResumeID" type="hidden" value="">
										</tbody>
									</table>

								</div>

								<div class="modal-footer">
									<button id="WorkButton" type="button" class="btn btn-success"
										data-dismiss="">确认</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
								</div>
								<script type="text/javascript">
						
						</script>
							</div>
						</div>
						<input type="reset" name="editwork" style="display: none;">
					</form>
				</div>
				<!-- 添加爱工作经历结束 -->

				<!-- 添加项目经验 -->
				<div class="modal fade" id="Program" tabindex="-1" role="dialog"
					aria-labelledby="Program" aria-hidden="false"
					data-backdrop="static">
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
													data-val-length="长度<50" data-val-length-max="45" maxlength="45"
													data-val-required="*" id="ProgramName" name="ProgramName"
													type="text" value="${projectpd.PROJECT_NAME }" onblur="trim(this);"> <span
													class="field-validation-valid"
													data-valmsg-for="ProgramName" data-valmsg-replace="true"></span></td>
											</tr>
											<tr>
												<th><label class="control-label"><span
														class="red_tip">*</span>时间：</label></th>
												<td><input id="BeginDatepro" name="BeginDatepro"
													class="inputtxt6 date_control" type="text"
													onFocus="WdatePicker({isShowWeek:true});"
													value="${experiencepd.START_TIME}" name="START_TIME"
													id="START_TIME" type="text" placeholder="开始日期" title="开始日期">-

													<input id="EndDatepro" name="EndDatepro"
													onFocus="WdatePicker({isShowWeek:true});"
													class="inputtxt6 date_control" type="text"
													value="${experiencepd.END_TIME}" name="START_TIME"
													id="START_TIME" type="text" placeholder="结束日期" title="结束日期">
												</td>

											</tr>
											<tr>
												<th><label class="control-label">开发工具：</label></th>
												<td><input class="inputtxt6" data-val="true" maxlength="50"
													data-val-length="长度<100" data-val-length-max="100"
													id="Tools" name="Tools" type="text"
													value="${projectpd.DEVELOPMENT_TOOL }" onblur="trim(this);"></td>

											</tr>
											<tr>
												<th><label class="control-label">涉及技术：</label></th>
												<td><input class="inputtxt6" id="ITTechID" maxlength="50"
													name="ITTechID" type="text" value="${projectpd.TECHNOLOGY}" onblur="trim(this);"></td>
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
													data-val-length-max="200" data-val-required="*" maxlength="255"
													id="Responsibility" name="Responsibility" type="text"
													value="${ projectpd.JOB_DESCRIPTION}" onblur="trim(this);"> <span
													class="field-validation-valid"
													data-valmsg-for="Responsibility" data-valmsg-replace="true"></span>
												</td>
											</tr>
											<input id="ResumeID" name="ResumeID" type="hidden" value="">
										</tbody>
									</table>

								</div>

								<div class="modal-footer">
									<button id="ProgramButton" type="button"
										class="btn btn-success" data-dismiss="">确认</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
								</div>
							</div>
							<script type="text/javascript">
					
					</script>
						</div>
						<input type="reset" name="editpro" style="display: none;">
					</form>
				</div>
				<!-- 添加项目经验结束 -->

				<!-- 添加培训经历 -->
				<div class="modal fade" id="Tra" tabindex="-1" role="dialog"
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
													data-val-length="长度<50" data-val-length-max="50" maxlength="50"
													data-val-required="*" id="TrainCompany" name="TrainCompany"
													type="text" value="${traingpd.TRAINING_INSTITUTIONS }" onblur="trim(this);">
													<span class="field-validation-valid"
													data-valmsg-for="TrainCompany" data-valmsg-replace="true"></span></td>
											</tr>
											<tr>
												<th><label class="control-label"><span
														class="red_tip">*</span>时间：</label></th>
												<td><input id="BeginDatetra" name="BeginDatetra"
													onFocus="WdatePicker({isShowWeek:true});"
													class="inputtxt6 date_control" type="text"
													value="${experiencepd.START_TIME}" name="START_TIME"
													id="START_TIME" type="text" placeholder="开始日期" title="开始日期">-

													<input id="EndDatetra" name="EndDatetra"
													class="inputtxt6 date_control" type="text"
													onFocus="WdatePicker({isShowWeek:true});"
													value="${experiencepd.END_TIME}" name="START_TIME"
													id="START_TIME" type="text" placeholder="结束日期" title="结束日期">
												</td>

											</tr>
											<tr>
												<th><label class="control-label"><span
														class="red_tip">*</span>获得证书：</label></th>
												<td><input class="inputtxt6" data-val="true"
													data-val-length="长度<50" data-val-length-max="40"
													id="Certificate" name="Certificate" type="text" maxlength="40"
													value="${traingpd.CERTIFICATE }" onblur="trim(this);"></td>
											</tr>
											<tr>
												<th><label class="control-label"><span
														class="red_tip">*</span>培训课程：</label></th>
												<td><input class="inputtxt6" data-val="true"
													maxlength="210"
													id="Course"
													name="Course" type="text">
													<span class="field-validation-valid"
													data-valmsg-for="Course" data-valmsg-replace="true"></span></td>
											</tr>
											<input id="ResumeID" name="ResumeID" type="hidden" value="">
										</tbody>
									</table>

								</div>

								<div class="modal-footer">
									<button id="TraButton" type="button" class="btn btn-success"
										data-dismiss="">确认</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
								</div>
								<script type="text/javascript">
						
						</script>
							</div>
						</div>
						<input type="reset" name="edittra" style="display: none;">
					</form>
				</div>
				<!-- 添加培训经历结束 -->

				<!-- 添加IT技能 -->
				<div class="modal fade" id="It" tabindex="-1" role="dialog"
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
													data-val-length-max="50" data-val-required="*"
													id="TechName" name="TechName" type="text" maxlength="50"
													value="${IT.SKILL_NAME }" onblur="trim(this);"> <span
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
													value="${IT.USE_MONTH }" onblur="delZero(this);" style="ime-mode:disabled"> <span
													class="field-validation-valid" data-valmsg-for="Duration"
													data-valmsg-replace="true"></span></td>
											</tr>
											<tr>
												<th><label class="control-label"><span
														class="red_tip">*</span>掌握程度：</label></th>
												<td colspan="3"><select class="inputtxt6"
													data-val="true" data-val-required="*" id="SkillLevelID"
													name="SkillLevelID"><c:forEach
															items="${skillList}" var="role">
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
									<button id="ItButton" type="button" class="btn btn-success"
										 data-dismiss="">确认</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
								</div>
							</div>
							<script type="text/javascript">
					
					</script>
						</div>
						<input type="reset" name="editit" style="display: none;">
					</form>
				</div>
				<!-- 添加IT技能结束 -->

				<!-- 添加荣誉证书 -->
				<div class="modal fade" id="hon" tabindex="-1" role="dialog"
					aria-labelledby="hon" aria-hidden="false" data-backdrop="static">
					<form action="" id="test7">
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
													data-val-length-max="50" data-val-required="*"
													id="HonorName" name="HonorName" type="text" maxlength="50"
													value="${certpd.CERTIFICATE_NAME }" onblur="trim(this);"> <span
													class="field-validation-valid" data-valmsg-for="HonorName"
													data-valmsg-replace="true"></span></td>
											</tr>

											<tr>
												<th><label class="control-label"><span
														class="red_tip">*</span>时间：</label></th>
												<td><input id="BeginDatehon" name="BeginDatepro"
													class="inputtxt6 date_control" type="text"
													value="${experiencepd.timest}" name="START_TIME"
													onFocus="WdatePicker({isShowWeek:true});" id="START_TIME"
													type="text" placeholder="开始日期" title="开始日期"></td>

											</tr>
											<input id="ResumeID" name="ResumeID" type="hidden" value="">
											<input id="CVID" name="CVID" type="hidden" value="">
										</tbody>
									</table>

								</div>

								<div class="modal-footer">
									<button id="HonButton" type="button" class="btn btn-success"
										onclick="HonSave()">确认</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
								</div>
							</div>
							<script type="text/javascript">
					
					</script>
						</div>
						<input type="reset" name="edithon" style="display: none;">
					</form>
				</div>
				<!-- 添加荣誉证书 结束-->
				<!-- 教育背景模态框 -->
				<div class="modal fade" id="eEdu" tabindex="-1" role="dialog"
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
													data-val-length-max="50" data-val-required="*"
													id="Schoolupdate" name="School" type="text" value="" maxlength="50" onblur="trim(this);">
													<input type="hidden" id="schoolupdate_id">
													<span class="field-validation-valid"
													data-valmsg-for="School" data-valmsg-replace="true"></span></td>
											</tr>
											<tr>
												<th><span class="red_tip">*</span>时间：</th>
												<td><input id="BeginDateupdate" name="BeginDate"
													value="2016-12-09" class="inputtxt6 date_control"
													type="text" placeholder=""
													onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'EndDate\')||\'9999-12-31\'}'})">
													<span class="field-validation-valid"
													data-valmsg-for="BeginDate" data-valmsg-replace="true"></span>
													- <input id="EndDateupdate" name="EndDate"
													value="2016-12-13" class="inputtxt6 date_control"
													type="text" placeholder=""
													onfocus="WdatePicker({minDate:'#F{$dp.$D(\'BeginDate\')}',maxDate:'9999-12-31'})">
													<span class="field-validation-valid"
													data-valmsg-for="EndDate" data-valmsg-replace="true"></span>
												</td>
											</tr>
											<tr>
												<th><span class="red_tip">*</span>专业：</th>
												<td><input class="inputtxt6" data-val="true" maxlength="50" 
													data-val-length="长度<50" data-val-length-max="50"
													data-val-required="*" id="Majorupdate" name="Majorupdate"
													type="text" value=""> <span
													class="field-validation-valid" data-valmsg-for="Major"
													data-valmsg-replace="true"></span></td>
											</tr>
											<tr>
												<th><span class="red_tip">*</span>学历：</th>
												<td><select class="inputtxt6"
													id="EduBackgroundupdate" name="EduBackgroundupdate">
														<c:forEach items="${educationList}" var="role">
															<option value="${role.DISTINGUISH_ID }"
																<c:if test="${role.DISTINGUISH_ID == EducationPd.EDUCATION}">selected</c:if>>${role.VALUE}</option>
														</c:forEach>
												</select></td>
											</tr>
											<tr>
												<th>海外学习经历：</th>
												<td colspan="3"><label class="radio-inline"> <input
														checked="checked" data-val="true"
														data-val-required="海外学习经历 字段是必需的。" id="HasOverseasupdate"
														name="HasOverseasupdate" type="radio" 
														value="0">有
												</label> <label class="radio-inline"> <input
														id="HasOverseasupdate" name="HasOverseasupdate"
														type="radio" value="1">无
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
				<div class="modal fade" id="deledu" tabindex="-1" role="dialog"
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
						function Delete(){
							var CV_ID=$("#CVID").val();
							var INFO_ID=$("#delectinfoid").val();
							$.ajax({
								type : "POST",
								url :  '<%=basePath%>edu/deleteedu.act',
								data : {
									CV_ID:CV_ID,
									INFO_ID:INFO_ID,
									tm : new Date().getTime()
								},
								dataType : 'json',
								cache : false,
								success : function(data) {
									showinfo();
									$('#deledu').modal('hide');
								}
							});
						}
						</script>
						</div>
					</div>
				</div>
				<!-- 删除教育背景模态框结束 -->
				<!-- 教育背景模态框结束 -->
				<!-- 修改语言能力模态框 -->
				<div class="modal fade" id="LansEdit" tabindex="-1" role="dialog"
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
													data-val-required="*" id="LanguageIDupdate"
													name="LanguageID">
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
													data-val-required="*" id="DWIDupdate" name="DWID">
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
													data-val-required="*" id="LSIDupdate" name="LSID">
														<c:forEach items="${skillList}" var="role">
															<option value="${role.DISTINGUISH_ID }"
																<c:if test="${role.DISTINGUISH_ID == languagepd.LISTEN_SAY_SKILL}">selected</c:if>>${role.VALUE}</option>
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
				<div class="modal fade" id="dellan" tabindex="-1" role="dialog"
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
						function Deletelan(){
							var CV_ID=$("#CVID").val();
							var INFO_ID=$("#dellaninfoid").val();
							$.ajax({
								type : "POST",
								url :  '<%=basePath%>edu/deletelan.act',
								data : {
									CV_ID:CV_ID,
									INFO_ID:INFO_ID,
									tm : new Date().getTime()
								},
								dataType : 'json',
								cache : false,
								success : function(data) {
									showinfo();
									$('#dellan').modal('hide');
								}
							});
						}
						</script>
						</div>
					</div>
				</div>
				<!-- 语言能力模态框结束 -->
				<!-- 工作经历模态框 -->
				<div class="modal fade" id="WorkEdit" tabindex="-1" role="dialog"
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
												data-val-required="*" id="CompanyNameupdate"
												name="CompanyName" type="text" value="" maxlength="45" onblur="trim(this);"> <span
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
											<td><input class="inputtxt6" data-val="true"
												data-val-length="长度<45" data-val-length-max="43"
												data-val-required="*" id="Departmentupdate"
												name="Department" type="text" value="" onblur="trim(this);" maxlength="43"> <span
												class="field-validation-valid" data-valmsg-for="Department"
												data-valmsg-replace="true"></span></td>

										</tr>
										<tr>
											<th><label class="control-label"><span
													class="red_tip">*</span>职位：</label></th>
											<td>
											
											<input class="inputtxt6" data-val="true"
												data-val-length="长度<45" data-val-length-max="43"
												data-val-required="*" id="Jobupdate"
												name="Department" type="text" value="" onblur="trim(this);" maxlength="43">
												 <span class="field-validation-valid"
												data-valmsg-for="Job" data-valmsg-replace="true"></span></td>
										</tr>
										<tr>
											<th><label class="control-label"><span
													class="red_tip">*</span>时间：</label></th>
											<td><input id="BeginDateupdatework" name="BeginDate"
												class="inputtxt6 date_control" type="text" value=""
												name="START_TIME" id="START_TIME" type="text"
												onFocus="WdatePicker({isShowWeek:true});" placeholder="开始日期"
												title="开始日期">-<input id="EndDateupdatework"
												name="EndDate" class="inputtxt6 date_control" type="text"
												value="" name="START_TIME" id="START_TIME" type="text"
												onFocus="WdatePicker({isShowWeek:true});" placeholder="结束日期"
												title="结束日期"></td>

										</tr>
										<tr>
											<th><label class="control-label">下属人数：</label></th>
											<td><input class="inputtxt6" data-val="true"
												data-val-number="字段 下属人数 必须是一个数字。"
												data-val-required="下属人数 字段是必需的。" id="Underlingupdate"
												name="Underling" onkeyup="value=value.replace(/[^0-9]/g,'')"
												type="text" value="0" onblur="delZero(this);" style="ime-mode:disabled" maxlength="10"> <span
												class="field-validation-valid" data-valmsg-for="Underling"
												data-valmsg-replace="true"></span></td>
										</tr>
										<tr>
											<th><label class="control-label">工作描述：</label></th>
											<td colspan="3"><input class="inputtxt6" data-val="true"
													maxlength="210"
													id="Descriptionupdate"
													name="Descriptionupdate" type="text">
													<span class="field-validation-valid"
													data-valmsg-for="Description" data-valmsg-replace="true"><span
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
				<div class="modal fade" id="delwork" tabindex="-1" role="dialog"
					aria-labelledby="delwork" aria-hidden="false"
					data-backdrop="static">
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
						function DeleteWork(){
							var CV_ID=$("#CVID").val();
							var INFO_ID=$("#delworkinfoid").val();
							$.ajax({
								type : "POST",
								url :  '<%=basePath%>edu/deletework.act',
								data : {
									CV_ID:CV_ID,
									INFO_ID:INFO_ID,
									tm : new Date().getTime()
								},
								dataType : 'json',
								cache : false,
								success : function(data) {
									showinfo();
									$('#delwork').modal('hide');
								}
							});
						}
						</script>
						</div>
					</div>
				</div>
				<!-- 工作经历模态框结束 -->
				<!-- 项目经验模态框开始 -->
				<div class="modal fade" id="Programedit" tabindex="-1"
					role="dialog" aria-labelledby="Program" aria-hidden="false"
					data-backdrop="static">
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
												data-val-required="*" id="ProgramNameupdate"
												name="ProgramName" type="text" value="" maxlength="45" onblur="trim(this);"> <span
												class="field-validation-valid" data-valmsg-for="ProgramName"
												data-valmsg-replace="true"></span></td>
										</tr>
										<tr>
											<th><label class="control-label"><span
													class="red_tip">*</span>时间：</label></th>
											<td><input id="BeginDateproupdate" name="BeginDatepro"
												class="inputtxt6 date_control" type="text" value=""
												name="START_TIME" id="START_TIME" type="text"
												onFocus="WdatePicker({isShowWeek:true});" placeholder="开始日期"
												title="开始日期">- <input id="EndDateproupdate"
												name="EndDateproupdate" class="inputtxt6 date_control"
												type="text" value="" name="START_TIME" id="START_TIME"
												type="text" onFocus="WdatePicker({isShowWeek:true});"
												placeholder="结束日期" title="结束日期"></td>

										</tr>
										<tr>
											<th><label class="control-label">开发工具：</label></th>
											<td><input class="inputtxt6" data-val="true"
												data-val-length="长度<100" data-val-length-max="100"
												id="Toolsupdate" name="Tools" type="text" value="" maxlength="50" onblur="trim(this);"></td>

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
													maxlength="210"
													id="ProDescriptionupdate"
													name="ProDescriptionupdate" type="text">
													<span class="field-validation-valid"
													data-valmsg-for="Description" data-valmsg-replace="true">
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
												id="Responsibilityupdate" name="Responsibility" type="text"
												value="" maxlength="50" onblur="trim(this);"> <span class="field-validation-valid"
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
				<div class="modal fade" id="delpro" tabindex="-1" role="dialog"
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
						function prodelete(){
							var CV_ID=$("#CVID").val();
							var INFO_ID=$("#delproinfoid").val();
							$.ajax({
								type : "POST",
								url :  '<%=basePath%>edu/deletepro.act',
								data : {
									CV_ID:CV_ID,
									INFO_ID:INFO_ID,
									tm : new Date().getTime()
								},
								dataType : 'json',
								cache : false,
								success : function(data) {
									showinfo();
									$('#delpro').modal('hide');
								}
							});
						}
						</script>
						</div>
					</div>
				</div>
				<!-- 项目经验模态框结束 -->
				<!-- 培训经历模态框 -->
				<div class="modal fade" id="traedit" tabindex="-1" role="dialog"
					aria-labelledby="Tra" aria-hidden="false" data-backdrop="static">
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
											<th><label class="control-label"><span
													class="red_tip">*</span>培训机构：</label></th>
											<td><input class="inputtxt6" data-val="true"
												data-val-length="长度<50" data-val-length-max="50"
												data-val-required="*" id="TrainCompanyupdate"
												name="TrainCompany" type="text" value="" maxlength="50" onblur="trim(this);"> <span
												class="field-validation-valid"
												data-valmsg-for="TrainCompany" data-valmsg-replace="true"></span></td>
										</tr>
										<tr>
											<th><label class="control-label"><span
													class="red_tip">*</span>时间：</label></th>
											<td><input id="BeginDatetraupdate" name="BeginDatetra"
												class="inputtxt6 date_control" type="text" value=""
												onfocus="WdatePicker({isShowWeek:true});" placeholder="开始日期"
												title="开始日期">- <input id="EndDatetraupdate"
												name="EndDatetra" class="inputtxt6 date_control"
												type="text" value=""
												onfocus="WdatePicker({isShowWeek:true});" placeholder="结束日期"
												title="结束日期"></td>

										</tr>
										<tr>
											<th><label class="control-label"><span
													class="red_tip">*</span>获得证书：</label></th>
											<td><input class="inputtxt6" data-val="true"
												data-val-length="长度<50" data-val-length-max="45"
												id="Certificateupdate" name="Certificate" type="text"
												value="" maxlength="40" onblur="trim(this);"></td>
										</tr>
										<tr>
											<th><label class="control-label"><span
													class="red_tip">*</span>培训课程：</label></th>
											<td><input class="inputtxt6" data-val="true"
													maxlength="210"
													id="Courseupdate"
													name="Courseupdate" type="text">
													<span class="field-validation-valid"
													data-valmsg-for="Description" data-valmsg-replace="true"><span
												class="field-validation-valid" data-valmsg-for="Course"
												data-valmsg-replace="true"></span></td>
										</tr>
										<input type="hidden" value="" id="trainfo_id">
									</tbody>
								</table>

							</div>

							<div class="modal-footer">
								<button id="TraButton" type="button" class="btn btn-success"
									onclick="updatetra()" data-dismiss="modal">确认</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
							</div>
							<script type="text/javascript">
						
						</script>
						</div>
					</div>
				</div>
				<div class="modal fade" id="deltra" tabindex="-1" role="dialog"
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
							var CV_ID=$("#CVID").val();
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
				<div class="modal fade" id="Itedit" tabindex="-1" role="dialog"
					aria-labelledby="It" aria-hidden="false" data-backdrop="static">
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
												data-val-length-max="50" data-val-required="*"
												id="TechNameupdate" name="TechName" type="text"
												value="${IT.SKILL_NAME }" maxlength="50" onblur="trim(this);"> <span
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
												value="${IT.USE_MONTH }"> <span
												class="field-validation-valid" data-valmsg-for="Duration"
												data-valmsg-replace="true"></span></td>
										</tr>
										<tr>
											<th><label class="control-label"><span
													class="red_tip">*</span>掌握程度：</label></th>
											<td colspan="3"><select class="inputtxt6"
												data-val="true" data-val-required="*"
												id="SkillLevelIDupdate" name="SkillLevelID">
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
				<div class="modal fade" id="delit" tabindex="-1" role="dialog"
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
							var CV_ID=$("#CVID").val();
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
				<div class="modal fade" id="honedit" tabindex="-1" role="dialog"
					aria-labelledby="hon" aria-hidden="false" data-backdrop="static">
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
											<th><label class="control-label"><span
													class="red_tip">*</span>名称：</label></th>
											<td colspan="3"><input class="inputtxt6"
												data-val="true" data-val-length="长度<50"
												data-val-length-max="45" data-val-required="*"
												id="HonorNameupdate" name="HonorName" type="text" value="" maxlength="40" onblur="trim(this);">
												<span class="field-validation-valid"
												data-valmsg-for="HonorName" data-valmsg-replace="true"></span></td>
										</tr>

										<tr>
											<th><label class="control-label"><span
													class="red_tip">*</span>时间：</label></th>
											<td><input id="BeginDatehonupdate" name="BeginDatepro"
												class="inputtxt6 date_control" type="text" value=""
												onfocus="WdatePicker({isShowWeek:true});" placeholder="开始日期"
												title="开始日期"></td>

										</tr>
										<input type="hidden" value="" id="honinfo_id">
									</tbody>
								</table>

							</div>

							<div class="modal-footer">
								<button id="HonButton" type="button" class="btn btn-success"
									onclick="Honupdate()" data-dismiss="modal">确认</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
							</div>
						</div>
						<script type="text/javascript">
					
					</script>
					</div>
				</div>
				<div class="modal fade" id="delhon" tabindex="-1" role="dialog"
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
				
				<div class="modal fade" id="tiaozhuan" tabindex="-1" role="dialog"
				aria-labelledby="tiaozhuan" aria-hidden="false" data-backdrop="static" style="display: none;">
				<div class="modal-dialog  modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"  onclick="colose()" >
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">提示</h4>
						</div>
						<div class="modal-body">
							<h4>只能创建三份简历</h4>
							<br> <br>
						</div>
						<input id="id" name="id" type="hidden"
							value="278be63d-6561-4c93-9049-06f7d8eccf19">
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
									data-dismiss="modal" onclick="colose()" id="colose">关闭</button>
								<input type="hidden" value="" id="deltrainfoid">
						</div>
						<script type="text/javascript">
						function colose(){
							$("#tiaozhuan").attr("style","display:none");
						}
						</script>
					</div>
				</div>
			</div>
				
				<script type="text/javascript"
					src="<%=basePath%>static/js/chosen.jquery.min.js"></script>
				<!-- 下拉框 -->
				<script type="text/javascript"
					src="<%=basePath%>static/js/bootstrap-datepicker.min.js"></script>
				<script type="text/javascript"
					src="<%=basePath%>shyl/js/jquery.tips.js"></script>
				<!-- 日期框 -->
				<script type="text/javascript">
			
				</script>
	</div>
			</div>
		</div>

		<jsp:include page="../common/footer.jsp"></jsp:include>
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
			<script type="text/javascript" src="<%=basePath%>shyl/js/myresume/makeresume.js"></script>
		</div>
		<!-- /.modal -->
</body>

</html>