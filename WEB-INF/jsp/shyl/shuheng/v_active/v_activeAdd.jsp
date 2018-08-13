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
<title>志愿者活动添加页面</title>
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
	<form action="<%=basePath%>active/saveActive.do" name="Form" id="Form" method="post">
			<table class="table">
<!-- 				<tr> -->
<!-- 					<td style="width: 100px; text-align: left; padding-top: 13px;"> -->
<!-- 						<span style="color: #C00; padding-right: 4px;">*</span><B>组织名称</B></td> -->
<!-- 					<td> -->
<!-- 						<select id="active_organization" class="chzn-select" name="active_organization"  data-placeholder="请选择"  style="height: 20px; width: 315px;"> -->
<!-- 								<option value=""></option> -->
<%-- 								<c:forEach items="${signUpList}" var="list"> --%>
<%-- 									<option value="${list.sign_up_id}">${list.sign_up_title}</option> --%>
<%-- 								</c:forEach> --%>
<!-- 						</select> -->
<!-- 					</td> -->
<!-- 				</tr> -->
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>活动名称</B></td>
					<td>
					    <input type="text" name="active_name" id="active_name" maxlength="50" style="height: 20px; width: 300px;" placeholder="请输入名称" title="名称" onblur="trim(this);" />
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>活动类型</B></td>
					<td>
						<select id="active_type" class="chzn-select" name="active_type"  data-placeholder="请选择类型"  style="height: 20px; width: 315px;">
								<option value=""></option>
								<c:forEach items="${typeList}" var="list">
									<option value="${list.distinguish_id}">${list.value}</option>
								</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>报名截止时间</B></td>
					<td>
						<span>
							<input name="sign_end_time" id="sign_end_time" class="Wdate" type="text" readonly="readonly" placeholder="请选择截止时间" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowClear:true});"/>
						</span>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>活动时间</B></td>
					<td>
						<span>
							<input name="active_start_time" id="active_start_time" class="Wdate" type="text" readonly="readonly" placeholder="请选择开始时间" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'active_end_time\',{d:-0});}',dateFmt:'yyyy-MM-dd HH:mm',isShowClear:true});"/>
							- <input name="active_end_time" id="active_end_time" class="Wdate" type="text" readonly="readonly" placeholder="请选择结束时间" onclick="WdatePicker({minDate:'#F{$dp.$D(\'active_start_time\',{d:0});}',dateFmt:'yyyy-MM-dd HH:mm',isShowClear:true});"/>
						</span>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>爱心小时数</B></td>
					<td>
						<input type="text" name="active_love_hour" id="active_love_hour" value="0" readonly="readonly" style="height: 20px; width: 300px;" title="爱心小时数" onblur="trim(this);" />					
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>联系人</B></td>
					<td>
						<input type="text" name="active_linkman" id="active_linkman" maxlength="20" style="height: 20px; width: 300px;" placeholder="请输入联系人" title="联系人" onblur="trim(this);" />					
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>手机号</B></td>
					<td>
						<input type="text" name="active_linkman_phone" id="active_linkman_phone" maxlength="11" style="height: 20px; width: 300px;" placeholder="请输入联系方式" title="联系方式" onkeyup="value=value.replace(/[^0-9]/g,'')" onblur="trim(this);" />					
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>招募人数</B></td>
					<td>
						<input type="text" name="active_count" id="active_count" maxlength="11" style="height: 20px; width: 300px;" placeholder="请输入招募人数" title="招募人数" onkeyup="value=value.replace(/[^0-9]/g,'')" onblur="trim(this);" />					
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
					<span style="color:#C00;padding-right: 4px;">*</span><B>省</B>
					<input type="hidden" id="provinces" value="${pd.province_id}"/>
					</td>
					<td>
						<select class="chzn-select" name="active_province" id="active_province" data-placeholder="请选择省"  style="height: 20px; width: 315px;">
							<option value=""></option>
							<c:forEach items="${provincelist}" var="pr">
								<option value="${pr.id }" <c:if test="${pr.id == pd.province_id}">selected</c:if>>${pr.name }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
					<span style="color:#C00;padding-right: 4px;">*</span><B>市</B></td>
					<td>
						<select class="chzn-select" name="active_city" id="active_city" data-placeholder="请选择市"  style="height: 20px; width: 315px;">
							<option value=""></option>
							<c:forEach items="${citylist}" var="city">
								<option value="${city.id }" <c:if test="${city.id == pd.city_id}">selected</c:if>>${city.name }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
					<span style="color:#C00;padding-right: 4px;">*</span><B>区</B></td>
					<td>
						<select class="chzn-select" name="active_county" id="active_county" data-placeholder="请选择区"  style="height: 20px; width: 315px;">
							<option value=""></option>
							<c:forEach items="${countylist}" var="ar">
								<option value="${ar.id }" <c:if test="${ar.id == pd.county_id}">selected</c:if>>${ar.name }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>活动地址</B></td>
					<td>
					    <input type="text" name="active_address" id="active_address" maxlength="200" style="height: 20px; width: 300px;" placeholder="请选择活动地点" title="活动地点" onblur="trim(this);" />
					    <div id="meeting_place_map" style="height:300px;width:100%;display:none;"></div>
					   <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
					    <input type="hidden" name="active_lng" id="active_lng"/>
					    <input type="hidden" name="active_lat" id="active_lat"/>
					</td>
				</tr>
				
				
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>标题图</B></td>
					<td>
						<div class="upload_img">
							<input id="active_img" name="active_img" type="hidden" />
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
							高度：<input type="text" id="height" name="height" style="width:50px" value="250"/>
						</div>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<B>活动详情</B></td>
					<td>
						<textarea name="active_desc" id="active_desc" maxlength="200" rows="20px" cols="" style="width: 1200px;"></textarea>
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

    var map = new BMap.Map("meeting_place_map");
    map.centerAndZoom("济南",12); 

    var place = new BMap.Autocomplete(    //建立一个自动完成的对象
        {"input" : "active_address"
        ,"location" : map
    });
    onHighLight(place,map,"active");
    
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
			
			$("#active_address").focus(function(){
				$("#meeting_place_map").show();
			});
			$("#active_address").blur(function(){
				$("#meeting_place_map").hide();
			});
			
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			
			//选择市
			$("#active_province").change(function(){
				var active_province = $("#active_province").val();
				$.ajax({
					type: "POST",
					url: "<%=basePath%>active/selectCity.do",
					data : {
						province_id : active_province
					},
					dataType : "json",
					cache : false,
					success : function(data) {
						var html = '<option value=""></option>';
						var html_area = '<option value=""></option>';
						$("#active_city").empty();
						$("#active_county").empty();
						$.each(data.cityList, function(i, obj) {
							html += "<option value="+obj.id+">"+ obj.name + "</option>";
						});
						$("#active_city").append(html);
						$("#active_city").trigger("liszt:updated");
						$("#active_county").append(html_area);
						$("#active_county").trigger("liszt:updated");
					}
				});
			});

			//选择区县
			$("#active_city").change(function(){
				var active_city = $("#active_city").val();
				$.ajax({
					type:"POST",
					url:"<%=basePath%>active/selectArea.do",
					data:
						{
						city_id:active_city
						},
					dataType:"json",
					cache:false,
					success:function(data){
						var html='<option value=""></option>';
						$("#active_county").empty();
						$.each(data.areaList,function(i,obj){
							html += "<option value="+obj.id+">"+obj.name+"</option>";
						});
						$("#active_county").append(html);
						$("#active_county").trigger("liszt:updated");
					}
				});
			});
			
			//计算爱心小时数
			$("#active_start_time").blur(function(){
				loveHours();
			});
			$("#active_end_time").blur(function(){
				loveHours();
			});
			
			$("#weixin_image").fileupload({
				 dataType :'iframe text',
				 autoUpload: true,
				 maxNumberOfFiles : 1,
		         url: '<%=basePath%>active/Upload.do',
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
		            document.getElementById("active_img").value=data.result;
		            $("#cutImage").val(data.result);
		   	 }
		    });
			
			
			
		});
		
		//返回
	    function returnback(){
	    	window.location.href="<%=basePath%>active/list.do";
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
			img.src = "${img_host}" + cutImage+"?t="+new Date().getTime();
			var natureWitdh;
			var natureHeight;
		    // 完全加载完毕的事件
			img.onload = function(){
			    natureWitdh = img.width + 50;
			    natureHeight = img.height + 50;
			    if(cutImage != ""&&natureWitdh!=null&&natureWitdh!=""&&natureHeight!=null&&natureHeight!=""){
					if(width != "" || height != ""){
						var diag = new top.Dialog();
						diag.Drag=true;
						diag.Width = natureWitdh;
						diag.Height = natureHeight;
						diag.Title = "裁切图片";
						diag.ShowButtonRow = false;
						diag.URL = dialogPath+"active/toCutImage.do?cutImage="+cutImage+"&width="+width+"&height="+height;
						
						diag.OKEvent = function(){//确定事件
							var x = diag.innerFrame.contentWindow.x;
							var y = diag.innerFrame.contentWindow.y;
							var w = diag.innerFrame.contentWindow.w;
							var h = diag.innerFrame.contentWindow.h;
							
							if(x.value != "" && y.value != "" && w.value != "" && h.value != ""){
								$.ajax({
									type: "POST",
									url: "<%=basePath%>active/cutImage.do",
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
										$("#active_img").val(result);
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
	    	if($("#active_name").val()==""){
				$("#active_name").tips({
	    			side : 3,
	    			msg : '请输入活动名称',
	    			bg : '#FF5080',
	    			time : 2
	    		});
	    		$("#active_name").focus();
	    		return false;
			}
	    	if($("#active_type").val()==""){
				$("#active_type").tips({
	    			side : 3,
	    			msg : '请选择活动类型',
	    			bg : '#FF5080',
	    			time : 2
	    		});
	    		$("#active_type").focus();
	    		return false;
			}
	    	if($("#active_start_time").val()==""){
				$("#active_start_time").tips({
	    			side : 3,
	    			msg : '请选择开始时间',
	    			bg : '#FF5080',
	    			time : 2
	    		});
	    		$("#active_start_time").focus();
	    		return false;
			}
	    	if($("#active_end_time").val()==""){
				$("#active_end_time").tips({
	    			side : 3,
	    			msg : '请选择结束时间',
	    			bg : '#FF5080',
	    			time : 2
	    		});
	    		$("#active_end_time").focus();
	    		return false;
			}
	    	if($("#active_linkman").val()==""){
				$("#active_linkman").tips({
	    			side : 3,
	    			msg : '请输入联系人',
	    			bg : '#FF5080',
	    			time : 2
	    		});
	    		$("#active_linkman").focus();
	    		return false;
			}
	    	var phone = $("#active_linkman_phone").val();
			if (phone == "") {
				$("#active_linkman_phone").tips({
					side : 3,
					msg : '请输入联系方式',
					bg : '#FF5080',
					time : 2
				});
				$("#active_linkman_phone").focus();
				return false;
			}else{
				//手机号或者固话
				var reg =  /^(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$/;
				if(!reg.test(phone)){
					$("#active_linkman_phone").tips({
						side : 3,
						msg : '电话格式错误',
						bg : '#FF5080',
						time : 2
					});
					$("#active_linkman_phone").focus();
					return false;
				}
			}
	    	if($("#active_count").val()==""){
				$("#active_count").tips({
	    			side : 3,
	    			msg : '请输入招募人数',
	    			bg : '#FF5080',
	    			time : 2
	    		});
	    		$("#active_count").focus();
	    		return false;
			}
	    	if($("#active_province").val()==""){
				$("#active_province").tips({
	    			side : 3,
	    			msg : '请选择省',
	    			bg : '#FF5080',
	    			time : 2
	    		});
	    		$("#active_province").focus();
	    		return false;
			}
	    	if($("#active_city").val()==""){
				$("#active_city").tips({
	    			side : 3,
	    			msg : '请选择市',
	    			bg : '#FF5080',
	    			time : 2
	    		});
	    		$("#active_city").focus();
	    		return false;
			}
	    	if($("#active_county").val()==""){
				$("#active_county").tips({
	    			side : 3,
	    			msg : '请选择县区',
	    			bg : '#FF5080',
	    			time : 2
	    		});
	    		$("#active_county").focus();
	    		return false;
			}
	    	if($("#active_address").val()==null || $("#active_address").val()=="" || $("#active_lng").val()==null || $("#active_lng").val()=="" ||$("#active_lat").val()==null || $("#active_lat").val()==""){
	    		$("#active_address").tips({
	    			side : 3,
	    			msg : '请输入活动地址',
	    			bg : '#FF5080',
	    			time : 2
	    		});
	    		$("#active_address").focus();
	    		return false;
	    	}
	    	
	    	$("#Form").submit();
	    }
	    
	    //计算爱心小时数
	    function loveHours(){
	    	var begin_time = $("#active_start_time").val();
	    	var end_time = $("#active_end_time").val();
	    	
	    	if(begin_time!='' && end_time!=''){
	    		//计算开始时间和结束时间毫秒数
		    	var begin_time_ms = Date.parse(new Date(begin_time.replace(/-/g, "/")));
		    	var end_time_ms = Date.parse(new Date(end_time.replace(/-/g, "/")));
		    	//计算时间差毫秒数
		    	var level = end_time_ms - begin_time_ms;
		    	//计算小时数
		    	var hours=Math.floor(level/(3600*1000));
		    	
		    	//小时数/24，取整
		    	var x = parseInt(hours/24);
		    	//取余数
		    	var y = hours-24*x;
		    	//余数>8小时，按8小时算，不足则按余数算
		    	var t = y>8?8:y;
		    	//最后算出的爱心小时数
		    	var active_love_hour = 8*x+t;
		    	$("#active_love_hour").val(active_love_hour);
	    	}else{
	    		$("#active_love_hour").val("0");
	    	}
	    }
	    
	</script>
</body>
</html>