<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理系统</title>
<base href="<%=basePath%>"></base>
<!-- jsp文件头和头部 -->
<%@ include file="../../system/admin/top.jsp"%>
<link href="static/css/indexcss/indexMenuStyle.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript">
	//弹出调用的方法
	function showDivFun(){
	    document.getElementById('popDiv1').style.display='block';
	    //findMenu(0,"oneMenu");
	}
	//关闭事件
	function closeDivFun(){
	    $("#twoMenu").val("<option value=\"-1\">请选择</option>");
	    document.getElementById('popDiv1').style.display='none';
	}
	//保存菜单
	function saveMenu(){
		//路径
		var url = "<%=basePath%>menu/saveMenuShortcut.do";
		//获取参数
		var menuParentId = $("#oneMenu option:selected").val();
		var menuId = $("#twoMenu option:selected").val();
		var menuName = $("#twoMenu option:selected").attr("label");
		var menuUrl = $("#twoMenu option:selected").attr("url");
		var menuIco = $("input[name=formFieldadio]:checked").val();
		var menuColor = $("li[class=ysxz]").find("div").attr("class");
		//验证表单
		if (menuParentId == ""||menuParentId == "-1"||typeof(menuParentId)== "undefined") {
			$("#oneMenu").tips({
				side : 2,
				msg : '请选择一级菜单',
				bg : '#AE81FF',
				time : 3
			});
			$("#oneMenu").focus();
			return false;
		}
		if (menuId == ""||menuId == "-1"||typeof(menuParentId)== "undefined"||menuName == ""||menuUrl == "") {
			$("#twoMenu").tips({
				side : 2,
				msg : '请选择二级菜单',
				bg : '#AE81FF',
				time : 3
			});
			$("#twoMenu").focus();
			return false;
		}
		if (menuIco == ""||typeof(menuIco)== "undefined") {
			$("#iconColor").tips({
				side : 2,
				msg : '请选择图标',
				bg : '#AE81FF',
				time : 3
			});
			$("#iconColor").focus();
			return false;
		}
		if (menuColor == ""||typeof(menuColor)== "undefined") {
			$("#menuColor").tips({
				side : 2,
				msg : '请选择颜色',
				bg : '#AE81FF',
				time : 3
			});
			$("#menuColor").focus();
			return false;
		}
		//提交表单
		$.ajax({
    		type:"POST",
    		url:url,
    		data : {
    			MENU_ID : menuId,
    			MENU_NAME : menuName,
    			MENU_URL : menuUrl,
    			MENU_PARENT_ID : menuParentId,
    			MENU_ICO : menuIco,
    			MENU_COLOR : menuColor
    		},
    		success : function(responseText) {
    			if("success"==responseText.status){
    				closeDivFun();
    				bootbox.dialog("新增成功!", 
						[
							{  
		                        label: "确认",  
		                        className: "btn-primary",  
		                        callback: function () {
		                        	flashPage();
		                        }
							} 
						 ]
					);
    			}else if("dataerror"==responseText.status){
    				bootbox.dialog("重复添加!", 
						[
							{  
		                        label: "确认",  
		                        className: "btn-primary",  
		                        callback: function () {
		                        }
							} 
						 ]
					);
    			}else{
    				bootbox.dialog("新增失败!", 
						[
							{  
		                        label: "确认",  
		                        className: "btn-primary",  
		                        callback: function () {
		                        }
							} 
						 ]
					);
    			}
    		}
    	});
		
	}
	// 刷新当前页面
	function flashPage(){
		setTimeout("",2000);
		window.location.href=window.location.href;
	} 
	
</script>
</head>
<body bgcolor="#f7f7f7">
	<!-- 删除时间标记 -->
	<input id="delFlag" type="hidden" value="0" />
	<div id="container-fluid">
		<div class="back-w">
			<!--首页Main区菜单展现-->
			<div class="back-ground back-list" style="width: 80%;">
				<c:forEach var="menu" items="${pd.shortcutMenuList}">
					<div class="list" style="cursor: pointer;">
						<div class="list-info ${menu.menu_color}"
							onmouseover="showDelButton('#closse${menu.menu_id}')"
							onmouseout="hideDelButton('#closse${menu.menu_id}')"
							onclick="openLink('${menu.menu_url}')">
								<img 
									style="display: none;
									position: relative; 
									text-align: right; 
									right: 0px; 
									top: 20px;"
								 	id="closse${menu.menu_id}" 
								 	class="close1" 
								 	onclick="delMenu('${menu.menu_id}')" 
								 	width="20px" 
								 	src="static/img/indeximg/select-img/off.png" 
								 	alt="关闭" />
							<!-- </div> -->
							<img src="static/img/indeximg/${menu.menu_ico}" />
							<p>${menu.menu_name}</p>
						</div>
					</div>
				</c:forEach>
				<c:if test="${fn:length(pd.shortcutMenuList)<1}">
					<div style="width: 100%">
						<div style="margin: 0 auto; width: 30%;">
							<span style="color: red;"> 暂无快捷菜单，如有需要请点击下方增加按钮！ </span>
						</div>
					</div>
				</c:if>
				<div class="list" style="cursor:pointer;width:80px;">
					<div onclick="javascript:showDivFun()">
						<div class="list-info list-add"></div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<!--栏目2-->
			<div class="back-status" style="width: 100%;">
				<!-- 企业注册审核状态 -->
				<div id="companyStatus" class="status">
					<!-- 内容展现 -->
				</div>
				<!-- 培训机构审核状态 -->
				<div id="cultivateStatus" class="status">
					<!-- 内容展现 -->
				</div>
<!-- 				<div id="weatherForecast" class="weat"> -->
<!-- 					<input type="hidden" id="cityAddress" value="济南" /> -->
<!-- 					<div class="weat-top" style="height: 110px;"> -->
<!-- 						<img id="weather_data_dayPictureUrl" -->
<!-- 							src="static/img/indeximg/00.png" /> -->
<!-- 						<p id="weather_data_weather">晴</p> -->
<!-- 						<h2 id="weather_data_temperature">24℃</h2> -->
<!-- 					</div> -->
<!-- 					<div class="weat-bottom"> -->
<!-- 						<p> -->
<!-- 							空气质量<br /> <span id="weather_data_pm25">良</span> -->
<!-- 						</p> -->
<!-- 						<div class="sx"></div> -->
<!-- 						<p> -->
<!-- 							湿度<br /> <span id="weather_data_zs">56%</span> -->
<!-- 						</p> -->
<!-- 						<div class="sx"></div> -->
<!-- 						<p> -->
<!-- 							风力<br /> <span id="weather_data_wind">10级</span> -->
<!-- 						</p> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<div class="clearfix"></div>
			</div>
			<!--结束-->
		</div>
	</div>

	<!-- 弹窗增加菜单 -->
	<div id="popDiv1" class="mydiv1" style="display: none;">
		<input id="inputColor" type="hidden" value="#ff8077" />
		<div class="select-nav">
			<div class="close1" onclick="closeDivFun()">
				<span>×</span>
			</div>
			<div class="select-xz">选择快捷菜单</div>
			<div class="select-fl">
				<p class="fl-left">选择分类：</p>
				<div class="fl">
					<select id="oneMenu" name="navfl" class="navfl">
						<option value="-1" url="#" label="请选择">请选择</option>
						<c:forEach items="${menuShortcutList}" var="menuItem">
							<c:if test="${menuItem.hasMenu}">
								<option value="${menuItem.MENU_ID}" url="${menuItem.MENU_URL}" label="${menuItem.MENU_NAME}">${menuItem.MENU_NAME}</option>
							</c:if>
						</c:forEach>
					</select> <span class="field-validation-valid" data-valmsg-for="oneMenu"
						data-valmsg-replace="true"></span> <select id="twoMenu"
						name="navfl" class="navfl">
						<option value="-1" url="#" label="请选择">请选择</option>
					</select> <span class="field-validation-valid" data-valmsg-for="twoMenu"
						data-valmsg-replace="true"></span>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="select-fl">
				<p class="fl-left">选择图标：</p>
				<div class="fl" style="width: 400px;">
					<table id="iconColor" class="table-fl"
						style="margin-bottom: 0px;background: #FFFFFF;">
						<tbody>
							<tr>
								<td ><input name="formFieldadio" type="radio"
									value="back-tit-icon1.png" />
									<div class="lbl">
										<img src="<%=basePath%>static/img/indeximg/back-tit-icon1.png" />
									</div></td>

								<td><input name="formFieldadio" type="radio"
									value="back-tit-icon2.png" />
									<div class="lbl">
										<img src="<%=basePath%>static/img/indeximg/back-tit-icon2.png" />
									</div></td>

								<td><input name="formFieldadio" type="radio"
									value="back-tit-icon3.png" />
									<div class="lbl">
										<img src="<%=basePath%>static/img/indeximg/back-tit-icon3.png" />
									</div></td>

								<td><input name="formFieldadio" type="radio"
									value="back-tit-icon4.png" />
									<div class="lbl">
										<img src="<%=basePath%>static/img/indeximg/back-tit-icon4.png" />
									</div></td>

								<td><input name="formFieldadio" type="radio"
									value="back-tit-icon5.png" />
									<div class="lbl">
										<img src="<%=basePath%>static/img/indeximg/back-tit-icon5.png" />
									</div></td>

								<td><input name="formFieldadio" type="radio"
									value="back-tit-icon6.png" />
									<div class="lbl">
										<img src="<%=basePath%>static/img/indeximg/back-tit-icon6.png" />
									</div></td>
							</tr>
							<tr>
								<td><input name="formFieldadio" type="radio"
									value="back-tit-icon7.png" />
									<div class="lbl">
										<img src="<%=basePath%>static/img/indeximg/back-tit-icon7.png" />
									</div></td>

								<td><input name="formFieldadio" type="radio"
									value="back-tit-icon8.png" />
									<div class="lbl">
										<img src="<%=basePath%>static/img/indeximg/back-tit-icon8.png" />
									</div></td>

								<td><input name="formFieldadio" type="radio"
									value="back-tit-icon9.png" />
									<div class="lbl">
										<img src="<%=basePath%>static/img/indeximg/back-tit-icon9.png" />
									</div></td>

								<td><input name="formFieldadio" type="radio"
									value="back-tit-icon10.png" />
									<div class="lbl">
										<img
											src="<%=basePath%>static/img/indeximg/back-tit-icon10.png" />
									</div></td>

								<td><input name="formFieldadio" type="radio"
									value="back-tit-icon11.png" />
									<div class="lbl">
										<img
											src="<%=basePath%>static/img/indeximg/back-tit-icon11.png" />
									</div></td>

								<td><input name="formFieldadio" type="radio"
									value="back-tit-icon12.png" />
									<div class="lbl">
										<img
											src="<%=basePath%>static/img/indeximg/back-tit-icon12.png" />
									</div></td>
							</tr>
						</tbody>
					</table>
					<span class="field-validation-valid" data-valmsg-for="iconColor"
						data-valmsg-replace="true"></span>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="select-fl">
				<p class="fl-left">选择颜色：</p>
				<div class="fl">
					<ul id="menuColor" class="color">
						<li class="ysxz"><div class="xz-color1"></div></li>
						<li><div class="xz-color2"></div></li>
						<li><div class="xz-color3"></div></li>
						<li><div class="xz-color4"></div></li>
						<li><div class="xz-color5"></div></li>
						<li><div class="xz-color6"></div></li>
						<li><div class="xz-color7"></div></li>
						<li><div class="xz-color8"></div></li>
					</ul>
					<span class="field-validation-valid" data-valmsg-for="menuColor"
						data-valmsg-replace="true"></span>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="save">
				<button class="fl" onclick="saveMenu()">保存</button>
				<button class="qx fl" onclick="closeDivFun()">取消</button>
			</div>
		</div>
	</div>

	<!-- 引入 -->
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>
	<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="static/js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript" src="static/js/bootbox.min.js"></script>
	<!-- 确认窗口 -->

	<script type="text/javascript">
	    $(document).ready(function() {
	    	//日期框
			$('.date-picker').datepicker();
// 			educationCnt();
// 			languageCnt();
			setInterval("weatherForecast",5000);
	    });
	    
	    $(top.hangge());

	    //获取菜单
	    function findMenu(menuId,indexId){
	    	var url = "<%=basePath%>menu/findMenu.do";
	    	$.ajax({
	    		type:"POST",
	    		url:url,
	    		data:{MENU_ID:menuId},
	    		success:function(returnData){
	    			$("#"+indexId).html("");
	    			var menuList = returnData.menuList;
	    			var html = "<option value=\"-1\">请选择</option>";
	    			for(var menu in menuList){
	    				var menuValue = menuList[menu];
	    				if(typeof(menuValue)=="undefined"||
	    						typeof(menuValue.menu_ID)=="undefined"||
	    						typeof(menuValue.menu_NAME)=="undefined"){
	    					continue;
	    				}else{
		    				html+="<option value='"+menuValue.menu_ID+"' url='"+menuValue.menu_URL+"' label='"+menuValue.menu_NAME+"'>"+menuValue.menu_NAME+"</option>";
	    				}
	    			}
	    			$("#"+indexId).html(html);
	    		}
	    	});
	    }
	    
	    $(function(){
	    	//一级菜单监听
	    	$("#oneMenu").change(function(){
	    		var menuId = $(this+"option:selected").val();
	    		findMenu(menuId,"twoMenu");
	    	});
	    	
	    	//菜单颜色监听
	    	$("#menuColor").find("li").click(function(){
	    		$("#inputColor").val($(this).find("div").css("background-color"));
	    		var img = $("input[name=formFieldadio]:checked").next().find("img");
	    		$(img).css({
	    			"margin-bottom": "0px"
	    			//,"background": $(this).find("div").css("background-color")
	    		});
	    		$("#menuColor").find("li").attr("class","");
	    		$(this).attr("class","ysxz");
	    	});
	    	
	    	//选择图标监听
	    	$("input[name=formFieldadio]").click(function(){
	    		$("input[name=formFieldadio]").next().find("img").removeAttr("style");
	    		$("input[name=formFieldadio]:checked").next().find("img").css({
	    			"margin-bottom": "0px"
	    			//,"background":$("#inputColor").val()
	    		});
	    	});
	    	
	    	//选择图标范围监听
	    	$(".lbl").click(function(){
	    		$(this).prev().attr("checked",'checked');
	    		$("input[name=formFieldadio]").next().find("img").removeAttr("style");
	    		$("input[name=formFieldadio]:checked").next().find("img").css({
	    			"margin-bottom": "0px"
	    			//,"background":$("#inputColor").val()
	    		});
	    	});
	    	
	    	//通过IP获取地理位置
// 			var url = 'http://chaxun.1616.net/s.php?type=ip&output=json&callback=?&_='+Math.random(); 
// 			$.getJSON(url, function(data){
// 				var positionUrl = "http://api.map.baidu.com/location/ip?ak=GEEuqIXmMLbEW5oZBKjzDS7vkxLbLGWR&ip="+data.Ip;
// 				$.ajax({    
// 					type: "GET",    
// 					dataType: "jsonp",    
// 					url: positionUrl,   
// 					success: function (json) {
// 						if(json.status==0){
// 							var address = json.content.address;
// 							var a = (address.split("省"))[1];
// 							var b = (a.split("市"))[0];
// 							//获取天气预报
// 							weatherForecast(b);
// 						}else{
// 							bootbox.dialog("位置信息不可用。默认济南气象", 
// 								[
// 									{  
// 				                        label: "确认",  
// 				                        className: "btn-primary",  
// 				                        callback: function () {
// 											$("#cityAddress").val("济南");
// 				                        }
// 									} 
// 								 ]
// 							);
// 							//获取天气预报
// 							weatherForecast("济南");
// 						}
// 					}
// 				});
// 			});
	    	
	    });
	    
	    // 企业注册审核状态图
	    function educationCnt() {
	    	var START_TIME = $("#start_timestamp").val();
	    	var END_TIME = $("#end_timestamp").val();
	    	$.ajax({
	    		type:"POST",
	    		url:"<%=basePath%>single_pie2D.do",
	    		data : {
	    			START_TIME : START_TIME,
	    			END_TIME : END_TIME
	    		},
	    		success : function(responseText) {
	    			$("#companyStatus").html("");
	    			$("#companyStatus").html(responseText);
	    		}
	    	});
	    }
	    
	    // 培训机构审核状态图
	    function languageCnt() {
	    	var START_TIME = $("#start_timestamp").val();
	    	var END_TIME = $("#end_timestamp").val();
	    	$.ajax({
	    		type:"POST",
	    		url:"<%=basePath%>single_column2D.do",
				data : {
					START_TIME : START_TIME,
					END_TIME : END_TIME
				},
				success : function(responseText) {
					$("#cultivateStatus").html("");
	    			$("#cultivateStatus").html(responseText);
				}
			});
		}
	    
	    // 获取天气预报
	    function weatherForecast(b){
			var url = "http://api.map.baidu.com/telematics/v3/weather";
	    	var output = "json";
			var ak = "GEEuqIXmMLbEW5oZBKjzDS7vkxLbLGWR";
	    	$.ajax({
	    		url:url,
	    		data:{
	    			location:b,
	    			output:output,
	    			ak:ak
	    		},
	    		dataType: 'jsonp',  
	            crossDomain: true, 
	    		success:function(returnData){
	    			// status: "success"
	    			if("success" == returnData.status){
		    			var results = (returnData.results)[0];
		    			var index = results.index;
		    			var weather_data = (results.weather_data)[0];
		    			// 空气质量
		    			var pm25 = results.pm25;
		    			$("#weather_data_pm25").html("PM2.5指数: "+pm25 +"<br/>"+judgeScale(pm25));
		    			//旅游
		    			var zs = index[2].zs;
		    			$("#weather_data_zs").html(zs);
		    			//时间
		    			var date = weather_data.date;
		    			//白天图片
		    			var dayPictureUrl = weather_data.dayPictureUrl;
		    			$("#weather_data_dayPictureUrl").attr("src",dayPictureUrl);
		    			//夜间图片
		    			var nightPictureUrl = weather_data.nightPictureUrl;
		    			//天气情况
		    			var weather = weather_data.weather;
		    			$("#weather_data_weather").html(weather);
		    			// 风级别
		    			var wind = weather_data.wind;
		    			$("#weather_data_wind").html(wind);
		    			// 温度
		    			temperature = weather_data.temperature;
		    			$("#weather_data_temperature").html("地区："+b+"<br/>"+date+"<br/>"+temperature);
	    			}else{
	    				console.log("获取天气预报信息出错，请检查参数是否正确！");
	    			}
	    		}
	    	});
	    }
	    
	  	// 空气质量等级划分
		function judgeScale(no){
			var number = Number(no);
			//0-50:1级-优 rgba(44, 198, 103, 1)
			if(0<number&&number<=50){
				return "<div style='background-color:rgba(44, 198, 103, 1)'><span style='color:#FFF'>优</span></div>";
			//51-100:2级-良 rgba(223, 184, 2, 1)
			}else if(50<number&&number<=100){
				return "<div style='background-color:rgba(223, 184, 2, 1)'><span style='color:#FFF'>良</span></div>";
			//101-150:3级-轻度
			}else if(101<number&&number<=150){
				return "<div style='background-color:rgba(239, 127, 8, 1)'><span style='color:#FFF'>轻度</span></div>";
			//151-200:4级-中度
			}else if(151<number&&number<=200){
				return "<div style='background-color:rgba(222, 82, 58, 1)'><span style='color:#FFF''>中度</span></div>";
			//201-300:5级-重度
			}else if(201<number&&number<=300){
				return "<div style='background-color:rgba(175, 7, 182, 1)'><span style='color:#FFF''>重度</span></div>";
			//300:6级-严重
			}else if(300<number){
				return "<div style='background-color:rgba(98, 3, 102, 1)'><span style='color:#FFF''>严重</span></div>";
			}
		}
	  	
	    //显示删除按钮
	    function showDelButton(closseMenuId){
	    	setTimeout(function(){
		    	$(closseMenuId).removeAttr("style");
		    	$(closseMenuId).css({
			    	"display"		: 	"block",
			        "position"		: 	"relative",
			        "text-align"	: 	"right",
			        "right"			: 	"-53px",
			        "z-index"		: 	"99999",
			        "background"	: 	"#fff",
			        "width"			:	"20px",
			        "height"		:	"20px",
			        "border-radius"	: 	"45%",
			        "top"			:	"-13px",
			        "padding"		: 	"0px"
		    	});
		    	$(closseMenuId).next().css({
		    		"margin-top": "-20px"
		    	});
	    	},1);
	    	
	    }
	    
	    //隐藏删除按钮
	    function hideDelButton(closseMenuId){
	    	setTimeout(function(){
		    	$(closseMenuId).removeAttr("style");
		    	$(closseMenuId).css({
			    	"display"		: 	"none",
			    	"position"		: 	"relative",
			    	"text-align"	: 	"right",
			        "right"			: 	"-53px",
			        "z-index"		: 	"99999",
			        "background"	: 	"#fff",
			        "width"			:	"20px",
			        "height"		:	"20px",
			        "border-radius"	: 	"45%",
			        "top"			:	"-20px",
			        "padding"		: 	"0px"
		    	});
		    	$(closseMenuId).next().css({
		    		"margin-top": "15px"
		    	});
	    	},1);
	    }
	    	
	  	//删除菜单
	  	function delMenu(menuId){
	  		$("#delFlag").val(1);
	  		bootbox.confirm("确定要删除吗?", function(result) {
	  			if(result) {
			  		$.ajax({
		  	    		url: "<%=basePath%>menu/delMenuShortcut.do",
		  	    		type:"POST",
		  	    		data : {MENU_ID : menuId},
		  	    		success : function(responseText) {
					  		if("success"==responseText.status){
								bootbox.dialog("删除成功!", 
									[
										{  
					                        label: "确认",  
					                        className: "btn-primary",  
					                        callback: function () {
					                        	$("#delFlag").val(0);
					                        	flashPage();
					                        }
										} 
									 ]
								);
							}else{
								bootbox.dialog("删除失败!", 
									[
										{  
					                        label: "确认",  
					                        className: "btn-primary",  
					                        callback: function () {
					                        	$("#delFlag").val(0);
					                        }
										} 
									 ]
								);
							}
		  	    		}
			  		});
	  			}else{
                   	$("#delFlag").val(0);
	  			}
	  		});
	  	}
	    
	  	// 打开菜单
	  	function openLink(url){
	  		if($("#delFlag").val()==1){
	  			return;
	  		}else{
	  			window.location.href=url;
	  		}
	  	}
	</script>
</body>
</html>