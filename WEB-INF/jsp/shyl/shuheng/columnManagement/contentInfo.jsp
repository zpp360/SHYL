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
<title>新闻详情页面</title>
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

<!-- 引入news.js -->
<script type="text/javascript" src="shyl/js/news/news.js"></script>

<!-- ztree树 -->
<!-- <script type="text/javascript" src="static/js/jquery-1.5.1.min.js"></script> -->
<link type="text/css" rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css"/>
<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>

<style type="text/css">
.upload_img {
	float: left;
	width: 60%;
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
	<form action="<%=basePath%>columnManagement/saveContent.do" name="Form" id="Form" method="post">
		<input type="hidden" name="url" value="${url }" />
		<div id="zhongxin">
			<table class="table">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>新闻标题</B>
					</td>
					<td>
						<input type="text" name="news_title" id="news_title" value="${pd.news_title}" maxlength="50" style="height: 20px; width: 300px;" placeholder="请输入新闻标题" title="新闻标题" onblur="trim(this);"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>新闻来源</B>
					</td>
					<td>
						<input type="text" name="news_source" id="news_source" value="${pd.news_source}" maxlength="50" style="height: 20px; width: 300px;" placeholder="请输入新闻来源" title="新闻来源" onblur="trim(this);"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<B>发布时间</B>
					</td>
					<td>
						<input type="text"  name="release_time" readonly="readonly" value="${pd.release_time}" id="release_time"   type="text"  readonly="readonly" style="height: 20px; width: 300px;" placeholder="默认为当前时间" title="发布时间" onblur="trim(this);"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>所属单位</B>
					</td>
					<td>
						<input type="text" id="unit_name" name="unit_name" value="${pd.unit_name}" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;">
						<B>标题图</B>
					</td>
					<td>
						<div class="form-group" id="businessDiv">
						    <div class="upload_img">
							    <input id="news_picturePath" name="news_picturePath" type="hidden" value="${pd.news_picturePath}"/>
							   <c:if test="${empty pd.news_picturePath}">
									<img id="weixin_show" name="weixin_show" style="width: 200px; height: 150px;" src="<%=basePath%>shyl/images/temp.png">
							   </c:if>
								<c:if test="${!empty pd.news_picturePath}">
						        	<img id="weixin_show" name="weixin_show" style="width: 200px; height: 150px;" onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="${img_host}${pd.news_picturePath}">
						        </c:if>
							</div>
						</div>
					</td>
				</tr>
<!-- 				<tr> -->
<!-- 					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>附&#12288;&#12288;件</B></td> -->
<!-- 					<td> -->
<!-- 						<div class="form-group" id="businessDiv"> -->
<!-- 							<div class="upload"> -->
<%-- 								<input id="news_fileName" name="news_fileName" maxlength="500" type="hidden" value="${pd.news_fileName}"/>  --%>
<%-- 								<input id="news_filePath" name="news_filePath" maxlength="100" type="hidden" value="${pd.news_filePath}"/> --%>
<%-- 								<input type="text" id="docName" value="${pd.news_fileName}" maxlength="100" style="height: 20px; width: 300px;" readonly="readonly"/>  --%>
<!-- 								<p style="font-size: 12px" class="style1">支持的文件格式为.doc/.docx/.xls/.xlsx/.ppt/.pptx/.txt （文件最大为50M）</p> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</td> -->
<!-- 				</tr> -->
				<tr>
					<td nowrap="nowrap" style="width: 80px; text-align: left; padding-top: 13px;"><B>新闻内容</B></td>
					<td><textarea id="news_content" name="news_content" maxlength="10000" style="min-height: 450px;" title="新闻内容">${pd.news_content}</textarea></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		<div align="center" style="margin-top: 10px;width:1000px;">
			<a class="btn  btn-light" onclick="returnback()"><i class=" icon-circle-arrow-left"></i>返回</a>
		</div>
		<div id="zhongxin2" class="center" style="display: none">
			<br /> <br /> <br /> <br /> <img src="<%=basePath%>static/images/jiazai.gif" /><br />
			<h4 class="lighter block green"></h4>
		</div>
	</form>
	
	<script type="text/javascript">
		$(top.hangge());
		
		$(document).ready(function(){
			
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			
		/*------------------ 富文本编辑器  start------------------ */
			 
			var ue = UE.getEditor("news_content",{readonly:true});//编辑器初始化
			    
		/*------------------ 富文本编辑器  end------------------ */
			
			
		});
		
		//返回
	    function returnback(){
	    	var url = $("input[name='url']").val();
	    	window.location.href="<%=basePath%>columnManagement/contentRight.do"+url;
		}
		
		
	</script>
</body>
</html>