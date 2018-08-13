<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>
<html>
<head>
<meta charset="utf-8">
<title></title>
<meta charset="UTF-8"/>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"/> -->
<link rel="stylesheet" href="/SHYL/shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/styleRegist.css">
<jsp:include page="../../common/header.jsp"></jsp:include>
<script src="/SHYL/shyl/js/datepicker/WdatePicker.js"
	type="text/javascript"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<style>
a{
    cursor: pointer;
    color: #333;
    }
.mypage_tab a:hover, a:focus {
	color: #333;
}
#docNameImpExcel li { 
	width: 50%; /*如果显示三列 则width改为30%*/ 
	float: left; 
	display: block; 
} 
.inputtxt2NNew {
    width: 275px;
    padding-left: 5px;
    border: 1px solid #ccc !important;
    line-height: 34px;
    height: 34px;
    border: 0;
    border-radius: 5px;
    font-size: 0.85em;
}
</style>
<script type="text/javascript">
var url=""

	//合并$(function(){});
var pictureindex = 0;
var pathArray=new Array();
var person=new Object();

	//合并$(function(){});
var fileindex = 0;
var pathArray=new Array();
var person=new Object();

$(function() {
	url='<%=basePath%>platform/shoreContractList.act';
	inserturl='<%=basePath%>platform/saveShoreContract.act';
	updateurl='<%=basePath%>platform/updateShoreCon.act';
	$("#listurl").val(url);
	$("#inserturl").val(inserturl);
	$("#updateurl").val(updateurl);
	$("title").html("收入汇总表_济南市服务外包公共服务平台"); 
	contractList($('.hd .on a').attr("data-var"));
	$('.hd li a').click(function(){
		contractList($(this).attr("data-var"));
		$('.hd li').removeClass('on');
	    $(this).parent().addClass('on');
	});
	$('#sEdu').on('hidden.bs.modal', function() {
		$("input[name='reportedu']").trigger("click");
	    });
	
	//合并$(function(){});
	updFile();
	$("#file_upload1").fileupload({
		 dataType :'json',
		 autoUpload: true,
		 maxNumberOfFiles :1,
         url: '<%=basePath%>platform/uploadContractFiles.act',
         sequentialUploads: true
	 }).bind('fileuploadchange', function (e, data) {
		 if(data.files.length > 1){
			 $("#file_upload1").tips({
				 side : 2,
				 msg : "一次最多上传一个pdf文件",
				 bg : '#AE81FF',
				 time : 2
			 });
             return false;
		 }
     }).bind('fileuploaddone', function (e, data) {
    	 if("no"==data.result.fileExtError){
    		 $("#file_upload1").tips({
				 side : 2,
				 msg : "请上传格式为.pdf格式的文档文件。",
				 bg : '#AE81FF',
				 time : 2
			 });
    		 return false;
    	 } else {
    		 
    		 $("#uploadFileId").val(data.result.OriginalFileName);
    		 $("#file_path1").val(data.result.filePath);
	           
    	 }
     });
	 $("#file_uploadExcel").fileupload({
		 dataType :'json',
		 autoUpload: true,
		 maxNumberOfFiles :1,
		 formData:{info_id:$("#info_id").val(),type_flag:2},
         url: '<%=basePath%>platform/uploadExcel.act',
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
    		 return false;
    	 }else if(data.result.errorList !=null && data.result.errorList.length>0){
    		 $("#errorList").show();
    		 $.each(data.result.errorList,function(index,item){
    			 if(index <10){
    				 $("#docNameImpExcel").append("<li>"+item+"</li>");
    			 }
    		 })
    	 } 
    	 else {
    		 $('#upExcel').modal('hide');
    		 $('#my-excel-success-alert').show().delay(1000).fadeOut ();
    		 contractList($('.hd .on a').attr("data-var"));
    	 }
     });

	
	 $("#file_upload2").fileupload({
		 dataType :'json',
		 autoUpload: true,
		 maxNumberOfFiles :1,
         url: '<%=basePath%>platform/uploadContractFiles.act',
         sequentialUploads: true
	 }).bind('fileuploadchange', function (e, data) {
		 if(data.files.length > 1){
			 $("#file_upload2").tips({
				 side : 2,
				 msg : "只能上传一个文件。",
				 bg : '#AE81FF',
				 time : 2
			 });
           return false;
		 }
     }).bind('fileuploaddone', function (e, data) {
    	 if("no"==data.result.fileExtError){
    		 $("#file_upload2").tips({
				 side : 2,
				 msg : "请上传格式为.pdf格式的文档文件。",
				 bg : '#AE81FF',
				 time : 2
			 });
           return false;
    	 } else {
    		 
    		 $("#fileUpd").val(data.result.OriginalFileName);
    		 $("#file_path2").val(data.result.filePath);
	           
    	 }
     });
});	
		 $("#weixin_image").fileupload({
			 dataType :'json',
			 autoUpload: true,
			 maxNumberOfFiles : 5,
	         url: '<%=basePath%>platform/Upload.act',
	         sequentialUploads: true
		 }).bind('fileuploadchange', function (e, data) {
			  if(data.files.length > 5){
				 alert("一次最多上传5张图片。")
	             return false;
			 } 
	     }).bind('fileuploaddone', function (e, data) {
	    	 if("SizeError"==data.result.fileSizError){
	    		 alert("请上传大小符合要求的文件");
	    		return false;
	    	 }else if("NO"==data.result.fileTypeError){
	    		 alert("请上传格式为.jpg/.jpeg/.png./gif格式的图片。");
	    		 $("#weixin_show").attr("src","<%=basePath%>shyl/images/temp.png");
	    	 } else {
	    		 var index = ++pictureindex;
	            $("#imagesID").append(html(data.result.imgPath,data.result.imgName,index));
	            var img=new Object();
	            img.id = index;
	            img.name=data.result.imgName;
	            img.path=data.result.imgPath;
	            pathArray.push(img);
	    	 }
	     });
			$('#promptModal').on('hidden.bs.modal', function() {
				$('#updDialog').modal('show');
			})
				 $("#file_upload").fileupload({
					 dataType :'json',
					 autoUpload: true,
					 maxNumberOfFiles :1,
			         url: '<%=basePath%>platform/uploadContractFiles.act',
			         sequentialUploads: true
				 }).bind('fileuploadchange', function (e, data) {
					 if(data.files.length > 1){
						 alert("一次最多上传1个文档");
			             return false;
					 }
			     }).bind('fileuploaddone', function (e, data) {
			    	 if("no"==data.result.fileExtError){
			    		 alert("请上传格式为.pdf格式的文档文件。");
			    	 } else {
			    		 var index = ++fileindex;
			    		 $("#fileID").append(uphtml(data.result.filePath,data.result.OriginalFileName,index));
				            var img=new Object();
				            img.id = index;
				            img.name=data.result.OriginalFileName;
				            img.path=data.result.filePath;
				            pathArray.push(img);
			    	 }
			     });
function contractList(years){
	$.ajax({
		type : "POST",
		url : $("#listurl").val(),
		data : {years:years,info_id:$("#info_id").val()},
		dataType : 'json',
		cache : false,
		success : function(data) {
			var List=data.contractlist;
			var pdCompany = data.pdCompany;
			$("#tbodyId").empty();
			for(var i=0;i<List.length;i++){
				var remarks;
				var contract_name;
				var contract_regist_no;
				var contract_no;
				if(List[i].remarks !=null && List[i].remarks.length>5){
					remarks = List[i].remarks.substring(0,5)+"..."; 
				}else{
					remarks = List[i].remarks!=null?List[i].remarks:""; 
				}
				if(List[i].contract_name.length>5){
					contract_name = List[i].contract_name.substring(0,5)+"..."; 
				}else{
					contract_name = List[i].contract_name; 
				}
				if(List[i].contract_regist_no.length>5){
					contract_regist_no = List[i].contract_regist_no.substring(0,5)+"..."; 
				}else{
					contract_regist_no = List[i].contract_regist_no; 
				}
				if(List[i].contract_no.length>5){
					contract_no = List[i].contract_no.substring(0,5)+"..."; 
				}else{
					contract_no = List[i].contract_no; 
				}
						$("#tbodyId").append("<tr align='left'>"
			                    +"<td style='text-align: center;'></td>"
			                    +"<td style='text-align: center;' title='"+List[i].contract_regist_no+"'>"+contract_regist_no+"</td>"
			                    +"<td style='text-align: center;' title='"+List[i].contract_no+"'>"+contract_no+"</td>"
			                    +"<td style='text-align: center;' title='"+List[i].contract_name+"'>"+contract_name+"</td>"
								+ "<td style='text-align: center;'>"
								+ List[i].currency_type
								+ "</td>"
			                    +"<td style='text-align: center;'>"+List[i].contract_money+"</td>"
			                    +"<td style='text-align: center;'>"+List[i].export_money+"</td>"
			                    +"<td style='text-align: center;'><a data-toggle='modal' data-target='#eEdu' onclick='eduUpdate("+List[i].id+")'class='modify'>修改</a><a data-toggle='modal' data-target='#deledu' onclick='delCon("+List[i].id+")' class='delete'>删除</a><a  id='view"+List[i].id+"' href='javascript:void(0);' target='_blank' onclick='return view(view"+List[i].id+","+List[i].id+");' class='zview'>预览</a></td>"
			                    +"</tr>");
						$('#tbodyId  tr:eq('+i+') td:first').text(i+1);
			}
			var totalRow1 = 0 
			$('#tbodyId tr').each(function() { 
			$(this).find('td:eq(5)').each(function(){ 
			totalRow1 += parseFloat($(this).text()); 
			}); 
			});
			var totalRow2 = 0 
			$('#tbodyId tr').each(function() { 
				$(this).find('td:eq(6)').each(function(){ 
				totalRow2 += parseFloat($(this).text()); 
				}); 
				});
			if(List.length>0){
				$("#tbodyId").append("<tr align='left'>"
	                    +"<td style='text-align: center;'>合计</td>"
	                    +"<td></td>"
	                    +"<td></td>"
	                    +"<td></td>"
	                    +"<td></td>"
	                    +"<td style='text-align: center;'>"+totalRow1+"</td>"
	                    +"<td style='text-align: center;'>"+totalRow2+"</td>"

	                    +"<td></td>"
	                    +"</tr>");
			}
			else{
				$("#tbodyId").append("<tr>"
	                    +"<td colspan='8' style='text-align: center;'><span style='color: #ff6a00'>没有相关记录</span></td>"
	                    +"</tr>");
			}
			
			return false;
		},
	});	
}
    // 预览合同
    function view(pdf_id,info_id) {
    	var ret=false;
		$.ajax({
			type : "POST",
			url : '<%=basePath%>/platform/viewPdf.act',
			dataType : 'json',
			data : {
				id : info_id,
			},
			cache : false,
			async: false,
			success : function(data) {
				if(data.responseStr=="OK"){
					var path=data.responsePath;
					$("#view"+info_id).attr('href','<%=basePath%>register/showPdf.act?pdfFile='+path);
					ret=true;
				} else {
					$('#my-modal-success-alert').show ().delay (1000).fadeOut ();
					ret=false;
				}
			}
		});
		return ret; 
	}
    //预览审计报告
    function sjbg(pdf_id,info_id) {
    	var ret=false;
		$.ajax({
			type : "POST",
			url : '<%=basePath%>platform/shoreSjbgPdf.act',
			dataType : 'json',
			data : {
				id : info_id,
			},
			cache : false,
			async: false,
			success : function(data) {
				if(data.responseStr=="OK"){
					var path=data.responsePath;
					$("#view"+info_id).attr('href','<%=basePath%>register/showPdf.act?pdfFile='+path);
					ret=true;
				} else {
					$('#my-modal-success-alert').show ().delay (1000).fadeOut ();
					ret=false;
				}
			}
		});
		return ret; 
	}
  //预览委托合同
    function wtht(pdf_id,info_id) {
    	var ret=false;
		$.ajax({
			type : "POST",
			url : '<%=basePath%>/platform/shoreWthtPdf.act',
			dataType : 'json',
			data : {
				id : info_id,
			},
			cache : false,
			async: false,
			success : function(data) {
				if(data.responseStr=="OK"){
					var path=data.responsePath;
					$("#vie"+info_id).attr('href','<%=basePath%>register/showPdf.act?pdfFile='+path);
					ret=true;
				} else {
					$('#my-modal-success-alert').show ().delay (1000).fadeOut ();
					ret=false;
				}
			}
		});
		return ret; 
	}
    //隐藏审计报告预览删除
  function hidesjbg(){
    	var filename=$("#dddd").attr("filename");
    	var fildd=$("#apply_report_namesj").val();
   		$("#finame").html(fildd);
   	 	$("#sc a").attr("data-target","#delSjBg");
   	 	$("#sc a").attr("onclick","deleteSjBg('${pg.id}')");
    	if(filename!=null&&filename!=""){
    		$("#xg").show();
    		$("#sc").show();
    	}
    }
    function hidewtht(){
    	var filename=$("#ssss").attr("filename");
    	var fildd=$("#apply_report_namewtht").val();
   		$("#wtfiname").html(fildd);
   	 	$("#wtsc a").attr("data-target","#delWtht");
   	 	$("#wtsc a").attr("onclick","delWtht('${pt.id}')");
    	if(filename!=null&&filename!=""){
    		$("#wtxg").show();
    		$("#wtsc").show();
    	}
    }
</script>
</head>
<body style="background-color: #f7f7f7;">
<input type="hidden" value="${pd.contryflag}" id="contry">
<input type="hidden" value="" id="listurl">
<input type="hidden" value="" id="inserturl">
<input type="hidden" value="" id="updateurl">
<input type="hidden" value="${lastYear}" id="lastYear">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param value="2" name="menuType"/></jsp:include>
		<div class="mypage_right">
			<h2>收入汇总表</h2>
			<div class="mypage_tab" style="width: 80%" id="years">
				<div class="hd">
					<ul>
						<li class="on" id="years15"><a href="javascript:void(0);" data-var="${previousYear}">${previousYear}年度</a></li>
						<li id="years16" style=""><a href="javascript:void(0);" data-var="${lastYear}">${lastYear}年度
						</a></li>
					</ul>
				</div>
			</div>
			<div class="mypage_tab" style="width: 80%;display: none;" id="contryyea">
				<div class="hd">
					<ul>
						<li class="on" id="years15"><a href="javascript:void(0);" data-var="${previousYear}">国家级</a></li>
						
						</a></li>
					</ul>
				</div>
			</div>
			<p class="pull-right">
				<a data-toggle="modal" data-target="#upExcel" onclick="upExcel();"
					class="btn btn-link hover"><span
					class="btn btn-primary1 fileinput-button"> <span>批量导入</span>
				</span> </a>
				<a data-toggle="modal" data-target="#ssj"
					class="btn btn-link hover"><span
					class="btn btn-primary1 fileinput-button" onclick="hidesjbg()"> <span>上传审计报告</span>
				</span> </a>
					<a data-toggle="modal" data-target="#wtht"
					class="btn btn-link hover"><span
					class="btn btn-primary1 fileinput-button" onclick="hidewtht()"> <span>上传委托合同</span>
				</span> </a>
				<a data-toggle="modal" data-target="#sEdu"
					class="btn btn-link hover"><span
					class="btn btn-primary1 fileinput-button"> <span>添加新合同</span>
				</span> </a>
			</p>
			<div class="jianli">
				<input type="hidden" id="info_id" name="info_id"
					value="${pd.info_id}" />
				<table class="tableclass">
					<thead>
						<tr class="active">
							<th style="width: 7%; text-align: center;">ID</th>
							<th style="width: 13%; text-align: center;">合同登记证书号</th>
							<th style="width: 13%; text-align: center;">合同号</th>
							<th style="width: 14%; text-align: center;">合同名</th>
							<th style="width: 9%; text-align: center;">货币类型</th>
							<th style="width: 9%; text-align: center;">合同金额（万美元）</th>
							<th style="width: 9%; text-align: center;">实际出口额（万美元）</th>
							<th style="width: 22%; text-align: center;">操作</th>
						</tr>
					</thead>
					<tbody id="tbodyId">
					</tbody>
				</table>
			</div>
			<div>
				<div class="col-sm-2 col-sm-offset-2" style="margin-top: 20px;">
					<button type="button" onclick="OK('${pageMap.toPage}');"
						class="btn btn-success btn-block" style="width:170px">
						<span class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp;${pageMap.toText}
					</button>
				</div>
				<div class="col-sm-2" style="margin-top: 20px;margin-left:8px">
					<a onclick="GO('${pageMap.fromPage}');" class="btn btn-default btn-block"><span
						class="glyphicon glyphicon-circle-arrow-left"></span>&nbsp;&nbsp;上一步</a>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	 function OK(url) {
	        location.href = '<%=basePath%>'+url+'?info_id='+$("#info_id").val();
	    }
	 // 返回
    function  GO(url) {
        location.href = '<%=basePath%>'+url+'?info_id='+$("#info_id").val();
    }
	</script>
	<jsp:include page="../../common/importExcel.jsp"></jsp:include>
	<div class="modal fade bs-example-modal-sm in" id="sEdu" role="dialog"
		aria-labelledby="sEdu" aria-hidden="false" data-backdrop="static">
		<form action="" id="test1">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							添加合同<small>（&nbsp;<span class="red_tip">*</span>为必填项&nbsp;）
							</small>
						</h4>
					</div>
					<div class="modal-body">
						<div class="form_table_box">
							<table class="table">
								<tbody>
									<tr>
										<th style="width: 195px"><span class="red_tip">*</span>合同登记证书号：</th>
										<td colspan="3"><input class="form-control"
											data-val="true" data-val-length="长度<50"
											data-val-length-max="50" data-val-required="*"
											id="certificateNo" name="certificateNo" type="text"
											placeholder="请输入合同登记证书号" maxlength="30"></td>
									</tr>
									<tr>
										<th style="width: 195px"><span class="red_tip">*</span>合同号：</th>
										<td><input class="form-control" data-val="true"
											data-val-length="长度<50" data-val-length-max="50"
											data-val-required="*" id="contractNo" name="contractNo"
											type="text" placeholder="请输入合同号" maxlength="30"></td>

									</tr>
									<tr>
										<th style="width: 195px"><span class="red_tip">*</span>合同名称：</th>
										<td><input class="form-control" data-val="true"
											data-val-length="长度<50" data-val-length-max="50"
											data-val-required="*" id="contractName" name="contractName"
											type="text" placeholder="请输入合同名称" maxlength="30"></td>
									</tr>
									<tr>
										<th style="width: 195px"><span class="red_tip">*</span>货币类型：</th>
										<td><select class="inputtxt2NNew" name="currency_type"id="currency_type">
												<c:forEach items="${currencyList}" var="type">
													<option value="${type.DISTINGUISH_ID}" >${type.VALUE}</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<th style="width: 195px"><span class="red_tip">*</span>合同金额（万美元）：</th>
										<td><input class="form-control" data-val="true"
											data-val-length="长度<50" data-val-length-max="50"
											data-val-required="*" id="contractMoney" name="contractMoney"
											type="text" placeholder="请输入合同金额（万美元）只允许为数字" maxlength="10" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"></td>
									</tr>
									<tr>
										<th style="width: 195px"><span class="red_tip">*</span>实际出口额（万美元）：</th>
										<td><input class="form-control" data-val="true"
											data-val-length="长度<50" data-val-length-max="50"
											data-val-required="*" id="exportVolume" name="exportVolume"
											type="text" placeholder="请输入实际出口额（万美元）只允许为数字" maxlength="10" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"></td>
									</tr>
									<tr>
										<th>备注：</th>
										<td><input class="form-control" data-val="true"
											data-val-length="长度<50" data-val-length-max="50"
											data-val-required="*" id="remarks" name="remarks"
											placeholder="请输入备注(最多15个字)" maxlength="15"></td>
									</tr>
									<tr>
										<th><span class="red_tip">*</span>合同名：</th>
										<td><input id="uploadFileId" class="form-control" data-val="true" readonly></td>
									</tr>
								</tbody>
							</table>
							<span id="file_upload1" class="btn btn-primary fileinput-button"
								style="margin-top:5px; margin-left:220px"> <span>上传本地合同</span>
								<input type="file" id="file_upload1" name="file_upload1" multiple>
								<input type="hidden" id="file_path1" name="file_path1">
							</span>
							<div class="help-block" style="margin-top:5px;margin-left:220px; color: #818590;">支持的文件格式为.pdf</div>
						</div>
					</div>
					<div class="modal-footer">
						<button id="EduButtonedu" type="button" class="btn btn-success"
							onclick="certificateSave()" data-toggle="modal">确认</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
			<input type="reset" style="display: none;" name="reportedu">
		</form>
	</div>
	<!-- 上传审计报告 -->
	<div class="modal_h20 fade in" id="ssj" role="dialog"
			aria-labelledby="adoptModal" aria-hidden="false" data-backdrop="static">
			
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							审计报告上传<small> </small>
						</h4>
					</div>
					<form class="form-horizontal" role="form" action="" method="post"
						id="form1" name="form1">
						<table class="table">
							<tbody>
								<tr>
									<th style="width: 195px"><span class="red_tip">*</span>审计报告：</th>
									<td>
										<div class="row">
											<div class="col-md-12">
												<div>
													<div class="form-group">
														<div class="col-sm-12">
															<ul id="docName" style="float: left;">
															<li id="dddd" filename="${pg.file_name}">
															<span id="finame">${pg.file_name}</span>
															<span style="display: none;" id="xg"><a id="view${pg.id}" href='javascript:void(0);' target='_blank' onclick="return sjbg('view${pg.id}','${pg.id}');" class='zview'>预览</a></span>
															<span style="display: none;" id="sc"><a data-toggle="modal" data-target="#delSjBg" onclick="deleteSjBg('${pg.id}')" class="delete">删除</a></span>
															</li>
															</ul>
														</div>
														<div class="col-sm-5" style="margin-left: 7%">
															<div class="caption" align="center" style="width: 100px;">
																<span id="file_uploadCon"
																	class="btn btn-primary fileinput-button"
																	style="margin-top: 20px;"> <span>上传审计报告</span> <input
																	type="file" id="file_uploadCon" name="file_uploadCon" multiple />
																</span>
															</div>
															<div style="margin-top:5px; color: #818590;">支持的文件格式为.pdf</div>
														</div>
														<input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="apply_report_pathsj" name="apply_report_path" type="text" value="${pg.file_path}" />
														<input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="apply_report_namesj" name="apply_report_name" type="text" value="${pg.file_name}" />
													</div>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="modal-footer">
							<button id="EduButton" type="button" class="btn btn-success"
								onclick="updateSjFile()">确认</button>
							<button type="button" class="btn btn-default" onclick="clear()"
								data-dismiss="modal">关闭</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
			<!-- 上传委托合同 -->
	<div class="modal_h20 fade in" id="wtht" role="dialog"
			aria-labelledby="adoptModal" aria-hidden="false" data-backdrop="static">
			
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							委托合同 上传<small> </small>
						</h4>
					</div>
					<form class="form-horizontal" role="form" action="" method="post"
						id="form1" name="form1">
						<table class="table">
							<tbody>
								<tr>
									<th style="width: 195px"><span class="red_tip">*</span>委托合同 ：</th>
									<td>
										<div class="row">
											<div class="col-md-12">
												<div>
													<div class="form-group">
														<div class="col-sm-12">
															<ul id="docNamewtht" style="float: left;">
															<li id="ssss" filename="${pt.file_name}">
															<span id="wtfiname">${pt.file_name}</span>
															<span id="wtxg" style="display: none;"><a  id="vie${pt.id}" href='javascript:void(0);' target='_blank' onclick="return wtht('vie${pt.id}','${pt.id}');" class='zview'>预览</a></span>
															<span id="wtsc" style="display: none;"><a data-toggle="modal" data-target="#delWtht" onclick="delWtht('${pt.id}')" class="delete">删除</a></span>
															</li>
															</ul>
														</div>
														<div class="col-sm-5" style="margin-left: 7%">
															<div class="caption" align="center" style="width: 100px;">
																<span id="file_uploadwtht"
																	class="btn btn-primary fileinput-button"
																	style="margin-top: 20px;"> <span>上传委托合同 </span> <input
																	type="file" id="file_uploadwtht" name="file_uploadwtht" multiple />
																</span>
															</div>
															<div style="margin-top:5px; color: #818590;">支持的文件格式为.pdf</div>
														</div>
														<input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="apply_report_pathwtht" name="apply_report_pathwtht" type="text" value="${pt.file_path}" />
														<input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="apply_report_namewtht" name="apply_report_pathwtht" type="text" value="${pt.file_name}" />
													</div>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="modal-footer">
							<button id="EduButton" type="button" class="btn btn-success"
								onclick="updateWthtFile()">确认</button>
							<button type="button" class="btn btn-default" onclick="Clear()"
								data-dismiss="modal">关闭</button>
						</div>
					</form>
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
		<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
		<script type="text/javascript">

	//调用批量导入功能
	function upExcel(){
		//年度
		var years=$("div.hd li.on a").attr("data-var");
		var options = {
		        url:'<%=basePath%>govUploadCommon/uploadExcel.act',
		        data:{info_id:$("#info_id").val(),type_flag:2,years:years,alias:"offshoreIncome"},
 				getresult: function(data) {fileuploaddoneExcel();},
 				fileNmae:"收入汇总表.xlsx",
 				filePath:"templateFiles/offshoreIncome.xlsx"
		 };
		fileuploadExcel(options);
	}
	//批量导入回调函数
	function fileuploaddoneExcel(){
		location.href = "<%=basePath%>org/shoreReport.act?info_id="+$("#info_id").val();
	}
	function Clear() {
		 $("#errorList").hide();
	}
	//审计报告
	function updFile(id){
		$("#updid").val(id);
		}
	$("#file_uploadCon").fileupload({
		 autoUpload: true,
		 maxNumberOfFiles : 3,
		 url: '<%=basePath%>platform/uploadSjBc.act',
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
	   		 $("#apply_report_pathsj").val(data.result);
	   		 var path=$("#apply_report_pathsj").val();
	   		 $("#apply_report_namesj").val(data.originalFiles[0].name);
	   		 //$("#dddd").prepend(data.originalFiles[0].name);
	   		 $("#dddd").attr("value",data.originalFiles[0].name);
	   		 $("#view").attr('href','<%=basePath%>register/showPdf.act?pdfFile='+path);
	   		 $("#view").attr("onclick","");
	   		 $("#xg").show();
	   		 $("#sc").show();
	   		 $("#finame").text(data.originalFiles[0].name);
	   		 $("#sc a").attr("onclick","htmlsjbg()");
	   	 }
    });
	//删除审计报告
	function htmlsjbg(){
		$("#sc a").attr("data-target","");
		$("#finame").html("");
		 $("#xg").hide();
   		 $("#sc").hide();
   		 var fildd=$("#apply_report_namesj").val();
   		$("#apply_report_namesj").val("");
   		// $("#filename").html(fildd);
	}
	function htmlwtht(){
		$("#wtsc a").attr("data-target","");
		$("#wtfiname").html("");
		 $("#wtxg").hide();
   		 $("#wtsc").hide();
   		 var fildd=$("#apply_report_namewtht").val();
   		$("#apply_report_namewtht").val("");
   		 //$("#wtfiname").html(fildd);
	}
	
	//委托合同
	$("#file_uploadwtht").fileupload({
		 autoUpload: true,
		 maxNumberOfFiles : 3,
		 url: '<%=basePath%>platform/uploadSjBc.act',
        sequentialUploads: true
	 }).bind('fileuploadchange', function (e, data) {
		 if(data.files.length > 1){
			 $("#file_uploadwtht").tips({
				 side : 2,
				 msg : "只能上传一个文件。",
				 bg : '#AE81FF',
				 time : 2
			 });
           return false;
		 }
    }).bind('fileuploaddone', function (e, data) {
   	 if("no"==data.result){
	   		 $("#file_uploadwtht").tips({
					 side : 2,
					 msg : "请上传格式为.pdf格式的文件。",
					 bg : '#AE81FF',
					 time : 2
				 });
	   		 return false;
	   	 } else {
	   		 $("#apply_report_pathwtht").val(data.result);
	   		 var path=$("#apply_report_pathwtht").val();
	   		 $("#apply_report_namewtht").val(data.originalFiles[0].name);
	   		 $("#docNamewtht").val(data.originalFiles[0].name);
	   		 $("#ssss").attr("value",data.originalFiles[0].name);
	   		 //$("#ssss").prepend(data.originalFiles[0].name);
	   		 $("#vie").attr('href','<%=basePath%>'+path);
	   		 $("#vie").attr("onclick","");
	   		 $("#wtxg").show();
	   		 $("#wtsc").show();
	   		 $("#wtfiname").text(data.originalFiles[0].name);
	   		 $("#wtsc a").attr("onclick","htmlwtht()");
	   	 }
    });
	function updateSjFile(){
		//取得所有上传图片的文件名
	    //var filePaths = new Array();
		//取得所有上传合同的路径
		var adoptPath = $("#apply_report_pathsj").val();
		//取得所有上传合同的文件名
		var adoptNm = $("#apply_report_namesj").val();
		//信息ID
		var info_id=$("#info_id").val();
		// 有效证件验证
		// 合同验证
		if (adoptPath == "") {
			$("#dddd").tips({
				side : 2,
				msg : '请选择审计报告',
				bg : '#AE81FF',
				time : 2
			});
			
			return false;
		}
		//通过Ajax向后台传值
		$.ajax({
			type : "POST",
			url : '<%=basePath%>platform/upLoadShoreSjFile.act',
			data : {
				adoptPath : adoptPath,
				adoptNm : adoptNm,
				info_id:info_id,
				file_type:12
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				if ("success" == data.result) {
					$('#adoptModal').modal('hide');
					location.reload();
				} else {
					$('#adoptModal').modal('hide');
					location.reload();
					alert("该用户已经审核通过");
				} 
			}
		});
	}
    function updateWthtFile(){
		//取得所有上传图片的文件名
	    //var filePaths = new Array();
		//取得所有上传合同的路径
		var adoptPath = $("#apply_report_pathwtht").val();
		//取得所有上传合同的文件名
		var adoptNm = $("#apply_report_namewtht").val();
		//信息ID
		var info_id=$("#info_id").val();
		// 有效证件验证
		// 合同验证
		if (adoptPath == "") {
			$("#ssss").tips({
				side : 2,
				msg : '请选择委托合同',
				bg : '#AE81FF',
				time : 2
			});
			return false;
		}
		//通过Ajax向后台传值
		$.ajax({
			type : "POST",
			url : '<%=basePath%>platform/upLoadShoreWthtFile.act',
			data : {
				adoptPath : adoptPath,
				adoptNm : adoptNm,
				info_id:info_id,
				file_type:13
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				if ("success" == data.result) {
					$('#adoptModal').modal('hide');
					location.reload();
				} else {
					$('#adoptModal').modal('hide');
					location.reload();
					alert("该用户已经审核通过");
				} 
			}
		});
	}
   
	</script>
	<script type="text/javascript">
				function certificateSave() {
					//年度
					var years=$("div.hd li.on a").attr("data-var");
					//合同登记证书号
					var certificateNo=$("#certificateNo").val();
					//合同号
					var contractNo=$("#contractNo").val();
					//合同名称
					var contractName=$("#contractName").val();
					// 货币类型
					var currency_type = $("#currency_type").val();
					//合同金额（万美元）
					var contractMoney=$("#contractMoney").val();
					//实际出口额（万美元）
					var exportVolume=$("#exportVolume").val();
					//备注
					var remarks=$("#remarks").val();
					//合同名
					var file_path=$("#file_path1").val();
					var file_name=$("#uploadFileId").val();
					var info_id=$("#info_id").val();
					if(valiteCert()){
					
					$.ajax({
						type : "POST",
						url :$("#inserturl").val(),
						data : {
							years:years,
							contract_regist_no:certificateNo,
							contract_no: contractNo,
							contract_name:contractName,
							currency_type:currency_type,
							contract_money:contractMoney,
							export_money:exportVolume,
							remarks:remarks,
							file_name:file_name,
							file_path:file_path,
							info_id:info_id
						},
						dataType : 'json',
						cache : false,
						success : function(data) {
							 $('#sEdu').modal('hide');
							var List=data.contractlist;
							if($("#tbodyId").find("tr").length>0){
								$("#tbodyId").find("tr").remove();
							}
                           reloadAjax(List);
							$("input[name='reportedu']").trigger("click");
							
						}
					});
					}
			}
				function valiteCert(){
					//合同登记证书号
					var certificateNo=$("#certificateNo").val();
					if (certificateNo == "") {
						$("#certificateNo").tips({
							side : 2,
							msg : '请输入合同登记证书号',
							bg : '#AE81FF',
							time : 3
						});
						$("#certificateNo").focus();
						return false;
					}
					//合同号
					var contractNo=$("#contractNo").val();
					if (contractNo == "") {
						$("#contractNo").tips({
							side : 2,
							msg : '请输入合同号',
							bg : '#AE81FF',
							time : 3
						});
						$("#contractNo").focus();
						return false;
					}
					//合同名称
					var contractName=$("#contractName").val();
					if (contractName == "") {
						$("#contractName").tips({
							side : 2,
							msg : '请输入合同名称',
							bg : '#AE81FF',
							time : 3
						});
						$("#contractName").focus();
						return false;
					}
					//合同金额（万美元）
					var contractMoney=$("#contractMoney").val();
					if (contractMoney == "") {
						$("#contractMoney").tips({
							side : 2,
							msg : '请输入合同金额（万美元）',
							bg : '#AE81FF',
							time : 3
						});
						$("#contractMoney").focus();
						return false;
					} else{
						//var PsdFilter = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
						var PsdFilter = /^\d{0,7}(\.\d{0,2})?$/;
						var PsdFilter1 = /^\d*\.?\d{0,2}$/;
						if(!(PsdFilter1.test(contractMoney))){
							$("#contractMoney").tips({
								side : 2,
								msg : '金额必须大于0且小数位数不超过2位',
								bg : '#AE81FF',
								time : 3
							});
							$("#contractMoney").focus();
							return false;
						}
							if (!(PsdFilter.test(contractMoney))) {
								$("#contractMoney").tips({
									side : 2,
									msg : '最大值不能超过9999999.99',
									bg : '#AE81FF',
									time : 3
								});
								$("#contractMoney").focus();
								return false;
							}
						
					}
					//实际出口额（万美元）
					var exportVolume=$("#exportVolume").val();
					if (exportVolume== "") {
						$("#exportVolume").tips({
							side : 2,
							msg : '请输入实际出口额（万美元）',
							bg : '#AE81FF',
							time : 3
						});
						$("#exportVolume").focus();
						return false;
					}else{
						//var PsdFilter = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
						var PsdFilter = /^\d{0,7}(\.\d{0,2})?$/;
						var PsdFilter1 = /^\d*\.?\d{0,2}$/;
						if(!(PsdFilter1.test(exportVolume))){
							$("#exportVolume").tips({
								side : 2,
								msg : '金额必须大于0且小数位数不超过2位',
								bg : '#AE81FF',
								time : 3
							});
							$("#exportVolume").focus();
							return false;
						}
						if (!(PsdFilter.test(exportVolume))) {
							$("#exportVolume").tips({
								side : 2,
								msg : '最大值不能超过9999999.99',
								bg : '#AE81FF',
								time : 3
							});
							$("#exportVolume").focus();
							return false;
							
						}
						
				}
					//合同名称
					var file_name=$("#uploadFileId").val();
					if (file_name == "") {
						$("#uploadFileId").tips({
							side : 2,
							msg : '请选择合同名称',
							bg : '#AE81FF',
							time : 3
						});
						$("#uploadFileId").focus();
						return false;
					}
					return true;
				}		
				</script>
	<!-- 添加合同结束 -->
	<!-- 修改合同加载数据 开始-->
	<script type="text/javascript">
			//模态框初始加载合同
				function eduUpdate(id) {
					
					$.ajax({
						type : "POST",
						url : '<%=basePath%>platform/selectContract.act',
							data : {
								id : id
							},
							dataType : 'json',
							cache : false,
							success : function(data) {
								var id = data.id;
								var contract_regist_no=data.contract_regist_no;
								var contract_no=data.contract_no;
								var contract_name=data.contract_name;
								var currency_type = data.currency_type;
								var contract_money=data.contract_money;
								var export_money=data.export_money;
								var remarks=data.remarks;
								var file_path=data.file_path;
								var file_name= data.file_name;
								$("#cerid").val(id);
								$("#certificateNoUpd").val(contract_regist_no);
								$("#contractNoUpd").val(contract_no);
								$("#contractNameUpd").val(contract_name);
								$("#currencyTypeUpd").val(currency_type);
								$("#contractMoneyUpd").val(contract_money);
								$("#exportVolumeUpd").val(export_money);
								$("#remarksUpd").val(remarks);
								$("#fileUpd").val(file_name);
								$("#file_path2").val(file_path);
								
							}
						});
					}
				</script>
	<!-- 修改合同加载数据结束 -->
	<!-- 修改合同模态框开始 -->
	<div class="modal fade in" id="eEdu" role="dialog"
		aria-labelledby="eEdu" aria-hidden="false" data-backdrop="static">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						修改合同<small>（&nbsp;<span class="red_tip">*</span>为必填项&nbsp;）
						</small>
					</h4>
				</div>
				<div class="modal-body">
					<div class="form_table_box">
						<table class="table">
							<tbody>
								<tr>
									<th style="width: 195px"><span class="red_tip">*</span>合同登记证书号：</th>
									<td colspan="3"><input class="form-control"
										data-val="true" data-val-length="长度<50"
										data-val-length-max="50" data-val-required="*"
										id="certificateNoUpd" name="certificateNoUpd" type="text"
										value="" placeholder="请输入合同登记证书号" maxlength="50"></td>
								</tr>
								<tr>
									<th style="width: 195px"><span class="red_tip">*</span>合同号：</th>
									<td><input class="form-control" data-val="true"
										data-val-length="长度<50" data-val-length-max="50"
										data-val-required="*" id="contractNoUpd" name="contractNoUpd"
										type="text" value="" placeholder="请输入合同号" maxlength="50"></td>

								</tr>
								<tr>
									<th style="width: 195px"><span class="red_tip">*</span>合同名称：</th>
									<td><input class="form-control" data-val="true"
										data-val-length="长度<50" data-val-length-max="50"
										data-val-required="*" id="contractNameUpd"
										name="contractNameUpd" type="text" value=""
										placeholder="请输入合同名称" maxlength="50"></td>
								</tr>
								<tr>
									<th style="width: 195px"><span class="red_tip">*</span>货币类型：</th>
									<td><select class="inputtxt2NNew" name="currencyTypeUpd"id="currencyTypeUpd">
									<!-- TODO暂时只显示【美元】类型 -->
												<c:forEach items="${currencyList}" var="type">
												<c:if test="${type.DISTINGUISH_ID == 2}">
													<option value="${type.DISTINGUISH_ID}">${type.VALUE}</option>
												</c:if>
												</c:forEach>
											</select>
									</td>
								</tr>
								<tr>
									<th style="width: 195px"><span class="red_tip">*</span>合同金额（万美元）：</th>
									<td><input class="form-control" data-val="true"
										data-val-length="长度<50" data-val-length-max="50"
										data-val-required="*" id="contractMoneyUpd"
										name="contractMoneyUpd" type="text" value=""
										placeholder="请输入合同金额（万美元）只允许为数字" maxlength="10" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"></td>
								</tr>
								<tr>
									<th style="width: 195px"><span class="red_tip">*</span>实际出口额（万美元）：</th>
									<td><input class="form-control" data-val="true"
										data-val-length="长度<50" data-val-length-max="50"
										data-val-required="*" id="exportVolumeUpd"
										name="exportVolumeUpd" type="text" value=""
										placeholder="请输入实际出口额（万美元）只允许为数字" maxlength="10" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"></td>
								</tr>
								<tr>
									<th>备注：</th>
									<td><input class="form-control" data-val="true"
										data-val-length="长度<50" data-val-length-max="50"
										data-val-required="*" id="remarksUpd" name="remarksUpd"
										type="text" value="" placeholder="请输入备注(最多15个字)" maxlength="15"></td>
								</tr>
								<tr>
									<th><span class="red_tip">*</span>相关资料：</th>
									<td><input id="fileUpd" name="fileUpd" class="form-control" data-val="true"
										readonly></td>
								</tr>
							</tbody>		
						</table>
							<span id="file_upload" class="btn btn-primary fileinput-button"
								style="margin-top:5px; margin-left:220px"> <span>上传相关资料</span>
								<input type="file" id="file_upload2" name="file_upload2" multiple>
								<input type="hidden" id="file_path2" name="file_path2">
							</span>
							<div class="help-block" style="margin-top:5px;margin-left:220px">支持的文件格式为.pdf</div>
					</div>
					<input id="cerid" name="cerid" type="hidden" value="">
											
				</div>
				<div class="modal-footer">
					<button id="EduButton" type="button" class="btn btn-success"
						onclick="updateCon()">确认</button>
					<button type="button" class="btn btn-default" onclick="Clear()"
						data-dismiss="modal">关闭</button>
				</div>
<script type="text/javascript" src="shyl/js/jquery.validate.js"></script>
	<script src="shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
	<script src="shyl/fileupload/js/jquery.fileupload.js"></script>
	<script src="shyl/fileupload/js/jquery.fileupload-process.js"></script>
	<script src="shyl/fileupload/js/jquery.fileupload-validate.js"></script>
	<script src="shyl/fileupload/js/jquery.iframe-transport.js"></script>

				<script type="text/javascript">
			//模态框初始加载合同
				function delCon(id) {
					$("#delectinfoid").val(id);
					}
				</script>
				<script type="text/javascript" src="shyl/js/jquery.tips.js"></script>
				<script type="text/javascript">
						function updateCon(){
							//年度
							var years=$("div.hd li.on a").attr("data-var");
							var id = $("#cerid").val();
							var contract_regist_no = $("#certificateNoUpd").val();
							var contract_no = $("#contractNoUpd").val();
							var contract_name = $("#contractNameUpd").val();
							var currency_type = $("#currencyTypeUpd").val();
							var contract_money = $("#contractMoneyUpd").val();
							var export_money = $("#exportVolumeUpd").val();
						    var remarks = $("#remarksUpd").val();
						    var file_path = $("#file_path2").val();
				    		 var file_name = $("#fileUpd").val();
						  //信息ID
							var info_id=$("#info_id").val();
							if (contract_regist_no == "") {
								$("#certificateNoUpd").tips({
									side : 2,
									msg : '请输入合同登记证书号',
									bg : '#AE81FF',
									time : 3
								});
								$("#certificateNoUpd").focus();
								return false;
							}
							
							if (contract_no == "") {
								$("#contractNoUpd").tips({
									side : 2,
									msg : '请输入合同号',
									bg : '#AE81FF',
									time : 3
								});
								$("#contractNoUpd").focus();
								return false;
							}
	
							if (contract_name == "") {
								$("#contractNameUpd").tips({
									side : 2,
									msg : '请输入合同名称',
									bg : '#AE81FF',
									time : 3
								});
								$("#contractNameUpd").focus();
								return false;
							}
							if (file_name == "") {
								$("#fileUpd").tips({
									side : 2,
									msg : '请选择上传文件',
									bg : '#AE81FF',
									time : 3
								});
								$("#fileUpd").focus();
								return false;
							}
							if (currency_type == "") {
								$("#currencyTypeUpd").tips({
									side : 2,
									msg : '请选择货币类型',
									bg : '#AE81FF',
									time : 3
								});
								$("#currencyTypeUpd").focus();
								return false;
							}
							
							if (contract_money == "") {
								$("#contractMoneyUpd").tips({
									side : 2,
									msg : '请输入合同金额（万美元）',
									bg : '#AE81FF',
									time : 3
								});
								$("#contractMoneyUpd").focus();
								return false;
							}else {              
								//var PsdFilter = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
								var PsdFilter = /^\d{0,7}(\.\d{0,2})?$/;
								var PsdFilter1 = /^\d*\.?\d{0,2}$/;
								if(!(PsdFilter1.test(contract_money))){
									$("#contractMoneyUpd").tips({
										side : 2,
										msg : '金额必须大于0且小数位数不超过2位',
										bg : '#AE81FF',
										time : 3
									});
									$("#contractMoneyUpd").focus();
									return false;
								}
							if (!(PsdFilter.test(contract_money))) {
								$("#contractMoneyUpd").tips({
									side : 2,
									msg : '最大值不能超过9999999.99',
									bg : '#AE81FF',
									time : 3
								});
								$("#contractMoneyUpd").focus();
								return false;
							}
						}
						if (export_money == "") {
							$("#exportVolumeUpd").tips({
								side : 2,
								msg : '请输入实际出口额（万美元）',
								bg : '#AE81FF',
								time : 3
							});
							$("#exportVolumeUpd").focus();
							return false;
						}else {
							//var PsdFilter = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
							var PsdFilter = /^\d{0,7}(\.\d{0,2})?$/;
							var PsdFilter1 = /^\d*\.?\d{0,2}$/;
							if(!(PsdFilter1.test(export_money))){
								$("#exportVolumeUpd").tips({
									side : 2,
									msg : '金额必须大于0且小数位数不超过2位',
									bg : '#AE81FF',
									time : 3
								});
								$("#exportVolumeUpd").focus();
								return false;
							}
							if (!(PsdFilter.test(export_money))) {
								$("#exportVolumeUpd").tips({
									side : 2,
									msg : '最大值不能超过9999999.99',
									bg : '#AE81FF',
									time : 3
								});
								$("#exportVolumeUpd").focus();
								return false;
							}
						}
						$.ajax({
							type : "POST",
							url : $("#updateurl").val(),
								data : {
									info_id:info_id,
									years:years,
									id:id,
									contract_regist_no:contract_regist_no,
									contract_no: contract_no,
									contract_name:contract_name,
									currency_type:currency_type,
									contract_money:contract_money,
									export_money:export_money,
									remarks:remarks,
									file_path:file_path,
									file_name:file_name
								},
								dataType : 'json',
								cache : false,
								success : function(data) {
									console.log(data);
									var List = data.contractlist;
									if($("#tbodyId").find("tr").length>0){
										$("#tbodyId").find("tr").remove();
									}
		                           reloadAjax(List);
								$('#eEdu').modal('hide');
								}
							});	
						}
						</script>
			</div>
		</div>
	</div>
	<!-- 修改合同模态框结束-->
	<!--上传文件模态框开始-->
	<div class="modal fade in" id="updDialog" role="dialog"
		aria-labelledby="updDialog" aria-hidden="false" data-backdrop="static">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						附件上传<small> </small>
					</h4>
				</div>
				<form class="form-horizontal" role="form" action="" method="post"
					id="form1" name="form1">
					<div class="row">
						<div class="col-md-12">
							<div>
								<div class="form-group" id="businessDiv">
									<div class="col-sm-12">

										<ul id="imagesID" style="overflow: hidden">

										</ul>
									</div>
									<div class="col-sm-5" style="margin-left: 7%">
										<div class="caption" align="center" style="width: 100px;">
											<span id="weixin_upload"
												class="btn btn-primary fileinput-button"
												style="margin-top: 20px;"> <span>上传本地图片</span> <input
												type="file" id="weixin_image" name="weixin_image" multiple />
											</span>
										</div>
										<div class="help-block" style="margin-top: 30px; color: #818590;">支持的文件格式为.jpg、.png、.jpeg、.gif</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-body">
						<input id="updid" name="updid" type="hidden" value="">

					</div>
					<div class="modal-footer">
						<button id="EduButton" type="button" class="btn btn-success"
							onclick="updateFile()">确认</button>
						<button type="button" class="btn btn-default" onclick="Clear()"
							data-dismiss="modal">关闭</button>
					</div>
				</form>
				<script src="shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
				<script src="shyl/fileupload/js/jquery.fileupload.js"></script>
				<script src="shyl/fileupload/js/jquery.fileupload-process.js"></script>
				<script src="shyl/fileupload/js/jquery.fileupload-validate.js"></script>
				<script src="shyl/fileupload/js/jquery.iframe-transport.js"></script>

				<script type="text/javascript">

				function html(src,imgName,index){
					var html='<li style="display:inline-block; padding:15px 14px">';
					html+='<img src="<%=basePath%>'+src+'" name="weixin_show" style="width:170px; margin-left: 20px;" data-holder-rendered="true"/><br/>'
					 if(imgName.length >9){
						 var name = imgName.substring(0,9); 
					html+='<p title="'+imgName+'" style="display:block;width:180px; padding-left:20px">'+name+'...</p>';
					 }else{
						 html+='<p title="'+imgName+'" style="display:block;width:180px; padding-left:20px">'+imgName+'</p>';
					 }
					html+='<input id="flie_path" data-val="true"  name="ConImg" type="hidden" value="'+src+'" />';
					html+='<a style="margin-left:20px;" onclick="deleteLocalPicture('+index+')" class="delete">删除</a>';
					html+='</li>';
					return html;
					
				}
				function deleteLocalPicture(index){
					for (var i =0;i<pathArray.length;i++) {
						if (index == pathArray[i].id) {
							pathArray.splice(i,1);
							break;
						}
					}
					$("#imagesID").children().remove();
					for (var j =0;j<pathArray.length;j++) {
						$("#imagesID").append(html(pathArray[j].path,pathArray[j].name,pathArray[j].id));
					}
				}
			    //模态框初始加载合同
				function updFile(id){
					$("#updid").val(id);
					}
				function deleteSjBg(id){
					 //删除审计报告
						$("#defauinfo_id").val(id);
				}
				function delWtht(id){
					$("#defauwthtinfo_id").val(id);
				}
				</script>
				<script type="text/javascript">
						function updateFile(){
						//取得上传图片对应的数据ID
						var id = $("#updid").val();
						//取得所有上传图片的文件名
					    var filePaths = new Array();
						$("#imagesID input[name=ConImg]").each(
								function(i) {
									filePaths[i]=$(this).val();
								});
						
						//通过Ajax向后台传值
						$.ajax({
							type : "POST",
							url : '<%=basePath%>platform/upLoadFile.act',
							data : {
								id : id,
								file_paths :JSON.stringify(pathArray)
							},
							dataType : 'json',
							cache : false,
							success : function(data) {
								$('#updDialog').modal('hide');
								location.reload();
							}
						});
					}
				</script>
			</div>
		</div>
	</div>
	<!--上传文件模态框结束-->
	<!-- 删除合同模态框开始 -->
	<div class="modal fade in" id="deledu" role="dialog"
		aria-labelledby="deledu" aria-hidden="false" data-backdrop="static">
		<div class="modal-dialog  modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
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
						onclick="Delete()">确认</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<input type="hidden" value="" id="delectinfoid">
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
						function Delete(){
							//年度
							var years=$("div.hd li.on a").attr("data-var");
							//信息ID
							var info_id=$("#info_id").val();
							var id =$("#delectinfoid").val();
							$.ajax({
								type : "POST",
								url :'<%=basePath%>platform/deleteCon.act',
				data : {
					years:years,
					info_id:info_id,
					id : id
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
					var List = data.contractlist;
					if($("#tbodyId").find("tr").length>0){
						$("#tbodyId").find("tr").remove();
					}
                    reloadAjax(List);
					$('#deledu').modal('hide');
				}
			});
		}
	</script>
	<!-- 删除合同模态框框结束 -->
	<!-- 删除审计报告模态框开始 -->
	<div class="modal fade in" id="delSjBg" role="dialog"
		aria-labelledby="deledu" aria-hidden="false" data-backdrop="static">
		<div class="modal-dialog  modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" onclick="colosesjbg()">
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
						onclick="delSjBg()" data-dismiss="modal">确认</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<input type="hidden" value="" id="defauinfo_id">
				</div>
			</div>
		</div>
		<script type="text/javascript">
		function delSjBg(){
			var id =$("#defauinfo_id").val();
			$.ajax({
				type : "POST",
				url :'<%=basePath%>platform/deleteShoreSjBg.act',
					data : {
						id: id
					},
					dataType : 'json',
					cache : false,
					success : function(data) {
						$('#delSjBg').modal('hide');
						$("#apply_report_namesj").val("");
						location.reload();
					}
				});
			}
		function colosesjbg(){
			$('#delSjBg').modal('hide');
		}
		</script>
	</div>
	<!-- 删除委托合同 -->
	<div class="modal fade in" id="delWtht" role="dialog"
		aria-labelledby="deledu" aria-hidden="false" data-backdrop="static">
		<div class="modal-dialog  modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" onclick="colosewtht()">
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
					<button id="wthtbutton" type="button" class="btn btn-success"
						onclick="delWTHT()" data-dismiss="modal">确认</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<input type="hidden" value="" id="defauwthtinfo_id">
				</div>
			</div>
		</div>
		<script type="text/javascript">
		function delWTHT(){
			var id =$("#defauwthtinfo_id").val();
			$.ajax({
				type : "POST",
				url :'<%=basePath%>platform/deleteShoreWtHt.act',
					data : {
						id: id
					},
					dataType : 'json',
					cache : false,
					success : function(data) {
						$('#delWtht').modal('hide');
						$("#apply_report_namewtht").val("");
						location.reload();
					}
				});
			}
		function colosewtht(){
			$('#delWtht').modal('hide');
		}
		</script>
	</div>
	<!-- 提示上传信息模态框（Modal）开始 -->
	<div class="modal fade in" id="promptModal" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">上传文件温馨提示</h4>
				</div>
				<div class="modal-body">
					支持的文件<font color="red">小于1MB</font><br /> 支持的文件格式为<font color="red">.jpg、.png、.jpeg、.gif</font><br />
					<br />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 提示上传信息模态框（Modal）结束 -->
	<!--上传文件模态框开始-->
	<div class="modal fade in" id="uploadFileModal" role="dialog"
		aria-labelledby="uploadFileModal" aria-hidden="false" data-backdrop="static">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						合同上传<small> </small>
					</h4>
				</div>
				<form class="form-horizontal" role="form" action="" method="post"
					id="form1" name="form1">
					<div class="row">
						<div class="col-md-12">
							<div>
								<div class="form-group" id="businessDiv">
									<div class="col-sm-10">
										<table style="margin-left:45px">
											<thead>
												<tr>
													<th style="width:500px; text-align: left;">文件名</th>
													<th style="width:200px; text-align: left;">操作</th>
												</tr>
											</thead>
											<tbody id="fileID">
											</tbody>
										</table>
									</div>
									<div class="col-sm-5" style="margin-left: 7%">
										<div class="caption" align="center" style="width: 100px;">
											<span id="file_upload"
														class="btn btn-primary fileinput-button" style="margin-top: 15px; margin-left: -40px"> <span>上传本地文档</span>
														<input type="file" id="file_upload" name="file_upload1"
														multiple>
														 <input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="apply_report_path" name="apply_report_path" type="text" value="${pd.apply_report_path}" />
														 <input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="apply_report_name" name="apply_report_name" type="text" value="${pd.apply_report_name}" />
														</span>
										</div>
										<div class="help-block" style="margin-top: 30px;">支持的文件格式为.pdf</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-body">
						<input id="uploadid" name="uploadid" type="hidden" value="">
					</div>
					<div class="modal-footer">
						<button id="EduButton" type="button" class="btn btn-success"
							onclick="updateFile()">确认</button>
						<button type="button" class="btn btn-default" onclick="Clear()"
							data-dismiss="modal">关闭</button>
					</div>
				</form>
				<script src="shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
				<script src="shyl/fileupload/js/jquery.fileupload.js"></script>
				<script src="shyl/fileupload/js/jquery.fileupload-process.js"></script>
				<script src="shyl/fileupload/js/jquery.fileupload-validate.js"></script>
				<script src="shyl/fileupload/js/jquery.iframe-transport.js"></script>

				<script type="text/javascript">		
				function uphtml(filePath,OriginalFileName,index){
					var html='<tr>';
					 if(OriginalFileName.length >30){
						 var name = OriginalFileName.substring(0,30); 
					html+='<td title="'+OriginalFileName+'">'+name+'...</td>';
					 }else{
						 html+='<td title="'+OriginalFileName+'">'+OriginalFileName+'</td>';
					 }
					html+='<input id="flie_path" data-val="true"  name="ConFile" type="hidden" value="'+filePath+'" />';
					html+='<td class="delete"><a onclick="deleteLocalFile('+index+')">删除</a><a onclick="deleteLocalFile('+index+')">预览</a></td>';
					html+='</tr>';
					return html;
				}
				function deleteLocalFile(index){
					for (var i =0;i<pathArray.length;i++) {
						if (index == pathArray[i].id) {
							pathArray.splice(i,1);
							break;
						}
					}
					$("#fileID").children().remove();
					for (var j =0;j<pathArray.length;j++) {
						$("#fileID").append(uphtml(pathArray[j].path,pathArray[j].name,pathArray[j].id));
					}
				}
			    //模态框初始加载合同
				function uploadContractFile(id){
					$("#uploadid").val(id);
					//通过Ajax向后台传值
					$.ajax({
						type : "POST",
						url : '<%=basePath%>platform/selectContractFile.act',
						data : {
							id : id
						},
						dataType : 'json',
						cache : false,
						success : function(data) {
							$("#fileID").children().remove();
							var uploadlist=data.uploadlist;
							for(var i=0;i<uploadlist.length;i++){
								if(uploadlist[i].file_path!=null && uploadlist[i].file_path!=""){
								$("#fileID").append(uploadhtml(uploadlist[i].id,uploadlist[i].file_path));
					}
							}	
						}
					});
					}
				function uploadhtml(id,filepath){
					var html='<tr>';
					 if(filepath.length >30){
						 var name = filepath.substring(0,30); 
					html+='<td title="'+filepath+'">'+name+'...</td>';
					 }else{
						 html+='<td title="'+filepath+'">'+filepath+'</td>';
					 }
					html+='<input id="flie_path" data-val="true"  name="ConFile" type="hidden" value="'+id+'" />';
					html+='<td onclick="deleteUploadFile('+id+')" class="delete"><a>删除</a><a onclick="deleteLocalFile('+id+')">预览</a></td>';
					html+='</tr>';
					return html;
				}
				function deleteUploadFile(id){
					//通过Ajax向后台传值
					$.ajax({
						type : "POST",
						url : '<%=basePath%>platform/deleteUploadFile.act',
						data : {
							id : id
						},
						dataType : 'json',
						cache : false,
						success : function(data) {
							$("#fileID").children().remove();
							var uploadlist=data.uploadlist;
							for(var i=0;i<uploadlist.length;i++){
								if(uploadlist[i].file_path!=null && uploadlist[i].file_path!=""){
								$("#fileID").append(uploadhtml(uploadlist[i].id,uploadlist[i].file_path));
								}
					         }
						}
					});
				}
				</script>
				<script type="text/javascript">
						function updateFile(){
						//取得上传图片对应的数据ID
						var id = $("#uploadid").val();
						//取得所有上传图片的文件名
					    var filePaths = new Array();
						$("#fileID input[name=ConFile]").each(
								function(i) {
									filePaths[i]=$(this).val();
								});
						//通过Ajax向后台传值
						$.ajax({
							type : "POST",
							url : '<%=basePath%>platform/upLoadContractFile.act',
							data : {
								id : id,
								file_paths :JSON.stringify(pathArray)
							},
							dataType : 'json',
							cache : false,
							success : function(data) {
								$('#updDialog').modal('hide');
								location.reload();
							}
						});
					}
				</script>
			</div>
		</div>
	</div>
		
	<div class='modal my-modal-alert' id='my-modal-success-alert'>
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:260px;text-align:center;position:fixed;right:40%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/mark.png">&nbsp;&nbsp;预览文件不存在!
                    </div>
                </div>
            </div>
        </div>
  <script type="text/javascript">
  function reloadAjax(List){
  for(var i=0;i<List.length;i++){
	  var remarks;
		var contract_name;
		var contract_regist_no;
		var contract_no;
		if(List[i].remarks !=null && List[i].remarks.length>5){
			remarks = List[i].remarks.substring(0,5)+"..."; 
		}else{
			remarks = List[i].remarks!=null?List[i].remarks:""; 
		}
		if(List[i].contract_name.length>5){
			contract_name = List[i].contract_name.substring(0,5)+"..."; 
		}else{
			contract_name = List[i].contract_name; 
		}
		if(List[i].contract_regist_no.length>5){
			contract_regist_no = List[i].contract_regist_no.substring(0,8)+"..."; 
		}else{
			contract_regist_no = List[i].contract_regist_no; 
		}
		if(List[i].contract_no.length>5){
			contract_no = List[i].contract_no.substring(0,8)+"..."; 
		}else{
			contract_no = List[i].contract_no; 
		}
		$("#tbodyId").append("<tr align='left'>"
              +"<td style='text-align: center;'></td>"
              +"<td style='text-align: center;' title='"+List[i].contract_regist_no+"'>"+contract_regist_no+"</td>"
              +"<td style='text-align: center;' title='"+List[i].contract_no+"'>"+contract_no+"</td>"
              +"<td style='text-align: center;' title='"+List[i].contract_name+"'>"+contract_name+"</td>"
				+ "<td style='text-align: center;'>"
				+ List[i].currency_type
				+ "</td>"
              +"<td style='text-align: center;'>"+List[i].contract_money+"</td>"
              +"<td style='text-align: center;'>"+List[i].export_money+"</td>"
              +"<td style='text-align: center;'><a data-toggle='modal' data-target='#eEdu' onclick='eduUpdate("+List[i].id+")'class='modify'>修改</a><a data-toggle='modal' data-target='#deledu' onclick='delCon("+List[i].id+")' class='delete'>删除</a><a  id='view"+List[i].id+"' href='javascript:void(0);' target='_blank' onclick='return view(view"+List[i].id+","+List[i].id+");' class='zview'>预览</a></td>"
              +"</tr>");
		$('#tbodyId  tr:eq('+i+') td:first').text(i+1);
		
}
  var totalRow1 = 0 
	$('#tbodyId tr').each(function() { 
	$(this).find('td:eq(5)').each(function(){ 
	totalRow1 += parseFloat($(this).text()); 
	}); 
	});
	var totalRow2 = 0 
	$('#tbodyId tr').each(function() { 
		$(this).find('td:eq(6)').each(function(){ 
		totalRow2 += parseFloat($(this).text()); 
		}); 
		}); 
	if(List.length>0){
		$("#tbodyId").append("<tr align='left'>"
                +"<td style='text-align: center;'>合计</td>"
                +"<td></td>"
                +"<td></td>"
                +"<td></td>"
                +"<td></td>"
                +"<td style='text-align: center;'>"+totalRow1+"</td>"
                +"<td style='text-align: center;'>"+totalRow2+"</td>"
               
                +"<td></td>"
                +"</tr>");
	}
	else{
		$("#tbodyId").append("<tr>"
                +"<td colspan='8' style='text-align: center;'><span style='color: #ff6a00'>没有相关记录</span></td>"
                +"</tr>");
	}
  }
  </script>
	<!--上传文件合同模态框结束-->
	<div class="clear"></div>
	<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
</html>
