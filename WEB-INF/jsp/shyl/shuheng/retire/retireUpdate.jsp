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
<title>离休干部添加</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../../system/admin/top.jsp"%>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<link rel="stylesheet" href="static/assets/css/font-awesome.css" />
<script type="text/javascript" src="static/js/bootbox.min.js"></script>
<!-- 日期框 -->
<script type="text/javascript">
	var tips=function(id,msg){
		$("#"+id).tips({
			side : 2,
			msg : msg,
			bg : '#FF5080',
			time : 2
		});
	}
	//保存
	function update() {
		var isSuperAdmin = $("#is_super_admin").val();
		
		if ($("#user_name").val() == "") {
			$("#user_name").tips({
				side : 3,
				msg : '请输入姓名',
				bg : '#FF5080',
				time : 2
			});
			$("#user_name").focus();
			return false;
		}
		
		var phone = $("#user_phone").val();
		if(phone==''){
			$("#user_phone").tips({
				side : 3,
				msg : '请输入联系电话',
				bg : '#FF5080',
				time : 2
			});
			$("#user_phone").focus();
			return false;
		}else{
			if(!isTelephone(phone)){
				tips("user_phone","电话格式错误")
				$("#user_phone").focus();
				return false;
			}
		}
		
		var idCard = $("#user_idcard").val();
		if(idCard==''){
			tips("user_idcard","身份证号码不能为空");
			$("#user_idcard").focus();
			return false;
		}else{
			if(!isIdCard(idCard)){
				tips("user_idcard","身份证格式错误")
				$("#user_idcard").focus();
				return false;
			}
		}
		
		if("true"==isSuperAdmin){
			var userUnit = $("#user_unit").val();
			if(userUnit==''){
				tips("user_unit","请选择服务单位");
				$("#user_unit").focus();
				return false;
			}
		}
		
		if($("#user_province").val()==''){
			tips("user_province","请选择省");
			$("#user_province").focus();
			return false;
		}
		if($("#user_city").val()==''){
			tips("user_city","请选择省");
			$("#user_city").focus();
			return false;
		}
		if($("#user_county").val()==''){
			tips("user_county","请选择省");
			$("#user_county").focus();
			return false;
		}
		//离休费
		if($("#retire_fee").val()!=null && $("#retire_fee").val()!=''){
			if(!isNumberNoBeginZero($("#retire_fee").val())){
				tips("retire_fee","费用格式错误");
				$("#retire_fee").focus();
				return false;
			}
		}
		//医药费
		if($("#medical_fee").val()!=null && $("#medical_fee").val()!=''){
			if(!isNumberNoBeginZero($("#medical_fee").val())){
				tips("medical_fee","费用格式错误");
				$("#medical_fee").focus();
				return false;
			}
		}
		//保健证编号
		if($("#health_id_number").val()!=null && $("#health_id_number").val()!=''){
			if(!isNumberNoBeginZero($("#health_id_number").val())){
				tips("health_id_number","保健证编号格式错误");
				$("#health_id_number").focus();
				return false;
			}
		}
		
		//去掉老同志联系人的第一个tr
		$(".linkman_base_tr").remove();
		var flag = true;
// 		$("select[name='linkman_relation']").each(function() {
// 			if ($(this).val() == null || $(this).val() == '') {
// 				$(this).tips({
// 					side : 2,
// 					msg : '联系人关系不能为空',
// 					bg : '#FF5080',
// 					time : 2
// 				});
// 				flag = false;
// 			}
// 		})
// 		$("input[name='linkman_name']").each(function() {
// 			if ($(this).val() == null || $(this).val() == '') {
// 				$(this).tips({
// 					side : 2,
// 					msg : '联系人姓名不能为空',
// 					bg : '#FF5080',
// 					time : 2
// 				});
// 				flag = false;
// 			}
// 		})
		$("input[name='linkman_fix_phone']").each(function() {
			if ($(this).val() != null && $(this).val() != '') {
				if (!isFixPhone($(this).val())) {
					$(this).tips({
						side : 2,
						msg : '联系人固定电话格式错误',
						bg : '#FF5080',
						time : 2
					});
					$(this).focus();
					flag = false;
				}
			}
		})
		$("input[name='linkman_phone']").each(function() {
			if ($(this).val() != null && $(this).val() != '') {
				if (!isPhone($(this).val())) {
					$(this).tips({
						side : 2,
						msg : '联系人手机号格式错误',
						bg : '#FF5080',
						time : 2
					});
					$(this).focus();
					flag = false;
				}
			}
		})

		if (!flag) {
			return false;
		}
		
		var dataUserPhone = $("#data_user_phone").val();
		if(dataUserPhone!=null && dataUserPhone!=''){
			if(!isPhone(dataUserPhone)){
				tips("data_user_phone","手机号格式错误");
				$("#data_user_phone").focus();
				return false;
			}
		}

		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
</script>
<style type="text/css">
	.td_title{
		text-align:center !important;
		font-weight: bold;
		font-size:18px;
		line-height: 30px !important;
	}
	
	.line-remove-opt {
	    color: #d2322d;
	    cursor: pointer;
	    margin-right:8px;
	}
	.linkman_base_tr{
		display:none;
	}
	.linkman_relation{
		height: 30px !important;
	    margin-top: 10px;
	    width: 110px !important;
	    background-image: linear-gradient(#ffffff 20%, #f6f6f6 50%, #eeeeee 52%, #f4f4f4 100%);
	}
</style>
</head>
<body>
<br>
	<form action="<%=basePath%>retire/update.do" name="Form" id="Form" method="post">
		<input type="hidden" id="is_super_admin" name="is_super_admin" value="${pd.is_super_admin}"/>
		<input type="hidden" id="user_id" name="user_id" value="${pd.user_id }"/>
		<div id="zhongxin">
			<table class="table ">
				<tr>
					<td colspan='6' class="td_title">基本信息</td>
				</tr>
				<tr>
					<td style="width: 50px; text-align: right;"><span style="color:#C00;padding-right: 4px;">*</span><B>姓名</B></td>
					<td><input type="text" name="user_name" id="user_name" maxlength="20" value="${pd.user_name}"
						 style="height: 20px; width: 150px;margin-top: 10px;" placeholder="请输入姓名"
						title="姓名" onblur="trim(this);" /></td>
					<td style="width: 50px; text-align: right;"><span style="color:#C00;padding-right: 4px;">*</span><B>性别</B></td>
					<td><select class="chzn-select" name="user_sex" id="user_sex"
						data-placeholder="请选择性别"  style="height: 20px; width: 150px;">
										<option <c:if test="${pd.user_sex==0 }">selected</c:if> value="0">男</option>
										<option <c:if test="${pd.user_sex==1 }">selected</c:if> value="1">女</option>
					</select></td>
					<td style="width: 70px; text-align: right;"><span style="color:#C00;padding-right: 4px;">*</span><B>联系电话</B></td>
					<td><input type="text" name="user_phone" id="user_phone" maxlength="20" value="${pd.user_phone}"
						 style="height: 20px; width: 150px;margin-top: 10px;" placeholder="请输入联系电话"
						title="联系电话" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 50px; text-align: right;">现居住<span style="color:#C00;padding-right: 4px;">*</span><B>省</B></td>
					<td><select class="chzn-select" name="user_province" id="user_province"
						data-placeholder="请选择省"  style="height: 20px; width: 162px;">
										<option value=""></option>
										<c:forEach items="${provinceList}" var="pr">
											<option value="${pr.id }" <c:if test="${pr.id == pd.user_province}">selected</c:if>>${pr.name }</option>
										</c:forEach>
					</select></td>
					<td style="width: 50px; text-align: right;"><span style="color:#C00;padding-right: 4px;">*</span><B>市</B></td>
					<td><select class="chzn-select" name="user_city" id="user_city"
						data-placeholder="请选择市"  style="height: 20px; width: 150px;">
										 <option value=""></option>
										 <c:forEach items="${citylist}" var="city">
											<option value="${city.id }" <c:if test="${city.id == pd.user_city}">selected</c:if>>${city.name }</option>
										 </c:forEach>
					</select></td>
					<td style="width: 70px; text-align: right;"><span style="color:#C00;padding-right: 4px;">*</span><B>县市区</B></td>
					<td><select class="chzn-select" name="user_county" id="user_county"
						data-placeholder="请选择区"  style="height: 20px; width: 162px;">
										 <option value=""></option>
										<c:forEach items="${countylist}" var="ar">
											<option value="${ar.id }" <c:if test="${ar.id == pd.user_county}">selected</c:if>>${ar.name }</option>
										</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td style="width: 70px; text-align: right;"><B>详细地址</B></td>
					<td colspan="5"><input type="text" name="user_address" id="user_address" maxlength="200" value="${pd.user_address}"
						 style="height: 20px; width: 350px;margin-top: 10px;" placeholder="请输入详细地址"
						title="详细地址" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 70px; text-align: right;"><span style="color:#C00;padding-right: 4px;">*</span><B>身份证号</B></td>
					<td colspan='2'><input type="text" name="user_idcard" id="user_idcard" maxlength="20" value="${pd.user_idcard }"
						 style="height: 20px; width: 200px;margin-top: 10px;" placeholder="请输入身份证号"
						title="身份证号" onblur="trim(this);" /></td>
					<td style="width: 70px; text-align: right;"><span style="color:#C00;padding-right: 4px;">*</span><B>出生年月</B></td>
					<td colspan='2'><input type="text" name="user_birthday" id="user_birthday" maxlength="20" class="Wdate" value="${pd.user_birthday}" readonly="readonly" onclick="WdatePicker({maxDate:'1935-10',dateFmt:'yyyy-MM',isShowClear:true});"
						 style="height: 20px; width: 200px;margin-top: 10px;" placeholder="请选择出生年月"
						title="出生年月" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 70px; text-align: right;"><B>原单位</B></td>
					<td colspan='2'><input type="text" name="user_old_unit" id="user_old_unit" maxlength="50" value="${pd.user_old_unit}"
						 style="height: 20px; width: 200px; margin-top: 10px;" placeholder="请输入原单位"
						title="原单位" onblur="trim(this);" /></td>
					<td style="width: 70px; text-align: right;"><B>原职务</B></td>
					<td colspan='2'><input type="text" name="user_old_job" id="user_old_job" maxlength="50" value="${pd.user_old_job}"
						 style="height: 20px; width: 200px;margin-top: 10px;" placeholder="请输入原职位"
						title="原职位" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<tr>
					<td style="width: 70px; text-align: right;"><B>现享受待遇</B></td>
					<td colspan='5'>
						<c:forEach items="${treatmentList}" var="list">
							<input type="checkbox" name="treatment" <c:forEach items="${userTreatmentList}" var="treatment"><c:if test="${treatment.value==list.distinguish_id }">checked</c:if></c:forEach>  value="${list.distinguish_id}"  style="opacity:1;position: relative;top:4px;"/><span>${list.value}</span>
						</c:forEach>
					</td>
				</tr>
				</tr>
				<tr>
					<td style="width: 70px; text-align: right;"><span style="color:#C00;padding-right: 4px;">*</span><B>现服务单位</B></td>
					<td colspan='2'>
					<select class="chzn-select" name="user_unit" id="user_unit"  <c:if test="${!is_super_admin}"> disabled="disabled"</c:if>
							data-placeholder="请选择服务单位" style="height: 20px; width: 217px;" >
							<option value="">---选择服务单位---</option>
							<c:forEach items="${unitList}" var="list">
								<option value="${list.unit_id}" 
								<c:if test="${list.unit_id == pd.user_unit }">selected</c:if>>${list.unit_name_full}</option>
							</c:forEach>
					</select></td>
					<td style="width: 70px; text-align: right;"><B>联系电话</B></td>
					<td colspan='2'><input type="text" name="unit_phone" id="unit_phone" maxlength="50" value="${pd.unit_phone}"
						 style="height: 20px; width: 250px;margin-top: 10px;" placeholder="请输入单位联系电话"
						title="单位联系电话" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 70px; text-align: right;"><B>居住类型</B></td>
					<td colspan="5">
						<c:forEach items="${liveTypeList}" var="list">
							<input type="checkbox" name="liveType" <c:forEach items="${userLiveTypeList}" var="liveType"><c:if test="${liveType.value==list.distinguish_id }">checked</c:if></c:forEach>  value="${list.distinguish_id}"  style="opacity:1;position: relative;top:4px;"/><span>${list.value}</span>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td colspan='6' class="td_title">工资待遇</td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: right;"><B>参加革命工作</B></td>
					<td colspan="2">
						<c:forEach items="${revolutionList}" var="list">
							<input type="radio" name="revolution_time" <c:if test="${pd.revolution_time==list.distinguish_id }">checked</c:if>  value="${list.distinguish_id}"  style="opacity:1;position: relative;top:4px;"/><span>${list.value}</span>
						</c:forEach>
					</td>
					<td style="width: 70px; text-align: right;"><B>服务管理单位类型</B></td>
					<td colspan="2">
						<c:forEach items="${unitTypeList}" var="list">
							<input type="radio" name="old_unit_type" <c:if test="${pd.old_unit_type==list.distinguish_id }">checked</c:if>  value="${list.distinguish_id}"  style="opacity:1;position: relative;top:4px;"/><span>${list.value}</span>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td style="width: 85px; text-align: right;"><B>离休费标准(元/月)</B></td>
					<td colspan='2'><input type="number" name="retire_fee" id="retire_fee" maxlength="10" value="${pd.retire_fee}"
						 style="height: 20px; width: 200px; margin-top: 10px;" placeholder="请输入离休费标准(每月)"
						title="离休费标准" onblur="trim(this);" /></td>
					<td style="width: 70px; text-align: right;"><B>医药费(元/年)</B></td>
					<td colspan='2'><input type="number" name="medical_fee" id="medical_fee" maxlength="10" value="${pd.medical_fee}"
						 style="height: 20px; width: 200px;margin-top: 10px;" placeholder="请输入医药费(每年)"
						title="医药费" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 85px; text-align: left;"><B>本人是否纳入困难或特困救助</B></td>
					<td colspan='5'>
						<input type="radio" id="special_difficult_1" name="special_difficult" <c:if test="${pd.special_difficult==1 }">checked</c:if> value="1"  style="opacity:1;position: relative;top:4px;"/><span>是</span>
						<input type="text" name="help_unit" value="${pd.help_unit}" maxlength="30" style="display:none;height: 20px; width: 200px;margin-top: 10px;" placeholder="请输入救助单位"/>
						<input type="number" name="help_money" <c:if test="${pd.help_money==0}">value=""</c:if> value="${pd.help_money}" maxlength="10" style="display:none;height: 20px; width: 200px;margin-top: 10px;" placeholder="请输入救助金额"/>
						<input type="radio" id="special_difficult_0" name="special_difficult" <c:if test="${pd.special_difficult==0 }">checked</c:if> value="0"  style="opacity:1;position: relative;top:4px;"/><span>否</span>
					</td>
				</tr>
				<tr>
					<td style="width: 85px; text-align: right;"><B>享受居家养老服务</B></td>
					<td colspan='2'>
						<input type="radio" name="home_care" <c:if test="${pd.home_care==1 }">checked</c:if> value="1"  style="opacity:1;position: relative;top:4px;"/><span>是</span>
						<input type="radio" name="home_care" <c:if test="${pd.home_care==0 }">checked</c:if> value="0"  style="opacity:1;position: relative;top:4px;"/><span>否</span>
					</td>
					<td style="width: 70px; text-align: right;"><B>享受何种居家养老服务</B></td>
					<td colspan='2'><input type="text" name="home_care_service" id="home_care_service" maxlength="100" value="${pd.home_care_service}"
						 style="height: 20px; width: 200px; margin-top: 10px;" placeholder="请输入享受何种服务"
						title="享受何种服务" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 85px; text-align: right;"><B> 希望得到服务</B></td>
					<td colspan='5'>
						<c:forEach items="${serviceList}" var="list">
							<input type="checkbox" name="hopeService" <c:forEach items="${userServiceList}" var="service"><c:if test="${service.value==list.distinguish_id }">checked</c:if></c:forEach> value="${list.distinguish_id}"  style="opacity:1;position: relative;top:4px;"/><span>${list.value}</span>
						</c:forEach>
					</td>
				</tr>
				
				<tr>
					<td colspan="6" class="td_title">医疗保健</td>
				</tr>
				<tr>
					<td style="width: 70px; text-align: right;"><B>健康状态</B></td>
					<td colspan="5">
						<c:forEach items="${healthStatusList}" var="list">
							<input type="radio" name="health_status" <c:if test="${pd.health_status==list.distinguish_id }">checked</c:if>  value="${list.distinguish_id}"  style="opacity:1;position: relative;top:4px;"/><span>${list.value}</span>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td style="width: 85px; text-align: left;"><B>是否每年健康疗养</B></td>
					<td colspan='2'>
						<input type="radio" name="join_health" <c:if test="${pd.join_health==1 }">checked</c:if> value="1"  style="opacity:1;position: relative;top:4px;"/><span>是</span>
						<input type="radio" name="join_health" <c:if test="${pd.join_health==0 }">checked</c:if> value="0"  style="opacity:1;position: relative;top:4px;"/><span>否</span>
					</td>
					<td style="width: 70px; text-align: right;"><B>保健证编号</B></td>
					<td colspan='2'><input type="text" name="health_id_number" id="health_id_number" maxlength="50" value="${pd.health_id_number}"
						 style="height: 20px; width: 200px; margin-top: 10px;" placeholder="请输入保健证编号"
						title="保健证编号" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 85px; text-align: right;"><B>定点医院1</B></td>
					<td colspan='2'><input type="text" name="hospital_one" id="hospital_one" maxlength="30" value="${pd.hospital_one}"
						 style="height: 20px; width: 200px; margin-top: 10px;" placeholder="请输入定点医院1"
						title="定点医院1" onblur="trim(this);" /></td>
					<td style="width: 70px; text-align: right;"><B>定点医院2</B></td>
					<td colspan='2'><input type="text" name="hospital_two" id="hospital_two" maxlength="30" value="${pd.hospital_two}"
						 style="height: 20px; width: 200px; margin-top: 10px;" placeholder="请输入定点医院2"
						title="定点医院2" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 70px; text-align: right;"><B>是否有以下疾病</B></td>
					<td colspan="5">
						<c:forEach items="${illnessList}" var="list">
							<input type="checkbox" name="illness" <c:forEach items="${userIllnessList}" var="illness"><c:if test="${illness.value==list.distinguish_id }">checked</c:if></c:forEach>  value="${list.distinguish_id}"  style="opacity:1;position: relative;top:4px;"/><span>${list.value}</span>
						</c:forEach>
						<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;其它：</span><input type="text" name="illness_other" id="illness_other" maxlength="50" value="${pd.illness_other}"
						 style="height: 20px; width: 200px; margin-top: 10px;" placeholder="其它疾病"
						title="其它疾病" onblur="trim(this);" />
					</td>
				</tr>
				<tr>
					<td style="width: 85px; text-align: right;"><B>长期服用医保内药物</B></td>
					<td colspan='5'>
						<c:if test="${empty inMedicineList}">
							<input type="text" name="medicine_in"  maxlength="50" style="height: 20px; width: 100px; margin-top: 10px;" placeholder="医保内用药" title="医保内用药" onblur="trim(this);"/>
							<i class="small-icon fa fa-plus-square" style="cursor:pointer;color: #219823;" onclick="addMedicine(this,'in')" title="添加选项"></i>
						</c:if>
						<c:if test="${!empty inMedicineList}">
						<c:forEach items="${inMedicineList}" var="list" varStatus="stat">
							<input type="text" name="medicine_in" value="${list.medicine_name}"  maxlength="50" style="height: 20px; width: 100px; margin-top: 10px;" placeholder="医保内用药" title="医保内用药" onblur="trim(this);"/>
							<c:if test="${!stat.last}">
								<i class="small-icon line-remove-opt fa fa-minus-square" title="删除此选项" onclick="delMedicine(this)"></i>
							</c:if>
							<c:if test="${stat.last}">
								<i class="small-icon fa fa-plus-square" style="cursor:pointer;color: #219823;" onclick="addMedicine(this,'in')" title="添加选项"></i>
							</c:if>
						</c:forEach>
						</c:if>
					</td>
				</tr>
				<tr>
					<td style="width: 70px; text-align: right;"><B>长期服用医保外药物</B></td>
					<td colspan='5'>
						<c:if test="${empty outMedicineList}">
							<input type="text" name="medicine_out"  maxlength="50" style="height: 20px; width: 100px; margin-top: 10px;" placeholder="医保外用药" title="医保外用药" onblur="trim(this);"/>
							<i class="small-icon fa fa-plus-square" style="cursor:pointer;color: #219823;" onclick="addMedicine(this,'out')" title="添加选项"></i>
						</c:if>
						<c:if test="${!empty outMedicineList}">
						<c:forEach items="${outMedicineList}" var="list" varStatus="stat">
							<input type="text" name="medicine_out" value="${list.medicine_name}" maxlength="50" style="height: 20px; width: 100px; margin-top: 10px;" placeholder="医保外用药" title="医保外用药" onblur="trim(this);"/>
							<c:if test="${!stat.last}">
								<i class="small-icon line-remove-opt fa fa-minus-square" title="删除此选项" onclick="delMedicine(this)"></i>
							</c:if>
							<c:if test="${stat.last}">
								<i class="small-icon fa fa-plus-square" style="cursor:pointer;color: #219823;" onclick="addMedicine(this,'out')" title="添加选项"></i>
							</c:if>
						</c:forEach>
						</c:if>
					</td>
				</tr>
				
				<tr>
					<td colspan="6" class="td_title">组织生活及活动服务</td>
				</tr>
				<tr>
					<td style="width: 70px; text-align: right;"><B>党组织关系所在支部</B></td>
					<td colspan='2'><input type="text" name="party_branch" id="party_branch" maxlength="50" value="${pd.party_branch}"
						 style="height: 20px; width: 200px; margin-top: 10px;" placeholder="请输入党组织关系所在支部"
						title="党组织关系所在支部" onblur="trim(this);" /></td>
					<td style="width: 85px; text-align: right;"><B>是否需要送学上门</B></td>
					<td colspan='2'>
						<input type="radio" name="send_study" <c:if test="${pd.send_study==1 }">checked</c:if> value="1"  style="opacity:1;position: relative;top:4px;"/><span>是</span>
						<input type="radio" name="send_study" <c:if test="${pd.send_study==0 }">checked</c:if> value="0"  style="opacity:1;position: relative;top:4px;"/><span>否</span>
					</td>
				</tr>
				<tr>
					<td style="width: 85px; text-align: right;"><B>定期参加支部活动</B></td>
					<td colspan='2'>
						<input type="radio" name="party_branch_active" <c:if test="${pd.party_branch_active==1 }">checked</c:if> value="1"  style="opacity:1;position: relative;top:4px;"/><span>是</span>
						<input type="radio" name="party_branch_active" <c:if test="${pd.party_branch_active==0 }">checked</c:if> value="0"  style="opacity:1;position: relative;top:4px;"/><span>否</span>
					</td>
					<td style="width: 70px; text-align: right;"><B>党费缴纳方式</B></td>
					<td colspan='2'>
						<c:forEach items="${feeWayList}" var="list">
							<input type="radio" name="party_fee_way" <c:if test="${pd.party_fee_way==list.distinguish_id }">checked</c:if>  value="${list.distinguish_id}"  style="opacity:1;position: relative;top:4px;"/><span>${list.value}</span>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td style="width: 85px; text-align: right;"><B>定期走访慰问</B></td>
					<td colspan='2'>
						<input type="radio" name="interview" <c:if test="${pd.interview==1 }">checked</c:if> value="1"  style="opacity:1;position: relative;top:4px;"/><span>是</span>
						<input type="radio" name="interview" <c:if test="${pd.interview==0 }">checked</c:if> value="0"  style="opacity:1;position: relative;top:4px;"/><span>否</span>
					</td>
					<td style="width: 70px; text-align: right;"><B>每年几次</B></td>
					<td colspan='2'>
						<c:forEach items="${interviewList}" var="list">
							<input type="radio" name="interview_year" <c:if test="${pd.interview_year==list.distinguish_id }">checked</c:if> value="${list.distinguish_id}"  style="opacity:1;position: relative;top:4px;"/><span>${list.value}</span>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td colspan='4' style="width: 70px; text-align: right;"><B>能否到老年大学、老干部活动中心及社区活动</B></td>
					<td colspan='2'>
						<input type="radio" name="join_active" <c:if test="${pd.join_active==1 }">checked</c:if> value="1"  style="opacity:1;position: relative;top:4px;"/><span>能</span>
						<input type="radio" name="join_active" <c:if test="${pd.join_active==0 }">checked</c:if> value="0"  style="opacity:1;position: relative;top:4px;"/><span>不能</span>
					</td>
				</tr>
				<tr>
					<td style="width: 85px; text-align: right;"><B>兴趣爱好及活动类型</B></td>
					<td colspan='5'>
						<c:forEach items="${interestList}" var="list">
							<input type="checkbox" name="interest" <c:forEach items="${userInterestList}" var="interest"><c:if test="${interest.value==list.distinguish_id }">checked</c:if></c:forEach>  value="${list.distinguish_id}"  style="opacity:1;position: relative;top:4px;"/><span>${list.value}</span>
						</c:forEach>
					</td>
				</tr>
			</table>
			<table class="table linkman_table">
				<tr>
					<td colspan="6" class="td_title">老同志联系人</td>
				</tr>
				<tr>
					<td>与老同志关系</td>
					<td>姓名</td>
					<td style="width: 85px;"></td>
					<td>固定电话</td>
					<td>手机号</td>
					<td><i class="small-icon fa fa-plus-square" style="cursor:pointer;color: #219823;" onclick="addOption()" title="添加选项"></i></td>
				</tr>
				<tr class="linkman_base_tr">
					<td><select  name="linkman_relation" class="linkman_relation"
						data-placeholder="请选择关系"  style="height: 20px; width: 110px;">
										<option value="">请选择关系</option>
										<c:forEach items="${relationList}" var="list">
											<option value="${list.distinguish_id }" >${list.value }</option>
										</c:forEach>
					</select></td>
					<td><input type="text" name="linkman_name" class="linkman_name" maxlength="20"
						 style="height: 20px; width: 100px;margin-top: 10px;" placeholder="请输入联系人姓名"
						title="联系人姓名" onblur="trim(this);" />
					</td>
					<td style="width: 85px;"></td>
					<td><input type="text" name="linkman_fix_phone" class="linkman_fix_phone" maxlength="20"
						 style="height: 20px; width: 100px;margin-top: 10px;" placeholder="请输入固定电话"
						title="固定电话" onblur="trim(this);" />
					</td>
					<td><input type="number" name="linkman_phone" class="linkman_phone" maxlength="20" min="1"
						 style="height: 20px; width: 100px;margin-top: 10px;" placeholder="请输入手机号码"
						title="手机号码" onblur="trim(this);" />
					</td>
					<td><span><i class="small-icon line-remove-opt fa fa-minus-square" title="删除此选项" onclick="delOption(this)"></i></span></td>
				</tr>
				<c:forEach items="${userLinkmanList}" var="linkman">
				<tr>
					<td>
					<input type="hidden" name="linkman_id" value="${linkman.linkman_id}"/>
					<select  name="linkman_relation" class="linkman_relation"
						data-placeholder="请选择关系"  style="height: 20px; width: 110px;">
										<option value="">请选择关系</option>
										<c:forEach items="${relationList}" var="list">
											<option <c:if test="${linkman.linkman_relation==list.distinguish_id }">selected</c:if>  value="${list.distinguish_id }" >${list.value }</option>
										</c:forEach>
					</select></td>
					<td><input type="text" name="linkman_name" class="linkman_name" maxlength="20" value="${linkman.linkman_name}"
						 style="height: 20px; width: 100px;margin-top: 10px;" placeholder="请输入联系人姓名"
						title="联系人姓名" onblur="trim(this);" />
					</td>
					<td style="width: 85px;"></td>
					<td><input type="text" name="linkman_fix_phone" class="linkman_fix_phone" maxlength="20" value="${linkman.linkman_fix_phone}"
						 style="height: 20px; width: 100px;margin-top: 10px;" placeholder="请输入固定电话"
						title="固定电话" onblur="trim(this);" />
					</td>
					<td><input type="number" name="linkman_phone" class="linkman_phone" maxlength="20" min="1" value="${linkman.linkman_phone}"
						 style="height: 20px; width: 100px;margin-top: 10px;" placeholder="请输入手机号码"
						title="手机号码" onblur="trim(this);" />
					</td>
					<td><span><i class="small-icon line-remove-opt fa fa-minus-square" title="删除此选项" onclick="delOption(this)"></i></span></td>
				</tr>
				</c:forEach>
			</table>
			<table class="table">
				<tr>
					<td colspan="6" class="td_title">老同志的建议和需要解决的实际问题</td>
				</tr>
				<tr>
					<td style="width: 150px; text-align: right;"><B>组织生活</B></td>
					<td clospan="5"><textArea  name="suggestion_live" class="suggestion_live" maxlength="500" 
						style="height: 50px; width: 500px;margin-top: 10px;" placeholder="" 
						title="" onblur="trim(this);">${pd.suggestion_live}</textArea></td>
				</tr>
				<tr>
					<td style="width: 150px; text-align: right;"><B>工资待遇 </B></td>
					<td clospan="5"><textArea  name="suggestion_salary" class="suggestion_salary" maxlength="500" 
						style="height: 50px; width: 500px;margin-top: 10px;" placeholder=""
						title="" onblur="trim(this);">${pd.suggestion_salary}</textArea></td>
				</tr>
				<tr>
					<td style="width: 150px; text-align: right;"><B>医疗保障 </B></td>
					<td clospan="5"><textArea  name="suggestion_health" class="suggestion_health" maxlength="500" 
						style="height: 50px; width: 500px;margin-top: 10px;" placeholder=""
						title="" onblur="trim(this);">${pd.suggestion_health}</textArea></td>
				</tr>	
				<tr>
					<td style="width: 150px; text-align: right;"><B>文化养老 </B></td>
					<td clospan="5"><textArea  name="suggestion_culture" class="suggestion_culture" maxlength="500" 
						style="height: 50px; width: 500px;margin-top: 10px;" placeholder=""
						title="" onblur="trim(this);">${pd.suggestion_culture}</textArea></td>
				</tr>
				<tr>
					<td style="width: 150px; text-align: right;"><B>作用发挥 </B></td>
					<td clospan="5"><textArea  name="suggestion_effect" class="suggestion_effect" maxlength="500" 
						style="height: 50px; width: 500px;margin-top: 10px;" placeholder=""
						title="" onblur="trim(this);">${pd.suggestion_effect}</textArea></td>
				</tr>
				<tr>
					<td style="width: 150px; text-align: right;"><B>社会发展 </B></td>
					<td clospan="5"><textArea  name="suggestion_society" class="suggestion_society" maxlength="500" 
						style="height: 50px; width: 500px;margin-top: 10px;" placeholder=""
						title="" onblur="trim(this);">${pd.suggestion_society}</textArea></td>
				</tr>	
				<tr>
					<td style="width: 150px; text-align: right;"><B>其它 </B></td>
					<td clospan="5"><textArea  name="suggestion" class="suggestion" maxlength="500" 
						style="height: 50px; width: 500px;margin-top: 10px;" placeholder=""
						title="" onblur="trim(this);">${pd.suggestion}</textArea></td>
				</tr>		
				<tr>
					<td style="width: 85px; text-align: right;"><B>信息采集人</B></td>
					<td colspan='2'><input type="text" name="data_user" id="data_user" maxlength="20" value="${pd.data_user }"
						style="height: 20px; width: 200px; margin-top: 10px;" placeholder="请输入信息采集人"
						title="信息采集人" onblur="trim(this);" /></td>
					<td style="width: 85px; text-align: right;"><B>采集人手机号</B></td>
					<td colspan='2'><input type="text" name="data_user_phone" id="data_user_phone" maxlength="20" value="${pd.data_user_phone }"
						style="height: 20px; width: 200px; margin-top: 10px;" placeholder="请输入采集人手机号"
						title="采集人手机号" onblur="trim(this);" /></td>
				</tr>
			</table>
		</div>
		<div align="center" style="margin-top: 10px;">
			<a class="btn  btn-success" onclick="update();"><i class="icon-save"></i>更新</a> 
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
		//关联下拉菜单
		$(function(){
			var knowledges = $("#user_provinces").val();
			$("#user_province").change(function() {
			    BindCId2(0);
			});
			
			//区职单位
			var knowledges = $("#user_city").val();
			$("#user_city").change(function() {
			    BindCId3(0);
			});
			
			$("input[name='special_difficult']").each(function(){
				if($(this).is(':checked') && "special_difficult_1"==$(this).attr("id")){
					$("input[name='help_unit']").show();
					$("input[name='help_money']").show();
				}
			});
			
			$("input[name='special_difficult']").click(function(){
				if($(this).is(':checked') && $(this).val()=="1"){
					$("input[name='help_unit']").show();
					$("input[name='help_money']").show();
				}else{
					$("input[name='help_unit']").hide();
					$("input[name='help_money']").hide();
				}
			});
			//合并的：$(function(){});
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
		});
		

		function BindCId2(cid) {
			var PID = $("#user_province").val();
			$("#user_city").empty();
			$("#user_county").empty();
			if (PID == "") {
		        $("<option value=''></option>").appendTo("#user_city");
		    }else{
		    	$.ajax({
					type:"POST",
					url:"<%=basePath%>unit/getAddrCityList.do",
					data:{'PID' : PID},
					dataType:"json",
					cache:false,
					success:function(data){
						var html='<option value=""></option>';
						var html1 = '<option value=""></option>';
						$.each(data.citylist,function(i,list){
							if(list.id==cid){
								if(cid!=0){
									html+="<option value="+list.id+" selected='selected' >"+list.name+"</option>";
								}
							}else{
								html+="<option value="+list.id+">"+list.name+"</option>";
							}
						});
						$("#user_city").append(html);
						$("#user_city").trigger("liszt:updated");
						$("#user_county").append(html1);
						$("#user_county").trigger("liszt:updated");
					}
				});
		    }
		}
		
		function BindCId3(cid) {
			var PID = $("#user_city").val();
			$("#user_county").empty();
			if (PID == "") {
		        $("<option value=''></option>").appendTo("#user_county");
		    }else{
		    	$.ajax({
					type:"POST",
					url:"<%=basePath%>unit/getAddrAreaList.do",
					data:{'PID' : PID},
					dataType:"json",
					cache:false,
					success:function(data){
						var html='<option value=""></option>';
						$.each(data.arealist,function(i,list){
							if(list.id==cid){
								if(cid!=0){
									html+="<option value="+list.id+" selected='selected' >"+list.name+"</option>";
								}
							}else{
								html+="<option value="+list.id+">"+list.name+"</option>";
							}
						});
						$("#user_county").append(html);
						$("#user_county").trigger("liszt:updated");
					}
				});
		    }
		}
		
		function delOption(obj){
			var linkmanId = $(obj).parents("td").siblings().first().find("input[name='linkman_id']").val();
			if(linkmanId!=null && linkmanId!=''){
				bootbox.confirm("确定要删除吗?", function(result){
					if(result){
						$.ajax({
							type : "POST",
							url : "<%=basePath%>retire/linkmanDel.do?tm=" + new Date().getTime(),
							dataType : "text",
							cache : false,
							data :{linkman_id:linkmanId},
							success:function(data){
								if(data=="success"){
									$(obj).parents("tr").remove();
								}
							}
						});
					}
				})	
			}else{
				$(obj).parents("tr").remove();
			}
		}
		
		function addOption(){
			var size = $(".linkman_table tr").size();
			if(size>=7){
				alert("最多四个联系人")
				return;
			}
			$(".linkman_table").append($(".linkman_base_tr").clone().removeClass("linkman_base_tr"));
		}
		
		//添加药物
		function addMedicine(obj,type){
			var inStr = '<i class="small-icon line-remove-opt fa fa-minus-square" title="删除此选项" onclick="delMedicine(this)"></i><input type="text" name="medicine_in"  maxlength="50" style="height: 20px; width: 100px; margin-top: 10px;" placeholder="医保内用药" title="医保内用药" onblur="trim(this);"/>';
			var outStr = '<i class="small-icon line-remove-opt fa fa-minus-square" title="删除此选项" onclick="delMedicine(this)"></i><input type="text" name="medicine_out"  maxlength="50" style="height: 20px; width: 100px; margin-top: 10px;" placeholder="医保外用药" title="医保外用药" onblur="trim(this);"/>';
			if("in"==type){
				var flag = true;
				$("input[name='medicine_in']").each(function(){
					var val = $(this).val();
					if(val==null || val==''){
						$(this).tips({
							side : 3,
							msg : '请输入医保内药物名称',
							bg : '#FF5080',
							time : 2
						});
						flag = false;
					}
				});
				if(flag){
					$(obj).before(inStr);
				}
			}
			if("out"==type){
				var flag = true;
				$("input[name='medicine_out']").each(function(){
					var val = $(this).val();
					if(val==null || val==''){
						$(this).tips({
							side : 3,
							msg : '请输入医保外药物名称',
							bg : '#FF5080',
							time : 2
						});
						flag = false;
					}
				});
				if(flag){
					$(obj).before(outStr);
				}
			}
		}
		//删除药物
		function delMedicine(obj){
			$(obj).prev().remove();
			$(obj).remove();
		}
	</script>
</body>
</html>