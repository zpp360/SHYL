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
<title>志愿者活动详情页面</title>
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
	<form action="<%=basePath%>active/updateActive.do" name="Form" id="Form" method="post">
		<input type="hidden" id="active_id" name="active_id" value="${pd.active_id}"/>
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
					    <input type="text" name="active_name" id="active_name" disabled="disabled" value="${pd.active_name}" maxlength="50" style="height: 20px; width: 300px;" placeholder="请输入名称" title="名称" onblur="trim(this);" />
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>活动类型</B></td>
					<td>
						<select id="active_type" class="chzn-select" disabled="disabled" name="active_type"  data-placeholder="请选择类型"  style="height: 20px; width: 315px;">
								<option value=""></option>
								<c:forEach items="${typeList}" var="list">
									<option value="${list.distinguish_id}" <c:if test="${list.distinguish_id==pd.active_type}">selected</c:if>>${list.value}</option>
								</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>报名截止时间</B></td>
					<td>
						<span>
							<input name="sign_end_time" id="sign_end_time" value="${pd.sign_end_time}" class="Wdate" type="text" readonly="readonly" placeholder="请选择截止时间" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowClear:true});"/>
						</span>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>活动时间</B></td>
					<td>
						<span>
							<input name="active_start_time" id="active_start_time" disabled="disabled" value="${pd.active_start_time}" class="Wdate" type="text" readonly="readonly" placeholder="请选择开始时间" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'active_end_time\',{d:-0});}',dateFmt:'yyyy-MM-dd HH:mm',isShowClear:true});"/>
							- <input name="active_end_time" id="active_end_time" disabled="disabled" value="${pd.active_end_time}" class="Wdate" type="text" readonly="readonly" placeholder="请选择结束时间" onclick="WdatePicker({minDate:'#F{$dp.$D(\'active_start_time\',{d:0});}',dateFmt:'yyyy-MM-dd HH:mm',isShowClear:true});"/>
						</span>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>爱心小时数</B></td>
					<td>
						<input type="text" name="active_love_hour" id="active_love_hour" value="${pd.active_love_hour}" disabled="disabled" style="height: 20px; width: 300px;" title="爱心小时数" onblur="trim(this);" />					
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>联系人</B></td>
					<td>
						<input type="text" name="active_linkman" id="active_linkman" disabled="disabled" value="${pd.active_linkman}" maxlength="20" style="height: 20px; width: 300px;" placeholder="请输入联系人" title="联系人" onblur="trim(this);" />					
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>联系方式</B></td>
					<td>
						<input type="text" name="active_linkman_phone" id="active_linkman_phone" disabled="disabled" value="${pd.active_linkman_phone}" maxlength="20" style="height: 20px; width: 300px;" placeholder="请输入联系方式" title="联系方式" onblur="trim(this);" />					
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>招募人数</B></td>
					<td>
						<input type="number" name="active_count" id="active_count" disabled="disabled" value="${pd.active_count}" maxlength="11" style="height: 20px; width: 300px;" placeholder="请输入招募人数" title="招募人数" onblur="trim(this);" />					
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
					<span style="color:#C00;padding-right: 4px;">*</span><B>省</B>
					<input type="hidden" id="provinces" value="${pd.province_id}"/>
					</td>
					<td>
						<select class="chzn-select" disabled="disabled" name="active_province" id="active_province" data-placeholder="请选择省"  style="height: 20px; width: 315px;">
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
						<select class="chzn-select" disabled="disabled" name="active_city" id="active_city" data-placeholder="请选择市"  style="height: 20px; width: 315px;">
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
						<select class="chzn-select" disabled="disabled" name="active_county" id="active_county" data-placeholder="请选择区"  style="height: 20px; width: 315px;">
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
					    <input type="text" name="active_address" id="active_address" disabled="disabled" value="${pd.active_address}" placeholder="${pd.active_address}" maxlength="200" style="height: 20px; width: 300px;" title="活动地点" onblur="trim(this);" />
					    <div id="meeting_place_map" style="height:300px;width:100%;display:none;"></div>
					   <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
					    <input type="hidden" name="active_lng" id="active_lng" value="${pd.active_lng}"/>
					    <input type="hidden" name="active_lat" id="active_lat" value="${pd.active_lat}"/>
					</td>
				</tr>
				
				
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>标题图</B></td>
					<td>
						<div class="upload_img">
							<input id="active_img" name="active_img" type="hidden" value="${pd.active_img}"/>
							<c:if test="${empty pd.active_img}">
								<img id="weixin_show" name="weixin_show" style="width: auto; height: 150px;max-width:200px;" src="<%=basePath%>shyl/images/temp.png">
							</c:if>
							<c:if test="${!empty pd.active_img}">
						        <img id="weixin_show" name="weixin_show" style="width: auto; height: 150px;max-width:200px;" onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="${img_host}${pd.active_img}">
						    </c:if>
						</div>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<B>活动详情</B></td>
					<td>
						<textarea name="active_desc" id="active_desc" disabled="disabled" maxlength="200" rows="20px" cols="" style="width: 1200px;">${pd.active_desc}</textarea>
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
			</table>
		<div align="center" style="margin-top: 10px;">
			<a class="btn  btn-light" onclick="returnback()"><i class=" icon-circle-arrow-left"></i>返回</a>
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
			
		});
		
		//返回
	    function returnback(){
	    	window.location.href="<%=basePath%>active/list.do";
		}
	
		var tips=function(id,msg){
			$("#"+id).tips({
				side : 2,
				msg : msg,
				bg : '#FF5080',
				time : 10
			});
		}
		
	    
	</script>
</body>
</html>