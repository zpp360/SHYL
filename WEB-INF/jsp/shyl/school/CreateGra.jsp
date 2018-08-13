<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>新建专业_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/uploadify.css">
<script src="<%=basePath%>shyl/js/jquery-1.7.2.js"></script>
<script src="<%=basePath%>shyl/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>shyl/js/jquery.min.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.min.js"></script>
<script src="<%=basePath%>shyl/js/datepicker/WdatePicker.js"
	type="text/javascript"></script>
<link href="<%=basePath%>shyl/css/maincss/mypage.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet"
	href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<link href="<%=basePath%>shyl/css/maincss/school.css" rel="stylesheet" type="text/css">
<script src="<%=basePath%>shyl/js/mainjs/errImage.js"
	type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/jquery.placeholder.js"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>

<script type="text/javascript">
function studentnum() {
	var inId = $("#graduate_num").val();
	if (inId == "" || inId == null || inId == ",,,,") {
		$("#graduate_num").tips({
			side : 1,
			msg : '请输入毕业生人数',
			bg : '#AE81FF',
			time : 3
		});
		return true;
	}
}
function profross() {
	var inId = $("#profession").val();
	if (inId == "" || inId == null || inId == ",,,,") {
		$("#profession").tips({
			side : 1,
			msg : '请输入专业',
			bg : '#AE81FF',
			time : 3
		});
		return true;
	}
}
function year(){
	var year=$("#year").val();
	if(year==""||year==null){
		$("#year").tips({
			side : 1,
			msg : '请选择毕业时间',
			bg : '#AE81FF',
			time : 3
		});
		return true;	
	}
}
    //提交表单
	function sub() {
		if(profross()){
    		$("#profession").focus();
    		return;	
    	}
		if(studentnum()){
    		$("#graduate_num").focus();
    		return;	
    	}
		if(year()){
			$("#year").focus();
    		return;		
		}
		$("#form1").submit();
	}
</script>
</head>
<body id="top" style="background-color: #f7f7f7;">
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>

		<jsp:include page="../common/left.jsp"><jsp:param value="16" name="menuType"/></jsp:include>

		<div class="mypage_right">
			<h2>院校信息</h2>
			<form action="<%=basePath%>school/createprofession.act"
				class="form-horizontal" id="form1" method="post">
				<!-- start -->
				<input type="hidden" id="result" name="result" value="${pd.result}">
				<input type="hidden" id="institutionId" name="institutionId"
					value="${pd.USER_ID}">
				<div class='modal my-modal-alert' id='my-modal-success-alert'>
					<div class='modal-dialog boxBodySmall'>
						<div class='modal-content'
							style="width: 150px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
							<div class='modal-body' id='modal-body-alert'>
								<img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;修改成功!
							</div>
						</div>
					</div>
				</div>

				<div class='modal my-modal-alert' id='my-modal-failure-alert'>
					<div class='modal-dialog boxBodySmall'>
						<div class='modal-content'
							style="width: 150px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
							<div class='modal-body' id='modal-body-alert'>
								<img alt="" src="<%=basePath%>shyl/images/fail.png">&nbsp;&nbsp;修改失败!
							</div>
						</div>
					</div>
				</div>
				<!-- end -->


				<div class="input_class">
					<ul>
					 		<li><span><small style="color: red">*</small>学科：</span> <select
							class="inputtxt2" id="professionalcate" name="professionalcate"
							onclick="GetCity()" onchange="checkProvinceId();">
								<c:forEach items="${professionalcate}" var="role">
									<option value="${role.DISTINGUISH_ID}"
										<c:if test="${role.DISTINGUISH_ID == pd.batch}">selected</c:if>>${role.VALUE}</option>
								</c:forEach>
							</select></li>
						<li><span><small style="color: red">*</small>专业：</span> <input class="inputtxt2"
							id="profession" name="profession" size="50" maxlength="50"
							onblur="checkComWebSite();" placeholder="" type="text"
							value="" onblur="trim(this);"/></li>
						
						<li><span><small style="color: red">*</small>毕业生人数：</span> <input
							class="inputtxt2" id="graduate_num" name="graduate_num" size="6"
							maxlength="5" onblur="delZero(this);checkRegCapital();" onkeyup="this.value=this.value.replace(/\D/g,'')" 
							type="text"
							value="" /></li>
						<li><span><small style="color: red">*</small>毕业时间：</span> <input class="inputtxt2 date_control"
							type="text" value="" name="year"
							id="year" type="text"
							onFocus="WdatePicker({dateFmt:'yyyy',isShowWeek:true});" placeholder="毕业时间"
							title="毕业时间"></li>
					</ul>
				</div>
			</form>
			<div class="col-sm-offset-5 col-sm-2">
				<button type="button" class="btn btn-success btn-block"
					onclick="sub();" id="subm">
					<span class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp;保存
				</button>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modalhy fade" id="myIndustry" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		data-backdrop="static">
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
					<button type="button" class="btn btn-default" onclick="Clear()"
						data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<script src="<%=basePath%>shyl/js/jquery.uploadify.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>shyl/js/jquery.tips.js"></script>
	<script
		src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
	<script
		src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
	<script
		src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
	<script
		src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
	<script type="text/javascript">
	</script>
	<%@ include file="../common/footer.jsp"%>
	<p id="back-to-top" style="display: block;">
		<a href="#top"><span></span></a>
	</p>

	<div class="modal fade bs-example-modal-sm" tabindex="-1"
		id="layhomewarn" role="dialog" aria-labelledby="mySmallModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="mySmallModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<p id="warntext">
						请登录后操作！点此&nbsp;<a
							href="/account/logon?returnUrl=/mconsole/cominfo/index"
							class="button btn-succes"><b
							style="text-decoration: underline">登录</b></a>
					</p>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
</body>
</html>