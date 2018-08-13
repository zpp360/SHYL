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
<title>院校信息_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/uploadify.css">
<script src="<%=basePath%>shyl/js/jquery-1.7.2.js"></script>
<script src="<%=basePath%>shyl/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>shyl/js/jquery.min.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.min.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
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
</head>
<body id="top" style="background-color: #f7f7f7;">
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../common/left.jsp"><jsp:param value="15" name="menuType"/></jsp:include>

		<div class="mypage_right">
			<h2>院校信息</h2>
			<!-- start -->
			<input type="hidden" id="institutionId" name="institutionId"
				value="${pd.USER_ID}">
			<input type="hidden" id="imglogo" name="imglogo" value="${pd.school_log}">
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
				<li><span><small style="color: red">*</small>院校名称：</span> <input class="inputtxt2"
						id="school_name" name="school_name" size="50" maxlength="25"
						 placeholder="" type="text" onblur="trim(this);checkSchoolName();"
						value="${pd.school_name}" /></li>
					<li><span><small style="color: red">*</small>院校组织代码：</span> <input class="inputtxt2"
						id="organize_code" name="organize_code" size="50" maxlength="50"
						onblur="trim(this);checkOrganizeCode();" placeholder="" type="text"
						value="${pd.organize_code}"/></li>
						<li><span><small style="color: red">*</small>英文名称：</span> <input class="inputtxt2"
						id="school_nameen" name="school_nameen" size="50" maxlength="50"
						onblur="trim(this);checkSchoolNameEn();"  onKeyUp="value=value.replace(/[^a-zA-Z]/g,' ')" placeholder="" type="text"
						value="${pd.school_nameen}" /></li>
					<li><span><small style="color: red">*</small>创建时间：</span> <input class="inputtxt2 date_control"
						type="text" value="${pd.creation_time}" name="creation_time"
						id="creation_time" type="text"
						onFocus="WdatePicker({isShowWeek:true});" placeholder="开始日期"
						title="开始日期"></li>
					<li><span>重点学科数：</span> <input class="inputtxt2"
						id="key_subjects" name="key_subjects" size="50" maxlength="5"
						placeholder="" type="text" onkeyup="this.value=this.value.replace(/\D/g,'')"
						value="${pd.key_subjects}" onblur="delZero(this);"/></li>
					<li><span><small style="color: red">*</small>隶属于：</span> <select
						class="inputtxt2" id="belonging" name="belonging"
						 onchange="checkBelonging();">
							<c:forEach items="${membershipTypeList}" var="var">
								<option value="${var.DISTINGUISH_ID}"
									<c:if test="${var.DISTINGUISH_ID == pd.belonging}">selected</c:if>>${var.VALUE}</option>
							</c:forEach>
					</select></li>
					<li><span><small style="color: red">*</small>学校类型：</span> <select
						class="inputtxt2" id="school_type" name="school_type">
							<c:forEach items="${schoolTypeList}" var="var">
								<option value="${var.DISTINGUISH_ID}"
									<c:if test="${var.DISTINGUISH_ID == pd.school_type}">selected</c:if>>${var.VALUE}</option>
							</c:forEach>
					</select></li>
					<li><span>学生人数：</span> <input class="inputtxt2"
						id="student_num" name="student_num" size="50" maxlength="5"
					 	placeholder="" type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" 
						value="${pd.student_num}" onblur="delZero(this);"/></li>
					<li><span>博士点个数：</span> <input class="inputtxt2"
						id="doctor_num" name="doctor_num" size="50" maxlength="5"
						placeholder="" type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" 
						value="${pd.doctor_num}" onblur="delZero(this);"/></li>
					<li><span>硕士点个数：</span> <input class="inputtxt2"
						id="master_num" name="master_num" size="50" maxlength="5"
					 	placeholder="" type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" 
						value="${pd.master_num}" onblur="delZero(this);"/></li>
					<li><span>院士人数：</span> <input class="inputtxt2"
						id="academician_num" name="academician_num" size="50" maxlength="5"
						 placeholder="" type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" 
						value="${pd.academician_num}" onblur="delZero(this);"/></li>
					<li><span><small style="color: red">*</small>联系人电话：</span> <input class="inputtxt2"
						data-val="true" data-val-required="*" id="contact_tel" name="contact_tel"
						maxlength="20" onblur="trim(this);checkPhone();" type="text" 
						value="${pd.contact_tel}" /> <span
						class="field-validation-valid" data-valmsg-for="Phone"
						data-valmsg-replace="true"></span></li>
					<li><span><small style="color: red">*</small>院校地址：</span> <select
						class="inputtxt2" id="ProvinceId" name="ProvinceId" onblur="checkprovince();"
						 onchange="checkProvinceId();"><option
								value="">--选择省--</option>
							<c:forEach items="${provincesList}" var="provinces">
								<option value="${provinces.REGION_ID}"
									<c:if test="${provinces.REGION_ID == pd.address_province }">selected</c:if>>${provinces.REGION_NAME}</option>
							</c:forEach>
					</select></li>
					<li style="position: relative;right:94px;"><span>&nbsp;</span> <select id="CityId" name="CityId"
						class="inputtxt2" onchange="checkCityId();" onblur="checkcity();">
							<c:forEach items="${cityList}" var="cityList">
								<option value="${cityList.REGION_ID}"
									<c:if test="${cityList.REGION_ID == pd.address_city }">selected</c:if>>${cityList.REGION_NAME}</option>
							</c:forEach>
					</select></li>
					<li><span><small style="color: red">*</small>详细地址：</span> <input class="inputtxt2" id="address_detail"
						name="address_detail" maxlength="100" onblur="trim(this);checkAddressDetail();"
						type="text" value="${pd.address_detail}" /></li>
					<li id="areali"><span><small style="color: red">*</small>审核机关：</span> <select
						class="inputtxt2" id="areaId" name="areaId" onchange="checkAreaId();"><option
								value="">--商务局--</option>
							<c:forEach items="${areaList}" var="arealist">
							    <option value="${arealist.REGION_ID}" <c:if test="${arealist.REGION_ID == pd.address_area}">selected</c:if>>${arealist.REGION_NAME}商务局</option>
							</c:forEach>
					</select></li>
					<li><span><small style="color: red">*</small>批次：</span> <select
						class="inputtxt2" id="batch" name="batch">
							<c:forEach items="${batch}" var="batch">
								<option value="${batch.DISTINGUISH_ID}"
									<c:if test="${batch.DISTINGUISH_ID == pd.batch}">selected</c:if>>${batch.VALUE}</option>
							</c:forEach>
					</select></li>
					<li><span>官方网站：</span> <input
						class="inputtxt2" id="website" name="website" size="6"
						maxlength="50" onblur="trim(this);checkComWebSite();"
						type="text" value="${pd.website}"/></li>
					<li><span><small style="color: red">*</small>邮箱：</span> <input class="inputtxt2"
						onblur="trim(this);checkEmail();" id="Email" name="Email" type="text"
						value="${pd.mail}" maxlength="50" /> <span class="field-validation-valid"
						data-valmsg-for="Email" data-valmsg-replace="true"></span></li>
				</ul>
				<ul>
					<li><span><small style="color: red">*</small>联系人：</span> <input class="inputtxt2"
						data-val="true" data-val-required="*" id="Contact" name="Contact"
						onblur="trim(this);checkContact();" size="50" maxlength="50" type="text" value="${pd.contact}" /> <span
						class="field-validation-valid" data-valmsg-for="Contact"
						data-valmsg-replace="true"></span></li>
					<li><span><small style="color: red">*</small>是否公开：</span> <label style="background-color: #ecf0f9;"><input type="radio"
						id="yes_or_no" name="yes_or_no" 
						<c:if test="${pd.yes_or_no == 1 }">checked="checked"</c:if> checked="checked"
						value="1"> 是</label><label style="background-color: #ecf0f9;">
						<input type="radio" id="yes_or_no"
						<c:if test="${pd.yes_or_no == 0 }">checked="checked"</c:if> 
						name="yes_or_no" value="0" >否</label></span></li>	
				</ul>
				<ul>
					<li style="height: 120px; width: 100%;"><span><small style="color: red">*</small>院校Logo：</span>
						<p class="pull-left">
							<img
								onerror="showImgDelay(this,'<%=basePath%>shyl/images/mylogo.jpg');"
								src="<%=basePath%>images/${pd.school_log}" class="upimg" id="imgP"
								name="imgP"
								style="width: 150px; padding: 3px; border: solid 1px #ccc; background: #fff;" />
						</p> <input id="pictureUrl" name="pictureUrl" type="hidden"
						value="${pd.school_log}" />
						<div class="pull-left" style="padding-left: 15px;">
							<br> <span class="fileinput-button" style="width: 131px;">
								<span
								style="text-align: left; width: 131px; background-color: #4f70c0; color: #FFFFFF; border-radius: 5px; line-height: 42px; text-align: center; font-size: 15px;">上传本地图片</span>
								<input style="width: auto;" type="file" id="file_upload"
								name="file_upload" title="点击这里上传图片">
							</span><br>
							<i>支持的图片格式为(*.jpg;*.png;*.jpeg;*.gif)</i>
						</div></li>
					<li style="height: 120px; width: 100%;"><span><small style="color: red">*</small>代表建筑：</span>
						<p class="pull-left">
							<img
								onerror="showImgDelay(this,'<%=basePath%>shyl/images/mylogo.jpg');"
								src="<%=basePath%>images/${pd.representative_building}" class="upimg" id="imgS"
								name="imgS"
								style="width: 150px; padding: 3px; border: solid 1px #ccc; background: #fff;" />
						</p> <input id="representative_building" name="representative_building" type="hidden"
						value="${pd.representative_building}" />
						<div class="pull-left" style="padding-left: 15px;">
							<br> <span class="fileinput-button" style="width: 131px;">
								<span
								style="text-align: left; width: 131px; background-color: #4f70c0; color: #FFFFFF; border-radius: 5px; line-height: 42px; text-align: center; font-size: 15px;">上传本地图片</span>
								<input style="width: auto;" type="file" id="file_uploadS"
								name="file_uploadS" title="点击这里上传图片">
							</span><br>
							<i>支持的图片格式为(*.jpg;*.png;*.jpeg;*.gif)</i>
						</div></li>
					<li style="height: 150px; width: 100%;"><span><small style="color: red">*</small>院校介绍：</span>
					<textarea style="width:700px;padding-left:5px;background-color:#ecf0f9;border:0;border-radius:5px;font-size:0.85em;resize:none!important;"
					rows="4" maxlength="65535" id="Introduction" name="Introduction">${pd.school_detail}</textarea>
					</li>
				</ul>
				<ul>
					<li style="height: 80px; width: 100%;"><span>院校图片展示：</span>
						<div class="form-group">
							<div class="col-sm-9">
								<span class="fileinput-button"> <span
									style="text-align: left; width: 140px; background-color: #4f70c0; color: #FFFFFF; border-radius: 5px; line-height: 42px; text-align: center; font-size: 15px;">上传院校风采图片</span>
									<input type="file" id="file_uploadC" name="file_uploadC"
									title="点击这里上传图片" multiple></span><br>
								<i>支持的图片格式为(*.jpg;*.png;*.jpeg;*.gif)</i>
							</div>
						</div></li>
				</ul>
				<ul>
					<li style="width: 100%; height: 50%; text-align: center">
						<div id="pictures">
							<c:forEach items="${comPictUploadList}" var="var">
								<img
									onerror="showImgDelay(this,'<%=basePath%>shyl/images/mylogo.jpg');"
									src="<%=basePath%>images/${var.path}"
									onclick="showOriginalPhoto('imgC${var.id}')"
									id="imgC${var.id}" name="imgC"
									style="width: 100px; padding: 1px; border: solid 1px #ccc; background: #fff;" />
								<a onclick="deleteLocalPicture('${var.id}')" class="delete">删除</a>
							</c:forEach>
						</div>
					</li>
				</ul>
				<input id="compictureUrl" name="compictureUrl" type="hidden"
					value='${json}' />
			</div>
			<div class="col-sm-offset-5 col-sm-2">
				<button type="button" class="btn btn-success btn-block"
					onclick="sub();" id="subm">
					<span class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp;保存
				</button>
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
		<script
		src="<%=basePath%>shyl/js/school/schoolctro.js"></script>
	<!-- 院校简介图片 -->
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
		<script type="text/javascript">
		$(document).ready(function(){
			var imglogo=$("#imglogo").val();
			if(imglogo==""){
				var schoollogo=$("#imgP").attr("src");
				/* $("#mypage_image img").attr("src",schoollogo); */
			}else{
				$("#mypage_image img").attr("src","<%=basePath%>images/"+imglogo);}
			});
		
		</script>
		<!-- /.modal-dialog -->
	</div>
</body>
</html>