<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE >
<html>
<head>
<meta charset="utf-8">
<title>项目需求_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">
<link href="/SHYL/shyl/css/maincss/rencai.css" rel="stylesheet" type="text/css">
<link href="/SHYL/shyl/css/integrated/css.css" rel="stylesheet" type="text/css">
<link href="/SHYL/shyl/css/integrated/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/styleRegist.css">
<link rel="stylesheet" href="shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet"
	href="shyl/fileupload/css/jquery.fileupload-ui.css">
<link rel="stylesheet" href="shyl/css/font-awesome.css">
<link rel="stylesheet" href="shyl/css/non-responsive.css">
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/integrated/integratedprojectInfo.js" type="text/javascript"></script>
<style type="text/css">
.more1{
color: #fff;
background-color: #738fd4;
width: 101px;
height: 31px;
text-align: center;
}
div.xqms_cc{
	 word-wrap: break-word; 
	 word-break: normal; 
}
span.n-tit-textarea{ 
 width: 109%;
 display:block;
 } 
 span.requirment{ 
  	 word-wrap: break-word; 
	 word-break: normal; 
 } 
</style>
</head>
<body>
<!--<header开始>-->
<!--</header结束>-->
<jsp:include page="../common/header.jsp"><jsp:param name="id" value="zhfw" /></jsp:include>
<div class="clear"></div>
	<div class='modal my-modal-alert' id='my-modal-down-alert'>
		<div class='modal-dialog boxBodySmall'>
			<div class='modal-content'
				style="width: 300px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
				<div class='modal-body' id='modal-body-alert'>
					<img alt="" src="<%=basePath%>shyl/images/mark.png">&nbsp;&nbsp;没有文件可供下载。
				</div>
			</div>
		</div>
	</div>
	<div class="register-box clearfix">
	<div class="rticon"></div>
	<div class="bidetailed mt40">
    	<p class="biddetailed-tit">${pd.project_title}</p>
       <p class="style2-big fl"><span class="style3">发布企业：</span><span class="n-tit-big"><a href="<%=basePath%>company/info.act?companyId=${pd.insert_user}" style="color:#016ab9;">${pd.publish_company_name}</a></span></p>
        <p class="style2 fl"><span class="style3">发布日期：</span><span>${pd.insert_timestamp}</span></p>
    </div>
    <div class="bidetailed mt40">
    	<p class="biddetailed-tit">业务明细</p>
        <p class="style2 fl"><span class="style3">外包类型：</span><span>${pd.outsource_type}</span></p>
        <p class="style2 fl"><span class="style3">需求有效期：</span><span>${pd.validity_period}</span></p>
        <p class="style2 fl"><span class="style3">质量体系要求：</span><span>${pd.quality_system_level}</span></p>
        <p class="style2 fl"><span class="style3">信息安全要求：</span><span>${pd.info_security_level}</span></p>
        <p class="style2 fl"><span class="style3">语言要求：</span><span>${pd.language_level}</span></p>
        <p class="style2 fl"><span class="style3">城市要求：</span><span>${pd.city}</span></p>
        <p class="style2 fl"><span class="style3">项目周期(月)：</span><span>${pd.project_month}</span></p><div class="clear"></div>
        
        
        <p class="style2 fl"><span class="style3">预算成本(万)：</span><span>${pd.price}</span></p><div class="clear"></div>
        
        <p class="style2"><span class="style3">企业规模要求：</span><span>${pd.enterprise_scale}</span><div class="clear"></div></p>
        <p class="style2-textarea fl"><span class="style3">设备要求：</span><span class="requirment" title="${pd.facility_request}" class="n-tit-textarea">${pd.facility_request}</span><div class="clear"></div></p>
        <p class="style2-textarea fl"><span class="style3">IT要求：</span><span title="${pd.it}"class="n-tit-textarea">${pd.it}</span><div class="clear"></div></p>
        <p class="style2-textarea fl"><span class="style3">行业知识要求：</span><span title="${pd.hy}" class="n-tit-textarea">${pd.hy}</span><div class="clear"></div></p>
        
         <c:if test="${ pd.sex =='0'}">
        	<p class="style2"><span class="style3">联系人：</span><span>${pd.contact}&nbsp;先生&nbsp;</span><div class="clear"></div></p>
        </c:if>
        <c:if test="${ pd.sex =='1'}">
        	<p class="style2"><span class="style3">联系人：</span><span>${pd.contact}&nbsp;女士&nbsp;</span><div class="clear"></div></p>
        </c:if>
        
        <p class="style2 fl"><span class="style3">联系电话：</span><span>${pd.contact_tel}</span></p>
        <div class="clear"></div>
        
         <p class="style2-textarea fl"><span class="style3">Email：</span><span>${pd.email}</span></p>
        <div class="clear"></div>
        <c:if test="${pd.path_flag == '1'}">
        <p class="style2"><span class="style3">附件：</span>
        <span>无</span><div class="clear"></div></p>
        </c:if>
        <c:if test="${pd.path_flag == '0'}">
         <p class="style2"><span class="style3">附件：</span>
        <button class="more1" onclick="dounfile()" type="button"
			id="creatPDF" style="position:relative;">&nbsp;&nbsp;下载 &nbsp;&nbsp;</button></p>
        </c:if>
        <input type="hidden" id="filepath" value="${pd.appendix_path}">
		<input type="hidden" id="filename" value="${pd.appendix_name}">
		<div class="xqms">
			<h5 class="xqms-h5">需求描述</h5>
			<div class="xqms_cc">${pd.detail_description}</div>
		</div>
		<c:choose>
		<c:when test="${not empty page.flag}">
		 <div class="anniu jbanniu">
      	 <button class="ljjb" data-toggle='modal' data-target='' class='modify' onclick="logint('${pd.project_id}', '${pd.insert_user}');" id="ljzb">立即竞标</button>
        </div>
		</c:when>
		<c:otherwise>
		</c:otherwise>
		</c:choose>
    </div>
	<form class="form-horizontal" action="" method="post" id="listForm" name="listForm">
	</form>
	<input type="hidden" value="${platUser.USERNAME}" id="username">
</div>
	<div class="modal fade bs-example-modal-sm" id="layhomewarn"
		role="dialog" aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm" style="margin-top: 250px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="mySmallModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<p id="warntext">
						请登录后操作！点此&nbsp;<a
							href="<%=basePath%>userLogin/goLogin.act?returnUrl=integrated/integratedIndex.act"
							class="button btn-succes"><b
							style="text-decoration: underline; color: #0a7295;">登录</b></a>
					</p>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">

   	function dounfile(){
   		var username=$("#username").val();
   		if(username==""){
   			$("#layhomewarn").modal('show');
   			return;
   		}
	    var filename=$("#filename").val();
	    var filepath=$("#filepath").val();
		$.ajax({
			type : "POST",
			url : '<%=basePath%>/requirementdetail/downfile.act',
			data : {filepath:filepath},
			dataType : 'json',
			cache : false,
			success : function(data) {
					if(data.responseStr=="OK"){
						$("#listForm").attr("action","<%=basePath%>requirementdetail/download.act?fileName=" + filename + "&filePath=" + filepath);
						$("#listForm").submit();
					}else{
						$('#my-modal-down-alert').show().delay(1000).fadeOut ();
					}
				}
		});
	}
</script>
<div class="clear"></div>
<!--<footer开始>-->

<!--</footer结束>-->
<div class="modal fade in" id="wtht" role="dialog"
			aria-labelledby="adoptModal" aria-hidden="false" data-backdrop="static">
			
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							项目竞标<small> </small>
						</h4>
					</div>
					<form class="form-horizontal" role="form" action="" method="post"
						id="form1" name="form1">
						<table class="table">
									<tbody>
										<tr>
											<th style="line-height: 40px"><span class="red_tip">*</span>联系人：</th>
											<td colspan="3"><input class="inputtxt2"
												data-val="true" data-val-length="长度<50"
												data-val-length-max="50" data-val-required="*" id="Name"
												name="Name" type="text" maxlength="50" value="" onblur="trim(this);">
												<span class="field-validation-valid"
												data-valmsg-for="School" data-valmsg-replace="true"></span>
												<input type="hidden" id="CompanyName"/>
											</td>
										</tr>
										<tr>
											<th style="line-height: 40px"><span class="red_tip">*</span>手机号：</th>
											<td><input class="inputtxt2" data-val="true"
												data-val-length="长度<50" data-val-length-max="50"
												data-val-required="*" id="Phone" name="Phone" type="text" maxlength="50"
												value="" onblur="trim(this);"> <span
												class="field-validation-valid" data-valmsg-for="Major"
												data-valmsg-replace="true"></span></td>

										</tr>
										<tr>
											<th style="line-height: 40px"><span class="red_tip">*</span>E-mail：</th>
											<td><input class="inputtxt2" data-val="true"
												data-val-length="长度<50" data-val-length-max="50"
												data-val-required="*" id="Email" name="Email" type="text" maxlength="50"
												value="" onblur="trim(this);"> <span
												class="field-validation-valid" data-valmsg-for="Major"
												data-valmsg-replace="true"></span></td>

										</tr>
										<tr>
											<th style="line-height: 65px">竞标方案：</th>
											<td> <textarea style="width:700px;padding-left:5px;background-color:#ecf0f9;border:0;border-radius:5px;font-size:0.85em;resize:none!important;" rows="4" maxlength="500" id="Introduction" name="Introduction">${pd.introduction_detail}</textarea></td>
										</tr>
										<tr>
											<th style="line-height: 40px">附&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;件：</th>
											<td>
											<div class="row">
											<div class="col-md-12">
												<div>
													<div class="form-group">
														<div class="col-sm-10">
															<input id="docname" style="margin-left:12px" class="inputtxt2" value=""></input>
															<span id="file_uploadCon"
																	class="btn btn-primary fileinput-button"
																	style=""> <span>浏览...</span> <input
																	type="file" id="file_upload" name="file_upload" multiple />
																</span>
														</div>
														<div class="col-sm-5" style="padding-left:20px;">
															<div class="caption" align="center" style="width: 100px;">
															</div>
															<p style="margin-left: -50px; font-size: 12px; margin-top: 5px"
															class="style1">（50M以内）支持的文件格式为.doc/.docx/.pdf/.xls/.xlsx/.ppt/.pptx/.txt/.jpg</p>
														</div>
														<input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="apply_report_path" maxlength="255" name="apply_report_path" type="hidden" value="" onblur="trim(this);" />
														<input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="apply_report_name" maxlength="255" name="apply_report_name" type="hidden" value="" onblur="trim(this);" />
													</div>
												</div>
											</div>
										</div>
											<input type="hidden" value="" id="PERSONNEL_ID">
											<input type="hidden" value="" id="PROJECT_ID">
										</tr>
									</tbody>
								</table>
						<div class="modal-footer">
							<button type="button" class="btn btn-success"
								onclick="proinfosave()" id="make">确认</button>
							<button type="button" class="btn btn-default" onclick="Clear()"
								>关闭</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- 确认到登录界面 -->
		<div class="modal fade bs-example-modal-sm" id="layhomewarn" role="dialog" aria-labelledby="mySmallModalLabel">
      <div class="modal-dialog modal-sm" style="margin-top:250px">
          <div class="modal-content">
              <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">
                      <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                  </button>
                  <h4 class="modal-title" id="mySmallModalLabel">提示</h4>
              </div>
              <div class="modal-body">
                  <p id="warntext">
                      请登录后操作！点此&nbsp;<a href="<%=basePath%>userLogin/goLogin.act?returnUrl=integrated/integratedIndex.act"
                          class="button btn-succes"><b
                          style="text-decoration: underline;color: #0a7295;">登录</b></a>
                  </p>
              </div>
          </div>
      </div>
</div>


				<!-- 提交结果 -->
				<div class='modal my-modal-alert' id='success'
					style="display: none;">
					<div class='modal-dialog boxBodySmall'>
						<div class='modal-content'
							style="width: 150px; text-align: center; position: fixed; right: 40%; bottom: 60%;">
							<div class='modal-body' id='modal-body-alert'>
								<img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;竞标成功!
							</div>
						</div>
					</div>
				</div>
				<div class='modal my-modal-alert' id='error' style="display: none;">
					<div class='modal-dialog boxBodySmall'>
						<div class='modal-content'
							style="width: 150px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
							<div class='modal-body' id='modal-body-alert'>
								<img alt="" src="<%=basePath%>shyl/images/fail.png">&nbsp;&nbsp;竞标失败!
							</div>
						</div>
					</div>
				</div>



	<!-- 无权访问 -->
	<div class="modal fade in" id="wqfw" role="dialog"
		aria-labelledby="deledu" aria-hidden="false" data-backdrop="static">
		<div class="modal-dialog  modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<h4>您无权进行此操作，请以企业用户登录！！</h4>
					<br> <br>
				</div>
				<input id="Conid" name="Conid" type="hidden" value="">
				<div class="modal-footer">
					<button id="EduButton" type="button" class="btn btn-success"
						data-target="modal" onclick="wqfw()">确认</button>
					<input type="hidden" value="" id="delectinfoid">
				</div>
			</div>
		</div>
	</div>
	<!-- 重复竞标 -->
		<div class="modal fade in" id="cfjb" role="dialog"
		aria-labelledby="deledu" aria-hidden="false" data-backdrop="static">
		<div class="modal-dialog  modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<h4>该项目已竞标	，不能重复竞标</h4>
				</div>
				<input id="Conid" name="Conid" type="hidden" value="">
				<div class="modal-footer">
					<button id="EduButton" type="button" class="btn btn-success"
						data-target="modal" onclick="cfjb()">确认</button>
					<input type="hidden" value="" id="delectinfoid">
				</div>
			</div>
		</div>
	</div>
	<!-- 自己发布的项目不能竞标 -->
        <div class="modal fade in" id="bnjb" role="dialog"
        aria-labelledby="deledu" aria-hidden="false" data-backdrop="static">
        <div class="modal-dialog  modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                    </button>
                    <h4 class="modal-title" id="modalLabel">提示</h4>
                </div>
                <div class="modal-body">
                    <h4>不能竞标自己发布的项目</h4>
                </div>
                <div class="modal-footer">
                    <button id="confirm" type="button" class="btn btn-success"
                        data-target="modal" onclick="bnjb()">确认</button>
                </div>
            </div>
        </div>
    </div>
<div class="clear"></div>
<!--<footer开始>-->
<input type="hidden" value="${platUser.USER_ID}" id="loginstatus">
<input type="hidden" value="${platUser.USER_TYPE}" id="user_type">
<%@ include file="../common/footer.jsp"%>

<script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
		<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
		<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
		<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
		<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
		<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
		<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
		<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
		<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
		<script type="text/javascript">
		//上传附件
		var tips=function(id,msg){
		$("#"+id).tips({
			side : 2,
			msg : msg,
			bg : '#AE81FF',
			time : 3
		});
	}
	//页面重新加载
	function Reload(){
		window.location.reload();
	}		
			
	$("#file_upload").fileupload({
		 dataType :'iframe text',
		 autoUpload: true,
		 maxNumberOfFiles : 1,
		 maxFileSize: 50000000,
		 url:'<%=basePath%>integrated/uploadfj.act',
        	sequentialUploads: true
	}).bind('fileuploadchange', function(e, data) {
		 
		if (data.files.length > 1) {
			tips("docname", "只能上传一个文件。");
			return false;
		}
    }).bind('fileuploaddone', function (e, data) {
    	console.log(data);
   	 			if("no"==data.result){
   	 			tips("docname", "请上传格式为.doc/.docx/.pdf/.xls/.xlsx/.ppt/.pptx/.txt/.jpg格式的文档文件。");
	   	 } else if("nosize"==data.result){
		   		tips("docname", "请上传文件大小在50M以内的文件。");
		 } else {
	   		 $("#apply_report_path").val(data.result);
	   		 $("#apply_report_name").val(data.originalFiles[0].name);
	   		 $("#docname").val(data.originalFiles[0].name);
	   	 }
    });
	
	</script>
</body>
</html>
