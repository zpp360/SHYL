$(function() {
	$('#expensesTypeModal').on('hidden.bs.modal', function() {
		$("input[name='expensesTypeClear']").trigger("click");
	});
});
// 添加费用类型
function expensesTypeSave() {
	var methodUrl = $("#methodUrl").val();
	// 活动类型
	var expensesType = $("#expensesType").val();
	var info_id = $("#info_id").val();
	if (valiteExpensesType()) {
		$.ajax({
			type : "POST",
			url : methodUrl + 'platform/expensesTypeSave.act',
			data : {
				meeting_name : expensesType,
				info_id : info_id
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				$("#expensesTypeModal").modal('hide');
				location.reload();
				$("input[name='expensesTypeClear']").trigger("click");
				return false;
			}
		});
	}
}
// 验证费用类型
function valiteExpensesType() {
	// 活动类型
	var expensesType = $("#expensesType").val();
	if (expensesType == "") {
		$("#expensesType").tips({
			side : 2,
			msg : '请输入活动',
			bg : '#AE81FF',
			time : 3
		});
		$("#expensesType").focus();
		return false;
	}
	return true;
}
// 验证修改费用类型
function valiteModifyExpensesType() {
	// 活动类型
	var expensesType = $("#expensesTypeUpd").val();
	if (expensesType == "") {
		$("#expensesTypeUpd").tips({
			side : 2,
			msg : '请输入活动',
			bg : '#AE81FF',
			time : 3
		});
		$("#expensesTypeUpd").focus();
		return false;
	}
	return true;
}
// 修改费用类型
function ExpensesTypeUpd() {
	var methodUrl = $("#methodUrl").val();
	var id = $("#expensesTypeId").val();
	var meeting_name = $("#expensesTypeUpd").val();
	if (valiteModifyExpensesType()) {
		$.ajax({
			type : "POST",
			url : methodUrl + 'platform/UpdExpensesType.act',
			data : {
				meeting_name : meeting_name,
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
// 修改费用类型
function modifyExpenseType(id) {
	var methodUrl = $("#methodUrl").val();
	$.ajax({
		type : "POST",
		url : methodUrl + 'platform/selectExpensesType.act',
		data : {
			id : id
		},
		dataType : 'json',
		cache : false,
		success : function(data) {
			$("#expensesTypeUpd").val(data.meeting_name);
			$("#expensesTypeId").val(data.id);
		}
	});
}
// 删除费用类型模态框加载
function delExpenseType(id) {
	$("#delExpenseId").val(id);
}
// 删除费用类型
function DeleteExpenseType() {
	var methodUrl = $("#methodUrl").val();
	var id = $("#delExpenseId").val();
	$.ajax({
		type : "POST",
		url : methodUrl + 'platform/delExpenseType.act',
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
//调用批量导入功能
function upEx(){
	var methodUrl = $("#methodUrl").val();
	var options = {
			url:methodUrl + 'platform/uploadEx.act',
	        data:{
	        	info_id:$("#info_id").val(), alias:"expDetail"},
				getresult: function(data) {fileuploaddoneExcel();},
				fileNmae:"企业交流费用汇总.xlsx",
				filePath:"templateFiles/expDetail.xlsx"
	 };
	fileuploadExcel(options);
}

//批量导入回调函数
function fileuploaddoneExcel(){
	var methodUrl = $("#methodUrl").val();
	location.href = methodUrl+'platform/expensesTypelist.act?info_id='+$('#info_id').val();
}