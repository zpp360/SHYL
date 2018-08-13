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
<title>企业信息_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/uploadify.css">
<script src="<%=basePath%>shyl/js/jquery-1.7.2.js"></script>
<script src="<%=basePath%>shyl/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>shyl/js/jquery.min.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.min.js"></script>
<script src="<%=basePath%>shyl/js/datepicker/WdatePicker.js" type="text/javascript"></script>
<link href="<%=basePath%>shyl/css/maincss/mypage.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<link rel="stylesheet" href="<%=basePath%>shyl/css/company/company.css">
</head>
<body id="top" style="background-color: #f7f7f7;">
    <jsp:include page="../../common/header.jsp"></jsp:include>
	<div class="clear"></div>
	<div class="register-box p0">
	<div class="rticon"></div>
	<jsp:include page="../../common/left.jsp"><jsp:param value="1" name="menuType"/></jsp:include>
	<div class="mypage_right">
		<h2>企业信息</h2>
		<form action="<%=basePath%>company/companyUpdate.act" class="form-horizontal" id="form1" method="post">

	    <!-- start -->
        <input type="hidden" id="result" name="result" value="${pd.result}">
        <input type="hidden" id="companyId" name="companyId" value="${pd.USER_ID}">
        <input type="hidden" id="imglogo" name="imglogo" value="${imglogo}">
        <div class='modal my-modal-alert' id='my-modal-success-alert'>
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:150px;text-align:center;position:fixed;right:40%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;修改成功!
                    </div>
                </div>
            </div>
        </div>
        
        <div class='modal my-modal-alert' id='my-modal-failure-alert'>
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:150px;text-align:center;position:fixed;right:40%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/fail.png">&nbsp;&nbsp;修改失败!
                    </div>
                </div>
            </div>
        </div>
        <!-- end -->

 		<div class="input_class">
			<ul style="width: 442px;float: left;line-height: 42px;margin: 17px 0;">
				<li>
					<span>公司名称：</span>
					<input type="text" class="inputtxt2New" title="${pd.COMPANY_NAME}"value="${pd.COMPANY_NAME}" disabled>
				</li>
				<li>
					<span>组织机构代码：</span>
					<input type="text" class="inputtxt2New" value="${pd.ORGANIZE_CODE}" disabled>
				</li>
				<li>
					<span>
						<small style="color: red">*</small>企业法人代表：
					</span>
					<input type="text" id="ComPerson" name="ComPerson" size="50" onblur="trim(this);checkComPerson();" maxlength="50" type="text" class="inputtxt2" value="${pd.LEGAL_REPRESENTATIVE}">
				</li>
			</ul>

			<ul style="width: 442px;float: left;line-height: 42px;height: 42px;margin: 17px 0;">
				<li style="height: 110px;">
					<span>营业执照扫描件：</span>
                    <p class="pull-left">
                    	<img onerror="showImgDelay(this,'<%=basePath%>shyl/images/logo_temp.jpg');" src="<%=basePath%>images/${pd.BUSINESS_LICENSE}" id="imgLL" name="imgLL" style="height:160px;width: 150px; padding: 3px; background: #fff;" />
                    </p>
                    <input id="business_license" name="business_license" type="hidden" value="${pd.BUSINESS_LICENSE}" />
                    <div class="pull-left" style="margin-top:-41px;padding-left:35%;">
	                    <br>
	                    <span class="fileinput-button" style="width:131px;">
							<span style="text-align:left;width:131px;background-color: #4f70c0;color:#FFFFFF;border-radius: 5px;line-height: 40px;text-align: center;font-size:15px;">上传营业执照
							</span>
							<input style="width:auto;" type="file" id="file_upload_business" name="file_upload_business" title="点击这里上传营业执照扫描件">
						</span>
						<br>
						<i>支持的图片格式为(*.jpg;*.png;*.jpeg;*.gif)</i>
                    </div>
                </li>
			</ul>

			<ul>
				<li><span><small style="color: red">*</small>所属行业：</span>
				      <div>
                        <a class="btnNew select_btnNew" style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" data-toggle="modal" id="inText" data-target="#myIndustry" onclick="InChecked()">
                        <c:if test="${pd.industryName == '' || pd.industryName == null}">请选择所属行业</c:if>
                        <c:if test="${pd.industryName != '' && pd.industryName != null}">${pd.industryName}</c:if></a>
                        <input id="inId" name="inId" type="hidden" value="${pd.INDUSTRY}" />
                        <input data-val="true" data-val-required="*" id="Industry" name="Industry" type="hidden" value="${pd.INDUSTRY}" />
                    </div>
                </li>
				<li>
					<span>
						<small style="color: red">*</small>企业规模(人)：
					</span>
                    <input type="text" class="inputtxt2" name="ComScale" size="6" maxlength="6" onblur="checkComScale();" onkeyup="this.value=this.value.replace(/\D/g,'')"  id="ComScale" value="${pd.SCALE}"/>
                </li>
                <li>
                	<span>
                		<small style="color: red">*</small>公司地址：
                	</span>
                    <select class="inputtxt2" id="ProvinceId" name="ProvinceId" onclick="GetCity()" onchange="checkProvinceId();">
                    	<option value="">--选择省--</option>
						<c:forEach items="${provincesList}" var="provinces">
							<option value="${provinces.REGION_ID}" <c:if test="${provinces.REGION_ID == pd.ADDRESS_PROVINCE }">selected</c:if>>${provinces.REGION_NAME}</option>
						</c:forEach>
				    </select>
                </li>
                <li>
                	<span>企业性质：</span>
                	<select class="inputtxt2" id="ComNature" name="ComNature">
                		<option value="">无</option>
						<c:forEach items="${compTypeList}" var="compType">
							<option value="${compType.DISTINGUISH_ID}" <c:if test="${compType.DISTINGUISH_ID == pd.ENTERPRISE_NATURE }">selected</c:if>>${compType.VALUE}</option>
						</c:forEach>
				</select>
				</li>
				<li>
					<span>&nbsp;</span>
                    <select id="CityId" name="CityId" class="inputtxt2" onchange="checkCityId();">
                            <c:forEach items="${cityList}" var="cityList">
							<option value="${cityList.REGION_ID}" <c:if test="${cityList.REGION_ID == pd.ADDRESS_CITY }">selected</c:if>>${cityList.REGION_NAME}</option>
							</c:forEach>
                    </select>
                </li>
                <li>
					<span>是否属于上市公司：</span>
                	<label for="isQuoted1"><input type="radio" id="isQuoted1" name="isQuoted" value="0" <c:if test="${pd.IS_QUOTED_COMPANY == 0}">checked</c:if>><i onclick="radioSelect(0)">是</i></label>
                	<label for="isQuoted2"><input type="radio" id="isQuoted2" name="isQuoted" value="1" <c:if test="${pd.IS_QUOTED_COMPANY == 1 || pd.IS_QUOTED_COMPANY == '' || pd.IS_QUOTED_COMPANY == null}">checked</c:if>><i onclick="radioSelect(1)">否</i></label>
                </li>
                <li style="height: 110px;">
					<span>&nbsp;</span>
                    <textarea id="Address" name="Address" rows="3" placeholder="请填写详细地址" style="width: 270px;padding-left:5px;background-color:#ecf0f9;border:0;border-radius:1px;font-size:0.85em;resize:none!important;" maxlength="255" onblur="trim(this);">${pd.ADDRESS_DETAIL}</textarea>
                </li>
                <li id="areali" >
					<span><small style="color: red">*</small>所属机关：</span>
                    <select id="areaId" name="areaId" class="inputtxt2" onchange="checkAreaId();">
                    	<option value="">---商务局---</option>
                    	<c:forEach items="${areaList}" var="arealist">
						    <option value="${arealist.REGION_ID}" <c:if test="${arealist.REGION_ID == pd.ADDRESS_AREA}">selected</c:if>>${arealist.REGION_NAME}商务局</option>
						</c:forEach>
                    </select>
                </li>
				
                 <li>
                	<span>
                		<small style="color: red">*</small>注册资金：
                	</span>
                    <input class="inputtxt2" id="RegCapital" name="RegCapital" size="6" maxlength="20" type="text" value="${pd.REGISTERED_CAPITAL}" />
                 </li>
                <li>
					<span>业务分布：</span>
					<input class="inputtxt2" id="Business" name="Business" placeholder="如国内，欧美，日韩，其它地区" size="20" maxlength="20" type="text" value="${pd.SERVICE_DISTRIBUTION}" />
				</li>
				<li>
					<span>
						<small style="color: red">*</small>注册时间：
					</span>
                    <input class="inputtxt2" id="RegDate" name="RegDate" onFocus="WdatePicker({isShowWeek:true});" type="text" value="${pd.REGISTRATION_TIME}" />
                </li>
				<li>
					<span>公司邮编：</span>
                    <input class="inputtxt2" id="ZipCode" name="ZipCode" size="6" maxlength="6" onblur="trim(this);checkZipCode();" type="text" value="${pd.ZIP_CODE}" />
				</li>
				<li>
					<span>公司网址：</span>
                    <input class="inputtxt2" id="ComWebSite" name="ComWebSite" size="200" maxlength="200" onblur="trim(this);checkComWebSite();"placeholder="" type="text" value="${pd.WEBSITE}" />
				</li>
			</ul>

			<ul>
				<li style="height:120px;width: 100%;">
					<span>公司Logo：</span>                    
                    <p class="pull-left">
                    	<img onerror="showImgDelay(this,'<%=basePath%>shyl/images/logo_temp.jpg');" src="<%=basePath%>images/${pd.LOGO}" class="upimg" id="imgP" name="imgP" style="width: 150px; padding: 3px; border: solid 1px #ccc; background: #fff;" />
                    </p>
                    <input id="pictureUrl" name="pictureUrl" type="hidden" value="${pd.LOGO}" />
                    <div class="pull-left" style="padding-left: 15px;">
	                    <br>
	                    <span class="fileinput-button" style="width:131px;">
							<span style="text-align:left;width:131px;background-color: #4f70c0;color:#FFFFFF;border-radius: 5px;line-height: 42px;text-align: center;font-size:15px;">上传Logo图片
							</span>
							<input style="width:auto;" type="file" id="file_upload" name="file_upload" title="点击这里上传图片">
						</span>
						<br>
						<i>支持的图片格式为(*.jpg;*.png;*.jpeg;*.gif)</i>
                    </div>
				</li>
				<li>
					<span>联系人：</span>
                    <input class="inputtxt2" data-val="true" data-val-required="*" id="Contact" name="Contact" size="20" maxlength="20" type="text" value="${pd.CONTACT}" onblur="trim(this);"/>
                    <span class="field-validation-valid" data-valmsg-for="Contact" data-valmsg-replace="true"></span>
				</li>
				<li>
					<span><small style="color: red">*</small>联系电话：</span>
                    <input class="inputtxt2" data-val="true" data-val-required="*" id="Phone" name="Phone" maxlength="20" onblur="trim(this);checkPhone();" type="text" value="${pd.CONTACT_TEL}" />
                    <span class="field-validation-valid" data-valmsg-for="Phone" data-valmsg-replace="true"></span>
				</li>
				<li>
					<span><small style="color: red">*</small>E-mail：</span>
                    <input class="inputtxt2" onblur="trim(this);checkEmail();" id="Email" name="Email" maxlength="50" type="text" value="${pd.MAIL}" />
                    <span class="field-validation-valid" data-valmsg-for="Email" data-valmsg-replace="true"></span>
				</li>
				<li>
					<span>QQ：</span>
                    <input class="inputtxt2" data-val="true" data-val-required="*" id="qq" name="qq" maxlength="20" type="text" value="${pd.qq}" />
                    <span class="field-validation-valid" data-valmsg-for="Phone" data-valmsg-replace="true"></span>
				</li>
				<li style="height:150px;width: 100%;">
				     <span>公司介绍：</span>
                     <textarea style="width:700px;padding-left:5px;background-color:#ecf0f9;border:0;border-radius:5px;font-size:0.85em;resize:none!important;" rows="4" maxlength="65535" onblur="trim(this);" id="Introduction" name="Introduction">${pd.COMPANY_INTRODUCTION}</textarea>
				</li>
			</ul>
			<ul>
				<li style="height:80px;width: 100%;">
					<span>公司图片展示：</span>
					<div class="form-group">
	                    <div class="col-sm-9">
	                    	    <span class="fileinput-button">
									<span style="text-align:left;width:140px;background-color: #4f70c0;color:#FFFFFF;border-radius: 5px;line-height: 42px;text-align: center;font-size:15px;">上传企业风采图片</span>
									<input type="file" id="file_uploadC" name="file_uploadC" title="点击这里上传图片" multiple>
								</span>
								<br><i>支持的图片格式为(*.jpg;*.png;*.jpeg;*.gif)</i>
								<br><i>每张图片大小不能超过5MB</i>
	                    </div>
	                </div>
	             </li>
	         </ul>

	         <ul>
	               <li style="width:100%;height:50%;text-align:center">
	                      <div id="pictures">
                           <c:forEach items="${comPictUploadList}" var="var">
								<img onerror="showImgDelay(this,'<%=basePath%>shyl/images/mylogo.jpg');" src="<%=basePath%>images/${var.path}" onclick="showOriginalPhoto('imgC${var.id}')" id="imgC${var.id}" name="imgC" style="width: 100px; padding: 1px; border: 0; background: #fff;" />
                                <a onclick="deleteLocalPicture('${var.id}')" class="delete">删除</a>
						   </c:forEach>
						  </div>
					</li>
			</ul>
			<input id="compictureUrl" name="compictureUrl" type="hidden" value='${json}' />
		</div>
        </form>
        <div class="col-sm-offset-5 col-sm-2">
           <button type="button" class="btn btn-success btn-block" onclick="sub();" id="subm"><span class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp;保存</button>
	    </div>
	</div>
</div>

<div class="modalhy fade" id="myIndustry" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" onclick="Clear()"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">请选择行业</h4>
            </div>
            <div class="modal-body">
                <ul class="list-inline xz_list">
                         <c:forEach items="${industryList}" var="industry">
			                        <li>
			                           <div class="checkbox">
			                                <label>
												<input type="checkbox" id="indu${industry.DISTINGUISH_ID}" name="Ind" value="${industry.DISTINGUISH_ID}" />${industry.VALUE}
											</label>
									    </div>
									</li>
									</c:forEach>
                </ul>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" onclick="Industrycheck()" data-dismiss="modal">确认</button>
                <button type="button" class="btn btn-default" onclick="Clear()" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<script src="<%=basePath%>shyl/js/jquery.uploadify.min.js" ></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
<script src="<%=basePath%>shyl/js/company/company.js" type="text/javascript"></script>
<script type="text/javascript">
	// 监听单选框内容是否被点击
	function radioSelect(no){
		if(no==0){
			$("#isQuoted2").removeAttr("checked");
			$("#isQuoted1").attr("checked","checked");
		}else if(no==1){
			$("#isQuoted1").removeAttr("checked");
			$("#isQuoted2").attr("checked","checked");
		}
	}
</script>

    <%@ include file="../../common/footer.jsp"%>
    <p id="back-to-top" style="display: block;"><a href="#top"><span></span></a></p>
    <div class="modal fade bs-example-modal-sm" tabindex="-1" id="layhomewarn" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="mySmallModalLabel">提示</h4>
                </div>
                <div class="modal-body">
                    <p id="warntext">请登录后操作！点此&nbsp;<a href="/account/logon?returnUrl=/mconsole/cominfo/index" class="button btn-succes"><b style="text-decoration: underline">登录</b></a></p>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    $(document).ready(function(){
		var imglogo=$("#imglogo").val();
		if(imglogo==""){
			var schoollogo=$("#imgP").attr("src");
			//$("#mypage_image img").attr("src",schoollogo);
		}else{
			$("#mypage_image img").attr("src",'<%=basePath%>images/'+imglogo);}
		});
    </script>
</body>
</html>