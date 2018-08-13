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
<title>新闻添加页面</title>
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
		<input type="hidden" id="column_id" name="column_id" value="${pd.column_id}"/>
		<input type="hidden" id="unit_id" name="unit_id" value="${pd.unit_id}"/>
		<input type="hidden" name="url" value="${url}" />
		<div id="zhongxin">
			<table class="table">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>新闻标题</B>
					</td>
					<td>
						<input type="text" name="news_title" value="${pd.news_title}" id="news_title" maxlength="50" style="height: 20px; width: 300px;" placeholder="请输入新闻标题" title="新闻标题" onblur="trim(this);"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<B>新闻来源</B>
					</td>
					<td>
						<input type="text" name="news_source" value="${pd.news_source}" id="news_source" maxlength="50" style="height: 20px; width: 300px;" placeholder="默认为当前单位名称" title="新闻来源" onblur="trim(this);"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<B>发布时间</B>
					</td>
					<td>
						<input type="text" class="span10 date-picker" name="release_time" value="${pd.release_time}" id="release_time" class="Wdate"  type="text" data-date-format="yyyy-mm-dd HH:mm" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowClear:true,maxDate:'%y-%M-%d'});" readonly="readonly" style="height: 20px; width: 300px;" placeholder="默认为当前时间" title="发布时间" onblur="trim(this);"/>
					</td>
				</tr>
				<c:if test="${pd.superAdmin}">
					<tr>
						<td style="width: 100px; text-align: left; padding-top: 13px;">
							<span style="color: #C00; padding-right: 4px;">*</span><B>所属单位</B>
						</td>
						<td>
						<a class="btn btn-mini btn-purple" id="aTitle" title="选择单位" onclick="selectUnit('${pd.column_id}');"><i class="icon-pencil">选择单位</i></a>
						<input type="text" id="unit_name" name="unit_name" value="${pd.unit_name}" readonly="readonly" style="margin-bottom:0px;margin-left:30px;"/>
						</td>
					</tr>
				</c:if>
<!-- 				<tr> -->
<!-- 					<td style="width: 100px; text-align: left; padding-top: 13px;"> -->
<!-- 						<span style="color: #C00; padding-right: 4px;">*</span><B>状态</B> -->
<!-- 					</td> -->
<!-- 					<td style="text-align: center;"> -->
<!-- 						<label style="float:left;padding-left: 32px;"><input name="del_flag" id="del_flag" value="0" type="radio" checked="checked"><span class="lbl">发布</span></label> -->
<!-- 						<label style="float:left;padding-left: 5px;"><input name="del_flag" id="del_flag" value="2" type="radio"><span class="lbl">草稿</span></label> -->
<!-- 					</td> -->
<!-- 				</tr> -->
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;">
						<B>标题图</B>
					</td>
					<td>
						<div class="upload_img">
							<input id="news_picturePath" name="news_picturePath" value="${pd.news_picturePath}" type="hidden"/>
							<c:if test="${empty pd.news_picturePath}">
								<img id="weixin_show" name="weixin_show" style="width: auto; height: 150px;max-width:200px;" src="<%=basePath%>shyl/images/temp.png">
							</c:if>
							<c:if test="${!empty pd.news_picturePath}">
						        <img id="weixin_show" name="weixin_show" style="width: auto; height: 150px;max-width:200px;" onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="${img_host}${pd.news_picturePath}">
						    </c:if>
							<a href="javascript:;" class="a-upload" style="text-decoration: none; color: #ffffff;">上传本地图片 
								<input type="file" id="weixin_image" placeholder="上传本地图片" name="weixin_image" multiple>
							</a>
							<p>支持的文件格式为.gif、.jpeg、.jpg、.png</p>
						</div>
						<div class="cut_img">
							<a class="btn  btn-success" onclick="cutImage();"></i>裁切图片</a>
							<input type="hidden" id="cutImage" name="cutImage" value="${pd.news_picturePath}" placeholder="裁切图片"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							宽度：<input type="text" id="width" name="width" value="${pd.column_width}" style="width:50px"/>&nbsp;&nbsp;&nbsp;&nbsp;
							高度：<input type="text" id="height" name="height" value="${pd.column_height}" style="width:50px"/>
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
<!-- 								<a href="javascript:;" class="a-upload" style="text-decoration: none; color: #ffffff;" id="fileDiv">上传本地附件  -->
<!-- 									<input type="file" id="file_upload" placeholder="上传本地附件" name="file_upload" multiple> -->
<!-- 								</a>  -->
<!-- 								<a href="javascript:;" style="text-decoration: none; color: #ffffff; left: 450px" onclick="deleteFile()">移除附件 -->
<!-- 								</a> -->
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
		<div align="center" style="margin-top: 10px; width:1000px;">
			<a class="btn  btn-success" onclick="save('0');"><i class="icon-save"></i>发布</a> 
			<a class="btn  btn-success" onclick="save('2');"><i class="icon-save"></i>保存草稿</a> 
			<a class="btn  btn-light" onclick="returnback()"><i class=" icon-circle-arrow-left"></i>返回</a>
			<div class="dropdown" style="display:-webkit-inline-box;display:inline-box;">
			    <button type="button" class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">预览
			        <span class="caret"></span>
			    </button>
			    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
			        <li role="presentation">
			            <a role="menuitem" tabindex="-1" href="javascript:void(0);" onclick="phoneView('iphone5')">iPhone 5/SE</a>
			        </li>
			        <li role="presentation">
			            <a role="menuitem" tabindex="-1" href="javascript:void(0);" onclick="phoneView('iphone6')">iPhone 6/7/8</a>
			        </li>
			        <li role="presentation">
			            <a role="menuitem" tabindex="-1" href="javascript:void(0);" onclick="phoneView('iphone6plus')">iPhone 6/7/8 Plus</a>
			        </li>
			        <li role="presentation" class="divider"></li>
			        <li role="presentation">
			            <a role="menuitem" tabindex="-1" href="javascript:void(0);" onclick="phoneView('GalaxyS5')">Galaxy S5</a>
			        </li>
			    </ul>
			</div>
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
		         url: '<%=basePath%>columnManagement/pictureUpLoad.do',
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
		            document.getElementById("news_picturePath").value=data.result;
		            $("#cutImage").val(data.result);
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
		        url: '<%=basePath%>columnManagement/fileUpLoad.do',
				sequentialUploads : true,
				add: function (e, data) {
					var oldpath = $("#news_filePath").val();
					 data.url = '<%=basePath%>columnManagement/fileUpLoad.do?oldpath='+oldpath;
					 data.submit();
				}
				}).bind('fileuploadchange', function(e, data) {			 
					if (data.files.length > 1) {
						tips("fileDiv", "只能上传一个文件。");
						return false;
					}
				}).bind('fileuploaddone', function(e, data) {
					if ("no" == data.result) {
						tips("fileDiv", "请上传格式为.doc/.docx/.xls/.xlsx/.ppt/.pptx/.txt格式的文档文件。");
					}else if('outsize' == data.result){
						tips("fileDiv", "上传失败，文件最大为50M。");
					}else {
						$("#news_filePath").val(data.result);
						$("#news_fileName").val(data.originalFiles[0].name);				
						$("#news_filePath").text(data.result);
						$("#news_fileName").text(data.originalFiles[0].name);
						$("#docName").val(data.originalFiles[0].name);
					}
				});
			 /*---------------- 附件上传----------------end */
			
			
			 /*------------------ 富文本编辑器  start------------------ */
			 
				ue = UE.getEditor("news_content");//编辑器初始化
			    
			 /*------------------ 富文本编辑器  end------------------ */
			
			
		});
		
		//返回
	    function returnback(newsType){
	    	var url = $("input[name='url']").val();
	    	window.location.href="<%=basePath%>columnManagement/contentRight.do"+url;
		}
		
	  //选择单位
		function selectUnit(column_id){
		  var unitId = $("#unit_id").val();
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Width = 280;
			diag.Height = 370;
			diag.Title = "单位信息";
			diag.ShowButtonRow = false;
			diag.URL = dialogPath + "columnManagement/toSelectUnit.do?column_id="+column_id+"&unit_id="+unitId;
			
			diag.OKEvent = function(){//确定事件
				var unit_id = diag.innerFrame.contentWindow.unit_id;
				var unit_name = diag.innerFrame.contentWindow.unit_name;
				$("#unit_id").val(unit_id.value);
				$("#unit_name").val(unit_name.value);
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
	    function save(del_flag){
	    	var flag = "${pd.superAdmin}";
	    	
	    	//校验
	    	var newsTitle = $("#news_title").val();
	    	if (newsTitle == "") {
	    		$("#news_title").tips({
	    			side : 3,
	    			msg : '请输入新闻标题',
	    			bg : '#FF5080',
	    			time : 2
	    		});
	    		$("#news_title").focus();
	    		return false;
	    	}
	    	//处理标题有英文双引号的问题
	    	if(newsTitle.indexOf('"')>-1){
	    		newsTitle = newsTitle.replace(/"/g,"”")
	    		$("#news_title").val(newsTitle)
	    	}
	    	
	    	if(flag == "true"){
	    		if ($("#unit_id").val() == "") {
		    		$("#aTitle").tips({
		    			side : 3,
		    			msg : '请选择单位',
		    			bg : '#FF5080',
		    			time : 2
		    		});
		    		return false;
		    	}
	    	}
// 	    	if ($("#news_picturePath").val() == "") {
// 	    		$("#weixin_show").tips({
// 	    			side : 3,
// 	    			msg : '请选择图片',
// 	    			bg : '#FF5080',
// 	    			time : 2
// 	    		});
// 	    		return false;
// 	    	}
			$("#Form").attr("action","<%=basePath%>columnManagement/saveContent.do?del_flag="+del_flag);
	    	$("#Form").submit();
	    	$("#zhongxin").hide();
	    	$("#zhongxin2").show();
	    	
	    }
		
		//附件删除
		function deleteFile(){
			$("#docName").val('');
			$("#news_fileName").val('');
			$("#news_filePath").val('');
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
					diag.URL = dialogPath + "columnManagement/toCutImage.do?cutImage="+cutImage+"&width="+width+"&height="+height;
					
					diag.OKEvent = function(){//确定事件
						var x = diag.innerFrame.contentWindow.x;
						var y = diag.innerFrame.contentWindow.y;
						var w = diag.innerFrame.contentWindow.w;
						var h = diag.innerFrame.contentWindow.h;
						
						if(x.value != "" && y.value != "" && w.value != "" && h.value != ""){
							$.ajax({
								type: "POST",
								url: "<%=basePath%>columnManagement/cutImage.do",
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
									$("#news_picturePath").val(result);
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