$(function() {
		var methodUrl = $("#baseurl").val();
		var contry=$("#contry").val();
		if(contry==1){
		url= methodUrl+'platform/contractcontryList.act';
		inserturl= methodUrl+'platform/insertContractCon.act';
		updateurl= methodUrl+'platform/updateConTry.act';
		$("#inserturl").val(inserturl);
		$("#listurl").val(url);
		$("#updateurl").val(updateurl);
		var yea=$("#lastYear").val();
		var levelMenu=$("#levelMenu").val();
		$("#title").html(levelMenu+yea+"年度收入汇总表"); 
		$("title").html(yea+"年度入汇总表_济南市服务外包人才公共服务平台"); 
		}else{
		$("#years").show();	
		url= methodUrl+'platform/contractList.act';
		inserturl= methodUrl+'platform/insertContract.act';
		updateurl= methodUrl+'platform/updateCon.act';
		$("#listurl").val(url);
		$("#inserturl").val(inserturl);
		$("#updateurl").val(updateurl);
		$("#title").html("收入汇总表");
		$("title").html("收入汇总表_济南市服务外包人才公共服务平台"); 
		}
		contractList($('.hd .on a').attr("data-var"));
		$('.hd li a').click(function(){
			contractList($(this).attr("data-var"));
			$('.hd li').removeClass('on');
		    $(this).parent().addClass('on');
		});
		$('#sEdu').on('hidden.bs.modal', function() {
			$("input[name='reportedu']").trigger("click");
		});
	
		// 合并 $(function(){}) 1
		updFile();
		$("#file_upload1").fileupload({
			 dataType :'json',
			 autoUpload: true,
			 maxNumberOfFiles :1,
	         url: methodUrl+'platform/uploadContractFiles.act',
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
	
		// 合并 $(function(){}) 2
		 $("#file_upload2").fileupload({
			 dataType :'json',
			 autoUpload: true,
			 maxNumberOfFiles :1,
	         url: methodUrl+'platform/uploadContractFiles.act',
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
		 $("#file_uploadCon").fileupload({
			 autoUpload: true,
			 maxNumberOfFiles : 3,
			 url: $("#baseurl").val()+'platform/uploadSjBc.act',
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
		  		 $("#view").attr('href',$("#baseurl").val()+'register/showPdf.act?pdfFile='+path);
		  		 $("#view").attr("onclick","");
		  		 $("#xg").show();
		  		 $("#sc").show();
		  		 $("#finame").text(data.originalFiles[0].name);
		  		 $("#sc a").attr("onclick","htmlsjbg()");
		  	 }
		});

		//委托合同上传
		$("#file_uploadwtht").fileupload({
			 autoUpload: true,
			 maxNumberOfFiles : 3,
			 url: $("#baseurl").val()+'platform/uploadSjBc.act',
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
		   		 $("#vie").attr('href',$("#baseurl").val()+'register/showPdf.act?pdfFile='+path);
		   		 $("#vie").attr("onclick","");
		   		 $("#wtxg").show();
		   		 $("#wtsc").show();
		   		 $("#wtfiname").text(data.originalFiles[0].name);
		   		 $("#wtsc a").attr("onclick","htmlwtht()");
		   	 }
		});
	});
function contractList(years) {
	$
			.ajax({
				type : "POST",
				url : $("#listurl").val(),
				data : {
					years : years,
					info_id : $("#info_id").val()
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
					var List = data.contractlist;
					var pdCompany = data.pdCompany;
					$("#tbodyId").empty();
					for (var i = 0; i < List.length; i++) {
						var remarks;
						var contract_name;
						var contract_regist_no;
						var contract_no;
						if (List[i].remarks != null
								&& List[i].remarks.length > 5) {
							remarks = List[i].remarks.substring(0, 5) + "...";
						} else {
							remarks = List[i].remarks != null ? List[i].remarks
									: "";
						}
						if (List[i].contract_name.length > 5) {
							contract_name = List[i].contract_name.substring(0,
									5)
									+ "...";
						} else {
							contract_name = List[i].contract_name;
						}
						if (List[i].contract_regist_no.length > 5) {
							contract_regist_no = List[i].contract_regist_no
									.substring(0, 5)
									+ "...";
						} else {
							contract_regist_no = List[i].contract_regist_no;
						}
						if (List[i].contract_no.length > 5) {
							contract_no = List[i].contract_no.substring(0, 5)
									+ "...";
						} else {
							contract_no = List[i].contract_no;
						}
						$("#tbodyId")
								.append(
										"<tr align='left'>"
												+ "<td style='text-align: center;'></td>"
												+ "<td style='text-align: center;' title='"
												+ List[i].contract_regist_no
												+ "'>"
												+ contract_regist_no
												+ "</td>"
												+ "<td style='text-align: center;' title='"
												+ List[i].contract_no
												+ "'>"
												+ contract_no
												+ "</td>"
												+ "<td style='text-align: center;' title='"
												+ List[i].contract_name
												+ "'>"
												+ contract_name
												+ "</td>"
												+ "<td style='text-align: center;'>"
												+ List[i].currency_type
												+ "</td>"
												+ "<td style='text-align: center;'>"
												+ List[i].contract_money
												+ "</td>"
												+ "<td style='text-align: center;'>"
												+ List[i].export_money
												+ "</td>"
												+ "<td style='text-align: center;'><a  href='javascript:void(0);'onclick='eduUpdate("
												+ List[i].id
												+ ")'class='modify'>修改</a><a data-toggle='modal' data-target='#deledu' onclick='delCon("
												+ List[i].id
												+ ")' class='delete'>删除</a><a  id='view"
												+ List[i].id
												+ "' href='javascript:void(0);' target='_blank' onclick='return view(view"
												+ List[i].id
												+ ","
												+ List[i].id
												+ ");' class='zview'>预览</a></td>"
												+ "</tr>");
						$('#tbodyId  tr:eq(' + i + ') td:first').text(i + 1);
					}
					var totalRow1 = 0
					$('#tbodyId tr').each(function() {
						$(this).find('td:eq(5)').each(function() {
							totalRow1 += parseFloat($(this).text());
						});
					});
					totalRow1=totalRow1.toFixed(2);
					var totalRow2 = 0
					$('#tbodyId tr').each(function() {
						$(this).find('td:eq(6)').each(function() {
							totalRow2 += parseFloat($(this).text());
						});
					});
					totalRow2=totalRow2.toFixed(2);
					if (List.length > 0) {
						$("#tbodyId")
								.append(
										"<tr align='left'>"
												+ "<td style='text-align: center;'>合计</td>"
												+ "<td></td>"
												+ "<td></td>"
												+ "<td></td>"
												+ "<td></td>"
												+ "<td style='text-align: center;'>"
												+ totalRow1
												+ "</td>"
												+ "<td style='text-align: center;'>"
												+ totalRow2 + "</td>"
												 + "<td></td>"
												+ "</tr>");
					} else {
						$("#tbodyId")
								.append(
										"<tr>"
												+ "<td colspan='8' style='text-align: center;'><span style='color: #ff6a00'>没有相关记录</span></td>"
												+ "</tr>");
					}

					return false;
				},
			});
}
// 预览合同
function view(pdf_id, info_id) {
	var methodUrl = $("#baseurl").val();
	var ret = false;
	$.ajax({
		type : "POST",
		url : methodUrl + 'platform/viewPdf.act',
		dataType : 'json',
		data : {
			id : info_id,
		},
		cache : false,
		async : false,
		success : function(data) {
			if (data.responseStr == "OK") {
				var path = data.responsePath;
				$("#view" + info_id).attr('href', methodUrl+'register/showPdf.act?pdfFile='+path);
				ret = true;
			} else {
				$('#my-modal-success-alert').show().delay(1000).fadeOut();
				ret = false;
			}
		}
	});
	return ret;
}
// 预览审计报告
function sjbg(pdf_id, info_id) {
	var methodUrl = $("#baseurl").val();
	var ret = false;
	$.ajax({
		type : "POST",
		url : methodUrl + 'platform/sjbgPdf.act',
		dataType : 'json',
		data : {
			id : info_id,
		},
		cache : false,
		async : false,
		success : function(data) {
			if (data.responseStr == "OK") {
				var path = data.responsePath;
				$("#view" + info_id).attr('href', methodUrl +'register/showPdf.act?pdfFile='+ path);
				ret = true;
			} else {
				$('#my-modal-success-alert').show().delay(1000).fadeOut();
				ret = false;
			}
		}
	});
	return ret;
}
// 预览委托合同
function wtht(pdf_id, info_id) {
	var methodUrl = $("#baseurl").val();
	var ret = false;
	$.ajax({
		type : "POST",
		url : methodUrl + 'platform/wthtPdf.act',
		dataType : 'json',
		data : {
			id : info_id,
		},
		cache : false,
		async : false,
		success : function(data) {
			if (data.responseStr == "OK") {
				var path = data.responsePath;
				$("#vie" + info_id).attr('href', methodUrl+'register/showPdf.act?pdfFile='+ path);
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
	// 年度
	var years = $("div.hd li.on a").attr("data-var");
	// 合同登记证书号
	var certificateNo = $("#certificateNo").val();
	// 合同号
	var contractNo = $("#contractNo").val();
	// 合同名称
	var contractName = $("#contractName").val();
	// 货币类型
	var currency_type = $("#currency_type").val();
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
				years : years,
				contract_regist_no : certificateNo,
				contract_no : contractNo,
				contract_name : contractName,
				currency_type:currency_type,
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
				var List = data.contractlist;
				if ($("#tbodyId").find("tr").length > 0) {
					$("#tbodyId").find("tr").remove();
				}
				reloadAjax(List);
				$("input[name='reportedu']").trigger("click");

			}
		});
	}
}
// 合同项目非空验证
function valiteCert() {
	// 合同登记证书号
	var certificateNo = $("#certificateNo").val();
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
	// 合同金额（万）
	var contractMoney = $("#contractMoney").val();
	if (contractMoney == "") {
		$("#contractMoney").tips({
			side : 2,
			msg : '请输入合同金额（万）',
			bg : '#AE81FF',
			time : 3
		});
		$("#contractMoney").focus();
		return false;
	} else {
		// var PsdFilter = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
		var PsdFilter = /^\d{0,7}(\.\d{0,2})?$/;
		var PsdFilter1 = /^\d*\.?\d{0,2}$/;
		if (!(PsdFilter1.test(contractMoney))) {
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
	// 实际出口额（万）
	var exportVolume = $("#exportVolume").val();
	if (exportVolume == "") {
		$("#exportVolume").tips({
			side : 2,
			msg : '请输入实际出口额（万）',
			bg : '#AE81FF',
			time : 3
		});
		$("#exportVolume").focus();
		return false;
	} else {
		// var PsdFilter = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
		var PsdFilter = /^\d{0,7}(\.\d{0,2})?$/;
		var PsdFilter1 = /^\d*\.?\d{0,2}$/;
		if (!(PsdFilter1.test(exportVolume))) {
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
	// 合同名称
	var file_name = $("#uploadFileId").val();
	if (file_name == "") {
		$("#uploadFileId").tips({
			side : 2,
			msg : '请选择合同',
			bg : '#AE81FF',
			time : 3
		});
		$("#uploadFileId").focus();
		return false;
	}
	return true;
}
// 修改合同加载数据 开始
function eduUpdate(id) {
	var methodUrl = $("#baseurl").val();
	$.ajax({
		type : "POST",
		url : methodUrl + 'platform/selectContract.act',
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
			var currency_type = data.currency_type;
			var contract_money = data.contract_money;
			var export_money = data.export_money;
			var remarks = data.remarks;
			var file_path = data.file_path;
			var file_name = data.file_name;
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
			$('#eEdu').modal();
		}
	});
}
// 更新合同
function updateCon() {
	// 年度
	var years = $("div.hd li.on a").attr("data-var");
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
	// 信息ID
	var info_id = $("#info_id").val();

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
			msg : '请输入合同金额（万）',
			bg : '#AE81FF',
			time : 3
		});
		$("#contractMoneyUpd").focus();
		return false;
	} else {
		// var PsdFilter = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
		var PsdFilter = /^\d{0,7}(\.\d{0,2})?$/;
		var PsdFilter1 = /^\d*\.?\d{0,2}$/;
		if (!(PsdFilter1.test(contract_money))) {
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
			msg : '请输入实际出口额（万）',
			bg : '#AE81FF',
			time : 3
		});
		$("#exportVolumeUpd").focus();
		return false;
	} else {
		// var PsdFilter = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
		var PsdFilter = /^\d{0,7}(\.\d{0,2})?$/;
		var PsdFilter1 = /^\d*\.?\d{0,2}$/;
		if (!(PsdFilter1.test(export_money))) {
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
			info_id : info_id,
			years : years,
			id : id,
			contract_regist_no : contract_regist_no,
			contract_no : contract_no,
			contract_name : contract_name,
			currency_type:currency_type,
			contract_money : contract_money,
			export_money : export_money,
			remarks : remarks,
			file_path : file_path,
			file_name : file_name
		},
		dataType : 'json',
		cache : false,
		success : function(data) {
			console.log(data);
			var List = data.contractlist;
			if ($("#tbodyId").find("tr").length > 0) {
				$("#tbodyId").find("tr").remove();
			}
			reloadAjax(List);
			$('#eEdu').modal('hide');
		}
	});
}
// 删除合同
function Delete() {
	var methodUrl = $("#baseurl").val();
	var contry=$("#contry").val();//1国家级 2市级
	var years;
	var url;
	if(contry==1){
		//上一年年度
	 years =$("#lastYear").val();
	 url = methodUrl+'platform/deleteCountryCon.act';
	}else{
		//年度
	 years = $("div.hd li.on a").attr("data-var");
	 url = methodUrl+'platform/deleteCon.act';
	}
	// 信息ID
	var info_id = $("#info_id").val();
	var id = $("#delectinfoid").val();
	$.ajax({
		type : "POST",
		url : url,
		data : {
			years : years,
			info_id : info_id,
			id : id
		},
		dataType : 'json',
		cache : false,
		success : function(data) {
			var List = data.contractlist;
			if ($("#tbodyId").find("tr").length > 0) {
				$("#tbodyId").find("tr").remove();
			}
			reloadAjax(List);
			$('#deledu').modal('hide');
		}
	});
}
// 加载画面的ajax数据
function reloadAjax(List) {
	for (var i = 0; i < List.length; i++) {
		var remarks;
		var contract_name;
		var contract_regist_no;
		var contract_no;
		if (List[i].remarks != null && List[i].remarks.length > 5) {
			remarks = List[i].remarks.substring(0, 5) + "...";
		} else {
			remarks = List[i].remarks != null ? List[i].remarks : "";
		}
		if (List[i].contract_name.length > 5) {
			contract_name = List[i].contract_name.substring(0, 5) + "...";
		} else {
			contract_name = List[i].contract_name;
		}
		if (List[i].contract_regist_no.length > 5) {
			contract_regist_no = List[i].contract_regist_no.substring(0, 8)
					+ "...";
		} else {
			contract_regist_no = List[i].contract_regist_no;
		}
		if (List[i].contract_no.length > 5) {
			contract_no = List[i].contract_no.substring(0, 8) + "...";
		} else {
			contract_no = List[i].contract_no;
		}
		$("#tbodyId")
				.append(
						"<tr align='left'>"
								+ "<td style='text-align: center;'></td>"
								+ "<td style='text-align: center;' title='"
								+ List[i].contract_regist_no
								+ "'>"
								+ contract_regist_no
								+ "</td>"
								+ "<td style='text-align: center;' title='"
								+ List[i].contract_no
								+ "'>"
								+ contract_no
								+ "</td>"
								+ "<td style='text-align: center;' title='"
								+ List[i].contract_name
								+ "'>"
								+ contract_name
								+ "</td>"
								+ "<td style='text-align: center;'>"
								+ List[i].currency_type
								+ "</td>"
								+ "<td style='text-align: center;'>"
								+ List[i].contract_money
								+ "</td>"
								+ "<td style='text-align: center;'>"
								+ List[i].export_money
								+ "</td>"
								+ "<td style='text-align: center;'><a  href='javascript:void(0);' onclick='eduUpdate("
								+ List[i].id
								+ ")'class='modify'>修改</a><a data-toggle='modal' data-target='#deledu' onclick='delCon("
								+ List[i].id
								+ ")' class='delete'>删除</a><a  id='view"
								+ List[i].id
								+ "' href='javascript:void(0);' target='_blank' onclick='return view(view"
								+ List[i].id
								+ ","
								+ List[i].id
								+ ");' class='zview'>预览</a></td>" + "</tr>");
		$('#tbodyId  tr:eq(' + i + ') td:first').text(i + 1);

	}
	var totalRow1 = 0
	$('#tbodyId tr').each(function() {
		$(this).find('td:eq(5)').each(function() {
			totalRow1 += parseFloat($(this).text());
		});
	});
	totalRow1 = totalRow1.toFixed(2);
	var totalRow2 = 0
	$('#tbodyId tr').each(function() {
		$(this).find('td:eq(6)').each(function() {
			totalRow2 += parseFloat($(this).text());
		});
	});
	totalRow2 = totalRow2.toFixed(2);
	if (List.length > 0) {
		$("#tbodyId").append(
				"<tr align='left'>" + "<td style='text-align: center;'>合计</td>"
						+ "<td></td>" + "<td></td>" + "<td></td>"+ "<td></td>"
						+ "<td style='text-align: center;'>" + totalRow1
						+ "</td>" + "<td style='text-align: center;'>"
						+ totalRow2 + "</td>"  + "<td></td>"
						+ "</tr>");
	} else {
		$("#tbodyId")
				.append(
						"<tr>"
								+ "<td colspan='8' style='text-align: center;'><span style='color: #ff6a00'>没有相关记录</span></td>"
								+ "</tr>");
	}
}
//模态框初始加载合同
function delCon(id) {
	$("#delectinfoid").val(id);
}
function deleteSjBg(id){
	 //删除审计报告
		$("#defauinfo_id").val(id);
}
function delSjBg() {
	var methodUrl = $("#baseurl").val();
	var id = $("#defauinfo_id").val();
	$.ajax({
		type : "POST",
		url : methodUrl + 'platform/deleteSjBg.act',
		data : {
			id : id
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
function colosesjbg() {
	$('#delSjBg').modal('hide');
}
function delWTHT() {
	var methodUrl = $("#baseurl").val();
	var id = $("#defauwthtinfo_id").val();
	$.ajax({
		type : "POST",
		url : methodUrl + 'platform/deleteWtHt.act',
		data : {
			id : id
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
function colosewtht() {
	$('#delWtht').modal('hide');
}
function updateSjFile(){
	var methodUrl = $("#baseurl").val();
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
		url : methodUrl+'platform/upLoadSjFile.act',
		data : {
			adoptPath : adoptPath,
			adoptNm : adoptNm,
			info_id:info_id,
			file_type:1
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
			} 
		}
	});
}
function updateWthtFile(){
	var methodUrl = $("#baseurl").val();
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
		url :methodUrl+'platform/upLoadWthtFile.act',
		data : {
			adoptPath : adoptPath,
			adoptNm : adoptNm,
			info_id:info_id,
			file_type:2
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
			} 
		}
	});
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
		$("#apply_report_pathwtht").val("");	
		//$("#wtfiname").html(fildd);
}

//调用批量导入功能
function upExcel(){
	var methodUrl = $("#baseurl").val();
	var years=$("div.hd li.on a").attr("data-var");
	if($("#contry").val()==1){
		// 年度
		years =$("#lastYear").val()
	}
	var options = {
	        url:methodUrl+'govUploadCommon/uploadExcel.act',
	        data:{info_id:$("#info_id").val(),type_flag:$("#contry").val(),years:years,alias:"offshoreIncome"},
				getresult: function(data) {fileuploaddoneExcel();},
				fileNmae:"收入汇总表.xlsx",
				filePath:"templateFiles/offshoreIncome.xlsx"
	 };
	fileuploadExcel(options);
}
//批量导入回调函数
function fileuploaddoneExcel(){
	var methodUrl = $("#baseurl").val();
	if($("#contry").val()==1){
		location.href = methodUrl+"org/reportcontry.act?info_id="+$("#info_id").val();
	}else{
		location.href = methodUrl+"org/report.act?info_id="+$("#info_id").val();
	}

}
function downloadFile() {	
	$("#form1").attr("action",methodUrl+"gov/download.act?fileName=收入汇总表.xlsx&filePath=templateFiles/offshoreIncome.xlsx");
	$("#form1").submit();			
}