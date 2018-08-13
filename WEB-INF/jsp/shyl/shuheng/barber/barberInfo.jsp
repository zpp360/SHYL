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
<title>理发师详情页面</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
	<link rel="stylesheet" type="text/css" href="shyl/css/uploadify.css">
<%@ include file="../../../system/admin/top.jsp"%>
<style type="text/css">
input[disabled] {
background: #ffffff;
}
</style>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script src="<%=basePath%>/shyl/js/layer/layer.js"></script>
<!-- 日期框 -->
</head>
<body>
<br>
	<form action="<%=basePath%>news/${msg }.do" name="Form" id="Form"
		method="post">
		<div id="zhongxin">
		<input type="hidden" name="news_id" id="news_id" value="${pd.news_id }"/>
			<table class="table ">
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>理发师姓名</B></td>
					<td><input type="text" name="BARBER_NAME" id="BARBER_NAME" maxlength="40"
						style="height: 20px; width: 300px;margin-top:2px" placeholder="请输入理发师姓名"
						title="理发师姓名" value="${pd.BARBER_NAME}" onblur="trim(this);" disabled="disabled" /></td>
				</tr>
				
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>性别</B></td>
					<td><select class="chzn-select" name="SEX" id="SEX"
						data-placeholder="请选择理发师性别"  style="height: 20px; width: 315px;" disabled="disabled">
								<option value="0" <c:if test="${0 == pd.category }">selected</c:if>>男</option>
								<option value="1"  <c:if test="${1 == pd.category }">selected</c:if>>女</option>

					</select></td>
				</tr>

				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>技能</B></td>
					<td><input type="text" name="BARBER_SKILL" id="BARBER_SKILL"
						maxlength="40" style="height: 20px; width: 300px;"
						placeholder="请输入技能" title="技能" value="${pd.BARBER_SKILL}" onblur="trim(this);" disabled="disabled"/></td>
				</tr>

				<tr>
				    <td style="width: 80px; text-align: left; padding-top: 13px;"><B>理发师照片</B></td>
					<td>
					<div class="form-group" id="businessDiv">
									<div class="col-sm-2">
										<p>
											<c:if test="${empty pd.barber_path}">
                                                <img src="<%=basePath%>shyl/images/temp.png" id="uploadImgL" 
												name="uploadImgL" style="width: 248px; height: 176px;" />
                                            </c:if>
                                            <c:if test="${!empty pd.barber_path}">
                                                    <img onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="<%=basePath%>${pd.barber_path}" id="uploadImgL" 
												name="uploadImgL" style="width: 248px; height: 176px;"/>
                                           	</c:if>
										</p>
									</div>
									<div class="col-sm-5" style="ma">
										<p>
										<span id="uploadify"></span>
										<div id="fileQueue"></div>
										<div id="file_upload-queue" class="uploadify-queue"></div>
										</p>
									</div>
						</div>
					</td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>工作开始时间</B></td>
					<td><input class="span10 date-picker" name="WORK_START_YMD" id="WORK_START_YMD" value="${pd.WORK_START_YMD}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="工作开始时间"  title="开通日期" style=" width: 300px" disabled="disabled"/></td>
				</tr>
				
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>工作场所</B>
					</td>
					
					<td><select class="chzn-select" name="BARBER_ADDRESS_ID" disabled="disabled" id="BARBER_ADDRESS_ID"
						data-placeholder="请选择机构名称"  style="height: 20px; width: 315px;">
										<option value=""></option>
										<c:forEach items="${barberaddresslist}" var="adr">
											<option value="${adr.id }" <c:if test="${adr.id == pd.BARBER_ADDRESS_ID}">selected</c:if>>${adr.value }</option>
										</c:forEach>
					</select></td>
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

			<!-- <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a> -->
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="<%=basePath%>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	<!-- 引入 -->
	<!-- 引入 -->
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<script src="shyl/js/jquery.uploadify.min.js" type="text/javascript"></script>
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
	<!-- 实例化编辑器 -->
	<script type="text/javascript">
		var ue = UE.getEditor("news_content",{readonly:true});
		//ueditor有标签文本

		function getContent() {
			var arr = [];
			arr.push(UE.getEditor('news_content').getContent());
			return arr.join("");
		}

		function clean() {
			ue.setContent("");
		}

		function setFocus() {
			UE.getEditor('news_content').focus();
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
				 language:  'zh-CN',
		            format: 'yyyy-mm',
		            weekStart: 1,
		            todayBtn:  'linked',
		            autoclose: 1,
		            todayHighlight: 1,
		            minViewMode: 'months', //这里就设置了默认视图为年视图
		            minView: 3, //设置最小视图为年视图
		            forceParse: 0
			});
		});
	</script>
	
	<script type="text/javascript">
		//返回
	    function returnback(){
	    	window.location.href="<%=basePath%>barber/list.do";
		}
	    function checkUrl(url,name){
			$.ajax({
				url: url,
				type: 'GET',
				complete: function(response) {
				   if(response.status == 200) {
					   return true;
				   } else {
					   layer.open({
						 	 title:'温馨提示' ,
					         type: 0,
					         shadeClose : true,
					         scrollbar : false,
					         area: ['100px'],
					         icon: 2,
							 skin: 'layui-layer-rim', 
							 content: '下载文件不存在'
					   	});
					   return false;
				   }
				  }
			});
		}
	</script>

</body>
</html>