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
<title>机构信息_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<script src="<%=basePath%>shyl/js/jquery-1.7.2.js"></script>
<script src="<%=basePath%>shyl/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>shyl/js/jquery.min.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.min.js"></script>
<script src="<%=basePath%>shyl/js/datepicker/WdatePicker.js" type="text/javascript"></script>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/uploadify.css">
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
	<jsp:include page="../../common/left.jsp"><jsp:param value="12" name="menuType"/></jsp:include>
	<div class="mypage_right">
		<h2>机构信息</h2>
		<form action="<%=basePath%>institutionCtrl/institutionUpdate.act" class="form-horizontal" id="form1" method="post">
	    <!-- start -->
        <input type="hidden" id="result" name="result" value="${pd.result}">
        <input type="hidden" id="institutionId" name="institutionId" value="${pd.USER_ID}">
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
				<li><span>机构名称：</span><input type="text" class="inputtxt2New" value="${pd.institutions_name}" disabled></li>
				<li><span>组织机构代码：</span><input type="text" class="inputtxt2New" value="${pd.organize_code}" disabled></li>
				<li><span><small style="color: red">*</small>机构法人代表：</span><input type="text" id="ComPerson" name="ComPerson" size="50" onblur="trim(this);checkComPerson();" maxlength="50" type="text" class="inputtxt2" value="${pd.legal_representative}"></li>
			</ul>
			<ul style="width: 442px;float: left;line-height: 42px;height: 42px;margin: 17px 0;">
				<li style="height: 110px;"><span>营业执照扫描件 ：</span>
				<div class="col-sm-6">
                           <p class="pull-left">
                    	<img onerror="showImgDelay(this,'<%=basePath%>shyl/images/mylogo.jpg');" src="<%=basePath%>images/${pd.business_license}" id="imgLL" name="imgLL" style="height:160px;width: 150px; padding: 3px; background: #fff;" />
                    </p>
                    <input id="business_license" name="business_license" type="hidden" value="${pd.business_license}" />
                    <div class="pull-left" style="margin-top:-41px;width:300px;margin-left:3%">
	                    <br>
	                    <span class="fileinput-button" style="width:131px;">
							<span style="text-align:left;width:131px;background-color: #4f70c0;color:#FFFFFF;border-radius: 5px;line-height: 40px;text-align: center;font-size:15px;">上传营业执照
							</span>
							<input style="width:auto;" type="file" id="file_upload_business" name="file_upload_business" title="点击这里上传营业执照扫描件">
						</span>
						<br>
						<i>支持的图片格式为(*.jpg;*.png;*.jpeg;*.gif)</i>
                    </div>
                </div>
                </li>
			</ul>   
			<ul>
				<li><span><small style="color: red">*</small>所属行业：</span>
				      <div>
                        <a class="btnNew select_btnNew" data-toggle="modal" id="inText" data-target="#myIndustry" onclick="InChecked()"><c:if test="${pd.industryName == '' || pd.industryName == null}">请选择所属行业</c:if><c:if test="${pd.industryName != '' && pd.industryName != null}">${pd.industryName}</c:if></a>
                        <input id="inId" name="inId" type="hidden" value="${pd.industry}" />
                        <input data-val="true" data-val-required="*" id="Industry" name="Industry" type="hidden" value="${pd.industry}" />
                    </div>
                </li>
				<li><span>机构网址：</span>
                        <input class="inputtxt2" id="ComWebSite" name="ComWebSite" size="200" maxlength="200" onblur="trim(this);checkComWebSite();"placeholder="" type="text" value="${pd.website}" />
				</li>
                <li><span><small style="color: red">*</small>机构地址：</span>
                       <select class="inputtxt2" id="ProvinceId" name="ProvinceId" onchange="checkProvinceId();"><option value="">--选择省--</option>
							<c:forEach items="${provincesList}" var="provinces">
								<option value="${provinces.REGION_ID}" <c:if test="${provinces.REGION_ID == pd.address_province }">selected</c:if>>${provinces.REGION_NAME}</option>
							</c:forEach>
			         </select>
                 </li>
                <li><span><small style="color: red">*</small>注册时间：</span>
                        <input class="inputtxt2" id="RegDate" name="RegDate" onFocus="WdatePicker({isShowWeek:true});" onchange="checkRegDate();" type="text" value="${pd.registration_time}" />
                </li>
				<li><span>&nbsp;</span>
                        <select id="CityId" name="CityId" class="inputtxt2" onchange="checkCityId();">
                            <c:forEach items="${cityList}" var="cityList">
										<option value="${cityList.REGION_ID}" <c:if test="${cityList.REGION_ID == pd.address_city }">selected</c:if>>${cityList.REGION_NAME}</option>
							</c:forEach>
                        </select>
                </li>
               <li><span>机构邮编：</span>
                        <input class="inputtxt2" id="ZipCode" name="ZipCode" size="6" maxlength="6" onblur="trim(this);checkZipCode();" type="text" value="${pd.zip_code}" />
				</li>
				<li style="height: 110px;">
					<span>&nbsp;</span>
                    <textarea id="Address" name="Address" onblur="trim(this);" rows="3" placeholder="请填写详细地址" style="width: 270px;padding-left:5px;background-color:#ecf0f9;border:0;border-radius:1px;font-size:0.85em;resize:none!important;" maxlength="150" >${pd.address_detail}</textarea>
                </li>
				<li id="areali">
					<span><small style="color: red">*</small>所属机关：</span>
                    <select id="areaId" name="areaId" class="inputtxt2" onchange="checkAreaId();">
                    	<option value="">---商务局---</option>
                    	<c:forEach items="${areaList}" var="arealist">
						    <option value="${arealist.REGION_ID}" <c:if test="${arealist.REGION_ID == pd.address_area}">selected</c:if>>${arealist.REGION_NAME}商务局</option>
						</c:forEach>
                    </select>
                </li>
				
                <li><span><small style="color: red">*</small>注册资金：</span>
                        <input class="inputtxt2" id="RegCapital" name="RegCapital" size="6" maxlength="20" type="text" value="${pd.registered_capital}"/>
                 </li>
				<li><span><small style="color: red">*</small>E-mail：</span>
                        <input class="inputtxt2" onblur="trim(this);checkEmail();" id="Email" name="Email" maxlength="50" type="text" value="${pd.mail}" />
                        <span class="field-validation-valid" data-valmsg-for="Email" data-valmsg-replace="true"></span>
				</li>
			<li><span>联系人：</span>
                        <input class="inputtxt2" data-val="true" data-val-required="*" id="Contact" name="Contact" size="20" maxlength="20" onblur="trim(this);" type="text" value="${pd.contact}" />
                        <span class="field-validation-valid" data-valmsg-for="Contact" data-valmsg-replace="true"></span>
				</li>
				<li><span><small style="color: red">*</small>联系电话：</span>
                        <input class="inputtxt2" data-val="true" data-val-required="*" id="Phone" name="Phone" maxlength="20" onblur="trim(this);checkPhone();" type="text" value="${pd.contact_tel}" />
                        <span class="field-validation-valid" data-valmsg-for="Phone" data-valmsg-replace="true"></span>
				</li>
			</ul>
			<ul>
				<li style="height:120px;width: 100%;">
					<span>机构Logo：</span>                    
                        <p class="pull-left">
                                <img onerror="showImgDelay(this,'<%=basePath%>shyl/images/logo_temp.jpg');" src="<%=basePath%>images/${pd.logo}" class="upimg" id="imgP" name="imgP" style="width: 150px; padding: 3px; border: solid 1px #ccc; background: #fff;" />
                        </p>
                        <input id="pictureUrl" name="pictureUrl" type="hidden" value="${pd.logo}" />
                        <div class="pull-left" style="padding-left: 15px;">
                        <br>
                            	<span class="fileinput-button" style="width:131px;">
								<span style="text-align:left;width:131px;background-color: #4f70c0;color:#FFFFFF;border-radius: 5px;line-height: 42px;text-align: center;font-size:15px;">上传Logo图片</span>
								<input style="width:auto;" type="file" id="file_upload" name="file_upload" title="点击这里上传图片">
								</span><br><i>支持的图片格式为(*.jpg;*.png;*.jpeg;*.gif)</i>
                        </div>
				</li>
				<li style="height:180px;width: 100%;">
				     <span>学生就业情况：</span>
                        <textarea style="width:700px;padding-left:5px;background-color:#ecf0f9;border:0;border-radius:5px;font-size:0.85em;resize:none!important;" rows="4" maxlength="200" id="Employment" name="Employment">${pd.employment}</textarea>
				</li>
				<li style="height:150px;width: 100%;">
				     <span>机构介绍：</span>
                        <textarea style="width:700px;padding-left:5px;background-color:#ecf0f9;border:0;border-radius:5px;font-size:0.85em;resize:none!important;" rows="4" maxlength="65535" id="Introduction" name="Introduction">${pd.introduction_detail}</textarea>
				</li>
			</ul>
			<ul>
				<li style="height:80px;width: 100%;">
					<span>机构图片展示：</span>
					<div class="form-group">
	                    <div class="col-sm-9">
	                    	    <span class="fileinput-button">
								<span style="text-align:left;width:140px;background-color: #4f70c0;color:#FFFFFF;border-radius: 5px;line-height: 42px;text-align: center;font-size:15px;">上传机构风采图片</span>
								<input type="file" id="file_uploadC" name="file_uploadC" title="点击这里上传图片" multiple></span><br><i>支持的图片格式为(*.jpg;*.png;*.jpeg;*.gif)</i><br><i>每张图片大小不能超过5MB</i>
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
<script src="<%=basePath%>shyl/js/institution/institution.js" type="text/javascript"></script>
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
			/* $("#mypage_image img").attr("src",schoollogo); */
		}else{
			$("#mypage_image img").attr("src",'<%=basePath%>images/'+imglogo);
		}
		});
    </script>
</body>
</html>