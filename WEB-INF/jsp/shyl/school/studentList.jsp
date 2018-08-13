<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<title>学生管理_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
<jsp:include page="../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<script src="shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/jquery.min.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.js"></script>
<style type="text/css">
table{  
    table-layout:fixed; 
}
.tds {
    width:100%;  
    word-break:keep-all;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
}
.progress {
    padding: 1px;
    width: 220px;
    height: 11px;
    overflow: hidden;
    border: 1px solid #428bca;
    -webkit-border-radius: 6px;
    margin-bottom: 0px;
    border-radius: 6px;
    display:none;
    float:left;
}
.bar {
    height: 11px;
    border-radius: 6px;
    -webkit-border-radius: 6px;
    background: #428bca;
    color: #ffffff;
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 12px;
    padding: 0px;
    line-height: 11px;
    text-align: center;
}
.bar-error{
  width:100%;
  background:#f44336;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<input type="hidden" id="schoolId" value="${pd.school_id}"/>
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../common/left.jsp"><jsp:param value="42" name="menuType"/></jsp:include>
		<div class="mypage_right">
			<h2>学生管理</h2>
			<div>						
				<span style="font-size: 12px; padding-left: 10px;margin-right:100px; display: inline-block; vertical-align: bottom;border:1px solid #d2c7c7;width:86%;">
					<label style="color: red; ">※温馨提示：</label><label style="">所有添加过的学生的用户名为：院校名称各个字的首字母和学号的组合，密码为添加时输入的密码。</label><br/>
			</span></div>
			<div class="tab" style="margin-bottom:0;width: 850px;">
				<a data-toggle="modal" data-target="#upExcel" onclick="upExcel();"
				    class="more" style="font-size: 1em;cursor: pointer;">&nbsp;批量导入</a>
				<a href="<%=basePath%>schoolContro/create.act" class="more" style="font-size: 1em;margin-right: 10px;">+&nbsp;&nbsp;新增</a>
				<form action="<%=basePath%>schoolContro/list.act" method="post" name="schoolform" id="schoolform">
					<input type="text" class="search" id="titlename" name="titlename" value="${pd.titlename}" maxlength="20" placeholder="请输入姓名关键字" style="background-color: #ecf0f9;">
					<input type="submit" class="sbtnNew" value="搜索" onclick="search();" style="margin-top:0px;line-height: 46px;height: 46px;color: #ffffff;margin-left: 20px;">
				</form>
			</div>
			<div class="jianli">
				<table class="tableclass" style="width: 100%">
					<thead>
						<tr>
							<th style="width: 10%;text-align: center;">姓名</th>
							<th style="width: 15%;text-align: center;">学号</th>
							<th style="width: 15%;text-align: center;">用户名</th>
							<th style="width: 20%;text-align: center;">专业名称</th>
							<th style="width: 15%;text-align: center;">毕业时间</th>
							<th style="width: 20%;text-align: center;">邮箱</th>
							<th style="text-align: center;width: 20%;">操作</th>
						</tr>
					</thead>
					<tbody>
					    <c:choose>
					        <c:when test="${not empty studentList}">
					            <c:forEach items="${studentList}" var="var" varStatus="vs">
									<tr>
										<td class="tds" style="text-align: center;" title="${var.name}">${var.name}</td>
										<td class="tds" style="text-align: center;" title="${var.student_no}">${var.student_no}</td>
										<td class="tds" style="text-align: center;" title="${var.user_name}">${var.user_name}</td>
										<td class="tds" style="text-align: center;" title="${var.profession}">${var.profession}</td>
										<td class="tds" style="text-align: center;" title="${var.graduation_date}">${var.graduation_date}</td>
										<td class="tds" style="text-align: center;" title="${var.mail}">${var.mail}</td>
										<td style="text-align: center;">
										    <a href="<%=basePath%>schoolContro/toEdit.act?id=${var.user_id}" class="modify">修改</a>
										    <%-- <a class="delete" style="cursor: pointer;" data-target="#delstudent" data-toggle="modal"
										     onclick="deletecv('${var.user_id}','${var.school_id}','${var.profession}','${var.graduation_date}','delstudent_${var.user_id}')"
										     id="delstudent_${var.user_id}">删除</a> --%>
										</td>
									</tr>
							    </c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5" style="text-align: center;">
										<span style="color: #ff6a00">没有相关数据</span>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<!-- 分页开始 -->
			<div class="page-header position-relative">
				<table style="width: 100%;">
					<tr>
						<td style="align: center;" align="center"><div
							class="pagination"
							style="padding-top: 15px; margin: 0 auto; font-size:12px; display: inline-block;">${page.platformPageStr}</div></td>
					</tr>
				</table>
			</div>
			<!-- 分页结束 -->
		</div>
		
	<!-- 批量导入 -->
	<div class="modal_h20 fade in" id="upExcel" role="dialog" style="margin-top: 0%;dispaly:block" 
			aria-labelledby="adoptModal" aria-hidden="false" data-backdrop="static">
			
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							批量导入 
						</h4>
					</div>
					<form class="form-horizontal" role="form" action="" method="post"
						id="importform" name="form1">
						<table class="table">
							<tbody>
								<tr>
									<td>
										<div class="row">
											<div class="col-md-12">
												<div>
													<div class="form-group">	
														<div class="col-sm-12" style="margin-left: 30px;margin-top:5px;">
															<div class="caption" align="left" >
															<span >选择导入文件 ：</span>
																<span id="file_uploadExcel" class="btn btn-primary fileinput-button"> <span>导入本地Excel文件  </span> <input
																	type="file" id="file_uploadExcel" name="file_uploadExcel" multiple />
																</span> <span style="margin-top:5px; color: #818590;">支持的文件格式为.xls,.xlsx</span>
																<span style="margin-top:5px;margin-left: 30px;"><a class="zdown" href="javascript:void(0);" title="下载模板" onclick="downloadFile('1301');">下载模板</a></span>
															</div>
															
														</div>
														<div style=" height: 20px;">
															<div id="progress" class="progress" style="float: left;margin-top: 10px; margin-left: 164px;">
																<div class="bar" style="width: 0%;"></div>
															</div>
														</div>
														<div id="errorList" class="col-sm-12"  style="margin-left: 30px;margin-top:5px; display: none">
															<span class="red_tip">错误提示如下：</span>
															<ul id="docNameImpExcel" style="font-size: 14px; color: #f22b2b;">
															
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" onclick="Clear()"
								data-dismiss="modal">关闭</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<div class="modal_h20 fade bs-example-modal-sm in" id="delstudent"
			data-toggle="modal" tabindex="-1" role="dialog"
			aria-labelledby="mySmallModalLabel" aria-hidden="false" data-backdrop="static"
			data-target="">
			<div class="modal-dialog modal-sm"  >
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							onclick="Clear()">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">提示</h4>
					</div>
					<div class="modal-body">
						<p id="warntext">确认删除该学生信息吗</p>
					</div>
					<div class="modal-footer">
						<input type="hidden" id="userId" value="" />
						<input type="hidden" id="schoolIds" value="" />
						<input type="hidden" id="profession" value="" />
						<input type="hidden" id="year" value="" />
						<button type="button" class="btn btn-success" onclick="Delete()"
							data-dismiss="modal">确认</button>
						<button type="button" class="btn btn-default"
							data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class='modal my-modal-alert' id='my-excel-success-alert'>
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:200px;text-align:center;position:fixed;right:40%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;导入成功!
                    </div>
                </div>
            </div>
        </div>
        
        <script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
	    <link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
		<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
		<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
		<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
		<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
		<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
		<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
		
	</div>
	<div class="clear"></div>
	<%@ include file="../common/footer.jsp"%>
</body>
<script type="text/javascript" charset="utf-8">
var fileName,filePath;
//调用批量导入功能
function upExcel(){
	var options = {
	        url:'<%=basePath%>schoolContro/uploadExcel.act',
	        data:{alias:"student"},
				getresult: function(data) {fileuploaddoneExcel();},
				fileNmae:"学生信息表.xlsx",
				filePath:"templateFiles/student.xlsx"
	 };
	fileuploadExcel(options);
}
//批量导入回调函数
function fileuploaddoneExcel(){
	location.href = "<%=basePath%>schoolContro/list.act";
}

var url="<%=basePath%>schoolContro/uploadExcel.act";
function fileuploadExcel(options){
	fileName=options.fileNmae;
	filePath=options.filePath;
	if(options.url !=null){
		url= options.url;
	}
	
	$("#file_uploadExcel").fileupload({
		 dataType :'json',
		 autoUpload: true,
		 maxNumberOfFiles :1,
		 formData:options.data,
         url: url,
         sequentialUploads: true
	 }).bind('fileuploadchange', function (e, data) {
		 if(data.files.length > 1){
			 $(this).tips({
				 side : 2,
				 msg : "一次最多导入一个excel文件",
				 bg : '#AE81FF',
				 time : 2
			 });
            return false;
		 }
	 }).bind('fileuploadprogress', function (e, data) {
			progress('progress',data);
     }).bind('fileuploaddone', function (e, data) {
    	 $("#errorList").hide();
		 $("#docNameImpExcel").empty();
	   	 if("no"==data.result.fileExtError){
	   		 $(this).tips({
					 side : 2,
					 msg : "请上传格式为.xls,.xlsx格式的文档文件。",
					 bg : '#AE81FF',
					 time : 2
				 });
	   		 progressError('progress');
	   		 return false;
	   	 }else if('failed'==data.result.fileExtError){
	   		$(this).tips({
				 side : 2,
				 msg : "导入失败",
				 bg : '#AE81FF',
				 time : 2
			 });
	   	     progressError('progress');
			 return false;
	   	 } else if(data.result.errorList !=null && data.result.errorList.length>0){
	   		 progressError('progress');
	   		 $("#errorList").show();
	   		 $.each(data.result.errorList,function(index,item){
	   			 if(index <15){
	   				 $("#docNameImpExcel").append("<li>"+item+"</li>");
	   			 }
	   		 })
	   	 } else if(data.result.errorInsertList !=null && data.result.errorInsertList.length>0){
	   		 progressErrors('progress');
	   		 $("#errorList").show();
	   		 $.each(data.result.errorInsertList,function(index,item){
	   			 if(index <15){
	   				 $("#docNameImpExcel").append("<li>"+item+"</li>");
	   			 }
	   		 })
	   	 } else {
	   		 $('#progress .bar').removeClass("bar-error").css('width', '100%').text('完成');
	   		 
	   		 $('#upExcel').modal('hide');
	   		 $('#my-excel-success-alert').show().delay(1000).fadeOut (function(){options.getresult();});
	   	 }
    });
}
function progressErrors(obj){
	$("#"+obj).hide();
}
function progressError(obj){
	$('#'+obj+' .bar').addClass("bar-error").text('上传失败').parent().fadeOut(3000);
}
function progress(obj,data){
	var progress = parseInt(data.loaded / data.total * 100, 10);
	if(progress==100){
		progress=90;
	}
	$("#"+obj).show();
	$('#'+obj+' .bar').removeClass("bar-error").css('width', progress + '%').text(progress==100 ?'完成':progress+'%');
}
function Clear() {
	 $("#errorList").hide();
	 location.href = "<%=basePath%>schoolContro/list.act";
}
function downloadFile() {
	$("#importform").attr("action","<%=basePath%>schoolContro/downloadTemp.act?fileName="+encodeURI(fileName)+"&filePath="+filePath);
	$("#importform").submit();			
}

function Delete() {
	var userId = $("#userId").val();
	var schoolId = $("#schoolIds").val();
	var profession = $("#profession").val();
	var year = $("#year").val();
	location.href = "<%=basePath%>schoolContro/delSch.act?user_id="+userId+"&school_id="+schoolId+"&profession="+profession+"&year="+year;
}

function deletecv(userId,schoolId,profession,year,divid) {
	$("#" + divid).attr("data-target", "#delstudent");
	$("#delstudent").attr("data-target", "");
	$("#userId").val(userId);
	$("#schoolIds").val(schoolId);
	$("#profession").val(profession);
	$("#year").val(year);
}

//检索
function search(){
	top.jzts();
	$("#schoolform").submit();
}
</script>
</html>