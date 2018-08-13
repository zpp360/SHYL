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
<title>简历修改_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/styleRegist.css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/work.css">
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<!--[if IE 8]>
<link rel="stylesheet" type="text/css" media="all" href="<%=basePath%>shyl/css/maincss/ie8.css" />
<![endif]--> 
</head>
<body id="top">
	<jsp:include page="../common/header.jsp"></jsp:include>
	<input type="hidden" value="${downhref}" id="filename">
	<div class="clear"></div>
	<div class="container-fluid">
		<div class="register-box p0">
			<!-- 导航条代码开始 -->
		<div class="rticon"></div>
		<jsp:include page="../common/left.jsp"><jsp:param value="10" name="menuType"/></jsp:include>
				<div class="mypage_right" id="makeresume">
				<div class="mypage_tab">
					<h2>简历管理</h2>
					
					<div id="jbxx" style="font-size: .9em;">
						<form class="form-horizontal" role="form" action="" method="post"
							id="form1" name="form1">
							<div class="col-md-12 col-sm-12 col-xs-12 reg_form" id="UserDiv">
							<div style="background-color: #E6E6FA; height: 30px;" class="ht">
									<span style="position: relative; top: 5px; font-weight: bold;">个人信息</span>
								</div>
								<div class="form-group">
								
								<div class="hd hh">
									<ul>
										<li class="on" onclick="basicinfoedu()" id="basic">基本信息完善</li>
										<li onclick="eduinfo()" id="edu">教育和背景</li>
									</ul>
								</div>
								</div>
								<div class="form-group" id="EmailDiv">
									<div class="test">
									<label class="col-sm-3 control-label test2"><span
										style="color: #FF0000">*</span>简历名称</label>
									</div>
									<div class="col-sm-6 test1">
										<input class="inputtxt6" id="ResumeName" name="ResumeName"
											type="text" maxlength="50" value="${edpd.CV_NAME}" onblur="trim(this);">
									</div>
									<input type="hidden" id="cvId" value="${edpd.CV_ID}">
								</div>
								<div class="form-group" id="PhoneDiv">
								<div class="test">
									<span class="col-sm-3 control-label test2"><span
										style="color: #FF0000">*</span>姓名 </span>
											</div>
									<div class="col-sm-6 test1">
										<input class="inputtxt6" id="UserName" name="UserName"
											type="text" value="${edpd.NAME}" readonly>
									</div>
								</div>
								<div class="form-group" id="UserNmDiv">
								<div class="test">
									<span class="col-sm-3 control-label test2"> <span
										style="color: #FF0000">*</span>性别</span>
										</div>
									<div class="col-sm-6 test1">
										<input class="inputtxt6" id="UserSex" name="UserSex"
											type="text" value="${edpd.sex}" readonly>
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="col-sm-3 control-label test2"><span
										style="color: #FF0000">*</span>出生日期 </span></div>
									<div class="col-sm-6 test1">
										<input class="inputtxt6" id="UserBirthday"
											name="UserBirthday" type="text" value="${edpd.BRITH_DATE}"
											readonly>
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="col-sm-3 control-label test2">参加工作日期</span>
								</div>
									<div class="col-sm-6 test1">
										<input class="inputtxt6" id="JoinJobDay" name="JoinJobDay"
											type="text" value="${edpd.WORK_DATE}" readonly>
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
													<c:if test="${role.DISTINGUISH_ID == edpd.MARITAL_STATUS }">selected</c:if>>${role.VALUE }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<label class="col-sm-3 control-label test2"> <span
										style="color: #FF0000">*</span>国家或地区</label>
								</div>
									<div class="col-sm-6 test1">
										<select class="selectpicker show-tick inputtxt6"
											id="Countries" name="Countries" disabled="disabled">
											<option value=""></option>
											<c:forEach items="${areaList}" var="role">
												<option value="${role.DISTINGUISH_ID }"
													<c:if test="${role.DISTINGUISH_ID == edpd.AREA }">selected</c:if>>${role.VALUE }</option>
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
													<c:if test="${role.DISTINGUISH_ID == edpd.CERTIFICATE_TYPE}">selected</c:if>>${role.VALUE}</option>
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
											value="${edpd.CERTIFICATE_NUM }" readonly>
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="col-sm-3 control-label test2"><span
										style="color: #FF0000">*</span>海外工作经历</span>
								</div>
									<div class="col-sm-6 test1" style="margin-top: 7px;">
										<label style="float: left; padding-left: 12px;"><input
											name="form-field-radio" id="form-field-radio1"
											onclick="setType('1');" disabled
											<c:if test="${edpd.OVERSEAS_WORK == '0' }">checked="checked"</c:if>
											type="radio" value="icon-edit">
											<span class="lbl">有</span></label>
										
										<label style="float: left; padding-left: 5px;"><input
											name="form-field-radio" id="form-field-radio2"
											onclick="setType('2');" disabled
											<c:if test="${edpd.OVERSEAS_WORK == '1' }">checked="checked"</c:if>
											type="radio" value="icon-edit"><span class="lbl">无</span></label>
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
													<c:if test="${role.DISTINGUISH_ID == edpd.POLITICAL_AFFILIATE}">selected</c:if>>${role.VALUE}</option>
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
													<c:if test="${role.DISTINGUISH_ID == edpd.EDUCATION}">selected</c:if>>${role.VALUE}</option>
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
											type="text" value="${edpd.GRADUATE_SCHOOL}" readonly>
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="test2 col-sm-3 control-label">户口所在地</span>
								</div>
									<div class="col-sm-6 test1">
										<input class="inputtxt6" id="located" name="located"
											type="text" value="${edpd.REGISTERED_RESIDENCE }" readonly>
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="col-sm-3 control-label test2">居住地</span>
								</div>
									<div class="col-sm-6 test1">
										<input class="inputtxt6" id="address" name="address"
											type="text" value="${edpd.RESIDENCE}" readonly>
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="test2 col-sm-3 control-label"><span
										style="color: #FF0000">*</span>期望工作地点省</span>
								</div>
									<div class="col-sm-6 test1">
										<select class="selectpicker show-tick inputtxt6"
											id="Province" name="Province">
											<option value="${edpd.EXPECTED_WORK_PROVINCE}">${edpd.EXPECTED_WORK_PROVINCE1}</option>
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
										<select class=" inputtxt6" id="City" name="City" onclick="GetCity()" >
											<option value="${edpd.EXPECTED_WORK_CITY}">${edpd.EXPECTED_WORK_CITY1}</option>
											<c:forEach items="${cityByRegionList}" var="vars">
												<option value="${vars.REGION_ID}"
												<c:if test="${vars.REGION_ID == edpd.EXPECTED_WORK_CITY }">selected</c:if>>${vars.REGION_NAME}</option>
											</c:forEach>
										</select>
										
										
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="test2 col-sm-3 control-label"><span
										style="color: #FF0000">*</span>联系方式</span>
								</div>
									<div class="col-sm-6 test1">
										<input class="inputtxt6" id="contact" name="contact"
											type="text" value="${edpd.CONTACT_INFO}" readonly>
									</div>
								</div>
								<div class="form-group">
                                <div class="test">
                                    <span class="test2 col-sm-3 control-label"><span
                                        style="color: #FF0000">*</span>QQ</span>
                                </div>
                                    <div class="col-sm-6 test1">
                                        <input class="inputtxt6" id="qq" name="qq" maxlength="20"
                                            type="text" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onafterpaste="this.value=this.value.replace(/[^0-9]/g,'')" value="${edpd.QQ}">
                                    </div>
                                </div>
								<div class="form-group">
								<div class="test">
									<span class="test2 col-sm-3 control-label"><span
										style="color: #FF0000">*</span>电子邮箱</span>
								</div>
									<div class="col-sm-6 test1">
										<input class="inputtxt6" id="Email" name="Email"
											type="text" value="${edpd.MAIL}" readonly>
									</div>
								</div>
								<div style="background-color: #E6E6FA; height: 30px;">
									<span style="position: relative; top: 5px; font-weight: bold;">自我评价</span>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="test2 col-sm-3 control-label"><span
										style="color: #FF0000">*</span>自我评价</span>
								</div>
									<div class="col-sm-6 test1">
										<textarea style="margin-top: 10px; resize : none;" name="CommentContent"
											id="CommentContent" rows="12" cols="62%" maxlength="210"
											onblur="iniWordNum(document.getElementById('maxWord1'),document.getElementById('maxWord2'),'限500字以内','eg3')"
											mzpmodule="resumeChEnFac" tiptext="" lang="en">${edpd.SELF_APPRAISAL}</textarea>
										</div>
								</div>
								<div style="background-color: #E6E6FA; height: 30px;">
									<span style="position: relative; top: 5px; font-weight: bold;"><span
										style="color: #FF0000">*</span>求职意向</span>
								</div>
								<div class="form-group" style="margin-top:10px">
								<div class="test">
									<span class="test2 col-sm-3 control-label"><span
										style="color: #FF0000">*</span>期望工作性质</span>
								</div>
									<div class="col-sm-6 test1">
										<select class="selectpicker show-tick inputtxt6"
											id="PoliticalLandscape1" name="PoliticalLandscape1">
											<option value=""></option>
											<c:forEach items="${worktypeList}" var="role">
												<option value="${role.DISTINGUISH_ID }"
													<c:if test="${role.DISTINGUISH_ID ==edpd.EXPECTED_WORK_TYPE}">selected</c:if>>${role.VALUE}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="test2 col-sm-3 control-label" style="margin-top: -2px;"><span
										style="color: #FF0000">*</span>期望从事行业</span>
								</div>
									<div class="col-sm-6 test1">
										<a class="btn select_btn  btn-block" onclick="D()"
											data-toggle="modal" style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" id="Industry" data-target="#myIndustry">${edpd.INDUSTRY_1}&nbsp;${edpd.INDUSTRY_2}&nbsp;${edpd.INDUSTRY_3}&nbsp;${edpd.INDUSTRY_4}&nbsp;${edpd.INDUSTRY_5}&nbsp;<b
											class="caret"></b></a> <input type="hidden" id="AddIndustry"
											value="" name="AddIndustry" /> <input type="hidden"
											id="inId" name="inId" value="${edpd.EXPECTED_INDUSTRY_1},${edpd.EXPECTED_INDUSTRY_2},${edpd.EXPECTED_INDUSTRY_3},${edpd.EXPECTED_INDUSTRY_4},${edpd.EXPECTED_INDUSTRY_5}" />
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="test2 col-sm-3 control-label" style="margin-top: -3px;"><span
										style="color: #FF0000">*</span>期望从事职位</span>
								</div>
								<div class=" test1 col-sm-6">
										<a class="btn select_btn  btn-block" onclick="DB()"
											data-toggle="modal" id="JobText" data-target="#myJob">${edpd.POSITION_1}&nbsp;<b
											class="caret"></b></a> <input type="hidden" id="JobType"
											value="${edpd.EXPECTED_POSITION_1}" name="JobType" />
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class="test2 col-sm-3 control-label"><span
										style="color: #FF0000">*</span>期望职位月薪</span>
								</div>
									<div class="col-sm-6 test1">
										<select class="selectpicker show-tick inputtxt6"
											id="HopeSalaryID" name="HopeSalaryID">
											<option value=""></option>
											<c:forEach items="${sqlaryList}" var="role">
												<option value="${role.DISTINGUISH_ID }"
													<c:if test="${role.DISTINGUISH_ID ==edpd.EXPECTED_SALARY}">selected</c:if>>${role.VALUE}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
								<div class="test">
									<span class=" test2 col-sm-3 control-label"><span
										style="color: #FF0000">*</span>工作状态</span>
								</div>
								<div class="col-sm-6 test1" style="margin-top: 7px;">
				
									<c:if test="${edpd.WORKING_STATE ==0}">
										<label >
											<input type="radio" name="status1" id="status1" value="0" checked="checked"/>我目前处于离职状态可立即上岗<br>
										</label>
									</c:if>
									<c:if test="${edpd.WORKING_STATE !=0}">
										<label>
										<input type="radio" name="status1" id="status1" value="0"/>我目前处于离职状态可立即上岗<br>
										</label>
									</c:if>
									<c:if test="${edpd.WORKING_STATE ==1}">
										<label>
										<input type="radio" name="status1" id="status1" value="1" checked="checked"/>我目前在职，正考虑换个新环境（如有合适的工作机会，到岗时间一个月左右）<br>
										</label>
									</c:if>
									<c:if test="${edpd.WORKING_STATE !=1}">
										<label>
										<input type="radio" name="status1" id="status1" value="1"/>我目前在职，正考虑换个新环境（如有合适的工作机会，到岗时间一个月左右）<br>
										</label>
									</c:if>
									<c:if test="${edpd.WORKING_STATE ==2}">
										<label>
										<input type="radio" name="status1" id="status1" value="2" checked="checked"/>我对现有工作还算满意，如有更好的工作机会，我也可以考虑。（到岗时间另议）<br>
										</label>
									</c:if>
									<c:if test="${edpd.WORKING_STATE !=2}">
										<label>
										<input type="radio" name="status1" id="status1" value="2"/>我对现有工作还算满意，如有更好的工作机会，我也可以考虑。（到岗时间另议）<br>
										</label>
									</c:if>
									<c:if test="${edpd.WORKING_STATE ==3}">
										<label>
										<input type="radio" name="status1" id="status1" value="3" checked="checked"/>应届毕业生<br>
										</label>
									</c:if>
									<c:if test="${edpd.WORKING_STATE !=3}">
										<label>										
										<input type="radio" name="status1" id="status1" value="3"/>应届毕业生<br>
										</label>
									</c:if>
								</div>
								</div>
								<div class="col-sm-4 col-sm-offset-4">
									<input type="button" id="Register" onclick="saveinfo();"
										value="保存并进一步填写信息" class="btn btn-success btn-lg btn-block"
										style="margin: 0;" />
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
																value="${industry.DISTINGUISH_ID}"/>${industry.VALUE}
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
							<div class="clearfix"></div>
							<div class="row">
								<div class="col-sm-6 col-sm-offset-3"></div>
							</div>
						</form>
					</div>
				</div>
				<div class="clearfix"></div>
				
			</div>
			<!-- 中间部分结束 -->
			<script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
			<script src="<%=basePath%>shyl/js/myresume/edushow.js" type="text/javascript"></script>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>
	<p id="back-to-top" style="display: none;">
		<a href="#top"><span></span></a>
	</p>


</body>

</html>