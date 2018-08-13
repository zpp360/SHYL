$(function() {
	modal.prepare();
	examing.initial();
});

var examing = {
	initial : function initial() {
		$(window).scroll(examing.fixSideBar);
		this.refreshNavi();
		this.bindNaviBehavior();
		this.addNumber();
		this.bindOptClick();
		this.bindCheckboxRadioClick();
		this.updateSummery();
		this.bindQuestionFilter();
		this.bindfocus();
		this.bindFinishOne();
		this.startTimer();
		this.bindSubmit();
	},
	
	fixSideBar : function fixSideBar() {
		var nav = $("#bk-exam-control");
		var title = $("#exampaper-title");
		var container = $("#exampaper-desc-container");
		if ($(this).scrollTop() > 147) {
			nav.addClass("fixed");
			title.addClass("exampaper-title-fixed");
			container.addClass("exampaper-desc-container-fixed");
			
		} else {
			nav.removeClass("fixed");
			title.removeClass("exampaper-title-fixed");
			container.removeClass("exampaper-desc-container-fixed");
		}
	},


	bindNaviBehavior : function bindNaviBehavior() {

		var nav = $("#question-navi");
		var naviheight = $("#question-navi").height() - 33;
		var bottompx = "-" + naviheight + "px;";

		var scrollBottomRated = $("footer").height() + 2 + 100 + naviheight;

		//$("#exampaper-footer").height($("#question-navi").height());

		nav.css({
			position : 'fixed',
			bottom : '0px',
			"z-index" : '1'	
		});
		$("#question-navi-controller").click(function() {
			var scrollBottom = document.body.scrollHeight - $(window).scrollTop() - $(window).height();

			var nav = $("#question-navi");
			var attr = nav.attr("style");

			if (nav.css("position") == "fixed") {
				if (nav.css("bottom") == "0px") {
					nav.css({
						bottom : "-" + naviheight + "px"
					});
				} else {
					nav.css({
						bottom : 0
					});
				}

			}

		});

	},

	securityHandler : function securityHandler() {
		// 右键禁用
		if (document.addEventListener) {
			document.addEventListener("contextmenu", function(e) {
				 e.preventDefault();
			 }, false);
		} else {
			document.attachEvent("contextmenu", function(e) {
				 e.preventDefault();
			 });
		}

		$(window).bind('beforeunload', function() {
			return "考试正在进行中...";
		});
	},

	/**
	 * 刷新试题导航
	 */
	refreshNavi : function refreshNavi() {
		$("#exam-control #question-navi").empty();
		var questions = $("li.question");

		questions.each(function(index) {
			var btnhtml = "<a class=\"question-navi-item\">" + (index + 1) + "</a>";
			$("#question-navi-content").append(btnhtml);
		});
	},

	/**
	 * 更新题目简介信息
	 */
	updateSummery : function updateSummery() {
		if ($(".question").length === 0) {
			return false;
		}
		var questiontypes = this.questiontypes;
		var summery = "";
		for (var i = 0; i < questiontypes.length; i++) {
			var question_sum_q = $("." + questiontypes[i].code).length;
			if (question_sum_q == 0) {
				continue;
			} else {
				summery = summery + "<span class=\"exampaper-filter-item efi-" + questiontypes[i].code + "\">" 
				+ questiontypes[i].name + "【<span class=\"efi-fno\">0</span>/<span class=\"efi-tno\">" 
				+ $("." + questiontypes[i].code).length + "</span>】<span class=\"efi-qcode\" style=\"display:none;\">" 
				+ questiontypes[i].code + "</span></span>";
			}
		}
		$("#exampaper-desc").html(summery);
		
		examing.doQuestionFilt($($(".exampaper-filter-item")[0]).find(".efi-qcode").text());
	},

	questiontypes : new Array({
		"name" : "单选题",
		"code" : "qt-singlechoice"
	}, {
		"name" : "多选题",
		"code" : "qt-multiplechoice"
	}, {
		"name" : "判断题",
		"code" : "qt-trueorfalse"
	}, {
		"name" : "填空题",
		"code" : "qt-fillblank"
	}, {
		"name" : "简答题",
		"code" : "qt-shortanswer"
	}, {
		"name" : "论述题",
		"code" : "qt-essay"
	}, {
		"name" : "分析题",
		"code" : "qt-analytical"
	}),
	/**
	 * 绑定考题focus事件(点击考题导航)
	 */
	bindfocus : function bindfocus() {
		$("#question-navi").delegate("a.question-navi-item ", "click", function() {
			var clickindex = $("a.question-navi-item").index(this);
			var questions = $("li.question");
			var targetQuestion = questions[clickindex];
			
			var targetQuestionType = $(questions[clickindex]).find(".question-type").text();
			
			examing.doQuestionFilt("qt-" + targetQuestionType);
			
			examing.scrollToElement($(targetQuestion));
		});
	},

	scrollToElement : function scrollToElement(selector, time, verticalOffset) {
		time = typeof (time) != 'undefined' ? time : 500;
		verticalOffset = typeof (verticalOffset) != 'undefined' ? verticalOffset : 0;
		element = $(selector);
		offset = element.offset();
		offsetTop = offset.top + verticalOffset-145;
		$('html, body').animate({
			scrollTop : offsetTop
		}, time);
	},
	/**
	 * 开始倒计时
	 */
	startTimer : function startTimer() {
		var timestamp = parseInt($("#exam-timestamp").text());
		var int = setInterval(function() {
			$("#exam-timestamp").text(timestamp);
			$("#exam-clock").text(examing.toHHMMSS(timestamp));
			if(timestamp < 600){
				var exam_clock = $("#question-time");
				exam_clock.removeClass("question-time-normal");
				exam_clock.addClass("question-time-warning");
			}
			
			timestamp-- || examing.examTimeOut(int); 
		}, 1000);
	},
	
	/**
	 * 考试时间到
	 * @param int
	 */
	examTimeOut : function examTimeOut (int){
		clearInterval(int);
		util.warming("考试时间结束，自动提交答题卡");
		//延迟处理
		setTimeout(function () {
			examing.finishExam();
		  }, 1500);
	},

	/**
	 * 时间formater
	 *
	 * @param timestamp
	 * @returns {String}
	 */
	toHHMMSS : function toHHMMSS(timestamp) {
		var sec_num = parseInt(timestamp, 10);
		var hours = Math.floor(sec_num / 3600);
		var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
		var seconds = sec_num - (hours * 3600) - (minutes * 60);

		if (hours < 10) {
			hours = "0" + hours;
		}
		if (minutes < 10) {
			minutes = "0" + minutes;
		}
		if (seconds < 10) {
			seconds = "0" + seconds;
		}
		var time = hours + ':' + minutes + ':' + seconds;
		return time;
	},

	/**
	 * 完成一道题触发的function
	 */
	bindFinishOne : function bindFinishOne() {
		$(".question input[type=radio]").change(function() {
			var current_index = $("li.question").index($(this).parent().parent().parent().parent());
			$($("a.question-navi-item")[current_index]).addClass("pressed");
		});
		$(".question input[type=checkbox]").change(function() {
			var current_question = $(this).parent().parent().parent().parent();
			var current_index = $("li.question").index(current_question);
			var checkedboxs = current_question.find("input[type=checkbox]:checked");
			if (checkedboxs.length > 0) {
				$($("a.question-navi-item")[current_index]).addClass("pressed");
			} else {
				$($("a.question-navi-item")[current_index]).removeClass("pressed");
			}
		});
	},
	/**
	 * 对题目重新编号排序
	 */
	addNumber : function addNumber() {
		var questions = $("li.question");

		questions.each(function(index) {
			$(this).find(".question-no").text(index + 1 + ".");
		});
	},

	/**
	 * 切换考题类型事件
	 */
	bindQuestionFilter : function bindQuestionFilter() {
		$("#exampaper-desc").delegate("span.exampaper-filter-item", "click", function() {
			var qtype = $(this).find(".efi-qcode").text();
			examing.doQuestionFilt(qtype);
		});
	},
	
	
	/**
	 *切换到指定的题型 
	 */
	doQuestionFilt : function doQuestionFilt(questiontype) {
		
		if($("#exampaper-desc .efi-" + questiontype).hasClass("efi-selected")){
			return false;
		}else{
			var questions = $("li.question");
			questions.hide();
			$("#exampaper-body ." + questiontype).show();
			
			$(".exampaper-filter-item").removeClass("efi-selected");
			$("#exampaper-desc .efi-" + questiontype).addClass("efi-selected");
		}
		
		
	},

	bindSubmit : function bindSubmit() {
		
		$("#testPaperSubmit .btn-success").click(function() {
				examing.finishExam();
		});
	},
	finishExam : function finishExam() {
		modal.showProgress();
		var answerSheet = examing.genrateAnswerSheet();
		var data = new Object();
		var exam_history_id = $("#hist-id").val();
		data.exam_history_id = exam_history_id;
		data.as = answerSheet;
		var methodurl = $("#methodurl").val();
		var timeStr = $("#exam-clock").text();
		var time = timeStr.split(":");
		var hours = parseInt(time[0]);
		var minutes = parseInt(time[1]);
		var seconds = parseInt(time[2]);
		var duration = hours * 3600 + minutes * 60 + seconds;
		$("#question-submit button").attr("disabled", "disabled");
		var request = $.ajax({
			type : "POST",
			url : methodurl+"evaluation/examSubmit.act",
			data :{
				id:exam_history_id,
		        as:JSON.stringify(answerSheet),
		        duration:duration
			},
			dataType :'json',
			cache : false
		});
		request.done(function(message, tst, jqXHR) {
			if (message.result == "success") {
				$(window).unbind('beforeunload');
				util.successed("交卷成功！", function() {
					window.location.href=methodurl+"consoleEvaluation/showTestResult.act?examPaperId="+ $("#paper-id").val();
				});
			} else {
				util.error(message.result);
				$("#question-submit button").removeAttr("disabled");
			}
			modal.hideProgress();
		});
		request.fail(function(jqXHR, textStatus) {
			modal.hideProgress();
			util.warming("提交失败，稍后请重新提交");
			$("#question-submit button").removeAttr("disabled");
			
		});
	},

	genrateAnswerSheet : function genrateAnswerSheet() {
		var as = {};
		var questions = $(".question");

		for (var i = 0; i < questions.length; i++) {
			var answerSheetItem = new Object();

			if ($(questions[i]).hasClass("qt-singlechoice")) {
				var radio_checked = $(questions[i]).find("input[type=radio]:checked");
				var radio_all = $(questions[i]).find("input[type=radio]");
				if (radio_checked.length == 0) {
					answerSheetItem.answer = "";
				} else {
					var current_index = $(radio_all).index(radio_checked);
					answerSheetItem.answer = String.fromCharCode(65 + current_index);
				}
				answerSheetItem.question_type_id = 1;
			} else if ($(questions[i]).hasClass("qt-multiplechoice")) {
				var checkbox_checked = $(questions[i]).find("input[type=checkbox]:checked");
				var checkbox_all = $(questions[i]).find("input[type=checkbox]");
				if (checkbox_checked.length == 0) {
					answerSheetItem.answer = "";
				} else {
					var tm_answer = "";
					for (var l = 0; l < checkbox_checked.length; l++) {
						var current_index = $(checkbox_all).index($(checkbox_checked[l]));
						tm_answer = tm_answer + String.fromCharCode(65 + current_index);
					}
					answerSheetItem.answer = tm_answer;
				}
				answerSheetItem.question_type_id = 2;
			} else if ($(questions[i]).hasClass("qt-trueorfalse")) {

				var radio_checked = $(questions[i]).find("input[type=radio]:checked");
				var radio_all = $(questions[i]).find("input[type=radio]");
				if (radio_checked.length == 0) {
					answerSheetItem.answer = "";
				} else {
					var current_index = $(radio_all).index(radio_checked);
					answerSheetItem.answer = (current_index == 0) ? "T" : "F";
				}
				answerSheetItem.question_type_id = 3;
			} else if ($(questions[i]).hasClass("qt-fillblank")) {
				answerSheetItem.answer = $(questions[i]).find("textarea").val();
				answerSheetItem.question_type_id = 4;
			} else if ($(questions[i]).hasClass("qt-shortanswer")) {
				answerSheetItem.answer = $(questions[i]).find("textarea").val();
				answerSheetItem.question_type_id = 5;
			} else if ($(questions[i]).hasClass("qt-essay")) {
				answerSheetItem.answer = $(questions[i]).find("textarea").val();
				answerSheetItem.question_type_id = 6;
			} else if ($(questions[i]).hasClass("qt-analytical")) {
				answerSheetItem.answer = $(questions[i]).find("textarea").val();
				answerSheetItem.question_type_id = 7;
			}
			answerSheetItem.point = 0;

			var tmpkey = $(questions[i]).find(".question-id").text();
			var tmpvalue = answerSheetItem;

			as[tmpkey] = tmpvalue;
		}
		return as;
	},
	bindOptClick : function bindOptClick(){
		$(".question-list-item").click(function(){
			$(this).parent().find(".question-list-item-selected").removeClass("question-list-item-selected");
			$(this).addClass("question-list-item-selected");
			$(this).find("input[type=radio]").prop("checked",true);
			//复选框处理开始
			//复选框选择文本，复选框处于选中状态与非选中状态的设置
			if($(this).parent().find(".question-list-item-selected").find('input[type=checkbox]').prop("checked")==true){
				$(this).find("input[type=checkbox]").prop("checked",false);
			}else if($(this).parent().find(".question-list-item-selected").find('input[type=checkbox]').prop("checked")==false){
				$(this).find("input[type=checkbox]").prop("checked",true);
			}
			//获取已做的单选题数量
			var selected = $("#exampaper-body").find(".qt-singlechoice .question-list-item-selected").length;
			//获取已做的判断题数量
			var selected3 = $("#exampaper-body").find(".qt-trueorfalse .question-list-item-selected").length;
			$(".efi-qt-singlechoice .efi-fno").text(selected);
			$(".efi-qt-trueorfalse  .efi-fno").text(selected3);
			//获取已做的多选题的数量
			var selected2 = 0;
			var list=document.getElementsByClassName("question_id");
			for(var i=0;i<list.length;i++){
			var id = list[i].innerHTML;
			if($("#exampaper-body").find(".qt-multiplechoice input[name='question-radio"+id+"']:checked").length>0){
				selected2++;
			}
			}
			$(".efi-qt-multiplechoice .efi-fno").text(selected2);
			//多选题每一题答完后，答题卡对应题号变灰
			var current_question = $(this).parent().parent().parent();
			var current_index = $("li.question").index(current_question);
			var checkedboxs = current_question.find("input[type=checkbox]:checked");
			if (checkedboxs.length > 0) {
				$($("a.question-navi-item")[current_index]).addClass("pressed");
			} else {
				$($("a.question-navi-item")[current_index]).removeClass("pressed");
			}
			//复选框处理结束
			//单选题每一题答完后，答题卡对应题号变灰
			var checkedradios = current_question.find("input[type=radio]:checked");
			if(checkedradios.length>0){
				$($("a.question-navi-item")[current_index]).addClass("pressed");
			}
		});
	},
	//复选框选择复选框图标的选中和非选中状态的设置
	bindCheckboxRadioClick : function bindCheckboxRadioClick(){
		$("input[type=checkbox]").click(function(){
			if($(this).prop("checked")){
				$(this).prop("checked",false);
			}else{
				$(this).prop("checked",true);
			}
		});
	}
};

var modal = {
	prepare : function prepare() {
		$(".content").append("<div id=\"loading-progress\" style=\"display:none;\"><div id=\"loading-content\"> <h2>正在提交您的答案</h2><img class=\"loading-gif\" src=\"shyl/images/loading.gif\"/><div> </div>");

	},
	showProgress : function showProgress() {
		$("#loading-progress").show();
	},

	hideProgress : function hideProgress() {
		$("#loading-progress").hide();
	}
};


