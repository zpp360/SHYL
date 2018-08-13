var locat;
$(function() {
	locat=document.getElementsByTagName('base')[0].href;
	var lastYear = $("#lastYear").val();
	var previousYear = $("#previousYear").val();
	if(previousYear!=""){
		$("#years").css('display','block');
		$("#title").html("离岸外包扶持资金申请（年度收入汇总表）"); 
	}else{
		$("#title").html("在岸外包扶持资金申请（"+lastYear+"年度收入汇总表）"); 
		$("title").html(lastYear+"年度入汇总表_济南市服务外包人才公共服务平台"); 
	}
	$('.hd li a').click(function() {
		$('.hd li').removeClass('on');
		$(this).parent().addClass('on');
		var info_id = $("#info_id").val();
		var year = $('.hd .on a').attr("data-var");
		var lastYear = $("#lastYear").val();
		var previousYear = $("#previousYear").val();
		$.ajax({
			type : "POST",
			url : locat+"municipalUploadCommon/municipalSumLastYear.act",
			data : {
				info_id :info_id,
				year:year
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
	            // 文件类型：离岸收入汇总表合同目录
	            $("#certificate_type").val(data.pd.certificate_type);
	            // 文件类型：离岸收入汇总表合同内容
	            $("#expense_type").val(data.pd.expense_type);
	            // 文件类型：涉外离岸收入汇总表结汇目录
	            $("#contract_type").val(data.pd.contract_type);
	            // 文件类型：涉外离岸收入汇总表结汇内容
	            $("#settlement_type").val(data.pd.settlement_type);
				 var certificatePd = data.certificatePd;
				 var expensePdList = data.expensePdList;
		         var contractPd = data.contractPd;
		         var settlementPdList = data.settlementPdList;
		         //合同目录
		         $("#certificateFileId").empty();
		         //涉外目录
		         $("#contractFileId").empty();
		         //合同内容
		         $("#fileID").empty();
		         //涉外目录
				$("#fileID1").empty();
				if(data.certificatePd!=null && data.certificatePd!=""){
				var file_path = data.certificatePd.file_path;
				var file_name= data.certificatePd.file_name;
				var index = data.certificatePd.id;
				$("#certificateFileId").empty();
				$("#certificateFileId").append(htmlAppend(file_name,index,file_path));
				}else{
					$("#certificateFileId")
					.append("<tr><td colspan='2' style='text-align: center;'><span style='color: #ff6a00'>没有相关记录</span></td></tr>");
				}
				if(data.contractPd!=null && data.contractPd!=""){
					var file_path = data.contractPd.file_path;
					var file_name= data.contractPd.file_name;
					var index = data.contractPd.id;
					$("#contractFileId").empty();
					$("#contractFileId").append(htmlAppend(file_name,index,file_path));
				}
				else{
					$("#contractFileId")
					.append("<tr><td colspan='2' style='text-align: center;'><span style='color: #ff6a00'>没有相关记录</span></td></tr>");
				}
				//合同内容
				if(expensePdList.length > 0){
					reloadAjaxData(expensePdList,1);
				}else{
					$("#fileID")
					.append("<tr><td colspan='2' style='text-align: center;'><span style='color: #ff6a00'>没有相关记录</span></td></tr>");
				}
				//涉外内容
				if(settlementPdList.length > 0){
					reloadAjaxData(settlementPdList,2);
				}else{
				$("#fileID1")
				.append("<tr><td colspan='2' style='text-align: center;'><span style='color: #ff6a00'>没有相关记录</span></td></tr>");
			}
			
			}
		});
	});
	$("#file_upload1")
			.fileupload({
				autoUpload : true,
				maxNumberOfFiles : 1,
				url : locat+'platform/uploadSjBc.act',
				sequentialUploads : true
			})
			.bind('fileuploadchange', function(e, data) {
				if (data.files.length > 1) {
					$("#file_upload1").tips({
						side : 2,
						msg : "只能上传一个文件。",
						bg : '#AE81FF',
						time : 2
					});
					return false;
				}
			})
			.bind('fileuploadprogress', function(e, data) {
				progress('progress1', data);
			})
			.bind(
					'fileuploaddone',
					function(e, data) {
						if ("no" == data.result) {
							$("#file_upload1").tips({
								side : 2,
								msg : "请上传格式为.pdf格式的文件。",
								bg : '#AE81FF',
								time : 2
							});
							progressError('progress1');
							return false;
						} else if ("nosize" == data.result) {
							$("#file_upload1").tips({
								side : 2,
								msg : "请上传小于150MB的文件。",
								bg : '#AE81FF',
								time : 2
							});
							return false;
						} else {
							 $("#certificatePath").val(data.result);
					   		 // 设定pdf名称
					   		 $("#pdfName").val(data.originalFiles[0].name);
					   		 var path=$("#pdfPath").val();
							// 设定pdf路径
							var pdfPath = data.result;
							// 设定pdf名称
							var pdfName = data.originalFiles[0].name;
							//文件类型
							var certificate_type = $("#certificate_type").val();
							//info_id
							var info_id = $("#info_id").val();
							// 通过Ajax向后台传值
							$.ajax({
										type : "POST",
										url : locat+"municipalUploadCommon/saveSingleUpLoadFileAjax.act",
										data : {
											pdfPath : pdfPath,
											pdfName : pdfName,
											file_type : certificate_type,
											info_id :info_id
										},
										dataType : 'json',
										cache : false,
										success : function(data) {
											$("#certificateFileId").empty();
											$('#progress1 .bar').text('完成').parent().fadeOut(3000);
											if(data.certificatePd!=null && data.certificatePd!=""){
											var file_path = data.certificatePd.file_path;
											var file_name= data.certificatePd.file_name;
											var index = data.certificatePd.id;
											$("#certificateFileId").append(htmlAppend(file_name,index,file_path));
											}
										},error:function(){
											progressError('progress2');
										}
									});
						}
					});
	$("#file_upload2").fileupload({
		autoUpload : true,
		maxNumberOfFiles : 1,
		url : locat+'platform/uploadSjBc.act',
		sequentialUploads : true
	}).bind('fileuploadchange', function(e, data) {
		if (data.files.length > 1) {
			$("#file_upload2").tips({
				side : 2,
				msg : "只能上传一个文件。",
				bg : '#AE81FF',
				time : 2
			});
			return false;
		}
	}).bind('fileuploadprogress', function(e, data) {
		progress('progress2', data);
	}).bind('fileuploaddone', function(e, data) {
		if ("no" == data.result) {
			$("#file_upload2").tips({
				side : 2,
				msg : "请上传格式为.pdf格式的文件。",
				bg : '#AE81FF',
				time : 2
			});
			progressError('progress2');
			return false;
		} else if ("nosize" == data.result) {
			$("#file_upload2").tips({
				side : 2,
				msg : "文件已超过150MB，请分开上传。",
				bg : '#AE81FF',
				time : 2
			});
			progressError('progress2');
			return false;
		} else {
			// 设定pdf路径
			$("#pdfPath").val(data.result);
			// 设定pdf名称
			$("#pdfName").val(data.originalFiles[0].name);
			var path = $("#pdfPath").val();
			// 通过Ajax向后台传值
			$.ajax({
				type : "POST",
				url : locat+"municipalUploadCommon/saveUpLoadFileAjax.act",
				data : {
					pdfPath : $("#pdfPath").val(),
					pdfName : $("#pdfName").val(),
					file_type : $("#expense_type").val(),
					info_id : $("#info_id").val()
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
					$('#progress2 .bar').text('完成').parent().fadeOut(3000);
					$("#fileID").empty();
					var List = data.expensePdList; 
					if(List.length > 0){
						for (var i = 0; i < List.length; i++) {
							var file_name ;
							if (List[i].file_name.length > 30) {
								file_name = List[i].file_name.substring(0,
										30)
										+ "...";
							} else {
								file_name = List[i].file_name;
							}
							$("#fileID")
							.append(htmlAppend(List[i].file_name,List[i].id,List[i].file_path));
						}
					}else{
						$("#fileID")
						.append("<tr><td colspan='2' style='text-align: center;'><span style='color: #ff6a00'>没有相关记录</span></td></tr>");
					}
				},error:function(){
					progressError('progress2');
				}
			});
		}
	});
	$("#file_upload3")
			.fileupload({
				autoUpload : true,
				maxNumberOfFiles : 1,
				url : locat+'platform/uploadSjBc.act',
				sequentialUploads : true
			})
			.bind('fileuploadchange', function(e, data) {
				if (data.files.length > 1) {
					$("#file_upload3").tips({
						side : 2,
						msg : "只能上传一个文件。",
						bg : '#AE81FF',
						time : 2
					});
					return false;
				}
			})
			.bind('fileuploadprogress', function(e, data) {
				progress('progress3', data);
			})
			.bind(
					'fileuploaddone',
					function(e, data) {
						if ("no" == data.result) {
							$("#file_upload3").tips({
								side : 2,
								msg : "请上传格式为.pdf格式的文件。",
								bg : '#AE81FF',
								time : 2
							});
							progressError('progress3');
							return false;
						} else if ("nosize" == data.result) {
							$("#file_upload3").tips({
								side : 2,
								msg : "请上传小于150MB的文件。",
								bg : '#AE81FF',
								time : 2
							});
							return false;
						} else {
							 $("#contractPath").val(data.result);
							// 通过Ajax向后台传值
							var pdfPath = data.result;
							var pdfName = data.originalFiles[0].name;
							var contract_type = $("#contract_type").val();
							var info_id = $("#info_id").val();
							$.ajax({
										type : "POST",
										url : locat+"municipalUploadCommon/saveSingleUpLoadFileAjax.act",
										data : {
											pdfPath : pdfPath,
											pdfName : pdfName,
											file_type :contract_type ,
											info_id :info_id
										},
										dataType : 'json',
										cache : false,
										success : function(data) {
											$("#contractFileId").empty();
											$('#progress3 .bar').text('完成').parent().fadeOut(3000);
											if(data.certificatePd!=null && data.certificatePd!=""){
												var file_path = data.certificatePd.file_path;
												var file_name= data.certificatePd.file_name;
												var index = data.certificatePd.id;
												$("#contractFileId").append(htmlAppend(file_name,index,file_path));
												}
										},error:function(){
											progressError('progress2');
										}
									});
						}
					});
	$("#file_upload4").fileupload({
		autoUpload : true,
		maxNumberOfFiles : 1,
		url : locat+'platform/uploadSjBc.act',
		sequentialUploads : true
	}).bind('fileuploadchange', function(e, data) {
		if (data.files.length > 1) {
			$("#file_upload4").tips({
				side : 2,
				msg : "只能上传一个文件。",
				bg : '#AE81FF',
				time : 2
			});
			return false;
		}
	}).bind('fileuploadprogress', function(e, data) {
		progress('progress4', data);
	}).bind('fileuploaddone', function(e, data) {
		if ("no" == data.result) {
			$("#file_upload4").tips({
				side : 2,
				msg : "请上传格式为.pdf格式的文件。",
				bg : '#AE81FF',
				time : 2
			});
			progressError('progress4');
			return false;
		} else if ("nosize" == data.result) {
			$("#file_upload4").tips({
				side : 2,
				msg : "文件已超过150MB，请分开上传。",
				bg : '#AE81FF',
				time : 2
			});
			progressError('progress4');
			return false;
		} else {
            var pdfPath = data.result;
            var pdfName = data.originalFiles[0].name;
            var settlement_type = $("#settlement_type").val();
            var info_id = $("#info_id").val();
			// 通过Ajax向后台传值
			$.ajax({
				type : "POST",
				url : locat+"municipalUploadCommon/saveUpLoadFileAjax.act",
				data : {
					pdfPath : pdfPath,
					pdfName : pdfName,
					file_type : settlement_type,
					info_id : info_id
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
					$('#progress4 .bar').text('完成').parent().fadeOut(3000);
					$("#fileID1").empty();
					var List = data.expensePdList; 
					if(List.length > 0){
						for (var i = 0; i < List.length; i++) {
							var file_name ;
							if (List[i].file_name.length > 30) {
								file_name = List[i].file_name.substring(0,
										30)
										+ "...";
							} else {
								file_name = List[i].file_name;
							}
							$("#fileID1")
							.append(htmlAppend(List[i].file_name,List[i].id,List[i].file_path));
						}
					}else{
						$("#fileID1")
						.append("<tr><td colspan='2' style='text-align: center;'><span style='color: #ff6a00'>没有相关记录</span></td></tr>");
					}
				},error:function(){
					progressError('progress2');
				}
			});
		}
	});
});

// 预览PDF
function viewPdf(id) {
	var path;
		path = $("#ViewPath"+id).val();
	$("#view"+id).attr('href',"javascript:void(0);");
	var ret = false;
	// 通过Ajax向后台传值
	$.ajax({
		type : "POST",
		url : locat+'register/isExistsFile.act',
		data : {
			filePath : path
		},
		dataType : 'json',
		async : false,
		success : function(data) {
			if (data == "1") {
					$("#view"+id).attr('href',locat+ 'register/showPdf.act?pdfFile='+ path);
				ret = true;
			} else {
				$('#my-modal-errorfile-alert').show().delay(1000).fadeOut();
			}
		}
	});
	return ret;
}

function OK() {
	$("#form1").attr('action', locat+'govUploadCommon/toNextPage.act');
	$("#form1").submit();
}
// 模态框初始加载合同
function delComAlterFile(id) {
	$("#delectAltid").val(id);
}
function delFile() {
	var id = $("#delectAltid").val();
	// 文件类型：离岸收入汇总表合同目录
    var certificate_type = $("#certificate_type").val();
    // 文件类型：离岸收入汇总表合同内容
    var expense_type = $("#expense_type").val();
    // 文件类型：涉外离岸收入汇总表结汇目录
    var contract_type = $("#contract_type").val();
    // 文件类型：涉外离岸收入汇总表结汇内容
    var settlement_type = $("#settlement_type").val();
    var info_id = $("#info_id").val();
	if (id != '') {
		$.ajax({
			type : "POST",
			url : locat+'municipalUploadCommon/delCertificationFile.act',
			data : {
				id : id,
				info_id:info_id,
				certificate_type:certificate_type,
				expense_type:expense_type,
				contract_type:contract_type,
				settlement_type:settlement_type
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				if (data.ret > 0) {
		            // 文件类型：离岸收入汇总表合同目录
		            $("#certificate_type").val(data.pd.certificate_type);
		            // 文件类型：离岸收入汇总表合同内容
		            $("#expense_type").val(data.pd.expense_type);
		            // 文件类型：涉外离岸收入汇总表结汇目录
		            $("#contract_type").val(data.pd.contract_type);
		            // 文件类型：涉外离岸收入汇总表结汇内容
		            $("#settlement_type").val(data.pd.settlement_type);
					 var certificatePd = data.certificatePd;
					 var expensePdList = data.expensePdList;
			         var contractPd = data.contractPd;
			         var settlementPdList = data.settlementPdList;
			         //合同目录
			         $("#certificateFileId").empty();
			         //涉外目录
			         $("#contractFileId").empty();
			         //合同内容
			         $("#fileID").empty();
			         //涉外目录
					$("#fileID1").empty();
					if(data.certificatePd!=null && data.certificatePd!=""){
						var file_path = data.certificatePd.file_path;
						var file_name= data.certificatePd.file_name;
						var index = data.certificatePd.id;
						$("#certificateFileId").append(htmlAppend(file_name,index,file_path));
					}else{
						$("#certificateFileId")
						.append("<tr><td colspan='2' style='text-align: center;'><span style='color: #ff6a00'>没有相关记录</span></td></tr>");
					}
						if(data.contractPd!=null && data.contractPd!=""){
							var file_path = data.contractPd.file_path;
							var file_name= data.contractPd.file_name;
							var index = data.contractPd.id;
							$("#contractFileId").append(htmlAppend(file_name,index,file_path));
							}else{
								$("#certificateFileId")
								.append("<tr><td colspan='2' style='text-align: center;'><span style='color: #ff6a00'>没有相关记录</span></td></tr>");
							}
					//合同内容
					if(expensePdList.length > 0){
						reloadAjaxData(expensePdList,1);
					}else{
						$("#fileID")
						.append("<tr><td colspan='2' style='text-align: center;'><span style='color: #ff6a00'>没有相关记录</span></td></tr>");
					}
					//涉外内容
					if(settlementPdList.length > 0){
						reloadAjaxData(settlementPdList,2);
					}else{
					$("#fileID1")
					.append("<tr><td colspan='2' style='text-align: center;'><span style='color: #ff6a00'>没有相关记录</span></td></tr>");
				}
					$('#delComAlterFile').modal('hide');
				
				} else {
					$('#my-modal-failure-alert').show().delay(1000).fadeOut(
							function() {
								location.reload();
							});
				}
			}
		});
	} else {
		location.reload();
	}
	
}

function reloadAjaxData(List,type){
	for (var i = 0; i < List.length; i++) {
		if(type==1){
		$("#fileID")
		.append(htmlAppend(List[i].file_name,List[i].id,List[i].file_path));
		}else if(type==2){
		$("#fileID1")
			.append(htmlAppend(List[i].file_name,List[i].id,List[i].file_path));
		}
	}
}
function htmlAppend(file_name,id,file_path){
	if (file_name.length > 30) {
		file_name = file_name.substring(0,
				30)
				+ "...";
	} else {
		file_name = file_name;
	}
	var html=
		"<tr>"
		+ "<td style='width: 140px; text-align: center' title='"
		+ file_name
		+ "'>"
		+ file_name
		+ "</td>"
		+ "<td style='text-align: center;'><a  id='view"
		+ id
		+ "' href='javascript:void(0);' target='_blank' class='zview' onclick='viewPdf("
		+id
		+ ")'>预览</a><a data-toggle='modal' data-target='#delComAlterFile' onclick='delComAlterFile("
		+id
		+ ")' class='delete' href='javascript:void(0);'>删除</a><input id='ViewPath"
		+ id
		+ "' name='ViewPath"
		+id
		+"' type='hidden' value='"
		+file_path
		+"'/></td>"
		+ "</tr>";
	return html;
}