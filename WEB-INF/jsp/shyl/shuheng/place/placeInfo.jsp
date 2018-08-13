<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>场地详情页面</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../../system/admin/top.jsp"%>
<link rel="stylesheet" href="shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="shyl/fileupload/css/jquery.fileupload-ui.css">
<script src="shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
<script src="shyl/fileupload/js/jquery.fileupload.js"></script>
<script src="shyl/fileupload/js/jquery.fileupload-process.js"></script>
<script src="shyl/fileupload/js/jquery.fileupload-validate.js"></script>
<script src="shyl/fileupload/js/jquery.iframe-transport.js"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<style>
.upload_img{
	float: left;width: 60%;position: relative;
}
.upload_img img{float: left;}
.upload_img a{
	position: absolute;
	left: 210px;
	top:0;
	font-size: 0.85em;
	border:0;
	background-color: #3961c2;
	color: #fff;
	padding: 0;
	width: 160px;
	text-align: center;
	height: 50px;
	line-height: 50px;
	display: inline-block;border-radius:4px;
    float: left;
    margin-top: 20px;
}
.upload_img p{
	position: absolute;
	bottom:50px;
	left: 210px;
	color: #737373;
	line-height: 30px;
	width: 60%;
	font-size: 1.1em;
	float: left;
}
.upload_img p i{
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
.upload a{
	position: absolute;
	left: 330px;
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
</style>

</head>
<body>
<br>
	<form action="<%=basePath%>place/${msg }.do" name="Form" id="Form"
		method="post">
		<div id="zhongxin">
		<input type="hidden" value="${pd.placeId}"/>
			<table class="table ">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color:#C00;padding-right: 4px;">*</span><B>场地名称</B>
					</td>
					<td>
						<input type="text" value="${pd.pName}" disabled="disabled" style="height: 20px; width: 300px;" title="场地名称"/>
					</td>
				</tr>
				<c:if test="${pd.superAdmin}">
					<tr>
						<td style="width: 100px; text-align: left; padding-top: 13px;">
							<span style="color:#C00;padding-right: 4px;">*</span><B>所属单位</B>
						</td>
						<td>
							<select class="chzn-select" name="unitId" id="unitId" data-placeholder="请选择单位" style="height: 20px; width: 315px;">
								<c:forEach items="${listUnit}" var="list">
									<option value="${list.unitId}" <c:if test="${list.unitId == pd.unitId}">selected</c:if>>${list.unitNameFull}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
				</c:if>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color:#C00;padding-right: 4px;">*</span><B>场地类型</B>
					</td>
					<td>
						<select class="chzn-select" style="height: 20px; width: 315px;">
							<option value=""></option>
							<c:forEach items="${placeTypeList}" var="list">
								<option value="${list.distinguishId}" <c:if test="${list.distinguishId == pd.pType}">selected</c:if>>${list.value}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color:#C00;padding-right: 4px;">*</span><B>场地地址</B>
					</td>
					<td>
						<input type="text" value="${pd.pAddress}" disabled="disabled" style="height: 20px; width: 300px;" title="场地地址"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>缩略图片</B></td>
					<td>
						<div class="form-group" id="businessDiv">
						    <div class="upload_img">
							    <input id="pPath" name="pPath" type="hidden" value="${pd.pPath}"/>
							   <c:if test="${empty pd.pPath}">
									<img id="weixin_show" name="weixin_show" style="width: 200px; height: 150px;" src="<%=basePath%>shyl/images/temp.png">
							   </c:if>
								<c:if test="${!empty pd.pPath}">
						        	<img id="weixin_show" name="weixin_show" style="width: 200px; height: 150px;" onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="${img_host}${pd.pPath}">
						        </c:if>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td nowrap="nowrap" style="width: 80px; text-align: left; padding-top: 13px;"><B>场地简介</B></td>
					<td>
						<textarea id="pContent" name="pContent" readonly="readonly" style="min-height: 450px; margin: 0 auto;width:80%;float:left;" title="场地简介">${pd.pContent}</textarea>
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
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="<%=basePath%>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
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

	<script type="text/javascript">
		$(top.hangge());
		
		$(function() {
			
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			
		});
		
		//返回
		function returnback(){
	    	window.location.href="<%=basePath%>place/list.do";
		}
		
	</script>

</body>
</html>