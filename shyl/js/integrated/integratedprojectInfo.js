var locat = document.getElementsByTagName('base')[0].href
// 关闭页面
function Close() {
    window.opener = null;
    window.close();
}
function Clear(){
	$("#docname").val("");
	$('#wtht').modal('hide');
}

function wqfw(){
	$('#wqfw').modal('hide');
}
function cfjb(){
	$('#cfjb').modal('hide');
}

function bnjb(){
    $('#bnjb').modal('hide');
}

//判断用户登录状态
function logint(id, publishId){
		$("#PROJECT_ID").val(id);
		var loginstatus=$("#loginstatus").val();
		var user_type=$("#user_type").val();
		if(loginstatus==""){
			$('#layhomewarn').modal('show');
		}
        if(loginstatus == publishId){
            $('#bnjb').modal('show');
            return;
        }
        if((user_type == 2 || user_type == 5) && loginstatus!=""){
			//动态设置名称
			$.ajax({
				type : "POST",	
				url :  locat+'/integrated/projectbid.act',
				data : {
					publish_company_id:loginstatus,
					project_id:id
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
					 if(data==null){
						$('#wtht').modal('show');
						appendhtml();
					}if(data!=null){
						//重复竞标
						$('#cfjb').modal('show');
					}
				}
			});
		}else if(user_type==1||user_type==3||user_type==4){
			$('#wqfw').modal('show');
		}
}

//转到登录界面
function login(){
	window.location.href=locat+'/userLogin/goLogin.act';
}

function appendhtml(){
	var loginstatus=$("#loginstatus").val();
	var PERSONNEL_ID=$("#PERSONNEL_ID").val();
	$.ajax({
		type : "POST",	
		url :  locat+'/integrated/infoshow.act',
		data : {
			user_id:loginstatus,
			PERSONNEL_ID:PERSONNEL_ID,
			tm : new Date().getTime()
		},
		dataType : 'json',
		cache : false,
		success : function(data) {
			$("#Name").val(data.contact);
			$("#Phone").val(data.contact_tel);
			$("#Email").val(data.mail);
			$("#CompanyName").val(data.company_name);
		}
	});
}

//项目竞标确定
function proinfosave(){
	//取得所有上传图片的文件名
    //var filePaths = new Array();
	//取得所有上传合同的路径
	var adoptPath = $("#apply_report_path").val();
//	alert(adoptPath);
	//取得所有上传合同的文件名
	var adoptNm = $("#apply_report_name").val();
//	alert(adoptNm);
	//信息ID
	var loginstatus=$("#loginstatus").val();
//	alert(loginstatus);
	var company_name=$("#CompanyName").val();
//	alert(company_name);
	var name=$("#Name").val();
	if ($.trim(name) == "") {
		$("#Name").tips({
			side : 2,
			msg : '请输入联系人名称',
			bg : '#AE81FF',
			time : 3
		});
		$("#Name").focus();
		$("#Name").val("");
		return false;
	}
	
	var Phone=$("#Phone").val();
	var Filter =/(^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$)|(^((\(\d{3}\))|(\d{3}\-))?(1[358]\d{9})$)/;
	if (Phone== "") {
		$("#Phone").tips({
			side : 2,
			msg : '请输入电话',
			bg : '#AE81FF',
			time : 3
		});
		$("#Phone").focus();
		return false;
	} else if (!(Filter.test(Phone))) {
		$("#Phone").tips({
			side : 2,
			msg : '请输入正确的联系电话格式',
			bg : '#AE81FF',
			time : 3
		});
		$("#Phone").focus();
		return false;
	}
	
	var Email=$("#Email").val();
	var EmailFilter = /^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT)$/;
	if (Email == "") {
		$("#Email").tips({
			side : 2,
			msg : '请输入邮箱',
			bg : '#AE81FF',
			time : 3
		});
		$("#Email").focus();
		return false;
	} else if (!(EmailFilter.test(Email))) {
		$("#Email").tips({
			side : 2,
			msg : '请输入正确的邮箱格式',
			bg : '#AE81FF',
			time : 3
		});
		$("#Email").focus();
		return false;
	}
	var PROJECT_ID=$("#PROJECT_ID").val();
//	alert(PROJECT_ID);
	var Introduction=$("#Introduction").val();
	//通过Ajax向后台传值
	$.ajax({
		type : "POST",
		url : locat+'/integrated/upLoadprojectfujian.act',
		data : {
			PROJECT_ID:PROJECT_ID,
			adoptPath : adoptPath,
			adoptNm : adoptNm,
			user_id:loginstatus,
			name:name,
			Phone:Phone,
			bid_company_name:company_name,
			Email:Email,
			Introduction:Introduction
		},
		dataType : 'json',
		cache : false,
		success : function(data) {
			if ("success" == data.result) {
				$('#success').show()
				setTimeout("openmy()", 1000);

				$('#wtht').modal('hide');
			} else {
				$('#error').show()
				setTimeout("errorshow()", 1000);

				$('#wtht').modal('hide');
			}
		}
	});
}

function openmy(){
	$('#success').hide();
}
function errorshow(){
	$('#error').hide();
}
