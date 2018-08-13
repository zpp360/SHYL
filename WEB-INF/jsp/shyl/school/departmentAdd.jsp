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
<title>添加院系信息_济南市服务外包公共服务平台</title>
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
		<jsp:include page="../common/left.jsp"><jsp:param value="43" name="menuType"/></jsp:include>
		<div class="mypage_right">
			<h2>添加院系信息</h2>
			<div class="input_class">
				<ul>
					<li><span><lable style="color: #FF0000">*</lable>院系名称：</span><input type="text" id="school_name" name="school_name"
						class="inputtxt2" value="${pd.school_name}" maxlength="20" onblur="trim(this);"></li>
					<li><span><lable style="color: #FF0000">*</lable>密码：</span><input type="password" id="userPs" name="userPs"
						class="inputtxt2" value="${pd.user_password}" placeholder="默认填写123456a?"  maxlength="20" onblur="trim(this);"></li>
					<li><span><lable style="color: #FF0000">*</lable>联系人：</span><input type="text" class="inputtxt2"
						id="contact" name="contact" maxlength="50"
						value="${pd.contact}" onblur="trim(this);"></li>
					<li><span><lable style="color: #FF0000">*</lable>联系电话：</span>
						<input class="inputtxt2" type="text" id="contact_tel" name="contact_tel" value="${pd.contact_tel}"
						 maxlength="20" onblur="trim(this);"></li>
					<li><span><lable style="color: #FF0000">*</lable>邮箱：</span><input class="inputtxt2"  type="text"
						id="mail" name="mail" maxlength="30" value="${pd.mail}" style="ime-mode:disabled" onblur="trim(this);"></li>
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
	<script type="text/javascript"
		src="<%=basePath%>static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript"
		src="<%=basePath%>static/js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>shyl/js/jquery.tips.js"></script>
	<script type="text/javascript" src="<%=basePath%>shyl/js/school/departmentAdd.js"></script>

	<!--<footer开始>-->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!--</footer结束>-->
</body>
</html>