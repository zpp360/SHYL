$(function() {
	//点击确认按钮，提交答案
	$("#testPaperSubmit .btn-success").click(function() {
		finishExam();
	});
	//点击确认按钮，提交答案
	$("#occupationtestPaperSubmit .btn-success").click(function() {
		 countOccupationPoint();
	});
	//点击确认按钮，提交答案
	$("#abilityTestPaperSubmit .btn-success").click(function() {
		 countAbilityPoint();
	});
});
function countOccupationPoint(){
	var exam_history_id = $("#hist-id").val();
	var methodurl = $("#methodurl").val();
	var field_id = $("#field_id").val();
	var num = $("#leng").val(); // 所有记录数
	var point = 0;
	for(var i=1;i<=num;i++){
		if($(".zycp-st").find("input[name='question-radio"+i+"']:checked").length>0){	
			var p = Number($(".zycp-st").find("input[name='question-radio"+i+"']:checked").val());
			point=p+point;
		}
	}
	var request =  $.ajax({
		type : "POST",
		url : methodurl + "evaluation/occupationtestPaperSubmit.act",
		data : {
			id : exam_history_id,
			point : point,
			field_id:field_id
		},
		dataType : 'json',
		cache : false
		
	});
	request.done(function(message, tst, jqXHR) {
		if (message.result == "success") {
			window.location.href = methodurl
			+ "evaluation/showAbilityResult.act?examPaperId="
			+ $("#paper-id").val()+"&field_id="+field_id;
		} else {
			$('#my-modal-failure-alert').show().delay(1000).fadeOut();
		}
	});
	request.fail(function(jqXHR, textStatus) {
		util.warming("提交失败，稍后请重新提交");

	});
}
function countAbilityPoint(){
	var exam_history_id = $("#hist-id").val();
	var methodurl = $("#methodurl").val();
	var field_id = $("#field_id").val();
	var num = $("#hashLen").val(); // 所有记录数
	var point = 0;
	for(var i=1;i<=num;i++){
		if($(".nlcp-st").find("input[name='question-radio"+i+"']:checked").length>0){	
			var p = Number($(".nlcp-st").find("input[name='question-radio"+i+"']:checked").val());
			point=p+point;
		}
	}
	var request =  $.ajax({
		type : "POST",
		url : methodurl + "evaluation/occupationtestPaperSubmit.act",
		data : {
			id : exam_history_id,
			point : point,
			field_id:field_id
		},
		dataType : 'json',
		cache : false
		
	});
	request.done(function(message, tst, jqXHR) {
		if (message.result == "success") {
			window.location.href = methodurl
			+ "evaluation/showAbilityResult.act?examPaperId="
			+ $("#paper-id").val()+"&field_id="+field_id;
		} else {
			$('#my-modal-failure-alert').show().delay(1000).fadeOut();
		}
	});
	request.fail(function(jqXHR, textStatus) {
		util.warming("提交失败，稍后请重新提交");

	});
}
function finishExam() {
	var answerSheet = genrateAnswerSheet();
	var data = new Object();
	var exam_history_id = $("#hist-id").val();
	var field_id = $("#field_id").val();
	data.exam_history_id = exam_history_id;
	data.as = answerSheet;
	var methodurl = $("#methodurl").val();
	var request = $.ajax({
		type : "POST",
		url : methodurl + "evaluation/abilityPaperSubmit.act",
		data : {
			id : exam_history_id,
			as : JSON.stringify(answerSheet)
		},
		dataType : 'json',
		cache : false
	});
	request.done(function(message, tst, jqXHR) {
		if (message.result == "success") {
			$(window).unbind('beforeunload');
			window.location.href = methodurl
			+ "evaluation/showAbilityResult.act?examPaperId="
			+ $("#paper-id").val()+"&field_id="+field_id;
		} else {
			$('#my-modal-failure-alert').show().delay(1000).fadeOut();
		}
	});
	request.fail(function(jqXHR, textStatus) {
		util.warming("提交失败，稍后请重新提交");

	});
}
function genrateAnswerSheet() {
	var as = {};
	var questions = $(".cpst");
	for (var i = 0; i < questions.length; i++) {
		var answerSheetItem = new Object();
		var radio_checked = $(questions[i]).find("input[type=radio]:checked");
		var radio_all = $(questions[i]).find("input[type=radio]");
		if (radio_checked.length == 0) {
			answerSheetItem.answer = "";
		} else {
			var current_index = $(radio_all).index(radio_checked);
			answerSheetItem.answer = String.fromCharCode(65 + current_index);
		}
		answerSheetItem.question_type_id = 1;
		answerSheetItem.point = 0;
		var tmpkey = $(questions[i]).find(".question-id").val();
		var tmpvalue = answerSheetItem;
		as[tmpkey] = tmpvalue;
	}
	return as;
}
function goPageAbility(pno, psize) {
	var num = $("#hashLen").val();
	var totalPage = 0; //总页数
	var pageSize = psize;//每页显示行数
	//总共分几页 
	if (num / pageSize > parseInt(num / pageSize)) {
		totalPage = parseInt(num / pageSize) + 1;
	} else {
		totalPage = parseInt(num / pageSize);
	}
	var currentPage = pno;//当前页数
	var startRow = (currentPage - 1) * pageSize + 1;//开始显示的行  31 
	var endRow = currentPage * pageSize;//结束显示的行   40
	endRow = (endRow > num) ? num : endRow; //40
	//遍历显示数据实现分页
	for (var i = 1; i < (num+1); i++) {
		if (i >= startRow && i <= endRow) {
			$("#questionIndex_" + i).css("display", "block");
		} else {
			$("#questionIndex_" + i).css("display", "none");
		}
	}
	var tempStr = "";
	if (currentPage == 1 && totalPage == 1) {
		tempStr +="<button class=\"nl-btn1\" style=\"margin-right: 5px;\" onClick=\"goPageAbility("
			+ (1) + "," + psize + ")\">首页</button>";
		tempStr += "<button class=\"nl-btn2\" style=\"margin-right: 5px;\"  onclick=\"alertAbilityPage("+3+")\">上一页</button>";
		tempStr += "<button class=\"nl-btn2\" style=\"margin-right: 5px;\"  onclick=\"alertAbilityPage("+3+")\">下一页</button>";
		tempStr += "<button class=\"nl-btn3\" style=\"margin-right: 5px;\" onclick=\"logint()\">交卷</button><label>共50道题</label>";
	}
	if (currentPage == 1 && totalPage > 1) {
		tempStr +="<button class=\"nl-btn1\" style=\"margin-right: 5px;\" onClick=\"goPageAbility("
			+ (1) + "," + psize + ")\">首页</button>";
		tempStr += "<button class=\"nl-btn2\" style=\"margin-right: 5px;\"  onclick=\"alertAbilityPage("+1+")\">上一页</button>";
		tempStr += "<button class=\"nl-btn2\" style=\"margin-right: 5px;\" onClick=\"goPageAbility("
				+ (currentPage + 1) + "," + psize + ")\">下一页</button>";
		tempStr += "<button class=\"nl-btn3\" style=\"margin-right: 5px;\" onclick=\"logint()\">交卷</button><label>共50道题</label>";
	}
	if (currentPage > 1 && currentPage < totalPage) {
		tempStr +="<button class=\"nl-btn1\" style=\"margin-right: 5px;\" onClick=\"goPageAbility("
			+ (1) + "," + psize + ")\">首页</button>";
		tempStr += "<button class=\"nl-btn2\" style=\"margin-right: 5px;\" onClick=\"goPageAbility("
				+ (currentPage - 1) + "," + psize + ")\">上一页</button>";
		tempStr += "<button class=\"nl-btn2\" style=\"margin-right: 5px;\" onClick=\"goPageAbility("
				+ (currentPage + 1) + "," + psize + ")\">下一页</button>";
		tempStr += "<button class=\"nl-btn3\" style=\"margin-right: 5px;\" onclick=\"logint()\">交卷</button><label>共50道题</label>";
	}
	if (currentPage > 1 && currentPage == totalPage) {
		tempStr +="<button class=\"nl-btn1\" style=\"margin-right: 5px;\" onClick=\"goPageAbility("
			+ (1) + "," + psize + ")\">首页</button>";
		tempStr += "<button class=\"nl-btn2\" style=\"margin-right: 5px;\" onClick=\"goPageAbility("
				+ (currentPage - 1) + "," + psize + ")\">上一页</button>";
		tempStr += "<button class=\"nl-btn2\" style=\"margin-right: 5px;\" onclick=\"alertAbilityPage("+2+")\">下一页</button>";
		tempStr += "<button class=\"nl-btn3\" style=\"margin-right: 5px;\" onclick=\"logint()\">交卷</button><label>共50道题</label>";
	}
	document.getElementById("barcon").innerHTML = tempStr;
}
function alertAbilityPage(page){
	 if(page==1){
		  $('#my-modal-success-alert .modal-body label').text("已经是首页了!");
	 }else if(page==2){
		  $('#my-modal-success-alert .modal-body label').text("已经是尾页了!");
	 }else{
		  $('#my-modal-success-alert .modal-body label').text("共一页!");
	 }
	  $('#my-modal-success-alert').show ().delay (1000).fadeOut ();
}
