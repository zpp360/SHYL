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
<title>团队修改页面</title>
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
<link rel="stylesheet" href="plugins/oss/upload.css">

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
		<input type="hidden" id="lixiu" name="lixiu" value="${pd.lixiu}"/>
		<input type="hidden" id="tuixiu" name="tuixiu" value="${pd.tuixiu}"/>
		<input type="hidden" id="zaizhi" name="zaizhi" value="${pd.zaizhi}"/>
		<div id="zhongxin">
			<table class="table">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>团队名称</B>
					</td>
					<td>
						<input type="text" name="team_name" id="team_name" value="${pd.team_name}" maxlength="50" style="height: 20px; width: 300px;" placeholder="请输入名称" title="名称" onblur="trim(this);"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>团队类型</B>
					</td>
					<td>
						<select class="chzn-select" name="team_type" id="team_type" data-placeholder="请选择类型"  style="height: 20px; width: 215px;">
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
							<input name="team_time" id="team_time" value="${pd.team_time}" class="Wdate" type="text" readonly="readonly" placeholder="请选择时间" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowClear:true});"/>
						</span>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>团队负责人</B></td>
					<td>
						<span>
							<input style="width:90px;" name="app_user_name" id="app_user_name" value="${pd.user_name}" type="text" readonly="readonly" placeholder="请选择负责人" onclick="selectRadioUser()"/>
							<input style="width:50px;" name="app_user_age" id="app_user_age" value="${pd.user_age}岁" type="text" readonly="readonly"/>
							<input name="app_user_job" id="app_user_job" type="text" value="${pd.user_job}" readonly="readonly"/>
							<input type="hidden" id="app_user_id" name="app_user_id" value="${pd.app_user_id}"/>
						</span>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>选择团队人员</B></td>
					<td>
						<span>
							<input name="user_num" id="user_num" type="text" value="${pd.user_num}" readonly="readonly" placeholder="0人" onclick="selectUser()"/>
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
							<a href="javascript:;" class="a-upload" style="text-decoration: none; color: #ffffff;">上传本地图片 
								<input type="file" id="weixin_image" placeholder="上传本地图片" name="weixin_image" multiple>
							</a>
							<p>支持的文件格式为.gif、.jpeg、.jpg、.png</p>
						</div>
						<div class="cut_img">
							<a class="btn  btn-success" onclick="cutImage();"></i>裁切图片</a>
							<input type="hidden" id="cutImage" name="cutImage" value="${pd.team_img}" placeholder="裁切图片"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							宽度：<input type="text" id="width" name="width" value="400" style="width:50px"/>&nbsp;&nbsp;&nbsp;&nbsp;
							高度：<input type="text" id="height" name="height" value="200" style="width:50px"/>
						</div>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>上传视频</B></td>
					<td>
						<div class="form-group" id="businessDiv">
							<div class="upload">
								<input type="text" disabled="disabled" style="width:400px" id="team_video_id" name="team_video_id" value="${pd.team_video_name}"/>
								<input type="hidden" id="team_video" name="team_video" class="docName" style="height: 20px; width: 280px;" readonly="readonly"/> 
								<input type="hidden" id="team_video_name" name="team_video_name" class="docName" style="height: 20px; width: 280px;" readonly="readonly"/> 
								<input type="radio" name="myradio" value="random_name" checked=true/>
								<input type="hidden" id='dirname' value="uploadFiles/teamVideo" placeholder="如果不填，默认是上传到根目录" size=50>
								<p>您所选择的文件列表(mp4,avi,rmvb)：</p>
								<div id="ossfile">你的浏览器不支持flash,Silverlight或者HTML5！</div>
								<br/>
								<div id="container">
									<a id="selectfiles" style="top:-25px;left:-100px;" href="javascript:void(0);" >选择文件</a>
									<a id="postfiles" style="top:-25px;left:20px;" href="javascript:void(0);" >开始上传</a>
								</div>
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
							<a href="javascript:;" class="a-upload" style="text-decoration: none; color: #ffffff;">上传本地图片 
								<input type="file" id="activity_image_one" placeholder="上传本地图片" name="activity_image_one" multiple>
							</a>
							<p>支持的文件格式为.gif、.jpeg、.jpg、.png</p>
						</div>
						<div class="cut_img">
							<a class="btn  btn-success" onclick="activityOneCutImage();"></i>裁切图片</a>
							<input type="hidden" id="activityOneCutImage" name="activityOneCutImage" value="${pd.activity_img_one}" placeholder="裁切图片"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							宽度：<input type="text" id="activityOneWidth" name="activityOneWidth" value="400" style="width:50px"/>&nbsp;&nbsp;&nbsp;&nbsp;
							高度：<input type="text" id="activityOneHeight" name="activityOneHeight" value="200" style="width:50px"/>
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
							<a href="javascript:;" class="a-upload" style="text-decoration: none; color: #ffffff;">上传本地图片 
								<input type="file" id="activity_image_two" placeholder="上传本地图片" name="activity_image_two" multiple>
							</a>
							<p>支持的文件格式为.gif、.jpeg、.jpg、.png</p>
						</div>
						<div class="cut_img">
							<a class="btn  btn-success" onclick="activityTwoCutImage();"></i>裁切图片</a>
							<input type="hidden" id="activityTwoCutImage" name="activityTwoCutImage" value="${pd.activity_img_two}" placeholder="裁切图片"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							宽度：<input type="text" id="activityTwoWidth" name="activityTwoWidth" value="400" style="width:50px"/>&nbsp;&nbsp;&nbsp;&nbsp;
							高度：<input type="text" id="activityTwoHeight" name="activityTwoHeight" value="200" style="width:50px"/>
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
							<a href="javascript:;" class="a-upload" style="text-decoration: none; color: #ffffff;">上传本地图片 
								<input type="file" id="award_image_one" placeholder="上传本地图片" name="award_image_one" multiple>
							</a>
							<p>支持的文件格式为.gif、.jpeg、.jpg、.png</p>
						</div>
						<div class="cut_img">
							<a class="btn  btn-success" onclick="awardOneCutImage();"></i>裁切图片</a>
							<input type="hidden" id="awardOneCutImage" name="awardOneCutImage" value="${pd.award_img_one}" placeholder="裁切图片"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							宽度：<input type="text" id="awardOneWidth" name="awardOneWidth" value="400" style="width:50px"/>&nbsp;&nbsp;&nbsp;&nbsp;
							高度：<input type="text" id="awardOneHeight" name="awardOneHeight" value="300" style="width:50px"/>
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
							<a href="javascript:;" class="a-upload" style="text-decoration: none; color: #ffffff;">上传本地图片 
								<input type="file" id="award_image_two" placeholder="上传本地图片" name="award_image_two" multiple>
							</a>
							<p>支持的文件格式为.gif、.jpeg、.jpg、.png</p>
						</div>
						<div class="cut_img">
							<a class="btn  btn-success" onclick="awardTwoCutImage();"></i>裁切图片</a>
							<input type="hidden" id="awardTwoCutImage" name="awardTwoCutImage" value="${pd.award_img_two}" placeholder="裁切图片"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							宽度：<input type="text" id="awardTwoWidth" name="awardTwoWidth" value="400" style="width:50px"/>&nbsp;&nbsp;&nbsp;&nbsp;
							高度：<input type="text" id="awardTwoHeight" name="awardTwoHeight" value="300" style="width:50px"/>
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
							<a href="javascript:;" class="a-upload" style="text-decoration: none; color: #ffffff;">上传本地图片 
								<input type="file" id="award_image_three" placeholder="上传本地图片" name="award_image_three" multiple>
							</a>
							<p>支持的文件格式为.gif、.jpeg、.jpg、.png</p>
						</div>
						<div class="cut_img">
							<a class="btn  btn-success" onclick="awardThreeCutImage();"></i>裁切图片</a>
							<input type="hidden" id="awardThreeCutImage" name="awardThreeCutImage" value="${pd.award_img_three}" placeholder="裁切图片"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							宽度：<input type="text" id="awardThreeWidth" name="awardThreeWidth" value="400" style="width:50px"/>&nbsp;&nbsp;&nbsp;&nbsp;
							高度：<input type="text" id="awardThreeHeight" name="awardThreeHeight" value="300" style="width:50px"/>
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
			<a class="btn  btn-success" onclick="save('');"><i class="icon-save"></i>保存</a> 
			<a class="btn  btn-success" onclick="save('2');"><i class="icon-save"></i>保存并提交</a> 
			<a class="btn  btn-light" onclick="returnback()"><i class=" icon-circle-arrow-left"></i>返回</a>
		</div>
		<div id="zhongxin2" class="center" style="display: none">
			<br /> <br /> <br /> <br /> <img src="<%=basePath%>static/images/jiazai.gif" /><br />
			<h4 class="lighter block green"></h4>
		</div>
	</form>
	
	<script type="text/javascript">
	
	var uploader = new plupload.Uploader({
		runtimes : 'html5,flash,silverlight,html4',
		browse_button : 'selectfiles', 
	    multi_selection: false,
		container: document.getElementById('container'),
		flash_swf_url : 'plugins/oss/lib/plupload-2.1.2/js/Moxie.swf',
		silverlight_xap_url : 'plugins/oss/lib/plupload-2.1.2/js/Moxie.xap',
	    url : 'http://oss.aliyuncs.com',
	    
	    filters: {
	        mime_types : [ //只允许上传视频 
	        { title : "Video files", extensions : "mp4,avi,rmvb" }
	        ], 
	        max_file_size : '1024000kb', //最大只能上传100M的文件
	        prevent_duplicates : true //不允许选取重复文件
	    },

		init: {
			PostInit: function() {
				document.getElementById('ossfile').innerHTML = '';
				document.getElementById('postfiles').onclick = function() {
	            set_upload_param(uploader, '', false);
	            return false;
				};
			},

			FilesAdded: function(up, files) {
				plupload.each(files, function(file) {
					var size = parseInt(uploader.files[0].size);
					if(size/1024>30720){
						$("#selectfiles").tips({
							side : 2,
							msg : '上传视频不能大于30M。',
							bg : '#AE81FF',
							time : 3
						});
						return;
					}
					
					if (uploader.files.length > 1) {
						$("#selectfiles").tips({
							side : 2,
							msg : '只能上传单个文件。',
							bg : '#AE81FF',
							time : 3
						});
						return;
				    }
					$("#team_video_id").val(file.name);
					document.getElementById('ossfile').innerHTML += '<div id="' + file.id + '">' + file.name + ' (' + plupload.formatSize(file.size) + ')<b></b>'
					+'<div class="progress"><div class="progress-bar" style="width: 0%"></div></div>'
					+'</div>';
				});
			},

			BeforeUpload: function(up, file) {
	            check_object_radio();
	            get_dirname();
	            set_upload_param(up, file.name, true);
	        },

			UploadProgress: function(up, file) {
				var d = document.getElementById(file.id);
				d.getElementsByTagName('b')[0].innerHTML = '<span>' + file.percent + "%</span>";
	            var prog = d.getElementsByTagName('div')[0];
				var progBar = prog.getElementsByTagName('div')[0]
				progBar.style.width= 2*file.percent+'px';
				progBar.setAttribute('aria-valuenow', file.percent);
			},

			FileUploaded: function(up, file, info) {
	            if (info.status == 200)
	            {
	                document.getElementById(file.id).getElementsByTagName('b')[0].innerHTML = '上传成功';
	                $("#team_video").val(get_uploaded_object_name(file.name));
	                $("#team_video_name").val(file.name);
	            }
	            else
	            {
	                document.getElementById(file.id).getElementsByTagName('b')[0].innerHTML = info.response;
	            } 
			},

			Error: function(up, err) {
				document.getElementById('console').appendChild(document.createTextNode("\nError xml:" + err.response));
			}
		}
	});

	uploader.init();
	
	
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
			
			/*---------------- 图片上传----------------start */
			$("#weixin_image").fileupload({
				 dataType :'iframe text',
				 autoUpload: true,
				 maxNumberOfFiles : 1,
		         url: '<%=basePath%>team/pictureUpLoad.do',
		        sequentialUploads: true
			 }).bind('fileuploadchange', function (e, data) {
				 if(data.files.length > 1){
					 $("#weixin_show").tips({
							side : 2,
							msg : '只能上传一张照片。',
							bg : '#AE81FF',
							time : 3
					 });
		             return false;
				 }
				 $("#weixin_show").attr("src","<%=basePath%>shyl/images/img_loading.gif");
		    }).bind('fileuploaddone', function (e, data) {
		   	 if("no"==data.result){
		   		$("#weixin_show").tips({
					side : 2,
					msg : '请上传格式为.jpg/.jpeg/.png./gif格式的图片。',
					bg : '#AE81FF',
					time : 3
				});
		   		$("#weixin_show").attr("src","<%=basePath%>shyl/images/temp.png");
				return false;
		   	 }else if("outsize"==data.result){
		   		$("#weixin_show").tips({
					side : 2,
					msg : '上传失败，图片最大为10M',
					bg : '#AE81FF',
					time : 3
				});
		   		$("#weixin_show").attr("src","<%=basePath%>shyl/images/temp.png");
		   		return false;
		   	 } else {
		   		 $("#weixin_show").attr("src","${img_host}"+data.result);
		            document.getElementById("team_img").value=data.result;
		            $("#cutImage").val(data.result);
		   	 }
		    });
			//活动图1
			$("#activity_image_one").fileupload({
				 dataType :'iframe text',
				 autoUpload: true,
				 maxNumberOfFiles : 1,
		         url: '<%=basePath%>team/pictureUpLoad.do',
		        sequentialUploads: true
			 }).bind('fileuploadchange', function (e, data) {
				 if(data.files.length > 1){
					 $("#activity_show_one").tips({
							side : 2,
							msg : '只能上传一张照片。',
							bg : '#AE81FF',
							time : 3
					 });
		             return false;
				 }
				 $("#activity_show_one").attr("src","<%=basePath%>shyl/images/img_loading.gif");
		    }).bind('fileuploaddone', function (e, data) {
		   	 if("no"==data.result){
		   		$("#activity_show_one").tips({
					side : 2,
					msg : '请上传格式为.jpg/.jpeg/.png./gif格式的图片。',
					bg : '#AE81FF',
					time : 3
				});
		   		$("#activity_show_one").attr("src","<%=basePath%>shyl/images/temp.png");
				return false;
		   	 }else if("outsize"==data.result){
		   		$("#activity_show_one").tips({
					side : 2,
					msg : '上传失败，图片最大为10M',
					bg : '#AE81FF',
					time : 3
				});
		   		$("#activity_show_one").attr("src","<%=basePath%>shyl/images/temp.png");
		   		return false;
		   	 } else {
		   		 $("#activity_show_one").attr("src","${img_host}"+data.result);
		            document.getElementById("activity_img_one").value=data.result;
		            $("#activityOneCutImage").val(data.result);
		   	 }
		    });
			
			//活动图2
			$("#activity_image_two").fileupload({
				 dataType :'iframe text',
				 autoUpload: true,
				 maxNumberOfFiles : 1,
		         url: '<%=basePath%>team/pictureUpLoad.do',
		        sequentialUploads: true
			 }).bind('fileuploadchange', function (e, data) {
				 if(data.files.length > 1){
					 $("#activity_show_two").tips({
							side : 2,
							msg : '只能上传一张照片。',
							bg : '#AE81FF',
							time : 3
					 });
		             return false;
				 }
				 $("#activity_show_two").attr("src","<%=basePath%>shyl/images/img_loading.gif");
		    }).bind('fileuploaddone', function (e, data) {
		   	 if("no"==data.result){
		   		$("#activity_show_two").tips({
					side : 2,
					msg : '请上传格式为.jpg/.jpeg/.png./gif格式的图片。',
					bg : '#AE81FF',
					time : 3
				});
		   		$("#activity_show_two").attr("src","<%=basePath%>shyl/images/temp.png");
				return false;
		   	 }else if("outsize"==data.result){
		   		$("#activity_show_two").tips({
					side : 2,
					msg : '上传失败，图片最大为10M',
					bg : '#AE81FF',
					time : 3
				});
		   		$("#activity_show_two").attr("src","<%=basePath%>shyl/images/temp.png");
		   		return false;
		   	 } else {
		   		 $("#activity_show_two").attr("src","${img_host}"+data.result);
		            document.getElementById("activity_img_two").value=data.result;
		            $("#activityTwoCutImage").val(data.result);
		   	 }
		    });
			//获奖图1
			$("#award_image_one").fileupload({
				 dataType :'iframe text',
				 autoUpload: true,
				 maxNumberOfFiles : 1,
		         url: '<%=basePath%>team/pictureUpLoad.do',
		        sequentialUploads: true
			 }).bind('fileuploadchange', function (e, data) {
				 if(data.files.length > 1){
					 $("#award_show_one").tips({
							side : 2,
							msg : '只能上传一张照片。',
							bg : '#AE81FF',
							time : 3
					 });
		             return false;
				 }
				 $("#award_show_one").attr("src","<%=basePath%>shyl/images/img_loading.gif");
		    }).bind('fileuploaddone', function (e, data) {
		   	 if("no"==data.result){
		   		$("#award_show_one").tips({
					side : 2,
					msg : '请上传格式为.jpg/.jpeg/.png./gif格式的图片。',
					bg : '#AE81FF',
					time : 3
				});
		   		$("#award_show_one").attr("src","<%=basePath%>shyl/images/temp.png");
				return false;
		   	 }else if("outsize"==data.result){
		   		$("#award_show_one").tips({
					side : 2,
					msg : '上传失败，图片最大为10M',
					bg : '#AE81FF',
					time : 3
				});
		   		$("#award_show_one").attr("src","<%=basePath%>shyl/images/temp.png");
		   		return false;
		   	 } else {
		   		 $("#award_show_one").attr("src","${img_host}"+data.result);
		            document.getElementById("award_img_one").value=data.result;
		            $("#awardOneCutImage").val(data.result);
		   	 }
		    });
			//获奖图2
			$("#award_image_two").fileupload({
				 dataType :'iframe text',
				 autoUpload: true,
				 maxNumberOfFiles : 1,
		         url: '<%=basePath%>team/pictureUpLoad.do',
		        sequentialUploads: true
			 }).bind('fileuploadchange', function (e, data) {
				 if(data.files.length > 1){
					 $("#award_show_two").tips({
							side : 2,
							msg : '只能上传一张照片。',
							bg : '#AE81FF',
							time : 3
					 });
		             return false;
				 }
				 $("#award_show_two").attr("src","<%=basePath%>shyl/images/img_loading.gif");
		    }).bind('fileuploaddone', function (e, data) {
		   	 if("no"==data.result){
		   		$("#award_show_two").tips({
					side : 2,
					msg : '请上传格式为.jpg/.jpeg/.png./gif格式的图片。',
					bg : '#AE81FF',
					time : 3
				});
		   		$("#award_show_two").attr("src","<%=basePath%>shyl/images/temp.png");
				return false;
		   	 }else if("outsize"==data.result){
		   		$("#award_show_two").tips({
					side : 2,
					msg : '上传失败，图片最大为10M',
					bg : '#AE81FF',
					time : 3
				});
		   		$("#award_show_two").attr("src","<%=basePath%>shyl/images/temp.png");
		   		return false;
		   	 } else {
		   		 $("#award_show_two").attr("src","${img_host}"+data.result);
		            document.getElementById("award_img_two").value=data.result;
		            $("#awardTwoCutImage").val(data.result);
		   	 }
		    });
			//获奖图3
			$("#award_image_three").fileupload({
				 dataType :'iframe text',
				 autoUpload: true,
				 maxNumberOfFiles : 1,
		         url: '<%=basePath%>team/pictureUpLoad.do',
		        sequentialUploads: true
			 }).bind('fileuploadchange', function (e, data) {
				 if(data.files.length > 1){
					 $("#award_show_three").tips({
							side : 2,
							msg : '只能上传一张照片。',
							bg : '#AE81FF',
							time : 3
					 });
		             return false;
				 }
				 $("#award_show_three").attr("src","<%=basePath%>shyl/images/img_loading.gif");
		    }).bind('fileuploaddone', function (e, data) {
		   	 if("no"==data.result){
		   		$("#award_show_three").tips({
					side : 2,
					msg : '请上传格式为.jpg/.jpeg/.png./gif格式的图片。',
					bg : '#AE81FF',
					time : 3
				});
		   		$("#award_show_three").attr("src","<%=basePath%>shyl/images/temp.png");
				return false;
		   	 }else if("outsize"==data.result){
		   		$("#award_show_three").tips({
					side : 2,
					msg : '上传失败，图片最大为10M',
					bg : '#AE81FF',
					time : 3
				});
		   		$("#award_show_three").attr("src","<%=basePath%>shyl/images/temp.png");
		   		return false;
		   	 } else {
		   		 $("#award_show_three").attr("src","${img_host}"+data.result);
		            document.getElementById("award_img_three").value=data.result;
		            $("#awardThreeCutImage").val(data.result);
		   	 }
		    });
			/*---------------- 图片上传----------------end */
			
			/*---------------- 附件上传----------------start */
			
			//附件上传
			 $("#file_upload").fileupload({
				dataType :'iframe text',
				autoUpload: true,
				maxNumberOfFiles : 1,
				maxFileSize: 50000000,
		        url: '<%=basePath%>team/fileUpLoad.do',
				sequentialUploads : true,
				add: function (e, data) {
					var oldpath = $("#team_video").val();
					 data.url = '<%=basePath%>team/fileUpLoad.do?oldpath='+oldpath;
					 data.submit();
				}
				}).bind('fileuploadchange', function(e, data) {			 
					if (data.files.length > 1) {
						tips("fileDiv", "只能上传一个文件。");
						return false;
					}
				}).bind('fileuploaddone', function(e, data) {
					if ("no" == data.result) {
						tips("fileDiv", "请上传格式为.mkv/.mp4/.rmb格式的视频文件。");
					}else if('outsize' == data.result){
						tips("fileDiv", "上传失败，文件最大为50M。");
					}else {
						$("#team_video").val(data.result);
						$("#team_video_name").val(data.originalFiles[0].name);
// 						$("#news_fileName").val(data.originalFiles[0].name);				
// 						$("#news_filePath").text(data.result);
// 						$("#news_fileName").text(data.originalFiles[0].name);
// 						$("#docName").val(data.originalFiles[0].name);
					}
				});
			 /*---------------- 附件上传----------------end */
			
			
			 /*------------------ 富文本编辑器  start------------------ */
			 
				ue = UE.getEditor("team_activity");//编辑器初始化
				ue = UE.getEditor("team_award");//编辑器初始化
			    
			 /*------------------ 富文本编辑器  end------------------ */
			
			
		});
		
		//返回
	    function returnback(){
	    	window.location.href="<%=basePath%>team/list.do";
		}
		
	  //选择人员
		function selectUser(){
		  var user_id = $("#user_id").val();
		  var lixiu = $("#lixiu").val();
		  var tuixiu = $("#tuixiu").val();
		  var zaizhi = $("#zaizhi").val();
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Width = 1000;
			diag.Height = 600;
			diag.Title = "选择人员";
			diag.ShowButtonRow = false;
			diag.URL = dialogPath + "team/toSelectUser.do?user_id="+user_id+"&lixiu="+lixiu+"&tuixiu="+tuixiu+"&zaizhi="+zaizhi;
			
			diag.OKEvent = function(){//确定事件
				var user_id = diag.innerFrame.contentWindow.document.getElementById('user_id').value;
				var user_num = diag.innerFrame.contentWindow.document.getElementById('user_num').value;
				var lixiu = diag.innerFrame.contentWindow.document.getElementById('lixiu').value;
				var tuixiu = diag.innerFrame.contentWindow.document.getElementById('tuixiu').value;
				var zaizhi = diag.innerFrame.contentWindow.document.getElementById('zaizhi').value;
				
				$("#user_id").val(user_id);
				$("#user_num").val(user_num+"人");
				$("#lixiu").val(lixiu);
				$("#tuixiu").val(tuixiu);
				$("#zaizhi").val(zaizhi);
	 			diag.close();
			};
			
 			diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			diag.show();
		}
		
	  //选择团队负责人
	  function selectRadioUser(){
		  var user_id = $("#app_user_id").val();
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Width = 1000;
			diag.Height = 600;
			diag.Title = "选择团队负责人";
			diag.ShowButtonRow = false;
			diag.URL = dialogPath + "team/toSelectRadioUser.do?user_id="+user_id;
			
			diag.OKEvent = function(){//确定事件
				var user_id = diag.innerFrame.contentWindow.document.getElementById('user_id').value;
				$("#app_user_id").val(user_id);
				if(user_id != ""){
					$.ajax({
						type: "POST",
						url: "<%=basePath%>team/selectUserName.do",
						data:{
							user_id:user_id
						},
						dataType:"json",
						cache : false,
						success:function(data){
							$("#app_user_name").val(data.user_name);
							$("#app_user_job").val(data.user_job);
							$("#app_user_age").val(data.user_age+"岁");
						}
					});
				}
				diag.close();
			};
			
			diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			diag.show();
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
	    	
	    	//校验
	    	var team_name = $("#team_name").val();
	    	if (team_name == "") {
	    		$("#team_name").tips({
	    			side : 3,
	    			msg : '请输入团队名称',
	    			bg : '#FF5080',
	    			time : 2
	    		});
	    		$("#team_name").focus();
	    		return false;
	    	}
	    	//处理标题有英文双引号的问题
	    	if(team_name.indexOf('"')>-1){
	    		team_name = team_name.replace(/"/g,"”")
	    		$("#team_name").val(team_name)
	    	}
	    	if ($("#team_type").val() == "") {
	    		$("#team_type").tips({
	    			side : 3,
	    			msg : '请选择团队类型',
	    			bg : '#FF5080',
	    			time : 2
	    		});
	    		return false;
	    	}
	    	if ($("#team_time").val() == "") {
	    		$("#team_time").tips({
	    			side : 3,
	    			msg : '请选择成立时间',
	    			bg : '#FF5080',
	    			time : 2
	    		});
	    		return false;
	    	}
	    	if ($("#user_id").val() == "") {
	    		$("#user_name").tips({
	    			side : 3,
	    			msg : '请选择人员',
	    			bg : '#FF5080',
	    			time : 2
	    		});
	    		return false;
	    	}
	    	if ($("#app_user_id").val() == "") {
	    		$("#app_user_name").tips({
	    			side : 3,
	    			msg : '请选择负责人',
	    			bg : '#FF5080',
	    			time : 2
	    		});
	    		return false;
	    	}
	    	
	    	if(status=='2'){
	    		var lixiu = $("#lixiu").val();
				var tuixiu = $("#tuixiu").val();
				var zaizhi = $("#zaizhi").val();
				//离休、退休、在职总人数
				var totalNum = parseInt(lixiu)+parseInt(tuixiu)+parseInt(zaizhi);
				//离休、退休人数
				var twoNum = parseInt(lixiu)+parseInt(tuixiu);
				//离退休人数不少于三分之二
				var num = Math.ceil(totalNum * 2 / 3);
				if(twoNum < num){
					alert("离退休用户不能少于三分之二");
					return false;
				}
	    	}
	    	
			$("#Form").attr("action","<%=basePath%>team/updateTeam.do?status="+status);
	    	$("#Form").submit();
	    	$("#zhongxin").hide();
	    	$("#zhongxin2").show();
	    	
	    }
		
		//附件删除
		function deleteFile(){
			$("#team_video").val('');
			$("#team_video_name").val('');
		}
		
		//跳转裁切页面
		function cutImage(){
			
			var cutImage = $("#cutImage").val();
			var width = $("#width").val();
			var height = $("#height").val();
			
			//如果被裁切的图片路径中存在?，说明已经被裁切过，需要去掉oss的裁切参数
			if(cutImage.indexOf("?")>-1){
				cutImage = cutImage.substr(0,cutImage.indexOf("?"));
			}
			
			var img = new Image();
			img.src = "${img_host}" + cutImage;
			var natureWitdh;
			var natureHeight;
			// 如果图片被缓存，则直接返回缓存数据
			if(img.complete){
				natureWitdh = img.width;
				natureHeight = img.height;
			}else{
		        // 完全加载完毕的事件
			    img.onload = function(){
			    	natureWitdh = img.width;
			    	natureHeight = img.height;
			    }
		    }

			natureWitdh = natureWitdh + 50;
			natureHeight = natureHeight + 50;
			
			if(cutImage != ""&&natureWitdh!=null&&natureWitdh!=""&&natureHeight!=null&&natureHeight!=""){
				if(width != "" || height != ""){
					var diag = new top.Dialog();
					diag.Drag=true;
					diag.Width = natureWitdh;
					diag.Height = natureHeight;
					diag.Title = "裁切图片";
					diag.ShowButtonRow = false;
					diag.URL = dialogPath + "team/toCutImage.do?cutImage="+cutImage+"&width="+width+"&height="+height;
					
					diag.OKEvent = function(){//确定事件
						var x = diag.innerFrame.contentWindow.x;
						var y = diag.innerFrame.contentWindow.y;
						var w = diag.innerFrame.contentWindow.w;
						var h = diag.innerFrame.contentWindow.h;
						
						if(x.value != "" && y.value != "" && w.value != "" && h.value != ""){
							$.ajax({
								type: "POST",
								url: "<%=basePath%>team/cutImage.do",
								data:{
									x:x.value,
									y:y.value,
									w:w.value,
									h:h.value,
									cutImage:cutImage
								},
								dataType:"text",
								cache : false,
								success:function(result){
									$("#weixin_show").attr("src","${img_host}"+result);
									$("#team_img").val(result);
						            $("#cutImage").val(result);
								}
							});
			 				diag.close();
						}else{
							diag.close();
						}
					};
					
		 			diag.CancelEvent = function(){ //关闭事件
						diag.close();
					 };
					diag.show();
				}else{
					alert("请输入裁切比例!");
				}
				
			}else{
				alert("请先上传标题图！");
			}
		}
		//活动图1裁切
		function activityOneCutImage(){
			
			var cutImage = $("#activityOneCutImage").val();
			var width = $("#activityOneWidth").val();
			var height = $("#activityOneHeight").val();
			
			//如果被裁切的图片路径中存在?，说明已经被裁切过，需要去掉oss的裁切参数
			if(cutImage.indexOf("?")>-1){
				cutImage = cutImage.substr(0,cutImage.indexOf("?"));
			}
			
			var img = new Image();
			img.src = "${img_host}" + cutImage;
			var natureWitdh;
			var natureHeight;
			// 如果图片被缓存，则直接返回缓存数据
			if(img.complete){
				natureWitdh = img.width;
				natureHeight = img.height;
			}else{
		        // 完全加载完毕的事件
			    img.onload = function(){
			    	natureWitdh = img.width;
			    	natureHeight = img.height;
			    }
		    }

			natureWitdh = natureWitdh + 50;
			natureHeight = natureHeight + 50;
			
			if(cutImage != ""&&natureWitdh!=null&&natureWitdh!=""&&natureHeight!=null&&natureHeight!=""){
				if(width != "" || height != ""){
					var diag = new top.Dialog();
					diag.Drag=true;
					diag.Width = natureWitdh;
					diag.Height = natureHeight;
					diag.Title = "裁切图片";
					diag.ShowButtonRow = false;
					diag.URL = dialogPath + "team/toCutImage.do?cutImage="+cutImage+"&width="+width+"&height="+height;
					
					diag.OKEvent = function(){//确定事件
						var x = diag.innerFrame.contentWindow.x;
						var y = diag.innerFrame.contentWindow.y;
						var w = diag.innerFrame.contentWindow.w;
						var h = diag.innerFrame.contentWindow.h;
						
						if(x.value != "" && y.value != "" && w.value != "" && h.value != ""){
							$.ajax({
								type: "POST",
								url: "<%=basePath%>team/cutImage.do",
								data:{
									x:x.value,
									y:y.value,
									w:w.value,
									h:h.value,
									cutImage:cutImage
								},
								dataType:"text",
								cache : false,
								success:function(result){
									$("#activity_show_one").attr("src","${img_host}"+result);
									$("#activity_img_one").val(result);
						            $("#activityOneCutImage").val(result);
								}
							});
			 				diag.close();
						}else{
							diag.close();
						}
					};
					
		 			diag.CancelEvent = function(){ //关闭事件
						diag.close();
					 };
					diag.show();
				}else{
					alert("请输入裁切比例!");
				}
				
			}else{
				alert("请先上传标题图！");
			}
		}
		
		//活动图2裁切
		function activityTwoCutImage(){
			
			var cutImage = $("#activityTwoCutImage").val();
			var width = $("#activityTwoWidth").val();
			var height = $("#activityTwoHeight").val();
			
			//如果被裁切的图片路径中存在?，说明已经被裁切过，需要去掉oss的裁切参数
			if(cutImage.indexOf("?")>-1){
				cutImage = cutImage.substr(0,cutImage.indexOf("?"));
			}
			
			var img = new Image();
			img.src = "${img_host}" + cutImage;
			var natureWitdh;
			var natureHeight;
			// 如果图片被缓存，则直接返回缓存数据
			if(img.complete){
				natureWitdh = img.width;
				natureHeight = img.height;
			}else{
		        // 完全加载完毕的事件
			    img.onload = function(){
			    	natureWitdh = img.width;
			    	natureHeight = img.height;
			    }
		    }

			natureWitdh = natureWitdh + 50;
			natureHeight = natureHeight + 50;
			
			if(cutImage != ""&&natureWitdh!=null&&natureWitdh!=""&&natureHeight!=null&&natureHeight!=""){
				if(width != "" || height != ""){
					var diag = new top.Dialog();
					diag.Drag=true;
					diag.Width = natureWitdh;
					diag.Height = natureHeight;
					diag.Title = "裁切图片";
					diag.ShowButtonRow = false;
					diag.URL = dialogPath + "team/toCutImage.do?cutImage="+cutImage+"&width="+width+"&height="+height;
					
					diag.OKEvent = function(){//确定事件
						var x = diag.innerFrame.contentWindow.x;
						var y = diag.innerFrame.contentWindow.y;
						var w = diag.innerFrame.contentWindow.w;
						var h = diag.innerFrame.contentWindow.h;
						
						if(x.value != "" && y.value != "" && w.value != "" && h.value != ""){
							$.ajax({
								type: "POST",
								url: "<%=basePath%>team/cutImage.do",
								data:{
									x:x.value,
									y:y.value,
									w:w.value,
									h:h.value,
									cutImage:cutImage
								},
								dataType:"text",
								cache : false,
								success:function(result){
									$("#activity_show_two").attr("src","${img_host}"+result);
									$("#activity_img_two").val(result);
						            $("#activityTwoCutImage").val(result);
								}
							});
			 				diag.close();
						}else{
							diag.close();
						}
					};
					
		 			diag.CancelEvent = function(){ //关闭事件
						diag.close();
					 };
					diag.show();
				}else{
					alert("请输入裁切比例!");
				}
				
			}else{
				alert("请先上传标题图！");
			}
		}
		//获奖图1裁切
		function awardOneCutImage(){
			
			var cutImage = $("#awardOneCutImage").val();
			var width = $("#awardOneWidth").val();
			var height = $("#awardOneHeight").val();
			
			//如果被裁切的图片路径中存在?，说明已经被裁切过，需要去掉oss的裁切参数
			if(cutImage.indexOf("?")>-1){
				cutImage = cutImage.substr(0,cutImage.indexOf("?"));
			}
			
			var img = new Image();
			img.src = "${img_host}" + cutImage;
			var natureWitdh;
			var natureHeight;
			// 如果图片被缓存，则直接返回缓存数据
			if(img.complete){
				natureWitdh = img.width;
				natureHeight = img.height;
			}else{
		        // 完全加载完毕的事件
			    img.onload = function(){
			    	natureWitdh = img.width;
			    	natureHeight = img.height;
			    }
		    }

			natureWitdh = natureWitdh + 50;
			natureHeight = natureHeight + 50;
			
			if(cutImage != ""&&natureWitdh!=null&&natureWitdh!=""&&natureHeight!=null&&natureHeight!=""){
				if(width != "" || height != ""){
					var diag = new top.Dialog();
					diag.Drag=true;
					diag.Width = natureWitdh;
					diag.Height = natureHeight;
					diag.Title = "裁切图片";
					diag.ShowButtonRow = false;
					diag.URL = dialogPath + "team/toCutImage.do?cutImage="+cutImage+"&width="+width+"&height="+height;
					
					diag.OKEvent = function(){//确定事件
						var x = diag.innerFrame.contentWindow.x;
						var y = diag.innerFrame.contentWindow.y;
						var w = diag.innerFrame.contentWindow.w;
						var h = diag.innerFrame.contentWindow.h;
						
						if(x.value != "" && y.value != "" && w.value != "" && h.value != ""){
							$.ajax({
								type: "POST",
								url: "<%=basePath%>team/cutImage.do",
								data:{
									x:x.value,
									y:y.value,
									w:w.value,
									h:h.value,
									cutImage:cutImage
								},
								dataType:"text",
								cache : false,
								success:function(result){
									$("#award_show_one").attr("src","${img_host}"+result);
									$("#award_img_one").val(result);
						            $("#awardOneCutImage").val(result);
								}
							});
			 				diag.close();
						}else{
							diag.close();
						}
					};
					
		 			diag.CancelEvent = function(){ //关闭事件
						diag.close();
					 };
					diag.show();
				}else{
					alert("请输入裁切比例!");
				}
				
			}else{
				alert("请先上传标题图！");
			}
		}
		//获奖图2裁切
		function awardTwoCutImage(){
			
			var cutImage = $("#awardTwoCutImage").val();
			var width = $("#awardTwoWidth").val();
			var height = $("#awardTwoHeight").val();
			
			//如果被裁切的图片路径中存在?，说明已经被裁切过，需要去掉oss的裁切参数
			if(cutImage.indexOf("?")>-1){
				cutImage = cutImage.substr(0,cutImage.indexOf("?"));
			}
			
			var img = new Image();
			img.src = "${img_host}" + cutImage;
			var natureWitdh;
			var natureHeight;
			// 如果图片被缓存，则直接返回缓存数据
			if(img.complete){
				natureWitdh = img.width;
				natureHeight = img.height;
			}else{
		        // 完全加载完毕的事件
			    img.onload = function(){
			    	natureWitdh = img.width;
			    	natureHeight = img.height;
			    }
		    }

			natureWitdh = natureWitdh + 50;
			natureHeight = natureHeight + 50;
			
			if(cutImage != ""&&natureWitdh!=null&&natureWitdh!=""&&natureHeight!=null&&natureHeight!=""){
				if(width != "" || height != ""){
					var diag = new top.Dialog();
					diag.Drag=true;
					diag.Width = natureWitdh;
					diag.Height = natureHeight;
					diag.Title = "裁切图片";
					diag.ShowButtonRow = false;
					diag.URL = dialogPath + "team/toCutImage.do?cutImage="+cutImage+"&width="+width+"&height="+height;
					
					diag.OKEvent = function(){//确定事件
						var x = diag.innerFrame.contentWindow.x;
						var y = diag.innerFrame.contentWindow.y;
						var w = diag.innerFrame.contentWindow.w;
						var h = diag.innerFrame.contentWindow.h;
						
						if(x.value != "" && y.value != "" && w.value != "" && h.value != ""){
							$.ajax({
								type: "POST",
								url: "<%=basePath%>team/cutImage.do",
								data:{
									x:x.value,
									y:y.value,
									w:w.value,
									h:h.value,
									cutImage:cutImage
								},
								dataType:"text",
								cache : false,
								success:function(result){
									$("#award_show_two").attr("src","${img_host}"+result);
									$("#award_img_two").val(result);
						            $("#awardTwoCutImage").val(result);
								}
							});
			 				diag.close();
						}else{
							diag.close();
						}
					};
					
		 			diag.CancelEvent = function(){ //关闭事件
						diag.close();
					 };
					diag.show();
				}else{
					alert("请输入裁切比例!");
				}
				
			}else{
				alert("请先上传标题图！");
			}
		}
		//获奖图3裁切
		function awardThreeCutImage(){
			
			var cutImage = $("#awardThreeCutImage").val();
			var width = $("#awardThreeWidth").val();
			var height = $("#awardThreeHeight").val();
			
			//如果被裁切的图片路径中存在?，说明已经被裁切过，需要去掉oss的裁切参数
			if(cutImage.indexOf("?")>-1){
				cutImage = cutImage.substr(0,cutImage.indexOf("?"));
			}
			
			var img = new Image();
			img.src = "${img_host}" + cutImage;
			var natureWitdh;
			var natureHeight;
			// 如果图片被缓存，则直接返回缓存数据
			if(img.complete){
				natureWitdh = img.width;
				natureHeight = img.height;
			}else{
		        // 完全加载完毕的事件
			    img.onload = function(){
			    	natureWitdh = img.width;
			    	natureHeight = img.height;
			    }
		    }

			natureWitdh = natureWitdh + 50;
			natureHeight = natureHeight + 50;
			
			if(cutImage != ""&&natureWitdh!=null&&natureWitdh!=""&&natureHeight!=null&&natureHeight!=""){
				if(width != "" || height != ""){
					var diag = new top.Dialog();
					diag.Drag=true;
					diag.Width = natureWitdh;
					diag.Height = natureHeight;
					diag.Title = "裁切图片";
					diag.ShowButtonRow = false;
					diag.URL = dialogPath + "team/toCutImage.do?cutImage="+cutImage+"&width="+width+"&height="+height;
					
					diag.OKEvent = function(){//确定事件
						var x = diag.innerFrame.contentWindow.x;
						var y = diag.innerFrame.contentWindow.y;
						var w = diag.innerFrame.contentWindow.w;
						var h = diag.innerFrame.contentWindow.h;
						
						if(x.value != "" && y.value != "" && w.value != "" && h.value != ""){
							$.ajax({
								type: "POST",
								url: "<%=basePath%>team/cutImage.do",
								data:{
									x:x.value,
									y:y.value,
									w:w.value,
									h:h.value,
									cutImage:cutImage
								},
								dataType:"text",
								cache : false,
								success:function(result){
									$("#award_show_three").attr("src","${img_host}"+result);
									$("#award_img_three").val(result);
						            $("#awardThreeCutImage").val(result);
								}
							});
			 				diag.close();
						}else{
							diag.close();
						}
					};
					
		 			diag.CancelEvent = function(){ //关闭事件
						diag.close();
					 };
					diag.show();
				}else{
					alert("请输入裁切比例!");
				}
				
			}else{
				alert("请先上传标题图！");
			}
		}
	</script>
</body>
</html>