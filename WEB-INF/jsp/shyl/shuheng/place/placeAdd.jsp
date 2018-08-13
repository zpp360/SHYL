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
<title>场地添加页面</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../../system/admin/top.jsp"%>
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<!-- 日期框 -->

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
</style>

</head>
<body>
<br>
	<form action="<%=basePath%>place/savePlace.do" name="Form" id="Form" method="post">
		<input type="hidden" name="url" value="${url}" />
		<div id="zhongxin">
			<table class="table ">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color:#C00;padding-right: 4px;">*</span><B>场地名称</B>
					</td>
					<td>
						<input type="text" name="pName" id="pName" maxlength="30" style="height: 20px; width: 300px;" placeholder="请输入场地名称" title="场地名称" onblur="trim(this);"/>
					</td>
				</tr>
				<c:if test="${pd.superAdmin}">
					<tr>
						<td style="width: 100px; text-align: left; padding-top: 13px;">
							<span style="color:#C00;padding-right: 4px;">*</span><B>所属单位</B>
						</td>
						<td>
							<select class="chzn-select" name="unitId" id="unitId" data-placeholder="请选择单位" style="height: 20px; width: 315px;">
								<option value="">----------</option>
								<c:forEach items="${listUnit}" var="list">
									<option value="${list.unitId}">${list.unitNameFull}</option>
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
						<select class="chzn-select" name="pType" id="pType" data-placeholder="请选择场地类型" style="height: 20px; width: 315px;">
							<option value="">----------</option>
							<c:forEach items="${placeTypeList}" var="list">
								<option value="${list.distinguishId }">${list.value}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color:#C00;padding-right: 4px;">*</span><B>场地地址</B>
					</td>
					<td>
						<input type="text" name="p_address" id="p_address" maxlength="200" style="height: 20px; width: 300px;" placeholder="请输入场地地址" title="场地地址" onblur="trim(this);"/>
					</td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>场地照片</B>
					</td>
					<td>
						<div class="upload_img">
							<input id="pPath" name="pPath" type="hidden" value=""/>
							<img id="weixin_show" name="weixin_show" style="width:auto; max-width: 200px; height: 150px;" src="<%=basePath%>shyl/images/temp.png"> 
							<a href="javascript:;" class="a-upload" style="text-decoration: none; color: #ffffff;">上传本地图片 
								<input type="file" id="weixin_image" placeholder="上传本地图片" name="weixin_image" multiple>
							</a>
							<p>支持的文件格式为.gif、.jpeg、.jpg、.png</p>
						</div>
						<div class="cut_img">
							<a class="btn  btn-success" onclick="cutImage();"></i>裁切图片</a>
							<input type="hidden" id="cutImage" name="cutImage" placeholder="裁切图片"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							宽度：<input type="text" id="width" name="width" style="width:50px" value="400"/>&nbsp;&nbsp;&nbsp;&nbsp;
							高度：<input type="text" id="height" name="height" style="width:50px" value="300"/>
						</div>
					</td>
				</tr>
				<tr>
					<td nowrap="nowrap" style="width: 80px; text-align: left; padding-top: 13px;"><B>场地介绍</B>
					</td>
					<td><textarea id="pContent" name="pContent" maxlength="10000" style="min-height: 300px; margin: 0 auto; width: 90%;float:left" title="场地介绍"></textarea>
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
	<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
	<!-- 实例化编辑器 -->

	<script type="text/javascript">
		
		$(top.hangge());
		function save() {
			if ($("#pName").val() == "") {
				$("#pName").tips({
					side : 3,
					msg : '请输入场地名称',
					bg : '#FF5080',
					time : 2
				});
				$("#pName").focus();
				return false;
			}
			if ($("#unitId").val() == "") {
				$("#unitId").tips({
					side : 3,
					msg : '请选择单位',
					bg : '#FF5080',
					time : 2
				});
				$("#unitId").focus();
				return false;
			}
			if ($("#pType").val() == "") {
				$("#pType").tips({
					side : 3,
					msg : '请选择场地类型',
					bg : '#FF5080',
					time : 2
				});
				$("#pType").focus();
				return false;
			}
			//每个单位只能有一个类型的场地（活动证，舞厅证，停车证）
			var unitId = $("#unitId").val();
			var pType = $("#pType").val();
			var flag = true;
			$.ajax({
				type: "POST",
				url: "<%=basePath%>place/unitSinglePlace.do",
				data:{
					unit_id:unitId,
					p_type:pType
				},
				dataType:"text",
				cache : false,
				async:false,
				success:function(result){
					if("fail"==result){
						$("#pType").tips({
							side : 3,
							msg : '该单位已存在此类型场地',
							bg : '#FF5080',
							time : 2
						});
						$("#pType").focus();
						flag = false;
					}
				}
			});
			
			if(!flag){
				return false;
			}
			
			if ($("#p_address").val() == "") {
				$("#p_address").tips({
					side : 3,
					msg : '请输入场地地址',
					bg : '#FF5080',
					time : 2
				});
				$("#p_address").focus();
				return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		//返回
	    function returnback(){
			var url = $("input[name='url']").val();
	    	window.location.href="<%=basePath%>place/list.do"+url;
		}
		
		$(function() {
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			
			$("#weixin_image").fileupload({
				 dataType :'iframe text',
				 autoUpload: true,
				 maxNumberOfFiles : 1,
		        url: '<%=basePath%>place/Upload.do',
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
					msg : '请上传格式为.jpg/.jpeg/.png/.gif格式的图片。',
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
		   	 } else {
		   		 $("#weixin_show").attr("src","${img_host}"+data.result);
		            document.getElementById("pPath").value=data.result;
		            $("#cutImage").val(data.result);
		   	 }
		    });
		});
		
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
					diag.URL = dialogPath+"place/toCutImage.do?cutImage="+cutImage+"&width="+width+"&height="+height;
					
					diag.OKEvent = function(){//确定事件
						var x = diag.innerFrame.contentWindow.x;
						var y = diag.innerFrame.contentWindow.y;
						var w = diag.innerFrame.contentWindow.w;
						var h = diag.innerFrame.contentWindow.h;
						
						if(x.value != "" && y.value != "" && w.value != "" && h.value != ""){
							$.ajax({
								type: "POST",
								url: "<%=basePath%>place/cutImage.do",
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
									$("#pPath").val(result);
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
		
	</script>
	
</body>
</html>