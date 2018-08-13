var locat;
$(function(){
	locat=document.getElementsByTagName('base')[0].href;
	
	//单选框
	$(".chzn-select").chosen(); 
	$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
	
	//日期框
	$('.date-picker').datepicker();
	$('#email').keyup(
		function() {
			var c = $(this);
			if (/[^a-zA-Z0-9! @ # $ % ?_]/.test(c.val())) {//替换其他字符
				var temp_amount = c.val().replace(
						/[^a-zA-Z0-9! @ # $ % . ?_]/g, '');
				$(this).val(temp_amount);
			}
		});
	$('#telephone').keyup(function(){
		var c = $(this);
		if (/[^a-zA-Z0-9! @ # $ % -.?_]/.test(c.val())) {//替换其他字符
			var temp_amount = c.val().replace(
					/[^a-zA-Z0-9! @ # $ % -.?_]/g, '');
		    $(this).val(temp_amount);
		}
	});
});

// 专业名称自动输入
$("#profession").autocomplete({
    source: function( request, response ) {
        $.ajax({
            url: locat+'schoolContro/getprofession.act', // 后台请求路径
            dataType: "json",
            data:{
                "inputStr": request.term    // 获取输入框内容
            },
            type:"POST",
            contentType:"application/x-www-form-urlencoded; charset=utf-8",
            success: function( data ) {
                response($.map(data, function(item) {
                    return {
                         // 设置item信息
                         label: item.name, // 下拉项显示内容
                         value: item.name  // 下拉项对应数值
                    }
                }));
            }
        });
    },
    minLength: 1,  // 输入框字符个等于2时开始查询
    select: function( event, ui ) { // 选中某项时执行的操作
    	// 存放选中选项的信息
    	$("#profession").val(ui.item.label);
    	$("#profe_id").val(ui.item.schoolId);
      }
});
			
function saveinfo() {
	// 姓名
	var name=$("#name").val();
	if (name == "") {
		$("#name").tips({
			side : 2,
			msg : '请输入姓名',
			bg : '#AE81FF',
			time : 3
		});
		$("#name").focus();
		return false;
	}
	// 性别
	var sex=$("input:radio[name='sex']:checked").val();
	if (sex == "undefined") {
		$("#sexli").tips({
			side : 2,
			msg : '请输入性别',
			bg : '#AE81FF',
			time :2,
			y:10,
		});
		$("#sexli").focus();
		return false;
	}
	// 学号
	var studentNo=$("#studentNo").val();
	if (studentNo == "") {
		$("#studentNo").tips({
			side : 2,
			msg : '请输入学号',
			bg : '#AE81FF',
			time : 3
		});
		$("#studentNo").focus();
		return false;
	}
	// 密码
	var userPs=$("#userPs").val();
	var userPsFilter = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,20}$/;
	if (userPs == "") {
		$("#userPs").tips({
			side : 2,
			msg : '请输入密码，建议为123456a?',
			bg : '#AE81FF',
			time : 3
		});
		$("#userPs").focus();
		return false;
	}else if (!(userPsFilter.test(userPs))) {
		$("#userPs").tips({
			side : 2,
			msg : '请输入正确的密码格式',
			bg : '#AE81FF',
			time : 3
		});
		$("#userPs").focus();
		return false;
	}
	// 出生日期
	var brithDate=$("#brithDate").val();
	if (brithDate == "") {
		$("#brithDate").tips({
			side : 2,
			msg : '请输入出生日期',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	// 毕业时间
	var graduationDate=$("#graduationDate").val();
	// 身份证号
	var idCode = $("#idCode").val();
	if (idCode == "") {
		$("#idCode").tips({
			side : 2,
			msg : '请输入身份证号',
			bg : '#AE81FF',
			time : 3
		});
		$("#idCode").focus();
		return false;
	}else if (!isIdCardNo(idCode)) {
		$("#idCode").tips({
			side : 2,
			msg : "请输入合法的身份证号",
			bg : '#AE81FF',
			time : 2
		});
		$("#idCode").focus();
		return false;
	}
	// 专业
	var profession=$("#profession").val();
	if (profession == "") {
		$("#profession").tips({
			side : 2,
			msg : '请输入专业',
			bg : '#AE81FF',
			time : 3
		});
		$("#profession").focus();
		return false;
	}
	// 联系方式
	var telephone=$("#telephone").val();
	var Filter = /^((0\d{2,3})-)(\d{7,8})(-(\d{1,4}))?$/;
	var phoneFilter = /^1[3|4|5|8][0-9]\d{4,8}$/;
	if (telephone == "") {
		$("#telephone").tips({
			side : 2,
			msg : '请输入联系方式',
			bg : '#AE81FF',
			time : 3
		});
		$("#telephone").focus();
		return false;
	} else{
		if (!(Filter.test(telephone)) && !(phoneFilter.test(telephone))) {
			$("#telephone").tips({
				side : 2,
				msg : '请输入正确的联系电话格式',
				bg : '#AE81FF',
				time : 3
			});
			$("#telephone").focus();
			return false;
		}
	}
	// 邮箱
	var email = $("#email").val();
	var EmailFilter = /^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT)$/;
	if (email == "") {
		$("#email").tips({
			side : 2,
			msg : '请输入邮箱',
			bg : '#AE81FF',
			time : 3
		});
		$("#email").focus();
		return false;
	} else if (!(EmailFilter.test(email))) {
		$("#email").tips({
			side : 2,
			msg : '请输入正确的邮箱格式',
			bg : '#AE81FF',
			time : 3
		});
		$("#email").focus();
		return false;
	}
	
	$.ajax({
		type : "POST",
		url :  locat+'schoolContro/saveProfession.act',
		data : {
			profession : profession
		},
		dataType : 'json',
		cache : false,
		success : function(data) {
			if ("success" == data.result) {
				$.ajax({
					type : "POST",
					url :  locat+'schoolContro/savebasicinfo.act',
					data : {
						name : name,
						sex : sex,
						studentNo : studentNo,
						userPs : userPs,
						brithDate : brithDate,
						graduationDate : graduationDate,
						idCode : idCode,
						profession : profession,
						telephone : telephone,
						email : email,
						tm : new Date().getTime()
					},
					dataType : 'json',
					cache : false,
					success : function(data) {
						if ("success" == data.result) {
							window.location.href=locat+'schoolContro/list.act';
						}else if("nameError" == data.result){
							$("#name").tips({
								side : 2,
								msg : '该学生的信息已被录入过',
								bg : '#AE81FF',
								time : 3
							});
							$("#name").focus();
							return false;
						}else if("telErr" == data.result){
							$("#telephone").tips({
								side : 2,
								msg : '该联系方式已经存在',
								bg : '#AE81FF',
								time : 3
							});
							$("#telephone").focus();
							return false;
						}else if("emailErr" == data.result){
							$("#email").tips({
								side : 2,
								msg : '该邮箱已经存在',
								bg : '#AE81FF',
								time : 3
							});
							$("#email").focus();
							return false;
						}
					}
				});
			}
		}
	});
}

function isIdCardNo(num) {
	var factorArr = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4,
			2, 1);
	var error;
	var varArray = new Array();
	var intValue;
	var lngProduct = 0;
	var intCheckDigit;
	var intStrLen = num.length;
	var idNumber = num;
	if ((intStrLen != 15) && (intStrLen != 18)) {
		// error = "输入身份证号码长度不对！";
		return false;
	}
	for (i = 0; i < intStrLen; i++) {
		varArray[i] = idNumber.charAt(i);
		if ((varArray[i] < '0' || varArray[i] > '9') && (i != 17)) {
			// error = "错误的身份证号码！.";
			return false;
		} else if (i < 17) {
			varArray[i] = varArray[i] * factorArr[i];
		}
	}
	if (intStrLen == 18) {
		var date8 = idNumber.substring(6, 14);
		if (checkDate(date8) == false) {
			// error = "身份证中日期信息不正确！.";
			return false;
		}
		for (i = 0; i < 17; i++) {
			lngProduct = lngProduct + varArray[i];
		}
		intCheckDigit = 12 - lngProduct % 11;
		switch (intCheckDigit) {
		case 10:
			intCheckDigit = 'X';
			break;
		case 11:
			intCheckDigit = 0;
			break;
		case 12:
			intCheckDigit = 1;
			break;
		}
		if (varArray[17].toUpperCase() != intCheckDigit) {
			// error = "身份证效验位错误!...正确为： " + intCheckDigit + ".";
			return false;
		}
	} else {
		var date6 = idNumber.substring(6, 12);
		if (checkDate(date6) == false) {
			// alert("身份证日期信息有误！.");
			return false;
		}
	}
	return true;
} 
function checkDate(date) { 
	var idvalue = date;
    var tmpStr = "";  
    var strReturn = "";  
	
    if (idvalue.length == 8) {  
        tmpStr = idvalue.substring(0, 8);  
        tmpStr = tmpStr.substring(0, 4) + "-" + tmpStr.substring(4, 6) + "-" + tmpStr.substring(6, 8)  
    }
    
    var v = tmpStr.match(/((^((1[8-9]\d{2})|([2-9]\d{3}))(-)(10|12|0?[13578])(-)(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))(-)(11|0?[469])(-)(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))(-)(0?2)(-)(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)(-)(0?2)(-)(29)$)|(^([3579][26]00)(-)(0?2)(-)(29)$)|(^([1][89][0][48])(-)(0?2)(-)(29)$)|(^([2-9][0-9][0][48])(-)(0?2)(-)(29)$)|(^([1][89][2468][048])(-)(0?2)(-)(29)$)|(^([2-9][0-9][2468][048])(-)(0?2)(-)(29)$)|(^([1][89][13579][26])(-)(0?2)(-)(29)$)|(^([2-9][0-9][13579][26])(-)(0?2)(-)(29)$))/);
    
    if(v == null){
    	return false;
    }else{
    	return true;
    }
} 