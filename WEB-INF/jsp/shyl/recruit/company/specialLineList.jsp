<%@page import="com.sun.org.glassfish.gmbal.IncludeSubclass"%>
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
</style>
<head>
<title>专线明细表_济南市服务外包平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link rel="stylesheet" href="/SHYL/shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/styleRegist.css">
<jsp:include page="../../common/header.jsp"></jsp:include>
<script src="/SHYL/shyl/js/datepicker/WdatePicker.js"
	type="text/javascript"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
</head>

<body style="background-color: #f7f7f7;">
<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<!-- start -->
        <div class='modal my-modal-alert' id='my-modal-success-alert'>
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:200px;text-align:center;position:fixed;right:40%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;生成PDF成功!
                    </div>
                </div>
            </div>
        </div>
        
        <div class='modal my-modal-alert' id='my-modal-failure-alert'>
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:200px;text-align:center;position:fixed;right:40%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/fail.png">&nbsp;&nbsp;生成PDF失败!
                    </div>
                </div>
            </div>
        </div>
        <div class='modal my-modal-alert' id='my-modal-errorfile-alert'>
		<div class='modal-dialog boxBodySmall'>
			<div class='modal-content'
				style="width: 260px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
				<div class='modal-body' id='modal-body-alert'>
					<img alt="" src="<%=basePath%>shyl/images/mark.png">&nbsp;&nbsp;预览文件不存在!
				</div>
			</div>
		</div>
		</div>
        <!-- end -->
        
		<jsp:include page="../../common/left.jsp"><jsp:param value="2" name="menuType"/></jsp:include>
		<div class="mypage_right">
			<h2>专线明细表</h2>
			<div class="tab">
				<a data-toggle="modal" data-target="#upExcel" onclick="upExcel();"
						class="more" style="margin-left:10px;">批量导入</a>
				<a href="<%=basePath%>line/goAdd.act?info_id=${pd.info_id}" class="more" id="addLine" style="margin-left:10px;">+&nbsp;&nbsp;添加专线明细</a>
				<a href="javascript:void(0);" class="more" data-toggle="modal" data-target="#myApply" style="margin-left:10px;">+&nbsp;&nbsp;专线说明资料</a>
				<a href="javascript:void(0);" class="more" data-toggle="modal" data-target="#myContract" >+&nbsp;&nbsp;服务合同</a>
			</div>
			<form class="form-horizontal" action="<%=basePath%>line/list.act" method="post" id="listForm" name="listForm">
				<input type="hidden" id="info_id" name="info_id" value="${pd.info_id}">
			<div class="jianli">
			<table class="tableclass">
				<thead>
					<tr>
						<th style="width:5%;text-align: center;">序号</th>
						<th style="width:10%;text-align: center;">年</th>
						<th style="width:10%;text-align: center;">月</th>
						<th style="width:10%;text-align: center;">日</th>
						<th style="width:10%;text-align: center;">凭证号</th>
						<th style="width:20%;text-align: center;">摘要</th>
						<th style="width:10%;text-align: center;">金额</th>
						<th style="width:30%;text-align: center;">操作</th>
					</tr>
				</thead>
				<tbody>
					<!-- 开始循环 -->
					<c:choose>
						<c:when test="${not empty varList}">
								<c:forEach items="${varList}" var="var" varStatus="vs">
									<tr>
										<td style="text-align: center;">${vs.index+1}</td>
										<td style="text-align: center;">${var.apply_year}</td>
										<td style="text-align: center;">${var.apply_mon}</td>
										<td style="text-align: center;">${var.apply_date}</td>
										<td style="text-align: center;">${var.voucher_num}</td>
										<td style="text-align: center;">${var.apply_abstract}</td>
										<td style="text-align: center;">${var.apply_amount}</td>
										<td style="text-align: center;">
										 	<a class='modify' href="<%=basePath%>line/goUpdate.act?info_id=${var.info_id}&id=${var.id}">&nbsp;修改</a>
											<a class="delete" style="cursor: pointer;" data-toggle="modal" title="删除专线明细" id="delline_${var.id}" onclick="del(${var.id},'delline_${var.id}');" data-target="#delline">删除</a>
											<a class='zview' title="${var.voucher_name}" href="<%=basePath%>register/showPdf.act?pdfFile=${var.voucher_path}" target="_blank" >&nbsp;预览</a>
										</td>
									</tr>
								</c:forEach>
									<tr>
										<td style="text-align: center;"></td>
										<td style="text-align: center;"></td>
										<td style="text-align: center;"></td>
										<td style="text-align: center;"></td>
										<td style="text-align: center;"></td>
										<td style="text-align: center;">本年累计</td>
										<td style="text-align: center;">${total.total}</td>
										<td style="text-align: center;">
										</td>
									</tr>
						</c:when>
						<c:otherwise>
							    <tr>
									<td colspan="8" style="text-align: center;"><span style="color: #ff6a00">没有相关记录</span></td>
								</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			</div>
		</form>
			<!-- 分页开始 -->
			<form class="form-horizontal" action="" method="post" id="capForm" name="capForm">
				<input type="hidden" id="info_id" name="info_id" value="${pd.info_id}">
				<input type="hidden" name="toPage" value="${pageMap.toPage}">
				<div class="jianli">
				<table class="tableclass">
					<tr style="height:50px;"></tr>
					<tr>
						<td style="font-size: 18px;font-weight:700;">申请专线补助:</td>
						<td><input type="text" class="form-control" maxlength="10" value="${capital.dedicated_subsidy_capital}" onblur="changeFloat(this);" onkeyup="this.value=this.value.replace(/[^\d\.]/g,'')" id="dedicated_subsidy_capital" name="dedicated_subsidy_capital" style="width:100px;font-size: 18px;font-weight:700;height:28px;border-radius:0px;"></td>
						<td style="font-size: 18px;font-weight:700;">&nbsp;万元</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
				</div>
			</form>
			<div align="center">
				<div class="col-sm-2 col-sm-offset-2" style="margin-top: 40px;">
					<button type="button" onclick="update();" class="btn btn-success btn-block"style="width:170px">
						<span class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp;${pageMap.toText}
					</button>
				</div>
				<div class="col-sm-2 " style="margin-top: 40px;margin-left: 8px">
					<a onclick="GO('${pageMap.fromPage}');" class="btn btn-default btn-block">
						<span class="glyphicon glyphicon-circle-arrow-left"></span>&nbsp;&nbsp;上一步
					</a>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
		<jsp:include page="../../common/importExcel.jsp"></jsp:include>
	<div class="modal_h20 fade bs-example-modal-sm in" id="delline" data-toggle="modal" tabindex="-1" role="dialog"
			aria-labelledby="mySmallModalLabel" aria-hidden="false" data-target="">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" onclick="Clear()">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">提示</h4>
					</div>
					<div class="modal-body">
						<p id="warntext">您确定要删除吗？删除后不可恢复!</p>
					</div>
					<div class="modal-footer">
						<input type="hidden" id="id" value=""> 
						<input type="hidden" id="info_id" value="${pd.info_id}">
						<button type="button" class="btn btn-success" onclick="Delete()" data-dismiss="modal">确认</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="myApply" tabindex="-1" role="dialog" aria-labelledby="myApply" aria-hidden="true" data-backdrop="static">
		<form class="form-horizontal" role="form" id="docForm" name="docForm" action="" method="post" >	
			<input type="hidden" id="info_id" name="info_id" value="${pd.info_id}"/>		
   		 	<div class="modal-dialog modal-lg">
	        	<div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" onclick="Clear()"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		                <h4 class="modal-title" id="myModalLabel">专线说明资料</h4>
		            </div>
		            <div class="modal-body">
			            	<div class="form-group">
					<div class="col-sm-12">
						<table style="margin-left: 45px">
							<thead>
								<tr>
									<th style="width: 500px; text-align: left;">文件名</th>
									<th style="width: 200px; text-align: left;">操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td id="docName">${des.file_name}</td>
									<td>
										<c:if test="${des.file_name != null}">
											<a class='zview' id="pdfView" title="${des.file_name}"  href='javascript:void(0);' target='_blank' onclick="return viewPdf('${des.file_path}');">&nbsp;预览</a>
											<a class='delete' onclick="deleteZxsm('${des.id}')">&nbsp;删除</a>
										</c:if>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-sm-5" style="margin-left: 13%">
						<div class="caption" align="center" style="width: 100px;">
							<span id="file_uploadCon" class="btn btn-primary fileinput-button" style="margin-top: 20px;"> 
								<span>上传专线说明资料</span> 
								<input type="file" id="file_upload" name="file_upload" multiple />
							</span>
						</div>
						<div class="help-block" style="margin-top: 30px;">支持文件格式为.pdf</div>
					</div>
					<input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="file_path" maxlength="255" onblur="trim(this);" name="file_path" type="text" value="" />
					<input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="file_name" maxlength="255" onblur="trim(this);" name="file_name" type="text" value="" />
				</div>
					</div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-success" onclick="confirm()" >确认</button>
		                <button type="button" class="btn btn-default" onclick="Clear()" data-dismiss="modal">关闭</button>
		            </div>
	            </div>
	        </div>
	     </form>
	</div>
	<div class="modal fade" id="myContract" tabindex="-1" role="dialog" aria-labelledby="myContract" aria-hidden="true" data-backdrop="static">
		<form class="form-horizontal" role="form" id="conForm" name="conForm" action="" method="post" >	
			<input type="hidden" id="infoId" name="info_id" value="${pd.info_id}"/>		
   		 	<div class="modal-dialog modal-lg">
	        	<div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" onclick="Clear()"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		                <h4 class="modal-title" id="myModalLabel">服务合同</h4>
		            </div>
		            <div class="modal-body">
			            	<div class="form-group">
					<div class="col-sm-12">
						<!-- <div style="margin-left: 13%" id="doc_name"></div> -->
						<table style="margin-left: 45px">
							<thead>
								<tr>
									<th style="width: 500px; text-align: left;">文件名</th>
									<th style="width: 200px; text-align: left;">操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td id="doc_name">${con.file_name}</td>
									<td>
										<c:if test="${con.file_name != null}">
											<a class='zview' title="${con.file_name}" href="<%=basePath%>register/showPdf.act?pdfFile=${con.file_path}" target="_blank" >&nbsp;预览</a>
											<a class='delete' onclick="deletefwht('${con.id}')" id="deleted">&nbsp;删除</a>
										</c:if>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-sm-5" style="margin-left: 13%">
						<div class="caption" align="center" style="width: 100px;">
							<span id="fileUploadCon" class="btn btn-primary fileinput-button" style="margin-top: 20px;"> 
								<span>上传服务合同</span> 
								<input type="file" id="fileUpload" name="fileUpload" multiple />
							</span>
						</div>
						<div class="help-block" style="margin-top: 30px;">支持文件格式为.pdf</div>
					</div>
					<input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="filePath" name="file_path" maxlength="255" onblur="trim(this);" type="text" value="" />
					<input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="fileName" name="file_name" maxlength="255" onblur="trim(this);" type="text" value="" />
				</div>
					</div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-success" onclick="OK()" >确认</button>
		                <button type="button" class="btn btn-default" onclick="Clear()" data-dismiss="modal">关闭</button>
		            </div>
	            </div>
	        </div>
	     </form>
	</div>
	
		<div class="modal fade in" id="deledu" role="dialog"
		aria-labelledby="deledu" aria-hidden="false" data-backdrop="static">
		<div class="modal-dialog  modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" onclick="col()">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<h4>您确定要删除吗？删除后不可恢复！！</h4>
					<br> <br>
				</div>
				<input id="Conid" name="Conid" type="hidden" value="">
				<div class="modal-footer">
					<button id="EduButton" type="button" class="btn btn-success"
						onclick="delFwht()">确认</button>
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="col()">关闭</button>
					<input type="hidden" value="" id="delectinfoid">
				</div>
			</div>
		</div>
		<script type="text/javascript">
		//调用批量导入功能
		function upExcel(){
			var options = {
			        data:{info_id:$("#info_id").val(), alias:"specialLine"},
	 				getresult: function(data) {fileuploaddoneExcel();},
	 				fileNmae:"专线明细.xlsx",
	 				filePath:"templateFiles/specialLine.xlsx"
			 };
			fileuploadExcel(options);
		}
		
		//批量导入回调函数
		function fileuploaddoneExcel(){
			location.href = "<%=basePath%>line/list.act?info_id="+$("#info_id").val();
		}
		function col(){
			$("#deledu").attr("style","display:none");
			$("#deledu").modal('hide');
		}
			function delFwht(){
				var id =$("#delectinfoid").val();
				var info_id=$("#info_id").val();
				$.ajax({
					type : "POST",
					url :'<%=basePath%>line/deleteFwht.act',
						data : {
							id: id,
							info_id:info_id
						},
						dataType : 'json',
						cache : false,
						success : function(data) {
							$('#deledu').modal('hide');
							$("#deledu").attr("style","display;none;");
							location.reload();
						}
					});
				}
		</script>
	</div>
	<div class="modal fade in" id="delzxsm" role="dialog"
		aria-labelledby="deledu" aria-hidden="false" data-backdrop="static">
		<div class="modal-dialog  modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" onclick="colose()">
						<span aria-hidden="true" >×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<h4>您确定要删除吗？删除后不可恢复！！</h4>
					<br> <br>
				</div>
				<input id="Conid" name="Conid" type="hidden" value="">
				<div class="modal-footer">
					<button id="EduButton" type="button" class="btn btn-success"
						onclick="delZxsm()">确认</button>
					<button type="button" class="btn btn-default" onclick="colose()">关闭</button>
					<input type="hidden" value="" id="deleteZxsm">
				</div>
			</div>
		</div>
		<script type="text/javascript">
		function colose(){
			$("#delzxsm").attr("style","display:none");
			$("#delzxsm").modal('hide');
		}
			function delZxsm(){
				var id =$("#deleteZxsm").val();
				var info_id=$("#info_id").val();
				$.ajax({
					type : "POST",
					url :'<%=basePath%>line/deleteZxsm.act',
						data : {
							id: id,
							info_id:info_id
						},
						dataType : 'json',
						cache : false,
						success : function(data) {
							$('#delzxsm').modal('hide');
							$("#delzxsm").attr("style","display;none;");
							location.reload();
						}
					});
				}
		</script>
	</div>
	<%@ include file="../../common/footer.jsp"%>
	<script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
	<p id="back-to-top" style="display: block;">
		<a href="#top"><span></span></a>
	</p>
	<script src="shyl/js/jquery-1.7.2.js"></script>
	<script src="shyl/js/bootstrap.js"></script>
	
	<!-- 新追加部分 -->
	
		<script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
		<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
		<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
		<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
		<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
		<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
		<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
		<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
		<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
	<script type="text/javascript">	
		function Delete() {
	    	location.href = "<%=basePath%>line/delete.act?info_id="+ $("#info_id").val() + "&id="+ $("#id").val();
		}
	    
	    function del(id, divid) {
			$("#" + divid).attr("data-target", "#delline");
			$("#delline").attr("data-target", "");
			$("#id").val(id);
		}
	    
	    
	    function update(){
	    	if(check()){
	    		$("#capForm").attr('action','<%=basePath%>line/updateCapital.act');
				$("#capForm").submit();
	    	}
	    }
	    function deletefwht(id){
	    	$("#deledu").show();
	    	$("#delectinfoid").val(id);
	    }
	    function deleteZxsm(id){
	    	$("#delzxsm").show();
	    	$("#deleteZxsm").val(id);
	    }
	    function check(){
			if($("#dedicated_subsidy_capital").val() == ""){
				$("#dedicated_subsidy_capital").tips({
					side : 2,
					msg : "请输入专线补助",
					bg : '#AE81FF',
					time : 2
				});
				return false;
			}
			return true;
		}
	    
	    // 返回
	    function  GO(url) {
	        location.href = '<%=basePath%>'+url+'?info_id='+$("#info_id").val();
	    }
	</script>
	
	<script type="text/javascript">
	$(function() {
		$("#file_upload").fileupload({
			 autoUpload: true,
			 maxNumberOfFiles : 3,
			 url: '<%=basePath%>line/uploadline.act',
	         sequentialUploads: true
		 }).bind('fileuploadchange', function (e, data) {
			 if(data.files.length > 1){
				 $("#file_uploadCon").tips({
					 side : 2,
					 msg : "只能上传一个文件。",
					 bg : '#AE81FF',
					 time : 2
				 });
	            return false;
			 }
	     }).bind('fileuploaddone', function (e, data) {
	    	 if("no"==data.result){
		   		 $("#file_uploadCon").tips({
						 side : 2,
						 msg : "请上传格式为.pdf格式的文件。",
						 bg : '#AE81FF',
						 time : 2
					 });
		   		 return false;
		   	 } else {
		   		 $("#file_path").val(data.result);
		   		 $("#file_name").val(data.originalFiles[0].name);
		   		 $("#docName").text(data.originalFiles[0].name);
		   	 }
	     });
		
		$("#fileUpload").fileupload({
			 autoUpload: true,
			 maxNumberOfFiles : 3,
			 url: '<%=basePath%>line/uploadline.act',
	         sequentialUploads: true
		 }).bind('fileuploadchange', function (e, data) {
			 if(data.files.length > 1){
				 $("#fileUploadCon").tips({
					 side : 2,
					 msg : "只能上传一个文件。",
					 bg : '#AE81FF',
					 time : 2
				 });
	            return false;
			 }
	     }).bind('fileuploaddone', function (e, data) {
	    	 if("no"==data.result){
		   		 $("#fileUploadCon").tips({
						 side : 2,
						 msg : "请上传格式为.pdf格式的文件。",
						 bg : '#AE81FF',
						 time : 2
					 });
		   		 return false;
		   	 } else {
		   		 $("#filePath").val(data.result);
		   		 $("#fileName").val(data.originalFiles[0].name);
		   		 $("#doc_name").text(data.originalFiles[0].name);
		   	 }
	     });
	});
	</script>
		<script type="text/javascript">
		//专线明细说明
		function confirm(){
		 if(localcheck()){ 
			$("#docForm").attr('action','<%=basePath%>line/saveDes.act?');
			$("#docForm").submit();
		 } 
		}
		
		function localcheck(){
			if($("#file_path").val() == ""){
				$("#file_upload").tips({
					side : 2,
					msg : "请上传专线明细说明",
					bg : '#AE81FF',
					time : 2
				});
				return false;
			}
			return true;
		}
		//上传服务合同
		function OK(){
		 if(local()){ 
			$("#conForm").attr('action','<%=basePath%>line/saveCon.act?');
			$("#conForm").submit();
		 } 
		}
		function local(){
			if($("#filePath").val() == ""){
				$("#fileUpload").tips({
					side : 2,
					msg : "请上传服务合同",
					bg : '#AE81FF',
					time : 2
				});
				return false;
			}
			return true;
		}
		// 预览保险权益记录单
	    function viewPdf(path) {
			var ret=false;
	    	//通过Ajax向后台传值
			$.ajax({
				type : "POST",
				url :'<%=basePath%>'+'register/isExistsFile.act',
				data : {
					filePath : path
				},
				dataType : 'json',
				async:false, 
				success : function(data) {
					if(data=="1"){
						$("#pdfView").attr('href','<%=basePath%>'+'register/showPdf.act?pdfFile='+path);
						ret=true;
					}else{
						$('#my-modal-errorfile-alert').show ().delay (1000).fadeOut ();
					}
					
				}
			});
	    	return ret;
			
		}	</script>
</body>
</html>