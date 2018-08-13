$(function(){
	$("#delete-question-btn").click(function(){
			dels()
	});
});

// 删除操作
function Delete() {
	var question_id = $("#question_id").val();
	$.post(document.getElementsByTagName('base')[0].href+'company/delQuestion.act', { 'id': question_id }, function (data) {
	if (data.result == 'success') {
			window.opener.location.reload(false);
			window.close();
	}
	});
}

// 删除试题
function dels() {
	$("#delete-question-btn").attr("data-target", "#delquestion");
	$("#delquestion").attr("data-target", "");
}