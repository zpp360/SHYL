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
<title>审核</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../../system/admin/top.jsp"%>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<!-- 日期框 -->
</head>
<body>
<br>
	<form action="" name="Form" id="Form" method="post">
		<input type="hidden" name="unit_id" id="unit_id" value="${pd.unit_id }" />
		<div id="zhongxin">
			<table class="table ">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>组织名称</B></td>
					<td><input type="text" name="unit_name" id="unit_name" readonly="readonly" value="${pd.unit_name}" maxlength="40"
						 style="height: 20px; width: 300px;" placeholder="请输入需求单位名称"
						title="需求单位名称" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
					<span style="color:#C00;padding-right: 4px;">*</span><B>省</B>
					<input type="hidden" id="provinces" disabled="disabled" value="${pd.province_id}"/>
					</td>
					<td><select class="chzn-select" name="unit_province" id="unit_province" disabled="disabled"
						data-placeholder="请选择省"  style="height: 20px; width: 315px;">
										<option value=""></option>
										<c:forEach items="${provincelist}" var="pr">
											<option value="${pr.id }" <c:if test="${pr.id == pd.unit_province}">selected</c:if>>${pr.name }</option>
										</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
					<span style="color:#C00;padding-right: 4px;">*</span><B>市</B></td>
					<td><select class="chzn-select" name="unit_city" id="unit_city" disabled="disabled"
						data-placeholder="请选择市"  style="height: 20px; width: 315px;">
										 <option value=""></option>
										<c:forEach items="${citylist}" var="city">
											<option value="${city.id }" <c:if test="${city.id == pd.unit_city}">selected</c:if>>${city.name }</option>
										</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
					<span style="color:#C00;padding-right: 4px;">*</span><B>区</B></td>
					<td><select class="chzn-select" name="unit_county" id="unit_county" disabled="disabled"
						data-placeholder="请选择区"  style="height: 20px; width: 315px;">
										 <option value=""></option>
										<c:forEach items="${countylist}" var="ar">
											<option value="${ar.id }" <c:if test="${ar.id == pd.unit_county}">selected</c:if>>${ar.name }</option>
										</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>成立时间</B>
					</td>
					<td><input name="unit_time" id="unit_time" readonly="readonly" class="Wdate" value="${pd.unit_time}" type="text" readonly="readonly" placeholder="请选择成立日期" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>需求单位地址</B></td>
					<td><input type="text" name="unit_address" id="unit_address" readonly="readonly" value="${pd.unit_address}" maxlength="80"
						 style="height: 20px; width: 300px;" placeholder="请输入需求单位地址"
						title="需求单位地址" onblur="trim(this);" /></td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>联系人</B></td>
					<td><input type="text" name="unit_linkman" id="unit_linkman" readonly="readonly" value="${pd.unit_linkman}" maxlength="20"
						 style="height: 20px; width: 300px;" placeholder="请输入联系人"
						title="联系人" onblur="trim(this);" /></td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>联系人手机号</B></td>
					<td><input type="text" name="unit_phone" id="unit_phone" readonly="readonly" value="${pd.unit_phone}" maxlength="20"
						 style="height: 20px; width: 300px;" placeholder="请输入联系人手机号"
						title="联系人手机号" onblur="trim(this);" /></td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>联系人身份证</B></td>
					<td><input type="text" name="unit_idcard" id="unit_idcard" readonly="readonly" value="${pd.unit_idcard}" maxlength="20"
						 style="height: 20px; width: 300px;" placeholder="请输入联系人身份证"
						title="联系人身份证" onblur="trim(this);" /></td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>Email</B></td>
					<td><input type="text" name="unit_email" id="unit_email" readonly="readonly" value="${pd.unit_email}" maxlength="50"
						 style="height: 20px; width: 300px;" placeholder="请输入email"
						title="email" onblur="trim(this);" /></td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>简介</B></td>
					<td><textarea id="unit_desc" name="unit_desc" readonly="readonly" value="${pd.unit_desc}" maxlength="10000" 
							style="width:600px; height:200px;" 
							title="简介"></textarea></td>
				</tr>
				<tr>
					<td nowrap="nowrap" style="width: 80px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>原因</B>
					</td>
					<td><textarea id="reason" name="reason" maxlength="500" style="min-height: 200px;width: 600px;"></textarea></td>
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
			<a class="btn  btn-success" onclick="save('1');"><i class="icon-save"></i>通过</a> 
			<a class="btn  btn-success" onclick="save('2');"><i class="icon-save"></i>不通过</a> 
			<a class="btn  btn-light" onclick="top.Dialog.close();"><i class=" icon-circle-arrow-left"></i>返回</a>
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
		//关联下拉菜单
		$(function(){
			//市职单位
		
		});
		
		
	</script>
	<!-- 富文本编辑器end -->

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
			
		});
		
		//保存
		function save(status) {
			if(status=='2'){
				if ($("#reason").val() == "") {
					$("#reason").tips({
						side : 3,
						msg : '请输入原因',
						bg : '#FF5080',
						time : 2
					});
					$("#reason").focus();
					return false;
				}
			}
			
			$("#Form").attr("action","<%=basePath%>volunteerUnit/updateExamine.do?status="+status);
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
	</script>
</body>
</html>