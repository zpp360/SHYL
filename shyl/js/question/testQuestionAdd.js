var locat = document.getElementsByTagName('base')[0].href

$(function() {
	
	$("#weixin_image").fileupload({
		 dataType :'iframe text',
		 autoUpload: true,
		 maxNumberOfFiles : 1,
         url: locat+'/testquestion/Upload.do',
        sequentialUploads: true
	 }).bind('fileuploadchange', function (e, data) {
		 if(data.files.length > 1){
			 $("#weixin_image").tips({
					side : 2,
					msg : '只能上传一张照片。',
					bg : '#AE81FF',
					time : 3
			 });
             return false;
		 }
    }).bind('fileuploaddone', function (e, data) {
   	 if("no"==data.result){
   		$("#weixin_image").tips({
			side : 2,
			msg : '请上传格式为.jpg/.jpeg/.png./gif格式的图片。',
			bg : '#AE81FF',
			time : 3
		});
		return false;
   	 } else {
   		 if("error"==data.result){
			 bootbox.alert("上传失败，请重新上传");
		 }else{
			 document.getElementById("license").value=data.result;
			 bootbox.alert("上传成功");
			 $("#preview_a").attr("href",locat+"images/"+data.result);
			 document.getElementById("preview").style.display="block";
		 }
            
   	 }
    });
	
	$("#weixin_image1").fileupload({
		 dataType :'iframe text',
		 autoUpload: true,
		 maxNumberOfFiles : 1,
		 url: locat+'/testquestion/Upload.do',
        sequentialUploads: true
	 }).bind('fileuploadchange', function (e, data) {
		 if(data.files.length > 1){
			 $("#weixin_image1").tips({
					side : 2,
					msg : '只能上传一张照片。',
					bg : '#AE81FF',
					time : 3
			 });
             return false;
		 }
    }).bind('fileuploaddone', function (e, data) {
   	 if("no"==data.result){
   		$("#weixin_image1").tips({
			side : 2,
			msg : '请上传格式为.jpg/.jpeg/.png./gif格式的图片。',
			bg : '#AE81FF',
			time : 3
		});
		return false;
   	 } else {
   		 if("error"==data.result){
			 bootbox.alert("上传失败，请重新上传");
		 }else{
			 document.getElementById("license1").value=data.result;
			 bootbox.alert("上传成功");
			 $("#preview_a1").attr("href",locat+"images/"+data.result);
			 document.getElementById("preview1").style.display="block";
		 }
   	 }
    });
	
	$("#weixin_image2").fileupload({
		 dataType :'iframe text',
		 autoUpload: true,
		 maxNumberOfFiles : 1,
		 url: locat+'/testquestion/Upload.do',
        sequentialUploads: true
	 }).bind('fileuploadchange', function (e, data) {
		 if(data.files.length > 1){
			 $("#weixin_image2").tips({
					side : 2,
					msg : '只能上传一张照片。',
					bg : '#AE81FF',
					time : 3
			 });
             return false;
		 }
    }).bind('fileuploaddone', function (e, data) {
   	 if("no"==data.result){
   		$("#weixin_image2").tips({
			side : 2,
			msg : '请上传格式为.jpg/.jpeg/.png./gif格式的图片。',
			bg : '#AE81FF',
			time : 3
		});
		return false;
   	 } else {
            if("error"==data.result){
    			 bootbox.alert("上传失败，请重新上传");
    		 }else{
    			 document.getElementById("license2").value=data.result;
    			 bootbox.alert("上传成功");
    			 $("#preview_a2").attr("href",locat+"images/"+data.result);
    			 document.getElementById("preview2").style.display="block";
    		 }
   	 }
    });
	
	$("#weixin_image3").fileupload({
		 dataType :'iframe text',
		 autoUpload: true,
		 maxNumberOfFiles : 1,
		 url: locat+'/testquestion/Upload.do',
         sequentialUploads: true
	 }).bind('fileuploadchange', function (e, data) {
		 if(data.files.length > 1){
			 $("#weixin_image3").tips({
					side : 2,
					msg : '只能上传一张照片。',
					bg : '#AE81FF',
					time : 3
			 });
             return false;
		 }
    }).bind('fileuploaddone', function (e, data) {
   	 if("no"==data.result){
   		$("#weixin_image3").tips({
			side : 2,
			msg : '请上传格式为.jpg/.jpeg/.png./gif格式的图片。',
			bg : '#AE81FF',
			time : 3
		});
		return false;
   	 } else {
            if("error"==data.result){
    			 bootbox.alert("上传失败，请重新上传");
    		 }else{
    			 document.getElementById("license3").value=data.result;
    			 bootbox.alert("上传成功");
    			 $("#preview_a3").attr("href",locat+"images/"+data.result);
    			 document.getElementById("preview3").style.display="block";
    		 }
   	 }
    });
	
	$("#weixin_image4").fileupload({
		 dataType :'iframe text',
		 autoUpload: true,
		 maxNumberOfFiles : 1,
		 url: locat+'/testquestion/Upload.do',
         sequentialUploads: true
	 }).bind('fileuploadchange', function (e, data) {
		 if(data.files.length > 1){
			 $("#weixin_image4").tips({
					side : 2,
					msg : '只能上传一张照片。',
					bg : '#AE81FF',
					time : 3
			 });
             return false;
		 }
    }).bind('fileuploaddone', function (e, data) {
   	 if("no"==data.result){
   		$("#weixin_image4").tips({
			side : 2,
			msg : '请上传格式为.jpg/.jpeg/.png./gif格式的图片。',
			bg : '#AE81FF',
			time : 3
		});
		return false;
   	 } else {
            if("error"==data.result){
    			 bootbox.alert("上传失败，请重新上传");
    		 }else{
    			 document.getElementById("license4").value=data.result;
    			 bootbox.alert("上传成功");
    			 $("#preview_a4").attr("href",locat+"images/"+data.result);
    			 document.getElementById("preview4").style.display="block";
    		 }
   	 }
    });
	
	$("#weixin_image5").fileupload({
		 dataType :'iframe text',
		 autoUpload: true,
		 maxNumberOfFiles : 1,
		 url: locat+'/testquestion/Upload.do',
         sequentialUploads: true
	 }).bind('fileuploadchange', function (e, data) {
		 if(data.files.length > 1){
			 $("#weixin_image5").tips({
					side : 2,
					msg : '只能上传一张照片。',
					bg : '#AE81FF',
					time : 3
			 });
             return false;
		 }
    }).bind('fileuploaddone', function (e, data) {
   	 if("no"==data.result){
   		$("#weixin_image5").tips({
			side : 2,
			msg : '请上传格式为.jpg/.jpeg/.png./gif格式的图片。',
			bg : '#AE81FF',
			time : 3
		});
		return false;
   	 } else {
            if("error"==data.result){
    			 bootbox.alert("上传失败，请重新上传");
    		 }else{
    			 document.getElementById("license5").value=data.result;
    			 bootbox.alert("上传成功");
    			 $("#preview_a5").attr("href",locat+"images/"+data.result);
    			 document.getElementById("preview5").style.display="block";
    		 }
   	 }
    });
	
	$("#weixin_image6").fileupload({
		 dataType :'iframe text',
		 autoUpload: true,
		 maxNumberOfFiles : 1,
		 url: locat+'/testquestion/Upload.do',
        sequentialUploads: true
	 }).bind('fileuploadchange', function (e, data) {
		 if(data.files.length > 1){
			 $("#weixin_image6").tips({
					side : 2,
					msg : '只能上传一张照片。',
					bg : '#AE81FF',
					time : 3
			 });
             return false;
		 }
    }).bind('fileuploaddone', function (e, data) {
   	 if("no"==data.result){
   		$("#weixin_image6").tips({
			side : 2,
			msg : '请上传格式为.jpg/.jpeg/.png./gif格式的图片。',
			bg : '#AE81FF',
			time : 3
		});
		return false;
   	 } else {
            if("error"==data.result){
    			 bootbox.alert("上传失败，请重新上传");
    		 }else{
    			 document.getElementById("license6").value=data.result;
    			 bootbox.alert("上传成功");
    			 $("#preview_a6").attr("href",locat+"images/"+data.result);
    			 document.getElementById("preview6").style.display="block";
    		 }
   	 }
    });
	
	// 画面初期隐藏
	$("#field-answer-double").hide();
	$("#field-answer-judge").hide();
	$("#span_option5").hide();
	$("#span_option6").hide();
	$("#option_select_answer5").hide();
	$("#option_select_answer6").hide();
	
	//知识点
	var selection = $("#aq-course1").find("select");
	var point_list = $("#aq-course2").find("select");
	selection.change(function(){
		$.post(locat+'/examPaper/getKnowledgePoint.do', {
			fieldId : selection.val()
		}, function(data) {
			point_list.empty();
			$.each(data.knowledgePointList, function(i, list) {
				point_list.append("<option value=\"" + list.pointId + "\">" + list.pointName + "</option>");
			});
		});
	});
	//点击选择知识点按钮
	$("#add-point-btn").click(function() {
		var field = $("#field-select > option:selected");
		var point = $("#point-from-select > option:selected");
		if (field.length == 0 || point.length == 0) {
			$("#aq-course2").tips({
				side : 2,
				msg : '请选择需要添加的知识点',
				bg : '#FF5080',
				time : 2
			});
			return false;
		}
		var html = "<option value=\"" + point.attr("value") + "\">" + field.text() + " > " + point.text() + "</option>";
		var p = point.attr("value");
		if (!checkPointDuplicate(p)) {
			$("#point-to-select").tips({
				side : 2,
				msg : '不能重复添加',
				bg : '#FF5080',
				time : 2
			});
			return false;
		}
		$("#point-to-select").empty();
		$("#point-to-select").append(html);
		return false;
	});
	//点击删除知识点按钮
	$("#del-point-btn").click(function() {
		$("#point-to-select > option:selected").remove();
		return false;
	});
	//点击清除列表按钮
	$("#remove-all-point-btn").click(function() {
		$("#point-to-select").empty();
		return false;
	});
	
	//下拉框
	$(".chzn-select").chosen();
	$(".chzn-select-deselect").chosen({
		allow_single_deselect : true
	});
});
		
//试题类型切换
function changeQuestionType() {
	var questionType = $("#questionType").val();
	if (questionType == 1) {
		$("#field-option").show();
		$("#field-answer-select").show();
		$("#field-answer-double").hide();
		$("#field-answer-judge").hide();
		$("#span_option5").hide();
		$("#span_option6").hide();
		$("#license5").val("");
		$("#textbox5").val("");
		$("#license6").val("");
		$("#textbox6").val("");
		$("#add_option_hidden").val(4);
		$("#option_select_answer5").hide();
		$("#option_select_answer6").hide();
		$("#answer").val("A");
	    $("#answer").trigger("liszt:updated");
	} else if (questionType == 2) {
		$("#field-option").show();
		$("#field-answer-select").hide();
		$("#field-answer-double").show();
		$("#field-answer-judge").hide();
		$("#span_option5").hide();
		$("#span_option6").hide();
		$("#answer-double5").hide();
		$("#answer-double6").hide();
		$("#license5").val("");
		$("#textbox5").val("");
		$("#license6").val("");
		$("#textbox6").val("");
		$("#add_option_hidden").val(4);
	} else if (questionType == 3) {
		$("#field-option").hide();
		$("#field-answer-select").hide();
		$("#field-answer-double").hide();
		$("#field-answer-judge").show();
	}
}

//check选项内容
function checkOpt(){
	var question_opt_items = $(".question-opt-item-input");
	var result = true;
	var id = $("#add_option_hidden").val();
	for (var i = 0; i < id; i++) {
		var item_value = question_opt_items[i].value;
		if (item_value == "") {
			$(question_opt_items[i]).focus();
			$(question_opt_items[i]).tips({
				side : 2,
				msg : '请输入选项内容',
				bg : '#FF5080',
				time : 2
			});
			result = false;
			break;
		} else if (item_value.length > 100) {
			$(question_opt_items[i]).focus();
			$(question_opt_items[i]).tips({
				side : 2,
				msg : '选项内容请保持在100个字符以内',
				bg : '#FF5080',
				time : 2
			});
			result = false;
			break;
		}
	}
	return result;
}

//保存
function save() {
	var questionType = $("#questionType").val();
	//单选题的场合
	if(questionType == 1){
		if ($("#point-to-select option").length == 0) {
			$("#point-to-select").tips({
				side : 2,
				msg : '请选择需要添加的知识点',
				bg : '#FF5080',
				time : 2
			});
			$("#point-to-select").focus();
			return false;
		}
		if ($("#testContent").val() == "") {
			$("#testContent").tips({
				side : 2,
				msg : '请输入试题内容',
				bg : '#FF5080',
				time : 2
			});
			$("#testContent").focus();
			return false;
		}
		if(!checkOpt()){
			return false;
		}
	}
	//多选题的场合
	if(questionType == 2){
		if ($("#point-to-select option").length == 0) {
			$("#point-to-select").tips({
				side : 2,
				msg : '请选择需要添加的知识点',
				bg : '#FF5080',
				time : 2
			});
			$("#point-to-select").focus();
			return false;
		}
		if ($("#testContent").val() == "") {
			$("#testContent").tips({
				side : 2,
				msg : '请输入试题内容',
				bg : '#FF5080',
				time : 2
			});
			$("#testContent").focus();
			return false;
		}
		if(!checkOpt()){
			return false;
		}
		
		var checkBoxs = $(".add-opt-items-answer input[type=checkbox]:checked");
		if(checkBoxs.length==0){
			$("#checkbox1").tips({
				side : 2,
				msg : '请至少选择一个选项',
				bg : '#FF5080',
				time : 3
			});
			$("#checkbox1").focus();
			return false;
		}
	}
	//判断题的场合
	if(questionType == 3){
		if ($("#point-to-select option").length == 0) {
			$("#point-to-select").tips({
				side : 2,
				msg : '请选择需要添加的知识点',
				bg : '#FF5080',
				time : 2
			});
			$("#point-to-select").focus();
			return false;
		}
		if ($("#testContent").val() == "") {
			$("#testContent").tips({
				side : 2,
				msg : '请输入试题内容',
				bg : '#FF5080',
				time : 2
			});
			$("#testContent").focus();
			return false;
		}
	}
	
	// 页面各个控件的值
    var question_entity = composeEntity();
    $.ajax({
	    type : "POST",
	    url :  locat+'/testquestion/add.do',
		data : {question_entity : JSON.stringify(question_entity)},
		dataType : 'json',
		cache : false,
		success : function(message, tst, jqXHR) {
			if (message.result == "success") {
				// 跳转到修改试卷页面
				window.location.href = locat+"/testquestion/list.do";
			} else {
				bootbox.alert("操作失败请稍后尝试:" + message.result);
			}
		},
		error : function(jqXHR, textStatus) {
			bootbox.alert("操作失败请稍后尝试");
		}
	});
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}

//页面各个控件的值
function composeEntity(){
	var question_entity = new Object();
	//试题内容前10位作为试题名称
	question_entity.name = $("#testContent").val();
	//试题类型
	question_entity.question_type_id = $("#questionType").val();
	//知识点内容
	var pointList = new Array();
	var pointOpts = $("#point-to-select option");
	for (var i = 0; i < pointOpts.length; i++) {
		pointList.push($(pointOpts[i]).attr("value"));
	}
	question_entity.pointList = pointList;
	//单选题的场合
	if (1 == question_entity.question_type_id) {
		//正确答案
		question_entity.answer = $("#answer").val();
	//多选题的场合
	} else if (2 == question_entity.question_type_id) {
		 var checkboxs = $(".add-opt-items-answer input:checked");
		 var tmp_v = "";
			for (var i = 0; i < checkboxs.length; i++) {
				tmp_v = tmp_v + checkboxs[i].value;
			}
			question_entity.answer = tmp_v;
	//判断题的场合
	} else if (3 == question_entity.question_type_id) {
		question_entity.answer = $("#answer_judge").val();
	}
	question_entity.questionContent = composeContent();
    // 题目解析
	question_entity.analysis = $("#evaluationStandard").val();
    // 来源
	question_entity.referenceName = $("#origin").val();
    // 考点
	question_entity.examingPoint = $("#testCenter").val();
    // 关键字
	question_entity.keyword = $("#keyword").val();
	return question_entity;
}

function composeContent(){
	var question_type_id =  $("#questionType").val();
    var titleimg = $("#license").val();
	var content = new Object();
	var content_img = $(".display-content-img");
	var content_img_string = content_img.data("url");
	content.title = $("#testContent").val();
	var choiceMap = {};
	var imageMap = {};
	var pointList = new Array();
	$("#point-to-select option").each(function(){
		pointList.push($(this).val());
	});
		content.titleImg = titleimg;
	if (3 != question_type_id) {
		var add_opt_items = $(".add-opt-item");

		for (var i = 0; i < add_opt_items.length; i++) {
			var add_opt_item = $(add_opt_items[i]);
			//选项标签
			 var opt_img = add_opt_item.children(".question-opt-itme-hidden").val();
			 if (opt_img.length > 0) { 
				imageMap[add_opt_item.children(".que-opt-no").text()] = opt_img;
			 } 
			 var choicedt = add_opt_item.children(".question-opt-item-input").val();
			 if(!(choicedt=='' || choicedt==undefined || choicedt==null)){
				 choiceMap[add_opt_item.children(".que-opt-no").text()] = add_opt_item.children(".question-opt-item-input").val();
			 }
		}
		
	}
	content.choiceImgList = imageMap;
	content.choiceList = choiceMap;
	
	return content;
}
// 追加选项
function add_option(){
	var id = $("#add_option_hidden").val();
	var questionType = $("#questionType").val();
	if(questionType == 1){
		if(id == 6){
			$("#textbox1").tips({
				side : 2,
				msg : '最多只能有6个选项',
				bg : '#FF5080',
				time : 2
			});
			$("#textbox1").focus();
		} else{
			var idd= ++id;
			$("#span_option"+idd).show();
			$("#add_option_hidden").val(idd);
			$("#option_select_answer"+idd).show();
			$("#answer").val("A");
		    $("#answer").trigger("liszt:updated");
		}
	} else if (questionType == 2) {
		if(id == 6){
			$("#textbox1").tips({
				side : 2,
				msg : '最多只能有6个选项',
				bg : '#FF5080',
				time : 2
			});
			$("#textbox1").focus();
		} else{
			var idd= ++id;
			$("#answer-double"+idd).show();
			$("#span_option"+idd).show();
			$("#add_option_hidden").val(idd);
		}
	}
	
}
// 删除选项
function del_option(){
	var id = $("#add_option_hidden").val();
	var questionType = $("#questionType").val();
	var idd= id - 1;
	if(questionType == 1){
		$("#license"+id).val("");
		$("#textbox"+id).val("");
		$("#span_option"+id).hide();
		$("#add_option_hidden").val(idd);
		$("#option_select_answer"+id).hide();
		$("#answer").val("A");
	    $("#answer").trigger("liszt:updated");
	} else if(questionType == 2){
		$("#license"+id).val("");
		$("#textbox"+id).val("");
		$("#checkbox"+id).attr("checked",false);
		$("#span_option"+id).hide();
		$("#answer-double"+id).hide();
		$("#add_option_hidden").val(idd);
	}
	
}

		
		