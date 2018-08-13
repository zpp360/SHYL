$(function() {
	question_add.initial();

});

question_add = {
	initial : function initial() {
		this.bindAddPoint();
		this.bindChangeQuestionType();
		this.bindAddOpt();
		this.bindRemoveOpt();
		this.bindSubmit();
	},

	bindChangeQuestionType : function changeQuestionType() {
		$("#question-type select").change(function() {
			if (1 == $(this).val()) {
				$(".correct-answer").hide();
				$(".form-question-opt").show();
				$(".form-question-answer1").show();
				copyToAnswer();
			} else if (2 == $(this).val()) {
				$(".correct-answer").hide();
				$(".form-question-opt").show();
				$(".form-question-answer-muti").show();
				copyToAnswer();
			} else if (3 == $(this).val()) {
				$(".correct-answer").hide();
				$(".form-question-opt").hide();
				$(".form-question-answer-boolean").show();
			} else {
				$(".correct-answer").hide();
				$(".form-question-opt").hide();
				$(".form-question-answer-text").show();
			}

		});
	},

	bindSubmit : function bindSubmit() {
		$("#question-add-form").submit(function() {
			var verify_result = question_add.verifyInput();
			if (verify_result) {
				var question_entity = question_add.composeEntity();
//				var field_id = $("#field_id").val();
//				var point_id = $("#point_id").val();
//				var question_type_id = $("#question_type_id").val();
				var locat = document.getElementsByTagName('base')[0].href;
			    $.ajax({
				    type : "POST",
				    url :  locat+'company/addQuestion.act',
					data : {
						data : JSON.stringify(question_entity)
						},
					dataType : 'json',
					cache : false,
					success : function(message, tst, jqXHR) {
						if (message.result == "success") {
							// 跳转到试题一览页面
							window.location.href = locat+"company/toQuestionsList.act";
						} 
					}
				});
			}
			return false;
		});
	},

	/**
	 * 检查输入合法性
	 */
	verifyInput : function verifyInput() {
		$(".form-message").empty();
		$(".has-error").removeClass("has-error");
		var question_type = $("#question-type select").val();
		var result = true;
		result = result && question_add.checkKnowledge();
		if (!result) {
			return false;
		}
		if (1 == question_type) {
			var r_checkContent = question_add.checkContent();
			if (!r_checkContent) {
				return false;
			}
			var r_checkOpt = question_add.checkOpt();
			result = result && r_checkContent && r_checkOpt;
			if (!result) {
				return false;
			}
		} else if (2 == question_type) {
			var r_checkContent = question_add.checkContent();
			if (!r_checkContent) {
				return false;
			}
			var r_checkOpt = question_add.checkOpt();
			if (!r_checkOpt) {
				return false;
			}
			var r_checkAnswerMuti = question_add.checkAnswerMuti();
			result = result && r_checkContent && r_checkOpt && r_checkAnswerMuti;
			if (!result) {
				return false;
			}
		} else if (3 == question_type) {
			var r_checkContent = question_add.checkContent();
			result = result && r_checkContent;
			if (!result) {
				return false;
			}
		} else {
			var r_checkContent = question_add.checkContent();
			if (!r_checkContent) {
				return false;
			}
			var r_checkAnswerText = question_add.checkAnswerText();
			result = result && r_checkContent && r_checkAnswerText;
			if (!result) {
				return false;
			}
		}
		var r_checkAnalysis = question_add.checkAnalysis();
		if (!r_checkAnalysis) {
			return false;
		}
		var r_checkReference = question_add.checkReference();
		if (!r_checkReference) {
			return false;
		}
		var r_checkExamingPoint = question_add.checkExamingPoint();
		if (!r_checkExamingPoint) {
			return false;
		}
		var r_checkKeyword = question_add.checkKeyword();
		if (!result) {
			return false;
		}
		result = result && r_checkAnalysis && r_checkReference && r_checkExamingPoint && r_checkKeyword;

		return result;
	},

	checkKnowledge : function checkKnowledge() {
		var result = true;

		if ($("#point-to-select option").length == 0) {
			$("#point-to-select").tips({
    			side : 2,
    			msg : '该试题至少对应一个知识点',
    			bg : '#AE81FF',
    			time : 3
    		});
			result = false;
		} else if ($("#point-to-select option").length > 1) {
			$("#point-to-select").tips({
    			side : 2,
    			msg : '知识点数量不应该超过1个',
    			bg : '#AE81FF',
    			time : 3
    		});
			result = false;
		}

		return result;

	},

	/**
	 *检查试题内容
	 */
	checkContent : function checkContent() {
		var content = $(".question-content textarea").val();
		if (content == "") {
			$(".question-content textarea").tips({
    			side : 2,
    			msg : '请输入试题内容',
    			bg : '#AE81FF',
    			time : 3
    		});
			$(".question-content textarea").focus();
			return false;
		} else if (content.length > 500) {
			$(".question-content textarea").tips({
    			side : 2,
    			msg : '内容过长，请保持在500个字符以内',
    			bg : '#AE81FF',
    			time : 3
    		});
			$(".question-content textarea").focus();
			return false;
		} else {
			return true;
		}
	},

	/**
	 *检查选项内容
	 */
	checkOpt : function checkOpt() {
		var question_opt_items = $(".inputCssST");
		var result = true;
		for (var i = 0; i < question_opt_items.length; i++) {
			var item_value = question_opt_items[i].value;
			if (item_value == "") {
				$(question_opt_items[i]).tips({
	    			side : 2,
	    			msg : '请输入选项内容',
	    			bg : '#AE81FF',
	    			time : 3
	    		});
				$(question_opt_items[i]).focus();
				result = false;
				break;
			} else if (item_value.length > 100) {
				$(question_opt_items[i]).tips({
	    			side : 2,
	    			msg : '选项内容请保持在100个字符以内',
	    			bg : '#AE81FF',
	    			time : 3
	    		});
				$(question_opt_items[i]).focus();
				result = false;
				break;
			}
		}
		return result;
	},

	/**
	 *检查多选题选项选择情况
	 */
	checkAnswerMuti : function checkAnswerMuti() {
		var muti_answer_opts = $(".form-question-answer-muti input[type=checkbox]:checked");
		if(muti_answer_opts.length==0){
			$("#questionAnswer").tips({
				side : 2,
				msg : '请至少选择一个选项',
				bg : '#AE81FF',
				time : 3
			});
			$("#questionAnswer").focus();
			return false;
		}
		return true;
	},

	/**
	 *检查参考答案选择情况
	 */
	checkAnswerText : function checkAnswerText() {
		var content = $(".form-question-answer-text textarea").val();
		if (content == "") {
			$(".form-question-answer-text .form-message").tips({
				side : 2,
				msg : '请输入参考答案',
				bg : '#AE81FF',
				time : 3
			});
			return false;
		} else if (content.length > 500) {
			$(".form-question-answer-text .form-message").tips({
				side : 2,
				msg : '内容过长，请保持在500个字符以内',
				bg : '#AE81FF',
				time : 3
			});
			return false;
		} else {
			return true;
		}
	},

	checkReference : function checkReference() {
		var content = $(".form-question-reference input").val();
		if (content.length > 50) {
			$(".form-question-reference .form-message").tips({
				side : 2,
				msg : '内容过长，请保持在50个字符以内',
				bg : '#AE81FF',
				time : 3
			});
			$(".form-question-reference input").focus();
			return false;
		} else
			return true;
	},
	
	checkExamingPoint : function checkExamingPoint() {
		var content = $(".form-question-examingpoint input").val();
		if (content.length > 50) {
			$(".form-question-examingpoint .form-message").tips({
				side : 2,
				msg : '内容过长，请保持在50个字符以内',
				bg : '#AE81FF',
				time : 3
			});
			$(".form-question-examingpoint input").focus();
			return false;
		} else
			return true;
	},
	checkKeyword : function checkKeyword() {
		var content = $(".form-question-keyword input").val();
		if (content.length > 50) {
			$(".form-question-keyword .form-message").tips({
				side : 2,
				msg : '内容过长，请保持在50个字符以内',
				bg : '#AE81FF',
				time : 3
			});
			$(".form-question-keyword input").focus();
			return false;
		} else
			return true;
	},

	checkAnalysis : function checkAnalysis() {
		var content = $(".form-question-analysis textarea").val();
		if (content.length > 500) {
			$(".form-question-analysis .form-message").tips({
				side : 2,
				msg : '内容过长，请保持在500个字符以内',
				bg : '#AE81FF',
				time : 3
			});
			$(".form-question-analysis textarea").focus();
			return false;
		} else
			return true;
	},

	/**
	 *添加一个选项
	 */

	bindAddOpt : function bindAddOpt() {

		$("#ques-add-opt").click(function() {
			var optlength = $(".form-question-opt .add-opt-item").length;
			if (optlength > 5) {
				$(".form-question-opt").tips({
					side : 1,
					msg : '选项不能超过6个',
					bg : '#AE81FF',
					time : 3
				});
				return false;
			}
			var text = "<span class=\"add-opt-item box\"><label class=\"que-opt-no\">" + String.fromCharCode(65 + optlength) + "</label><input type=\"text\" maxlength=\"100\" class=\"inputCss inputCssST\"/> <span class=\"add-img add-opt-img\">添加图片</span> <span><i class=\"small-icon ques-remove-opt fa fa-minus-square\" title=\"删除此选项\"></i></span> </span>";
			$(".add-opt-items").append(text);
			question_add.copyToAnswer();
		});
	},

	/**
	 *删除一个选项
	 */
	bindRemoveOpt : function bindRemoveOpt() {
		$(".form-question-opt").on("click", ".ques-remove-opt", function() {
			$(this).parent().parent().remove();
			question_add.rearrange();
			question_add.copyToAnswer();

		});

	},

	/**
	 *选项重新排序
	 */
	rearrange : function rearrange() {
		var opts = $(".form-question-opt .que-opt-no");
		opts.each(function(index) {
			$(this).text(String.fromCharCode(65 + index));
		});
	},

	/**
	 *
	 */
	bindAddPoint : function bindAddPoint() {
		$("#add-point-btn").click(function() {
			var field = $("#field-select > option:selected");
			var point = $("#point-from-select > option:selected");
			if (field.length == 0 || point.length == 0) {
				$("#point-from-select").tips({
	    			side : 2,
	    			msg : '请选择需要添加的知识点',
	    			bg : '#AE81FF',
	    			time : 3
	    		});
				return false;
			}

			var html = "<option value=\"" + point.attr("value") + "\">" + field.text() + " > " + point.text() + "</option>";
			var p = point.attr("value");
			if (!question_add.checkPointDuplicate(p)) {
				$("#point-from-select").tips({
	    			side : 2,
	    			msg : '不能重复添加',
	    			bg : '#AE81FF',
	    			time : 3
	    		});
				return false;
			}
			$("#point-to-select").empty();
			$("#point-to-select").append(html);
			return false;
		});

		$("#del-point-btn").click(function() {
			$("#point-to-select > option:selected").remove();
			return false;
		});

		$("#remove-all-point-btn").click(function() {
			$("#point-to-select").empty();
			return false;
		});
	},

	checkPointDuplicate : function checkPointDuplicate(p) {
		var points = $("#point-to-select option");
		for (var i = 0; i < points.length; i++) {
			var point = $(points[i]).attr("value");
			if (point == p)
				return false;
		}

		return true;
	},

	copyToAnswer : function copyToAnswer() {
		var questionType = $("#question-type select");
		var optlength = $(".inputCssST").length;
		if (1 == questionType.val()) {
			$(".form-question-answer1 select").empty();
			for (var i = 0; i < optlength; i++) {
				$(".form-question-answer1 select").append("<option value=\"" + String.fromCharCode(65 + i) + "\">" + String.fromCharCode(65 + i) + "</option>");
			}

		} else if (2 == questionType.val()) {
			$(".form-question-answer-muti .muti-opt-item").remove();
			for (var i = 0; i < optlength; i++) {
				$(".form-question-answer-muti .form-message").before("<span class=\"muti-opt-item\"><input type=\"checkbox\" value=\"" + String.fromCharCode(65 + i) + "\"/><label class=\"que-opt-no\">" + String.fromCharCode(65 + i) + "</label><br /></span>");
			}
		}
	},

	composeEntity : function composeEntity() {
		var question_entity = new Object();
		question_entity.name = $(".question-content textarea").val();
		question_entity.question_type_id = $(".question-type select").val();

		var pointList = new Array();
		var pointOpts = $("#point-to-select option");
		for (var i = 0; i < pointOpts.length; i++) {
			pointList.push($(pointOpts[i]).attr("value"));
		}

		question_entity.pointList = pointList;

		if (1 == question_entity.question_type_id) {
			question_entity.answer = $(".form-question-answer1 select").val();
		} else if (2 == question_entity.question_type_id) {
			var checkboxs = $(".form-question-answer-muti input:checked");
			var tmp_v = "";
			for (var i = 0; i < checkboxs.length; i++) {
				tmp_v = tmp_v + checkboxs[i].value;
			}
			question_entity.answer = tmp_v;

		} else if (3 == question_entity.question_type_id) {
			question_entity.answer = $(".form-question-answer-boolean select").val();
		} else {
			question_entity.answer = $(".form-question-answer-text textarea").val();
		}
		question_entity.questionContent = question_add.composeContent();

		question_entity.analysis = $(".form-question-analysis textarea").val();
		question_entity.referenceName = $(".form-question-reference input").val();
		question_entity.examingPoint = $(".form-question-examingpoint input").val();
		question_entity.keyword = $(".form-question-keyword input").val();
		return question_entity;
	},

	composeContent : function composeContent() {
		
		var question_type_id = $(".question-type select").val();
		var content = new Object();
		var content_img = $(".display-content-img");
		var content_img_string = content_img.data("url");
		content.title = $(".question-content textarea").val();
		var choiceMap = {};
		var imageMap = {};
		var pointList = new Array();
		
		$("point-to-select option").each(function(){
			pointList.push($(this).val());
		});
		if (content_img.length > 0) {
			content.titleImg = content_img_string;
		}
		if (1 == question_type_id) {
			var add_opt_items = $(".add-opt-item");

			for (var i = 0; i < add_opt_items.length; i++) {
				var add_opt_item = $(add_opt_items[i]);
				//选项标签
				var opt_img = add_opt_item.find(".display-opt-img");
				if (opt_img.length > 0) {
					imageMap[add_opt_item.children(".que-opt-no").text()] = opt_img.data("url");
				}
				choiceMap[add_opt_item.children(".que-opt-no").text()] = add_opt_item.children("input").val();
			}
			
		} else if (2 == question_type_id) {
			var add_opt_items = $(".add-opt-item");

			for (var i = 0; i < add_opt_items.length; i++) {
				var add_opt_item = $(add_opt_items[i]);
				//选项标签
				var opt_img = add_opt_item.find(".display-opt-img");
				if (opt_img.length > 0) {
					imageMap[add_opt_item.children(".que-opt-no").text()] = opt_img.data("url");
				}
				choiceMap[add_opt_item.children(".que-opt-no").text()] = add_opt_item.children("input").val();
			}
		}
		content.choiceImgList = imageMap;
		content.choiceList = choiceMap;
		
		return content;
	}
};

