        // 题库和知识点联动
	    $(function () {
	        $("#field_id").change(function () { BindPId(); });
	        BindPId();
	    })
	    // 根据题库，动态获取知识分类
	    function BindPId() {
	    	// 题库
	        var FID = $("#field_id").val();
	    	var point_id = $("#point_id").val();
	    	// 知识分类清空
	        $("#point_id").find('option').remove();
	    	// ajax请求获得知识分类
	        $.post(document.getElementsByTagName('base')[0].href+'company/pointList.act', { 'FID': FID }, function (data) {
	        	if (data.result == 'success') {
	        		$.each(data.pointList, function (i, list) {
		            	if (point_id == list.pointId) {
		            		$("<option value='" + list.pointId + "' selected>" + list.pointName + "</option>").appendTo("#point_id");
		            	} else {
		            		$("<option value='" + list.pointId + "'>" + list.pointName + "</option>").appendTo("#point_id");
		            	}
		            });
	        	} else {
	        		$("<option value=''>全部</option>").appendTo("#point_id");
	        	}
	        });
	    }

	    // 弹出修改分类窗口
	    function showUpdateQuestionTp(field_id, point_id,question_id){
	    	// 设置问题Id
	    	$("#question_id").val(question_id);
	    	// 选择此问题的专业
	    	for(var i=0;i<document.getElementById("field_id_a").options.length;i++)
	        {
	            if(document.getElementById("field_id_a").options[i].value == field_id)
	            {
	                document.getElementById("field_id_a").options[i].selected=true;
	                break;
	            }
	        }
	    	// 清空知识知识类
	    	$("#point_id_a").find('option').remove();
	    	$.post(document.getElementsByTagName('base')[0].href+'company/pointList.act', { 'FID': field_id }, function (data) {
	        	if (data.result == 'success') {
		            $.each(data.pointList, function (i, list) {
		            	if (point_id == list.pointId) {
		            		$("<option value='" + list.pointId + "' selected>" + list.pointName + "</option>").appendTo("#point_id_a");
		            	} else {
		            		$("<option value='" + list.pointId + "'>" + list.pointName + "</option>").appendTo("#point_id_a");
		            	}
		            });
	        	} else {
	        		$("<option value=''>全部</option>").appendTo("#point_id");
	        	}

	        });
	    }

	    // 修改分类：题库和知识点联动
	    $(function () {
	        $("#field_id_a").change(function () { BindPIdA(); });
	    })

	    // 点击修改类型，弹出修改类型窗口
	    function BindPIdA() {
	    	// 专业
	        var FID = $("#field_id_a").val();
	    	// 清空知识类
	        $("#point_id_a").find('option').remove();
	        $.post(document.getElementsByTagName('base')[0].href+'company/pointList.act', { 'FID': FID }, function (data) {
	        	if (data.result == 'success') {
		            $.each(data.pointList, function (i, list) {
		            		$("<option value='" + list.pointId + "'>" + list.pointName + "</option>").appendTo("#point_id_a");
		            });
	        	} else {
	        		$("<option value=''>全部</option>").appendTo("#point_id_a");
	        	}

	        });
	    }

	    // 删除操作
	    function Delete() {
	            location.href = document.getElementsByTagName('base')[0].href+"company/deleteQuestion.act?id="+$("#questionID").val()+"&field_id="+$("#field_id").val()+"&point_id="+$("#point_id").val()+"&question_type_id="+$("#question_type_id").val();
	    }
	    // 删除试题
	    function dels(id,divid) {
	            $("#" + divid).attr("data-target", "#delquestion");
	            $("#delquestion").attr("data-target", "");
	            $("#questionID").val(id);
	    }

	    // 修改试题类型
	    function updateQuestionPoint() {
	    	location.href = document.getElementsByTagName('base')[0].href+"company/updateQuestionPoint.act?question_id="+$("#question_id").val()+"&point_id_a="+$("#point_id_a").val()+"&field_id="+$("#field_id").val()+"&point_id="+$("#point_id").val()+"&question_type_id="+$("#question_type_id").val();
	    }

	    // 添加试题
	    function addQuestion() {
	    	location.href = document.getElementsByTagName('base')[0].href+"company/toAddQuestion.act?field_id="+$("#field_id").val()+"&point_id="+$("#point_id").val()+"&question_type_id="+$("#question_type_id").val();
	    }