<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8" />
<title>系统用户添加页面</title>
<meta name="description" content="overview & stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="static/css/bootstrap.min.css" rel="stylesheet" />
<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link rel="stylesheet" href="static/css/font-awesome.min.css" />
<!-- 下拉框 -->
<link rel="stylesheet" href="static/css/chosen.css" />
<link rel="stylesheet" href="static/css/ace.min.css" />
<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
<link rel="stylesheet" href="static/css/ace-skins.min.css" />
<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script type="text/javascript">
	
	function ismail(mail){
		return(new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
	}
	
	//判断邮箱是否存在
	function hasE(USERNAME){
		var EMAIL = $.trim($("#EMAIL").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>sysUser/hasE.do',
	    	data: {EMAIL:EMAIL,USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#EMAIL").tips({
							side:3,
				            msg:'邮箱已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					setTimeout("$('#EMAIL').val('')",2000);
				 }
			}
		});
	}
	
	//判断编码是否存在
	function hasN(USERNAME){
		var NUMBER = $.trim($("#NUMBER").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>sysUser/hasN.do',
			data : {
				NUMBER : NUMBER,
				USERNAME : USERNAME,
				tm : new Date().getTime()
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				if ("success" != data.result) {
					$("#NUMBER").tips({
						side : 3,
						msg : '编号已存在',
						bg : '#AE81FF',
						time : 3
					});
					setTimeout("$('#NUMBER').val('')", 2000);
				}
			}
		});
	}
</script>
</head>
<body>
	<form action="sysUser/saveU.do" name="userForm" id="userForm" method="post">
		<input type="hidden" name="USER_ID" id="user_id" value="${pd.USER_ID }"/>
		<input type="hidden" id="flag" name="flag"/>
		<div id="zhongxin">
			<table class="table ">
				<tr>
					<td>
						<label class="control-label" style="padding-top: 8px; width: 100px; float: right;" for="role_id"> 角色：</label>
					</td>
					<td>
						<select class="chzn-select" name="ROLE_ID" id="role_id" data-placeholder="请选择角色" style="vertical-align: top;">
							<option value=""></option>
							<c:forEach items="${roleList}" var="role">
								<option value="${role.ROLE_ID }">${role.ROLE_NAME }</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<label id="label0" class="control-label" style="padding-top: 8px; width: 100px; float: right;" for="unit"> 所属单位：</label>
						<label id="label1" class="control-label" style="padding-top: 8px; width: 100px; float: right; display: none;" for="unit"> 志愿者协会：</label>
						<label id="label2" class="control-label" style="padding-top: 8px; width: 100px; float: right; display: none;" for="unit"> 志愿者组织：</label>
						<label id="label3" class="control-label" style="padding-top: 8px; width: 100px; float: right; display: none;" for="unit"> 需求单位：</label>
					</td>
					<td id="td0">
						<select class="chzn-select" name="unit" id="unit" data-placeholder="请选择所属单位" style="vertical-align: top;" >
							<option value=""></option>
							<c:forEach items="${pdList}" var="list">
								<option value="${list.unit_id}">${list.unit_name_full}</option>
							</c:forEach>
						</select>
					</td>
					<td id="td1" style="display: none;">
						<select class="chzn-select" name="association_id" id="association_id" data-placeholder="请选择志愿者协会" style="vertical-align: top;" >
							<option value=""></option>
							<c:forEach items="${associationList}" var="list">
								<option value="${list.association_id}">${list.association_name}</option>
							</c:forEach>
						</select>
					</td>
					<td id="td2" style="display: none;">
						<select class="chzn-select" name="organization_id" id="organization_id" data-placeholder="请选择志愿者组织" style="vertical-align: top;" >
							<option value=""></option>
							<c:forEach items="${organizationList}" var="list">
								<option value="${list.organization_id}">${list.organization_name}</option>
							</c:forEach>
						</select>
					</td>
					<td id="td3" style="display: none;">
						<select class="chzn-select" name="volunteer_unit_id" id="volunteer_unit_id" data-placeholder="请选择需求单位" style="vertical-align: top;" >
							<option value=""></option>
							<c:forEach items="${volunteerUnitList}" var="list">
								<option value="${list.unit_id}">${list.unit_name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>
					<label class="control-label" style="padding-top: 8px; width: 100px; float: right;" for="loginname">用户名：</label></td>
					<td>
						<input type="text" name="USERNAME" id="loginname" maxlength="32" class="gbkOrAbc" placeholder="这里输入用户名" title="用户名" onblur="trim(this);"/>
					</td>
					<td>
						<label class="control-label" style="padding-top: 8px; width: 100px; float: right;" for="BZ">备&#12288;&#12288;注：</label>
					</td>
					<td>
						<input type="text" name="BZ" id="BZ" placeholder="这里输入备注" maxlength="64" title="备注" onblur="trim(this);"/>
					</td>
<!-- 					<td> -->
<!-- 						<label class="control-label" style="padding-top: 8px; width: 100px; float: right;" for="NUMBER">编&#12288;&#12288;号：</label> -->
<!-- 					</td> -->
<!-- 					<td> -->
<%-- 						<input type="number" name="NUMBER" id="NUMBER" value="${pd.NUMBER }" min="1" maxlength="32" class="gbkOrAbc" placeholder="这里输入编号" title="编号" onblur="trim(this);"/> --%>
<!-- 					</td> -->
				</tr>
				<tr id="pwd">
					<td>
						<label class="control-label" style="padding-top: 8px; width: 100px; float: right;" for="password">密&#12288;&#12288;码：</label>
					</td>
					<td>
						<input type="password" name="PASSWORD" id="password" maxlength="20" class="gbkOrAbc" placeholder="这里输入密码" title="密码"/>
					</td>
					<td>
						<label class="control-label" style="padding-top: 8px; width: 100px; float: right;" for="chkpwd">确认密码：</label>
					</td>
					<td>
						<input type="password" name="chkpwd" id="chkpwd" maxlength="20" class="gbkOrAbc" placeholder="这里输入确认密码" title="确认密码"/>
					</td>
				</tr>
				<tr>
					<td>
						<label class="control-label" style="padding-top: 8px; width: 100px; float: right;" for="name">联系人：</label>
					</td>
					<td>
						<input type="text" name="NAME" id="name" class="gbkOrName" maxlength="32" placeholder="这里输入联系人" title="联系人" onblur="trim(this);"/>
					</td>
					<td>
						<label class="control-label" style="padding-top: 8px; width: 100px; float: right;" for="PHONE">手机号：</label>
					</td>
					<td>
						<input type="text" name="PHONE" id="PHONE" maxlength="11" placeholder="这里输入手机号" title="手机号" onkeyup="value=value.replace(/[^0-9]/g,'')" onblur="delZero(this);" style="ime-mode:disabled"/>
					</td>
				</tr>
<!-- 				<tr> -->
<!-- 					<td> -->
<!-- 						<label class="control-label" style="padding-top: 8px; width: 100px; float: right;" for="EMAIL">邮&#12288;&#12288;箱：</label> -->
<!-- 					</td> -->
<!-- 					<td> -->
<%-- 						<input type="email" name="EMAIL" id="EMAIL" value="${pd.EMAIL}" maxlength="32" placeholder="这里输入邮箱" title="邮箱" onblur="trim(this);"/> --%>
<!-- 					</td> -->
					
<!-- 				</tr> -->
				<c:if test="${is_super_admin}">
					<tr>
						<td>
							<label class="control-label" style="padding-top: 8px; width: 100px; float: right;" for="is_super_admin">超级管理员</label>
						</td>
						<td>
							<input type="checkbox" name="is_super_admin"  value="1" placeholder="选择是否是超级管理员" title="是否是超级管理员" style="opacity:1;position: relative;"/>
						</td>
					</tr>
				</c:if>
				<tr>
					<td style="text-align: center;" colspan="10"><a
						class="btn btn-mini btn-primary" onclick="save();">保存</a> <a
						class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
					</td>
				</tr>
			</table>
		</div>

		<div id="zhongxin2" class="center" style="display: none">
			<br /> <br /> <br /> <br /> <img src="static/images/jiazai.gif" /><br />
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
	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->

	<script type="text/javascript">
		$(function() {
			$(top.hangge());
			//单选框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});

			$("#role_id").change(function(){
				$.ajax({
					type: "POST",
					url: '<%=basePath%>sysUser/check.do',
			    	data: 
			    		{
			    			roleId:$("#role_id").val(),
			    			tm:new Date().getTime()
			    		},
					dataType:'json',
					cache: false,
					success: function(data){
						var flag;
						if(data.flag=="1"){//志愿者协会
							$("#label1").show();
							$("#label0").hide();
							$("#label2").hide();
							$("#label3").hide();
							$("#td1").show();
							$("#td0").hide();
							$("#td2").hide();
							$("#td3").hide();
							$("#unit").val("").change();
							$("#unit").trigger("liszt:updated");
							$("#organization_id").val("").change();
							$("#organization_id").trigger("liszt:updated");
							$("#volunteer_unit_id").val("").change();
							$("#volunteer_unit_id").trigger("liszt:updated");
							flag = "1";
						}else if(data.flag=="2"){//志愿者组织
							$("#label2").show();
							$("#label0").hide();
							$("#label1").hide();
							$("#label3").hide();
							$("#td2").show();
							$("#td0").hide();
							$("#td1").hide();
							$("#td3").hide();
							$("#unit").val("").change();
							$("#unit").trigger("liszt:updated");
							$("#association_id").val("").change();
							$("#association_id").trigger("liszt:updated");
							$("#volunteer_unit_id").val("").change();
							$("#volunteer_unit_id").trigger("liszt:updated");
							flag = "2";
						}else if(data.flag=="3"){//志愿者需求单位
							$("#label3").show();
							$("#label0").hide();
							$("#label1").hide();
							$("#label2").hide();
							$("#td3").show();
							$("#td0").hide();
							$("#td1").hide();
							$("#td2").hide();
							$("#unit").val("").change();
							$("#unit").trigger("liszt:updated");
							$("#association_id").val("").change();
							$("#association_id").trigger("liszt:updated");
							$("#organization_id").val("").change();
							$("#organization_id").trigger("liszt:updated");
							flag = "3";
						}else{
							$("#label0").show();
							$("#label1").hide();
							$("#label2").hide();
							$("#label3").hide();
							$("#td0").show();
							$("#td1").hide();
							$("#td2").hide();
							$("#td3").hide();
							$("#volunteer_unit_id").val("").change();
							$("#volunteer_unit_id").trigger("liszt:updated");
							$("#association_id").val("").change();
							$("#association_id").trigger("liszt:updated");
							$("#organization_id").val("").change();
							$("#organization_id").trigger("liszt:updated");
							flag = "0";
						}
						$("#flag").val(flag);
					}
				});
			});
			
		});
		
		//判断用户名是否存在
		function hasU(){
			var USERNAME = $.trim($("#loginname").val());
			$.ajax({
				type: "POST",
				url: '<%=basePath%>sysUser/hasU.do',
		    	data: 
		    		{
		    			USERNAME:USERNAME,
		    			tm:new Date().getTime()
		    		},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("success" == data.result){
						$("#userForm").submit();
						$("#zhongxin").hide();
						$("#zhongxin2").show();
					 }else{
						 $("#loginname").tips({
								side:3,
					            msg:'此用户已存在！',
					            bg:'#AE81FF',
					            time:2
					     });
						$("#loginname").focus();
					 }
				}
			});
		}
		
		//保存
		function save(){
			var flag = $("#flag").val();
			
			if($("#role_id").val()==""){
				$("#role_id").tips({
					side:3,
		            msg:'请选择角色',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#role_id").focus();
				return false;
			}
			
			if(flag=="0"){
				if($("#unit").val()==""){
					$("#unit").tips({
						side:3,
			            msg:'请选择单位',
			            bg:'#AE81FF',
			            time:2
			        });
					$("#unit").focus();
					return false;
				}
			}else{
				$("#unit").val("1625");//志愿者协会
				if(flag=="1"){
					if($("#association_id").val()==""){
						$("#association_id").tips({
							side:3,
				            msg:'请选择志愿者协会',
				            bg:'#AE81FF',
				            time:2
				        });
						$("#association_id").focus();
						return false;
					}
				}else if(flag=="2"){
					if($("#organization_id").val()==""){
						$("#organization_id").tips({
							side:3,
				            msg:'请选择志愿者组织',
				            bg:'#AE81FF',
				            time:2
				        });
						$("#organization_id").focus();
						return false;
					}
				}else if(flag=="3"){
					if($("#volunteer_unit_id").val()==""){
						$("#volunteer_unit_id").tips({
							side:3,
				            msg:'请选择需求单位',
				            bg:'#AE81FF',
				            time:2
				        });
						$("#volunteer_unit_id").focus();
						return false;
					}
				}
			}
			
			if($("#loginname").val()==""){
				$("#loginname").tips({
					side:3,
		            msg:'请输入用户名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#loginname").focus();
				return false;
			}
// 			var myreg = /^(1)[0-9]{10}$/;
// 			if($("#PHONE").val()==""){
				
// 				$("#PHONE").tips({
// 					side:3,
// 		            msg:'请输入手机号',
// 		            bg:'#AE81FF',
// 		            time:3
// 		        });
// 				$("#PHONE").focus();
// 				return false;
// 			}else if($("#PHONE").val().length != 11 || !myreg.test($("#PHONE").val())){
// 				$("#PHONE").tips({
// 					side:3,
// 		            msg:'请输入正确的手机号格式',
// 		            bg:'#AE81FF',
// 		            time:3
// 		        });
// 				$("#PHONE").focus();
// 				return false;
// 			}
			if($("#password").val()==""){
				$("#password").tips({
					side:3,
		            msg:'请输入密码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#password").focus();
				return false;
			}
			if($("#chkpwd").val()==""){
				$("#chkpwd").tips({
					side:3,
		            msg:'请输入确认密码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#chkpwd").focus();
				return false;
			}
			if($("#password").val()!=$("#chkpwd").val()){
				$("#chkpwd").tips({
					side:3,
		            msg:'两次密码不相同',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#chkpwd").focus();
				return false;
			}
// 			if($("#name").val()==""){
// 				$("#name").tips({
// 					side:3,
// 		            msg:'请输入姓名',
// 		            bg:'#AE81FF',
// 		            time:3
// 		        });
// 				$("#name").focus();
// 				return false;
// 			}
			
			hasU()
			
		}
		
		
	</script>

</body>
</html>