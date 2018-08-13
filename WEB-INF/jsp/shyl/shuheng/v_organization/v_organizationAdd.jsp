<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>志愿者组织添加</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../../system/admin/top.jsp"%>
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
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

<!-- 日期框 -->
<script type="text/javascript">
	//保存
	function save() {
		if ($("#organization_name").val() == "") {
			$("#organization_name").tips({
				side : 3,
				msg : '请输入组织名称',
				bg : '#FF5080',
				time : 2
			});
			$("#organization_name").focus();
			return false;
		}
		
		var flag = false;
		$.ajax({
			type : "POST",
			url : "<%=basePath%>vOrg/nameExit.do?tm=" + new Date().getTime(),
			dataType : "text",
			cache : false,
			async:false, 
			data :{organization_name:$.trim($("#organization_name").val()),organization_id:$("#organization_id").val()},
			success:function(data){
				if(data == "fail"){
					flag = true;
				}
			}
		});
		if(flag){
			$("#organization_name").tips({
				side : 3,
				msg : '组织名称已存在',
				bg : '#FF5080',
				time : 2
			});
			$("#organization_name").focus();
			return false;
		}
		if($("#organization_province").val()==null || $("#organization_province").val()==''){
			$("#organization_province").tips({
				side : 3,
				msg : '请选择省',
				bg : '#FF5080',
				time : 2
			});
			return false;
		}
		
		if ($("#organization_city").val() == "") {
			$("#organization_city").tips({
				side : 3,
				msg : '请选择市',
				bg : '#FF5080',
				time : 2
			});
				return false;
		}
		if ($("#organization_county").val() == "") {
			$("#organization_county").tips({
				side : 3,
				msg : '请选择区',
				bg : '#FF5080',
				time : 2
			});
			return false;
		}
		
		if ($("#belong_unit_id").val() == "") {
			$("#belong_unit_id").tips({
				side : 3,
				msg : '请选择主管单位',
				bg : '#FF5080',
				time : 2
			});
			$("#belong_unit_id").focus();
			return false;
		}
		if ($("#organization_time").val() == "") {
			$("#organization_time").tips({
				side : 3,
				msg : '请输入成立时间',
				bg : '#FF5080',
				time : 2
			});
			$("#organization_time").focus();
			return false;
		}
		
		if ($("#organization_linkman").val() == "") {
			$("#organization_linkman").tips({
				side : 3,
				msg : '请输入联系人',
				bg : '#FF5080',
				time : 2
			});
			$("#organization_linkman").focus();
			return false;
		}
		var phone = $("#organization_phone").val();
		if (phone == "") {
			$("#organization_phone").tips({
				side : 3,
				msg : '请输入联系方式',
				bg : '#FF5080',
				time : 2
			});
			$("#organization_phone").focus();
			return false;
		}else{
			//手机号或者固话
			var reg =  /^(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$/;
			if(!reg.test(phone)){
				$("#organization_phone").tips({
					side : 3,
					msg : '电话格式错误',
					bg : '#FF5080',
					time : 2
				});
				$("#organization_phone").focus();
				return false;
			}
		}
		var idcard = $("#organization_idcard").val();
		if(idcard != null && idcard != ""){
			var reg = /^(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)$/;
			if(!reg.test(idcard)){
				$("#organization_idcard").tips({
					side : 3,
					msg : '身份证号格式错误',
					bg : '#FF5080',
					time : 2
				});
				$("#organization_idcard").focus();
				return false;
			}
		}
		var email = $("#organization_email").val();
		if(email != null && email != ""){
			var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
			if(!reg.test(email)){
				$("#organization_email").tips({
					side : 3,
					msg : 'Email格式错误',
					bg : '#FF5080',
					time : 2
				});
				$("#organization_email").focus();
				return false;
			}
		}
		
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
</script>
</head>
<body>
<br>
	<form action="<%=basePath%>vOrg/save.do" name="Form" id="Form" method="post">
		<input type="hidden" name="organization_id" value="${pd.organization_id }" />
		<div id="zhongxin">
			<table class="table ">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>组织名称</B></td>
					<td><input type="text" name="organization_name" id="organization_name" maxlength="40"
						 style="height: 20px; width: 300px;" placeholder="请输入组织名称"
						title="组织名称" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
					<span style="color:#C00;padding-right: 4px;">*</span><B>省</B>
					<input type="hidden" id="provinces" value="${pd.province_id}"/>
					</td>
					<td><select class="chzn-select" name="organization_province" id="organization_province"
						data-placeholder="请选择省"  style="height: 20px; width: 315px;">
										<option value=""></option>
										<c:forEach items="${provincelist}" var="pr">
											<option value="${pr.id }" <c:if test="${pr.id == pd.province_id}">selected</c:if>>${pr.name }</option>
										</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
					<span style="color:#C00;padding-right: 4px;">*</span><B>市</B></td>
					<td>
						<c:if test="${not empty citylist}">
							<select class="chzn-select" name="organization_city" id="organization_city" data-placeholder="请选择市"  style="height: 20px; width: 315px;">
								<option value=""></option>
								<c:forEach items="${citylist}" var="city">
									<option value="${city.id }" <c:if test="${city.id == pd.city_id}">selected</c:if>>${city.name }</option>
								</c:forEach>
							</select>
						</c:if>
						<c:if test="${empty citylist}">
							<select class="chzn-select" name="organization_city" id="organization_city" data-placeholder="请选择市"  style="height: 20px; width: 315px;">
								<option value=""></option>
							</select>
						</c:if>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
					<span style="color:#C00;padding-right: 4px;">*</span><B>区</B></td>
					<td>
						<c:if test="${not empty countylist}">
							<select class="chzn-select" name="organization_county" id="organization_county" data-placeholder="请选择区"  style="height: 20px; width: 315px;">
								<option value=""></option>
								<c:forEach items="${countylist}" var="ar">
									<option value="${ar.id }" <c:if test="${ar.id == pd.county_id}">selected</c:if>>${ar.name }</option>
								</c:forEach>
							</select>
						</c:if>
						<c:if test="${empty countylist}">
							<select class="chzn-select" name="organization_county" id="organization_county" data-placeholder="请选择区"  style="height: 20px; width: 315px;">
								<option value=""></option>
							</select>
						</c:if>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>组织地址</B></td>
					<td><input type="text" name="organization_address" id="organization_address" maxlength="80"
						 style="height: 20px; width: 300px;" placeholder="请输入协会地址"
						title="协会地址" onblur="trim(this);" /></td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
					<span style="color:#C00;padding-right: 4px;">*</span><B>主管单位</B></td>
					<td>
						<select class="chzn-select" name="belong_unit_id" id="belong_unit_id" data-placeholder="请选择主管单位"  style="height: 20px; width: 315px;">
							<option value=""></option>
							<c:forEach items="${unitList}" var="list">
							<option value="${list.unit_id}">${list.unit_name_full}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>成立时间</B>
					</td>
					<td><input name="organization_time" id="organization_time" class="Wdate" value="${pd.organization_time}" type="text" readonly="readonly" placeholder="请选择成立日期" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
					<span style="color:#C00;padding-right: 4px;">*</span><B>联系人</B>
					</td>
					<td><input type="text" name="organization_linkman" id="organization_linkman" maxlength="80"
						 style="height: 20px; width: 300px;" placeholder="请输入协会联系人"
						title="联系人" onblur="trim(this);" /></td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
					<span style="color:#C00;padding-right: 4px;">*</span><B>联系人手机号</B>
					</td>
					<td><input type="text" name="organization_phone" id="organization_phone" maxlength="80"
						 style="height: 20px; width: 300px;" placeholder="请输入联系人手机号"
						title="联系人手机号" onblur="trim(this);" /></td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>联系人身份证</B></td>
					<td><input type="text" name="organization_idcard" id="organization_idcard" maxlength="80"
						 style="height: 20px; width: 300px;" placeholder="请输入联系人身份证"
						title="联系人身份证" onblur="trim(this);" /></td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>Email</B></td>
					<td><input type="text" name="organization_email" id="organization_email" maxlength="80"
						 style="height: 20px; width: 300px;" placeholder="请输入email"
						title="email" onblur="trim(this);" /></td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>标题图</B></td>
					<td>
						<div class="upload_img">
							<input id="organization_img" name="organization_img" type="hidden" />
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
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>组织简介</B></td>
					<td><textarea id="organization_desc" name="organization_desc" maxlength="10000" 
							style="width:600px; height:200px;" 
							title="组织介绍"></textarea></td>
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
			<a class="btn  btn-danger" onclick="top.Dialog.close();">取消</a>
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
	<!-- 富文本编辑器start -->
	<!-- 配置文件 -->
	<script
		src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
	<script type="text/javascript" src="plugins/ueditor/ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript" src="plugins/ueditor/ueditor.all.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
	<!-- 实例化编辑器 -->
	<script type="text/javascript">
		$(top.hangge());
		//关联下拉菜单
		$(function(){
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
			
			//选择市
			$("#organization_province").change(function(){
				var organization_province = $("#organization_province").val();
				$.ajax({
					type: "POST",
					url: "<%=basePath%>vOrg/selectCity.do",
					data : {
						province_id : organization_province
					},
					dataType : "json",
					cache : false,
					success : function(data) {
						var html = '<option value=""></option>';
						var html_area = '<option value=""></option>';
						$("#organization_city").empty();
						$("#organization_county").empty();
						$.each(data.cityList, function(i, obj) {
							html += "<option value="+obj.id+">"+ obj.name + "</option>";
						});
						$("#organization_city").append(html);
						$("#organization_city").trigger("liszt:updated");
						$("#organization_county").append(html_area);
						$("#organization_county").trigger("liszt:updated");
					}
				});
			});

			//选择区县
			$("#organization_city").change(function(){
				var organization_city = $("#organization_city").val();
				$.ajax({
					type:"POST",
					url:"<%=basePath%>vOrg/selectArea.do",
					data:
						{
						city_id:organization_city
						},
					dataType:"json",
					cache:false,
					success:function(data){
						var html='<option value=""></option>';
						$("#organization_county").empty();
						$.each(data.areaList,function(i,obj){
							html += "<option value="+obj.id+">"+obj.name+"</option>";
						});
						$("#organization_county").append(html);
						$("#organization_county").trigger("liszt:updated");
					}
				});
			});
			
			
			//图片上传
			$("#weixin_image").fileupload({
				 dataType :'iframe text',
				 autoUpload: true,
				 maxNumberOfFiles : 1,
		         url: '<%=basePath%>vOrg/Upload.do',
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
		            document.getElementById("organization_img").value=data.result;
		            $("#cutImage").val(data.result);
		   	 }
		    });
			
			
		});
		
		//返回
	    function returnback(){
			var url = $("input[name='url']").val();
	    	window.location.href="<%=basePath%>unit/list.do"+url;
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
					diag.URL = dialogPath+"vOrg/toCutImage.do?cutImage="+cutImage+"&width="+width+"&height="+height;
					
					diag.OKEvent = function(){//确定事件
						var x = diag.innerFrame.contentWindow.x;
						var y = diag.innerFrame.contentWindow.y;
						var w = diag.innerFrame.contentWindow.w;
						var h = diag.innerFrame.contentWindow.h;
						
						if(x.value != "" && y.value != "" && w.value != "" && h.value != ""){
							$.ajax({
								type: "POST",
								url: "<%=basePath%>vOrg/cutImage.do",
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
									$("#organization_img").val(result);
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