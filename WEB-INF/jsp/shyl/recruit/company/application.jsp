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
<title>济南市开放型经济发展资金项目申请表（服务外包）_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<jsp:include page="../../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/work.css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/uploadify.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<script type="text/javascript" src="<%=basePath%>/shyl/js/mainjs/jquery.placeholder.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<style>

.table {
	border: 0px solid;
	border-color: #ddd;
	margin-bottom: 0px !important;
	
}

.table td {
	border: 1px solid;
	border-color: #ddd;
	border-collapse: collapse;
	text-align: center;
	vertical-align: middle !important;
}
.table td label{
	font-size: 0.85em;
}
.inputtxt2 {
    width: 80%  !important;
 }
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
 .margin-tb10{
 	margin: 10px 0 10px 0;
 } 
 .margin-tb5{
 	margin: 5px 0 5px 0;
 }  
 @media all and (max-width: 1200px){
    .table,.table td{ border: 2px solid #ddd; }
}
@media all and (max-width: 1200px){
    .table,.table td{ border: 2px solid #ddd; }
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
					<h2><img id="catalogTree" src="<%=basePath%>/shyl/images/catalog.png" style="margin-bottom: 5px;"/>济南市开放型经济发展资金项目申请表（服务外包）
					</h2>
					<div class="input_class" style="margin-bottom: 100px;margin-top:0px;">
						<form action="<%=basePath%>org/saveApp.act" class="form-inline"
							method="post" id="form1" >
							<input type="hidden" name="id" value="${pd.id}">
							<input type="hidden" name="info_id" id="info_id" value="${pd.info_id}">
							<!-- 下一页 -->
							<input type="hidden" name="toPage" value="${pageMap.toPage}">
							<table id="appTable"  border="1" bordercolor="black"
								cellspacing="1" class="table">

								<tr>
									<td width="20%"><label class="control-label"><span
										style="color: #FF0000">*</span>申请单位名称</label></td>
									<td width="30%"><input class="inputtxt2" maxlength="50"
										id="company_name" name="company_name" placeholder=""
										type="text" value="${pd.company_name}" onblur="trim(this);"></td>
									<td width="20%"><label class="control-label"><span
										style="color: #FF0000">*</span>注册辖区</label></td>
									<td  width="30%"><input class="inputtxt2"  maxlength="50"
										 id="registered_area"
										name="registered_area" placeholder="" type="text" onblur="trim(this);" value="${pd.registered_area}"></td>
								</tr>
								<tr>
									<td width="20%"><label class="control-label"><span
										style="color: #FF0000">*</span>单位地址</label></td>
									<td><input class="inputtxt2" maxlength="50"
										id="company_address" name="company_address" placeholder="" onblur="trim(this);" type="text" value="${pd.company_address}"></td>
									<td><label class="control-label"><span
										style="color: #FF0000">*</span>纳税辖区</label></td>
									<td><input class="inputtxt2"  maxlength="50"
										 id="tax_area" name="tax_area"
										placeholder="" type="text" value="${pd.tax_area}" onblur="trim(this);"></td>
								</tr>
								<tr>
									<td colspan="4" align="center" style="padding: 0px;">
										<table border="1" cellspacing="0" cellpadding="0"
											style="border-collapse: collapse; border-width: 0px; border-style: hidden;"
											class="table">
											<tr>
												<td rowspan="3" width="15%"><label
													class="control-label"><span
										style="color: #FF0000">*</span>申请单位类别<br>(请勾选√)
												</label></td>

												<td width="18%"><span style="font-size: 0.85em;">园区、基地&#12288;<input type="checkbox"
															width="50%" value="2" class="typeTextClass" disabled="disabled" <c:if test="${pd.apply_company_type=='2'}">checked</c:if> ></span>
													
												<td rowspan="3" width="15%"><label
													class="control-label"><span
										style="color: #FF0000">*</span>申请单位主要股东及投资比例</label></td>
												<td width="40%"><span >1.<input class="inputtxt2" id="shareholders1"
															name="shareholders1" placeholder="" maxlength="50" type="text" value="${pd.shareholders1}" >
													</span></td>
												<td><span>
														<input class="inputtxt2 width70" 
															
															id="shareholders1_scale"
															name="shareholders1_scale" placeholder="" type="text"
															value="${pd.shareholders1_scale}" onkeyup="value=value.replace(/[^\d.]/g,'')">
													%</span></td>
											</tr>
											<tr>
												<td><span style="font-size: 0.85em;">企业&#12288;<input type="checkbox" width="50%" value="1"
															 class="typeTextClass" disabled="disabled" <c:if test="${pd.apply_company_type=='1'}">checked</c:if>>
													</span></td>
												<td><span class="">2.
														<input class="inputtxt2" id="shareholders2"  maxlength="50"
															name="shareholders2" placeholder="" type="text" value="${pd.shareholders2}">
													</span></td>
												<td><span >
														<input class="inputtxt2 width70" 
															id="shareholders2_scale"
															name="shareholders2_scale" placeholder="" type="text" 
															value="${pd.shareholders2_scale}" onkeyup="value=value.replace(/[^\d.]/g,'')">
													%</span></td>
											</tr>
											<tr>
												<td><span style="font-size: 0.85em;">其他&#12288;
														<input type="checkbox" width="50%" value="3"
															  class="typeTextClass" disabled="disabled" <c:if test="${pd.apply_company_type=='3'}">checked</c:if>>
													</span></td>
												<td><span>3.
														<input class="inputtxt2"  id="shareholders3"  maxlength="50"
															name="shareholders3" placeholder="" type="text" value="${pd.shareholders3}">
													</span></td>
												<td><span >
														<input class="inputtxt2 width70"  
															 id="shareholders3_scale"
															name="shareholders3_scale" placeholder="" type="text"
															value="${pd.shareholders3_scale}" onkeyup="value=value.replace(/[^\d.]/g,'')">
													%</span></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td colspan="4" align="center" style="padding: 0px;">
										<table  border="1" cellspacing="0" cellpadding="0"
											style="border-collapse: collapse; border-width: 0px; border-height: 0px; border-style: hidden;"
											class="table">
											<tr>
												<td rowspan="2" width="20%"><label
													class="control-label"><span
										style="color: #FF0000">*</span>项目负责人</label></td>
												<td rowspan="2" width="15%"><input
													class="inputtxt2" maxlength="50"
													 id="project_leader"
													name="project_leader" placeholder="" type="text" onblur="trim(this);" value="${pd.project_leader}"></td>
												<td><label class="control-label"><span
										style="color: #FF0000">*</span>单位电话</label></td>
												<td><input class="inputtxt2" maxlength="20"
													
													id="pleader_work_tel" name="pleader_work_tel"
													placeholder="区号-固定电话号码 如:010-xxxxxxxx" type="text" onblur="trim(this);" value="${pd.pleader_work_tel}"> </td>
											</tr>
											<tr>
												<td><label class="control-label"><span
										style="color: #FF0000">*</span>个人手机</label></td>

												<td><input class="inputtxt2" maxlength="11"
													id="pleader_per_phone"
													name="pleader_per_phone" placeholder="" type="text"
													value="${pd.pleader_per_phone}" onblur="trim(this);"></td>
											</tr>
											<tr>
												<td rowspan="2"><label class="control-label"><span
										style="color: #FF0000">*</span>财务负责人</label></td>
												<td rowspan="2"><input class="inputtxt2"
													
													id=finance_leader name="finance_leader" placeholder="" maxlength="50"
													type="text" value="${pd.finance_leader}" onblur="trim(this);"></td>
												<td><label class="control-label"><span
										style="color: #FF0000">*</span>单位电话</label></td>
												<td><input class="inputtxt2" maxlength="20"
													
													id="fleader_work_tel" name="fleader_work_tel"
													placeholder="区号-固定电话号码 如:010-xxxxxxxx" type="text" value="${pd.fleader_work_tel}" onblur="trim(this);"></td>
											</tr>
											<tr>
												<td><label class="control-label"><span
										style="color: #FF0000">*</span>个人手机</label></td>

												<td><input class="inputtxt2" maxlength="11"
													 id="fleader_per_phone"
													name="fleader_per_phone" placeholder="" type="text"
													value="${pd.fleader_per_phone}" onblur="trim(this);"></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td colspan="4" align="center" style="padding: 0px;">
										<table border="1" cellspacing="0" cellpadding="0"
											style="border-collapse: collapse; border-width: 0px; border-style: hidden;"
											class="table">
											<tr>
												<td colspan="3" style="text-align: left;"><label
													class="control-label"><span
										style="color: #FF0000">*</span>根据“服务外包业务管理与统计系统”服务外包执行额和就业应享受的扶持比例（勾选√）</label></td>
												<td ><span style="font-size: 0.85em;">100%
														<input type="checkbox" width="50%" value="100"
															name="support_ratio"  class="supportTextClass" <c:if test="${pd.support_ratio=='100'}">checked</c:if>>
													</span></td>
												<td id="support_ratio"><span style="font-size: 0.85em;">50%
														<input type="checkbox" width="50%" value="50"
															name="support_ratio"   class="supportTextClass" <c:if test="${pd.support_ratio=='50'}">checked</c:if>>
													</span></td>
											</tr>
											<tr>
												<td width="20%"><label class="control-label"><span
										style="color: #FF0000">*</span>上年度获得市级财政服务外包资金总额（万元）</label></td>
												<td width="15%"><input class="inputtxt2" 
													id="last_year_capital" name="last_year_capital" maxlength="11"
													placeholder="" type="text" value="${pd.last_year_capital}" ></td>
												<td  width="20%"><label class="control-label"><span
										style="color: #FF0000">*</span>本次申请资金总额&#12288;&#12288;（万元）</label></td>
												<td colspan="2"><input class="inputtxt2"
													id="this_apply_capital" name="this_apply_capital" maxlength="11"
													placeholder="" type="text" value="${pd.this_apply_capital}" ></td>
											</tr>
											<tr>
												<td><label class="control-label"><span
										style="color: #FF0000">*</span>申请报告</label></td>
												<td colspan="1" style="text-align: left;font-size: 0.85em; " id="docName">
														<c:if test="${not empty pd.apply_report_path}">
															<a id="pdfView" href='javascript:void(0);' target='_blank' onclick="return viewPdf('${pd.apply_report_path}');"
															>${pd.apply_report_name}</a>
														</c:if>
													</td>
													<td colspan="1" id="fileDiv">
													 <span id="file_upload"
														class="btn btn-primary fileinput-button"> <span>上传申请报告</span>
														<input type="file" id="file_upload" name="file_upload1"
														multiple>
														 <input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="apply_report_path" maxlength="255" onblur="trim(this);" name="apply_report_path" type="text" value="${pd.apply_report_path}" />
														 <input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="apply_report_name" maxlength="255" onblur="trim(this);" name="apply_report_name" type="text" value="${pd.apply_report_name}" />
														</span>
														
													</td>
												<td colspan="2" style="text-align: left;" class="font-size85">
													     注：请提供申请总报告（1000字左右），包括公司简介、开展服务外包业务情况和申请扶持项目情况等（要求叙述准确、条目清晰）
													</td>
												
													
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td colspan="4" align="center" style="padding: 0px;">
										<table class="font-size85" border="0" cellspacing="0" cellpadding="0"
											style="border-collapse: collapse;border-width: 0px;border-style: hidden;width: 100%;"
											class="table">
											<tr>
												<td 
													style="text-align: left; padding-left: 20px; padding-top: 20px; border: 0px solid #fff;">
													<p>本人郑重声明：</p>
													<p>1.提供的申请项目属实</p>
													<p>2.提供的所有复印件已与材料原件核对，均完全一致</p>
													<p>3.如有虚假，人本承担相应法律责任</p>
												</td>
											</tr>
											<tr>
												<td
													style="text-align: right; padding-right: 250px; border: 0px solid #fff;">法人签字：</td>
											</tr>
											<tr>
												<td
													style="text-align: right; padding-right: 120px; border: 0px solid #fff;">申请单位（盖章）：</td>
											</tr>
											<tr>
												<td
													style="text-align: right; padding-right: 100px; border: 0px solid #fff;">年&nbsp;&nbsp;&nbsp;&nbsp;
													月&nbsp; &nbsp;&nbsp;&nbsp; 日</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<div class="col-md-12" style="padding-top: 10px; font-size: 0.85em;">
								<label class="col-sm-2 control-label margin-tb10" ><span
										style="color: #FF0000;">*</span>申报联系人:</label>
								<div class="col-sm-3">
									<input class="inputtxt2 margin-tb5" id="contact_person" maxlength="50"
										name="contact_person" placeholder="" type="text" value="${pd.contact_person}" onblur="trim(this);">

								</div>
								<label class="col-sm-2 control-label margin-tb10"><span
										style="color: #FF0000 ;">*</span>办公电话:</label>
								<div class="col-sm-3">
									<input class="inputtxt2 margin-tb5"  id="contact_office_tel" maxlength="20"
										name="contact_office_tel" placeholder="" type="text" value="${pd.contact_office_tel}" onblur="trim(this);">
								</div>
							</div>
							<div class="col-md-12" style="padding-top: 10px;font-size: 0.85em; ">
								<label class="col-sm-2 control-label margin-tb10"><span
										style="color: #FF0000;">*</span>手机:</label>
								<div class="col-sm-3">
									<input class="inputtxt2 margin-tb5"  id="contact_phone" name="contact_phone" maxlength="11"
										placeholder="" type="text" value="${pd.contact_phone}" onblur="trim(this);">

								</div>
								<label class="col-sm-2 control-label margin-tb10"><span
										style="color: #FF0000;">*</span>邮箱:</label>
								<div class="col-sm-3">
									<input class="inputtxt2 margin-tb5"
										id="contact_mail" name="contact_mail" placeholder="" maxlength="50"
										type="text" value="${pd.contact_mail}" onblur="trim(this);">
								</div>
							</div>
						</form>
						<div class="form-group">
						<div class="col-sm-2 col-sm-offset-2" style="margin-top: 40px;">
							<button type="button" onclick="OK('${pageMap.toPage}');"
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
	<script src="<%=basePath%>shyl/js/images/apply/application.js"></script>
	<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
	<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
	<script type="text/javascript">
	 $("#file_upload").fileupload({
		 dataType :'iframe text',
		 autoUpload: true,
		 maxNumberOfFiles : 1,
         url: '<%=basePath%>apply/Upload.act',
         sequentialUploads: true
	 }).bind('fileuploadchange', function (e, data) {
		 if(data.files.length > 1){
			 tips("weixin_upload","只能上传一个文件。");
             return false;
		 }
     }).bind('fileuploaddone', function (e, data) {
    	 if("no"==data.result){
    		 tips("fileDiv","请上传格式为.pdf/.doc/.docx格式的文档文件。");
    	 } else {
    		 $("#apply_report_path").val(data.result);
    		 $("#apply_report_name").val(data.originalFiles[0].name);
    		 $("#docName").html('<a target="_blank" href="<%=basePath%>'+'register/showPdf.act?pdfFile='+data.result+'" >'+data.originalFiles[0].name+'</a>');
    		
    	 }
     });
	   // 预览
	    function viewPdf(path) {
			var ret=false;
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
	   
	</script>
	<jsp:include page="../../common/govCatalog.jsp"></jsp:include>
</body>
</html>