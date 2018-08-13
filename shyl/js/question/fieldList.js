var locat = document.getElementsByTagName('base')[0].href
$(function() {
	// 下拉框
	$(".chzn-select").chosen();
	$(".chzn-select-deselect").chosen({
		allow_single_deselect : true
	});
	// 复选框
	$('table th input:checkbox').on(
			'click',
			function() {
				var that = this;
				$(this).closest('table').find(
						'tr > td:first-child input:checkbox').each(function() {
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});

			});
});

// 新增
function add() {
	window.location = locat + "/testquestion/to_Add.do";
}

// 详情
function info(field_id) {
	window.location = locat + "/testquestion/to_Preview.do?questionId="
			+ field_id;
}
