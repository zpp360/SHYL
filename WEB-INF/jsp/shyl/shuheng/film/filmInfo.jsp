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
<title>电影详情页面</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../../system/admin/top.jsp"%>
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<!-- 日期框 -->

<!-- 添加按钮 -->
<link rel="stylesheet" href="static/assets/css/font-awesome.css" />


<style type="text/css">
.upload_img {
	float: left;
	width: 60%;
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
	<form action="<%=basePath%>film/${msg }.do" name="Form" id="Form" method="post">
		<div id="zhongxin">
		<input type="hidden" name="film_id" id="film_id" value="${pd.filmId }"/>
			<table class="table">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>电影名称</B></td>
					<td><input type="text" value="${pd.filmName}" name="film_name" id="film_name" maxlength="40" disabled="disabled"
						 style="height: 20px; width: 300px;" placeholder="请输入电影名称"
						title="电影名称" onblur="trim(this);" />
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>导演名称</B></td>
					<td><input type="text" value="${pd.director}" name="director" id="director" maxlength="60" disabled="disabled"
						 style="height: 20px; width: 300px;" placeholder="请输入导演名称"
						title="导演名称" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>电影主演</B></td>
					<td><input type="text" value="${pd.performer}" name="performer" id="performer" maxlength="80" disabled="disabled"
						 style="height: 20px; width: 300px;" placeholder="请输入电影主演"
						title="电影主演" onblur="trim(this);" /></td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>电影时长</B></td>
					<td><input type="text" value="${pd.filmTime}" name="film_time" id="film_time" maxlength="80" disabled="disabled"
						 style="height: 20px; width: 300px;" placeholder="请输入电影时长"
						title="电影时长" onblur="trim(this);" /></td>
					
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>电影语言</B>
					</td>
					<td>
						<input type="text" name="filmLanguage" disabled="disabled" id="filmLanguage" value="${pd.filmLanguage}" maxlength="30" style="height: 20px; width: 300px;" placeholder="请输入电影语言" title="电影语言" onblur="trim(this);" />
					</td>

				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>上映地区</B>
					</td>
					<td>
						<input type="text" name="filmLocal" disabled="disabled" id="filmLocal" value="${pd.filmLocal}" maxlength="30" style="height: 20px; width: 300px;" placeholder="请输入上映地区" title="上映地区" onblur="trim(this);" />
					</td>

				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>上映时间</B>
					</td>
					<td><input name="releaseTime" id="releaseTime" class="Wdate" value="${pd.releaseTime}" type="text" readonly="readonly" placeholder="请选择上映日期" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowClear:true,editable=false});"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>放映时间</B></td>
					<td id="good">
					</td>
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
							    <input id="film_path" name="film_path" type="hidden" value=""/>
							   <c:if test="${empty pd.filmPath}">
									<img id="weixin_show" name="weixin_show" style="width: 158px; height: 190px;" src="<%=basePath%>shyl/images/temp.png">
							   </c:if>
								<c:if test="${!empty pd.filmPath}">
						        	<img id="weixin_show" name="weixin_show" style="width: 158px; height: 190px;" onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="${img_host}${pd.filmPath}">
						        </c:if>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td nowrap="nowrap" style="width: 80px; text-align: left; padding-top: 13px;">
						<B>电影介绍</B>
					</td>
					<td>
						<textarea id="summary" name="summary" maxlength="10000"  readonly="readonly" style="min-height: 450px; margin: 0 auto; width: 80%;float:left" title="电影介绍">${pd.summary}</textarea>
					</td>
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
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script>
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
			
			//放映时间 回传值
			var arrayList = ${arrayList};
			
			$.each(arrayList,function(i,obj){
				if(i==0){
					var str = '<span id="sp">' +
					'<input type="text" id="filmStartDate" name="filmStartDate" class="Wdate" value="'+obj.filmStartDate+'" readonly="readonly" placeholder="请选择开始日期"' +
					'onclick="WdatePicker({dateFmt:\'yyyy-MM-dd HH:mm\',isShowClear:true,editable=false});"/>' +
					' - <input type="text" id="filmEndDate" name="filmEndDate" class="Wdate" value="'+obj.filmEndDate+'" readonly="readonly" placeholder="请选择结束日期"' +
					'onclick="WdatePicker({dateFmt:\'yyyy-MM-dd HH:mm\',isShowClear:true,editable=false});"/>' +
					' <input type="text" id="person" name="person" readonly="readonly" value="'+obj.person+'" placeholder="请输入观影人数"/>' + 
					'  <i class="small-icon fa fa-plus-square" style="cursor:pointer;color: #219823;" onclick="addOption()" title="添加选项"></i>'+
					'</br>'+
					'</span>';
				}else{
					var str = '<span id="sp">' +
					'<input type="text" id="filmStartDate" name="filmStartDate" class="Wdate" value="'+obj.filmStartDate+'" readonly="readonly" placeholder="请选择开始日期"' +
					'onclick="WdatePicker({dateFmt:\'yyyy-MM-dd HH:mm\',isShowClear:true,editable=false});"/>' +
					' - <input type="text" id="filmEndDate" name="filmEndDate" class="Wdate" value="'+obj.filmEndDate+'" readonly="readonly" placeholder="请选择结束日期"' +
					'onclick="WdatePicker({dateFmt:\'yyyy-MM-dd HH:mm\',isShowClear:true,editable=false});"/>' +
					' <input type="text" id="person" name="person" readonly="readonly" value="'+obj.person+'" placeholder="请输入观影人数"/>' + 
					'<i class="small-icon ques-remove-opt fa fa-minus-square" title="删除此选项" onclick="deleteOption(this)"></i>'+
					'</br>'+
					'</span>';
				}
				$(str).appendTo($("#good"));
			});
			
			
			
			
		});
		
		//返回
	    function returnback(){
	    	window.location.href="<%=basePath%>film/list.do${url}";
		}
		
	</script>
</body>
</html>