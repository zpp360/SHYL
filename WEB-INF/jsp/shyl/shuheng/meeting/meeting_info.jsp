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
<title>电影添加页面</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../../system/admin/top.jsp"%>
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=CIj675KvsEVU85xdW0OeLSFi5zgUc2EZ"></script>
<!-- 添加按钮 -->
<link rel="stylesheet" href="static/assets/css/font-awesome.css" />

<style type="text/css">
.form_button{
	width:120px;
	margin:0 auto;
}
.upload_img {
	float: left;
	width: 60%;
	position: relative;
}
.cut_img{
	margin-top:22px;
	float:left;
	width: 50%;
	position: relative;
}
.upload_img img {
	float: left;
}

.upload_img a {
	position: absolute;
	left: 210px;
	top: 0;
	font-size: 0.85em;
	border: 0;
	background-color: #3961c2;
	color: #fff;
	padding: 0;
	width: 160px;
	text-align: center;
	height: 50px;
	line-height: 50px;
	display: inline-block;
	border-radius: 4px;
	float: left;
	margin-top: 20px;
}

.upload_img p {
	position: absolute;
	bottom: 47px;
	left: 210px;
	color: #737373;
	line-height: 30px;
	width: 60%;
	font-size: 1.1em;
	float: left;
}

.upload_img p i {
	color: #1c1c1c;
	font-weight: bold;
	font-size: 1.1em;
}

select, input[type="file"] {
	height: 45px;
	line-height: 30px;
}

.uploadbtn {
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
	filter: alpha(opacity = 0);
	cursor: pointer
}

.upload a {
	position: absolute;
	left: 330px;
	font-size: 0.85em;
	border: 0;
	background-color: #3961c2;
	color: #fff;
	padding: 0;
	width: 100px;
	text-align: center;
	height: 30px;
	line-height: 30px;
	display: inline-block;
	border-radius: 4px;
	float: left;
	margin-left: 100px;
}

.upload p {
    line-height: 0px;
	bottom: 50px;
	left: 100px;
	color: #737373;
	width: 60%;
	font-size: 1.1em;
}

.ques-remove-opt {
    color: #d2322d;
    cursor: pointer;
    margin-left: 5px;
    margin-top: 12px;
}

</style>
</head>
<body>
	<br>
	<form action="<%=basePath%>meeting/save.do" name="Form" id="Form" method="post">
			<table class="table">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>报名</B></td>
					<td>
						<select id="sign_up_id" class="chzn-select" name="sign_up_id" readonly="readonly" data-placeholder="请选择活动"  style="height: 20px; width: 315px;">
								<option value=""></option>
								<c:forEach items="${signUpList}" var="list">
									<option <c:if test="${pd.meeting_sign_up_id == list.sign_up_id }">selected</c:if>  value="${list.sign_up_id}">${list.sign_up_title}</option>
								</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>会议名称</B></td>
					<td>
					    <input type="text" name="meeting_title" id="meeting_title" readonly="readonly" value="${pd.meeting_title}" maxlength="200" style="height: 20px; width: 300px;" placeholder="请输入会议名称" title="会议名称" onblur="trim(this);" />
					</td>
				</tr>
				<c:if test="${isSuperAdmin}"> 
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>单位名称</B></td>
					<td>
					    <input type="text" name="unit_name" id="unit_name" readonly="readonly" value="${pd.unit_name}" maxlength="200" style="height: 20px; width: 300px;" placeholder="请输入会议名称" title="会议名称" onblur="trim(this);" />
					</td>
				</tr>
				</c:if>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>会议类型</B></td>
					<td>
						<input type="radio" name="meeting_type" value="0" <c:if test="${pd.meeting_type == 0 }">checked="checked" </c:if>  title="内部" style="opacity:1;position: relative;">内部(仅报名人员可见)</br>
						<input type="radio" name="meeting_type" value="1" <c:if test="${pd.meeting_type == 1 }">checked="checked" </c:if> title="开放" style="opacity:1;position: relative;">开放(所有人可见)
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>时间</B></td>
					<td>
						<span>
							<input name="meeting_begin_time" id="meeting_begin_time"  class="Wdate" value="${pd.meeting_begin_time}" type="text" readonly="readonly" placeholder="请选择开始时间" />
							- <input name="meeting_end_time" id="meeting_end_time"  class="Wdate" value="${pd.meeting_end_time}" type="text" readonly="readonly" placeholder="请选择结束时间" />
						</span>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>报到地点</B></td>
					<td>
					    <input type="text" name="meeting_regist_place" id="meeting_regist_place" readonly="readonly" value="${pd.meeting_regist_place}" maxlength="200" style="height: 20px; width: 300px;" placeholder="请选择报到地点" title="报到地点" onblur="trim(this);" />
					    <div id="l-map" style="height:300px;width:100%;display:none;"></div>
					    <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
					    <input type="hidden" name="meeting_regist_lng" id="meeting_regist_lng" value="${pd.meeting_regist_lng}"/>
					    <input type="hidden" name="meeting_regist_lat" id="meeting_regist_lat" value="${pd.meeting_regist_lat}"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<B>报到联系人</B></td>
					<td>
						<textarea name="meeting_linkman_txt" id="meeting_linkman_txt" readonly="readonly" maxlength="200" style="height: 80px; width: 300px;" placeholder="请输入报到联系人及联系方式" title="报到联系人" onblur="trim(this);">${pd.meeting_linkman_txt}</textarea>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>会议地点</B></td>
					<td>
					    <input type="text" name="meeting_place" id="meeting_place" value="${pd.meeting_place}" maxlength="200" style="height: 20px; width: 300px;" placeholder="请选择会议地点" title="会议地点" onblur="trim(this);" />
					    <div id="meeting_place_map" style="height:300px;width:100%;display:none;"></div>
					    <input type="hidden" name="meeting_lng" id="meeting_lng" value="${pd.meeting_lng}"/>
					    <input type="hidden" name="meeting_lat" id="meeting_lat" value="${pd.meeting_lat}"/>
					</td>
				</tr>
				
				
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>缩略图片</B></td>
					<td>
						<div class="form-group" id="businessDiv">
						    <div class="upload_img">
							   <c:if test="${empty pd.meeting_img}">
									<img id="weixin_show" name="weixin_show" style="width: 158px; height: 190px;" src="<%=basePath%>shyl/images/temp.png">
							   </c:if>
								<c:if test="${!empty pd.meeting_img}">
						        	<img id="weixin_show" name="weixin_show" style="width: 158px; height: 190px;" onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="${img_host}${pd.meeting_img}">
						        </c:if>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td nowrap="nowrap"
						style="width: 80px; text-align: left; padding-top: 13px;"><B>会议保障</B></td>
					<td>
						<input type="text" class="docName" value="${pd.meeting_protect_file_name}" maxlength="100" style="height: 20px; width: 300px;" readonly="readonly"/> 
					</td>
				</tr>
				<tr>
					<td nowrap="nowrap"
						style="width: 80px; text-align: left; padding-top: 13px;"><B>会议日程</B></td>
					<td>
						<input type="text" class="docName" value="${pd.meeting_schedule_file_name}" maxlength="100" style="height: 20px; width: 300px;" readonly="readonly"/> 
					</td>
				</tr>
				<tr>
					<td nowrap="nowrap"
						style="width: 80px; text-align: left; padding-top: 13px;"><B>提前报到</B></td>
					<td>
						<input type="text" class="docName" value="${pd.meeting_regist_file_name}" maxlength="100" style="height: 20px; width: 300px;" readonly="readonly"/> 
					</td>
				</tr>
				<tr>
					<td nowrap="nowrap"
						style="width: 80px; text-align: left; padding-top: 13px;"><B>会议座次</B></td>
					<td>
						<input type="text" class="docName" value="${pd.meeting_seat_file_name}" maxlength="100" style="height: 20px; width: 300px;" readonly="readonly"/> 
					</td>
				</tr>
				<tr>
					<td nowrap="nowrap"
						style="width: 80px; text-align: left; padding-top: 13px;"><B>食宿交通</B></td>
					<td>
						<input type="text" class="docName" value="${pd.meeting_group_file_name}" maxlength="100" style="height: 20px; width: 300px;" readonly="readonly"/> 
					</td>
				</tr>
				<tr>
					<td nowrap="nowrap"
						style="width: 80px; text-align: left; padding-top: 13px;"><B>分组讨论</B></td>
					<td>
						<input type="text" class="docName" value="${pd.meeting_protect_file_name}" maxlength="100" style="height: 20px; width: 300px;" readonly="readonly"/> 
					</td>
				</tr>
				<tr>
					<td nowrap="nowrap"
						style="width: 80px; text-align: left; padding-top: 13px;"><B>温馨提示</B></td>
					<td>
						<input type="text" class="docName" value="${pd.meeting_tip_file_name}" maxlength="100" style="height: 20px; width: 300px;" readonly="readonly"/> 
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
			</table>
		<div align="center" style="margin-top: 10px;">
			 <a class="btn  btn-light" onclick="returnback()"><i class=" icon-circle-arrow-left"></i>返回</a>
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
	<!-- 日期框 -->
	<script type="text/javascript"
		src="static/js/bootstrap-datepicker.min.js"></script>
	<script
		src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
	<script
		src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
	<script
		src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
	<script
		src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
	<!-- 富文本编辑器end -->

	<script type="text/javascript">
	  
		
	//返回
	function returnback(){
	    window.location.href="<%=basePath%>meeting/list.do";
	}
		
	    
	$(function(){
		//下拉框
		$(".chzn-select").chosen();
		$(".chzn-select-deselect").chosen({
			allow_single_deselect : true
		});
		
	})	
	    
	   
	</script>
</body>
</html>