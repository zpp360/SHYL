function emailCheck() {
	// 邮箱验证
	var UserEmail = $("#userEmail").val();
	var UserEmailFilter = /^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT)$/;
	if (UserEmail == "") {
		$("#userEmail").tips({
			side : 2,
			msg : '请输入邮箱',
			bg : '#AE81FF',
			time : 3
		});
		$("#userEmail").focus();
		return false;
	} else if (!(UserEmailFilter.test(UserEmail))) {
		$("#userEmail").tips({
			side : 2,
			msg : '请输入正确的邮箱格式',
			bg : '#AE81FF',
			time : 3
		});
		$("#userEmail").focus();
		return false;
	}
	// 用户名验证
	var UserName = $("#userName").val();
	var UserNameFilter = /^[A-Za-z0-9@.]+$/;
	if (UserName == "") {
		$("#userName").tips({
			side : 2,
			msg : '请输入用户名',
			bg : '#AE81FF',
			time : 3
		});
		$("#userName").focus();
		return false;
	} else if (UserName.length < 4) {
		$("#userName").tips({
			side : 2,
			msg : '用户名至少要有4位',
			bg : '#AE81FF',
			time : 3
		});
		$("#userName").focus();
		return false;
	} else if (!(UserNameFilter.test(UserName))) {
		$("#userName").tips({
			side : 2,
			msg : '请输入正确的用户名格式,字母和数字',
			bg : '#AE81FF',
			time : 3
		});
		$("#userName").focus();
		return false;
	}
	// 密码验证
	var UserPassWord = $("#userPassWord").val();
	var UserPFilter = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,20}$/;
	if (UserPassWord == "") {
		$("#userPassWord").tips({
			side : 2,
			msg : '请输入密码',
			bg : '#AE81FF',
			time : 3
		});
		$("#userPassWord").focus();
		return false;
	} else if (UserPassWord.length < 6) {
		$("#userPassWord").tips({
			side : 2,
			msg : '密码至少包含6个字符',
			bg : '#AE81FF',
			time : 3
		});
		$("#userPassWord").focus();
		return false;
	}
	if (!(UserPFilter.test(UserPassWord))) {
		$("#userPassWord").tips({
			side : 2,
			msg : '请输入正确的密码格式',
			bg : '#AE81FF',
			time : 3
		});
		$("#userPassWord").focus();
		return false;
	}
	// 确认密码验证
	var UserCPassWord = $("#userCPassWord").val();
	if (UserCPassWord == "") {
		$("#userCPassWord").tips({
			side : 2,
			msg : '请输入确认密码',
			bg : '#AE81FF',
			time : 3
		});
		$("#userCPassWord").focus();
		return false;
	} else if (!(UserPFilter.test(UserCPassWord))) {
		$("#userCPassWord").tips({
			side : 2,
			msg : '请输入正确的确认密码格式',
			bg : '#AE81FF',
			time : 3
		});
		$("#userCPassWord").focus();
		return false;
	}
	if (UserCPassWord != UserPassWord) {
		$("#userCPassWord").tips({
			side : 2,
			msg : '确认密码和密码不一致',
			bg : '#AE81FF',
			time : 3
		});
		$("#userCPassWord").focus();
		return false;
	}
	//图片验证码验证
	if ($("#userCkeckCode").val() == "") {
		$("#userCkeckCode").tips({
			side : 2,
			msg : '请输入图片验证码',
			bg : '#AE81FF',
			time : 3
		});
		$("#userCkeckCode").focus();
		return false;
	}

	//注册条款验证
	var UserCheck = document.getElementById("userCheck");
	if (UserCheck.checked == false) {
		$("#userCheck").tips({
			side : 2,
			msg : '请勾选已阅读注册条款',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	return true;
}

function phoneCheck() {
	// 手机号验证
	var UserPhone = $("#userPhone").val();
	var UserPhoneFilter = /^1[3|4|5|8][0-9]\d{4,8}$/;
	if (UserPhone == "") {
		$("#userPhone").tips({
			side : 2,
			msg : '请输入手机号',
			bg : '#AE81FF',
			time : 3
		});
		$("#userPhone").focus();
		return false;
	} else if (!(UserPhoneFilter.test(UserPhone))) {
		$("#userPhone").tips({
			side : 2,
			msg : '请输入正确的手机号格式',
			bg : '#AE81FF',
			time : 3
		});
		$("#userPhone").focus();
		return false;
	}
	// 用户名验证
	var UserName = $("#userNameP").val();
	var UserNameFilter = /^[A-Za-z0-9@.]+$/;
	if (UserName == "") {
		$("#userNameP").tips({
			side : 2,
			msg : '请输入用户名',
			bg : '#AE81FF',
			time : 3
		});
		$("#userNameP").focus();
		return false;
	} else if (UserName.length < 4) {
		$("#userNameP").tips({
			side : 2,
			msg : '用户名至少要有4位',
			bg : '#AE81FF',
			time : 3
		});
		$("#userNameP").focus();
		return false;
	} else if (!(UserNameFilter.test(UserName))) {
		$("#userNameP").tips({
			side : 2,
			msg : '请输入正确的用户名格式,字母和数字',
			bg : '#AE81FF',
			time : 3
		});
		$("#userNameP").focus();
		return false;
	}
	// 密码验证
	var UserPassWord = $("#userPassWordP").val();
	var UserPFilter = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,20}$/;
	if (UserPassWord == "") {
		$("#userPassWordP").tips({
			side : 2,
			msg : '请输入密码',
			bg : '#AE81FF',
			time : 3
		});
		$("#userPassWordP").focus();
		return false;
	} else if (UserPassWord.length < 6) {
		$("#userPassWordP").tips({
			side : 2,
			msg : '密码至少包含6个字符',
			bg : '#AE81FF',
			time : 3
		});
		$("#userPassWordP").focus();
		return false;
	}
	if (!(UserPFilter.test(UserPassWord))) {
		$("#userPassWordP").tips({
			side : 2,
			msg : '请输入正确的密码格式',
			bg : '#AE81FF',
			time : 3
		});
		$("#userPassWordP").focus();
		return false;
	}
	// 确认密码验证
	var UserCPassWord = $("#userCPassWordP").val();
	if (UserCPassWord == "") {
		$("#userCPassWordP").tips({
			side : 2,
			msg : '请输入确认密码',
			bg : '#AE81FF',
			time : 3
		});
		$("#userCPassWordP").focus();
		return false;
	} else if (!(UserPFilter.test(UserCPassWord))) {
		$("#userCPassWordP").tips({
			side : 2,
			msg : '请输入正确的确认密码格式',
			bg : '#AE81FF',
			time : 3
		});
		$("#userCPassWordP").focus();
		return false;
	}
	if (UserCPassWord != UserPassWord) {
		$("#userCPassWordP").tips({
			side : 2,
			msg : '确认密码和密码不一致',
			bg : '#AE81FF',
			time : 3
		});
		$("#userCPassWordP").focus();
		return false;
	}
	//图片验证码验证
	if ($("#userCkeckCodeP").val() == "") {
		$("#userCkeckCodeP").tips({
			side : 2,
			msg : '请输入图片验证码',
			bg : '#AE81FF',
			time : 3
		});
		$("#userCkeckCodeP").focus();
		return false;
	}
	//短信验证码验证
	if ($("#userCkeckPhoneCode").val() == "") {
		$("#userCkeckPhoneCode").tips({
			side : 2,
			msg : '请输入短信验证码',
			bg : '#AE81FF',
			time : 3
		});
		$("#userCkeckPhoneCode").focus();
		return false;
	}
	//注册条款验证
	var UserCheck = document.getElementById("userCheckP");
	if (UserCheck.checked == false) {
		$("#userCheckP").tips({
			side : 2,
			msg : '请勾选已阅读注册条款',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	return true;
}

function groupCheck() {
	// 用户名验证
	var UserNm = $("#userNm").val();
	var UserNmFilter = /^[A-Za-z0-9@.]+$/;
	if (UserNm == "") {
		$("#userNm").tips({
			side : 2,
			msg : '请输入用户名',
			bg : '#AE81FF',
			time : 3
		});
		$("#userNm").focus();
		return false;
	} else if (UserNm.length < 4) {
		$("#userNm").tips({
			side : 2,
			msg : '用户名至少要有4位',
			bg : '#AE81FF',
			time : 3
		});
		$("#userNm").focus();
		return false;
	} else if (!(UserNmFilter.test(UserNm))) {
		$("#userNm").tips({
			side : 2,
			msg : '请输入正确的用户名格式,字母和数字',
			bg : '#AE81FF',
			time : 3
		});
		$("#userNm").focus();
		return false;
	}
	// 电子邮箱验证
	var Email = $("#email").val();
	var EmailFilter = /^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT)$/;
	if (Email == "") {
		$("#email").tips({
			side : 2,
			msg : '请输入电子邮箱',
			bg : '#AE81FF',
			time : 3
		});
		$("#email").focus();
		return false;
	} else if (!(EmailFilter.test(Email))) {
		$("#email").tips({
			side : 2,
			msg : '请输入正确的电子邮箱格式',
			bg : '#AE81FF',
			time : 3
		});
		$("#email").focus();
		return false;
	}
	// 密码验证
	var PassWord = $("#passWordG").val();
	var PsdFilter = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,20}$/;
	if (PassWord == "") {
		$("#passWordG").tips({
			side : 2,
			msg : '请输入密码',
			bg : '#AE81FF',
			time : 3
		});
		$("#passWordG").focus();
		return false;
	} else if (PassWord.length < 6) {
		$("#passWordG").tips({
			side : 2,
			msg : '密码至少包含6个字符',
			bg : '#AE81FF',
			time : 3
		});
		$("#passWordG").focus();
		return false;
	}
	if (!(PsdFilter.test(PassWord))) {
		$("#passWordG").tips({
			side : 2,
			msg : '请输入正确的密码格式',
			bg : '#AE81FF',
			time : 3
		});
		$("#passWordG").focus();
		return false;
	}
	// 确认密码验证
	var CPassWord = $("#cPassWordG").val();
	if (CPassWord == "") {
		$("#cPassWordG").tips({
			side : 2,
			msg : '请输入确认密码',
			bg : '#AE81FF',
			time : 3
		});
		$("#cPassWordG").focus();
		return false;
	} else if (!(PsdFilter.test(CPassWord))) {
		$("#cPassWordG").tips({
			side : 2,
			msg : '请输入正确的确认密码格式',
			bg : '#AE81FF',
			time : 3
		});
		$("#cPassWordG").focus();
		return false;
	}
	if (CPassWord != PassWord) {
		$("#cPassWordG").tips({
			side : 2,
			msg : '确认密码和密码不一致',
			bg : '#AE81FF',
			time : 3
		});
		$("#cPassWordG").focus();
		return false;
	}
	// 企业名称验证
	var GroupName = $("#groupName").val();
	if ($.trim(GroupName) == "") {
		$("#groupName").tips({
			side : 2,
			msg : '请输入企业名称',
			bg : '#AE81FF',
			time : 3
		});
		$("#groupName").val('');
		$("#groupName").focus();
		return false;
	}
	// 组织代码验证
	var Ocode = $("#ocode").val();
	var OcodeFilter = /^[0-9A-Z]{18}$/;
	var filter=/[0-9]{8}-[a-zA-Z0-9]/;
	if (Ocode == "") {
		$("#ocode").tips({
			side : 2,
			msg : '请输入组织代码',
			bg : '#AE81FF',
			time : 3
		});
		$("#ocode").focus();
		return false;
	}else if (Ocode.length != 10 && Ocode.length != 18) {
		$("#ocode").tips({
			side : 2,
			msg : '必须为10位组织机构代码或18位社会信用代码',
			bg : '#AE81FF',
			time : 3
		});
		$("#ocode").focus();
		return false;
	} else {
		if (!(OcodeFilter.test(Ocode)) && !(filter.test(Ocode))) {
			$("#ocode").tips({
				side : 2,
				msg : '请输入正确的组织代码格式',
				bg : '#AE81FF',
				time : 3
			});
			$("#ocode").focus();
			return false;
		}
	}
	// 营业执照扫描件验证
	var License = $("#license").val();
	if (License == "") {
		$("#weixin_show").tips({
			side : 2,
			msg : '请上传营业执照扫描件',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	// 公司行业验证
	var inId = $("#inId").val();
	if (inId == "") {
		$("#inText").tips({
			side : 2,
			msg : '请输入公司行业',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	// 公司所在地(省)验证
	var Province = document.getElementById("province").value;
	if (Province == "" || Province=="---省---") {
		$("#province").tips({
			side : 2,
			msg : '请输入公司所在地(省)',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	// 公司所在地(市)验证
	var City = document.getElementById("city").value;
	if (City == "" || City=="---市---") {
		$("#city").tips({
			side : 2,
			msg : '请输入公司所在地(市)',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	// 审核机关验证
	var areas = document.getElementById("auditOrgan").value;
	if(Province=="16" && City=="170"){
		if (areas == "" || areas=="---商务局---") {
			$("#auditOrgan").tips({
				side : 2,
				msg : '请选择审核机关',
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
	}
	// 公司地址验证
	var Address = $("#address").val();
	if ($.trim(Address) == "") {
		$("#address").tips({
			side : 2,
			msg : '请输入公司地址',
			bg : '#AE81FF',
			time : 3
		});
		$("#address").val('');
		$("#address").focus();
		return false;
	}
	// 联系人验证
	var Contact = $("#contact").val();
	if ($.trim(Contact) == "") {
		$("#contact").tips({
			side : 2,
			msg : '请输入联系人',
			bg : '#AE81FF',
			time : 3
		});
		$("#contact").val('');
		$("#contact").focus();
		return false;
	}
	// 联系人电话验证
	var Phone = $("#phone").val();
	var Filter = /^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
	var phoneFilter = /^1[3|4|5|8][0-9]\d{4,8}$/;
	if (Phone == "") {
		$("#phone").tips({
			side : 2,
			msg : '请输入电话',
			bg : '#AE81FF',
			time : 3
		});
		$("#phone").focus();
		return false;
	} else {
		if (!(Filter.test(Phone)) && !(phoneFilter.test(Phone))) {
			$("#phone").tips({
				side : 2,
				msg : '请输入正确的联系电话格式',
				bg : '#AE81FF',
				time : 3
			});
			$("#phone").focus();
			return false;
		}
	}
	//图片验证码验证
	if ($("#ckeckCode").val() == "") {
		$("#ckeckCode").tips({
			side : 2,
			msg : '请输入图片验证码',
			bg : '#AE81FF',
			time : 3
		});
		$("#ckeckCode").focus();
		return false;
	}
	//注册条款验证
	var check = document.getElementById("checkG");
	if (check.checked == false) {
		$("#checkG").tips({
			side : 2,
			msg : '请勾选已阅读注册条款',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	return true;
}

function institutionCheck() {
	// 用户名验证
	var UserNm = $("#userNmI").val();
	var UserNmFilter = /^[A-Za-z0-9@.]+$/;
	if (UserNm == "") {
		$("#userNmI").tips({
			side : 2,
			msg : '请输入用户名',
			bg : '#AE81FF',
			time : 3
		});
		$("#userNmI").focus();
		return false;
	} else if (UserNm.length < 4) {
		$("#userNmI").tips({
			side : 2,
			msg : '用户名至少要有4位',
			bg : '#AE81FF',
			time : 3
		});
		$("#userNmI").focus();
		return false;
	} else if (!(UserNmFilter.test(UserNm))) {
		$("#userNmI").tips({
			side : 2,
			msg : '请输入正确的用户名格式,字母和数字',
			bg : '#AE81FF',
			time : 3
		});
		$("#userNmI").focus();
		return false;
	}
	// 电子邮箱验证
	var Email = $("#emailI").val();
	var EmailFilter = /^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT)$/;
	if (Email == "") {
		$("#emailI").tips({
			side : 2,
			msg : '请输入电子邮箱',
			bg : '#AE81FF',
			time : 3
		});
		$("#emailI").focus();
		return false;
	} else if (!(EmailFilter.test(Email))) {
		$("#emailI").tips({
			side : 2,
			msg : '请输入正确的电子邮箱格式',
			bg : '#AE81FF',
			time : 3
		});
		$("#emailI").focus();
		return false;
	}
	// 密码验证
	var PassWord = $("#passWordI").val();
	var PsdFilter = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,20}$/;
	if (PassWord == "") {
		$("#passWordI").tips({
			side : 2,
			msg : '请输入密码',
			bg : '#AE81FF',
			time : 3
		});
		$("#passWordI").focus();
		return false;
	} else if (PassWord.length < 6) {
		$("#passWordI").tips({
			side : 2,
			msg : '密码至少包含6个字符',
			bg : '#AE81FF',
			time : 3
		});
		$("#passWordI").focus();
		return false;
	}
	if (!(PsdFilter.test(PassWord))) {
		$("#passWordI").tips({
			side : 2,
			msg : '请输入正确的密码格式',
			bg : '#AE81FF',
			time : 3
		});
		$("#passWordI").focus();
		return false;
	}
	// 确认密码验证
	var CPassWord = $("#cPassWordI").val();
	if (CPassWord == "") {
		$("#cPassWordI").tips({
			side : 2,
			msg : '请输入确认密码',
			bg : '#AE81FF',
			time : 3
		});
		$("#cPassWordI").focus();
		return false;
	} else if (!(PsdFilter.test(CPassWord))) {
		$("#cPassWordI").tips({
			side : 2,
			msg : '请输入正确的确认密码格式',
			bg : '#AE81FF',
			time : 3
		});
		$("#cPassWordI").focus();
		return false;
	}
	if (CPassWord != PassWord) {
		$("#cPassWordI").tips({
			side : 2,
			msg : '确认密码和密码不一致',
			bg : '#AE81FF',
			time : 3
		});
		$("#cPassWordI").focus();
		return false;
	}
	// 培训机构名称验证
	var InstitutionName = $("#groupNameI").val();
	if ($.trim(InstitutionName) == "") {
		$("#groupNameI").tips({
			side : 2,
			msg : '请输入培训机构名称',
			bg : '#AE81FF',
			time : 3
		});
		$("#groupNameI").val('');
		$("#groupNameI").focus();
		return false;
	}
	// 组织代码验证
	var Ocode = $("#ocodeI").val();
	var OcodeFilter = /^[0-9A-Z]{18}$/;
	var filter=/[0-9]{8}-[a-zA-Z0-9]/;
	if (Ocode == "") {
		$("#ocodeI").tips({
			side : 2,
			msg : '请输入组织代码',
			bg : '#AE81FF',
			time : 3
		});
		$("#ocodeI").focus();
		return false;
	}else if (Ocode.length != 10 && Ocode.length != 18) {
		$("#ocodeI").tips({
			side : 2,
			msg : '必须为10位组织机构代码或18位社会信用代码',
			bg : '#AE81FF',
			time : 3
		});
		$("#ocodeI").focus();
		return false;
	} else {
		if (!(OcodeFilter.test(Ocode)) && !(filter.test(Ocode))) {
			$("#ocodeI").tips({
				side : 2,
				msg : '请输入正确的组织代码格式',
				bg : '#AE81FF',
				time : 3
			});
			$("#ocodeI").focus();
			return false;
		}
	}
	// 营业执照扫描件验证
	var License = $("#licenseI").val();
	if (License == "") {
		$("#weixin_showI").tips({
			side : 2,
			msg : '请上传营业执照扫描件',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	// 培训机构所在地(省)验证
	var Province = document.getElementById("provinceI").value;
	if (Province == "" || Province=="---省---") {
		$("#provinceI").tips({
			side : 2,
			msg : '请输入培训机构所在地(省)',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	// 培训机构所在地(市)验证
	var City = document.getElementById("cityI").value;
	if (City == "" || City=="---市---") {
		$("#cityI").tips({
			side : 2,
			msg : '请输入培训机构所在地(市)',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	// 审核机关验证
	var areas = document.getElementById("auditOrganI").value;
	if(Province=="16" && City=="170"){
		if (areas == "" || areas=="---商务局---") {
			$("#auditOrganI").tips({
				side : 2,
				msg : '请选择审核机关',
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
	}
	// 培训机构地址验证
	var Address = $("#addressI").val();
	if ($.trim(Address) == "") {
		$("#addressI").tips({
			side : 2,
			msg : '请输入培训机构地址',
			bg : '#AE81FF',
			time : 3
		});
		$("#addressI").val('');
		$("#addressI").focus();
		return false;
	}
	// 联系人验证
	var Contact = $("#contactI").val();
	if ($.trim(Contact) == "") {
		$("#contactI").tips({
			side : 2,
			msg : '请输入联系人',
			bg : '#AE81FF',
			time : 3
		});
		$("#contactI").val('');
		$("#contactI").focus();
		return false;
	}
	// 联系人电话验证
	var Phone = $("#phoneI").val();
	var Filter = /^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
	var phoneFilter = /^1[3|4|5|8][0-9]\d{4,8}$/;
	if (Phone == "") {
		$("#phoneI").tips({
			side : 2,
			msg : '请输入电话',
			bg : '#AE81FF',
			time : 3
		});
		$("#phoneI").focus();
		return false;
	} else {
		if (!(Filter.test(Phone)) && !(phoneFilter.test(Phone))) {
			$("#phoneI").tips({
				side : 2,
				msg : '请输入正确的联系电话格式',
				bg : '#AE81FF',
				time : 3
			});
			$("#phoneI").focus();
			return false;
		}
	}
	//图片验证码验证
	if ($("#ckeckCodeI").val() == "") {
		$("#ckeckCodeI").tips({
			side : 2,
			msg : '请输入图片验证码',
			bg : '#AE81FF',
			time : 3
		});
		$("#ckeckCodeI").focus();
		return false;
	}
	//注册条款验证
	var check = document.getElementById("checkI");
	if (check.checked == false) {
		$("#checkI").tips({
			side : 2,
			msg : '请勾选已阅读注册条款',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	return true;
}

function academyCheck() {
	// 用户名验证
	var UserNm = $("#userNmS").val();
	var UserNmFilter = /^[A-Za-z0-9@.]+$/;
	if (UserNm == "") {
		$("#userNmS").tips({
			side : 2,
			msg : '请输入用户名',
			bg : '#AE81FF',
			time : 3
		});
		$("#userNmS").focus();
		return false;
	} else if (UserNm.length < 4) {
		$("#userNmS").tips({
			side : 2,
			msg : '用户名至少要有4位',
			bg : '#AE81FF',
			time : 3
		});
		$("#userNmS").focus();
		return false;
	} else if (!(UserNmFilter.test(UserNm))) {
		$("#userNmS").tips({
			side : 2,
			msg : '请输入正确的用户名格式,字母和数字',
			bg : '#AE81FF',
			time : 3
		});
		$("#userNmS").focus();
		return false;
	}
	// 电子邮箱验证
	var Email = $("#emailS").val();
	var EmailFilter = /^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT)$/;
	if (Email == "") {
		$("#emailS").tips({
			side : 2,
			msg : '请输入电子邮箱',
			bg : '#AE81FF',
			time : 3
		});
		$("#emailS").focus();
		return false;
	} else if (!(EmailFilter.test(Email))) {
		$("#emailS").tips({
			side : 2,
			msg : '请输入正确的电子邮箱格式',
			bg : '#AE81FF',
			time : 3
		});
		$("#emailS").focus();
		return false;
	}
	// 密码验证
	var PassWord = $("#passWordS").val();
	var PsdFilter = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,20}$/;
	if (PassWord == "") {
		$("#passWordS").tips({
			side : 2,
			msg : '请输入密码',
			bg : '#AE81FF',
			time : 3
		});
		$("#passWordS").focus();
		return false;
	} else if (PassWord.length < 6) {
		$("#passWordS").tips({
			side : 2,
			msg : '密码至少包含6个字符',
			bg : '#AE81FF',
			time : 3
		});
		$("#passWordS").focus();
		return false;
	}
	if (!(PsdFilter.test(PassWord))) {
		$("#passWordS").tips({
			side : 2,
			msg : '请输入正确的密码格式',
			bg : '#AE81FF',
			time : 3
		});
		$("#passWordS").focus();
		return false;
	}
	// 确认密码验证
	var CPassWord = $("#cPassWordS").val();
	if (CPassWord == "") {
		$("#cPassWordS").tips({
			side : 2,
			msg : '请输入确认密码',
			bg : '#AE81FF',
			time : 3
		});
		$("#cPassWordS").focus();
		return false;
	} else if (!(PsdFilter.test(CPassWord))) {
		$("#cPassWordS").tips({
			side : 2,
			msg : '请输入正确的确认密码格式',
			bg : '#AE81FF',
			time : 3
		});
		$("#cPassWordS").focus();
		return false;
	}
	if (CPassWord != PassWord) {
		$("#cPassWordS").tips({
			side : 2,
			msg : '确认密码和密码不一致',
			bg : '#AE81FF',
			time : 3
		});
		$("#cPassWordS").focus();
		return false;
	}
	// 院校名称验证
	var AcademyName = $("#groupNameS").val();
	if ($.trim(AcademyName) == "") {
		$("#groupNameS").tips({
			side : 2,
			msg : '请输入院校名称',
			bg : '#AE81FF',
			time : 3
		});
		$("#groupNameS").val('');
		$("#groupNameS").focus();
		return false;
	}
	// 组织代码验证
	var Ocode = $("#ocodeS").val();
	var OcodeFilter = /^[0-9A-Z]{18}$/;
	var filter=/[0-9]{8}-[a-zA-Z0-9]/;
	if (Ocode == "") {
		$("#ocodeS").tips({
			side : 2,
			msg : '请输入组织代码',
			bg : '#AE81FF',
			time : 3
		});
		$("#ocodeS").focus();
		return false;
	}else if (Ocode.length != 10 && Ocode.length != 18) {
		$("#ocodeS").tips({
			side : 2,
			msg : '必须为10位组织机构代码或18位社会信用代码',
			bg : '#AE81FF',
			time : 3
		});
		$("#ocodeS").focus();
		return false;
	} else {
		if (!(OcodeFilter.test(Ocode)) && !(filter.test(Ocode))) {
			$("#ocodeS").tips({
				side : 2,
				msg : '请输入正确的组织代码格式',
				bg : '#AE81FF',
				time : 3
			});
			$("#ocodeS").focus();
			return false;
		}
	}
	// 事业单位法人证书验证
	var License = $("#licenseS").val();
	if (License == "") {
		$("#weixin_showS").tips({
			side : 2,
			msg : '请上传事业单位法人证书',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	// 院校所在地(省)验证
	var Province = document.getElementById("provinceS").value;
	if (Province == "" || Province=="---省---") {
		$("#provinceS").tips({
			side : 2,
			msg : '请输入院校所在地(省)',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	// 院校所在地(市)验证
	var City = document.getElementById("cityS").value;
	if (City == "" || City=="---市---") {
		$("#cityS").tips({
			side : 2,
			msg : '请输入院校所在地(市)',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	// 审核机关验证
	var areas = document.getElementById("auditOrganS").value;
	if(Province=="16" && City=="170"){
		if (areas == "" || areas=="---商务局---") {
			$("#auditOrganS").tips({
				side : 2,
				msg : '请选择审核机关',
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
	}
	// 院校地址验证
	var Address = $("#addressS").val();
	if ($.trim(Address) == "") {
		$("#addressS").tips({
			side : 2,
			msg : '请输入院校地址',
			bg : '#AE81FF',
			time : 3
		});
		$("#addressS").val('');
		$("#addressS").focus();
		return false;
	}
	// 联系人验证
	var Contact = $("#contactS").val();
	if ($.trim(Contact) == "") {
		$("#contactS").tips({
			side : 2,
			msg : '请输入联系人',
			bg : '#AE81FF',
			time : 3
		});
		$("#contactS").val('');
		$("#contactS").focus();
		return false;
	}
	// 联系人电话验证
	var Phone = $("#phoneS").val();
	var Filter = /^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
	var phoneFilter = /^1[3|4|5|8][0-9]\d{4,8}$/;
	if (Phone == "") {
		$("#phoneS").tips({
			side : 2,
			msg : '请输入电话',
			bg : '#AE81FF',
			time : 3
		});
		$("#phoneS").focus();
		return false;
	} else {
		if (!(Filter.test(Phone)) && !(phoneFilter.test(Phone))) {
			$("#phoneS").tips({
				side : 2,
				msg : '请输入正确的联系电话格式',
				bg : '#AE81FF',
				time : 3
			});
			$("#phoneS").focus();
			return false;
		}
	}
	//图片验证码验证
	if ($("#ckeckCodeS").val() == "") {
		$("#ckeckCodeS").tips({
			side : 2,
			msg : '请输入图片验证码',
			bg : '#AE81FF',
			time : 3
		});
		$("#ckeckCodeS").focus();
		return false;
	}
	//注册条款验证
	var check = document.getElementById("checkS");
	if (check.checked == false) {
		$("#checkS").tips({
			side : 2,
			msg : '请勾选已阅读注册条款',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	return true;
}

function resourcesCheck() {
	// 用户名验证
	var UserNm = $("#userNmP").val();
	var UserNmFilter = /^[A-Za-z0-9@.]+$/;
	if (UserNm == "") {
		$("#userNmP").tips({
			side : 2,
			msg : '请输入用户名',
			bg : '#AE81FF',
			time : 3
		});
		$("#userNmP").focus();
		return false;
	} else if (UserNm.length < 4) {
		$("#userNmP").tips({
			side : 2,
			msg : '用户名至少要有4位',
			bg : '#AE81FF',
			time : 3
		});
		$("#userNmP").focus();
		return false;
	} else if (!(UserNmFilter.test(UserNm))) {
		$("#userNmP").tips({
			side : 2,
			msg : '请输入正确的用户名格式,字母和数字',
			bg : '#AE81FF',
			time : 3
		});
		$("#userNmP").focus();
		return false;
	}
	// 电子邮箱验证
	var Email = $("#emailP").val();
	var EmailFilter = /^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT)$/;
	if (Email == "") {
		$("#emailP").tips({
			side : 2,
			msg : '请输入电子邮箱',
			bg : '#AE81FF',
			time : 3
		});
		$("#emailP").focus();
		return false;
	} else if (!(EmailFilter.test(Email))) {
		$("#emailP").tips({
			side : 2,
			msg : '请输入正确的电子邮箱格式',
			bg : '#AE81FF',
			time : 3
		});
		$("#emailP").focus();
		return false;
	}
	// 密码验证
	var PassWord = $("#passWordP").val();
	var PsdFilter = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,20}$/;
	if (PassWord == "") {
		$("#passWordP").tips({
			side : 2,
			msg : '请输入密码',
			bg : '#AE81FF',
			time : 3
		});
		$("#passWordP").focus();
		return false;
	} else if (PassWord.length < 6) {
		$("#passWordP").tips({
			side : 2,
			msg : '密码至少包含6个字符',
			bg : '#AE81FF',
			time : 3
		});
		$("#passWordP").focus();
		return false;
	}
	if (!(PsdFilter.test(PassWord))) {
		$("#passWordP").tips({
			side : 2,
			msg : '请输入正确的密码格式',
			bg : '#AE81FF',
			time : 3
		});
		$("#passWordP").focus();
		return false;
	}
	// 确认密码验证
	var CPassWord = $("#cPassWordP").val();
	if (CPassWord == "") {
		$("#cPassWordP").tips({
			side : 2,
			msg : '请输入确认密码',
			bg : '#AE81FF',
			time : 3
		});
		$("#cPassWordP").focus();
		return false;
	} else if (!(PsdFilter.test(CPassWord))) {
		$("#cPassWordP").tips({
			side : 2,
			msg : '请输入正确的确认密码格式',
			bg : '#AE81FF',
			time : 3
		});
		$("#cPassWordP").focus();
		return false;
	}
	if (CPassWord != PassWord) {
		$("#cPassWordP").tips({
			side : 2,
			msg : '确认密码和密码不一致',
			bg : '#AE81FF',
			time : 3
		});
		$("#cPassWordP").focus();
		return false;
	}
	// 组织代码验证
	var Ocode = $("#ocodeP").val();
	var OcodeFilter = /^[0-9A-Z]{18}$/;
	var filter=/[0-9]{8}-[a-zA-Z0-9]/;
	if (Ocode != "") {
		if (Ocode.length != 10 && Ocode.length != 18) {
			$("#ocodeP").tips({
				side : 2,
				msg : '必须为10位组织机构代码或18位社会信用代码',
				bg : '#AE81FF',
				time : 3
			});
			$("#ocodeP").focus();
			return false;
		} else {
			if (!(OcodeFilter.test(Ocode)) && !(filter.test(Ocode))) {
				$("#ocodeP").tips({
					side : 2,
					msg : '请输入正确的组织代码格式',
					bg : '#AE81FF',
					time : 3
				});
				$("#ocodeP").focus();
				return false;
			}
		}
	}
	// 联系人验证
	var Contact = $("#contactP").val();
	if ($.trim(Contact) == "") {
		$("#contactP").tips({
			side : 2,
			msg : '请输入联系人',
			bg : '#AE81FF',
			time : 3
		});
		$("#contactP").val('');
		$("#contactP").focus();
		return false;
	}
	// 联系人电话验证
	var Phone = $("#phoneP").val();
	var Filter = /^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
	var phoneFilter = /^1[3|4|5|8][0-9]\d{4,8}$/;
	if (Phone == "") {
		$("#phoneP").tips({
			side : 2,
			msg : '请输入电话',
			bg : '#AE81FF',
			time : 3
		});
		$("#phoneP").focus();
		return false;
	} else {
		if (!(Filter.test(Phone)) && !(phoneFilter.test(Phone))) {
			$("#phoneP").tips({
				side : 2,
				msg : '请输入正确的联系电话格式',
				bg : '#AE81FF',
				time : 3
			});
			$("#phoneP").focus();
			return false;
		}
	}
	//图片验证码验证
	if ($("#ckeckCodeP").val() == "") {
		$("#ckeckCodeP").tips({
			side : 2,
			msg : '请输入图片验证码',
			bg : '#AE81FF',
			time : 3
		});
		$("#ckeckCodeP").focus();
		return false;
	}
	//注册条款验证
	var check = document.getElementById("checkP");
	if (check.checked == false) {
		$("#checkP").tips({
			side : 2,
			msg : '请勾选已阅读注册条款',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	return true;
}

$(document).ready(function() {
	changeCode();
	$("#codeImg").bind("click", changeCode);
	$("#codePImg").bind("click", changeCode);
	$("#cCodeImg").bind("click", changeCode);
	$("#cCodeIImg").bind("click", changeCode);
	$("#cCodeSImg").bind("click", changeCode);
	$("#cCodePImg").bind("click", changeCode);
	$("#province").change(function() {
		BindCId();
	});
	$("#provinceI").change(function() {
		BindCIdI();
	});
	$("#provinceS").change(function() {
		BindCIdS();
	});
	$("#provinceP").change(function() {
		BindCIdP();
	});
	$("#city").change(function() {
		BindArea();
	});
	$("#cityI").change(function() {
		BindAreaI();
	});
	$("#cityS").change(function() {
		BindAreaS();
	});
	$("#cityP").change(function() {
		BindAreaP();
	});
});

function genTimestamp() {
	var time = new Date();
	return time.getTime();
}

function changeCode() {
	$("#codeImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=a");
	$("#codePImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=b");
	$("#cCodeImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=c");
	$("#cCodeIImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=d");
	$("#cCodeSImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=e");
	$("#cCodePImg").attr("src", "codePlat.do?t=" + genTimestamp()+ "&type=f");
}

function BindArea(){
	var cityd = $("#city").val();
	if (cityd == "170") {
		$("#areali").css("display","block");
	}else{
		$("#areali").css("display","none");
	}
}
function BindAreaI(){
	var cityd = $("#cityI").val();
	if (cityd == "170") {
		$("#arealiI").css("display","block");
	}else{
		$("#arealiI").css("display","none");
	}
}
function BindAreaS(){
	var cityd = $("#cityS").val();
	if (cityd == "170") {
		$("#arealiS").css("display","block");
	}else{
		$("#arealiS").css("display","none");
	}
}
function BindAreaP(){
	var cityd = $("#cityP").val();
	if (cityd == "170") {
		$("#arealiP").css("display","block");
	}else{
		$("#arealiP").css("display","none");
	}
}

//市
function BindCId() {
	var PID = $("#province").val();
	$("#city").find('option').remove();
	if (PID == "" || PID == "---省---") {
		$("<option value=''>---市---</option>").appendTo("#city");
	}else{
		$.post('register/getCities.act', {
			'PID' : PID
		}, function(data) {
			$.each(data.cityList,
					function(i, list) {
						$(
								"<option value='" + list.region_id + "'>"
										+ list.region_name + "</option>").appendTo(
								"#city");
					});
		});
	}
	if (PID == "16") {
		$("#areali").css("display","block");
	}else{
		$("#areali").css("display","none");
	}
	$("#city").val('');
}
function BindCIdI() {
	var PID = $("#provinceI").val();
	$("#cityI").find('option').remove();
	if (PID == "" || PID == "---省---") {
		$("<option value=''>---市---</option>").appendTo("#cityI");
	}else{
		$.post('register/getCities.act', {
			'PID' : PID
		}, function(data) {
			$.each(data.cityList,
					function(i, list) {
						$(
								"<option value='" + list.region_id + "'>"
										+ list.region_name + "</option>").appendTo(
								"#cityI");
					});
		});
	}
	if (PID == "16") {
		$("#arealiI").css("display","block");
	}else{
		$("#arealiI").css("display","none");
	}
	$("#cityI").val('');
}
function BindCIdS() {
	var PID = $("#provinceS").val();
	$("#cityS").find('option').remove();
	if (PID == "" || PID == "---省---") {
		$("<option value=''>---市---</option>").appendTo("#cityS");
	}else{
		$.post('register/getCities.act', {
			'PID' : PID
		}, function(data) {
			$.each(data.cityList,
					function(i, list) {
						$(
								"<option value='" + list.region_id + "'>"
										+ list.region_name + "</option>").appendTo(
								"#cityS");
					});
		});
	}
	if (PID == "16") {
		$("#arealiS").css("display","block");
	}else{
		$("#arealiS").css("display","none");
	}
	$("#cityS").val('');
}
function BindCIdP() {
	var PID = $("#provinceP").val();
	$("#cityP").find('option').remove();
	if (PID == "" || PID == "---省---") {
		$("<option value=''>---市---</option>").appendTo("#cityP");
	}else{
		$.post('register/getCities.act', {
			'PID' : PID
		}, function(data) {
			$.each(data.cityList,
					function(i, list) {
						$(
								"<option value='" + list.region_id + "'>"
										+ list.region_name + "</option>").appendTo(
								"#cityP");
					});
		});
	}
	if (PID == "16") {
		$("#arealiP").css("display","block");
	}else{
		$("#arealiP").css("display","none");
	}
	$("#cityP").val('');
}

//获取行业知识选中值
function Industrycheck() {
	var relateIds = "";
	var texts = "";
	$("input[name='Ind']:checked").each(function() {
		relateIds += $(this).attr('value') + ",";
	});//得到选中复选框的value
	relateIds = relateIds.substring(0, relateIds.length - 1);

	$("input[name='Ind']:checked").each(function() {
		texts += $(this).parent().text() + ',';
	});//得到选中复选框的text 
	if (texts.length > 40) {
		texts = texts.substring(0, 40) + "....";
	} else {
		texts = texts.substring(0, texts.length - 1);
	}
	if (texts == "") {
		$("#inText").text("请选择行业知识");
		$("#inText").append('&nbsp;<b class="caret"></b>')
		$("#Industry").val("");
		$("#inId").val("");
	} else {
		$("#inText").text(texts);
		$("#inId").val(relateIds);
		$("#Industry").val(texts);
	}
	$("[name='Ind']").removeAttr("checked");//取消全选
}
function Clear() {
	//行业
	$("[name='Ind']").removeAttr("checked");//取消全选
	$("[name='Ind']").each(function() {
		$(this).attr("disabled", false);
	});
}
//checkbox反选
function InChecked() {
	// 行业
	if ($("#inId").val() != "") {
		var st = $("#inId").val();
		var cklist = st.split(',');
		for (var i = 0; i < cklist.length; i++) {
			var cid = cklist[i];
			document.getElementById("aa_"+cid).checked = true;
		}
	}
}

function IndustrycheckP() {
	var relateIds = "";
	var texts = "";
	$("input[name='IndP']:checked").each(function() {
		relateIds += $(this).attr('value') + ",";
	});//得到选中复选框的value
	relateIds = relateIds.substring(0, relateIds.length - 1);

	$("input[name='IndP']:checked").each(function() {
		texts += $(this).parent().text() + ',';
	});//得到选中复选框的text 
	if (texts.length > 40) {
		texts = texts.substring(0, 40) + "....";
	} else {
		texts = texts.substring(0, texts.length - 1);
	}
	if (texts == "") {
		$("#inTextP").text("请选择行业知识");
		$("#inTextP").append('&nbsp;<b class="caret"></b>')
		$("#IndustryP").val("");
		$("#inIdP").val("");
	} else {
		$("#inTextP").text(texts);
		$("#inIdP").val(relateIds);
		$("#IndustryP").val(texts);
	}
	$("[name='IndP']").removeAttr("checked");//取消全选
}
function ClearP() {
	//行业
	$("[name='IndP']").removeAttr("checked");//取消全选
	$("[name='IndP']").each(function() {
		$(this).attr("disabled", false);
	});
}
//checkbox反选
function InCheckedP() {
	// 行业
	if ($("#inIdP").val() != "") {
		var st = $("#inIdP").val();
		var cklist = st.split(',');
		for (var i = 0; i < cklist.length; i++) {
			var cid = cklist[i];
			document.getElementById("bb_"+cid).checked = true;
		}
	}
}