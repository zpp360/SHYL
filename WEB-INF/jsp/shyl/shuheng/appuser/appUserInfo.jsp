<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<meta charset="utf-8" />
<title>app用户详情页面</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../../system/admin/top.jsp"%>
<link rel="stylesheet" href="shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="shyl/fileupload/css/jquery.fileupload-ui.css">
<script src="shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
<script src="shyl/fileupload/js/jquery.fileupload.js"></script>
<script src="shyl/fileupload/js/jquery.fileupload-process.js"></script>
<script src="shyl/fileupload/js/jquery.fileupload-validate.js"></script>
<script src="shyl/fileupload/js/jquery.iframe-transport.js"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<style>
.upload_img{
	float: left;width: 60%;position: relative;
}
.upload_img img{float: left;}
.upload_img a{
	position: absolute;
	left: 210px;
	top:0;
	font-size: 0.85em;
	border:0;
	background-color: #3961c2;
	color: #fff;
	padding: 0;
	width: 160px;
	text-align: center;
	height: 50px;
	line-height: 50px;
	display: inline-block;border-radius:4px;
    float: left;
    margin-top: 20px;
}
.upload_img p{
	position: absolute;
	bottom:50px;
	left: 210px;
	color: #737373;
	line-height: 30px;
	width: 60%;
	font-size: 1.1em;
	float: left;
}
.upload_img p i{
	color: #1c1c1c;font-weight: bold;
	font-size: 1.1em;
}
select, input[type="file"] {
    height: 45px;
    line-height: 30px;
}
.uploadbtn{
    position: absolute;
    top: 0;
    margin: 0;
    opacity: 0;
    -ms-filter: 'alpha(opacity=0)';
    font-size: 8px !important;
    direction: ltr;
    height: 100px;
    width: 300px;
    cursor: pointer;  
}
.a-upload {
    padding: 4px 10px;
    height: 20px;
    line-height: 20px;
    position: relative;
    cursor: pointer;
    color: #888;
    background: #fafafa;
    border: 1px solid #ddd;
    border-radius: 4px;
    overflow: hidden;
    display: inline-block;
    *display: inline;
    *zoom: 1
}
.a-upload input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
    filter: alpha(opacity=0);
    cursor: pointer
}
.upload a{
	position: absolute;
	left: 330px;
	font-size: 0.85em;
	border:0;
	background-color: #3961c2;
	color: #fff;
	padding: 0;
	width: 100px;
	text-align: center;
	height: 30px;
	line-height: 30px;
	display: inline-block;border-radius:4px;
    float: left;
    margin-left: 100px;
}
.upload p{
	bottom:50px;
	left: 100px;
	color: #737373;
	line-height: 30px;
	width: 60%;
	font-size: 1.1em;
}
</style>

</head>
<body>
<br>
	<form action="" name="Form" id="Form" method="post">
		<input type="hidden" name="url" value="${url }" />
		<div id="zhongxin">
		<input type="hidden" name="user_id" id="user_id" value="${pd.user_id }"/>
			<table class="table ">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>用户名</B></td>
					<td><input type="text" name="user_name" id="user_name" value="${pd.user_name }" maxlength="40"
						 style="height: 20px; width: 300px;" placeholder="请输入用户名" disabled="disabled"
						title="用户名" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color:#C00;padding-right: 4px;">*</span><B>民族</B>
					</td>
					<td>
						<select class="chzn-select" name="mz_code" id="mz_code" disabled="disabled" style="height: 20px; width: 315px;" >
							<c:forEach items="${selectMzList}" var="list">
								<option value="${list.mz_code}" <c:if test="${pd.user_mz==list.mz_code}">selected</c:if>>${list.mz_name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;">
						<span style="color:#C00;padding-right: 4px;">*</span><B>出生日期</B>
					</td>
					<td>
						<input name="user_birthday" id="user_birthday" value="${pd.user_birthday}" class="Wdate"  type="text" data-date-format="yyyy-mm-dd" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true,maxDate:'%y-%M-%d'});" readonly="readonly" placeholder="请选择出生日期"  title="出生日期" style=" width: 300px"/>
					</td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;">
						<span style="color:#C00;padding-right: 4px;">*</span><B>(原)职务(职级)或职称</B>
					</td>
					<td>
						<input type="text" name="user_job" id="user_job" value="${pd.user_job}" disabled="disabled" maxlength="50" style="height: 20px; width: 300px;" placeholder="请输入职务" title="职务" onblur="trimAll(this);" />	
					</td>
				</tr>
				<tr>
				<td style="width: 80px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>所属单位</B></td>
					<td><select class="chzn-select" name="user_unit" id="user_unit"  disabled="disabled"
							data-placeholder="请选择所属单位" style="height: 20px; width: 315px;" >
							<option value="">----------</option>
							<c:forEach items="${unitList}" var="list">
								<option value="${list.unit_id}" 
								<c:if test="${list.unit_id == pd.unit_id }">selected</c:if>>${list.unit_name_full}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>手机号</B></td>
					<td><input type="text" name="user_phone" id="user_phone" value="${pd.user_phone }" maxlength="11"
						 style="height: 20px; width: 300px;" placeholder="请输入手机号" disabled="disabled"
						title="手机号" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>身份证号码</B></td>
					<td><input type="text" name="user_id_number" id="user_id_number" value="${pd.user_id_number }" maxlength="18"
						 style="height: 20px; width: 300px;" placeholder="请输入身份证号码" disabled="disabled"
						title="身份证号码" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>性别</B></td>
					<td><select class="chzn-select" name="user_sex" id="user_sex" disabled="disabled"
						data-placeholder="请选择性别"  style="height: 20px; width: 315px;">
								<option value="0" <c:if test="${pd.user_sex=='0' }">selected</c:if> >男</option>
								<option value="1" <c:if test="${pd.user_sex=='1' }">selected</c:if> >女</option>
					</select></td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>类型</B></td>
					<td><select class="chzn-select" name="user_type" id="user_type" disabled="disabled"
						data-placeholder="请选择用户类型"  style="height: 20px; width: 315px;">
								<option value="">---选择用户类型---</option>
								<option value="2" <c:if test="${pd.user_type==2 }">selected</c:if>>在职</option>
								<option value="1" <c:if test="${pd.user_type==1 }">selected</c:if>>退休</option>
								<option value="0" <c:if test="${pd.user_type==0 }">selected</c:if>>离休</option>
					</select></td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>入党时间</B></td>
					<td><input class="span10 date-picker" disabled="disabled" name="user_join_party_time" id="user_join_party_time" value="${pd.user_join_party_time }"  type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="入党时间"  title="入党时间" style=" width: 300px"/></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>省</B>
					<input type="hidden" id="provinces" value="${pd.province}"/>
					</td>
					
					<td><select class="chzn-select" name="user_province" id="user_province" disabled="disabled"
						data-placeholder="请选择省"  style="height: 20px; width: 315px;">
										<option value=""></option>
										<c:forEach items="${provinceList}" var="pr">
											<option value="${pr.id }" <c:if test="${pr.id == pd.province_id}">selected</c:if>>${pr.name }</option>
										</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>市</B></td>
					<td><select class="chzn-select" name="user_city" id="user_city" disabled="disabled"
						data-placeholder="请选择市"  style="height: 20px; width: 315px;">
										 <option value=""></option>
										<c:forEach items="${citylist}" var="city">
											<option value="${city.id }" <c:if test="${city.id == pd.city_id}">selected</c:if>>${city.name }</option>
										</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>区</B></td>
					<td><select class="chzn-select" name="user_county" id="user_county" disabled="disabled"
						data-placeholder="请选择区"  style="height: 20px; width: 315px;">
										 <option value=""></option>
										<c:forEach items="${countylist}" var="ar">
											<option value="${ar.id }" <c:if test="${ar.id == pd.user_county}">selected</c:if>>${ar.name }</option>
										</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>详细地址</B></td>
					<td><input type="text" name="user_address" id="user_address" value="${pd.user_address }" maxlength="200"
						 style="height: 20px; width: 300px;" placeholder="请输入详细地址" disabled="disabled"
						title="详细地址" onblur="trim(this);" /></td>
				</tr>
				<tr>
				    <td style="width: 80px; text-align: left; padding-top: 13px;"><B>用户头像</B></td>
					<td>
					<div class="form-group" id="businessDiv">
									<div class="col-sm-2">
										<p>
											<c:if test="${empty pd.user_pic}">
                                                <img src="<%=basePath%>shyl/images/temp.png" id="uploadImgL" 
												name="uploadImgL" style="width: 248px; height: 176px;" />
                                            </c:if>
                                            <c:if test="${!empty pd.user_pic}">
                                                    <img onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="${img_host}${pd.user_pic}" id="uploadImgL" 
												name="uploadImgL" style="width: 248px; height: 176px;"/>
                                           	</c:if>
										</p>
									</div>
									<div class="col-sm-5" style="ma">
										<p>
										<span id="uploadify"></span>
										<div id="fileQueue"></div>
										<div id="file_upload-queue" class="uploadify-queue"></div>
										</p>
									</div>
						</div>
					</td>
				</tr>
				<tr>
					<td nowrap="nowrap"
						style="width: 80px; text-align: left; padding-top: 13px;"><B>用户额外信息</B></td>
					<td><textarea id="user_desc" name="user_desc" maxlength="255" readonly="readonly"
							style="min-height: 200px; margin: 0 auto; width: 80%;float:left" 
							title="额外信息">${pd.user_desc }</textarea></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		<div align="center" style="margin-top: 10px;">
			<c:if test="${regist_check}">
				<a class="btn  btn-success" onclick="registCheck()"><i class=" icon-circle-arrow-left"></i>审核通过</a>
				<a class="btn  btn-danger" onclick="sendBack()"><i class=" icon-circle-arrow-left"></i>退回</a>
			</c:if>
			<a class="btn  btn-light" onclick="returnback()"><i class=" icon-circle-arrow-left"></i>返回</a>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="<%=basePath%>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	<!-- 引入 -->
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript"
		src="static/js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->

	<!-- 日期框 -->
	<!-- 富文本编辑器start -->
	<!-- 配置文件 -->
	<script type="text/javascript" src="plugins/ueditor/ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript" src="plugins/ueditor/ueditor.all.js"></script>
	<!-- 实例化编辑器 -->
	<script type="text/javascript">
		var ue = UE.getEditor("user_desc", {readonly:true});
		//ueditor有标签文本

		function getContent() {
			var arr = [];
			arr.push(UE.getEditor('user_desc').getContent());
			return arr.join("");
		}

		function clean() {
			ue.setContent("");
		}

		function setFocus() {
			UE.getEditor('user_desc').focus();
		}
		
		$(function(){
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			//日期框
			$('.date-picker').datepicker();
			$('.date-picker1').datepicker({
				 language:  'zh-CN',
		            format: 'yyyy-mm',
		            weekStart: 1,
		            todayBtn:  'linked',
		            autoclose: 1,
		            todayHighlight: 1,
		            minViewMode: 'months', //这里就设置了默认视图为年视图
		            minView: 3, //设置最小视图为年视图
		            forceParse: 0
			});
		});
	</script>
	<!-- 富文本编辑器end -->

	<script type="text/javascript">
	 function returnback(){
		var url = $("input[name='url']").val();
	    window.location.href="<%=basePath%>appuser/list.do"+url;
	 }
	 //审核通过
	 function registCheck(){
		 if ($("#user_name").val() == "") {
				$("#user_name").tips({
					side : 3,
					msg : '请输入用户名',
					bg : '#FF5080',
					time : 2
				});
				$("#user_name").focus();
				return false;
			}
			if ($("#user_phone").val() == "") {
				$("#user_phone").tips({
					side : 3,
					msg : '请输入手机号',
					bg : '#FF5080',
					time : 2
				});
				$("#user_phone").focus();
				return false;
			}
			if ($("#user_unit").val() == "") {
				$("#user_unit").tips({
					side : 3,
					msg : '请选择单位单位',
					bg : '#FF5080',
					time : 2
				});
				$("#user_unit").focus();
				return false;
			}
		 
		 $("#Form").attr("action","<%=basePath%>appuser/registCheck.do")
		 $("#Form").submit();
	 }
	 
	 function sendBack(){
		 var url = $("input[name='url']").val();
		 var user_id = $("#user_id").val();
		 
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="审核意见";
		 diag.URL = dialogPath+'appuser/toCheckIdea.do?check_type=2&user_id=0'+user_id;
		 diag.Width = 400;
		 diag.Height = 200;
		 diag.CancelEvent = function(){ //关闭事件
			 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					top.jzts(); 
					setTimeout("backToList()",100);
				}
			diag.close();
		 };
		 diag.show();
	 }
	 //返回列表页 
	 function backToList(){
		 location.href="<%=basePath%>appuser/list.do${url}";
	 }
</script>


</body>
</html>