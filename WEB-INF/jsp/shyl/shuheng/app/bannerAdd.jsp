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
<title>banner添加页面</title>
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
		<div id="zhongxin">
			<table class="table">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>标题</B>
					</td>
					<td>
						<input type="text" name="banner_title" id="banner_title" maxlength="50" style="height: 20px; width: 300px;" placeholder="请输入标题" title="标题" onblur="trim(this);"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>类型</B>
					</td>
					<td>
						<select class="chzn-select" name="banner_type" id="banner_type" data-placeholder="请选择类型" style="height: 20px; width: 215px;">
							<option value="">----------</option>
							<c:forEach items="${typeList}" var="list">
								<option value="${list.distinguish_id}">${list.value}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;">
						<B>标题图</B>
					</td>
					<td>
						<div class="upload_img">
							<input id="banner_img" name="banner_img" value="${pd.banner_img}" type="hidden"/>
							<c:if test="${empty pd.banner_img}">
								<img id="weixin_show" name="weixin_show" style="width: auto; height: 150px;max-width:200px;" src="<%=basePath%>shyl/images/temp.png">
							</c:if>
							<c:if test="${!empty pd.banner_img}">
						        <img id="weixin_show" name="weixin_show" style="width: auto; height: 150px;max-width:200px;" onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="${img_host}${pd.banner_img}">
						    </c:if>
							<a href="javascript:;" class="a-upload" style="text-decoration: none; color: #ffffff;">上传本地图片 
								<input type="file" id="weixin_image" placeholder="上传本地图片" name="weixin_image" multiple>
							</a>
							<p>支持的文件格式为.gif、.jpeg、.jpg、.png</p>
						</div>
						<div class="cut_img">
							<a class="btn  btn-success" onclick="cutImage();"></i>裁切图片</a>
							<input type="hidden" id="cutImage" name="cutImage" value="${pd.banner_img}" placeholder="裁切图片"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							宽度：<input type="text" id="width" name="width" value="400" style="width:50px"/>&nbsp;&nbsp;&nbsp;&nbsp;
							高度：<input type="text" id="height" name="height" value="300" style="width:50px"/>
						</div>
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
		<div align="center" style="margin-top: 10px; width:1000px;">
			<a class="btn  btn-success" onclick="save();"><i class="icon-save"></i>保存</a> 
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
			
			/*---------------- 图片上传----------------start */
			$("#weixin_image").fileupload({
				 dataType :'iframe text',
				 autoUpload: true,
				 maxNumberOfFiles : 1,
		         url: '<%=basePath%>app/pictureUpLoad.do',
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
		            document.getElementById("banner_img").value=data.result;
		            $("#cutImage").val(data.result);
		   	 }
		    });
			/*---------------- 图片上传----------------end */
			
			
		});
		
		//返回
	    function returnback(){
	    	var url = $("input[name='url']").val();
	    	window.location.href="<%=basePath%>app/bannerList.do"+url;
		}
		
	    /**
	    *保存
	    */
	    function save(){
	    	//校验
	    	var banner_title = $("#banner_title").val();
	    	if (banner_title == "") {
	    		$("#banner_title").tips({
	    			side : 3,
	    			msg : '请输入标题',
	    			bg : '#FF5080',
	    			time : 2
	    		});
	    		$("#banner_title").focus();
	    		return false;
	    	}
	    	//处理标题有英文双引号的问题
	    	if(banner_title.indexOf('"')>-1){
	    		banner_title = banner_title.replace(/"/g,"”");
	    		$("#banner_title").val(banner_title);
	    	}
	    	if ($("#banner_type").val() == "") {
	    		$("#banner_type").tips({
	    			side : 3,
	    			msg : '请选择类型',
	    			bg : '#FF5080',
	    			time : 2
	    		});
	    		return false;
	    	}
	    	if ($("#banner_img").val() == "") {
	    		$("#weixin_show").tips({
	    			side : 3,
	    			msg : '请上传图片',
	    			bg : '#FF5080',
	    			time : 2
	    		});
	    		return false;
	    	}
			$("#Form").attr("action","<%=basePath%>app/saveBanner.do");
	    	$("#Form").submit();
	    	$("#zhongxin").hide();
	    	$("#zhongxin2").show();
	    	
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
					diag.URL = dialogPath + "app/toCutImage.do?cutImage="+cutImage+"&width="+width+"&height="+height;
					
					diag.OKEvent = function(){//确定事件
						var x = diag.innerFrame.contentWindow.x;
						var y = diag.innerFrame.contentWindow.y;
						var w = diag.innerFrame.contentWindow.w;
						var h = diag.innerFrame.contentWindow.h;
						
						if(x.value != "" && y.value != "" && w.value != "" && h.value != ""){
							$.ajax({
								type: "POST",
								url: "<%=basePath%>app/cutImage.do",
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
									$("#banner_img").val(result);
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
		
		function phoneView(phone){
			var html  = ue.getContent();
			if(html==null||html==''){
				alert("无内容");
				return;
			}
			$("#Form").attr("action","<%=basePath%>columnManagement/phoneView.do");
			$("#Form").append("<input type='hidden' name='phone' value='"+phone+"'/>");
			$("#Form").append("<input type='hidden' name='back' value='save'/>");
			$("#Form").submit();
		}
	</script>
</body>
</html>