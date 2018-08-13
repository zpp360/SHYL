<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>申请单位基本情况表_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<jsp:include page="../../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/work.css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/uploadify.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/maincss/showLoading.css"> 
<script type="text/javascript" src="<%=basePath%>/shyl/js/mainjs/jquery.placeholder.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<style>
.table {
	border: 0px solid;
	border-color: #ddd;
	margin-bottom: 10px !important;
}

.tdtxt{
	border: 1px solid;
	border-color: #ddd;
	border-collapse: collapse;
	text-align: left; 
	vertical-align: middle !important;
}
.tdtxtcenter{
	border: 1px solid;
	border-color: #ddd;
	border-collapse: collapse;
	text-align: center; 
	vertical-align: middle !important;
}
.moneytypetxt {
  padding-left: 10px; 
  background-color: #ecf0f9;
  height: 42px;
  border: 0;
  font-size: 0.85em;
}
.table td label{
	font-size: 0.85em;
}
label{
font-size: 0.85em;
}

.inputtxt2 {
    width: 95%  !important;
 }
 .inputtxt3 {
    width: 45%  !important;
    font-size: 0.8em;
 }
     width: 50% !important;
.cheackboxError{
   outline: 1px solid red;
}

.inputError{
	border: 1px solid #f00 !important;
}

.vertical {
	width: 20px;
	font-size: 12px;
	word-wrap: break-word;
	letter-spacing: 20px;
}
.width70{
 width: 70%  !important;
}

.font-size85{
    color: #b6b6b6;
    font-size: 0.85em;
}
* {
    box-sizing: content-box;
}
.progress {
    padding: 1px;
    width: 220px;
    height: 11px;
    overflow: hidden;
    border: 1px solid #428bca;
    -webkit-border-radius: 6px;
    border-radius: 6px;
    display:none;
    float:left;
}
.bar {
    height: 11px;
    border-radius: 6px;
    -webkit-border-radius: 6px;
    background: #428bca;
    color: #ffffff;
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 12px;
    padding: 0px;
    line-height: 11px;
    text-align: center;
}
.bar-error{
  width:100%;
  background:#f44336;
}
</style>

</head>		
<body id="top" style="background-color: #f7f7f7;">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param value="2" name="menuType"/></jsp:include>				
				<!--  我的简历管理部分页面-->
		<div class="mypage_right">
					<h2 class="h2_font13">
					<img id="catalogTree" src="<%=basePath%>/shyl/images/catalog.png" style="margin-bottom: 5px;"/>申请单位基本情况表
					</h2>
					<div class="input_class" style="margin-bottom: 100px;">
						<form action="" class="form-inline"
							method="post" id="form1" >
							<input type="hidden" name="info_id" value="${pd.info_id}"/>
							<input type="hidden" name="id" value="${pd.id}">
							<input type="hidden" id="declarationYear" name="declarationYear" value="${pd.declaration_year}">
							<input type="hidden" name="toPage" value="${pageMap.toPage}">
							<table id="appTable"  border="1" bordercolor="black"
								cellspacing="1" class="table">
								<tr>
									<td class="tdtxtcenter"><label class="control-label"><span
										style="color: #FF0000">*</span>单位名称</label></td>
									<td class="tdtxt" colspan="3"><input class="inputtxt2" maxlength="50"
										id="company_name" name="company_name" placeholder=""
										type="text" value="${pd.company_name}" onblur="trim(this);"></td>
								</tr>
								<tr>
									<td class="tdtxtcenter"><label class="control-label"><span
										style="color: #FF0000">*</span>单位地址</label></td>
									<td class="tdtxt" ><input class="inputtxt2" maxlength="50"
										id="company_address" name="company_address" placeholder="" type="text" value="${pd.company_address}" onblur="trim(this);"></td>
									<td class="tdtxtcenter"><label class="control-label"><span
										style="color: #FF0000">*</span>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;编</label></td>
									<td class="tdtxt"><input class="inputtxt2"  maxlength="6"
										 id="zip_code" name="zip_code"
										placeholder="" type="text" value="${pd.zip_code}" onblur="trim(this);"></td>
								</tr>
								<tr>
									<td class="tdtxtcenter"><label class="control-label"><span
										style="color: #FF0000">*</span>单位代码</label></td>
									<td class="tdtxt"><input class="inputtxt2" maxlength="18"
										id="company_code" name="company_code" placeholder="" type="text" value="${pd.company_code}" onblur="trim(this);"></td>
									<td class="tdtxtcenter"><label class="control-label"><span
										style="color: #FF0000">*</span>单位性质</label></td>
									<td class="tdtxt"><select class="inputtxt2" id="company_nature"
								name="company_nature" style="height: 25px">
									<option value="">--请选择单位性质--</option>
									<c:forEach items="${compTypeList}" var="compType">
										<option value="${compType.DISTINGUISH_ID}"
											<c:if test="${compType.DISTINGUISH_ID == pd.company_nature}">selected</c:if>>${compType.VALUE}</option>
									</c:forEach>
							        </select></td>
								</tr>
								<tr>
									<td class="tdtxtcenter" width="18%"><label class="control-label"><span
										style="color: #FF0000">*</span>法人代表</label></td>
									<td class="tdtxt" width="15%"><input class="inputtxt2" maxlength="50"
										id="company_representative" name="company_representative" placeholder="" type="text" value="${pd.company_representative}" onblur="trim(this);"></td>
									<td class="tdtxtcenter" width="15%"><label class="control-label"><span
										style="color: #FF0000">*</span>注册地</label></td>
									<td class="tdtxt" width="15%">
										<select class="inputtxt3" id="ProvinceId" name="address_province" onclick="GetCity()" onchange="checkProvinceId();">
				                    	<option value="">省</option>
										<c:forEach items="${provincesList}" var="provinces">
											<option value="${provinces.REGION_ID}" <c:if test="${provinces.REGION_ID == pd.address_province }">selected</c:if>>${provinces.REGION_NAME}</option>
										</c:forEach>
									    </select>
										<select id="CityId" name="address_city" class="inputtxt3" onchange="checkCityId();">
										<option value="">市</option>
					                            <c:forEach items="${cityList}" var="cityList">
												<option value="${cityList.REGION_ID}" <c:if test="${cityList.REGION_ID == pd.address_city }">selected</c:if>>${cityList.REGION_NAME}</option>
												</c:forEach>
					                    </select>
									
									</td>
								</tr>	
							   <tr>
									<td class="tdtxtcenter" width="18%"><label class="control-label"><span
										style="color: #FF0000">*</span>联&nbsp;&nbsp;系&nbsp;&nbsp;人</label></td>
									<td class="tdtxt" width="18%"><input class="inputtxt2"  maxlength="50"
										 id="contact" name="contact"
										placeholder="" type="text" value="${pd.contact}" onblur="trim(this);"></td>
										<td class="tdtxtcenter"><label class="control-label"><span
										style="color: #FF0000">*</span>电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话</label></td>
									<td class="tdtxt"><input class="inputtxt2" maxlength="13"
										id="contact_tel" name="contact_tel" placeholder="固定电话 或手机号" type="text" onblur="trim(this);" value="${pd.contact_tel}"></td>
								</tr>
								<tr>
									
									<td class="tdtxtcenter"><label class="control-label"><span
										style="color: #FF0000">*</span>传&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;真</label></td>
									<td class="tdtxt"><input class="inputtxt2"  maxlength="13"
										 id="fax" name="fax"
										placeholder="区号-传真号码" type="text" value="${pd.fax}" onblur="trim(this);"></td>
									<td class="tdtxtcenter"><label class="control-label"><span
										style="color: #FF0000">*</span>E-mail</label></td>
									<td class="tdtxt"><input class="inputtxt2"  maxlength="50"
										 id="E_mail" name="E_mail"
										placeholder="" type="text" value="${pd.E_mail}" onblur="trim(this);"></td>
								</tr>
								<tr>
									<td class="tdtxtcenter" ><label class="control-label"><span
										style="color: #FF0000">*</span>银行账户名称</label></td>
									<td class="tdtxt" ><input class="inputtxt2" maxlength="50"
										id="bank_name" name="bank_name" placeholder=""
										type="text" value="${pd.bank_name}" onblur="trim(this);"></td>
										<td class="tdtxtcenter" ><label class="control-label"><span
										style="color: #FF0000">*</span>开户银行</label></td>
									<td class="tdtxt" ><input class="inputtxt2" maxlength="50"
										id="bank" name="bank" placeholder=""
										type="text" value="${pd.bank}" onblur="trim(this);"></td>
								</tr>
								<tr>
									<td class="tdtxtcenter" ><label class="control-label"><span
										style="color: #FF0000">*</span>开户银行帐号</label></td>
									<td class="tdtxt" ><input class="inputtxt2" maxlength="25"
										id="bank_account" name="bank_account" placeholder=""
										type="text" value="${pd.bank_account}" onkeyup="value=value.replace(/[^0-9]/g,'')" style="ime-mode:disabled" onblur="delZero(this);"></td>
										<td class="tdtxtcenter"><label class="control-label"><span
										style="color: #FF0000">*</span>开户行地址</label></td>
									<td class="tdtxt" >
										<input class="inputtxt2" maxlength="50"
										id="bank_address" name="bank_address" placeholder=""
										type="text" value="${pd.bank_address}" onblur="trim(this);">
										</td>
								</tr>
								<tr>
									<td class="tdtxtcenter" colspan="1"><label class="control-label"><span
										style="color: #FF0000">*</span>大额支付系统行号</label></td>
									<td class="tdtxt" colspan="3"><input class="inputtxt2" maxlength="12"
										id="large_number" name="large_number" placeholder="请和公司财务联络"
										type="text" value="${pd.large_number}" onkeyup="value=value.replace(/[^0-9]/g,'')" style="ime-mode:disabled" onblur="delZero(this);"></td>
								</tr>
								<tr>
									
									
									<c:if test="${pd.apply_money_type}"> checked='checked'</c:if>
									<td class="tdtxtcenter" colspan="1"><label class="control-label"><span
										style="color: #FF0000">*</span>申请资金类型</label></td>
									<td colspan="3" style="border: #ddd 1px solid;">
										<input id="apply_money_type" name="apply_money_type" type="hidden"value="" />
										<input id="apply_project" name="apply_project" type="hidden"value="" />
										<table class="table">
											<tbody>
												<!-- 开始循环 -->
												<c:choose>
													<c:when test="${not empty Moneytypelist}">
															<c:forEach items="${Moneytypelist}" var="money" varStatus="vs">
																<tr>
																	<td style="text-align: left;width:490px;" class="moneytypetxt">${money.value}</td>
																	<td style="text-align: center;width:50px;" class="moneytypetxt">
																	    <c:choose>
																	     <c:when test="${supportPd.declaration_type==2 && money.distinguish_id!='9'}">
																		<input type='checkbox' name='ids' id='ids' value="${money.distinguish_id}" disabled="disabled"/>
																		</c:when>
																		<c:when test="${supportPd.declaration_type==1 && money.distinguish_id=='9'}">
																		<input type='checkbox' name='ids' id='ids' value="${money.distinguish_id}" disabled="disabled"/>
																		</c:when>
																		<c:otherwise>
																		<input type='checkbox' name='ids' id='ids' value="${money.distinguish_id}"/>
																        </c:otherwise>
																		</c:choose>
																	</td>
																</tr>
															</c:forEach>
													</c:when>
													<c:otherwise>
														<tr class="main_info">
															<td colspan="100" class="center">没有相关数据</td>
														</tr>
													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
									</td>
									
								</tr>
								<tr><td colspan="4" style="text-align: center;border: #ddd 1px solid;">
									<span style="color: #FF0000">*</span>申&nbsp;&nbsp;请&nbsp;&nbsp;报&nbsp;&nbsp;告</td></tr>
								<tr style="height: 150px;">
							<td colspan="4" style="border: #ddd 1px solid;">
							<c:choose>
							<c:when test="${reportPd.filename==null or reportPd.filename==''}">
							<p style="font-size: 0.85em;margin-left:15px;margin-top:15px" id="fileName"></p>
							</c:when>
							<c:otherwise>
							<p style="font-size: 0.85em;margin-left:15px;margin-top:15px" id="fileName">详见《${reportPd.filename}》</p>
							</c:otherwise>
							</c:choose>
								<div style="margin-top: 30px; margin-left: 20px;height:50px">
									<span id="pdfShowName">${reportPd.filename}</span> <span
										<c:if test="${empty reportPd.filepath}"> style="display: none;"</c:if>
										id="xg"><a id="pdfView"
										 href='javascript:void(0);' target='_blank' onclick="return viewPdf('${reportPd.filepath}');"
										class='zview'>预览</a></span> <span
										<c:if test="${empty reportPd.filepath}"> style="display: none;"</c:if>
										id="sc"><a id="pdfDelete" onclick="delFile();"
										class="delete" style="cursor: pointer;">删除 </a></span>
										<c:choose>
										  <c:when test="${empty reportPd.filepath}">
										      <input type="hidden" name="pdfFlag" id="pdfFlag" value="0" />
										  </c:when>
										  <c:otherwise>
										      <input type="hidden" name="pdfFlag" id="pdfFlag" value="1" />
										  </c:otherwise>
										</c:choose>
								</div>
								<div style="text-align: right; padding-right: 200px;">
									<a data-toggle="modal" 
									data-target="#sEdu" class="btn btn-link hover"><span
										class="btn btn-primary1 fileinput-button"> <span id="fileUpload">上传申请报告</span>
									</span> </a>
									<input type="hidden"  id="filename" name="filename" value="${reportPd.filename}">
									<input type="hidden"  id="filepath" name="filepath" value="${reportPd.filepath}">
								</div>
								</td>
						</tr>
						<tr style="height: 150px;">
							<td colspan="6" style="border: #ddd 1px solid;"><label
								class="control-label">企业（单位）声明：</br>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本人谨代表申请单位作出声明，完全明白国家促进服务贸易创新发展扶持资金有关规定及本申请书表格内的所有内容。本人确认：本单
									位所填报的各项申请材料，均真实、有效。本人也知道如误报或瞒报材料，以欺诈手段取得专项资金，均属违规行
									为，将承担相应责任。</br>
								</br>
								</br>
								</br>
							</label> <label class="control-label" style="float: right;">法定代表人（单位负责人）签字及申请企业（单位）印章</label>
							</td>
						</tr>
							</table>
							<label class="control-label">备注：1、银行账户信息必须为公司账户，用于拨付资金，务必正确填写。2、申请报告请按照申报材料相关要求说明申请事项等，可另加附页。</label>
						</form>
						<div class="form-group">
						<div class="col-sm-2 col-sm-offset-2" style="margin-top: 40px;">
							<button type="button" onclick="OK();"
								class="btn btn-success btn-block">
								<span class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp;${pageMap.toText}
							</button>
						</div>
						<c:if test="${not empty pageMap.fromPage}">
							<div class="col-sm-2" style="margin-top: 40px;">
								<a href="<%=basePath%>${pageMap.fromPage}?&info_id=${pd.info_id}" class="btn btn-default btn-block"><span
									class="glyphicon glyphicon-circle-arrow-left"></span>&nbsp;&nbsp;上一步</a>
							</div>
						</c:if>
						
					</div>
					</div>
				</div>

			</div>
			<div class="modal fade in" id="sEdu" role="dialog"
				style="margin-top: 0%;" 
						aria-labelledby="sEdu"
				aria-hidden="false" data-backdrop="static">
				<div class="modal-dialog modal-lg" style="top: 145px; left: -15px;">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">添加申请报告 <span style="font-size: 12px; color: red; padding-left: 10px; display: inline-block; height: 20px; vertical-align: bottom;"><label>※.doc和.docx格式文件上传相对较慢， &nbsp;请耐心等待</label></span></h4>
						</div>
						<div class="modal-body">
							<table>
								<tbody>
									<tr>
										<td style="padding-left: 50px; width: 20%;"><span
											style="color: #FF0000">*</span>申请报告名称：</td>
										<td style="width: 60%;"><input id="uploadFileId"
											class="form-control" data-val="true" value="${reportPd.filename}"
											readonly></td>
										<td style="width: 10%;"><span id="file_upload"
											class="btn btn-primary fileinput-button" style="float: right">
												<span>上传</span> <input type="file" id="file_upload"
												name="file_upload" multiple> <input type="hidden"
												id="file_path" name="file_path" value="${reportPd.filepath}">
										</span></td>
									</tr>
								</tbody>
							</table>
							<div id="progress" class="progress" style=" margin-left: 184px; margin-top: 10px;">
									<div class="bar" style="width: 0%;"></div>
								</div>
							<div 
								style="margin-top: 5px; margin-left: 420px">支持的文件格式为.doc,.docx或者.pdf</div>
							</div>
							
						<div class="modal-footer">
							<button id="EduButtonedu" type="button" class="btn btn-success"
								onclick="updateFile()" data-dismiss="">确认</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
						</div>
					</div>
				</div>
				<input type="reset" style="display: none;" name="reportedu">
			</div>
			<div class='modal my-modal-alert' id='my-modal-success-alert'>
				<div class='modal-dialog boxBodySmall'>
					<div class='modal-content'
						style="width: 200px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
						<div class='modal-body' id='modal-body-alert'>
							<img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;上传成功!
						</div>
					</div>
				</div>
			</div>

			<div class='modal my-modal-alert' id='my-modal-failure-alert'>
				<div class='modal-dialog boxBodySmall'>
					<div class='modal-content'
						style="width: 200px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
						<div class='modal-body' id='modal-body-alert'>
							<img alt="" src="<%=basePath%>shyl/images/fail.png">&nbsp;&nbsp;上传失败，请重新上传!
						</div>
					</div>
				</div>
			</div>
			<div class='modal my-modal-alert' id='my-modal-view-alert'>
				<div class='modal-dialog boxBodySmall'>
					<div class='modal-content'
						style="width: 200px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
						<div class='modal-body' id='modal-body-alert'>
							<img alt="" src="<%=basePath%>shyl/images/mark.png">&nbsp;&nbsp;请先上传文件，再预览。
						</div>
					</div>
				</div>
			</div>
			<div class='modal my-modal-alert' id='my-modal-errorfile-alert'>
				<div class='modal-dialog boxBodySmall'>
					<div class='modal-content'
						style="width: 260px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
						<div class='modal-body' id='modal-body-alert'>
							<img alt="" src="<%=basePath%>shyl/images/mark.png">&nbsp;&nbsp;预览文件不存在!
						</div>
					</div>
				</div>
			</div>
	<%@ include file="../../common/footer.jsp"%>
	<p id="back-to-top" style="display: block;">
		<a href="#top"><span></span></a>
	</p>
	<script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
	<script src="<%=basePath%>shyl/js/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.showLoading.min.js"></script>
	<script type="text/javascript">
   function localcheck(){
    	var Filter = /^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
    	var phoneFilter =  /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
    	var zip = /^[0-9]{6}$/;
    	var EmailFilter = /^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT)$/;
    	var largeumberFilter = /^\d{12}$/;
    	var companyCodeFilter = /^[0-9A-Z]{18}$/;
    	var codeFilter=/[0-9]{8}-[a-zA-Z0-9]/;
    	
    	var companyName = $("#company_name").val();
		if($.trim(companyName) == ""){
			$("#company_name").tips({
				side : 2,
				msg : "请输入单位名称",
				bg : '#AE81FF',
				time : 3
			});
			$("#company_name").focus();
			return false;
		}
		var companyAddress = $("#company_address").val();
		if($.trim(companyAddress) == ""){
			$("#company_address").tips({
				side : 2,
				msg : "请输入单位地址",
				bg : '#AE81FF',
				time : 3
			});
			$("#company_address").focus();
			return false;
		} 
		var zipCode =$("#zip_code").val();
		if(zipCode == ""){
			$("#zip_code").tips({
				side : 2,
				msg : "请输入邮编",
				bg : '#AE81FF',
				time : 3
			});
			$("#zip_code").focus();
			return false;
		}else {
			if (!(zip.test(zipCode))) {
				$("#zip_code").tips({
					side : 2,
					msg : '请输入正确的邮编格式',
					bg : '#AE81FF',
					time : 3
				});
				return false;
			}
		}
		
		var Ccode = $("#company_code").val();
		if(Ccode == ""){
			$("#company_code").tips({
				side : 2,
				msg : "请输入组织代码",
				bg : '#AE81FF',
				time : 3
			});
			$("#company_code").focus();
			return false;
		}else if (Ccode.length != 10 && Ccode.length != 18) {
			$("#company_code").tips({
				side : 2,
				msg : '必须为10位组织机构代码或18位社会信用代码',
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
		else {
			if (!(companyCodeFilter.test(Ccode)) && !codeFilter.test(Ccode)) {
				$("#company_code").tips({
					side : 2,
					msg : '请输入正确的组织代码格式',
					bg : '#AE81FF',
					time : 3
				});
				return false;
			}
		}
		
		var companyNature = $("#company_nature").val();
		if($.trim(companyNature) == ""){
			$("#company_nature").tips({
				side : 2,
				msg : "请输入企业性质",
				bg : '#AE81FF',
				time : 3
			});
			$("#company_nature").focus();
			return false;
		}
		var companyRepresentative = $("#company_representative").val();
		if($.trim(companyRepresentative) == ""){
			$("#company_representative").tips({
				side : 2,
				msg : "请输入法人代表",
				bg : '#AE81FF',
				time : 3
			});
			$("#company_representative").focus();
			return false;
		}
		var ProvinceId = $("#ProvinceId").val();
		var amtCheck = /^\d*\.?\d{0,2}$/;
		if(ProvinceId == ""){
			$("#ProvinceId").tips({
    			side : 1,
    			msg : '请选择省份！',
    			bg : '#AE81FF',
    			time : 3
    		});
			$("#ProvinceId").focus();
			return false;
		
		}
		var CityId = $("#CityId").val();
		if(CityId == ""){
			$("#CityId").tips({
    			side : 1,
    			msg : '请选择城市！',
    			bg : '#AE81FF',
    			time : 3
    		});
			$("#CityId").focus();
			return false;
		
		}
		var contact = $("#contact").val();
		if($.trim(contact) == ""){
			$("#contact").tips({
				side : 2,
				msg : "请输入联系人",
				bg : '#AE81FF',
				time : 3
			});
			$("#contact").focus();
			return false;
		}
		var Tel = $("#contact_tel").val();
		if(Tel == ""){
			$("#contact_tel").tips({
				side : 2,
				msg : "请输入电话",
				bg : '#AE81FF',
				time : 3
			});
			$("#contact_tel").focus();
			return false;
		}else {
			if (!(Filter.test(Tel)) && !(phoneFilter.test(Tel))) {
				$("#contact_tel").tips({
					side : 2,
					msg : '请输入正确的电话格式',
					bg : '#AE81FF',
					time : 3
				});
				return false;
			}
		}
		
		if($("#fax").val() == ""){
			$("#fax").tips({
				side : 2,
				msg : "请输入传真",
				bg : '#AE81FF',
				time : 3
			});
			$("#fax").focus();
			return false;
		}else {
			if (!(Filter.test($("#fax").val()))) {
				$("#fax").tips({
					side : 2,
					msg : '请输入正确的传真格式',
					bg : '#AE81FF',
					time : 3
				});
				return false;
			}
		}
		
		var email=$("#E_mail").val();
		if(email == ""){
			$("#E_mail").tips({
				side : 2,
				msg : "请输入E_mail",
				bg : '#AE81FF',
				time : 3
			});
			$("#E_mail").focus();
			return false;
		}else {
			if (!(EmailFilter.test(email))) {
				$("#E_mail").tips({
					side : 2,
					msg : '请输入正确的E_mail格式',
					bg : '#AE81FF',
					time : 3
				});
				return false;
			}
		}
		var bank_name = $("#bank_name").val();
		if($.trim(bank_name) == ""){
			$("#bank_name").tips({
				side : 2,
				msg : "请输入开户银行名称",
				bg : '#AE81FF',
				time : 3
			});
			$("#bank_name").focus();
			return false;
		}
		var bank = $("#bank").val();
		if($.trim(bank) == ""){
			$("#bank").tips({
				side : 2,
				msg : "请输入开户银行",
				bg : '#AE81FF',
				time : 3
			});
			$("#bank").focus();
			return false;
		}
		if($("#bank_account").val() == ""){
			$("#bank_account").tips({
				side : 2,
				msg : "请输入开户银行帐号",
				bg : '#AE81FF',
				time : 3
			});
			$("#bank_account").focus();
			return false;
		}
		var bank_address = $("#bank_address").val();
		if($.trim(bank_address) == ""){
			$("#bank_address").tips({
				side : 2,
				msg : "请输入开户银行地址",
				bg : '#AE81FF',
				time : 3
			});
			$("#bank_address").focus();
			return false;
		}
		if($("#large_number").val() == ""){
			$("#large_number").tips({
				side : 2,
				msg : "请输入大额支付系统行号",
				bg : '#AE81FF',
				time : 3
			});
			$("#large_number").focus();
			return false;
		}else {
			if (!(largeumberFilter.test($("#large_number").val()))) {
				$("#large_number").tips({
					side : 2,
					msg : '请输入12位的大额支付系统行号',
					bg : '#AE81FF',
					time : 3
				});
				return false;
			}
		}
		
		var relateIds = "";
		var relateNames = "";
		$("input[name='ids']:checked").each(function() {
			relateIds += $(this).attr('value') + ",";
			relateNames += $(this).parent().prev().text() + ",";
		});//得到选中复选框的value
		relateIds = relateIds.substring(0, relateIds.length - 1);
		relateNames = relateNames.substring(0, relateNames.length - 1);
		if (relateIds == "") {
			$("#apply_money_type").val("");
			$("#ids").tips({
				side : 2,
				msg : "请选择内容",
				bg : '#AE81FF',
				time : 3
			});
			$("#ids").focus();
			return false;
		} else {
			$("#apply_money_type").val(relateIds);
			$("#apply_project").val(relateNames);
		}
		if ($("#pdfFlag").val() == "0") {
	         $("#fileUpload").tips({
	                side : 2,
	                msg : '请上传申请报告',
	                bg : '#AE81FF',
	                time : 2
	            });
	            return false;
		}
		return true;
	} 
  
	 // 返回

	function OK() {
		if(localcheck()){
			$("#form1").attr('action','<%=basePath%>orgApp/saveAppBasic.act');
			$("#form1").submit();
		}
	}
	
	</script>
	<script type="text/javascript">
		$(function() {
			var r = '${pd.apply_money_type}';
			var result = r.split(",");
		    for(var i=0;i<result.length;i++){
		     $("input[value='"+result[i]+"']").attr("checked","checked");
		  }

		});
	</script>
	<script type="text/javascript"
		src="<%=basePath%>shyl/js/jquery.tips.js"></script>
	<script src="<%=basePath%>shyl/js/jquery.validate.js"></script>
	<link rel="stylesheet"
		href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
	<link rel="stylesheet"
		href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
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
	function progressError(obj){
		$('#'+obj+' .bar').addClass("bar-error").text('上传失败').parent().fadeOut(3000);
	}
	function progress(obj,data){
		var progress = parseInt(data.loaded / data.total * 100, 10);
		if(progress==100){
			progress=90;
		}
		 $("#"+obj).show();
		 $('#'+obj+' .bar').removeClass("bar-error").css('width', progress + '%').text(progress==100 ?'完成':progress+'%');
	}
	$(function() {
		 $("#file_upload").fileupload({
			 dataType :'json',
			 autoUpload: true,
			 maxNumberOfFiles :1,
	         url: '<%=basePath%>orgApp/uploadContractFiles.act',
	         sequentialUploads: true
		 }).bind('fileuploadchange', function (e, data) {
			 if(data.files.length > 1){
				 alert("一次最多上传1个文档");
	             return false;
			 }
	     }).bind('fileuploadprogress', function (e, data) {
				progress('progress',data);
		}).bind('fileuploaddone', function (e, data) {
	    	 if("no"==data.result.fileExtError){
	    		 //alert("请上传格式为.doc或者docx格式的文档文件。");
	    		 $("#file_upload").tips({
	 				side : 2,
	 				msg : "请上传格式为.doc，docx或pdf格式的文档文件。",
	 				bg : '#AE81FF',
	 				time : 3
	 			});
	    		 progressError('progress');
	 			$("#file_upload").focus();
	    	 }else if("nosize"==data.result.fileExtError){
	    		 $("#file_upload").tips({
	 				side : 2,
	 				msg : "请上传小于150MB的文件。",
	 				bg : '#AE81FF',
	 				time : 3
	 			});
	    		 progressError('progress');
	 			$("#file_upload").focus();
	    	 } else {
	    		 if(data.result.filePath!=undefined && data.result.filePath!=""){
	    			 $('#progress').fadeOut(3000);  
	    			 $("#uploadFileId").val(data.result.OriginalFileName);
		    		 $("#file_path").val(data.result.filePath);
		    		 $('#progress .bar').removeClass("bar-error").css('width', '100%').text('完成');
		    		 $('#my-modal-success-alert').show().delay(1000).fadeOut ();	
	    		 }else{
	    			 progressError('progress');
	    			 $('#my-modal-failure-alert').show().delay(3000).fadeOut(); 
	    		 }  
	    	 }
	     });
});	
	</script>
	<script type="text/javascript">

	function updateFile(){
		var filepath = $("#file_path").val();
			var filename = $("#uploadFileId").val();
			// 报告验证
			if (filepath == "" && filename == "") {
				$("#file_upload").tips({
					side : 2,
					msg : '请选择申请报告',
					bg : '#AE81FF',
					time : 2
				});
				return false;
			}
			 var year = $("declarationYear").val();
			 $("#fileName").text("详见《"+filename+"》");
			 $("#pdfShowName").text( $("#uploadFileId").val());
    		 $("#pdfView").attr("href",'<%=basePath%>'+'register/showPdf.act?pdfFile='+$("#file_path").val());
    		  $("#filename").val(filename);
    		  $("#filepath").val(filepath);
    		 $("#xg").show();
	   		 $("#sc").show();
			$('#sEdu').modal('hide');
			$("#pdfFlag").val("1");	
	}
	function delFile(){
		var info_id = ${pd.info_id};
		//通过Ajax向后台传值
		$.ajax({
			type : "POST",
			url : '<%=basePath%>orgApp/delFile.act',
			data : {
				info_id : info_id
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				if ("success" == data.result) {
					 $("#fileName").text("");
					 $("#uploadFileId").val("");
					 $("#file_path").val("");
					 $("#pdfShowName").text("");
					 $("#filename").val("");
		    		  $("#filepath").val("");
					 $("#xg").hide();
			   		 $("#sc").hide();
			   		$("#pdfFlag").val("0");
				} else {
					$('#sEdu').modal('hide');
					$('#my-modal-failure-alert').show().delay(1000).fadeOut ();
				} 
			}
		});
		 
	}
	// 预览资金申请报告
    function viewPdf() {
		var ret=false;
		var path = $("#file_path").val();
    	//通过Ajax向后台传值
		$.ajax({
			type : "POST",
			url :'<%=basePath%>'+'register/isExistsFile.act',
			data : {
				filePath : path
			},
			dataType : 'json',
			async:false, 
			success : function(data) {
				if(data=="1"){
					$("#pdfView").attr('href','<%=basePath%>'+'register/showPdf.act?pdfFile='+path);
					ret=true;
				}else{
					$('#my-modal-errorfile-alert').show ().delay (1000).fadeOut ();
				}
				
			}
		});
    	return ret;
		
	}
 // 根据省份获取城市列表
    function GetCity() {
        BindCId();
    }

	// 获取城市列表
    function BindCId() {
        var PID = $("#ProvinceId").val();
        $("#CityId").find('option').remove();
        if (PID == "") {
            $("<option value=''>市</option>").appendTo("#CityId");
        }
        $.post(document.getElementsByTagName('base')[0].href+'joblist/cityList.act', { 'PID': PID }, function (data) {
            $.each(data.cityList, function (i, list) {
                $("<option value='" + list.REGION_ID + "'>" + list.REGION_NAME + "</option>").appendTo("#CityId");
            });
        });
        $("#CityId").val('');
    }
 // 省份验证
    function checkProvinceId() {
    	// 省份验证
    	var ProvinceId = $("#ProvinceId").val();
    	if (ProvinceId == "") {
    		$("#ProvinceId").tips({
    			side : 1,
    			msg : '请选择省份！',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
    	}
    }
    // 城市验证
    function checkCityId() {
    	// 城市验证
    	var CityId = $("#CityId").val();
    	if (CityId == "") {
    		$("#CityId").tips({
    			side : 1,
    			msg : '请选择城市！',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
    	}
    }
	</script>
	<script src="<%=basePath%>shyl/js/mainjs/errImage.js"
		type="text/javascript"></script>

	<jsp:include page="../../common/govCatalog.jsp"></jsp:include>
</body>
</html>