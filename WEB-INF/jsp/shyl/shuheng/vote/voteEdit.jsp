<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<meta charset="utf-8" />
<title>电影详情</title>
<meta name="description" content="overview & stats" />
<%@ include file="../../../system/admin/top.jsp"%>

<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
<script type="text/javascript" src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>

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
	width: 90%;
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
	width: 90%;
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
	<form action="<%=basePath%>vote/updateVote.do" name="Form" id="Form" method="post">
		<input type="hidden" id="vote_id" name="vote_id" value="${pd.vote_id}"/>
		<input type="hidden" name="parent_id" id="parent_id" value="${votePd.vote_id}">
		<div id="zhongxin">
			<table class="table">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>投票项目</B>
					</td>
					<td>
						<input type="text" name="vote_name" id="vote_name" <c:if test="${lgbj_level!=2}">disabled="disabled" value="${votePd.vote_name}"</c:if> <c:if test="${lgbj_level==2}">value="${pd.vote_name}"</c:if> maxlength="50" style="height: 20px; width: 300px;" placeholder="请输入规则名称" title="规则名称" onblur="trim(this);"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>投票类型</B>
					</td>
					<td>
						<select class="chzn-select" name="vote_type" id="vote_type" <c:if test="${lgbj_level!=2}">disabled="disabled"</c:if> data-placeholder="请选择投票类型"  style="height: 20px; width: 215px;">
							<c:forEach items="${typeList}" var="list">
								<option <c:if test="${list.id == pd.vote_type }">selected</c:if> value="${list.id}">${list.value}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<c:if test="${lgbj_level==2}">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>标题图</B>
					</td>
					<td>
						<div class="upload_img">
							<input id="vote_img" name="vote_img" value="${pd.vote_img}" type="hidden"/>
							<c:if test="${empty pd.vote_img}">
								<img id="weixin_show" name="weixin_show" style="width: auto; height: 150px;max-width:200px;" src="<%=basePath%>shyl/images/temp.png">
							</c:if>
							<c:if test="${!empty pd.vote_img}">
						        <img id="weixin_show" name="weixin_show" style="width: auto; height: 150px;max-width:200px;" onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="${img_host}${pd.vote_img}">
						    </c:if>
							<a href="javascript:;" class="a-upload" style="text-decoration: none; color: #ffffff;">上传本地图片 
								<input type="file" id="weixin_image" placeholder="上传本地图片" name="weixin_image" multiple>
							</a>
							<p>支持的文件格式为.gif、.jpeg、.jpg、.png</p>
						</div>
						<div class="cut_img">
							<a class="btn  btn-success" onclick="cutImage();"></i>裁切图片</a>
							<input type="hidden" id="cutImage" name="cutImage" value="${pd.vote_img}" placeholder="裁切图片"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							宽度：<input type="text" id="width" name="width" value="400" style="width:50px"/>&nbsp;&nbsp;&nbsp;&nbsp;
							高度：<input type="text" id="height" name="height" value="200" style="width:50px"/>
						</div>
					</td>
				</tr>
				</c:if>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>规则</B>
					</td>
					<td>
						每人<input type="number" name="vote_day" id="vote_day" <c:if test="${lgbj_level!=2}">disabled="disabled" value="${votePd.vote_day}"</c:if> <c:if test="${lgbj_level==2}">value="${pd.vote_day}"</c:if> maxlength="3" min="0" style="height: 20px; width: 90px;" placeholder="请输入天数" title="天数" onblur="trim(this);"/>天&nbsp;&nbsp;&nbsp;&nbsp;   
						<input type="number" name="vote_ticket" id="vote_ticket" <c:if test="${lgbj_level!=2}">disabled="disabled" value="${votePd.vote_ticket}"</c:if> <c:if test="${lgbj_level==2}">value="${pd.vote_ticket}"</c:if>maxlength="3" min="1" style="height: 20px; width: 90px;" placeholder="请输入票数" title="票数" onblur="trim(this);"/>票
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>截止时间</B></td>
					<td>
						<span>
							<input name="vote_upload_end_time" id="vote_upload_end_time" value="${pd.vote_upload_end_time }" class="Wdate" value="" type="text"  placeholder="请选择上传团队资料截止时间" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'vote_begin_time\',{d:-0});}',dateFmt:'yyyy-MM-dd HH:mm',isShowClear:true});"/>
						</span>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>投票时间</B></td>
					<td>
						<span>
							<input name="vote_begin_time" id="vote_begin_time" class="Wdate" value="${pd.vote_begin_time}" type="text" placeholder="请选择开始时间" onclick="WdatePicker({minDate:'#F{$dp.$D(\'vote_upload_end_time\',{d:0});}',dateFmt:'yyyy-MM-dd HH:mm',isShowClear:true});"/>
							- <input name="vote_end_time" id="vote_end_time" class="Wdate" value="${pd.vote_end_time}" type="text" placeholder="请选择结束时间" onclick="WdatePicker({minDate:'#F{$dp.$D(\'vote_begin_time\',{d:0});}',dateFmt:'yyyy-MM-dd HH:mm',isShowClear:true});"/>
						</span>
					</td>
				</tr>
				<c:if test="${lgbj_level==2}">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>推荐到轮播图</B></td>
					<td>
						<input type="checkbox" name="vote_push" id="vote_push" <c:if test="${pd.vote_push==1 }">checked</c:if>  value="1" placeholder="选择是否是超级管理员" title="是否是超级管理员" style="opacity:1;position: relative;"/>
					</td>
				</tr>
				</c:if>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
			<c:if test="${lgbj_level==2}">
				<textarea id="vote_rule_txt" name="vote_rule_txt" maxlength="10000" title="活动通知内容" style="width:600px; height:300px;">${pd.vote_rule_txt }</textarea>
			</c:if>
		</div>
		<div align="center" style="margin-top: 10px;">
			<a class="btn  btn-success" onclick="update();"><i class="icon-save"></i>更新</a> 
		</div>
		<div id="zhongxin2" class="center" style="display: none">
			<br /> <br /> <br /> <br /> <img src="<%=basePath%>static/images/jiazai.gif" /><br />
			<h4 class="lighter block green"></h4>
		</div>
	</form>
	
	<script type="text/javascript">
		var ue = UE.getEditor("vote_rule_txt");
		$(top.hangge());
		
		$(document).ready(function(){
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			
			/*---------------- 图片上传----------------start */
			$("#weixin_image").fileupload({
				 dataType :'iframe text',
				 autoUpload: true,
				 maxNumberOfFiles : 1,
		         url: '<%=basePath%>vote/pictureUpLoad.do',
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
		            document.getElementById("vote_img").value=data.result;
		            $("#cutImage").val(data.result);
		   	 }
		    });
			/*---------------- 图片上传----------------end */
			
	   
		});
		
		function today(){
		    var today=new Date();
		    var y=today.getFullYear();
		    var m=today.getMonth()+1;
		    var d=today.getDate();
		    var h=today.getHours();
		    var hour = today.getHours();
		    var minute = today.getMinutes();
		    //var second = today.getSeconds();
		    m= m<10?"0"+m:m;   //  这里判断月份是否<10,如果是在月份前面加'0'
		    d= d<10?"0"+d:d;        //  这里判断日期是否<10,如果是在日期前面加'0'
		    return y+"-"+m+"-"+d+" "+hour+":"+minute;
		}
		
		var tips=function(id,msg){
			$("#"+id).tips({
				side : 2,
				msg : msg,
				bg : '#FF5080',
				time : 2
			});
		}
		
		function update(){
			if($("#vote_name").val()==null || $("#vote_name").val()==""){
				tips("vote_name","请输入规则名称")
				return false;
			}
			
			if($("#vote_type").val()==null || $("#vote_type").val()==""){
				tips("vote_type","请选择投票类型")
				return false;
			}
			
			var flag = false;
			
			$.ajax({
				type : "POST",
				url : "<%=basePath%>vote/exitType.do?tm=" + new Date().getTime(),
				dataType : "text",
				cache : false,
				async:false, 
				data :{vote_type:$("#vote_type").val(),vote_id:$("#vote_id").val()},
				success:function(data){
					if(data == "fail"){
						flag = true;
					}
				}
			});
			
			if(flag){
				tips("vote_type","存在此类型投票")
				return false;
			}
			
			if($("#vote_day").val()==null || $("#vote_day").val()==""){
				tips("vote_day","请输入天数")
				return false;
			}
			
			var voteDay = $("#vote_day").val();
			if(parseInt(voteDay)!=0 && parseInt(voteDay)!=1){
				tips("vote_day","只能填0或者1")
				return false;
			}
			
			if($("#vote_ticket").val()==null || $("#vote_ticket").val()==""){
				tips("vote_ticket","请输入票数")
				return false;
			}
			
			if($("#vote_upload_end_time").val()==null || $("#vote_upload_end_time").val()==""){
				tips("vote_upload_end_time","请输入上传截止时间")
				return false;
			}
			
			if($("#vote_begin_time").val()==null || $("#vote_begin_time").val()==""){
				tips("vote_begin_time","请输入投票开始时间")
				return false;
			}
			
			if($("#vote_end_time").val()==null || $("#vote_end_time").val()==""){
				tips("vote_end_time","请输入投票结束时间")
				return false;
			}
			
			$("#Form").submit();
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
					diag.URL = dialogPath + "vote/toCutImage.do?cutImage="+cutImage+"&width="+width+"&height="+height;
					
					diag.OKEvent = function(){//确定事件
						var x = diag.innerFrame.contentWindow.x;
						var y = diag.innerFrame.contentWindow.y;
						var w = diag.innerFrame.contentWindow.w;
						var h = diag.innerFrame.contentWindow.h;
						
						if(x.value != "" && y.value != "" && w.value != "" && h.value != ""){
							$.ajax({
								type: "POST",
								url: "<%=basePath%>vote/cutImage.do",
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
									$("#vote_img").val(result);
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