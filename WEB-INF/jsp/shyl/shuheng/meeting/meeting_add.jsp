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
<%@ include file="../../../system/admin/top.jsp"%>
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=CIj675KvsEVU85xdW0OeLSFi5zgUc2EZ&s=1"></script>
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
	left: 344px;
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
						<span style="color: #C00; padding-right: 4px;">*</span><B>报名通知</B></td>
					<td>
						<select id="sign_up_id" class="chzn-select" name="sign_up_id"  data-placeholder="请选择活动"  style="height: 20px; width: 315px;">
								<option value=""></option>
								<c:forEach items="${signUpList}" var="list">
									<option value="${list.sign_up_id}">${list.sign_up_title}</option>
								</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>会议名称</B></td>
					<td>
					    <input type="text" name="meeting_title" id="meeting_title" maxlength="200" style="height: 20px; width: 300px;" placeholder="请输入会议名称" title="会议名称" onblur="trim(this);" />
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>会议类型</B></td>
					<td>
						<input type="radio" name="meeting_type" value="0" checked="checked"  title="内部" style="opacity:1;position: relative;">内部(仅报名人员可见)</br>
						<input type="radio" name="meeting_type" value="1"  title="开放" style="opacity:1;position: relative;">开放(所有人可见)
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>时间</B></td>
					<td>
						<span>
							<input name="meeting_begin_time" id="meeting_begin_time" class="Wdate" value="${pd.meeting_begin_time}" type="text" readonly="readonly" placeholder="请选择开始时间" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'meeting_end_time\',{d:-0});}',dateFmt:'yyyy-MM-dd HH:mm',isShowClear:true});"/>
							- <input name="meeting_end_time" id="meeting_end_time" class="Wdate" value="${pd.meeting_end_time}" type="text" readonly="readonly" placeholder="请选择结束时间" onclick="WdatePicker({minDate:'#F{$dp.$D(\'meeting_begin_time\',{d:0});}',dateFmt:'yyyy-MM-dd HH:mm',isShowClear:true});"/>
						</span>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>报到地点</B></td>
					<td>
					    <input type="text" name="meeting_regist_place" id="meeting_regist_place" maxlength="200" style="height: 20px; width: 300px;" placeholder="请选择报到地点" title="报到地点" onblur="trim(this);" />
					    <div id="l-map" style="height:300px;width:100%;display:none;"></div>
					    <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
					    <input type="hidden" name="meeting_regist_lng" id="meeting_regist_lng"/>
					    <input type="hidden" name="meeting_regist_lat" id="meeting_regist_lat"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<B>报到联系人</B></td>
					<td>
						<textarea name="meeting_linkman_txt" id="meeting_linkman_txt" maxlength="200" style="height: 80px; width: 300px;" placeholder="请输入报到联系人及联系方式" title="报到联系人" onblur="trim(this);"></textarea>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>会议地点</B></td>
					<td>
					    <input type="text" name="meeting_place" id="meeting_place" maxlength="200" style="height: 20px; width: 300px;" placeholder="请选择会议地点" title="会议地点" onblur="trim(this);" />
					    <div id="meeting_place_map" style="height:300px;width:100%;display:none;"></div>
					    <input type="hidden" name="meeting_lng" id="meeting_lng"/>
					    <input type="hidden" name="meeting_lat" id="meeting_lat"/>
					</td>
				</tr>
				
				
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>标题图</B></td>
					<td>
						<div class="upload_img">
							<input id="meeting_img" name="meeting_img" type="hidden" />
							<img id="weixin_show" name="weixin_show" style="width: auto; max-width:200px; height: 150px;" src="<%=basePath%>shyl/images/temp.png"> 
							<a href="javascript:;" class="a-upload" style="text-decoration: none; color: #ffffff;">上传本地图片 
								<input type="file" id="weixin_image" placeholder="上传本地图片" name="weixin_image" multiple>
							</a>
							<p>支持的文件格式为.gif、.jpeg、.jpg、.png</p>
						</div>
						<div class="cut_img">
							<a class="btn  btn-success" onclick="cutImage();"></i>裁切图片</a>
							<input type="hidden" id="cutImage" name="cutImage" placeholder="裁切图片"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							宽度：<input type="text" id="width" name="width" style="width:50px" value="400"/>&nbsp;&nbsp;&nbsp;&nbsp;
							高度：<input type="text" id="height" name="height" style="width:50px" value="200"/>
						</div>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>会议保障</B></td>
					<td>
						<div class="form-group" id="businessDiv">
							<div class="upload">
								<input id="meeting_protect_file_name" name="meeting_protect_file_name" maxlength="500" type="hidden" value="${pd.meeting_protect_file_name}"/> 
								<input id="meeting_protect_file" name="meeting_protect_file" maxlength="100" type="hidden" value="${pd.meeting_protect_file}"/>
								<input type="text" class="docName" value="${pd.meeting_protect_file_name}" maxlength="100" style="height: 20px; width: 300px;" readonly="readonly"/> 
								<a href="javascript:;" class="a-upload" style="text-decoration: none; color: #ffffff;" id="fileDiv">上传本地附件 
									<input type="file" id="meeting_protect_upload" placeholder="上传本地附件" name="file_upload" multiple>
								</a> 
								<a href="javascript:;" style="text-decoration: none; color: #ffffff; left: 450px" onclick="deleteFile(this)">移除附件
								</a>
								<p style="font-size: 12px" class="style1">支持的文件格式为.pdf（文件最大为50M）</p>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>会议日程</B></td>
					<td>
						<div class="form-group" id="businessDiv">
							<div class="upload">
								<input id="meeting_schedule_file_name" name="meeting_schedule_file_name" maxlength="500" type="hidden" value="${pd.meeting_schedule_file_name}"/> 
								<input id="meeting_schedule_file" name="meeting_schedule_file" maxlength="100" type="hidden" value="${pd.meeting_schedule_file}"/>
								<input type="text" class="docName" value="${pd.meeting_schedule_file_name}" maxlength="100" style="height: 20px; width: 300px;" readonly="readonly"/> 
								<a href="javascript:;" class="a-upload" style="text-decoration: none; color: #ffffff;" id="fileDiv">上传本地附件 
									<input type="file" id="file_upload" placeholder="上传本地附件" name="file_upload" multiple>
								</a> 
								<a href="javascript:;" style="text-decoration: none; color: #ffffff; left: 450px" onclick="deleteFile(this)">移除附件
								</a>
								<p style="font-size: 12px" class="style1">支持的文件格式为.pdf（文件最大为50M）</p>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>提前报到</B></td>
					<td>
						<div class="form-group" id="businessDiv">
							<div class="upload">
								<input id="meeting_regist_file_name" name="meeting_regist_file_name" maxlength="500" type="hidden" value="${pd.meeting_regist_file_name}"/> 
								<input id="meeting_regist_file" name="meeting_regist_file" maxlength="100" type="hidden" value="${pd.meeting_regist_file}"/>
								<input type="text" class="docName" value="${pd.meeting_regist_file_name}" maxlength="100" style="height: 20px; width: 300px;" readonly="readonly"/> 
								<a href="javascript:;" class="a-upload" style="text-decoration: none; color: #ffffff;" id="fileDiv">上传本地附件 
									<input type="file" id="file_upload" placeholder="上传本地附件" name="file_upload" multiple>
								</a> 
								<a href="javascript:;" style="text-decoration: none; color: #ffffff; left: 450px" onclick="deleteFile(this)">移除附件
								</a>
								<p style="font-size: 12px" class="style1">支持的文件格式为.pdf（文件最大为50M）</p>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>会议座次</B></td>
					<td>
						<div class="form-group" id="businessDiv">
							<div class="upload">
								<input id="meeting_seat_file_name" name="meeting_seat_file_name" maxlength="500" type="hidden" value="${pd.meeting_seat_file_name}"/> 
								<input id="meeting_seat_file" name="meeting_seat_file" maxlength="100" type="hidden" value="${pd.meeting_seat_file}"/>
								<input type="text" class="docName" value="${pd.meeting_seat_file_name}" maxlength="100" style="height: 20px; width: 300px;" readonly="readonly"/> 
								<a href="javascript:;" class="a-upload" style="text-decoration: none; color: #ffffff;" id="fileDiv">上传本地附件 
									<input type="file" id="file_upload" placeholder="上传本地附件" name="file_upload" multiple>
								</a> 
								<a href="javascript:;" style="text-decoration: none; color: #ffffff; left: 450px" onclick="deleteFile()">移除附件
								</a>
								<p style="font-size: 12px" class="style1">支持的文件格式为.pdf（文件最大为50M）</p>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>食宿交通</B></td>
					<td>
						<div class="form-group" id="businessDiv">
							<div class="upload">
								<input id="meeting_life_file_name" name="meeting_life_file_name" maxlength="500" type="hidden" value="${pd.meeting_life_file_name}"/> 
								<input id="meeting_life_file" name="meeting_life_file" maxlength="100" type="hidden" value="${pd.meeting_life_file}"/>
								<input type="text" class="docName" value="${pd.meeting_life_file_name}" maxlength="100" style="height: 20px; width: 300px;" readonly="readonly"/> 
								<a href="javascript:;" class="a-upload" style="text-decoration: none; color: #ffffff;" id="fileDiv">上传本地附件 
									<input type="file" id="file_upload" placeholder="上传本地附件" name="file_upload" multiple>
								</a> 
								<a href="javascript:;" style="text-decoration: none; color: #ffffff; left: 450px" onclick="deleteFile(this)">移除附件
								</a>
								<p style="font-size: 12px" class="style1">支持的文件格式为.pdf（文件最大为50M）</p>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>分组讨论</B></td>
					<td>
						<div class="form-group" id="businessDiv">
							<div class="upload">
								<input id="meeting_group_file_name" name="meeting_group_file_name" maxlength="500" type="hidden" value="${pd.meeting_group_file_name}"/> 
								<input id="meeting_group_file" name="meeting_group_file" maxlength="100" type="hidden" value="${pd.meeting_group_file}"/>
								<input type="text" class="docName" value="${pd.meeting_group_file_name}" maxlength="100" style="height: 20px; width: 300px;" readonly="readonly"/> 
								<a href="javascript:;" class="a-upload" style="text-decoration: none; color: #ffffff;" id="fileDiv">上传本地附件 
									<input type="file" id="file_upload" placeholder="上传本地附件" name="file_upload" multiple>
								</a> 
								<a href="javascript:;" style="text-decoration: none; color: #ffffff; left: 450px" onclick="deleteFile(this)">移除附件
								</a>
								<p style="font-size: 12px" class="style1">支持的文件格式为.pdf（文件最大为50M）</p>
							</div>
						</div>
					</td>
				</tr>
				
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>温馨提示</B></td>
					<td>
						<div class="form-group" id="businessDiv">
							<div class="upload">
								<input id="meeting_tip_file_name" name="meeting_tip_file_name" maxlength="500" type="hidden" value="${pd.meeting_tip_file_name}"/> 
								<input id="meeting_tip_file" name="meeting_tip_file" maxlength="100" type="hidden" value="${pd.meeting_tip_file}"/>
								<input type="text" class="docName" value="${pd.meeting_tip_file_name}" maxlength="100" style="height: 20px; width: 300px;" readonly="readonly"/> 
								<a href="javascript:;" class="a-upload" style="text-decoration: none; color: #ffffff;" id="fileDiv">上传本地附件 
									<input type="file" id="file_upload" placeholder="上传本地附件" name="file_upload" multiple>
								</a> 
								<a href="javascript:;" style="text-decoration: none; color: #ffffff; left: 450px" onclick="deleteFile(this)">移除附件
								</a>
								<p style="font-size: 12px" class="style1">支持的文件格式为.pdf（文件最大为50M）</p>
							</div>
						</div>
					</td>
				</tr>
				
				<tr>
					<td></td>
					<td></td>
				</tr>
			</table>
		<div align="center" style="margin-top: 10px;">

			<a class="btn  btn-success" onclick="save();"><i
				class="icon-save"></i>保存</a> <a class="btn  btn-light"
				onclick="returnback()"><i class=" icon-circle-arrow-left"></i>返回</a>
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
	  
	// 百度地图API功能
    function G(id) {
        return document.getElementById(id);
    }

    var registMap = new BMap.Map("l-map");
    registMap.centerAndZoom("济南",12);                   // 初始化地图,设置城市和地图级别。
    var registPlace = new BMap.Autocomplete(    //建立一个自动完成的对象
        {"input" : "meeting_regist_place"
        ,"location" : registMap
    });
    onHighLight(registPlace,registMap,"meeting_regist");
    
    var map = new BMap.Map("meeting_place_map");
    map.centerAndZoom("济南",12); 

    var place = new BMap.Autocomplete(    //建立一个自动完成的对象
        {"input" : "meeting_place"
        ,"location" : map
    });
    onHighLight(place,map,"meeting");
    
    function onHighLight(ac,map,idStr){
    	ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
    	    var str = "";
    	        var _value = e.fromitem.value;
    	        var value = "";
    	        if (e.fromitem.index > -1) {
    	            value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
    	        }    
    	        str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
    	        
    	        value = "";
    	        if (e.toitem.index > -1) {
    	            _value = e.toitem.value;
    	            value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
    	        }    
    	        str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
    	        G("searchResultPanel").innerHTML = str;
    	    });

    	    var myValue;
    	    ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
    	    var _value = e.item.value;
    	        myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
    	        G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
    	        
    	        map.clearOverlays();    //清除地图上所有覆盖物
    	        function myFun(){
    	            var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
    	            console.log(pp.lng+"++++++++++++++"+pp.lat)
    	            $("#"+idStr+"_lng").val(pp.lng);
    	            $("#"+idStr+"_lat").val(pp.lat);
    	            map.centerAndZoom(pp, 18);
    	            map.addOverlay(new BMap.Marker(pp));    //添加标注
    	        }
    	        var local = new BMap.LocalSearch(map, { //智能搜索
    	          onSearchComplete: myFun
    	        });
    	        local.search(myValue);
    	    });
    }
    
    

	
	
		$(top.hangge());
		
		$(document).ready(function(){
			
			$("#meeting_regist_place").focus(function(){
				$("#l-map").show();
			});
			$("#meeting_regist_place").blur(function(){
				$("#l-map").hide();
			});
			$("#meeting_place").focus(function(){
				$("#meeting_place_map").show();
			});
			$("#meeting_place").blur(function(){
				$("#meeting_place_map").hide();
			});
			
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			
			
			
			
			
			$("#weixin_image").fileupload({
				 dataType :'iframe text',
				 autoUpload: true,
				 maxNumberOfFiles : 1,
		         url: '<%=basePath%>meeting/Upload.do',
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
		   	 }else {
		   		 $("#weixin_show").attr("src","${img_host}"+data.result);
		            document.getElementById("meeting_img").value=data.result;
		            $("#cutImage").val(data.result);
		   	 }
		    });
			
			
			//改变活动，自动填充标题，开始结束时间
			$("#sign_up_id").change(function(){
				var signUpId = $(this).val();
				if(signUpId!=null && signUpId!=''){
					$.ajax({
						type: "POST",
						url: "<%=basePath%>meeting/ajaxFindSignUp.do",
						data:{
							sign_up_id:$(this).val()
						},
						dataType:"json",
						cache : false,
						success:function(result){
							if(result.errorCode == "200"){
								$("#meeting_title").val(result.data.sign_up_title);
								$("#meeting_begin_time").val(result.data.going_begin_time);
								$("#meeting_end_time").val(result.data.going_end_time);
							}
						}
					});
				}
			});
			
			
			//附件上传
		    $("input[name='file_upload']").each(function(){
		    	 $(this).fileupload({
		 			dataType :'iframe text',
		 			autoUpload: true,
		 			maxNumberOfFiles : 1,
		 			maxFileSize: 50000000,
		 	        url: '<%=basePath%>meeting/fileUpLoad.do',
		 			sequentialUploads : true,
		 			add: function (e, data) {
		 				var oldpath = $(this).parents("a").siblings("input[name$='file']").val();
		 				data.url = '<%=basePath%>meeting/fileUpLoad.do?oldpath='+oldpath;
		 				data.submit();
		 			}
		 			}).bind('fileuploadchange', function(e, data) {			 
		 				if (data.files.length > 1) {
		 					$(this).tips({
		 						side : 2,
		 						msg : "只能上传一个文件。",
		 						bg : '#FF5080',
		 						time : 2
		 					});
		 					return false;
		 				}
		 			}).bind('fileuploaddone', function(e, data) {
		 				if ("no" == data.result) {
		 					$(this).tips({
		 						side : 2,
		 						msg : "请上传.pdf格式的文件。",
		 						bg : '#FF5080',
		 						time : 2
		 					});
		 				}else if('outsize' == data.result){
		 					$(this).tips({
		 						side : 2,
		 						msg : "上传失败，文件最大为50M。",
		 						bg : '#FF5080',
		 						time : 2
		 					});
		 				}else {
		 					$(this).parent().siblings("input[name$='file']").val(data.result);
		 					$(this).parent().siblings("input[name$='file_name']").val(data.originalFiles[0].name);
		 					$(this).parent().siblings(".docName").val(data.originalFiles[0].name);
		 				}
		 			});
		    })
			
		});
		
		//返回
	    function returnback(){
	    	window.location.href="<%=basePath%>meeting/list.do";
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
								url: "<%=basePath%>meeting/cutImage.do",
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
									$("#meeting_img").val(result);
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
	
		var tips=function(id,msg){
			$("#"+id).tips({
				side : 2,
				msg : msg,
				bg : '#FF5080',
				time : 10
			});
		}
		
	    
	    function save(){
	    	if($("#sign_up_id").val()==null || $("#sign_up_id").val()==""){
	    		tips("sign_up_id","请选择活动");
	    		return false;
	    	}
	    	
	    	if($("#meeting_title").val()==null || $("#meeting_title").val()==""){
	    		tips("meeting_title","请输入会议名称");
	    		return false;
	    	}
	    	
	    	if($("#meeting_begin_time").val()==null || $("#meeting_begin_time").val()==""){
	    		tips("meeting_begin_time","请选择开始时间");
	    		return false;
	    	}
	    	
	    	if($("#meeting_end_time").val()==null || $("#meeting_end_time").val()==""){
	    		tips("meeting_end_time","请选择结束时间");
	    		return false;
	    	}
	    	
	    	
	    	if($("#meeting_place").val()==null || $("#meeting_place").val()=="" || $("#meeting_lng").val()==null || $("#meeting_lng").val()=="" ||$("#meeting_lat").val()==null || $("#meeting_lat").val()==""){
	    		tips("meeting_place","请重新选择会议地点");
	    		return false;
	    	}
	    	
	    	if($("#meeting_regist_place").val()==null || $("#meeting_regist_place").val()=="" || $("#meeting_regist_lng").val()==null || $("#meeting_regist_lng").val()=="" || $("#meeting_regist_lat").val()==null || $("#meeting_regist_lat").val()==""){
	    		tips("meeting_regist_place","请重新选择报到地点");
	    		return false;
	    	}
	    	
	    	
	    	$("#Form").submit();
	    	
	    }
	    
	    
		
	    
		//附件删除
		function deleteFile(obj){
			$(obj).siblings("input").each(function(){
				$(this).val('')
			});
		}
	</script>
</body>
</html>