<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<meta charset="utf-8" />
<title>报名详情页面</title>
<meta name="description" content="overview & stats" />
<%@ include file="../../../system/admin/top.jsp"%>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/ace-elements.min.js"></script>
<script src="static/js/ace.min.js"></script>

</head>
<body>
	<br>
	<form action="<%=basePath%>sign_up/saveSignUp.do" name="Form" id="Form" method="post">
		<div id="zhongxin">
			<table class="table">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span>报名标题
					</td>
					<td>
						<input type="text" name="sign_up_title" id="sign_up_title" value="${pd.sign_up_title}" disabled="disabled" maxlength="100" style="height: 20px; width: 200px;" placeholder="请输入标题" title="标题" onblur="trim(this);"/>
					</td>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span>报名类型
					</td>
					<td>
						<select class="chzn-select" name="sign_up_type" id="sign_up_type" disabled="disabled" data-placeholder="请选择报名类型" style="height: 20px; width: 215px;">
							<option value="">----------</option>
							<c:forEach items="${typeList}" var="list">
								<option value="${list.distinguish_id}" <c:if test="${list.distinguish_id==pd.sign_up_type}">selected</c:if>>${list.value}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span>省
					</td>
					<td>
					<select class="chzn-select" name="sign_up_province" id="sign_up_province" disabled="disabled" data-placeholder="请选择省"  style="height: 20px; width: 215px;">
						<option value=""></option>
						<c:forEach items="${provinceList}" var="pr">
							<option value="${pr.id }" <c:if test="${pr.id == pd.sign_up_province}">selected</c:if>>${pr.name }</option>
						</c:forEach>
					</select></td>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span>市
					</td>
					<td>
						<select class="chzn-select" name="sign_up_city" id="sign_up_city" disabled="disabled" data-placeholder="请选择市"  style="height: 20px; width: 215px;">
							<option value=""></option>
							<c:forEach items="${citylist}" var="city">
								<option value="${city.id }" <c:if test="${city.id == pd.sign_up_city}">selected</c:if>>${city.name }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span>区
					</td>
					<td>
						<select class="chzn-select" name="sign_up_county" id="sign_up_county" disabled="disabled" data-placeholder="请选择区"  style="height: 20px; width: 215px;">
							<option value=""></option>
							<c:forEach items="${countylist}" var="ar">
								<option value="${ar.id }" <c:if test="${ar.id == pd.sign_up_county}">selected</c:if>>${ar.name }</option>
							</c:forEach>
						</select>
					</td>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span>详细地址
					</td>
					<td>
						<input type="text" name="sign_up_address" id="sign_up_address" disabled="disabled" value="${pd.sign_up_address}" maxlength="200" style="height: 20px; width: 200px;" placeholder="请输入详细地址" title="详细地址" onblur="trim(this);" />
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span>报名开始时间
					</td>
					<td>
						<input name="begin_time" id="begin_time" class="Wdate" value="${pd.begin_time}"  type="text" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'end_time\',{d:-0});}',dateFmt:'yyyy-MM-dd HH:mm',isShowClear:true});" readonly="readonly" placeholder="报名开始时间"  title="报名开始时间" style=" width: 200px"/>
					</td>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span>报名结束时间
					</td>
					<td>
						<input name="end_time" id="end_time" class="Wdate" value="${pd.end_time}"  type="text" onclick="WdatePicker({minDate:'#F{$dp.$D(\'begin_time\',{d:0});}',dateFmt:'yyyy-MM-dd HH:mm',isShowClear:true});" readonly="readonly" placeholder="报名结束时间"  title="报名结束时间" style=" width: 200px"/>
					</td>
				</tr>
				
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span>开始时间
					</td>
					<td>
						<input name="going_begin_time" id="going_begin_time" class="Wdate" value="${pd.going_begin_time}" type="text" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'going_end_time\',{d:-0});}',dateFmt:'yyyy-MM-dd HH:mm',isShowClear:true});" readonly="readonly" placeholder="开始时间"  title="开始时间" style=" width: 200px"/>
					</td>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span>结束时间
					</td>
					<td> 
						<input name="going_end_time" id="going_end_time" class="Wdate" value="${pd.going_end_time}" type="text" onclick="WdatePicker({minDate:'#F{$dp.$D(\'going_begin_time\',{d:0});}',dateFmt:'yyyy-MM-dd HH:mm',isShowClear:true});" readonly="readonly" placeholder="结束时间"  title="结束时间" style=" width: 200px"/>
					</td>
				</tr>
				
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
					    是否提供住宿
					</td>
					<td>
						<input type="checkbox" name="is_hotel" id="is_hotel" <c:if test="${pd.is_hotel=='1'}">checked</c:if> placeholder="是否提供住宿" title="是否提供住宿" style="opacity:1;position: relative;"/>
					</td>
					<c:if test="${pd.superAdmin}">
						<td style="width: 100px; text-align: left; padding-top: 13px;">
							<span style="color: #C00; padding-right: 4px;">*</span>举办单位
						</td>
						<td>
							<select class="chzn-select" name="unit_id" id="unit_id" disabled="disabled" data-placeholder="请选择单位"  style="height: 20px; width: 215px;">
								<option value="">----------</option>
								<c:forEach items="${listUnit}" var="list">
									<option value="${list.unit_id}" <c:if test="${list.unit_id==pd.unit_id}">selected</c:if>>${list.unit_name_full}</option>
								</c:forEach>
							</select>
						</td>
					</c:if>
				</tr>
			</table>
			<textarea id="sign_up_content" name="sign_up_content" maxlength="10000" title="活动通知内容" style="width:600px; height:300px;">${pd.sign_up_content}</textarea>
		</div>
		<div align="center" style="margin-top: 10px;">
			<a class="btn  btn-light" onclick="returnback()"><i class=" icon-circle-arrow-left"></i>返回</a>
		</div>
		<div id="zhongxin2" class="center" style="display: none">
			<br /> <br /> <br /> <br /> <img src="static/images/jiazai.gif" /><br />
			<h4 class="lighter block green"></h4>
		</div>
	</form>
	
	<script type="text/javascript">
		$(top.hangge());
		

			//关联下拉菜单
			$(function(){
				//下拉框
				$(".chzn-select").chosen();
				$(".chzn-select-deselect").chosen({
					allow_single_deselect : true
				});
				
				//初始化编辑器
				var ue = UE.getEditor('sign_up_content',{
			        initialFrameWidth : 880,
			        initialFrameHeight: 300,
			        readonly:true
			    });
				
			});
			
			//返回
		    function returnback(){
		    	top.Dialog.close();
			}
			
			
	</script>
</body>
</html>