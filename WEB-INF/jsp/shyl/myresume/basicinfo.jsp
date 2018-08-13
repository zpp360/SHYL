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
<title>个人信息_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<base href="<%=basePath%>">
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link href="<%=basePath%>shyl/css/maincss/css.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>shyl/css/maincss/mypage.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<!-- 引入jQuery UI的css文件 -->
<link href="<%=basePath%>shyl/css/maincss/jquery-ui.css" rel="stylesheet">
<link href="<%=basePath%>shyl/css/maincss/jquery.autocomplete.css" rel="stylesheet">
<script src="<%=basePath%>shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/datepicker/bootstrap.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/datepicker/WdatePicker.js" type="text/javascript"></script>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<!-- 引入jQuery的js文件 -->
<!-- 引入jQuery UI的js文件 -->
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery-ui.js"></script>
</head>
<body style="background-color: #f7f7f7;">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../common/left.jsp"><jsp:param value="9" name="menuType"/></jsp:include>
		<div class="mypage_right">
			<h2>基本信息</h2>
			<div class="input_class">
				<ul>
					<li><span><lable style="color: #FF0000">*</lable>姓名：</span><input type="text" id="Name" name="Name"
						class="inputtxt2" value="${pd.NAME}" maxlength="15" onblur="trim(this);"></li>
					<li><span><lable style="color: #FF0000">*</lable>性别：</span><label><input type="radio"
							id="Sex" name="Sex" value="0"
							<c:if test="${pd.SEX == 0 }">checked="checked"</c:if> checked="checked">
							男</label><label id="sexli"><input type="radio" id="Sex1" name="Sex"
							<c:if test="${pd.SEX == 1 }">checked="checked"</c:if> value="1">
							女</label></li>
					<li><span><lable style="color: #FF0000">*</lable>出生日期：</span><input type="text" id="BeginDate"
						name="BeginDate" class="inputtxt2"
						onFocus="WdatePicker({isShowWeek:true});" value="${pd.BRITH_DATE}"
						name="START_TIME" id="START_TIME" placeholder="出生日期" title="出生日期"></li>
					<li><span>毕业时间：</span><input type="text" id="graduation_date"
						name="graduation_date" class="inputtxt2"
						onFocus="WdatePicker({isShowWeek:true});" value="${pd.graduation_date}"
						name="START_TIME" id="START_TIME" type="text" placeholder="毕业时间"
						title="毕业时间"></li>
					<li><span>参加工作日期：</span><input type="text" id="BeginjobDate"
						name="BeginjobDate" class="inputtxt2"
						onFocus="WdatePicker({isShowWeek:true});" value="${pd.WORK_DATE }"
						name="START_TIME" id="START_TIME" type="text" placeholder="开始工作日期"
						title="开始工作日期"></li>
					<li><span><lable style="color: #FF0000">*</lable>婚姻状况：</span><select id="Marriage" name="Marriage"
						class="inputtxt2">
							<c:forEach items="${maritalList}" var="role">
								<option value="${role.DISTINGUISH_ID }"
									<c:if test="${role.DISTINGUISH_ID == pd.marital_status }">selected</c:if>>${role.VALUE }</option>
							</c:forEach></select></li>
					<li><span><lable style="color: #FF0000">*</lable>国家或地区：</span><select id="Country" name="Country"
						class="inputtxt2">
							<c:forEach items="${areaList}" var="role">
								<option value="${role.DISTINGUISH_ID }"
									<c:if test="${role.DISTINGUISH_ID == pd.area }">selected</c:if>>${role.VALUE }</option>
							</c:forEach></select></li>
					<li><span><lable style="color: #FF0000">*</lable>政治面貌：</span><select id="Political" name="Political"
						class="inputtxt2">
							<c:forEach items="${politicalList}" var="role">
								<option value="${role.DISTINGUISH_ID }"
									<c:if test="${role.DISTINGUISH_ID == pd.political_affiliate}">selected</c:if>>${role.VALUE}</option>
							</c:forEach></select></li>
					<li><span><lable style="color: #FF0000">*</lable>证件类型：</span><select id="IdCodeType"
						name="IdCodeType" class="inputtxt2">
							<c:forEach items="${certificateList}" var="role">
								<option value="${role.DISTINGUISH_ID }"
									<c:if test="${role.DISTINGUISH_ID == pd.certificate_type}">selected</c:if>>${role.VALUE}</option>
							</c:forEach>
					</select></li>
					<li><span><lable style="color: #FF0000">*</lable>证件号码：</span><input type="text" id="IdCode" maxlength="18"
						name="IdCode" class="inputtxt2" value="${pd.CERTIFICATE_NUM}" onblur="trim(this);"></li>
					<li><span><lable style="color: #FF0000">*</lable>海外工作经历：</span><label><input type="radio"
							id="HasOverseas" name="HasOverseas11" 
							<c:if test="${pd.overseas_work == 1 }">checked="checked"</c:if> checked="checked"
							value="1"> 无</label><label>
							<input type="radio"
							id="HasOverseas"
							<c:if test="${pd.overseas_work == 0 }">checked="checked"</c:if>
							name="HasOverseas11" value="0" >有</label></li>
					<li><span><lable style="color: #FF0000">*</lable>学历：</span><select id="EduBackground"
						name="EduBackground" class="inputtxt2">
							<c:forEach items="${educationList}" var="role">
								<option value="${role.DISTINGUISH_ID }"
									<c:if test="${role.DISTINGUISH_ID == pd.education}">selected</c:if>>${role.VALUE}</option>
							</c:forEach></select></li>
					<li><span>毕业院校：</span><input type="text" id="school" maxlength="40"
						name="school" class="inputtxt2" value="${pd.GRADUATE_SCHOOL}" onblur="trim(this);">
						<input type="hidden" id="school_id"/>
					</li>
					<li><span>户口所在地：</span><input type="text" class="inputtxt2"
						id="AccountAddress" name="AccountAddress" maxlength="50"
						value="${pd.REGISTERED_RESIDENCE}" onblur="trim(this);"></li>
					<li><span>居住地：</span><input type="text" class="inputtxt2" maxlength="50" 
						id="LivingAddress" name="LivingAddress" value="${pd.RESIDENCE }" onblur="trim(this);"></li>
					<li><span><lable style="color: #FF0000">*</lable>联系方式：</span>
						<input  class="inputtxt2" id="Telephone" name="Telephone" value="${pd.CONTACT_INFO}" maxlength="14" onblur="trim(this);">
						</li>
					<li><span><lable style="color: #FF0000">*</lable>电子邮箱：</span><input type="email" class="inputtxt2"
						id="Email" name="Email" value="${pd.MAIL}" style="ime-mode:disabled" onblur="trim(this);"></li>
				</ul>
				   <div class="form-group">
								<div class="col-sm-2 col-sm-offset-4" style="margin-top: 40px;">
									<button type="button" onclick="saveinfo();"
										class="btn btn-success btn-block">
										保存
									</button>
								</div>
					</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<!-- 中间部分结束 -->
		      <div class='modal my-modal-alert' id='success' style="display:none;">
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:150px;text-align:center;position:fixed;right:40%;bottom:60%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;修改成功!
                    </div>
                </div>
            </div>
        </div>
         <div class='modal my-modal-alert' id='error' style="display: none;">
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:150px;text-align:center;position:fixed;right:40%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/fail.png">&nbsp;&nbsp;修改失败!
                    </div>
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
	<script type="text/javascript" src="<%=basePath%>shyl/js/myresume/basicinfo.js"></script>

	<!--<footer开始>-->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!--</footer结束>-->

</body>

</html>