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
<title>志愿者协会详情</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../../system/admin/top.jsp"%>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<!-- 日期框 -->
</head>
<body>
<br>
	<form action="" name="Form" id="Form" method="post">
		<div id="zhongxin">
			<table class="table ">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color:#C00;padding-right: 4px;">*</span><B>协会名称</B>
					</td>
					<td>
						<input type="text" disabled="disabled"  name="association_name" id="association_name" value="${pd.association_name}" maxlength="40" style="height: 20px; width: 300px;" placeholder="请输入协会名称" title="协会名称" onblur="trim(this);"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<B>上级协会</B>
					</td>
					<td>
						<select class="chzn-select" disabled="disabled" name="parent_id" id="parent_id" data-placeholder="请选择上级协会"  style="height: 20px; width: 315px;">
							<option value=""></option>
							<c:forEach items="${pList}" var="pr">
								<option value="${pr.association_id}" <c:if test="${pr.association_id==pd.parent_id}">selected</c:if>>${pr.association_name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color:#C00;padding-right: 4px;">*</span><B>省</B>
						<input type="hidden" id="provinces" value="${pd.province_id}"/>
					</td>
					<td>
						<select class="chzn-select" disabled="disabled" name="association_province" id="association_province" data-placeholder="请选择省"  style="height: 20px; width: 315px;">
							<option value=""></option>
							<c:forEach items="${provincelist}" var="pr">
								<option value="${pr.id }" <c:if test="${pr.id == pd.association_province}">selected</c:if>>${pr.name }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color:#C00;padding-right: 4px;">*</span><B>市</B>
					</td>
					<td>
						<c:if test="${not empty cityList}">
							<select class="chzn-select" disabled="disabled" name="association_city" id="association_city" data-placeholder="请选择市" style="height: 20px; width: 315px;">
								<option value=""></option>
								<c:forEach items="${cityList}" var="city">
									<option value="${city.id }" <c:if test="${city.id == pd.association_city}">selected</c:if>>${city.name }</option>
								</c:forEach>
							</select>
						</c:if> 
						<c:if test="${empty cityList}">
							<select class="chzn-select" disabled="disabled" name="association_city" id="association_city" data-placeholder="请选择市" style="height: 20px; width: 315px;">
								<option value=""></option>
							</select>
						</c:if> 
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color:#C00;padding-right: 4px;">*</span><B>区</B>
					</td>
					<td>
						<c:if test="${not empty areaList}">
							<select class="chzn-select" disabled="disabled" name="association_county" id="association_county" data-placeholder="请选择区" style="height: 20px; width: 315px;">
								<option value=""></option>
								<c:forEach items="${areaList}" var="ar">
									<option value="${ar.id }"<c:if test="${ar.id == pd.association_county}">selected</c:if>>${ar.name }</option>
								</c:forEach>
						</select>
						</c:if>
						<c:if test="${empty areaList}">
							<select class="chzn-select" disabled="disabled" name="association_county" id="association_county" data-placeholder="请选择区" style="height: 20px; width: 315px;">
							<option value=""></option>
							</select>
						</c:if>
					</td>
				</tr>
				
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<B>单位地址</B>
					</td>
					<td>
						<input type="text" disabled="disabled" name="association_address" id="association_address" value="${pd.association_address}" maxlength="80" style="height: 20px; width: 300px;" placeholder="请输入协会地址" title="协会地址" onblur="trim(this);" />
					</td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<B>联系人</B>
					</td>
					<td>
						<input type="text" disabled="disabled" name="association_linkman" id="association_linkman" value="${pd.association_linkman}" maxlength="20" style="height: 20px; width: 300px;" placeholder="请输入协会联系人" title="联系人" onblur="trim(this);"/>
					</td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<B>联系人手机号</B>
					</td>
					<td>
						<input type="text" disabled="disabled" name="association_linkphone" id="association_linkphone" value="${pd.association_linkphone}" maxlength="11" style="height: 20px; width: 300px;" placeholder="请输入联系人手机号" title="联系人手机号" onkeyup="value=value.replace(/[^0-9]/g,'')" onblur="trim(this);" />
					</td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<B>协会简介</B>
					</td>
					<td colspan='2'>
						<textarea id="association_desc" disabled="disabled" name="association_desc" maxlength="500" style="width:600px; height:200px;" title="协会介绍">${pd.association_desc}</textarea>
					</td>
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
			<a class="btn  btn-light" onclick="returnback()"><i class=" icon-circle-arrow-left"></i>返回</a>
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
			$("#association_province").change(function(){
				var association_province = $("#association_province").val();
				$.ajax({
					type: "POST",
					url: "<%=basePath%>association/selectCity.do",
					data : {
						association_province : association_province
					},
						dataType : "json",
						cache : false,
						success : function(data) {
							var html = '<option value=""></option>';
							var html_area = '<option value=""></option>';
							$("#association_city").empty();
							$("#association_county").empty();
							$.each(data.cityList, function(i, obj) {
								html += "<option value="+obj.id+">"+ obj.name + "</option>";
							});
							$("#association_city").append(html);
							$("#association_city").trigger("liszt:updated");
							$("#association_county").append(html_area);
							$("#association_county").trigger("liszt:updated");
						}
				});
			});

			//选择区县
			$("#association_city").change(function(){
				var association_city = $("#association_city").val();
				$.ajax({
					type:"POST",
					url:"<%=basePath%>association/selectArea.do",
					data:
						{
						association_city:association_city
						},
					dataType:"json",
					cache:false,
					success:function(data){
						var html='<option value=""></option>';
						$("#association_county").empty();
						$.each(data.areaList,function(i,obj){
							html += "<option value="+obj.id+">"+obj.name+"</option>";
						});
						$("#association_county").append(html);
						$("#association_county").trigger("liszt:updated");
					}
				});
			});
			
		});
		
		//返回
	    function returnback(){
	    	top.Dialog.close();
		}
		
	</script>
</body>
</html>