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
<title>用户报名页面</title>
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
	<form action="" name="Form" id="Form" method="post">
		<input type="hidden" id="user_id" name="user_id"/>
		<input type="hidden" id="sign_up_id" name="sign_up_id" value="${pd.sign_up_id}"/>
		<div id="zhongxin">
			<table class="table">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span>手机号
					</td>
					<td colspan="3">
						<input type="text" name="user_phone" id="user_phone" maxlength="11" style="height: 20px; width: 150px;" placeholder="请输入手机号" title="手机号" onblur="trim(this);"/>
						<a class="btn btn-mini btn-primary" style="margin-top: -10px;margin-left: 10px;" onclick="checkPhone();" title="查看">确定</a>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span>姓名
					</td>
					<td colspan="3">
						<input type="text" name="user_name" id="user_name" readonly="readonly" style="height: 20px; width: 200px;" onblur="trim(this);"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span>性别
					</td>
					<td colspan="3">
						<input type="text" name="user_sex" id="user_sex" readonly="readonly" style="height: 20px; width: 200px;" onblur="trim(this);"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span>民族
					</td>
					<td colspan="3">
						<input type="text" name="user_mz" id="user_mz" readonly="readonly" style="height: 20px; width: 200px;" onblur="trim(this);"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span>单位
					</td>
					<td colspan="3">
						<input type="text" name="user_unit" id="user_unit" readonly="readonly" style="height: 20px; width: 200px;" onblur="trim(this);"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span>职务
					</td>
					<td colspan="3">
						<input type="text" name="user_job" id="user_job" readonly="readonly" style="height: 20px; width: 200px;" onblur="trim(this);"/>
					</td>
				</tr>
				<c:if test="${pd.is_hotel == '1'}">
					<tr>
						<td style="width: 100px; text-align: left; padding-top: 13px;">
						    是否住宿
						</td>
						<td>
							<input type="checkbox" name="is_hotel" id="is_hotel" value="0" title="是否住宿" style="opacity:1;position: relative;"/>
						</td>
					</tr>
				</c:if>
			</table>
		</div>
		<div align="center" style="margin-top: 10px;">
			<a class="btn  btn-success" onclick="save();"><i class="icon-save"></i>报名</a> 
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
				
				//是否住宿
				$("#is_hotel").click(function(){
					if(this.checked){
						$("#is_hotel").val("1");
					}else{
						$("#is_hotel").val("0");
					}
				});
				
			});
			
			//确定
			function checkPhone(){
				
				var user_phone = $("#user_phone").val();
				
				if(user_phone==""){
					$("#user_phone").tips({
		    			side : 3,
		    			msg : '请输入手机号',
		    			bg : '#FF5080',
		    			time : 2
		    		});
		    		$("#user_phone").focus();
		    		return false;
				}
				
				$.ajax({
					type:"POST",
					url:"<%=basePath%>sign_up/checkPhone.do",
					data:
						{
						user_phone:user_phone
						},
					dataType:"json",
					cache:false,
					success:function(data){
						if(data!=null){
							$("#user_id").val(data.user_id);
							$("#user_name").val(data.user_name);
							$("#user_sex").val(data.user_sex);
							$("#user_mz").val(data.mz_name);
							$("#user_unit").val(data.UNIT_NAME_FULL);
							$("#user_job").val(data.user_job);
						}else{
							$("#user_id").val("");
							$("#user_name").val("");
							$("#user_sex").val("");
							$("#user_mz").val("");
							$("#user_unit").val("");
							$("#user_job").val("");
							$("#user_phone").tips({
				    			side : 3,
				    			msg : '无此用户！',
				    			bg : '#FF5080',
				    			time : 2
				    		});
				    		$("#user_phone").focus();
						}
					}
				});
				
			}
			
			//返回
		    function returnback(){
		    	top.Dialog.close();
			}
			
			function save(){
				var user_id = $("#user_id").val();
				var sign_up_id = $("#sign_up_id").val();
				var is_hotel = $("#is_hotel").val();
				if(user_id==""){
					$("#user_phone").tips({
		    			side : 3,
		    			msg : '无此用户！',
		    			bg : '#FF5080',
		    			time : 2
		    		});
		    		$("#user_phone").focus();
		    		return false;
				}
				
				$.ajax({
					type:"POST",
					url:"<%=basePath%>sign_up/saveSignUpUser.do",
					data:
						{
						user_id:user_id,
						sign_up_id:sign_up_id,
						is_hotel:is_hotel
						},
					dataType:"json",
					cache:false,
					success:function(data){
						if(data){
							window.parent.frames[2].location.reload();
					    	top.Dialog.close();
						}else{
							$("#user_phone").tips({
				    			side : 3,
				    			msg : '该用户已报名！',
				    			bg : '#FF5080',
				    			time : 2
				    		});
				    		$("#user_phone").focus();
						}
						
					}
				});
				
			}
	
	</script>
</body>
</html>