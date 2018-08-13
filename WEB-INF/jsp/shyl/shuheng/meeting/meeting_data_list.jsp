<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8" />
<title>系统用户添加页面</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../../system/admin/top.jsp"%>
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<!-- 添加按钮 -->
<link rel="stylesheet" href="static/assets/css/font-awesome.css" />
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
	left: 450px;
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


.line-remove-opt {
    color: #d2322d;
    cursor: pointer;
}
.fa-plus-square{
	cursor: pointer;
    color: #219823
}

</style>
</head>
<body>
	<form action="<%=basePath%>meeting/editData.do" name="Form" id="Form" method="post">
		<input type="hidden" name="meeting_id" id="meeting_id" value="${pd.meeting_id }"/>
		<div id="zhongxin">
			<table class="table">
				<tr>
					<td class="center" width="20%">
						资料名称
					</td>
					<td class="center" width="10%">
						排序号码
					</td>
					<td class="center" width="70%">
						资料文件
						<span style="color: red">(支持的文件格式为.pdf)</span>
					</td>
				</tr>
				<c:choose>
				<c:when test="${not empty pdList}">
					<c:forEach items="${pdList}" var="list" varStatus="vs">
						<tr>
							<td class="center"> 
								<input type="hidden" name="meetingDataId" value="${list.meeting_data_id }"/>
								<input type="text" style="width:150px;" name="dataName" value="${list.data_name }"/>
							</td>
							<td class="center">
								<input type="number" style="width:30px;" min="1" value="${list.data_order_number}" name="dataOrderNumber" />
							</td>
							<td class="center">
								<div class="form-group" id="businessDiv">
									<div class="upload">
										<input id="data_file_name" name="dataFileName" maxlength="500" type="hidden" value="${list.data_file_name}"/> 
										<input id="data_file" name="dataFile" maxlength="100" type="hidden" value="${list.data_file}"/>
										<input type="text" class="docName" value="${list.data_file_name}" maxlength="100" style="float:left; height: 20px; width: 270px;" readonly="readonly"/> 
										<a href="javascript:;" class="a-upload" style="text-decoration: none; color: #ffffff;" id="fileDiv">上传本地附件 
											<input type="file" id="data_file" placeholder="上传本地附件" onclick="fileupload(this)" name="file_upload" multiple>
										</a> 
										<a href="javascript:;" style="text-decoration: none; color: #ffffff; left: 555px" onclick="deleteFile(this)">移除附件
										</a>
									</div>
								</div>
							</td>
							<td class="center">
								<span><i class="small-icon line-remove-opt fa fa-minus-square" title="删除此选项" onclick="delOption(this)"></i></span>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td class="center">
							<input type="text" style="width:150px;" name="dataName" />
						</td>
						<td class="center">
							<input type="number" style="width:30px;" min="1" value="1"  name="dataOrderNumber" />
						</td>
						<td class="center">
							<div class="form-group" id="businessDiv">
								<div class="upload">
									<input id="data_file_name" name="dataFileName" maxlength="500" type="hidden" value="${pd.data_file}"/> 
									<input id="data_file" name="dataFile" maxlength="100" type="hidden" value="${pd.data_file}"/>
									<input type="text" class="docName" value="${pd.data_file_name}" maxlength="100" style="float:left; height: 20px; width: 270px;" readonly="readonly"/> 
									<a href="javascript:;" class="a-upload" style="text-decoration: none; color: #ffffff;" id="fileDiv">上传本地附件 
										<input type="file" id="data_file" placeholder="上传本地附件" onclick="fileupload(this)" name="file_upload" multiple>
									</a> 
									<a href="javascript:;" style="text-decoration: none; color: #ffffff; left: 555px" onclick="deleteFile(this)">移除附件
									</a>
								</div>
							</div>
						</td>
						<td class="center">
							<span><i class="small-icon line-remove-opt fa fa-minus-square" title="删除此选项" onclick="delOption(this)"></i></span>
						</td>
					</tr>
				</c:otherwise>
				</c:choose>
			</table>
			<table>
				<tr>
					<td style="text-align: center; width:750px;"><a
						class="btn btn-mini btn-primary" onclick="save();">保存</a> <a
						class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
					</td>
				</tr>
			</table>
		</div>

		<div id="zhongxin2" class="center" style="display: none">
			<br /> <br /> <br /> <br /> <img src="static/images/jiazai.gif" /><br />
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
	<script type="text/javascript"
		src="static/js/bootstrap-datepicker.min.js"></script>
	<!-- 富文本编辑器start -->
	<!-- 配置文件 -->
	<script type="text/javascript" src="plugins/ueditor/ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript" src="plugins/ueditor/ueditor.all.js"></script>
	<script
		src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
	<script
		src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
	<script
		src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
	<script
		src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
	<script type="text/javascript" src="static/js/bootbox.min.js"></script>
	<!-- 富文本编辑器end -->

	<script type="text/javascript">
		$(function() {
			$(top.hangge());
			//单选框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			
			var addStr = '<span><i class="small-icon fa fa-plus-square" title="添加此选项" onclick="addOption(this)"></i></span>';
			$(".table tr").eq(1).children("td").last().empty().append(addStr);
		});
		
		function delOption(obj){
			var meetingDataId = $(obj).parents("td").siblings().first().find("input[name='meetingDataId']").val();
			if(meetingDataId!=null && meetingDataId!=""){
				bootbox.confirm("确定要删除吗?", function(result){
					if(result){
						$.ajax({
							type : "POST",
							url : "<%=basePath%>meeting/dataDel.do?tm=" + new Date().getTime(),
							dataType : "text",
							cache : false,
							data :{meeting_data_id:meetingDataId},
							success:function(data){
								if(data=="success"){
									$(obj).parents("tr").remove();
								}
							}
						});
					}
				})
			}else{
				$(obj).parents("tr").remove();
			}
		}
		
		function addOption(obj){
			var index = $(".table tbody tr").size();
			var str = '<tr>'
						+'<td class="center">'
							+'<input type="text" style="width:150px;" name="dataName" />'
						+'</td>'
						+'<td class="center">'
							+'<input type="number" style="width:30px;" min="1" value="'+index+'"  name="dataOrderNumber" />'
						+'</td>'
						+'<td class="center">'
							+'<div class="form-group" id="businessDiv">'
							+	'<div class="upload">'
								+	'<input id="data_file_name" name="dataFileName" maxlength="500" type="hidden" value="${pd.data_file}"/>' 
								+	'<input id="data_file" name="dataFile" maxlength="100" type="hidden" value="${pd.data_file}"/>'
								+	'<input type="text" class="docName" value="${pd.data_file_name}" maxlength="100" style="float:left; height: 20px; width: 270px;" readonly="readonly"/>' 
								+	'<a href="javascript:;" class="a-upload" style="text-decoration: none; color: #ffffff;" id="fileDiv">上传本地附件 '
								+		'<input type="file" id="data_file" placeholder="上传本地附件" onclick="fileupload(this)" name="file_upload" multiple>'
								+	'</a>' 
								+	'<a href="javascript:;" style="text-decoration: none; color: #ffffff; left: 555px" onclick="deleteFile(this)">移除附件'
								+	'</a>'
							+	'</div>'
							+ '</div>'
						+'</td>'
						+'<td class="center">'
							+'<span><i class="small-icon line-remove-opt fa fa-minus-square" title="删除此选项" onclick="delOption(this)"></i></span>'
						+'</td>'
					+'</tr>';
			$(".table").append(str);
		}
		
		
		function save(){
			var flag = true;
			$("input[name='dataName']").each(function(){
				if($(this).val()==null || $(this).val()==''){
					$(this).tips({
						side : 2,
						msg : '资料名称不能为空',
						bg : '#FF5080',
						time : 5
					});
					flag = false;
				}
			})
			
			$("input[name='dataFile']").each(function(){
				if($(this).val()==null || $(this).val()==''){
					$(this).siblings(".docName").tips({
						side : 2,
						msg : '资料附件不能为空',
						bg : '#FF5080',
						time : 5
					});
					flag = false;
				}
			})
			if(flag){
			   $("#Form").submit()
			}
		}
		
		//附件删除
		function deleteFile(obj){
			$(obj).siblings("input").each(function(){
				$(this).val('')
			});
		}
		
		function fileupload(obj){
			$(obj).fileupload({
	 			dataType :'iframe text',
	 			autoUpload: true,
	 			maxNumberOfFiles : 1,
	 			maxFileSize: 50000000,
	 	        url: '<%=basePath%>meeting/fileUpLoad.do',
	 			sequentialUploads : true,
	 			add: function (e, data) {
	 				var oldpath = $(this).parents("a").siblings("input[name$='File']").val();
	 				data.url = '<%=basePath%>meeting/fileUpLoad.do?oldpath='+oldpath;
	 				data.submit();
	 			}
	 			}).bind('fileuploadchange', function(e, data) {			 
	 				if (data.files.length > 1) {
	 					$(this).parent().siblings(".docName").tips({
	 						side : 2,
	 						msg : "只能上传一个文件。",
	 						bg : '#FF5080',
	 						time : 2
	 					});
	 					return false;
	 				}
	 			}).bind('fileuploaddone', function(e, data) {
	 				if ("no" == data.result) {
	 					$(this).parent().siblings(".docName").tips({
	 						side : 2,
	 						msg : "请上传.pdf格式的文件。",
	 						bg : '#FF5080',
	 						time : 2
	 					});
	 				}else if('outsize' == data.result){
	 					$(this).parent().siblings(".docName").tips({
	 						side : 2,
	 						msg : "上传失败，文件最大为50M。",
	 						bg : '#FF5080',
	 						time : 2
	 					});
	 				}else {
	 					$(this).parent().siblings("input[name$='File']").val(data.result);
	 					$(this).parent().siblings("input[name$='FileName']").val(data.originalFiles[0].name);
	 					$(this).parent().siblings(".docName").val(data.originalFiles[0].name);
	 				}
	 			});
		}
	</script>

</body>
</html>