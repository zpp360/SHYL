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
<title>政策发布_济南市服务外包公共服务平台</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../../system/admin/top.jsp"%>
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<!-- 日期框 -->
<script type="text/javascript">
	//保存
	function save() {
		if ($("#unit_name").val() == "") {
			$("#unit_name").tips({
				side : 3,
				msg : '请输入单位名称',
				bg : '#FF5080',
				time : 2
			});
			$("#unit_name").focus();
			return false;
		}
		
		var flag = false;
		$.ajax({
			type : "POST",
			url : "<%=basePath%>unit/hasUnitName.do?tm=" + new Date().getTime(),
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
				msg : '单位名称已存在',
				bg : '#FF5080',
				time : 2
			});
			$("#unit_name").focus();
			return false;
		}
		
		if ($("#unit_name_abbreviation").val() == "") {
			$("#unit_name_abbreviation").tips({
				side : 3,
				msg : '请输入简称',
				bg : '#FF5080',
				time : 2
			});
			$("#unit_name").focus();
			return false;
		}
		if($("#province").val() != "6001"){
			if ($("#city").val() == "") {
				$("#city").tips({
					side : 3,
					msg : '请选择市',
					bg : '#FF5080',
					time : 2
				});
				return false;
			}
			if($("#city").val() != "6002"){
				if ($("#area").val() == "") {
					$("#area").tips({
						side : 3,
						msg : '请选择区',
						bg : '#FF5080',
						time : 2
					});
					return false;
				}
			}
		}
		
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
</script>
<style type="text/css">
.upload{
	float: left;width: 60%;position: relative;
}
.upload a{
	position: absolute;
	left: 230px;
	top:0;
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
.upload p i{
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
</style>
</head>
<body>
<br>
	<form action="<%=basePath%>unit/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="url" value="${url }" />
		<input type="hidden" name="unit_id" value="${unit_id }" />
		<div id="zhongxin">
			<table class="table ">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>单位全称</B></td>
					<td><input type="text" name="unit_name" id="unit_name" maxlength="40"
						 style="height: 20px; width: 300px;" placeholder="请输入全称名称"
						title="全称" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>单位简称</B></td>
					<td><input type="text" name="unit_name_abbreviation" id="unit_name_abbreviation" maxlength="40"
						 style="height: 20px; width: 300px;" placeholder="请输入简称名称"
						title="简称" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>上级单位</B>
					</td>
					<td><select class="chzn-select" name="unit_p_id" id="unit_p_id"
						data-placeholder="请选择上级单位"  style="height: 20px; width: 315px;">
										<option value=""></option>
										<c:forEach items="${pList}" var="pr">
											<option value="${pr.unit_id }" <c:if test="${pr.unit_id == pd.unit_p_id}">selected</c:if>>${pr.unit_name_full }</option>
										</c:forEach>
					</select></td>
				</tr>
				
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
					<span style="color:#C00;padding-right: 4px;">*</span><B>省</B>
					<input type="hidden" id="provinces" value="${pd.province_id}"/>
					</td>
					<td><select class="chzn-select" name="province" id="province"
						data-placeholder="请选择省"  style="height: 20px; width: 315px;">
										<option value=""></option>
										<c:forEach items="${provincelist}" var="pr">
											<option value="${pr.id }" <c:if test="${pr.id == pd.province_id}">selected</c:if>>${pr.name }</option>
										</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
					<span style="color:#C00;padding-right: 4px;">*</span><B>市</B></td>
					<td><select class="chzn-select" name="city" id="city"
						data-placeholder="请选择市"  style="height: 20px; width: 315px;">
										 <option value=""></option>
										<c:forEach items="${citylist}" var="city">
											<option value="${city.id }" <c:if test="${city.id == pd.city_id}">selected</c:if>>${city.name }</option>
										</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
					<span style="color:#C00;padding-right: 4px;">*</span><B>区</B></td>
					<td><select class="chzn-select" name="area" id="area"
						data-placeholder="请选择区"  style="height: 20px; width: 315px;">
										 <option value=""></option>
										<c:forEach items="${countylist}" var="ar">
											<option value="${ar.id }" <c:if test="${ar.id == pd.area_id}">selected</c:if>>${ar.name }</option>
										</c:forEach>
					</select></td>
				</tr>
				
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>单位地址</B></td>
					<td><input type="text" name="unit_address" id="unit_address" maxlength="80"
						 style="height: 20px; width: 300px;" placeholder="请输入单位地址"
						title="政策名称" onblur="trim(this);" /></td>
					
				</tr>
				<tr>
					<td nowrap="nowrap"
						style="width: 80px; text-align: left; padding-top: 13px;"><B>单位介绍</B></td>
					<td><textarea id="unit_content" name="unit_content" maxlength="10000" 
							style="min-height: 250px; margin: 0 auto; width: 80%;float:left" 
							title="单位介绍"></textarea></td>
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
			<a class="btn  btn-light" onclick="returnback()"><i class=" icon-circle-arrow-left"></i>返回</a>
			<!-- <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a> -->
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
			var knowledges = $("#provinces").val();
			if(""!=knowledges){
				BindCId2(knowledges);
			}else{
				BindCId2(0);
			}
			$("#province").change(function() {
			    BindCId2(0);
			});
			
			
			$("#city").change(function() {
			    BindCId3(0);
			});
			
			//合并的：$(function(){});
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
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
			var PID = $("#province").val();
			$("#city").empty();
			$("#area").empty();
			if (PID == "") {
		        $("<option value=''></option>").appendTo("#city");
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
						$("#city").append(html);
						$("#city").trigger("liszt:updated");
						$("#area").append(html1);
						$("#area").trigger("liszt:updated");
					}
				});
		    }
		}
		
		function BindCId3(cid) {
			var PID = $("#city").val();
			$("#area").empty();
			if (PID == "") {
		        $("<option value=''></option>").appendTo("#area");
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
						$("#area").append(html);
						$("#area").trigger("liszt:updated");
					}
				});
		    }
		}
		
	</script>
	<!-- 富文本编辑器end -->

	<script type="text/javascript">
		$(top.hangge());
		//返回
	    function returnback(){
			var url = $("input[name='url']").val();
	    	window.location.href="<%=basePath%>unit/list.do"+url;
		}
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