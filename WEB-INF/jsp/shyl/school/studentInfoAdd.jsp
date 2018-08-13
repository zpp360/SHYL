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
<title>添加学生信息_济南市服务外包公共服务平台</title>
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
		<jsp:include page="../common/left.jsp"><jsp:param value="42" name="menuType"/></jsp:include>
		<div class="mypage_right">
			<h2>添加学生信息</h2>
			<div class="input_class">
				<ul>
					<li><span><lable style="color: #FF0000">*</lable>姓名：</span><input type="text" id="name" name="name"
						class="inputtxt2" value="${pd.name}" maxlength="50" onblur="trim(this);"></li>
					<li><span><lable style="color: #FF0000">*</lable>性别：</span><label><input type="radio"
							id="sex" name="sex" value="0"
							<c:if test="${pd.sex == 0 }">checked="checked"</c:if> checked="checked">
							男</label><label id="sexli"><input type="radio" id="sex1" name="sex"
							<c:if test="${pd.sex == 1 }">checked="checked"</c:if> value="1">
							女</label></li>
					<li><span><lable style="color: #FF0000">*</lable>学号：</span><input type="text" id="studentNo" name="studentNo"
						class="inputtxt2" value="${pd.student_no}" maxlength="30"
						onkeyup="value=value.replace(/[^0-9]/g,'')" onblur="trim(this);"></li>
					<li><span><lable style="color: #FF0000">*</lable>密码：</span><input type="password" id="userPs" name="userPs"
						class="inputtxt2" value="${pd.user_password}" placeholder="默认填写123456a?"  maxlength="20" onblur="trim(this);"></li>
					<li><span><lable style="color: #FF0000">*</lable>出生日期：</span><input type="text" id="brithDate"
						name="brithDate" class="inputtxt2" onFocus="WdatePicker({isShowWeek:true});"
						value="${pd.brith_date}" placeholder="出生日期" title="出生日期"></li>
					<li><span>毕业时间：</span><input type="text" id="graduationDate"
						name="graduationDate" class="inputtxt2" onFocus="WdatePicker({isShowWeek:true});"
						value="${pd.graduation_date}" placeholder="毕业时间" title="毕业时间"></li>
					<li><span><lable style="color: #FF0000">*</lable>身份证号：</span><input type="text" id="idCode" maxlength="18"
						name="idCode" class="inputtxt2" value="${pd.certificate_num}" onblur="trim(this);"></li>
					<li><span><lable style="color: #FF0000">*</lable>专业名称：</span><input type="hidden" id="profe_id"/>
						<input type="text" id="profession" maxlength="30"
						name="profession" class="inputtxt2" value="${pd.profession}" onblur="trim(this);"></li>
					<li><span><lable style="color: #FF0000">*</lable>联系方式：</span>
						<input class="inputtxt2" type="text" id="telephone" name="telephone" value="${pd.contact_info}"
						 maxlength="20" onblur="trim(this);"></li>
					<li><span><lable style="color: #FF0000">*</lable>电子邮箱：</span><input class="inputtxt2"  type="text"
						id="email" name="email" maxlength="50" value="${pd.mail}" style="ime-mode:disabled" onblur="trim(this);"></li>
				</ul>
				   <div class="form-group">
						<div class="col-sm-2 col-sm-offset-4" style="margin-top: 40px;">
							<button type="button" onclick="saveinfo();"
								class="btn btn-success btn-block">保存
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
	<script type="text/javascript" src="<%=basePath%>shyl/js/school/studentInfoAdd.js"></script>

	<!--<footer开始>-->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!--</footer结束>-->

</body>

</html>