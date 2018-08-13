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
<title>电影修改页面</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../../system/admin/top.jsp"%>
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<!-- 日期框 -->

<!-- 引入filmAdd.js -->
<script type="text/javascript" src="shyl/js/film/filmAdd.js"></script>
<!-- 添加按钮 -->
<link rel="stylesheet" href="static/assets/css/font-awesome.css" />

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
	<form action="<%=basePath%>film/editFilm.do" name="Form" id="Form" method="post">
		<input type="hidden" name="url" value="${url}" />
		<input type="hidden" name="filmId" id="filmId" value="${pd.filmId}"/>
		<input type="hidden" name="film_status" id="film_status" value="${pd.film_status}"/>
		<div id="zhongxin">
			<table class="table">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>电影名称</B></td>
					<td><input type="text" value="${pd.filmName}" name="filmName" id="filmName" maxlength="50"
						 style="height: 20px; width: 300px;" placeholder="请输入电影名称"
						title="电影名称" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>导演名称</B></td>
					<td><input type="text" value="${pd.director}" name="director" id="director" maxlength="60"
						 style="height: 20px; width: 300px;" placeholder="请输入导演名称"
						title="导演名称" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>电影主演</B></td>
					<td><input type="text" value="${pd.performer}" name="performer" id="performer" maxlength="80"
						 style="height: 20px; width: 300px;" placeholder="请输入电影主演"
						title="电影主演" onblur="trim(this);" /></td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>电影时长</B></td>
					<td><input type="text" value="${pd.filmTime}" name="filmTime" id="filmTime" maxlength="3"
						 style="height: 20px; width: 300px;" placeholder="请输入电影时长"
						title="电影时长" onblur="trim(this);" /></td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>电影语言</B>
					</td>
					<td>
						<input type="text" name="filmLanguage" id="filmLanguage" value="${pd.filmLanguage}" maxlength="30" style="height: 20px; width: 300px;" placeholder="请输入电影语言" title="电影语言" onblur="trim(this);" />
					</td>

				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>上映地区</B>
					</td>
					<td>
						<input type="text" name="filmLocal" id="filmLocal" value="${pd.filmLocal}" maxlength="30" style="height: 20px; width: 300px;" placeholder="请输入上映地区" title="上映地区" onblur="trim(this);" />
					</td>

				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>上映时间</B>
					</td>
					<td><input name="releaseTime" id="releaseTime" class="Wdate" value="${pd.releaseTime}" type="text" readonly="readonly" placeholder="请选择上映日期" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowClear:true});"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>放映时间</B></td>
					<td id="good">
					</td>
					<input type="hidden" id="filmDetailIdSum" name="filmDetailIdSum"/>  
					<input type="hidden" id="startTime" name="startTime"/>  
					<input type="hidden" id="endTime" name="endTime"/> 
					<input type="hidden" id="persunSum" name="persunSum"/> 
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>放映场地</B></td>
					<td>
						<select class="chzn-select" name="placeId" id="placeId" data-placeholder="请选择放映场地"  style="height: 20px; width: 315px;">
							<option value=""></option>
								<c:forEach items="${filmAddressList}" var="list">
									<option value="${list.placeId}" <c:if test="${list.placeId == pd.placeId}">selected</c:if>>
										${list.pName}
									</option>
								</c:forEach>
					</select>
					</td> 
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>电影类型</B></td>
					<td>
						<select class="chzn-select" name="filmType" id="filmType" data-placeholder="请选择电影类型"  style="height: 20px; width: 315px;">
							<option value=""></option>
								<c:forEach items="${filmTypeList}" var="list">
									<option value="${list.distinguishId}" <c:if test="${list.distinguishId == pd.filmType}">selected</c:if>>
										${list.value}
									</option>
								</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>缩略图片</B></td>
					<td>
						<div class="form-group" id="businessDiv">
						    <div class="upload_img">
							    <input id="filmPath" name="filmPath" type="hidden" value="${pd.filmPath}"/>
							   <c:if test="${empty pd.filmPath}">
									<img id="weixin_show" name="weixin_show" style="width: auto; max-width:200px; height: 150px;" src="<%=basePath%>shyl/images/temp.png">
							   </c:if>
								<c:if test="${!empty pd.filmPath}">
						        	<img id="weixin_show" name="weixin_show" style="width: auto; max-width:200px; height: 150px;" onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="${img_host}${pd.filmPath}">
						        </c:if>
								<a href="javascript:;" class="a-upload" style="text-decoration:none; color:#ffffff;">上传本地图片
								<input type="file" id="weixin_image" placeholder="上传本地图片" name="weixin_image" multiple></a>
								<p>支持的文件格式为.gif、.jpeg、.jpg、.png</p>
							</div>
						</div>
						<div class="cut_img">
							<a class="btn  btn-success" onclick="cutImage();"></i>裁切图片</a>
							<input type="hidden" id="cutImage" name="cutImage" value="${pd.filmPath}" placeholder="裁切图片"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							宽度：<input type="text" id="width" name="width" style="width:50px" value="300"/>&nbsp;&nbsp;&nbsp;&nbsp;
							高度：<input type="text" id="height" name="height" style="width:50px" value="400"/>
						</div>
					</td>
				</tr>
				<tr>
					<td nowrap="nowrap"
						style="width: 80px; text-align: left; padding-top: 13px;"><B>电影介绍</B></td>
					<td><textarea id="summary" name="summary" maxlength="10000" 
							style="min-height: 300px; margin: 0 auto; width: 90%;float:left" 
							title="电影介绍">${pd.summary}</textarea></td>
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

			<a class="btn  btn-success" onclick="update();"><i class="icon-save"></i>保存</a> 
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
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script>
	<!-- 编辑器源码文件 -->
	<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>

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
			
			$("#weixin_image").fileupload({
				 dataType :'iframe text',
				 autoUpload: true,
				 maxNumberOfFiles : 1,
		         url: '<%=basePath%>film/Upload.do',
		        sequentialUploads: true
			 }).bind('fileuploadchange', function (e, data) {
				 if(data.files.length > 1){
					 $("#weixin_show").tips({
							side : 2,
							msg : '只能上传一张图片。',
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
		   	 }else {
		   		 $("#weixin_show").attr("src","${img_host}"+data.result);
		            document.getElementById("filmPath").value=data.result;
		            $("#cutImage").val(data.result);
		   	 }
		    });
			
			
			//放映时间 回传值
			var arrayList = ${arrayList};
			
			$.each(arrayList,function(i,obj){
				if(i==0){
					var str = '<span id="sp">' +
					'<input type="hidden" id="filmDetailId" name="filmDetailId" value="'+obj.filmDetailId+'"/>' +
					'<input type="text" id="filmStartDate" name="filmStartDate" class="Wdate" value="'+obj.filmStartDate+'" readonly="readonly" placeholder="请选择开始日期"' +
					'onclick="WdatePicker({maxDate:\'#F{$dp.$D(\\\'filmEndDate\\\',{d:-0});}\',dateFmt:\'yyyy-MM-dd HH:mm\',isShowClear:true,<c:if test="${pd.film_status==0}">editable=false</c:if>});"/>' +
					' - <input type="text" id="filmEndDate" name="filmEndDate" class="Wdate" value="'+obj.filmEndDate+'" readonly="readonly" placeholder="请选择结束日期"' +
					'onclick="WdatePicker({minDate:\'#F{$dp.$D(\\\'filmStartDate\\\',{d:0});}\',dateFmt:\'yyyy-MM-dd HH:mm\',isShowClear:true,<c:if test="${pd.film_status==0}">editable=false</c:if>});"/>' +
					' <input type="text" id="person" <c:if test="${pd.film_status==0}">readonly="readonly"</c:if> name="person" value="'+obj.person+'" placeholder="请输入观影人数"/>' + 
					'  <i class="small-icon fa fa-plus-square" <c:if test="${pd.film_status==1}">onclick="addOption()"</c:if> style="cursor:pointer;color: #219823;" title="添加选项"></i>'+
					'<span style="margin-left: 50px;color: red;"><c:if test="${pd.film_status==0}">上架状态，不可修改</c:if></span>'+
					'</br>'+
					'</span>';
				}else{
					var str = '<span id="sp">' +
					'<input type="hidden" id="filmDetailId" name="filmDetailId" value="'+obj.filmDetailId+'"/>' +
					'<input type="text" id="filmStartDate'+i+'" name="filmStartDate" class="Wdate" value="'+obj.filmStartDate+'" readonly="readonly" placeholder="请选择开始日期"' +
					'onclick="WdatePicker({maxDate:\'#F{$dp.$D(\\\'filmEndDate'+i+'\\\',{d:-0});}\',dateFmt:\'yyyy-MM-dd HH:mm\',isShowClear:true,<c:if test="${pd.film_status==0}">editable=false</c:if>});"/>' +
					' - <input type="text" id="filmEndDate'+i+'" name="filmEndDate" class="Wdate" value="'+obj.filmEndDate+'" readonly="readonly" placeholder="请选择结束日期"' +
					'onclick="WdatePicker({minDate:\'#F{$dp.$D(\\\'filmStartDate'+i+'\\\',{d:0});}\',dateFmt:\'yyyy-MM-dd HH:mm\',isShowClear:true,<c:if test="${pd.film_status==0}">editable=false</c:if>});"/>' +
					' <input type="text" id="person" <c:if test="${pd.film_status==0}">readonly="readonly"</c:if> name="person" value="'+obj.person+'" placeholder="请输入观影人数"/>' + 
					'<i class="small-icon ques-remove-opt fa fa-minus-square" title="删除此选项" <c:if test="${pd.film_status==1}">onclick="deleteOption(this)"</c:if>></i>'+
					'</br>'+
					'</span>';
				}
				
				$(str).appendTo($("#good"));
			});
			
			
		});
		
		//返回
	    function returnback(){
	    	var url = $("input[name='url']").val();
	    	window.location.href="<%=basePath%>film/list.do"+url;
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
					diag.URL = dialogPath+"film/toCutImage.do?cutImage="+cutImage+"&width="+width+"&height="+height;
					
					diag.OKEvent = function(){//确定事件
						var x = diag.innerFrame.contentWindow.x;
						var y = diag.innerFrame.contentWindow.y;
						var w = diag.innerFrame.contentWindow.w;
						var h = diag.innerFrame.contentWindow.h;
						
						if(x.value != "" && y.value != "" && w.value != "" && h.value != ""){
							$.ajax({
								type: "POST",
								url: "<%=basePath%>film/cutImage.do",
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
									$("#filmPath").val(result);
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