<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String info_id= request.getParameter("info_id");//用request得到 
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>添加软硬件汇总_济南市服务外包公共服务平台</title>
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
<script src="<%=basePath%>shyl/js/mainjs/errImage.js"
	type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/jquery.placeholder.js"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<style type="text/css">
.textareatxt2 {
	background-color: #f7f7f7 !important;
}

.edui-default .edui-editor {
	background-color: #ecf0f9 !important;
}

div.mypage_right div.input_class ul li span {
	width: 130px !important;
}

.select_btnNew {
	display: inline-block;
	margin-bottom: 0;
	font-size: 14px;
	line-height: 42px;
	color: #333;
	text-align: center;
	text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
	vertical-align: middle;
	cursor: pointer;
	background-color: #f5f5f5;
	background-repeat: repeat-x;
	border: 1px solid #ccc;
	border-color: #e6e6e6 #e6e6e6 #bfbfbf;
	border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
	border-bottom-color: #b3b3b3;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff',
		endColorstr='#ffe6e6e6', GradientType=0);
	filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
	-webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	-moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
		rgba(0, 0, 0, 0.05);
}

.btnNew {
	float: left;
	margin-top: 5px;
	width: 275px;
}
</style>
<script type="text/javascript">
function abstractInfo() {
	var abstract_info = $("#abstract_info").val();
	if (abstract_info<7) {
		$("#abstract_info").tips({
			side : 1,
			msg : '最少输入7个字符！',
			bg : '#AE81FF',
			time : 3
		});
		return true;
	}
}
function profross() {
	var remarks = $("#remarks").val();
	if (remarks=="") {
		$("#remarks").tips({
			side : 1,
			msg : '最少输入七个字符！',
			bg : '#AE81FF',
			time : 3
		});
		return true;
	}
}
function softTime(){
	var softTime = $("#soft_time").val();
	if (softTime=="") {
		$("#soft_time").tips({
			side : 1,
			msg : '日期不能为空！',
			bg : '#AE81FF',
			time : 3
		});
		return true;
	}	
}
function voucher(){
	var voucher = $("#voucher").val();
	if (voucher=="") {
		$("#voucher").tips({
			side : 1,
			msg : '凭证号数不能为空！',
			bg : '#AE81FF',
			time : 3
		});
		return true;
	}	
}
function abstractInfo(){
	var abstractInfo = $("#abstract_info").val();
	if (abstractInfo.length<7) {
		$("#abstract_info").tips({
			side : 1,
			msg : '最少输入七个字符！',
			bg : '#AE81FF',
			time : 3
		});
		return true;
	}	
}
function rmb(){
	var rmb = $("#rmb").val();
	if (rmb.length=="") {
		$("#rmb").tips({
			side : 1,
			msg : '人民币不能为空！',
			bg : '#AE81FF',
			time : 3
		});
		return true;
	}	
}
    //提交表单
	function sub() {
    	if(softTime()){
    		$("#soft_time").focus();
    		return false;
    	}
    	if(voucher()){
    		$("#voucher").focus();
    		return false;
    	}
		if(abstractInfo()){
			$("#abstract_info").focus();
			return false;
		}
		if(rmb()){
			$("#rmb").focus();
			return false;
		}
	
		$("#form1").submit();
	}
	  function GO() {
		  var info_id=$("#info_id").val();
	        location.href = '<%=basePath%>org/softta.act?info_id='+info_id;
		}
</script>
</head>
<body id="top" style="background-color: #f7f7f7;">
	<jsp:include page="../../common/header.jsp"></jsp:include>
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>

		<jsp:include page="../../common/left.jsp"><jsp:param value="2" name="menuType"/></jsp:include>

		<div class="mypage_right">
			<h2>添加软硬件汇总</h2>
			<form action="<%=basePath%>org/creatSoft.act"
				class="form-horizontal" id="form1" method="post">
				<!-- start -->
				<input type="hidden" value="<%=info_id %>" id="info_id" name="info_id">
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
					<ul style="margin-bottom: 20px;">
					<li style="width: 800px;">
					 	<span><small style="color: red">*</small>日期：</span>
						<input type="text" class="inputtxt2" style="width: 600px;" onFocus="WdatePicker({isShowWeek:true});" id="soft_time" name="soft_time" placeholder="日期">
					</li>
					<li style="width: 800px;">
					 	<span><small style="color: red">*</small>凭证号数：</span>
						<input type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="5" class="inputtxt2" style="width: 600px;" id="voucher" name="voucher" placeholder="凭证号数">
					</li>
					<li style="width: 800px;">
					 	<span><small style="color: red">*</small>摘要：</span>
						<input type="text" maxlength="50" class="inputtxt2" style="width: 600px;" onblur="trim(this);" id="abstract_info" name="abstract_info" placeholder="摘要">
					</li>
					<li style="width: 800px;">
					 	<span><small style="color: red">*</small>人民币：</span>
						<input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" onblur="changeFloat(this);" maxlength="10" class="inputtxt2" style="width: 600px;" id="rmb" name="rmb" placeholder="人民币" onblur="changeFloat(this);" style="ime-mode:disabled" value="0.00">
					</li>
					<li style="width: 800px;">
					 	<span>备注：</span>
						<input type="text" maxlength="50" class="inputtxt2" onblur="trim(this);" style="width: 600px;" id="remarks" name="remarks" placeholder="备注">
					</li>
					<li style="width: 800px;">
					 	<span><small style="color: red">*</small>类别：</span> <select
							class="inputtxt2" id="SoftType" name="SoftType"
							onclick="GetCity()" onchange="checkProvinceId();">
								<c:forEach items="${SoftType}" var="role">
									<option value="${role.DISTINGUISH_ID}"
										<c:if test="${role.DISTINGUISH_ID == pd.batch}">selected</c:if>>${role.VALUE}</option>
								</c:forEach>
						</select>
						</li>
				</ul>
				</div>
			</form>
			<div class="form-group">
									<div class="col-sm-2 col-sm-offset-2" style="margin-top: 40px;">
										<button type="button" onclick="sub();" class="btn btn-success btn-block">
											<span class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp;添加
										</button>
									</div>
									<div style="width: 20px;"></div>
									<div class="col-sm-2" style="margin-top: 40px; margin-left: 20px;">
										<a onclick="GO();" class="btn btn-default btn-block"><span class="glyphicon glyphicon-circle-arrow-left"></span>&nbsp;&nbsp;返回</a>
									</div>
								</div>
		</div>
	</div>

	<!-- Modal -->
	
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
	<%@ include file="../../common/footer.jsp"%>
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