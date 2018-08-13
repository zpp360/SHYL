// 刷新试题导航
function refreshNavi() {
	$("#question-navi-content").empty();
	var questions = $("li.question");

	questions.each(function(index) {
		var btnhtml = "<a class=\"question-navi-item\">" + (index + 1) + "</a>";
		$("#question-navi-content").append(btnhtml);
	});
}

// 更新题目简介信息
function updateSummery(){
	if ($(".question").length == 0) {
		$("#exampaper-desc").empty();
		$("#exampaper-total-point").text(0);
		return false;
	}
	var questiontypes=[
	                   {
	                	   "name" : "单选题",
	                	   "code" : "qt-singlechoice"
	                   },{
	                	   "name" : "多选题",
	                	   "code" : "qt-multiplechoice"
	                   },{
	                	   "name" : "判断题",
	                	   "code" : "qt-trueorfalse"
	                   }];
	
	var summery = "";
	for (var i = 0; i < questiontypes.length; i++) {
		var question_sum_q = $("." + questiontypes[i].code).length;
		if (question_sum_q == 0) {
			continue;
		} else {
			summery = summery + "<span class=\"exampaper-filter-item efi-" + questiontypes[i].code + "\">" 
			+ questiontypes[i].name + "[<span class=\"efi-tno\">" 
			+ $("." + questiontypes[i].code).length + "</span>]<span class=\"efi-qcode\" style=\"display:none;\">" 
			+ questiontypes[i].code + "</span></span>";
		}
	}
	$("#exampaper-desc").html(summery);
	
	doQuestionFilt($($(".exampaper-filter-item")[0]).find(".efi-qcode").text());
	
	refreshTotalPoint();
}

// 切换到指定的题型 
function doQuestionFilt(questiontype) {
	if($("#exampaper-desc .efi-" + questiontype).hasClass("efi-selected")){
		return false;
	}else{
		var questions = $("li.question");
		questions.hide();
		$("#exampaper-body ." + questiontype).show();
		
		$(".exampaper-filter-item").removeClass("efi-selected");
		$("#exampaper-desc .efi-" + questiontype).addClass("efi-selected");
	}
}

// 计算总分
function refreshTotalPoint(){
	var question_sum_p_all = 0;
	var point_array = $(".question-point");
	for(var i = 0; i<point_array.length;i++){
		var pointtmp = parseFloat($(point_array[i]).text());
		
		if(isNaN(pointtmp)){
			continue;
		}else{
			question_sum_p_all = question_sum_p_all + pointtmp * 10;
		}
	}
	$("#exampaper-total-point").text(question_sum_p_all/10);
}

// 对题目重新编号排序
function addNumber() {
	var questions = $("li.question");

	questions.each(function(index) {
		$(this).find(".question-no").text(index + 1 + ".");
	});
}

//切换考题类型事件
function bindQuestionFilter() {
	$("#exampaper-desc").delegate("span.exampaper-filter-item", "click", function() {
		var qtype = $(this).find(".efi-qcode").text();
		doQuestionFilt(qtype);
	});
}

//绑定答题卡
function bindNaviBehavior() {
	var nav = $("#question-navi");
	var naviheight = $("#question-navi").height() - 33;

	$("#exampaper-footer").height($("#question-navi").height());

	nav.css({
		position : 'fixed',
		bottom : '0px',
		"z-index" : '1'	
	});
	$("#question-navi-controller").click(function() {
		if($("#question-navi-content").is(":visible") ){
			$("#question-navi-content").hide();
		}else{
			$("#question-navi-content").show();
		}
	});
}

//绑定考题focus事件(点击考题导航)
function bindfocus() {
	$("#question-navi").delegate("a.question-navi-item ", "click", function() {
		var clickindex = $("a.question-navi-item").index(this);
		var questions = $("li.question");
		var targetQuestion = questions[clickindex];
		
		var targetQuestionType = $(questions[clickindex]).find(".question-type").text();
		
		doQuestionFilt("qt-" + targetQuestionType);
		
		scrollToElement($(targetQuestion));
	});
}

function scrollToElement(selector, time, verticalOffset) {
	time = typeof (time) != 'undefined' ? time : 500;
	verticalOffset = typeof (verticalOffset) != 'undefined' ? verticalOffset : 0;
	element = $(selector);
	offset = element.offset();
	offsetTop = offset.top + verticalOffset;
	$('html, body').animate({
		scrollTop : offsetTop
	}, time);
}

//删除按钮
function addRemoveBtn() {
	var deletehtml = "<a class=\"tmp-ques-remove\" title=\"删除此题\"> 删除</a>";
	$(".question-title").append(deletehtml);
}