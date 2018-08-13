<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<meta charset="utf-8" />
<title>团队详情页面</title>
<meta name="description" content="overview & stats" />
<%@ include file="../../../system/admin/top.jsp"%>

<!-- 上传 -->
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
<script type="text/javascript" src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
<%-- <script type="text/javascript" src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script> --%>
<%-- <script type="text/javascript" src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script> --%>
<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>

<!-- 添加按钮 -->
<link rel="stylesheet" href="static/assets/css/font-awesome.css" />

<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>


<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/ace-elements.min.js"></script>
<script src="static/js/ace.min.js"></script>

<style type="text/css">
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
	bottom: 50px;
	left: 210px;
	color: #737373;
	line-height: 0px;
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
	bottom: 50px;
	left: 100px;
	color: #737373;
	line-height: 30px;
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
	<form name="Form" id="Form" method="post">
		<input type="hidden" name="url" value="${url}" />
		<input type="hidden" id="team_id" name="team_id" value="${pd.team_id}"/>
		<div id="zhongxin">
			<table class="table">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>团队名称</B>
					</td>
					<td>
						<input type="text" disabled="disabled" name="team_name" id="team_name" value="${pd.team_name}" maxlength="50" style="height: 20px; width: 300px;" placeholder="请输入名称" title="名称" onblur="trim(this);"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>团队类型</B>
					</td>
					<td>
						<select class="chzn-select" disabled="disabled" name="team_type" id="team_type" data-placeholder="请选择类型"  style="height: 20px; width: 215px;">
							<option value="">----------</option>
							<c:forEach items="${typeList}" var="list">
								<option value="${list.distinguish_id}" <c:if test="${list.distinguish_id==pd.team_type}">selected</c:if>>${list.value}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>成立时间</B></td>
					<td>
						<span>
							<input name="team_time" id="team_time" value="${pd.team_time}" type="text" disabled="disabled" placeholder="请选择时间" onclick="WdatePicker({minDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd HH:mm',isShowClear:true});"/>
						</span>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>团队负责人</B></td>
					<td>
						<span>
							<input style="width:90px;" disabled="disabled" name="app_user_name" id="app_user_name" value="${pd.user_name}" type="text" placeholder="请选择负责人" onclick="selectRadioUser()"/>
							<input style="width:50px;" disabled="disabled" name="app_user_age" id="app_user_age" value="${pd.user_age}岁" type="text"/>
							<input name="app_user_job" disabled="disabled" id="app_user_job" type="text" value="${pd.user_job}"/>
							<input type="hidden" id="app_user_id" name="app_user_id" value="${pd.app_user_id}"/>
						</span>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>选择团队人员</B></td>
					<td>
						<span>
							<input name="user_num" id="user_num" type="text" value="${pd.user_num}" disabled="disabled" placeholder="0人" onclick="selectUser()"/>
							<input type="hidden" id="user_id" name="user_id" value="${pd.user_id}"/>
							<a class="btn btn-mini btn-info" title="选择人员详情" onclick="userInfo();">详情</a>
						</span>
					</td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;">
						<B>标题图</B>
					</td>
					<td>
						<div class="upload_img">
							<input id="team_img" name="team_img" value="${pd.team_img}" type="hidden"/>
							<c:if test="${empty pd.team_img}">
								<img id="weixin_show" name="weixin_show" style="width: auto; height: 150px;max-width:200px;" src="<%=basePath%>shyl/images/temp.png">
							</c:if>
							<c:if test="${!empty pd.team_img}">
						        <img id="weixin_show" name="weixin_show" style="width: auto; height: 150px;max-width:200px;" onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="${img_host}${pd.team_img}">
						    </c:if>
						</div>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>上传视频</B></td>
					<td>
						<div class="form-group" id="businessDiv">
							<div class="upload">
								<input type="hidden" id="team_video" name="team_video" value="${pd.team_video}" class="docName" style="height: 20px; width: 280px;" readonly="readonly"/> 
								<input type="text" id="team_video_name" name="team_video_name" value="${pd.team_video_name}" class="docName" style="height: 20px; width: 280px;" readonly="readonly"/> 
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;">
						<B>活动图1</B>
					</td>
					<td>
						<div class="upload_img">
							<input id="activity_img_one" name="activity_img_one" value="${pd.activity_img_one}" type="hidden"/>
							<c:if test="${empty pd.activity_img_one}">
								<img id="activity_show_one" name="activity_show_one" style="width: auto; height: 150px;max-width:200px;" src="<%=basePath%>shyl/images/temp.png">
							</c:if>
							<c:if test="${!empty pd.activity_img_one}">
						        <img id="activity_show_one" name="activity_show_one" style="width: auto; height: 150px;max-width:200px;" onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="${img_host}${pd.activity_img_one}">
						    </c:if>
						</div>
					</td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;">
						<B>活动图2</B>
					</td>
					<td>
						<div class="upload_img">
							<input id="activity_img_two" name="activity_img_two" value="${pd.activity_img_two}" type="hidden"/>
							<c:if test="${empty pd.activity_img_two}">
								<img id="activity_show_two" name="activity_show_two" style="width: auto; height: 150px;max-width:200px;" src="<%=basePath%>shyl/images/temp.png">
							</c:if>
							<c:if test="${!empty pd.activity_img_two}">
						        <img id="activity_show_two" name="activity_show_two" style="width: auto; height: 150px;max-width:200px;" onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="${img_host}${pd.activity_img_two}">
						    </c:if>
						</div>
					</td>
				</tr>
				<tr>
					<td nowrap="nowrap" style="width: 80px; text-align: left; padding-top: 13px;"><B>活动情况</B></td>
					<td><textarea id="team_activity" name="team_activity" maxlength="10000" style="min-height: 450px;">${pd.team_activity}</textarea></td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;">
						<B>获奖图1</B>
					</td>
					<td>
						<div class="upload_img">
							<input id="award_img_one" name="award_img_one" value="${pd.award_img_one}" type="hidden"/>
							<c:if test="${empty pd.award_img_one}">
								<img id="award_show_one" name="award_show_one" style="width: auto; height: 150px;max-width:200px;" src="<%=basePath%>shyl/images/temp.png">
							</c:if>
							<c:if test="${!empty pd.award_img_one}">
						        <img id="award_show_one" name="award_show_one" style="width: auto; height: 150px;max-width:200px;" onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="${img_host}${pd.award_img_one}">
						    </c:if>
						</div>
					</td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;">
						<B>获奖图2</B>
					</td>
					<td>
						<div class="upload_img">
							<input id="award_img_two" name="award_img_two" value="${pd.award_img_two}" type="hidden"/>
							<c:if test="${empty pd.award_img_two}">
								<img id="award_show_two" name="award_show_two" style="width: auto; height: 150px;max-width:200px;" src="<%=basePath%>shyl/images/temp.png">
							</c:if>
							<c:if test="${!empty pd.award_img_two}">
						        <img id="award_show_two" name="award_show_two" style="width: auto; height: 150px;max-width:200px;" onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="${img_host}${pd.award_img_two}">
						    </c:if>
						</div>
					</td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;">
						<B>获奖图3</B>
					</td>
					<td>
						<div class="upload_img">
							<input id="award_img_three" name="award_img_three" value="${pd.award_img_three}" type="hidden"/>
							<c:if test="${empty pd.award_img_three}">
								<img id="award_show_three" name="award_show_three" style="width: auto; height: 150px;max-width:200px;" src="<%=basePath%>shyl/images/temp.png">
							</c:if>
							<c:if test="${!empty pd.award_img_three}">
						        <img id="award_show_three" name="award_show_three" style="width: auto; height: 150px;max-width:200px;" onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="${img_host}${pd.award_img_three}">
						    </c:if>
						</div>
					</td>
				</tr>
				<tr>
					<td nowrap="nowrap" style="width: 80px; text-align: left; padding-top: 13px;"><B>获奖情况</B></td>
					<td><textarea id="team_award" name="team_award" maxlength="10000" style="min-height: 450px;">${pd.team_award}</textarea></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		<div align="center" style="margin-top: 10px; width:1000px;">
			<a class="btn  btn-light" onclick="returnback()"><i class=" icon-circle-arrow-left"></i>返回</a>
		</div>
		<div id="zhongxin2" class="center" style="display: none">
			<br /> <br /> <br /> <br /> <img src="<%=basePath%>static/images/jiazai.gif" /><br />
			<h4 class="lighter block green"></h4>
		</div>
	</form>
	
	<script type="text/javascript">
		$(top.hangge());
		var ue;
		
		$(document).ready(function(){
			
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
			
			 /*------------------ 富文本编辑器  start------------------ */
			 
				ue = UE.getEditor("team_activity",{readonly:true});//编辑器初始化
				ue = UE.getEditor("team_award",{readonly:true});//编辑器初始化
			    
			 /*------------------ 富文本编辑器  end------------------ */
			
			
		});
		
		//返回
	    function returnback(){
	    	window.location.href="<%=basePath%>team/list.do";
		}
		
	//详情
		function userInfo(){
		  var user_id = $("#user_id").val();
		  var info = "info";
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Width = 1000;
			diag.Height = 600;
			diag.Title = "详情";
			diag.ShowButtonRow = false;
			diag.URL = dialogPath + "team/toSelectUserInfo.do?user_id="+user_id;
			
			diag.OKEvent = function(){//确定事件
				diag.close();
			};
			
			diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			diag.show();
		}
	  
	    /**
	    *保存
	    */
	    function save(status){
	    	
	    	if ($("#reason").val() == "") {
	    		$("#reason").tips({
	    			side : 3,
	    			msg : '请输入原因',
	    			bg : '#FF5080',
	    			time : 2
	    		});
	    		return false;
	    	}
			$("#Form").attr("action","<%=basePath%>team/updateExamine.do?status="+status);
	    	$("#Form").submit();
	    	$("#zhongxin").hide();
	    	$("#zhongxin2").show();
	    	
	    }
		
	</script>
</body>
</html>