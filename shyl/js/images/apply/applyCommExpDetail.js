var pictureindex = 0;
var pathArray = new Array();
$(function() {
	var methodUrl = $("#methodUrl").val();
	var total = $('#total').val();
	$('#totalMoney').text(total);
	$('#expenDetaiModal').on('hidden.bs.modal', function() {
		$("input[name='expensesDetailClear']").trigger("click");
	});
	$('#uploadVoucherModal').on('hidden.bs.modal', function() {
		location.reload();
	});
	$('#viewVoucherModal').on('hidden.bs.modal', function() {
		location.reload();
	});
	$('#promptModal').on('hidden.bs.modal', function() {
		$('#uploadVoucherModal').modal('show');
	})
	$("#upload_voucher").fileupload({
		dataType : 'json',
		autoUpload : true,
		maxNumberOfFiles : 5,
		url : methodUrl + 'platform/Upload.act',
		sequentialUploads : true
	}).bind('fileuploadchange', function(e, data) {
		if (data.files.length > 5) {
			$("#upload_voucher").tips({
				side : 2,
				msg : "一次最多上传5张图片。",
				bg : '#AE81FF',
				time : 2
			});
			return false;
		}
	}).bind(
			'fileuploaddone',
			function(e, data) {
				if ("SizeError" == data.result.fileSizError) {
					$("#upload_voucher").tips({
						side : 2,
						msg : "请上传大小符合要求的文件。",
						bg : '#AE81FF',
						time : 2
					});
					return false;
				} else if ("NO" == data.result.fileTypeError) {
					$("#upload_voucher").tips({
						side : 2,
						msg : "请上传格式为.jpg/.jpeg/.png./gif格式的图片。",
						bg : '#AE81FF',
						time : 2
					});
					return false;
				} else {
					var index = ++pictureindex;
					addScrollbar($("#imagesID").parent());
					$("#imagesID").append(
							html(data.result.imgPath, data.result.imgName,
									index));
					var img = new Object();
					img.id = index;
					img.name = data.result.imgName;
					img.path = data.result.imgPath;
					pathArray.push(img);
				}
			});

});
// 验证数据
function valiteExpensesDetail1() {
	if ($("#level").val() == 2) {
		// 出差人员名称
		var expensesTotal = $("#expensesTotal").val();
		if (expensesTotal == "") {
			$("#expensesTotal").tips({
				side : 2,
				msg : '请输入申请扶持金额',
				bg : '#AE81FF',
				time : 3
			});
			$("#expensesTotal").focus();
			return false;
		} else {
			// var PsdFilter = /^([1-9][\d]{0,8}|0)(\.[\d]{1,2})?$/;
			var PsdFilter = /^\d{0,7}(\.\d{0,2})?$/;
			var PsdFilter1 = /^\d*\.?\d{0,2}$/;
			if (!(PsdFilter1.test(expensesTotal))) {
				$("#expensesTotal").tips({
					side : 2,
					msg : '金额必须大于0且小数位数不超过2位',
					bg : '#AE81FF',
					time : 3
				});
				$("#expensesTotal").focus();
				return false;
			}
			if (!(PsdFilter.test(expensesTotal))) {
				$("#expensesTotal").tips({
					side : 2,
					msg : '申请扶持金额最大值不能超过9999999.99',
					bg : '#AE81FF',
					time : 3
				});
				$("#expensesTotal").focus();
				return false;
			}
		}
	}
	return true;
}
// 保存数据
function expenseDetailSave() {
	var methodUrl = $("#methodUrl").val();
	if (valiteExpensesDetail()) {
		// 出差人员名称
		var business_traveler = $("#business_traveler").val();
		// 凭证号
		var doc_num = $("#doc_num").val();
		// 金额
		var money = $("#money").val();
		// 日期
		var doc_date = $("#doc_date").val();
		// 备注
		var remark = $("#remark").val();
		// 凭证号
		var ex_info_id = $("#ex_info_id").val();
		$.ajax({
			type : "POST",
			url : methodUrl + 'platform/expenseDetailSave.act',
			data : {
				business_traveler : business_traveler,
				doc_num : doc_num,
				money : money,
				doc_date : doc_date,
				remark : remark,
				ex_info_id : ex_info_id
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				$("#expenDetaiModal").modal('hide');
				$("input[name='expensesDetailClear']").trigger("click");
				location.reload();
			}
		});
	}
}
// 验证添加数据
function valiteExpensesDetail() {
	// 出差人员名称
	var business_traveler = $("#business_traveler").val();
	if (business_traveler == "") {
		$("#business_traveler").tips({
			side : 2,
			msg : '请输入出差人员名称',
			bg : '#AE81FF',
			time : 3
		});
		$("#business_traveler").focus();
		return false;
	}
	// 凭证号
	var doc_num = $("#doc_num").val();
	if (doc_num == "") {
		$("#doc_num").tips({
			side : 2,
			msg : '请输入凭证号',
			bg : '#AE81FF',
			time : 3
		});
		$("#doc_num").focus();
		return false;
	}
	// 金额
	var money = $("#money").val();
	if (money == "") {
		$("#money").tips({
			side : 2,
			msg : '请输入费用金额',
			bg : '#AE81FF',
			time : 3
		});
		$("#money").focus();
		return false;
	} else {
		// var PsdFilter = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
		var PsdFilter = /^\d{0,7}(\.\d{0,2})?$/;
		var PsdFilter1 = /^\d*\.?\d{0,2}$/;
		if (!(PsdFilter1.test(money))) {
			$("#money").tips({
				side : 2,
				msg : '金额必须大于0且小数位数不超过2位',
				bg : '#AE81FF',
				time : 3
			});
			$("#money").focus();
			return false;
		}
		if (!(PsdFilter.test(money))) {
			$("#money").tips({
				side : 2,
				msg : '金额最大值不能超过9999999.99',
				bg : '#AE81FF',
				time : 3
			});
			$("#money").focus();
			return false;
		}
	}
	// 日期
	var doc_date = $("#doc_date").val();
	if (doc_date == "") {
		$("#doc_date").tips({
			side : 2,
			msg : '请输入日期',
			bg : '#AE81FF',
			time : 3
		});
		$("#doc_date").focus();
		return false;
	}
	return true;
}
// 更新模态框数据
function ExpensesDetailUpd() {
	var methodUrl = $("#methodUrl").val();
	if (valiteExpensesDetailUpd()) {
		// 出差人员名称
		var business_traveler = $("#business_travelerUpd").val();
		// 凭证号
		var doc_num = $("#doc_numUpd").val();
		// 金额
		var money = $("#moneyUpd").val();
		// 日期
		var doc_date = $("#doc_dateUpd").val();

		// 日期
		var doc_date = $("#doc_dateUpd").val();
		// 备注
		var remark = $("#remarkUpd").val();
		// ID
		var id = $("#expensesDetailId").val();
		$.ajax({
			type : "POST",
			url : methodUrl + 'platform/UpdExpensesDetail.act',
			data : {
				business_traveler : business_traveler,
				doc_num : doc_num,
				money : money,
				doc_date : doc_date,
				remark : remark,
				id : id
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				$("#modifyModal").modal('hide');
				location.reload();
			}
		});
	}
}
// 修改模态框数据加载
function modifyExpenseDetail(id) {
	var methodUrl = $("#methodUrl").val();
	$.ajax({
		type : "POST",
		url : methodUrl + 'platform/selectExpensesDetail.act',
		data : {
			id : id
		},
		dataType : 'json',
		cache : false,
		success : function(data) {
			// 出差人员名称
			$("#business_travelerUpd").val(data.business_traveler);
			// 凭证号
			$("#doc_numUpd").val(data.doc_num);
			// 金额
			$("#moneyUpd").val(data.money);
			// 日期
			$("#doc_dateUpd").val(data.doc_date);

			// 日期
			$("#doc_dateUpd").val(data.doc_date);
			// 备注
			$("#remarkUpd").val(data.remark);
			// ID
			$("#expensesDetailId").val(data.id);

		}
	});
}
// 验证
function valiteExpensesDetailUpd() {
	// 出差人员名称
	var business_traveler = $("#business_travelerUpd").val();
	if (business_traveler == "") {
		$("#business_travelerUpd").tips({
			side : 2,
			msg : '请输入出差人员名称',
			bg : '#AE81FF',
			time : 3
		});
		$("#business_travelerUpd").focus();
		return false;
	}
	// 凭证号
	var doc_num = $("#doc_numUpd").val();
	if (doc_num == "") {
		$("#doc_numUpd").tips({
			side : 2,
			msg : '请输入凭证号',
			bg : '#AE81FF',
			time : 3
		});
		$("#doc_numUpd").focus();
		return false;
	}
	// 金额
	var money = $("#moneyUpd").val();
	if (money == "") {
		$("#moneyUpd").tips({
			side : 2,
			msg : '请输入费用金额',
			bg : '#AE81FF',
			time : 3
		});
		$("#moneyUpd").focus();
		return false;
	} else {
		// var PsdFilter = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
		var PsdFilter = /^\d{0,7}(\.\d{0,2})?$/;
		var PsdFilter1 = /^\d*\.?\d{0,2}$/;
		if (!(PsdFilter1.test(money))) {
			$("#moneyUpd").tips({
				side : 2,
				msg : '金额必须大于0且小数位数不超过2位',
				bg : '#AE81FF',
				time : 3
			});
			$("#moneyUpd").focus();
			return false;
		}
		if (!(PsdFilter.test(money))) {
			$("#moneyUpd").tips({
				side : 2,
				msg : '金额最大值不能超过9999999.99',
				bg : '#AE81FF',
				time : 3
			});
			$("#moneyUpd").focus();
			return false;
		}
	}
	// 日期
	var doc_date = $("#doc_dateUpd").val();
	if (doc_date == "") {
		$("#doc_dateUpd").tips({
			side : 2,
			msg : '请输入日期',
			bg : '#AE81FF',
			time : 3
		});
		$("#doc_dateUpd").focus();
		return false;
	}
	return true;
}
function delExpenseDetail(id) {
	$("#delExpenseDetailId").val(id);
}
// 删除交流数据
function DeleteExpenseDetail() {
	var methodUrl = $("#methodUrl").val();
	var id = $("#delExpenseDetailId").val();
	$.ajax({
		type : "POST",
		url : methodUrl + 'platform/delExpenseDetail.act',
		data : {
			id : id
		},
		dataType : 'json',
		cache : false,
		success : function(data) {
			$('#delModal').modal('hide');
			location.reload();
		}
	});
}
function uploadExpenseVoucher(id) {
	$('#voucherId').val(id);
}
function html(src, imgName, index) {
	var methodUrl = $("#methodUrl").val();
	var html = '<li style="display:inline-block; padding:15px 14px">';
	html += '<img src="'
			+ document.getElementsByTagName('base')[0].href
			+ 'images/'
			+ src
			+ '" name="weixin_show" style="width:145px; margin-left: 20px;" data-holder-rendered="true"/><br/>'
	if (imgName.length > 9) {
		var name = imgName.substring(0, 9);
		html += '<p title="' + imgName
				+ '" style="display:block;width:150px; padding-left:20px">'
				+ name + '...</p>';
	} else {
		html += '<p title="' + imgName
				+ '" style="display:block;width:150px; padding-left:20px">'
				+ imgName + '</p>';
	}
	html += '<input id="flie_path" data-val="true"  name="ConImg" type="hidden" value="'
			+ src + '" />';
	html += '<a style="margin-left:20px;" onclick="deletePicture(' + index
			+ ')" class="delete">删除</a>';
	html += '</li>';
	return html;
}
// 删除凭证
function deletePicture(index) {
	var methodUrl = $("#methodUrl").val();
	for (var i = 0; i < pathArray.length; i++) {
		if (index == pathArray[i].id) {
			// 通过Ajax向后台传值
			$.ajax({
				type : "POST",
				url : methodUrl + 'platform/deleteUploadVoucherTemp.act',
				data : {
					path : pathArray[i].path
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
				}
			});
			pathArray.splice(i, 1);
			break;
		}
	}
	$("#imagesID").children().remove();
	setScrollbar(pathArray,"imagesID");
	for (var j = 0; j < pathArray.length; j++) {
		$("#imagesID").append(
				html(pathArray[j].path, pathArray[j].name, pathArray[j].id));
	}
}
// 保存已上传的凭证
function uploadVoucher() {

	var methodUrl = $("#methodUrl").val();
	// 取得上传图片对应的数据ID
	var id = $("#voucherId").val();
	var info_id = $("#info_id").val();
	// 取得所有上传图片的文件名
	var filePaths = new Array();
	$("#imagesID input[name=ConImg]").each(function(i) {
		filePaths[i] = $(this).val();
	});
	if (filePaths.length == 0) {
		$("#upload_voucher").tips({
			side : 2,
			msg : "请选择需要上传的图片文件。",
			bg : '#AE81FF',
			time : 2
		});
	}
	// 通过Ajax向后台传值
	$.ajax({
		type : "POST",
		url : methodUrl + 'platform/uploadVoucher.act',
		data : {
			id : id,
			info_id : info_id,
			file_paths : JSON.stringify(pathArray)
		},
		dataType : 'json',
		cache : false,
		success : function(data) {
			$('#uploadVoucherModal').modal('hide');
			location.reload();
		}
	});
}
// 预览凭证
function viewExpenseVoucher(id) {
	var methodUrl = $("#methodUrl").val();
	$("#voucherDetailId").val(id);
	// 通过Ajax向后台传值
	$.ajax({
		type : "POST",
		url : methodUrl + 'platform/listVoucher.act',
		data : {
			id : id
		},
		dataType : 'json',
		cache : false,
		success : function(data) {
			var List = data.voucherlist;
			setScrollbar(List,"voucherID");
			for (var i = 0; i < List.length; i++) {
				$("#voucherID").append(
						voucherhtml(List[i].file_path, List[i].file_name,
								List[i].id));
			}
		}
	});
}
// 展示凭证
function voucherhtml(src, imgName, id) {
	var methodUrl = $("#methodUrl").val();
	var html = '<li style="display:inline-block; padding:15px 14px">';
	html += '<img src="'
			+ document.getElementsByTagName('base')[0].href
			+ 'images/'
			+ src
			+ '" name="weixin_show" style="width:140px; margin-left: 20px;" data-holder-rendered="true"/><br/>'
	if (imgName.length > 9) {
		var name = imgName.substring(0, 9);
		html += '<p title="' + imgName
				+ '" style="display:block;width:150px; padding-left:20px">'
				+ name + '...</p>';
	} else {
		html += '<p title="' + imgName
				+ '" style="display:block;width:150px; padding-left:20px">'
				+ imgName + '</p>';
	}
	html += '<input id="flie_path" data-val="true"  name="ConImg" type="hidden" value="'
			+ src + '" />';
	html += '<a style="margin-left:20px;" onclick="deleteLocalPicture(' + id
			+ ')" class="delete">删除</a>';
	html += '</li>';
	return html;
}
// 删除本地图片
function deleteLocalPicture(id) {
	var methodUrl = $("#methodUrl").val();
	var detail_info_id = $("#voucherDetailId").val();
	$.ajax({
		type : "POST",
		url : methodUrl + 'platform/delVoucher.act',
		data : {
			id : id,
			detail_info_id : detail_info_id
		},
		dataType : 'json',
		cache : false,
		success : function(data) {
			$("#voucherID").children().remove();
			var List = data.voucherlistdel;
			setScrollbar(List,"voucherID");
			for (var i = 0; i < List.length; i++) {
				$("#voucherID").append(
						voucherhtml(List[i].file_path, List[i].file_name,
								List[i].id));
			}
		}
	});
}
// 预览凭证
function view(pdf_id, info_id) {
	var methodUrl = $("#methodUrl").val();
	var ret = false;
	$.ajax({
		type : "POST",
		url : methodUrl + 'platform/viewVoucher.act',
		dataType : 'json',
		data : {
			id : info_id,
		},
		cache : false,
		async : false,
		success : function(data) {
			if (data.responseStr == "OK") {
				var path = data.responsePath;
				$("#view" + info_id).attr('href', document.getElementsByTagName('base')[0].href+'images/' + path);
				ret = true;
			} else {
				$('#my-modal-success-alert').show().delay(1000).fadeOut();
				ret = false;
			}
		}
	});
	return ret;
}
function OK() {
	var methodUrl = $("#methodUrl").val();
	var total_money = $('#expensesTotal').val();
	var id = $('#ex_info_id').val();
	var info_id = $('#info_id').val();
	var level = $('#level').val();
	if (valiteExpensesDetail1()) {
		location.href = methodUrl
				+ 'platform/saveTotalExpenses.act?total_money=' + total_money
				+ '&id=' + id + '&info_id=' + info_id + '&level=' + level;
	}
}

function setScrollbar(list,id){
	if(list.length>0){
		addScrollbar($("#"+id).parent());
	}else{
		delScrollbar($("#"+id).parent());
	}
}
function addScrollbar(obj){
	if(!obj.is('.voucher-scrollbar')){
		obj.addClass('voucher-scrollbar');
	}
}

function delScrollbar(obj){
	if(obj.is('.voucher-scrollbar')){
		obj.removeClass('voucher-scrollbar');
	}
}