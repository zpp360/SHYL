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
<html>
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>需求管理_济南市服务外包公共服务平台</title>
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link rel="stylesheet" href="shyl/css/styleRegist.css">
<jsp:include page="../common/header.jsp"></jsp:include>
<script src="<%=basePath%>shyl/js/jquery-1.7.2.js" type="text/javascript"></script>
<!--引入表单验证start-->
<script src="<%=basePath%>shyl/js/bootstrap.min.js"></script>
<script src="<%=basePath%>shyl/js/jquery.validate.js"></script>
<!--引入表单验证end-->
<script src="<%=basePath%>shyl/js/mainjs/box.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<script src="<%=basePath%>shyl/js/datepicker/WdatePicker.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/scroll.js"></script>
<style type="text/css">
.textareatxt2{
	background-color: #f7f7f7 !important ;
}
.edui-default .edui-editor {
	background-color: #ecf0f9;
}

.modal {
	z-index: 10176524 !important;
}
div.inputtxt2 {
    width: 275px;
    float: left;
}
div.inputtxt2 b{
    float: right;
    margin-top: 20px;
    margin-right: 7px;
}
a:hover, a:focus {
  color:inherit;
}
* {
    box-sizing: content-box;
}
.modal-dialog {
    margin: 150px auto !important ;
}
.select_btnNew {
display: inline-block;
margin-bottom: 0;
font-size: 14px;
line-height: 42px;
color: #333;
text-align: center;
text-shadow: 0 1px 1px rgba(255,255,255,0.75);
vertical-align: middle;
cursor: pointer;
background-color: #f5f5f5;
background-repeat: repeat-x;
border: 1px solid #ccc;
border-color: #e6e6e6 #e6e6e6 #bfbfbf;
border-color: rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);
border-bottom-color: #b3b3b3;
-webkit-border-radius: 4px;
-moz-border-radius: 4px;
border-radius: 4px;
filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff',endColorstr='#ffe6e6e6',GradientType=0);
filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
-webkit-box-shadow: inset 0 1px 0 rgba(255,255,255,0.2),0 1px 2px rgba(0,0,0,0.05);
-moz-box-shadow: inset 0 1px 0 rgba(255,255,255,0.2),0 1px 2px rgba(0,0,0,0.05);
box-shadow: inset 0 1px 0 rgba(255,255,255,0.2),0 1px 2px rgba(0,0,0,0.05);
}
.btnNew {
float:left; margin-top:5px; width:80%;
}
</style>

</head>
<body style="background-color: #f7f7f7;">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../common/left.jsp"><jsp:param value="7" name="menuType"/></jsp:include>
		<div class="mypage_right">
			<h2>需求管理/人员需求修改</h2>
			<div class="mypage_tab">				
				<div class="bd">					
					<ul>
						<div class="inputmodify">
						<div class="input_class" style="margin-bottom: 100px;">
							<form action="<%=basePath%>requirement/updatePersonelRequirement.act?personnel_id=${pd.personnel_id}" class="form-horizontal" id="personelForm" method="post" role="form">
								<ul style="margin-bottom: 20px;">
									<li style="width: 800px;">
										<span><small style="color:red">*</small>&nbsp;人员需求标题：</span>
										<input type="text" class="inputtxt2" id="titleu" style="width: 600px;" value="${pd.personnel_title}"  maxlength="100" name="personnel_title" onblur="trim(this);">
									</li>
									<li style="width: 100%;">
											<span>IT技能：</span>
											<div>
                        						<a class="btnNew select_btnNew" style="margin-top: 0px;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" data-toggle="modal" id="inText" data-target="#myIndustry" onclick="InChecked()">
                        							<c:if test="${pd.requirementName == '' || pd.requirementName == null}">请选择IT技能&nbsp;<b class="caret"></b></c:if>
                        							<c:if test="${pd.requirementName != '' && pd.requirementName != null}">${pd.requirementName}</c:if>
	                        					</a>
                        						<input id="intd" name="intd" type="hidden" value="${pd.it_skill_1},${pd.it_skill_2},${pd.it_skill_3},${pd.it_skill_4},${pd.it_skill_5}" />
                        						<input data-val="true" data-val-required="*" id="Industry" name="Industry" type="hidden" value="${pd.it_skill_1},${pd.it_skill_2},${pd.it_skill_3},${pd.it_skill_4},${pd.it_skill_5}" />
                    						</div>                 
										</li>
										<li style="width: 100%;">
											<span>行业知识：</span>
											<div>
	                        					<a class="btnNew select_btnNew" style="margin-top: 0px;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" data-toggle="modal" id="inIndustryKnowledge" data-target="#myIndustryKnowledge" onclick="InCheckedP()">
	                        						<c:if test="${pd.knowledgeName == '' || pd.knowledgeName == null}">请选择行业知识&nbsp;<b class="caret"></b></c:if>
                        							<c:if test="${pd.knowledgeName != '' && pd.knowledgeName != null}">${pd.knowledgeName}</c:if>
	                        					</a>
	                        					<input id="inId" name="inId" type="hidden" value="${pd.industry_knowledge_1},${pd.industry_knowledge_2},${pd.industry_knowledge_3},${pd.industry_knowledge_4},${pd.industry_knowledge_5}" />
	                        					<input data-val="true" data-val-required="*" id="IndustryP" name="IndustryP" type="hidden" 
	                        					value="${pd.industry_knowledge_1},${pd.industry_knowledge_2},${pd.industry_knowledge_3},${pd.industry_knowledge_4},${pd.industry_knowledge_5}" />
	                    					</div>
										</li>
									<li style="width: 800px;">
										<span><small style="color:red">*</small>&nbsp;可竞标数：</span>
										<input type="text" class="inputtxt2" id="bid_countu" onkeyup="value=value.replace(/[^0-9]/g,'')" maxlength="2" name="bid_countu" value="${pd.bid_count}" onblur="delZero(this);" style="ime-mode:disabled">
									</li>
									<li>
										<span>语言要求：</span>
										<select class="inputtxt2" id="languageLevel" name="language_level" style="height: 30px;">
											<option value="">--请选择--</option>
											<c:forEach items="${languageList}" var="languageLevel">
												<option value="${languageLevel.DISTINGUISH_ID}" 
												<c:if test="${languageLevel.DISTINGUISH_ID == pd.language_level }">selected</c:if>>${languageLevel.VALUE}</option>
											</c:forEach>
										</select>												
									</li>
									<li>
										<span><small style="color:red">*</small>&nbsp;需求人数：</span>
										<input type="text" class="inputtxt2" id="requirement_personel_count" maxlength="4" name="requirement_personel_count" onkeyup="value=value.replace(/[^0-9]/g,'')" onblur="delZero(this);"
										value="${pd.requirement_personel_count}" style="ime-mode:disabled">
									</li>
									<li>
										<span>读写能力：</span>
										<select class="inputtxt2" id="literacy" name="literacy" style="height: 30px;">
											<option value="">--请选择--</option>
											<c:forEach items="${skillKbnList}" var="literacy">
												<option value="${literacy.DISTINGUISH_ID}"
												<c:if test="${literacy.DISTINGUISH_ID == pd.literacy }">selected</c:if>>${literacy.VALUE}</option>
											</c:forEach>
										</select>
									</li>
									<li>
										<span>听说能力：</span>	
										<select class="inputtxt2" id="speaking_skills" name="speaking_skills" style="height: 30px;">
											<option value="">--请选择--</option>
											<c:forEach items="${skillKbnList}" var="speakingSkills">
												<option value="${speakingSkills.DISTINGUISH_ID}"
												<c:if test="${speakingSkills.DISTINGUISH_ID == pd.speaking_skills }">selected</c:if>>${speakingSkills.VALUE}</option>
											</c:forEach>
										</select>
									</li>	
									<li>
										<span><small style="color:red">*</small>&nbsp;需求有效期：</span>
										<input class="inputtxt2" id="validity_periodu" name="validity_periodu" onFocus="WdatePicker({isShowWeek:true});" 
										 type="text" value="${pd.validity_period}" />
									</li>
									<li>
										<span><small style="color:red">*</small>&nbsp;项目周期(月)：</span>
										<input type="text" class="inputtxt2" id="project_monthu"  onkeyup="value=value.replace(/[^0-9]/g,'')" maxlength="3" name="project_monthu" value="${pd.project_month}" onblur="delZero(this);" style="ime-mode:disabled">
									</li>	
									<li>
										<span>承包方省份：</span>
										<select class="inputtxt2" id="contractor_province" name="contractor_province" style="height: 30px;">
											<option value="">--选择省--</option>
											<c:forEach items="${provincesList}" var="provinces">
												<option value="${provinces.REGION_ID}"
												<c:if test="${provinces.REGION_ID == pd.contractor_province }">selected</c:if>>${provinces.REGION_NAME}</option>
											</c:forEach>
										</select>
									</li>
									<li>
										<span>承包方城市：</span>
										<select class="inputtxt2" id="contractor_city" name="contractor_city" style="height: 30px;">
											<option value="">--选择市--</option>
											<c:forEach items="${cityList}" var="city">
												<option value="${city.REGION_ID}"
												<c:if test="${city.REGION_ID == pd.contractor_city }">selected</c:if>>${city.REGION_NAME}</option>
											</c:forEach>
										</select>
									</li>
									<li>
										<span><small style="color:red">*</small>&nbsp;联系人：</span>
										<input type="text" class="inputtxt2" id="contactu" maxlength="50" name="contactu" value="${pd.contact}" onblur="trim(this);">
									</li>
									<li>
			                			<label for ="sex1">
			                				<input type="radio" id="sex1" name="sex" value="0" 
			                				<c:if test="${pd.sex == 0 || pd.sex == '' || pd.sex == null}">checked</c:if>>&nbsp;<i>先生</i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                			</label>
			                			<label for ="sex2">
				                			<input type="radio" id="sex2" name="sex" value="1" 
				                			<c:if test="${pd.sex == 1}">checked</c:if>>&nbsp;<i>女士</i>
				                		</label>
                        			</li>
									<li>
										<span><small style="color:red">*</small>&nbsp;联系方式：</span>
										<input type="text" class="inputtxt2" id="contact_telu" maxlength="20" name="contact_telu" value="${pd.contact_tel}" onblur="trim(this);">
									</li>
									<li>
										<span><small style="color:red">*</small>&nbsp;Email：</span>
										<input type="text" class="inputtxt2" id="emailu" maxlength="50" name="emailu" value="${pd.email}" onblur="trim(this);">
									</li>
									<li style="height:260px;width: 100%;">
										<span>详细描述：</span>
										<textarea id="personelDescription" name="detail_descriptionu" class="textareatxt2" style=" float: left;height:160px; " maxlength="500" onblur="trim(this);">${pd.detail_description}</textarea>
									</li>
									<li style="width: 100%;">
										<span>上传附件:<br/>（50M以内）</span>
										<div class="form-group">											
											<table>
												<tr>
													<td><input type="text" class="inputtxt2" id="docName" name="docName" style="width: 550px;" value="${pd.appendix_name}" readonly>&nbsp;</td>
													<td colspan="1" id="fileDiv">
														<span id="file_uploadp" class="btn btn-primary fileinput-button" style="background-color: #738fd4;border-color:#738fd4 "> 
															<span style="text-align: center;">上传本地文档</span>
															<input type="file" id="file_upload" name="file_upload" multiple>
															<input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="appendix_path" maxlength="500" name="appendix_path" type="text" value="${pd.appendix_path}" onblur="trim(this);" />
															<input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="appendix_name" maxlength="500" name="appendix_name" type="text" value="${pd.appendix_name}" onblur="trim(this);" />
														</span>
													</td>
												</tr>
													<tr>
														<td>
															<p  style="font-size:12px" class="style1">支持的文件格式为.doc/.docx/.xls/.xlsx/.pdf/.txt/.jpg</p>
														</td>
													</tr>
											</table>																										                  
						                </div>																		
									</li>
								</ul>
							</form>
						    <div class="form-group">
								<div class="col-sm-2 col-sm-offset-2" style="margin-top: 40px;">
									<button type="button" onclick="savepersonelForm();"
										class="btn btn-success btn-block">
										<span class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp;发布
									</button>
								</div>
								<div style="width: 20px;"></div>
								<div class="col-sm-2" style="margin-top: 40px; margin-left: 20px;">
									<a onclick="GO();" class="btn btn-default btn-block"><span
										class="glyphicon glyphicon-circle-arrow-left"></span>&nbsp;&nbsp;返回</a>
								</div>
							</div>
						</div>
						</div>
					</ul>
				</div>
			</div>
			<!-- IT技能 -->
	<div class="modal fade in" id="myIndustry" tabindex="-1" 
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	    <div class="modal-dialog modal-lg">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" onclick="Clear()">
	                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	                <h4 class="modal-title" id="myModalLabel">请选择IT要求</h4>
	            </div>
	            <div class="modal-body" style="font-size: 13px;">
	                <ul class="list-inline xz_list">
	          			<c:forEach items="${itList}" var="it">
				       		<li>
				             	<div class="checkbox">
				               		<label>
										<input type="checkbox" id="dd_${it.DISTINGUISH_ID}" 
										name="Itd" value="${it.DISTINGUISH_ID}" />${it.VALUE}
									</label>
								</div>
							</li>
						</c:forEach>
	                </ul>
	                <span style="color:#f00;font-size:12px">(最多只能选择5个选项)</span>
	            </div>
	            <div class="modal-footer">	
	                <button type="button" class="btn btn-success" onclick="Industrycheck()" data-dismiss="modal">确认</button>
	                <button type="button" class="btn btn-default" onclick="Clear()" data-dismiss="modal">关闭</button>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- 行业知识 -->
	<div class="modal fade in" id="myIndustryKnowledge" tabindex="-1" 
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	    <div class="modal-dialog modal-lg">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" onclick="Clear()">
	                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	                <h4 class="modal-title" id="myModalLabel">请选择行业知识要求</h4>
	            </div>
	            <div class="modal-body" style="font-size: 13px;">
	                <ul class="list-inline xz_list">
	          			<c:forEach items="${industryKnowledgeList}" var="industryKnowledge">
				    		<li>
				    			<div class="checkbox">
				              		<label>
										<input type="checkbox" id="bb_${industryKnowledge.DISTINGUISH_ID}" 
										name="Ind" value="${industryKnowledge.DISTINGUISH_ID}" />${industryKnowledge.VALUE}
									</label>
								</div>
							</li>
						</c:forEach>
	                </ul>
	                <span style="color:#f00;font-size:12px">(最多只能选择5个选项)</span>
	            </div>
	            <div class="modal-footer">	
	                <button type="button" class="btn btn-success" onclick="IndustrycheckP()" data-dismiss="modal">确认</button>
	                <button type="button" class="btn btn-default" onclick="ClearP()" data-dismiss="modal">关闭</button>
	            </div>
	        </div>
	    </div>
	</div>
			<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
			<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
			<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
			<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
			<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
			<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
			<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
			<script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
			<!--引入弹窗组件start-->
			<script type="text/javascript" src="<%=basePath%>plugins/attention/zDialog/zDrag.js"></script>
			<script type="text/javascript" src="<%=basePath%>plugins/attention/zDialog/zDialog.js"></script>
			<script type="text/javascript" src="<%=basePath%>plugins/ueditor/ueditor.config.js"></script>
			<script type="text/javascript" src="<%=basePath%>plugins/ueditor/ueditor.all.js"></script>
			<!-- 实例化编辑器 -->
			<script type="text/javascript">
				var ue = UE.getEditor("personelDescription",{
					autoHeightEnabled: false
					});
		
		
				function getContent() {
					var arr = [];
					arr.push(UE.getEditor('personelDescription').getContent());
					return arr.join("");
				}
		
				function clean() {
					ue.setContent("");
				}
		
				function setFocus() {
					UE.getEditor('personelDescription').focus();
				}										
			</script>
			<script id="jsID" type="text/javascript">
			 	var ary = location.href.split("&");
				jQuery(".mypage_tab").slide( { 
					effect:"fade",autoPlay:"false",
					trigger:"click",easing:"swing",
					delayTime:"500",pnLoop:"true" 
				});
				
				// 返回
			    function GO() {
			        location.href = '<%=basePath%>requirement/toPersonalRequirement.act?';
				}
				
				function savepersonelForm(){
					if(isOneSubmitPersonel()){
						$("#personelForm").submit();
					}
				}
				
				function isOneSubmitPersonel(){
					// 人员需求标题验证
					var titleu = $("#titleu").val();
			        if (titleu == "") {
						$("#titleu").tips({
							side : 2,
							msg : '请输入人员需求标题',
							bg : '#AE81FF',
							time : 3
						});
						$("#titleu").focus();
						return false;
					}
					// 可竞标数验证
					if ($("#bid_countu").val() == "") {
						$("#bid_countu").tips({
							side : 2,
							msg : '请输入可竞标数',
							bg : '#AE81FF',
							time : 3
						});
						$("#bid_countu").focus();
						return false;
					}else{
						if ($("#bid_countu").val() == "0") {
							$("#bid_countu").tips({
								side : 2,
								msg : '可竞标数必须大于0',
								bg : '#AE81FF',
								time : 3
							});
							$("#bid_countu").focus();
							return false;
						}
					}
					// 需求人数验证
					if ($("#requirement_personel_count").val() == "") {
						$("#requirement_personel_count").tips({
							side : 2,
							msg : '请输入需求人数',
							bg : '#AE81FF',
							time : 3
						});
						$("#requirement_personel_count").focus();
						return false;
					}else{
							if ($("#requirement_personel_count").val() == "0") {
								$("#requirement_personel_count").tips({
									side : 2,
									msg : '需求人数必须大于0',
									bg : '#AE81FF',
									time : 3
								});
								$("#requirement_personel_count").focus();
								return false;
							}
						}

					//获取当前日期
					var date = new Date();
			        var seperator1 = "-";
			        var year = date.getFullYear();
			        var month = date.getMonth() + 1;
			        var strDate = date.getDate();
			        if (month >= 1 && month <= 9) {
			            month = "0" + month;
			        }
			        if (strDate >= 0 && strDate <= 9) {
			            strDate = "0" + strDate;
			        }
			        var currentdate = year + seperator1 + month + seperator1 + strDate;
					var validity_period = $("#validity_periodu").val();
					// 需求有效期验证
					if ($("#validity_periodu").val() == "") {
						$("#validity_periodu").tips({
							side : 2,
							msg : '请输入需求有效期',
							bg : '#AE81FF',
							time : 3
						});
						$("#validity_periodu").focus();
						return false;
					}
					//需求有效期和当前日期比较
					if(validity_period.length>0&&currentdate.length>0){
			    		if(validity_period<currentdate){
				    		$("#validity_periodu").tips({
				    			side : 2,
				    			msg : '需求有效期不能小于当前日期',
				    			bg : '#AE81FF',
				    			time : 3
				    		});
				    		$("#validity_periodu").focus();
				    		return false;		
			    		}
			    	}
					// 项目周期验证
					if ($("#project_monthu").val() == "") {
						$("#project_monthu").tips({
							side : 2,
							msg : '请输入项目周期',
							bg : '#AE81FF',
							time : 3
						});
						$("#project_monthu").focus();
						return false;
					}else{
						if ($("#project_monthu").val() == "0") {
							$("#project_monthu").tips({
								side : 2,
								msg : '项目周期必须大于0',
								bg : '#AE81FF',
								time : 3
							});
							$("#project_monthu").focus();
							return false;
						}
					}

					// 联系人验证
					var contactu = $("#contactu").val();
			        if (contactu == "") {
						$("#contactu").tips({
							side : 2,
							msg : '请输入联系人',
							bg : '#AE81FF',
							time : 3
						});
						$("#contactu").focus();
						return false;
					}
					// 联系人方式验证
					var contact_tel = $("#contact_telu").val();
					var Filter = /(^([048][0-9]{2,3}\-)+([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$)|(^((\(\d{3}\))|(\d{3}\-))?(1[34578]\d{9})$)/;
					if (contact_tel == "") {
						$("#contact_telu").tips({
							side : 2,
							msg : '请输入联系方式',
							bg : '#AE81FF',
							time : 3
						});
						$("#contact_telu").focus();
						return false;
					} else if(!(Filter.test(contact_tel))) {
						$("#contact_telu").tips({
							side : 2,
							msg : '请输入正确的联系方式格式',
							bg : '#AE81FF',
							time : 3
						});
						$("#contact_telu").focus();
						return false;
					}
					// Email验证
					var email = $("#emailu").val();
					var EmailFilter = /^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT)$/;
					if (email == "") {
						$("#emailu").tips({
							side : 2,
							msg : '请输入Email',
							bg : '#AE81FF',
							time : 3
						});
						$("#emailu").focus();
						return false;
					} else if (!(EmailFilter.test(email))) {
						$("#emailu").tips({
							side : 2,
							msg : '请输入正确的Email格式',
							bg : '#AE81FF',
							time : 3
						});
						$("#emailu").focus();
						return false;
					}
					return true;
				}
				
				$(function () {
				    $("#contractor_province").change(function () { BindCId(); });				    
				})
				
				function BindCId() {
					var PID = $("#contractor_province").val();
			    	$("#contractor_city").find('option').remove();
			    	if (PID == "") {
				        $("<option value=''>---选择市---</option>").appendTo("#contractor_city");
				    }else{
				     $.post('<%=basePath%>joblist/cityList.act', {
						'PID' : PID
					}, function(data) {
						$.each(data.cityList, function(i, list) {
						$("<option value='" + list.REGION_ID + "'>"+ list.REGION_NAME + "</option>").appendTo("#contractor_city");
						});
					});
				    }
					$("#contractor_city").val('');
				}
				
				//人员需求-获取IT需求选中值
				function Industrycheck() {
					 var relateIds = "";
				 	 var texts = "";
				 	 $("input[name='Itd']:checked").each(function() {
				 		 relateIds += $(this).attr('value') + ",";
				 	 });//得到选中复选框的value
				 	 relateIds = relateIds.substring(0, relateIds.length - 1);

				 	 $("input[name='Itd']:checked").each(function() {
				 		 texts += $.trim($(this).parent().text()) + ',';
				 	 });//得到选中复选框的text 
				 	 if (texts.length > 180) {
				 		 texts = texts.substring(0, 180) + "....";
				 	 } else {
				 		 texts = texts.substring(0, texts.length - 1);
				 	 }
				 	 if (texts == "") {
				 		 $("#inText").text("请选择IT要求");
				 		 $("#inText").append('&nbsp;<b class="caret"></b>')
				 		 $("#Industry").val("");
				 		 $("#intd").val("");
				 	 } else {
				 		 $("#inText").text(texts);
				 		 $("#intd").val(relateIds);
				 		 $("#Industry").val(texts);
				 	 }
				 	 $("[name='Itd']").removeAttr("checked");//取消全选
				  }
				  //控制用户最多只能选择5个checkbox选项
				  $("[name='Itd']").bind("click", function() {
					  var n = $("input[name='Itd']:checked").length;
				 	  if (n >= 5) {
				 		  $("[name='Itd']").each(function() {
				 			  if (!$(this).is(":checked")) {
				 				  $(this).attr("disabled", true);
				 			  }
				 		  });
				 	  } else {
				 		  $("[name='Itd']").each(function() {
				 			  $(this).attr("disabled", false);
				 		  });
				 	  }
				  })
				  function Clear() {
					  //IT
				 	  $("[name='Itd']").removeAttr("checked");//取消全选
				 	  $("[name='Itd']").each(function() {
				 		  $(this).attr("disabled", false);
				 	  });
				  }
				  //checkbox反选
				  function InChecked() {
					  // IT
				 	  if ($("#intd").val() != "") {
				 		  var st = $("#intd").val();
				 		  var cklist = st.split(',');
				 		  for (var i = 0; i < cklist.length; i++) {
				 			  var cid = cklist[i];
				 			  document.getElementById("dd_" +cid).checked = true;
				 		  }
				 		  if ($("input[name='Itd']:checked").length >= 5) {
				 			  $("[name='Itd']").each(function() {
				 				  if (!$(this).is(":checked")) {
				 					  $(this).attr("disabled", true);
				 				  }
				 			  });
				 		  }
				 	  }
				 }
				 
				 //人员需求-获取行业知识选中值
				 function IndustrycheckP() {
					 var relateIds = "";
					 var texts = "";
					 $("input[name='Ind']:checked").each(function() {
						 relateIds += $(this).attr('value') + ",";
					 });//得到选中复选框的value
					 relateIds = relateIds.substring(0, relateIds.length - 1);

					 $("input[name='Ind']:checked").each(function() {
					 	 texts += $.trim($(this).parent().text()) + ',';
					 });//得到选中复选框的text 
					 if (texts.length > 150) {
					 	 texts = texts.substring(0, 150) + "....";
					 } else {
					 	 texts = texts.substring(0, texts.length - 1);
					 }
					 if (texts == "") {
					 	 $("#inIndustryKnowledge").text("请选择行业知识要求");
					 	 $("#inIndustryKnowledge").append('&nbsp;<b class="caret"></b>')
					 	 $("#IndustryP").val("");
					 	 $("#inId").val("");
					 } else {
					 	 $("#inIndustryKnowledge").text(texts);
					 	 $("#inId").val(relateIds);
					 	 $("#IndustryP").val(texts);
					 }
					 $("[name='Ind']").removeAttr("checked");//取消全选
			     }
					 //控制用户最多只能选择5个checkbox选项
				 $("[name='Ind']").bind("click", function() {
					 var n = $("input[name='Ind']:checked").length;
					 if (n >= 5) {
						 $("[name='Ind']").each(function() {
							 if (!$(this).is(":checked")) {
								 $(this).attr("disabled", true);
					 		 }
					 	 });
					 } else {
						 $("[name='Ind']").each(function() {
							 $(this).attr("disabled", false);
					 	 });
					 }
				 })
				 function ClearP() {
						 //行业
					 	$("[name='Ind']").removeAttr("checked");//取消全选
					 	$("[name='Ind']").each(function() {
					 		$(this).attr("disabled", false);
					 	});
				 }
					 //checkbox反选
					 function InCheckedP() {
					 	// 行业
					 	if ($("#inId").val() != "") {
					 		var st = $("#inId").val();
					 		var cklist = st.split(',');
					 		for (var i = 0; i < cklist.length; i++) {
					 			var cid = cklist[i];
					 			document.getElementById("bb_"+cid).checked = true;
					 		}
					 		if ($("input[name='Ind']:checked").length >= 5) {
					 			$("[name='Ind']").each(function() {
					 				if (!$(this).is(":checked")) {
					 					$(this).attr("disabled", true);
					 				}
					 			});
					 		}
					 	}
					 }
			</script>
		</div>
	</div>
	<div class="clear"></div>
	<!--<footer开始>-->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!--</footer结束>-->
	<script type="text/javascript">
	$("#file_upload").fileupload({
		 dataType :'iframe text',
		 autoUpload: true,
		 maxFileSize: 50000000,
		 maxNumberOfFiles : 1,
        url: '<%=basePath%>requirement/upload.act',
        sequentialUploads: true
	 }).bind('fileuploadchange', function (e, data) {
		 if(data.files.length > 1){
			 $("#fileDiv").tips({
					side : 2,
					msg : '只能上传一个文件。',
					bg : '#AE81FF',
					time : 3
				});
            return false;
		 }
    }).bind('fileuploaddone', function (e, data) {
   	 if("no"==data.result){
   		 $("#fileDiv").tips({
					side : 2,
					msg : '请上传格式为.doc/.docx/.xls/.xlsx/.pdf/.txt/.jpg的文件。',
					bg : '#AE81FF',
					time : 3
			});
   	 } else if("nosize"==data.result){
		 $("#fileDiv").tips({
				side : 2,
				msg : '请上传文件大小在50M以内的文件。',
				bg : '#AE81FF',
				time : 3
			});
	 } else {
   		 $("#appendix_path").val(data.result);
   		 $("#appendix_name").val(data.originalFiles[0].name);
   		 $("#docName").val(data.originalFiles[0].name);
   	 }
    });
	</script>
</body>
</html>