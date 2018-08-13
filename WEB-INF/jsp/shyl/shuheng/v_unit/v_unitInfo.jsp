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
<title>志愿者需求单位详情</title>
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
					<td><input type="text" name="unit_name" id="unit_name" disabled="disabled" value="${pd.unit_name}" maxlength="40"
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
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>需求单位地址</B></td>
					<td><input type="text" name="unit_address" id="unit_address" disabled="disabled" value="${pd.unit_address}" maxlength="80"
						 style="height: 20px; width: 300px;" placeholder="请输入需求单位地址"
						title="需求单位地址" onblur="trim(this);" /></td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
					<span style="color:#C00;padding-right: 4px;">*</span><B>主管单位</B></td>
					<td>
						<select class="chzn-select" disabled="disabled" name="belong_unit_id" id="belong_unit_id" data-placeholder="请选择主管单位"  style="height: 20px; width: 315px;">
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
					<td><input name="unit_time" id="unit_time" disabled="disabled" class="Wdate" value="${pd.unit_time}" type="text" readonly="readonly" placeholder="请选择成立日期" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>联系人</B></td>
					<td><input type="text" name="unit_linkman" id="unit_linkman" disabled="disabled" value="${pd.unit_linkman}" maxlength="20"
						 style="height: 20px; width: 300px;" placeholder="请输入联系人"
						title="联系人" onblur="trim(this);" /></td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>联系人手机号</B></td>
					<td><input type="text" name="unit_phone" id="unit_phone" disabled="disabled" value="${pd.unit_phone}" maxlength="20"
						 style="height: 20px; width: 300px;" placeholder="请输入联系人手机号"
						title="联系人手机号" onblur="trim(this);" /></td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>联系人身份证</B></td>
					<td><input type="text" name="unit_idcard" id="unit_idcard" disabled="disabled" value="${pd.unit_idcard}" maxlength="20"
						 style="height: 20px; width: 300px;" placeholder="请输入联系人身份证"
						title="联系人身份证" onblur="trim(this);" /></td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>Email</B></td>
					<td><input type="text" name="unit_email" id="unit_email" disabled="disabled" value="${pd.unit_email}" maxlength="50"
						 style="height: 20px; width: 300px;" placeholder="请输入email"
						title="email" onblur="trim(this);" /></td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>简介</B></td>
					<td><textarea id="unit_desc" name="unit_desc" disabled="disabled" value="${pd.unit_desc}" maxlength="10000" 
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
		//关联下拉菜单
		$(function(){
			//市职单位
		
		});
		
		function BindCId(cid) {
			var PID = $("#mechanism1").val();
			$("#mechanism2").empty();
			$("#mechanism3").empty();
			if (PID == "") {
		        $("<option value=''></option>").appendTo("#mechanism2");
		    }else{
		    	$.ajax({
					type:"POST",
					url:"<%=basePath%>unit/getmechanism2List.do",
					data:{'PID' : PID},
					dataType:"json",
					cache:false,
					success:function(data){
						var html='<option value=""></option>';
						var html1 = '<option value=""></option>';
						$.each(data.mechanismlist2,function(i,list){
							if(list.id==cid){
								if(cid!=0){
									html+="<option value="+list.id+" selected='selected' >"+list.name+"</option>";
								}
							}else{
								html+="<option value="+list.id+">"+list.name+"</option>";
							}
						});
						
						$("#mechanism2").append(html);
						$("#mechanism2").trigger("liszt:updated");
						$("#mechanism3").append(html1);
						$("#mechanism3").trigger("liszt:updated");
					}
				});
		    }
		}
		
		function BindCId1(cid) {
			var PID = $("#mechanism2").val();
			$("#mechanism3").empty();
			if (PID == "") {
		        $("<option value=''></option>").appendTo("#mechanism3");
		    }else{
		    	$.ajax({
					type:"POST",
					url:"<%=basePath%>unit/getmechanism3List.do",
					data:{'PID' : PID},
					dataType:"json",
					cache:false,
					success:function(data){
						var html='<option value=""></option>';
						$.each(data.mechanismlist3,function(i,list){
							if(list.id==cid){
								if(cid!=0){
									html+="<option value="+list.id+" selected='selected' >"+list.name+"</option>";
								}
							}else{
								html+="<option value="+list.id+">"+list.name+"</option>";
							}
						});
						$("#mechanism3").append(html);
						$("#mechanism3").trigger("liszt:updated");
					}
				});
		    }
		}
		
		function BindCId2(cid) {
			var PID = $("#unit_province").val();
			$("#unit_city").empty();
			$("#unit_county").empty();
			if (PID == "") {
		        $("<option value=''></option>").appendTo("#unit_city");
		    }else{
		    	$.ajax({
					type:"POST",
					url:"<%=basePath%>unit/getcityList.do",
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
						$("#unit_city").append(html);
						$("#unit_city").trigger("liszt:updated");
						$("#unit_county").append(html1);
						$("#unit_county").trigger("liszt:updated");
					}
				});
		    }
		}
		
		function BindCId3(cid) {
			var PID = $("#unit_city").val();
			$("#unit_county").empty();
			if (PID == "") {
		        $("<option value=''></option>").appendTo("#unit_county");
		    }else{
		    	$.ajax({
					type:"POST",
					url:"<%=basePath%>unit/getareaList.do",
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
						$("#unit_county").append(html);
						$("#unit_county").trigger("liszt:updated");
					}
				});
		    }
		}
		
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
			//日期框
			$('.date-picker').datepicker();
			$('.date-picker1').datepicker({
				language : 'zh-CN',
				format : 'yyyy-mm',
				weekStart : 1,
				todayBtn : 'linked',
				autoclose : 1,
				todayHighlight : 1,
				minViewMode : 'months', //这里就设置了默认视图为年视图
				minView : 3, //设置最小视图为年视图
				forceParse : 0
			});
		});
	</script>
	<!-- 附件上传 -->
	<script type="text/javascript">
	var tips=function(id,msg){
		$("#"+id).tips({
			side : 2,
			msg : msg,
			bg : '#FF5080',
			time : 2
		});
	}
	 </script>
</body>
</html>