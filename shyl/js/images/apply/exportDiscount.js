	$(function() {
		var methodUrl = $("#baseurl").val();
		var contry=$("#contry").val();
		if(contry==1){
			url= methodUrl+'exportDiscount/contractList.act';
			inserturl= methodUrl+'exportDiscount/saveContractCon.act';
			updateurl= methodUrl+'exportDiscount/editConTry.act';
			$("#inserturl").val(inserturl);
			$("#listurl").val(url);
			$("#updateurl").val(updateurl);
		}
		$('#sEdu').on('hidden.bs.modal', function() {
			$("input[name='reportedu']").trigger("click");
		});
	
		updFile();
		$('#certificateUploadDialog').on('hidden.bs.modal', function() {
			location.reload();
		});
		var pathArray = new Array();
		var file = new Object();
		$("#file_uploadCon").fileupload({
			 autoUpload: true,
			 maxNumberOfFiles :10,
			 url: methodUrl+'platform/uploadContractFiles.act',
	       sequentialUploads: true
		 }).bind('fileuploadchange', function (e, data) {
			 if(data.files.length >10){
				 $("#file_uploadCon").tips({
					 side : 2,
					 msg : "一次最多上传十个文件。",
					 bg : '#AE81FF',
					 time : 2
				 });
	          return false;
			 }
	   }).bind('fileuploadprogress', function (e, data) {
			progress('progress',data);
		}).bind('fileuploaddone', function (e, data) {
	  	 if("no"==data.result.fileExtError){
		   		 $("#file_uploadCon").tips({
						 side : 2,
						 msg : "请上传格式为.pdf格式的文件。",
						 bg : '#AE81FF',
						 time : 2
					 });
		   		progressError('progress');
		   		 return false;
	  	 }else if("nosize"==data.result.fileExtError){
	   		 $("#file_uploadCon").tips({
				 side : 2,
				 msg : "文件已超过150MB，请分开上传。",
				 bg : '#AE81FF',
				 time : 2
			 });
	   		progressError('progress');
 		 return false;
		} else {
			 $('#progress').fadeOut(3000); 
		   		//通过Ajax向后台传值
		   		$.ajax({
		   			type : "POST",
		   			url : methodUrl+"govUploadCommon/saveUpLoadFiles.act",
		   			data : {
		   				pdfPath :data.result.filePath ,
		   				pdfName : data.result.OriginalFileName,
		   				file_type : $("#file_type").val(),
		   				info_id : $("#info_id").val()
		   			},
		   			dataType : 'json',
		   			cache : false,
		   			success : function(data) {
		   				var List = data.filesList;
		   				$("#filesId").empty();
		   				reloadFiles(List);
		   			}
		   		});
		   	 }
	   });
	});
	// 加载模态框的文件list
function reloadFiles(List) {
	for (var i = 0; i < List.length; i++) {
		$("#filesId")
				.append(
						"<tr align='left'>"
								+ "<td style='text-align: center;width: 150px;white-space: nowrap; overflow: hidden; text-overflow: ellipsis;' title='"
								+ List[i].file_name
								+ "'>"
								+ List[i].file_name
								+ "</td>"
								+ "<td style='text-align: center; width: 100px'>"
								+"<input type='hidden' id='pdf"
								+ List[i].id
								+"'value='" 
								+ List[i].file_path
								+"'>"
								+"<a id='pdfView"
								+ List[i].id
								+"'href='javascript:void(0);' target='_blank' onclick='return viewPdf("
										+ List[i].id
										+")' class='zview'>预览</a>"
								+"<a onclick='delFile("
								+ List[i].id + ")' class='delete'>删除</a></td>"
								+ "</tr>");
	}
	if (List.length == 0) {
		$("#filesId")
				.append(
						"<tr>"
								+ "<td colspan='2' style='text-align: center;'><span style='color: #ff6a00'>没有相关记录</span></td>"
								+ "</tr>");
	}
}
function delFile(id){
	var methodUrl = $("#baseurl").val();
	var info_id = $("#info_id").val();
	$.ajax({
		type : "POST",
		url : methodUrl + 'exportDiscount/delFile.act',
		data : {
			id : id,
			info_id:info_id
		},
		dataType : 'json',
		cache : false,
		success : function(data) {
			var List = data.filesList;
			$("#filesId").empty();
			reloadFiles(List);
			
		}
	});
}

//预览技术出口贴息的文件
function viewPdf(id){
	var methodUrl = $("#baseurl").val();
	var path = $("#pdf"+id).val();
	var ret=false;
	//通过Ajax向后台传值
	$.ajax({
		type : "POST",
		url :methodUrl+'register/isExistsFile.act',
		data : {
			filePath : path
		},
		dataType : 'json',
		async:false, 
		success : function(data) {
			if(data=="1"){
				$("#pdfView"+id).attr('href',methodUrl+'register/showPdf.act?pdfFile='+path);
				ret=true;
			}else{
				$('#my-modal-errorfile-alert').show ().delay (1000).fadeOut ();
			}
			
		}
	});
	return ret;
}

// 预览合同
function view(pdf_id, id) {
	var methodUrl = $("#baseurl").val();
	var ret = false;
	$.ajax({
		type : "POST",
		url : methodUrl + 'exportDiscount/viewPdf.act',
		dataType : 'json',
		data : {
			id : id,
		},
		cache : false,
		async : false,
		success : function(data) {
			if (data.responseStr == "OK") {
				var path = data.responsePath;
				$("#view" + id).attr('href', methodUrl+'register/showPdf.act?pdfFile='+path);
				ret = true;
			} else {
				$('#my-modal-success-alert').show().delay(1000).fadeOut();
				ret = false;
			}
		}
	});
	return ret;
}

function OK(url) {
	var methodUrl = $("#baseurl").val();
	location.href = methodUrl + url + '?info_id=' + $("#info_id").val();
}
// 返回
function GO(url) {
	var methodUrl = $("#baseurl").val();
	location.href = methodUrl + url + '?info_id=' + $("#info_id").val();
}
// 保存合同
function certificateSave() {
	// 合同登记证书号
	var certificateNo = $("#certificateNo").val();
	// 合同号
	var contractNo = $("#contractNo").val();
	// 合同名称
	var contractName = $("#contractName").val();
	// 合同金额（万）
	var contractMoney = $("#contractMoney").val();
	// 实际出口额（万）
	var exportVolume = $("#exportVolume").val();
	// 备注
	var remarks = $("#remarks").val();
	// 合同名
	var file_path = $("#file_path1").val();
	var file_name = $("#uploadFileId").val();
	var info_id = $("#info_id").val();
	
	if (valiteCert()) {
		$.ajax({
			type : "POST",
			url : $("#inserturl").val(),
			data : {
				contract_regist_no : certificateNo,
				contract_no : contractNo,
				contract_name : contractName,
				contract_money : contractMoney,
				export_money : exportVolume,
				remarks : remarks,
				file_name : file_name,
				file_path : file_path,
				info_id : info_id
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				$('#sEdu').modal('hide');
				location.reload();
				$("input[name='reportedu']").trigger("click");

			}
		});
	}
}
// 合同项目非空验证
function valiteCert() {
	// 合同登记证书号
	var certificateNo = $("#certificateNo").val();
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
	// 合同号
	var contractNo = $("#contractNo").val();
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
	// 合同名称
	var contractName = $("#contractName").val();
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
	// 合同金额（万美元）
	var contractMoney = $("#contractMoney").val();
	if (contractMoney == "") {
		$("#contractMoney").tips({
			side : 2,
			msg : '请输入合同金额（万美元）',
			bg : '#AE81FF',
			time : 3
		});
		$("#contractMoney").focus();
		return false;
	} else {
		if (parseInt(contractMoney)<=0) {
			$("#contractMoney").tips({
				side : 2,
				msg : '金额必须大于0',
				bg : '#AE81FF',
				time : 3
			});
			$("#contractMoney").focus();
			return false;
		}
	}
	// 实际出口额（万美元）
	var exportVolume = $("#exportVolume").val();
	if (exportVolume == "") {
		$("#exportVolume").tips({
			side : 2,
			msg : '请输入实际出口额（万美元）',
			bg : '#AE81FF',
			time : 3
		});
		$("#exportVolume").focus();
		return false;
	} else {
		if (parseInt(exportVolume)<=0) {
			$("#exportVolume").tips({
				side : 2,
				msg : '金额必须大于0',
				bg : '#AE81FF',
				time : 3
			});
			$("#exportVolume").focus();
			return false;
		}
	}
	return true;
}
// 修改合同加载数据 开始
function eduUpdate(id) {
	var methodUrl = $("#baseurl").val();
	$.ajax({
		type : "POST",
		url : methodUrl + 'exportDiscount/selectContract.act',
		data : {
			id : id
		},
		dataType : 'json',
		cache : false,
		success : function(data) {
			var id = data.id;
			var contract_regist_no = data.contract_regist_no;
			var contract_no = data.contract_no;
			var contract_name = data.contract_name;
			var contract_money = data.contract_money;
			var export_money = data.export_money;
			var remarks = data.remarks;
			var file_path = data.file_path;
			var file_name = data.file_name;
			$("#cerid").val(id);
			$("#certificateNoUpd").val(contract_regist_no);
			$("#contractNoUpd").val(contract_no);
			$("#contractNameUpd").val(contract_name);
			$("#contractMoneyUpd").val(contract_money);
			$("#exportVolumeUpd").val(export_money);
			$("#remarksUpd").val(remarks);
		}
	});
}
// 更新合同
function updateCon() {
	var id = $("#cerid").val();
	var contract_regist_no = $("#certificateNoUpd").val();
	var contract_no = $("#contractNoUpd").val();
	var contract_name = $("#contractNameUpd").val();
	var contract_money = $("#contractMoneyUpd").val();
	var export_money = $("#exportVolumeUpd").val();
	var remarks = $("#remarksUpd").val();
	var file_path = $("#file_path2").val();
	var file_name = $("#fileUpd").val();
	// 信息ID
	var info_id = $("#info_id").val();
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
	if (contract_money == "") {
		$("#contractMoneyUpd").tips({
			side : 2,
			msg : '请输入合同金额（万美元）',
			bg : '#AE81FF',
			time : 3
		});
		$("#contractMoneyUpd").focus();
		return false;
	} else {
		if (parseInt(contract_money)<=0) {
			$("#contractMoneyUpd").tips({
				side : 2,
				msg : '金额必须大于0',
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
	} else {
		if (parseInt(export_money)<=0) {
			$("#exportVolumeUpd").tips({
				side : 2,
				msg : '金额必须大于0',
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
			info_id : info_id,
			id : id,
			contract_regist_no : contract_regist_no,
			contract_no : contract_no,
			contract_name : contract_name,
			contract_money : contract_money,
			export_money : export_money,
			remarks : remarks
		},
		dataType : 'json',
		cache : false,
		success : function(data) {
			$('#eEdu').modal('hide');
			location.reload();
		}
	});
}
// 删除合同
function Delete() {
	var methodUrl = $("#baseurl").val();
	// 信息ID
	var info_id = $("#info_id").val();
	var id = $("#delectinfoid").val();
	$.ajax({
		type : "POST",
		url : methodUrl + 'exportDiscount/deleteCon.act',
		data : {
			info_id : info_id,
			id : id
		},
		dataType : 'json',
		cache : false,
		success : function(data) {
			$('#deledu').modal('hide');
			location.reload();
		}
	});
}
//模态框初始加载合同
function delCon(id) {
	$("#delectinfoid").val(id);
}

//模态框初始加载合同
function updFile(id){
	$("#updid").val(id);
}

//调用批量导入功能
function upExcel(){
	var methodUrl = $("#baseurl").val();
	var options = {
	        url:methodUrl+'govUploadCommon/uploadExcel.act',
	        data:{info_id:$("#info_id").val(),type_flag:$("#contry").val(),alias:"exportDiscount"},
				getresult: function(data) {fileuploaddoneExcel();},
				fileNmae:"企业技术出口贴息申请表.xlsx",
				filePath:"templateFiles/exportDiscount.xlsx"
	 };
	fileuploadExcel(options);
}
//批量导入回调函数
function fileuploaddoneExcel(){
	var methodUrl = $("#baseurl").val();
	if($("#contry").val()==1){
		location.href = methodUrl+"govUploadCommon/exportDiscount.act?info_id="+$("#info_id").val();
	}
}