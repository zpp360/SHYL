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
<title>简历预览_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<OBJECT classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" height="0"
	id="WebBrowser3" width="0" VIEW搜索ASTEXT> </OBJECT>
<script type="text/javascript"
	src="<%=basePath%>static/js/jquery-1.7.2.js"></script>
<script type="text/javascript"
	src="<%=basePath%>static/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<link rel="stylesheet" href="<%=basePath%>shyl/css/styleRegist.css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/work.css">
<link rel="stylesheet" href="<%=basePath%>static/css/datepicker.css" />
<!-- 日期框 -->
<style type="text/css">
* {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}
</style>
</head>
<body>
	<jsp:include page="../../common/header.jsp"></jsp:include>
	<div class="container">
		<div class="mypage_rightjl">
			<div class="clearfix"></div>
			<div class="col-md-12">
				<form action="" novalidate="novalidate">
				    <input type="hidden" id="exam_paper_id" value="${pdid.id}"/>
					<div class="page-header">
						<h3>
							<b>个人信息</b>
						</h3>
					</div>
					<div class="col-md-9">
						<div class="form-horizontal form_txt form_view">
							<div class="form-group">
								<label class="col-sm-2 control-label">姓名</label>
								<div class="col-sm-4">
									<p class="form-control-static" id="usernamee">${pd.NAME}</p>
								</div>
								<label class="col-sm-2 control-label">性别</label>
								<div class="col-sm-4">
									<p class="form-control-static">${pd.SEX}</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">出生日期</label>
								<div class="col-sm-4">
									<p class="form-control-static">${pd.BRITH_DATE}</p>
								</div>
								<label class="col-sm-2 control-label">参加工作年份</label>
								<div class="col-sm-4">
									<p class="form-control-static">${pd.WORK_DATE }</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">婚姻状况</label>
								<div class="col-sm-4">
									<p class="form-control-static">${pd.marital_status }</p>
								</div>
								<label class="col-sm-2 control-label">国家或地区</label>
								<div class="col-sm-4">
									<p class="form-control-static">${pd.area }</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">证件类型</label>
								<div class="col-sm-4">
									<p class="form-control-static">${pd.certificate_type}</p>
								</div>
								<label class="col-sm-2 control-label">证件号码</label>
								<div class="col-sm-4">
									<p class="form-control-static">${pd.CERTIFICATE_NUM}</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">海外工作经历</label>
								<div class="col-sm-4">
									<p class="form-control-static">${pd.overseas_work}</p>
								</div>
								<label class="col-sm-2 control-label">政治面貌</label>
								<div class="col-sm-4">
									<p class="form-control-static">${pd.political_affiliate }</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">户口所在地</label>
								<div class="col-sm-4">
									<p class="form-control-static">${pd.REGISTERED_RESIDENCE }</p>
								</div>
								<label class="col-sm-2 control-label">居住地</label>
								<div class="col-sm-4">
									<p class="form-control-static">${pd.RESIDENCE }</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">期望工作地</label>
								<div class="col-sm-4">
									<p class="form-control-static">${cvpd.province}&nbsp;${cvpd.city}</p>
								</div>
								<label class="col-sm-2 control-label">学历</label>
								<div class="col-sm-4">
									<p class="form-control-static">${pd.education}</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">联系方式</label>
								<div class="col-sm-4">
									<p class="form-control-static">${pd.CONTACT_INFO}</p>
								</div>
								<label class="col-sm-2 control-label">电子邮箱</label>
								<div class="col-sm-4">
									<p class="form-control-static">${pd.MAIL}</p>
								</div>
							</div>
							<div class="form-group">
                                <label class="col-sm-2 control-label">QQ</label>
                                <div class="col-sm-4">
                                    <p class="form-control-static">${cvpd.qq}</p>
                                </div>
                            </div>
						</div>
					</div>
					<div class="col-md-3">
						<c:choose>
					<c:when test="${pd.USER_PICTURE !=null and pd.USER_PICTURE !=''}">
						<img onerror="showImgDelay(this,'<%=basePath%>shyl/images/mylogo.jpg');" src="<%=basePath%>images/${pd.USER_PICTURE}" alt="LOGO" style="max-width: 500px; max-height: 300px;" >
					</c:when>
					<c:otherwise>
						<img src="<%=basePath%>shyl/images/mylogo.jpg" alt="LOGO"  style="max-width: 100%; max-height: 100%;" >
					</c:otherwise>
				</c:choose>

					</div>
					<div class="clearfix"></div>
					<div class="page-header">
						<h3>
							<b>自我评价</b>
						</h3>
					</div>
					<div class="col-md-9" style="padding-left: 30px;">
						<p>${cvpd.self_appraisal}</p>
					</div>
					<div class="clearfix"></div>
					<div class="page-header">
						<h3>
							<b>求职意向</b>
						</h3>
					</div>
					<div class="col-md-9">
						<div class="form-horizontal form_txt form_view">
							<div class="form-group">
								<label class="col-sm-3 control-label">期望工作性质</label>
								<div class="col-sm-9">

									<p class="form-control-static">${cvpd.worktype}</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">期望从事行业</label>
								<div class="col-sm-9">
									<p class="form-control-static">${cvpd.indeustry1}${cvpd.indeustry2}${cvpd.indeustry3}${cvpd.indeustry4}${cvpd.indeustry5}</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">期望从事职业</label>
								<div class="col-sm-9">
									<p class="form-control-static">${cvpd.indeustry }</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">期望月薪（税前）</label>
								<div class="col-sm-9">
									<p class="form-control-static">${cvpd.salary }</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">工作状态</label>
								<div class="col-sm-9">

									<p class="form-control-static">${cvpd.workingstate }</p>
								</div>
							</div>
						<input type="hidden" id="cvidd" value="${cvpd.cv_id}">
						</div>
					</div>
					<div class="clearfix"></div>
					<div class="page-header">
						<h3>
							<b>教育经历</b>
						</h3>
					</div>


					<div class="col-md-9">
						<div class="form-horizontal form_txt form_view"></div>
						<div class="col-sm-12">
							<c:forEach items="${ediucationpdList}" var="var" varStatus="vs">
								<p class="form-control-static">${var.timest}-
									${var.timeend}：${var.school_name  }&nbsp;/&nbsp;${var.specialty }&nbsp;/&nbsp;${var.education }&nbsp;/&nbsp;${var.overseas_study}海外工作经历</p>
									<hr style="border-style:1px dashed;">
							</c:forEach>
						</div>
					</div>
					<div class="clearfix"></div>
					<hr style="border-style: dashed;">
					<div class="page-header">
						<h3>
							<b>语言能力</b>
						</h3>
					</div>
					<div class="col-md-9">
						<div class="col-sm-12">
							<c:forEach items="${languagepdList}" var="var" varStatus="vs">
								<p class="form-control-static">外语语种&nbsp;:&nbsp;${var.languages }&nbsp;/&nbsp;读写能力&nbsp;:&nbsp;${var.read_write_skill}&nbsp;/&nbsp;听写能力&nbsp;:&nbsp;${var.listen_say_skill}</p>
								<hr style="border-style:1px dashed;">
							</c:forEach>
						</div>
					</div>
					<div class="clearfix"></div>
					<hr style="border-style: dashed;">
					<div class="page-header">
						<h3>
							<b>工作经历</b>
						</h3>
					</div>
					<div class="col-md-9">
						<c:forEach items="${experiencepdList}" var="var" varStatus="vs">
							<div class="form-horizontal form_txt">
								<div class="form-group">
									<label class="col-sm-3 control-label">单位名称</label>
									<div class="col-sm-9">
										<p class="form-control-static">${var.enterprise_name}</p>
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-3 control-label">时间</label>
									<div class="col-sm-9">
										<p class="form-control-static">${var.timest }&nbsp;~
											<c:choose>
												<c:when test="${var.timeend !=null && var.timeend !=''}">
													${var.timeend}
												</c:when>
												<c:otherwise>
													至今
												</c:otherwise>
											</c:choose></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">公司性质</label>
									<div class="col-sm-9">
										<p class="form-control-static">${var.enterprise_nature }</p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">行业</label>
									<div class="col-sm-9">
										<p class="form-control-static">${var.industry_type}</p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">部门</label>
									<div class="col-sm-9">
										<p class="form-control-static">${var.department }</p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">职位</label>
									<div class="col-sm-9">
										<p class="form-control-static">${var.positions }</p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">工作描述</label>
									<div class="col-sm-9">
										<p class="form-control-static">${var.job_description }</p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">下属人数</label>
									<div class="col-sm-9">
										<p class="form-control-static">${var.subordinates }</p>
									</div>
								</div>
							</div>
						<hr style="border-style:1px dashed;">
						</c:forEach>
					</div>
					<div class="clearfix"></div>
					<hr style="border-style: dashed;">
					<div class="page-header">
						<h3>
							<b>项目经验</b>
						</h3>
					</div>
					<div class="col-md-9">
						<c:forEach items="${projectpdList}" var="var" varStatus="vs">
							<div class="form-horizontal form_txt">
								<div class="form-group">
									<label class="col-sm-3 control-label">单位名称</label>
									<div class="col-sm-9">
										<p class="form-control-static">${var.project_name }</p>
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-3 control-label">时间</label>
									<div class="col-sm-9">
										<p class="form-control-static">${var.timest }~
											${var.timeend }</p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">开发工具</label>
									<div class="col-sm-9">
										<p class="form-control-static">${var.development_tool}</p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">涉及技术</label>
									<div class="col-sm-9">
										<p class="form-control-static">${var.technology}</p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">描述</label>
									<div class="col-sm-9">
										<p class="form-control-static">${var.job_description}</p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">职责</label>
									<div class="col-sm-9">
										<p class="form-control-static">${var.project_description}</p>
									</div>
								</div>
							</div>
							<hr style="border-style:1px dashed;">
						</c:forEach>
					</div>
					<div class="clearfix"></div>
					<hr style="border-style: dashed;">
					<div class="page-header">
						<h3>
							<b>培训经历</b>
						</h3>
					</div>
					<div class="col-md-9">
						<c:forEach items="${traingpdList}" var="var" varStatus="vs">
							<div class="form-horizontal form_txt">
								<div class="form-group">
									<label class="col-sm-3 control-label">培训机构</label>
									<div class="col-sm-9">
										<p class="form-control-static">${var.training_institutions }
										</p>
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-3 control-label">时间</label>
									<div class="col-sm-9">
										<p class="form-control-static">${var.timest }~
											${var.timeend}</p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">证书</label>
									<div class="col-sm-9">
										<p class="form-control-static">${var.certificate}</p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">培训课程</label>
									<div class="col-sm-9">
										<p class="form-control-static">${var.course }</p>
									</div>
								</div>
							</div>
							<hr style="border-style:1px dashed;">
						</c:forEach>
					</div>
					<div class="clearfix"></div>
					<hr style="border-style: dashed;">
					<div class="page-header">
						<h3>
							<b>IT技能</b>
						</h3>
					</div>
					<div class="col-md-9">
						<div class="col-sm-12">
							<c:forEach items="${itList}" var="var" varStatus="vs">
								<p class="form-control-static">名称&nbsp;:&nbsp;${var.skill_name }&nbsp;/&nbsp;使用时间&nbsp;:&nbsp;${var.use_month}(月)&nbsp;/&nbsp;掌握程度&nbsp;:&nbsp;${var.skill_level}</p>
							</c:forEach>
						</div>
					</div>
					<div class="clearfix"></div>
					<hr style="border-style: dashed;">
					<div class="page-header">
						<h3>
							<b>荣誉证书</b>
						</h3>
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
					<hr style="border-style: dashed;">
				</form>
				<div>
					<br> <br>
					<div class="form-group">
						<div class="pull-right">
							<%-- <a class="btn btn-success btn-ok" href="<%=basePath%>tester/list.act">返回</a> --%>
							<a class="btn btn-success btn-ok" href="<%=basePath%>tester/list.act?id=${pdid.id}">返回</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>