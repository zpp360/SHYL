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
<title>app用户修改页面</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../../system/admin/top.jsp"%>
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<!-- 日期框 -->
<script type="text/javascript">
	//保存
	function save() {
		var userName = $("#user_name").val();
		if (userName == "") {
			$("#user_name").tips({
				side : 3,
				msg : '请输入用户名',
				bg : '#FF5080',
				time : 2
			});
			$("#user_name").focus();
			return false;
		}
		if(isSpecialChar(userName)){
			$("#user_name").tips({
				side : 3,
				msg : '用户名不允许包含非法字符',
				bg : '#FF5080',
				time : 2
			});
			$("#user_name").focus();
			return false;
		}
		
		if ($("#user_birthday").val() == "") {
			$("#user_birthday").tips({
				side : 3,
				msg : '请选择出生日期',
				bg : '#FF5080',
				time : 2
			});
			return false;
		}
		
		if ($("#user_job").val() == "") {
			$("#user_job").tips({
				side : 3,
				msg : '请输入职务',
				bg : '#FF5080',
				time : 2
			});
			$("#user_job").focus();
			return false;
		}
		
		if ($("#user_unit")!="undefined"&&$("#user_unit").val()!=null&&$("#user_unit").val() == "") {
			$("#user_unit").tips({
				side : 3,
				msg : '请选择用户单位',
				bg : '#FF5080',
				time : 2
			});
			$("#user_unit").focus();
			return false;
		}
		

		var userPhone = $("#user_phone").val();
		if (userPhone == "") {
			$("#user_phone").tips({
				side : 3,
				msg : '请输入手机号',
				bg : '#FF5080',
				time : 2
			});
			$("#user_phone").focus();
			return false;
		}else{
			var myreg = /^(1)[0-9]{10}$/;
			if(!myreg.test($("#user_phone").val())){
				$("#user_phone").tips({
					side : 3,
					msg : '请输入正确格式手机号',
					bg : '#FF5080',
					time : 2
				});
				$("#user_phone").focus();
				return false;
			}
		}
		if ($("#user_sex").val() == "") {
			$("#user_sex").tips({
				side : 3,
				msg : '请选择用户性别',
				bg : '#FF5080',
				time : 2
			});
			$("#user_sex").focus();
			return false;
		}
		
		if ($("#user_type").val() == "") {
			$("#user_type").tips({
				side : 3,
				msg : '请选择用户类型',
				bg : '#FF5080',
				time : 2
			});
			$("#user_type").focus();
			return false;
		}
		//ueditor获取纯文本，给app使用
		var content = UE.getEditor('user_desc').getContentTxt();
		$("#user_desc").val(content);
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
</script>
<style type="text/css">
.upload_img{
	float: left;width: 60%;position: relative;
}
.cut_img{
	margin-top:22px;
	float:left;
	width: 50%;
	position: relative;
}
.upload_img img{float: left;}
.upload_img a{
	position: absolute;
	left: 210px;
	top:0;
	font-size: 0.85em;
	border:0;
	background-color: #3961c2;
	color: #fff;
	padding: 0;
	width: 160px;
	text-align: center;
	height: 50px;
	line-height: 50px;
	display: inline-block;border-radius:4px;
    float: left;
    margin-top: 20px;
}
.upload_img p{
	position: absolute;
	bottom:50px;
	left: 210px;
	color: #737373;
	line-height: 30px;
	width: 60%;
	font-size: 1.1em;
	float: left;
}
.upload_img p i{
	color: #1c1c1c;font-weight: bold;
	font-size: 1.1em;
}
select, input[type="file"] {
    height: 45px;
    line-height: 30px;
}
.uploadbtn{
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
    filter: alpha(opacity=0);
    cursor: pointer
}
.upload a{
	position: absolute;
	left: 330px;
	font-size: 0.85em;
	border:0;
	background-color: #3961c2;
	color: #fff;
	padding: 0;
	width: 100px;
	text-align: center;
	height: 30px;
	line-height: 30px;
	display: inline-block;border-radius:4px;
    float: left;
    margin-left: 100px;
}
.upload p{
	bottom:50px;
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
	<form action="<%=basePath%>appuser/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="url" value="${url }" />
		<input type="hidden" id="user_id" name="user_id" value="${pd.user_id }"/>
		<div id="zhongxin">
			<table class="table ">
			    <tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>用户名</B></td>
					<td><input type="text" name="user_name" id="user_name" value="${pd.user_name }" maxlength="40"
						 style="height: 20px; width: 300px;" placeholder="请输入用户名"
						title="用户名" onblur="trimAll(this);" /></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color:#C00;padding-right: 4px;">*</span><B>民族</B>
					</td>
					<td>
						<select class="chzn-select" name="mz_code" id="mz_code" style="height: 20px; width: 315px;" >
							<c:forEach items="${selectMzList}" var="list">
								<option value="${list.mz_code}" <c:if test="${pd.user_mz==list.mz_code}">selected</c:if>>${list.mz_name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;">
						<span style="color:#C00;padding-right: 4px;">*</span><B>出生日期</B>
					</td>
					<td>
						<input name="user_birthday" id="user_birthday" value="${pd.user_birthday}" class="Wdate"  type="text" data-date-format="yyyy-mm-dd" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true,maxDate:'%y-%M-%d'});" readonly="readonly" placeholder="请选择出生日期"  title="出生日期" style=" width: 300px"/>
					</td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;">
						<span style="color:#C00;padding-right: 4px;">*</span><B>(原)职务(职级)或职称</B>
					</td>
					<td>
						<input type="text" name="user_job" id="user_job" value="${pd.user_job}" maxlength="50" style="height: 20px; width: 300px;" placeholder="请输入职务" title="职务" onblur="trimAll(this);" />	
					</td>
				</tr>
				<c:if test="${is_super_admin}">
				<tr>
				<td style="width: 80px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>所属单位</B></td>
					<td><select class="chzn-select" name="user_unit" id="user_unit" 
							data-placeholder="请选择所属单位" style="height: 20px; width: 315px;" >
							<option value="">---选择所属单位---</option>
							<c:forEach items="${unitList}" var="list">
								<option value="${list.unit_id}" 
								<c:if test="${list.unit_id == pd.unit_id }">selected</c:if>>${list.unit_name_full}</option>
							</c:forEach>
					</select></td>
				</tr>
				</c:if>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>手机号</B></td>
					<td><input type="text" name="user_phone" id="user_phone" value="${pd.user_phone }" maxlength="11"
						 style="height: 20px; width: 300px;" placeholder="请输入手机号"
						title="手机号" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>身份证号码</B></td>
					<td><input type="text" name="user_id_number" id="user_id_number" value="${pd.user_id_number }" maxlength="18"
						 style="height: 20px; width: 300px;" placeholder="请输入身份证号码"
						title="身份证号码" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>性别</B></td>
					<td><select class="chzn-select" name="user_sex" id="user_sex" value="${pd.user_sex }"
						data-placeholder="请选择性别"  style="height: 20px; width: 315px;">
								<option value="0" <c:if test="${pd.user_sex==0 }">selected</c:if> >男</option>
								<option value="1" <c:if test="${pd.user_sex==1 }">selected</c:if> >女</option>
					</select></td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>类型</B></td>
					<td><select class="chzn-select" name="user_type" id="user_type"
						data-placeholder="请选择用户类型"  style="height: 20px; width: 315px;">
								<option value="">---选择用户类型---</option>
								<option value="2" <c:if test="${pd.user_type==2 }">selected</c:if>>在职</option>
								<option value="1" <c:if test="${pd.user_type==1 }">selected</c:if>>退休</option>
								<option value="0" <c:if test="${pd.user_type==0 }">selected</c:if>>离休</option>
					</select></td>
				</tr>
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>入党时间</B></td>
					<td><input class="span10 date-picker" name="user_join_party_time" id="user_join_party_time" class="Wdate" value="${pd.user_join_party_time }"  type="text" data-date-format="yyyy-mm-dd" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});" readonly="readonly" placeholder="入党时间"  title="入党时间" style="width:300px"/></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>省</B>
					<input type="hidden" id="provinces" value="${pd.user_province}"/>
					</td>
					
					<td><select class="chzn-select" name="user_province" id="user_province"
						data-placeholder="请选择省"  style="height: 20px; width: 315px;">
										<option value=""></option>
										<c:forEach items="${provinceList}" var="pr">
											<option value="${pr.id }" <c:if test="${pr.id == pd.user_province}">selected</c:if>>${pr.name }</option>
										</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>市</B></td>
					<td><select class="chzn-select" name="user_city" id="user_city"
						data-placeholder="请选择市"  style="height: 20px; width: 315px;">
										 <option value=""></option>
										<c:forEach items="${citylist}" var="city">
											<option value="${city.id }" <c:if test="${city.id == pd.user_city}">selected</c:if>>${city.name }</option>
										</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>区</B></td>
					<td><select class="chzn-select" name="user_county" id="user_county"
						data-placeholder="请选择区"  style="height: 20px; width: 315px;">
										 <option value=""></option>
										<c:forEach items="${countylist}" var="ar">
											<option value="${ar.id }" <c:if test="${ar.id == pd.user_county}">selected</c:if>>${ar.name }</option>
										</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>详细地址</B></td>
					<td><input type="text" name="user_address" id="user_address" value="${pd.user_address }" maxlength="200"
						 style="height: 20px; width: 300px;" placeholder="请输入详细地址"
						title="详细地址" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>用户头像</B></td>
					<td>
						<div class="upload_img">
							<input id="user_pic" name="user_pic" type="hidden" value="${pd.user_pic}"/>
							<c:if test="${empty pd.user_pic}">
								<img id="weixin_show" name="weixin_show" style="width: auto; height: 150px;max-width:200px;" src="<%=basePath%>shyl/images/temp.png">
							</c:if>
							<c:if test="${!empty pd.user_pic}">
						        <img id="weixin_show" name="weixin_show" style="width: auto; height: 150px;max-width:200px;" onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="${img_host}${pd.user_pic}">
						    </c:if>
							<a href="javascript:;" class="a-upload" style="text-decoration: none; color: #ffffff;">上传本地图片 
								<input type="file" id="weixin_image" placeholder="上传本地图片" name="weixin_image" multiple>
							</a>
							<p>支持的文件格式为.gif、.jpeg、.jpg、.png</p>
						</div>
						<div class="cut_img">
							<a class="btn  btn-success" onclick="cutImage();"></i>裁切图片</a>
							<input type="hidden" id="cutImage" name="cutImage" value="${pd.user_pic}" placeholder="裁切图片"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							宽度：<input type="text" id="width" name="width" style="width:50px" value="1"/>&nbsp;&nbsp;&nbsp;&nbsp;
							高度：<input type="text" id="height" name="height" style="width:50px" value="1"/>
						</div>
					</td>
				</tr>
				<tr>
					<td nowrap="nowrap"
						style="width: 80px; text-align: left; padding-top: 13px;"><B>用户额外信息</B></td>
					<td><textarea id="user_desc" name="user_desc" maxlength="255" 
							style="min-height: 200px; margin: 0 auto; width: 80%;float:left" 
							title="额外信息">${pd.user_desc }</textarea></td>
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

			<a class="btn  btn-success" onclick="save();"><i class="icon-save"></i>更新</a> 
			<a class="btn  btn-light" onclick="returnback()"><i class=" icon-circle-arrow-left"></i>返回</a>

			<!-- <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a> -->
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
		var ue = UE.getEditor("user_desc");
		//ueditor有标签文本

		function getContent() {
			var arr = [];
			arr.push(UE.getEditor('user_desc').getContent());
			return arr.join("");
		}

		function clean() {
			ue.setContent("");
		}

		function setFocus() {
			UE.getEditor('user_desc').focus();
		}
		//关联下拉菜单
		$(function(){
			var knowledges = $("#user_provinces").val();
// 			if(""!=knowledges){
// 				BindCId2(knowledges);
// 			}else{
// 				BindCId2(0);
// 			}
			$("#user_province").change(function() {
			    BindCId2(0);
			});
			
			//区职单位
			var knowledges = $("#user_city").val();
// 			if(""!=knowledges){
// 				BindCId3(knowledges);
// 			}else{
// 				BindCId3(0);
// 			}
			$("#user_city").change(function() {
			    BindCId3(0);
			});
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
		});
		

		function BindCId2(cid) {
			var PID = $("#user_province").val();
			$("#user_city").empty();
			$("#user_county").empty();
			if (PID == "") {
		        $("<option value=''></option>").appendTo("#user_city");
		    }else{
		    	$.ajax({
					type:"POST",
					url:"<%=basePath%>unit/getAddrCityList.do",
					data:{'PID' : PID},
					dataType:"json",
					cache:false,
					success:function(data){
						var html='<option value=""></option>';
						var html1 = '<option value=""></option>';
						$.each(data.citylist,function(i,list){
							if(list.id==cid){
								if(cid!=0){
									html+="<option value="+list.id+" selected='selected' >"+list.name+"</option>";
								}
							}else{
								html+="<option value="+list.id+">"+list.name+"</option>";
							}
						});
						$("#user_city").append(html);
						$("#user_city").trigger("liszt:updated");
						$("#user_county").append(html1);
						$("#user_county").trigger("liszt:updated");
					}
				});
		    }
		}
		
		function BindCId3(cid) {
			var PID = $("#user_city").val();
			$("#user_county").empty();
			if (PID == "") {
		        $("<option value=''></option>").appendTo("#user_county");
		    }else{
		    	$.ajax({
					type:"POST",
					url:"<%=basePath%>unit/getAddrAreaList.do",
					data:{'PID' : PID},
					dataType:"json",
					cache:false,
					success:function(data){
						var html='<option value=""></option>';
						$.each(data.arealist,function(i,list){
							if(list.id==cid){
								if(cid!=0){
									html+="<option value="+list.id+" selected='selected' >"+list.name+"</option>";
								}
							}else{
								html+="<option value="+list.id+">"+list.name+"</option>";
							}
						});
						$("#user_county").append(html);
						$("#user_county").trigger("liszt:updated");
					}
				});
		    }
		}

		
	</script>
	<!-- 富文本编辑器end -->

	<script type="text/javascript">
		$(top.hangge());
		//返回
	    function returnback(){
	    	var url = $("input[name='url']").val();
	    	window.location.href="<%=basePath%>appuser/list.do"+url;
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
		         url: '<%=basePath%>appuser/Upload.do',
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
		            document.getElementById("user_pic").value=data.result;
		            $("#cutImage").val(data.result);
		   	 }
		    });
			
			
			//校验重复 手机号
			$("#user_phone").blur(function(){
				var userPhone = $("#user_phone").val().replace(/\s+/g,"");//去空格
				var userId = $("#user_id").val();
				
				if(userPhone != null && userPhone != ""){
					$.ajax({
						type:"POST",
						url:"<%=basePath%>appuser/checkUserPhone.do",
						cache : false,
						dataType:"json",
						data:{
							userPhone:userPhone,
							userId:userId
						},
						success:function(data){
							if(data){
								$("#user_phone").tips({
									side : 3,
									msg : '手机号已存在，请重新输入!',
									bg : '#FF5080',
									time : 2
								});
								$("#user_phone").focus();
								$("#user_phone").val("");
							}
						}
					});
				}
				
			});
			
			//校验重复 身份证号
			$("#user_id_number").blur(function(){
				var userIdNumber = $("#user_id_number").val().replace(/\s+/g,"");//去空格
				var userId = $("#user_id").val();
				
				if(userIdNumber != null && userIdNumber != ""){
					$.ajax({
						type:"POST",
						url:"<%=basePath%>appuser/checkUserIdNumber.do",
						cache : false,
						dataType:"json",
						data:{
							userIdNumber:userIdNumber,
							userId:userId
						},
						success:function(data){
							if(data){
								$("#user_id_number").tips({
									side : 3,
									msg : '身份证号已存在，请重新输入!',
									bg : '#FF5080',
									time : 2
								});
								$("#user_id_number").focus();
								$("#user_id_number").val("");
							}
						}
					});
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
					diag.URL = dialogPath+"appuser/toCutImage.do?cutImage="+cutImage+"&width="+width+"&height="+height;
					
					diag.OKEvent = function(){//确定事件
						var x = diag.innerFrame.contentWindow.x;
						var y = diag.innerFrame.contentWindow.y;
						var w = diag.innerFrame.contentWindow.w;
						var h = diag.innerFrame.contentWindow.h;
						
						if(x.value != "" && y.value != "" && w.value != "" && h.value != ""){
							$.ajax({
								type: "POST",
								url: "<%=basePath%>appuser/cutImage.do",
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
									$("#user_pic").val(result);
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
<!-- 附件上传 -->
	<script type="text/javascript">
	var tips=function(id,msg){
		$("#"+id).tips({
			side : 2,
			msg : msg,
			bg : '#FF5080',
			time : 2
		});
	}
	
	//附件删除
	function removeAppendix(){
		var path = $("#appendix_path").val();
		$.post('<%=basePath%>government/deleteAppendix.do', {path:path}, function(data){
			if(data == 'success'){
				$("#docName").val('');
				$("#appendix_path").val('');
				$("#appendix_name").val('');
			}
		});
	}
	 </script>
</body>
</html>