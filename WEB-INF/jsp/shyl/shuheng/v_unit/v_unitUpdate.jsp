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
<title>志愿者需求单位修改</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../../system/admin/top.jsp"%>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<!-- 日期框 -->
<script type="text/javascript">
	//保存
	function save() {
		if ($("#unit_name").val() == "") {
			$("#unit_name").tips({
				side : 3,
				msg : '请输入需求单位名称',
				bg : '#FF5080',
				time : 2
			});
			$("#unit_name").focus();
			return false;
		}
		
		var flag = false;
		$.ajax({
			type : "POST",
			url : "<%=basePath%>volunteerUnit/nameExit.do?tm=" + new Date().getTime(),
			dataType : "text",
			cache : false,
			async:false, 
			data :{unit_name:$.trim($("#unit_name").val()),unit_id:$("#unit_id").val()},
			success:function(data){
				if(data == "fail"){
					flag = true;
				}
			}
		});
		if(flag){
			$("#unit_name").tips({
				side : 3,
				msg : '组织名称已存在',
				bg : '#FF5080',
				time : 2
			});
			$("#unit_name").focus();
			return false;
		}
		if($("#unit_province").val()==null || $("#unit_province").val()==''){
			$("#unit_province").tips({
				side : 3,
				msg : '请选择省',
				bg : '#FF5080',
				time : 2
			});
			return false;
		}
		
			if ($("#unit_city").val() == "") {
				$("#unit_city").tips({
					side : 3,
					msg : '请选择市',
					bg : '#FF5080',
					time : 2
				});
				return false;
			}
				if ($("#unit_county").val() == "") {
					$("#unit_county").tips({
						side : 3,
						msg : '请选择区',
						bg : '#FF5080',
						time : 2
					});
					return false;
				}
		if ($("#belong_unit_id").val() == "") {
			$("#belong_unit_id").tips({
				side : 3,
				msg : '请选择主管单位',
				bg : '#FF5080',
				time : 2
			});
			$("#belong_unit_id").focus();
			return false;
		}
		if ($("#unit_time").val() == "") {
			$("#unit_time").tips({
				side : 3,
				msg : '请输入成立时间',
				bg : '#FF5080',
				time : 2
			});
			$("#unit_time").focus();
			return false;
		}
		
		if ($("#unit_linkman").val() == "") {
			$("#unit_linkman").tips({
				side : 3,
				msg : '请输入联系人',
				bg : '#FF5080',
				time : 2
			});
			$("#unit_linkman").focus();
			return false;
		}
		
		var phone = $("#unit_phone").val();
		if (phone == "") {
			$("#unit_phone").tips({
				side : 3,
				msg : '请输入联系方式',
				bg : '#FF5080',
				time : 2
			});
			$("#unit_phone").focus();
			return false;
		}else{
			//手机号或者固话
			var reg =  /^(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$/;
			if(!reg.test(phone)){
				$("#unit_phone").tips({
					side : 3,
					msg : '电话格式错误',
					bg : '#FF5080',
					time : 2
				});
				$("#unit_phone").focus();
				return false;
			}
		}
		var idcard = $("#unit_idcard").val();
		if(idcard != null && idcard != ""){
			var reg = /^(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)$/;
			if(!reg.test(idcard)){
				$("#unit_idcard").tips({
					side : 3,
					msg : '身份证号格式错误',
					bg : '#FF5080',
					time : 2
				});
				$("#unit_idcard").focus();
				return false;
			}
		}
		var email = $("#unit_email").val();
		if(email != null && email != ""){
			var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
			if(!reg.test(email)){
				$("#unit_email").tips({
					side : 3,
					msg : 'Email格式错误',
					bg : '#FF5080',
					time : 2
				});
				$("#unit_email").focus();
				return false;
			}
		}
		
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
</script>
</head>
<body>
<br>
	<form action="<%=basePath%>volunteerUnit/update.do" name="Form" id="Form" method="post">
		<input type="hidden" name="unit_id" id="unit_id" value="${pd.unit_id }" />
		<div id="zhongxin">
			<table class="table ">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>组织名称</B></td>
					<td><input type="text" name="unit_name" id="unit_name" value="${pd.unit_name}" maxlength="40"
						 style="height: 20px; width: 300px;" placeholder="请输入需求单位名称"
						title="需求单位名称" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
					<span style="color:#C00;padding-right: 4px;">*</span><B>省</B>
					<input type="hidden" id="provinces" value="${pd.province_id}"/>
					</td>
					<td>
						<select class="chzn-select" name="unit_province" id="unit_province" data-placeholder="请选择省"  style="height: 20px; width: 315px;">
							<option value=""></option>
							<c:forEach items="${provincelist}" var="pr">
								<option value="${pr.id }" <c:if test="${pr.id == pd.province_id}">selected</c:if>>${pr.name }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
					<span style="color:#C00;padding-right: 4px;">*</span><B>市</B></td>
					<td>
						<c:if test="${not empty citylist}">
							<select class="chzn-select" name="unit_city" id="unit_city" data-placeholder="请选择市"  style="height: 20px; width: 315px;">
								<option value=""></option>
								<c:forEach items="${citylist}" var="city">
									<option value="${city.id }" <c:if test="${city.id == pd.city_id}">selected</c:if>>${city.name }</option>
								</c:forEach>
							</select>
						</c:if>
						<c:if test="${empty citylist}">
							<select class="chzn-select" name="unit_city" id="unit_city" data-placeholder="请选择市"  style="height: 20px; width: 315px;">
								<option value=""></option>
							</select>
						</c:if>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
					<span style="color:#C00;padding-right: 4px;">*</span><B>区</B></td>
					<td>
						<c:if test="${not empty countylist}">
							<select class="chzn-select" name="unit_county" id="unit_county" data-placeholder="请选择区"  style="height: 20px; width: 315px;">
								<option value=""></option>
								<c:forEach items="${countylist}" var="ar">
									<option value="${ar.id }" <c:if test="${ar.id == pd.county_id}">selected</c:if>>${ar.name }</option>
								</c:forEach>
							</select>
						</c:if>
						<c:if test="${empty countylist}">
							<select class="chzn-select" name="unit_county" id="unit_county" data-placeholder="请选择区"  style="height: 20px; width: 315px;">
								<option value=""></option>
							</select>
						</c:if>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>需求单位地址</B></td>
					<td><input type="text" name="unit_address" id="unit_address" value="${pd.unit_address}" maxlength="80"
						 style="height: 20px; width: 300px;" placeholder="请输入需求单位地址"
						title="需求单位地址" onblur="trim(this);" /></td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
					<span style="color:#C00;padding-right: 4px;">*</span><B>主管单位</B></td>
					<td>
						<select class="chzn-select" name="belong_unit_id" id="belong_unit_id" data-placeholder="请选择主管单位"  style="height: 20px; width: 315px;">
							<option value=""></option>
							<c:forEach items="${unitList}" var="list">
							<option value="${list.unit_id}" <c:if test="${list.unit_id == pd.belong_unit_id}">selected</c:if>>${list.unit_name_full}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>成立时间</B>
					</td>
					<td><input name="unit_time" id="unit_time" class="Wdate" value="${pd.unit_time}" type="text" readonly="readonly" placeholder="请选择成立日期" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
					<span style="color:#C00;padding-right: 4px;">*</span><B>联系人</B>
					</td>
					<td><input type="text" name="unit_linkman" id="unit_linkman" value="${pd.unit_linkman}" maxlength="20"
						 style="height: 20px; width: 300px;" placeholder="请输入联系人"
						title="联系人" onblur="trim(this);" /></td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
					<span style="color:#C00;padding-right: 4px;">*</span><B>联系人手机号</B>
					</td>
					<td><input type="text" name="unit_phone" id="unit_phone" value="${pd.unit_phone}" maxlength="20"
						 style="height: 20px; width: 300px;" placeholder="请输入联系人手机号"
						title="联系人手机号" onblur="trim(this);" /></td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>联系人身份证</B></td>
					<td><input type="text" name="unit_idcard" id="unit_idcard" value="${pd.unit_idcard}" maxlength="20"
						 style="height: 20px; width: 300px;" placeholder="请输入联系人身份证"
						title="联系人身份证" onblur="trim(this);" /></td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>Email</B></td>
					<td><input type="text" name="unit_email" id="unit_email" value="${pd.unit_email}" maxlength="50"
						 style="height: 20px; width: 300px;" placeholder="请输入email"
						title="email" onblur="trim(this);" /></td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>简介</B></td>
					<td><textarea id="unit_desc" name="unit_desc" value="${pd.unit_desc}" maxlength="10000" 
							style="width:600px; height:200px;" 
							title="简介"></textarea></td>
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
			<a class="btn  btn-success" onclick="save();"><i class="icon-save"></i>保存</a> 
			<a class="btn  btn-danger" onclick="top.Dialog.close();">取消</a>
		</div>
		<div id="zhongxin2" class="center" style="display: none">
			<br /> <br /> <br /> <br /> <img src="<%=basePath%>static/images/jiazai.gif" /><br />
			<h4 class="lighter block green"></h4>
		</div>
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
	<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
	<!-- 实例化编辑器 -->
	<script type="text/javascript">
	$(top.hangge());
		$(function() {
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			
			var tips=function(id,msg){
				$("#"+id).tips({
					side : 2,
					msg : msg,
					bg : '#FF5080',
					time : 2
				});
			}
			
			//选择市
			$("#unit_province").change(function(){
				var unit_province = $("#unit_province").val();
				$.ajax({
					type: "POST",
					url: "<%=basePath%>vOrg/selectCity.do",
					data : {
						province_id : unit_province
					},
					dataType : "json",
					cache : false,
					success : function(data) {
						var html = '<option value=""></option>';
						var html_area = '<option value=""></option>';
						$("#unit_city").empty();
						$("#unit_county").empty();
						$.each(data.cityList, function(i, obj) {
							html += "<option value="+obj.id+">"+ obj.name + "</option>";
						});
						$("#unit_city").append(html);
						$("#unit_city").trigger("liszt:updated");
						$("#unit_county").append(html_area);
						$("#unit_county").trigger("liszt:updated");
					}
				});
			});

			//选择区县
			$("#unit_city").change(function(){
				var unit_city = $("#unit_city").val();
				$.ajax({
					type:"POST",
					url:"<%=basePath%>vOrg/selectArea.do",
					data:
						{
						city_id:unit_city
						},
					dataType:"json",
					cache:false,
					success:function(data){
						var html='<option value=""></option>';
						$("#unit_county").empty();
						$.each(data.areaList,function(i,obj){
							html += "<option value="+obj.id+">"+obj.name+"</option>";
						});
						$("#unit_county").append(html);
						$("#unit_county").trigger("liszt:updated");
					}
				});
			});
			
		});
	</script>
</body>
</html>