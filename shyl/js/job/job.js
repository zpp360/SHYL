    // 招聘列表点击删除，确认删除
    function Delete() {
            location.href = document.getElementsByTagName('base')[0].href+"company/deleteJob.act?infoID="+$("#recruitmentInfoID").val()+"&companyId="+$("#companyId").val();
    }
    // 招聘列表点击删除
    function dels(id,divid) {
            $("#" + divid).attr("data-target", "#deljob");
            $("#deljob").attr("data-target", "");
            $("#recruitmentInfoID").val(id);
    }
    // 检查职位名称是否为空
    function checkPosition_name (id) {
    	var positionName = $("#position_name").val();
    	if (positionName == "") {
    		$("#position_name").tips({
				side : 2,
				msg : '请输入职位名称',
				bg : '#AE81FF',
				time : 3
			});
    		$("#position_name").focus();
    		return true;
    	}
    }
	// 检查职位类别是否选择
	function checkPostion_type () {
		var HopeJobTextCheck = $("#JobType").val();
		if (HopeJobTextCheck == "" || HopeJobTextCheck == null) {
			$("#JobTypeText").tips({
				side : 2,
				msg : '请选择职位类别',
				bg : '#AE81FF',
				time : 3
			});
			return true;
		}
	}
	// 检查招聘人数
	function checkRecruitment_number () {
		var recruitment_number = $("#recruitment_number").val();
		if (recruitment_number == "") {
			$("#recruitment_number").tips({
				side : 2,
				msg : '请输入招聘人数',
				bg : '#AE81FF',
				time : 3
			});
			$("#recruitment_number").focus();
			return true;
		}
	}
    // 省份验证
    function checkProvinceId() {
    	// 省份验证
    	var ProvinceId = $("#work_place_province").val();
    	if (ProvinceId == "") {
    		$("#work_place_province").tips({
    			side : 2,
    			msg : '请选择省份！',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
    	}
    }
    // 城市验证
    function checkCityId() {
    	// 城市验证
    	var CityId = $("#work_place_city").val();
    	if (CityId == "") {
    		$("#work_place_city").tips({
    			side : 2,
    			msg : '请选择城市！',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
    	}
    }
	// 检查邮箱
    function checkEmail () {
    	var email = $("#receive_email").val();
    	var filter = /^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT)$/;
    	if (email == "") {
    		$("#receive_email").tips({
    			side : 2,
    			msg : '请输入邮箱',
    			bg : '#AE81FF',
    			time : 3
    		});
    		$("#receive_email").focus();
    		return true;
    	}
    	if (!(filter.test(email))) {
    		$("#receive_email").tips({
    			side : 2,
    			msg : '请输入正确的邮箱格式',
    			bg : '#AE81FF',
    			time : 3
    		});
    		$("#receive_email").focus();
    		return true;
    	}
	}
 
//    $.ajaxSetup({ async: false });
    // 返回
    function GO(id) {
        location.href = document.getElementsByTagName('base')[0].href+'company/toJobManager.act?companyId='+id;
    }
    //获取职位类别技能选中值
    function Jobcheck() {
        var relateIds = "";
        var texts = "";
        $("input[name='Job']:checked").each(function () {
            relateIds += $(this).attr('value') + ",";
        });//得到选中复选框的value
        relateIds = relateIds.substring(0, relateIds.length - 1);

        $("input[name='Job']:checked").each(function () {
            texts += $(this).parent().text();
        });//得到选中复选框的text  
        if (texts == "") {
            $("#JobTypeText").text("请选择职位类别");
            $("#JobTypeText").append('&nbsp;<b class="caret"></b>')
            $("#JobType").attr('value',"");
        }
        else {
            $("#JobTypeText").text(texts);
            $("#JobType").attr('value',relateIds);
            
        }
        checkPostion_type();
        $("[name='Job']").removeAttr("checked");//取消全选
    }

    //控制用户最多只能选择5个checkbox选项
    $("[name='Job']").bind("click", function () {
        var n = $("input[name='Job']:checked").length;
        if (n >= 1) {
            $("[name='Job']").each(function () {
                if (!$(this).is(":checked")) {
                    $(this).attr("disabled", true);
                }
            });
        } else {
            $("[name='Job']").each(function () {
                $(this).attr("disabled", false);
            });
        }
    })
    //checkbox反选
    function DB() {
        //职位类别
        $("[name='Job']").each(function () {
            $(this).attr("disabled", false);
        });
        if ($("#JobType").val().length > 0) {
            var st = $("#JobType").val();
            var cklist = st.split(',');
            for (var i = 0; i < cklist.length; i++) {
                var cid = cklist[i];
                $("[name='Job']").each(function () {
                    $(this).attr("disabled", true);
                });
                document.getElementById("postion_"+cid).checked = true;
                $("#postion_" + cid).attr("disabled", false);
            }
        }
    }
    // 职位类型关闭按钮
    function Clear() {
        //职位类别
        $("[name='Job']").removeAttr("checked");//取消全选
        $("[name='Job']").each(function () {
            $(this).attr("disabled", false);
        });
    }
    // 根据省份变动获取相应的城市列表
    $(function () {
	    $("#work_place_province").change(function () { BindCId(); });
	})
    
    
    function BindCId() {
        var PID = $("#work_place_province").val();
        $("#work_place_city").find('option').remove();
        if (PID == "") {
            $("<option value=''>---市---</option>").appendTo("#work_place_city");
        }
        $.post(document.getElementsByTagName('base')[0].href+'joblist/cityList.act', {
						'PID' : PID
					}, function(data) {
						$.each(data.cityList, function(i, list) {
							$(
									"<option value='" + list.REGION_ID + "'>"
											+ list.REGION_NAME
											+ "</option>").appendTo(
									"#work_place_city");
						});
					});
					$("#work_place_city").val('');
	}
	
	//提交表单
	function sub() {
		// 检查职位名称是否为空
		if (checkPosition_name()) {
			return;
		}
		// 检查职位类别是否选择
		if (checkPostion_type()) {
			return;
		}
		// 检查招聘人数
		if (checkRecruitment_number()) {
			return;
		}
		// 省份验证
		if (checkProvinceId()) {
				return;
		}
		// 城市验证
		if (checkCityId()) {
				return;
		}
		// 邮箱验证
		if (checkEmail ()) {
				return;
		}
		$("#form1").submit();
	}
	