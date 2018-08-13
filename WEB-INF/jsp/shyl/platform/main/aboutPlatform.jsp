<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv=”X-UA-Compatible” content=”IE=EmulateIE7″ />
<meta charset="utf-8">
<script>
	// 关闭当前画面
	function Close() {
		window.opener = null;
		window.open('', '_self');
		window.close();
	}
</script>
<base href="<%=basePath%>">
<title>平台介绍_济南市服务外包公共服务平台</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<script type="text/javascript" src="shyl/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<link href="shyl/css/platform/about.css" rel="stylesheet" type="text/css">
<link href="shyl/css/platform/bmap.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<script type="text/javascript">
	$(document).ready(function() {
		id = $("#TYPE").val();
		$("#noticeLink" + id).addClass("hover");
		$("#labelNotice").html($("#noticeLink" + id).html());
		var yearId = $("#pdYear").val();
		$("#" + yearId).addClass("on");
		$(document).attr("title",$("#noticeLink" + id).html()+"_济南市服务外包公共服务平台");
	});
	//显示选择的新闻内容
	function showPlatform(type) {
		var url = document.forms[0].getAttribute("action");
		if (type == 0 || type == 2 || type == 4) {
			url += '/aboutPlatformInfo.act';
		} else if (type == 1) {
			url += '/aboutAgency.act';

		} else if (type == 3) {
			url += '/aboutEvent.act';
		} else if (type == 5) {
			url += '/questionFeedback.act';
		}
		document.forms[0].action = url + "?TYPE=" + type;
		document.forms[0].submit();
	}
</script>
<style type="text/css">
.inputtxt{height:44px;line-height:44px;color:#9a9a9a;border-radius:4px;width:56%;padding-left:1%;font-size:0.85em;float:left;}
.leftlable{width:22%;display:inline-block;float:left;text-align:right;padding-right:3%;line-height:50px;color: #404653;font-size:0.85em;position:relative;}
.leftlable i{color: #e54161;position: absolute;right: 11%;top:0;line-height: 56px;}
.btn-primary:hover, .btn-primary:focus, .btn-primary:active, .btn-primary.active, .open > .dropdown-toggle.btn-primary{background-color:#3c67ce; }
textarea {
	width:56%;padding-left:5px;border:1px solid #9a9a9a;border-radius:5px;font-size:0.85em;resize:none!important;line-height: normal;color:#9a9a9a;
}
textarea:HOVER {
	border:1px solid #566ef9
}
.btn-primary{color: #fff;background-color:#4f70c0 ;border-color:#4f70c0}
.img_max{
  max-width:752px;
  max-height:650px;
}
</style>
</head>
<body>
	<!--<header开始>-->
	<jsp:include page="../../common/header.jsp"></jsp:include>
	<!--</header结束>-->
	<!--<banner开始>-->
<div class="clear"></div>
<div class="cmain">
<input type="hidden" id="TYPE" name="TYPE" value=${pd.TYPE }>
	<div class="cml_1">
		<div class="cml_2 clearfix">
			<div class="cml_title">
			<c:if test="${pd.TYPE==0}">
				<h1>平台介绍</h1>
			</c:if>
			<c:if test="${pd.TYPE==1}">
				<h1>组织结构</h1>
			</c:if>
			<c:if test="${pd.TYPE==2}">
				<h1>服务理念</h1>
			</c:if>
			<c:if test="${pd.TYPE==3}">
				<h1>大事记</h1>
			</c:if>
			<c:if test="${pd.TYPE==4}">
				<h1>联系我们</h1>
			</c:if>
			<c:if test="${pd.TYPE==5}">
				<h1>问题反馈</h1>
			</c:if>
			</div>
			<div class="cml_content">
				<form action="<%=basePath%>platform/about" method="post" name="Form" id="Form">
				<c:if test="${pd.TYPE==0}">
					<div class="cml_content_main">${pd.DETAIL_INFO}</div>
				</c:if>
				<c:if test="${pd.TYPE==1}">
					<div class="cml_content_main">
						<img class="img_max" onerror="showImgDelay(this,'<%=basePath%>shyl/images/mylogo.jpg');" src="<%=basePath%>images/${pd.ORGANIZATION_STRUCTURE}">
					</div>
				</c:if>
				<c:if test="${pd.TYPE==2}">
					<div class="cml_content_main">${pd.SERVIC_CONCEPT}</div>
				</c:if>
				<c:if test="${pd.TYPE==3}">
						<div class="events_box">
										<div class="year_list">
											<ul>
												<c:choose>
													<c:when test="${not empty dateList}">
														<c:forEach items="${dateList}" var="date" varStatus="vs">
															<li style="float:left !important;margin-right:10px;width:auto;">
															<a href="<%=basePath%>platform/about/aboutYearEvent.act?YEAR=${date.event_time}&TYPE=3" id="${date.event_time}">${date.event_time } </a>
															</li>
														</c:forEach>
													</c:when>
												</c:choose>
											</ul>
										</div>
										<div class="clear"></div>
										<div class="events_list">
											<p class="year">${pd.YEAR}</p>
											<input type="hidden" id="pdYear" value="${pd.YEAR}" />
											<table cellpadding="0" cellspacing="0">
												<tbody>
													<c:choose>
														<c:when test="${not empty eventsList}">
															<c:forEach items="${eventsList}" var="events"
																varStatus="vs">
																<tr>
																	<th><p>${events.event_time}</p></th>
																	<td>${events.event_content}</td>
																</tr>
															</c:forEach>
														</c:when>
													</c:choose>
													<c:choose>
														<c:when test="${not empty yearEventsList}">
															<c:forEach items="${yearEventsList}" var="yearevents"
																varStatus="vs">
																<tr>
																	<th><p>${yearevents.event_time}</p></th>
																	<td>${yearevents.event_content}</td>
																</tr>
															</c:forEach>
														</c:when>
													</c:choose>
												</tbody>
											</table>
										</div>
									</div>
				</c:if>
				<c:if test="${pd.TYPE==4}">
						<!--百度地图容器-->
						<div style="width: 100%; height: 550px; border: #ccc solid 1px;" id="dituContent">
							<fieldset class="demo_content">
								<div style="height: 550px; width: 100%;" id="map"></div>
								<script type="text/javascript">
									var ADDRESS_LNG = '${pd.ADDRESS_LNG}';
									var ADDRESS_LAT = '${pd.ADDRESS_LAT}';
									function map_init() {
										var map = new BMap.Map(
												"map"); // 创建Map实例
										map.centerAndZoom("济南",
												16);
										var point = new BMap.Point(
												ADDRESS_LNG,
												ADDRESS_LAT);
										map
												.enableScrollWheelZoom(true); //启用滚轮放大缩小
										//向地图中添加缩放控件
										var ctrlNav = new window.BMap.NavigationControl(
												{
													anchor : BMAP_ANCHOR_TOP_LEFT,
													type : BMAP_NAVIGATION_CONTROL_LARGE
												});
										map.addControl(ctrlNav);
								     //向地图中添加缩略图控件
									var oveCtrl = new BMap.OverviewMapControl();
										map.addControl(oveCtrl);
										oveCtrl.changeView();
										//向地图中添加比例尺控件
										var ctrlSca = new window.BMap.ScaleControl(
												{
													anchor : BMAP_ANCHOR_BOTTOM_LEFT
												});
										map.addControl(ctrlSca);
										var marker = new window.BMap.Marker(
												point); // 创建标注 
										map.addOverlay(marker); // 将标注添加到地图中 
										marker
												.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画 
										var label = new window.BMap.Label(
												"济南市服务外包协会",
												{
													offset : new BMap.Size(
															10,
															-10)
												});
										marker.setLabel(label);
										var infoWindow = new BMap.InfoWindow(
												"<div><Strong>济南市服务外包协会</Strong><br/>地址：${pd.ADDRESS}<br/>电话：${pd.PLATFORM_TEL}</div>"); // 创建信息窗口对象  
										map.openInfoWindow(
												infoWindow,
												point); //开启信息窗口  
										marker
												.addEventListener(
														"click",
														function() {
															map
																	.openInfoWindow(
																			infoWindow,
																			point); //开启信息窗口 
														});
									}
									//异步调用百度js
									function map_load() {
										var load = document
												.createElement("script");
										load.src = "http://api.map.baidu.com/api?v=1.4&callback=map_init";
										document.body
												.appendChild(load);
									}
									window.onload = map_load;
								</script>
							</fieldset>
						</div>
						<div class="contact_con">
							<h3>济南市服务外包协会</h3>
							<p>
								<c:if test="${pd.PLATFORM_TEL!=''}">电话：${pd.PLATFORM_TEL}<br></c:if> <c:if test="${pd.PLATFORM_FAX!=''}">传真：${pd.PLATFORM_FAX} <br></c:if>
								<c:if test="${pd.QQ_GROUP!=''}">会员qq群：${pd.QQ_GROUP} <br> </c:if><c:if test="${pd.EMAIL!=''}">Email：${pd.EMAIL}<br></c:if>
								<c:if test="${pd.ADDRESS!=''}">地址：${pd.ADDRESS}<br></c:if> <c:if test="${pd.WEBSITE!=''}">网址：${pd.WEBSITE}<br></c:if> <c:if test="${pd.OFFICIAL_BLOG!=''}">官方微博：${pd.OFFICIAL_BLOG}<br></c:if>
								<br>
							</p>
						</div>
				</c:if>
				<c:if test="${pd.TYPE==5}">
					<div class="cml_content_main">
						<ul>
							<li style="margin-top: 0px;margin-bottom: 20px;">
								<h5 align="center" style="color: red;">您的感受和建议对优化我们的产品和服务很重要，感谢您的支持与谅解！</h5>
							</li>
							<li>
								<label class="leftlable"><span style="color: red">*</span>意见标题：</label>
								<input type="text" name="title" id="title" class="inputtxt" maxlength="100"  onBlur="trim(this);" placeholder="请输入意见标题">
							</li>
							<li>
								<label class="leftlable"><span style="color: red">*</span>意见描述：</label>
	                        	<textarea  rows="6"  id="description" name="description" maxlength="500" placeholder="请注意：您的建议在这里无法获得回复。如果需要回复，请留下您的电子邮箱"></textarea>
							</li>
							<li>
								<label class="leftlable">Email：<i style="margin: 0px"></i></label>
								<input type="text" name="email" id="userEmail" class="inputtxt" maxlength="50" placeholder="请输入邮箱">
							</li>
							<li>
								<label class="leftlable">上传附件：</label>
								<div class="form-group">
									<table>
										<tr>
											<td colspan="1" style="text-align: left;font-size: 0.85em; " > 
												<input id="docName" class="inputtxt2" value="" maxlength="500" readonly="readonly"/>
											</td>
											<td colspan="1" id="fileDiv">
												<span id="file_uploadper" class="btn btn-primary fileinput-button" style="width: 100px;height: 19px;padding: 13px;"> 
													<span style="width: 50px;height: 42px;padding: 0;font-size: 1em;margin: 20px 0px;text-align: center;">浏览</span>
													<input type="file" id="file_upload" name="file_upload" multiple>
													<input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="appendix_path" name="appendix_path" maxlength="500" type="text" value=""  />
													<input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="appendix_name" name="appendix_name" maxlength="500" type="text" value=""  />
												</span>														
											</td>
										</tr>
										<tr>
											<td>
												<p  style="font-size:12px" class="style1">支持的文件格式为.doc/.docx/.xls/.xlsx/.ppt/.pptx/.txt/.jpg</p>	
											</td>
										</tr>
									</table>																										                  
				                </div>
							</li>
							<li>
								<p class="text-center" data-toggle="modal" id="favpost"  data-target="">
								<a href="javascript:void(0);" class="save3" style="margin-left: 40%" onclick="sub('favpost')">立即提交</a>
								</p>
								
							</li>
						</ul>
					</div>					
				</c:if>
			</form>
			</div>
		</div>
	</div>
	<div class="cmr_1">
		 <div class="cmr_2" style="height: 60px;">
		 </div>
		<div class="cmr_2">
			<h1>类别</h1>
			<ul class="cate">
				<li><a id="noticeLink0" style="cursor:pointer;" onclick="showPlatform('0')" target="_blank">平台介绍</a></li>
				<li><a id="noticeLink1" style="cursor:pointer;" onclick="showPlatform('1')" target="_blank">组织结构</a></li>
				<li><a id="noticeLink2" style="cursor:pointer;" onclick="showPlatform('2')" target="_blank">服务理念</a></li>
				<li><a id="noticeLink3" style="cursor:pointer;" onclick="showPlatform('3')" target="_blank">大事记</a></li>
				<li><a id="noticeLink4" style="cursor:pointer;" onclick="showPlatform('4')" target="_blank">联系方式</a></li>
				<li><a id="noticeLink5" style="cursor:pointer;" onclick="showPlatform('5')" target="_blank">问题反馈</a></li>
			</ul>
		</div>
	</div>
</div>
<div class="clear"></div>
	<!--<footer开始>-->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!--</footer结束>-->
	<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
	<script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
	<script src="<%=basePath%>shyl/js/layer/layer.js"></script>
	<script type="text/javascript">
	var tips=function(id,msg){
		$("#"+id).tips({
			side : 2,
			msg : msg,
			bg : '#AE81FF',
			time : 2
		});
	}
	//文件上传
	 $("#file_upload").fileupload({
		 dataType :'iframe text',
		 autoUpload: true,
		 maxNumberOfFiles : 1,
		 maxFileSize: 50000000,
         url: '<%=basePath%>feedback/upload.act',
		 sequentialUploads : true,
		 add: function (e, data) {
			 var oldpath = $("#appendix_path").val();
		        data.url = '<%=basePath%>feedback/upload.act?oldpath='+oldpath;
		        data.submit();
		    }
		}).bind('fileuploadchange', function(e, data) {
			 
			if (data.files.length > 1) {
				tips("fileDiv", "只能上传一个文件。");
				return false;
			}
		}).bind('fileuploaddone', function(e, data) {
			var result=data.result;
			if ("no" == data.result) {
				tips("fileDiv", "请上传格式为.doc/.docx/.xls/.xlsx/.ppt/.pptx/.txt/.jpg格式的文档文件。");
			}else if(undefined == result){
				tips("fileDiv", "上传失败，可能是文件过大造成。");
			}else {
				$("#appendix_path").val(data.result);
				$("#appendix_name").val(data.originalFiles[0].name);				
				$("#appendix_path").text(data.result);
				$("#appendix_name").text(data.originalFiles[0].name);
				$("#docName").val(data.originalFiles[0].name);
			}
		});
	 	function isOneSubmit(){
			var title = $("#title").val();
			if (title == "") {
				$("#title").tips({
					side : 2,
					msg : '请输入意见标题',
					bg : '#AE81FF',
					time : 3
				});
				$("#title").focus();
				return false;
			}
			var description = $("#description").val();
			if (description == "") {
				$("#description").tips({
					side : 2,
					msg : '请输入意见描述',
					bg : '#AE81FF',
					time : 3
				});
				$("#description").focus();
				return false;
			}
			// 邮箱验证
			var UserEmail = $("#userEmail").val();
			var UserEmailFilter = /^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT)$/;
			if (UserEmail != "") {
				if (!(UserEmailFilter.test(UserEmail))) {
					$("#userEmail").tips({
						side : 2,
						msg : '请输入正确的邮箱格式',
						bg : '#AE81FF',
						time : 3
					});
					return false;
				}
			} 			
			return true;
	 	}
		function sub(divid){					
			if(isOneSubmit()){
				var url = '<%=basePath%>feedback/saveQuestionFeedback.act';
				var title = $("#title").val();
				var description = $("#description").val();
				var appendix_path = $("#appendix_path").val();
				var appendix_name = $("#appendix_name").val();
				var email = $("#userEmail").val();
				$.ajax({
					type:"POST",
					url: url,
					data : {
						title : title,
						description : description,
						appendix_path : appendix_path,
						appendix_name : appendix_name,
						TYPE : "5",
						email : email
					},
					dataType : 'json',
					cache : false,
					success : function(data) {
						if ("success" == data.result) {
							layer.open({
								 title: "意见反馈",
						         type: 0,
						         shadeClose : true,
						         scrollbar : false,
						         icon:1,
								 skin: 'layui-layer-rim', 
								 content:'您的意见已经成功反馈，我们会尽快处理！',
								 yes: function(index, layero){
									 document.forms[0].reset();
									 layer.close(index);
								 }
						   	});
						}
						
					}
				});
			}			
		}
		
	</script>
</body>
</html>