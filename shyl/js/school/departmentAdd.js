var locat;
$(function(){
	locat=document.getElementsByTagName('base')[0].href;
	
	$('#mail').keyup(
		function() {
			var c = $(this);
			if (/[^a-zA-Z0-9! @ # $ % ?_]/.test(c.val())) {//替换其他字符
				var temp_amount = c.val().replace(
						/[^a-zA-Z0-9! @ # $ % . ?_]/g, '');
				$(this).val(temp_amount);
			}
		});
	$('#contact_tel').keyup(function(){
		var c = $(this);
		if (/[^a-zA-Z0-9! @ # $ % -.?_]/.test(c.val())) {//替换其他字符
			var temp_amount = c.val().replace(
					/[^a-zA-Z0-9! @ # $ % -.?_]/g, '');
		    $(this).val(temp_amount);
		}
	});
});
			
function saveinfo() {
	// 院系名称
	var school_name=$("#school_name").val();
	if (school_name == "") {
		$("#school_name").tips({
			side : 2,
			msg : '请输入院系名称',
			bg : '#AE81FF',
			time : 3
		});
		$("#school_name").focus();
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
	// 联系人
	var contact=$("#contact").val();
	if (contact == "") {
		$("#contact").tips({
			side : 2,
			msg : '请输入联系人',
			bg : '#AE81FF',
			time : 3
		});
		$("#contact").focus();
		return false;
	}
	// 联系方式
	var contact_tel=$("#contact_tel").val();
	var Filter = /^((0\d{2,3})-)(\d{7,8})(-(\d{1,4}))?$/;
	var phoneFilter = /^1[3|4|5|8][0-9]\d{4,8}$/;
	if (contact_tel == "") {
		$("#contact_tel").tips({
			side : 2,
			msg : '请输入联系方式',
			bg : '#AE81FF',
			time : 3
		});
		$("#contact_tel").focus();
		return false;
	} else {
		if (!(Filter.test(contact_tel)) && !(phoneFilter.test(contact_tel))) {
			$("#contact_tel").tips({
				side : 2,
				msg : '请输入正确的联系电话格式',
				bg : '#AE81FF',
				time : 3
			});
			$("#contact_tel").focus();
			return false;
		}
	}
	// 邮箱
	var mail = $("#mail").val();
	var EmailFilter = /^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT)$/;
	if (mail == "") {
		$("#mail").tips({
			side : 2,
			msg : '请输入邮箱',
			bg : '#AE81FF',
			time : 3
		});
		$("#mail").focus();
		return false;
	} else if (!(EmailFilter.test(mail))) {
		$("#mail").tips({
			side : 2,
			msg : '请输入正确的邮箱格式',
			bg : '#AE81FF',
			time : 3
		});
		$("#mail").focus();
		return false;
	}
	$.ajax({
		type : "POST",
		url :  locat+'department/savebasicinfo.act',
		data : {
			departmentname : school_name,
			userPs : userPs,
			contact : contact,
			contact_tel :contact_tel ,
			mail : mail,
			tm : new Date().getTime()
		},
		dataType : 'json',
		cache : false,
		success : function(data) {
			if ("success" == data.result) {
				window.location.href=locat+'department/list.act';
			}else if("nameError" == data.result){
				$("#school_name").tips({
					side : 2,
					msg : '该院系的信息已被录入过',
					bg : '#AE81FF',
					time : 3
				});
				$("#school_name").focus();
				return false;
			}else if("telErr" == data.result){
				$("#contact_tel").tips({
					side : 2,
					msg : '该联系方式已经存在',
					bg : '#AE81FF',
					time : 3
				});
				$("#contact_tel").focus();
				return false;
			}else if("emailErr" == data.result){
				$("#mail").tips({
					side : 2,
					msg : '该邮箱已经存在',
					bg : '#AE81FF',
					time : 3
				});
				$("#mail").focus();
				return false;
			}
		}
	});
}

