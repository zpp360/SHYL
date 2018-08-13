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
<title>年度评选添加页面</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../../system/admin/top.jsp"%>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<!-- 日期框 -->
</head>
<body>
<br>
	<form action="<%=basePath%>volunteerYearAward/saveYearAward.do" name="Form" id="Form" method="post">
		<div id="zhongxin">
			<table class="table ">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color:#C00;padding-right: 4px;">*</span><B>级别</B>
					</td>
					<td>
						<select class="chzn-select" name="award_level" id="award_level" disabled="disabled">
							<c:if test="${pd.flag=='1'}">
								<option value="1">省级</option>
							</c:if>
							<c:if test="${pd.flag=='2'}">
								<option value="2">市级</option>
							</c:if>
							<c:if test="${pd.flag=='3'}">
								<option value="3">县级</option>
							</c:if>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>年度</B>
					</td>
					<td>
						<input name="award_time" id="award_time" class="Wdate" type="text" readonly="readonly" placeholder="请选择年份" onclick="WdatePicker({dateFmt:'yyyy',isShowClear:true});"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>奖项名称</B></td>
					<td>
						<select id="award_name" class="chzn-select" name="award_name"  data-placeholder="请选择获奖名称">
								<option value=""></option>
								<c:forEach items="${typeList}" var="list">
									<option value="${list.distinguish_id}">${list.value}</option>
								</c:forEach>
						</select>
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
		//关联下拉菜单
		$(function(){
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
			
			$("[disabled]").each(function() {//移除disable,后台方可取值
				if (parseInt($(this).val()) != -1) {
					$(this).attr("disabled", false);
				}
			});
			
			
		});
		
		//保存
		function save() {
			if ($("#award_level").val() == "") {
				$("#award_level").tips({
					side : 3,
					msg : '请选择级别',
					bg : '#FF5080',
					time : 2
				});
				$("#award_level").focus();
				return false;
			}
			
			if ($("#award_time").val() == "") {
				$("#award_time").tips({
					side : 3,
					msg : '请选择年份',
					bg : '#FF5080',
					time : 2
				});
				$("#award_time").focus();
				return false;
			}
			if ($("#award_name").val() == "") {
				$("#award_name").tips({
					side : 3,
					msg : '请选择奖项名称',
					bg : '#FF5080',
					time : 2
				});
				$("#award_name").focus();
				return false;
			}
			
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
	</script>
</body>
</html>