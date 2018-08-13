function userEmailBlur() {
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
		return false;
	} else if (!(UserEmailFilter.test(UserEmail))) {
		$("#userEmail").tips({
			side : 2,
			msg : '请输入正确的邮箱格式',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function userNameBlur() {
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
		return false;
	} else if (UserName.length < 4) {
		$("#userName").tips({
			side : 2,
			msg : '用户名至少要有4位',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	} else if (!(UserNameFilter.test(UserName))) {
		$("#userName").tips({
			side : 2,
			msg : '请输入正确的用户名格式,字母和数字',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function userPassWordBlur() {
	// 密码验证
	var UserPassWord = $("#userPassWord").val();
	var UserPFilter = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,16}$/;
	if (UserPassWord == "") {
		$("#userPassWord").tips({
			side : 2,
			msg : '请输入密码',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	} else if (UserPassWord.length < 6) {
		$("#userPassWord").tips({
			side : 2,
			msg : '密码至少包含6个字符',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	if (!(UserPFilter.test(UserPassWord))) {
		$("#userPassWord").tips({
			side : 2,
			msg : '请输入正确的密码格式',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function userCPassWordBlur() {
	// 确认密码验证
	var UserPassWord = $("#userPassWord").val();
	var UserCPassWord = $("#userCPassWord").val();
	var UserCPFilter = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,16}$/;
	if (UserCPassWord == "") {
		$("#userCPassWord").tips({
			side : 2,
			msg : '请输入确认密码',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	} else if (!(UserCPFilter.test(UserCPassWord))) {
		$("#userCPassWord").tips({
			side : 2,
			msg : '请输入正确的确认密码格式',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	if (UserCPassWord != UserPassWord) {
		$("#userCPassWord").tips({
			side : 2,
			msg : '确认密码和密码不一致',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function userCkeckCodeBlur() {
	//图片验证码验证
	if ($("#userCkeckCode").val() == "") {
		$("#userCkeckCode").tips({
			side : 2,
			msg : '请输入图片验证码',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function changeval() {
	// 注册条款验证
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
}

function userPhoneBlur() {
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
		return false;
	} else if (!(UserPhoneFilter.test(UserPhone))) {
		$("#userPhone").tips({
			side : 2,
			msg : '请输入正确的手机号格式',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function userNamePBlur() {
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
		return false;
	} else if (UserName.length < 4) {
		$("#userNameP").tips({
			side : 2,
			msg : '用户名至少要有4位',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	} else if (!(UserNameFilter.test(UserName))) {
		$("#userNameP").tips({
			side : 2,
			msg : '请输入正确的用户名格式,字母和数字',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function userPassWordPBlur() {
	// 密码验证
	var UserPassWord = $("#userPassWordP").val();
	var UserPFilter = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,16}$/;
	if (UserPassWord == "") {
		$("#userPassWordP").tips({
			side : 2,
			msg : '请输入密码',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	} else if (UserPassWord.length < 6) {
		$("#userPassWordP").tips({
			side : 2,
			msg : '密码至少包含6个字符',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	if (!(UserPFilter.test(UserPassWord))) {
		$("#userPassWordP").tips({
			side : 2,
			msg : '请输入正确的密码格式',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function userCPassWordPBlur() {
	// 确认密码验证
	var UserPassWord = $("#userPassWordP").val();
	var UserCPassWord = $("#userCPassWordP").val();
	var UserCPFilter = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,16}$/;
	if (UserCPassWord == "") {
		$("#userCPassWordP").tips({
			side : 2,
			msg : '请输入确认密码',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	} else if (!(UserCPFilter.test(UserCPassWord))) {
		$("#userCPassWordP").tips({
			side : 2,
			msg : '请输入正确的确认密码格式',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	if (UserCPassWord != UserPassWord) {
		$("#userCPassWordP").tips({
			side : 2,
			msg : '确认密码和密码不一致',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function userCkeckCodePBlur() {
	//图片验证码验证
	if ($("#userCkeckCodeP").val() == "") {
		$("#userCkeckCodeP").tips({
			side : 2,
			msg : '请输入图片验证码',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function userCkeckPCodeBlur() {
	//短信验证码验证
	if ($("#userCkeckPhoneCode").val() == "") {
		$("#userCkeckPhoneCode").tips({
			side : 2,
			msg : '请输入短信验证码',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function changevalP() {
	// 注册条款验证
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
}

function userNmBlur() {
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
		return false;
	} else if (UserNm.length < 4) {
		$("#userNm").tips({
			side : 2,
			msg : '用户名至少要有4位',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	} else if (!(UserNmFilter.test(UserNm))) {
		$("#userNm").tips({
			side : 2,
			msg : '请输入正确的用户名格式,字母和数字',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function emailBlur() {
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
		return false;
	} else if (!(EmailFilter.test(Email))) {
		$("#email").tips({
			side : 2,
			msg : '请输入正确的电子邮箱格式',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function passWordGBlur() {
	// 密码验证
	var PassWord = $("#passWordG").val();
	var PsdFilter = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,16}$/;
	if (PassWord == "") {
		$("#passWordG").tips({
			side : 2,
			msg : '请输入密码',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	} else if (PassWord.length < 6) {
		$("#passWordG").tips({
			side : 2,
			msg : '密码至少包含6个字符',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	if (!(PsdFilter.test(PassWord))) {
		$("#passWordG").tips({
			side : 2,
			msg : '请输入正确的密码格式',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function cPassWordGBlur() {
	// 确认密码验证
	var PassWord = $("#passWordG").val();
	var CPassWord = $("#cPassWordG").val();
	var CPsdFilter = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,16}$/;
	if (CPassWord == "") {
		$("#cPassWordG").tips({
			side : 2,
			msg : '请输入确认密码',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	} else if (!(CPsdFilter.test(CPassWord))) {
		$("#cPassWordG").tips({
			side : 2,
			msg : '请输入正确的确认密码格式',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	if (CPassWord != PassWord) {
		$("#cPassWordG").tips({
			side : 2,
			msg : '确认密码和密码不一致',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function groupNmBlur() {
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
		return false;
	}
}

function ocodeBlur() {
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
		return false;
	}else if (Ocode.length != 10 && Ocode.length != 18) {
		$("#ocode").tips({
			side : 2,
			msg : '必须为10位组织机构代码或18位社会信用代码',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	} else {
		if (!(OcodeFilter.test(Ocode)) && !filter.test(Ocode)) {
			$("#ocode").tips({
				side : 2,
				msg : '请输入正确的组织代码格式',
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
	}
}

function addressBlur() {
	// 地址验证
	var Address = $("#address").val();
	if ($.trim(Address) == "") {
		$("#address").tips({
			side : 2,
			msg : '请输入企业地址',
			bg : '#AE81FF',
			time : 3
		});
		$("#address").val('');
		return false;
	}
}

function contactBlur() {
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
		return false;
	}
}

function phoneBlur() {
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
		return false;
	} else {
		if (!(Filter.test(Phone)) && !(phoneFilter.test(Phone))) {
			$("#phone").tips({
				side : 2,
				msg : '请输入正确的联系电话格式',
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
	}
}

function ckeckCodeBlur() {
	//图片验证码验证
	if ($("#ckeckCode").val() == "") {
		$("#ckeckCode").tips({
			side : 2,
			msg : '请输入图片验证码',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function changeV() {
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
}

function userNmIBlur() {
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
		return false;
	} else if (UserNm.length < 4) {
		$("#userNmI").tips({
			side : 2,
			msg : '用户名至少要有4位',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	} else if (!(UserNmFilter.test(UserNm))) {
		$("#userNmI").tips({
			side : 2,
			msg : '请输入正确的用户名格式,字母和数字',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function emailIBlur() {
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
		return false;
	} else if (!(EmailFilter.test(Email))) {
		$("#emailI").tips({
			side : 2,
			msg : '请输入正确的电子邮箱格式',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function passWordIBlur() {
	// 密码验证
	var PassWord = $("#passWordI").val();
	var PsdFilter = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,16}$/;
	if (PassWord == "") {
		$("#passWordI").tips({
			side : 2,
			msg : '请输入密码',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	} else if (PassWord.length < 6) {
		$("#passWordI").tips({
			side : 2,
			msg : '密码至少包含6个字符',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	if (!(PsdFilter.test(PassWord))) {
		$("#passWordI").tips({
			side : 2,
			msg : '请输入正确的密码格式',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function cPassWordIBlur() {
	// 确认密码验证
	var PassWord = $("#passWordI").val();
	var CPassWord = $("#cPassWordI").val();
	var CPsdFilter = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,16}$/;
	if (CPassWord == "") {
		$("#cPassWordI").tips({
			side : 2,
			msg : '请输入确认密码',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	} else if (!(CPsdFilter.test(CPassWord))) {
		$("#cPassWordI").tips({
			side : 2,
			msg : '请输入正确的确认密码格式',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	if (CPassWord != PassWord) {
		$("#cPassWordI").tips({
			side : 2,
			msg : '确认密码和密码不一致',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function groupNmIBlur() {
	// 培训机构名称验证
	var GroupName = $("#groupNameI").val();
	if ($.trim(GroupName) == "") {
		$("#groupNameI").tips({
			side : 2,
			msg : '请输入培训机构名称',
			bg : '#AE81FF',
			time : 3
		});
		$("#groupNameI").val('');
		return false;
	}
}

function ocodeIBlur() {
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
		return false;
	}else if (Ocode.length != 10 && Ocode.length != 18) {
		$("#ocodeI").tips({
			side : 2,
			msg : '必须为10位组织机构代码或18位社会信用代码',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	} else {
		if (!(OcodeFilter.test(Ocode)) && !filter.test(Ocode)) {
			$("#ocodeI").tips({
				side : 2,
				msg : '请输入正确的组织代码格式',
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
	}
}

function addressIBlur() {
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
		return false;
	}
}

function contactIBlur() {
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
		return false;
	}
}

function phoneIBlur() {
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
		return false;
	} else {
		if (!(Filter.test(Phone)) && !(phoneFilter.test(Phone))) {
			$("#phoneI").tips({
				side : 2,
				msg : '请输入正确的联系电话格式',
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
	}
}

function ckeckCodeIBlur() {
	//图片验证码验证
	if ($("#ckeckCodeI").val() == "") {
		$("#ckeckCodeI").tips({
			side : 2,
			msg : '请输入图片验证码',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function changeI() {
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
}

function userNmSBlur() {
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
		return false;
	} else if (UserNm.length < 4) {
		$("#userNmS").tips({
			side : 2,
			msg : '用户名至少要有4位',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	} else if (!(UserNmFilter.test(UserNm))) {
		$("#userNmS").tips({
			side : 2,
			msg : '请输入正确的用户名格式,字母和数字',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function emailSBlur() {
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
		return false;
	} else if (!(EmailFilter.test(Email))) {
		$("#emailS").tips({
			side : 2,
			msg : '请输入正确的电子邮箱格式',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function passWordSBlur() {
	// 密码验证
	var PassWord = $("#passWordS").val();
	var PsdFilter = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,16}$/;
	if (PassWord == "") {
		$("#passWordS").tips({
			side : 2,
			msg : '请输入密码',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	} else if (PassWord.length < 6) {
		$("#passWordS").tips({
			side : 2,
			msg : '密码至少包含6个字符',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	if (!(PsdFilter.test(PassWord))) {
		$("#passWordS").tips({
			side : 2,
			msg : '请输入正确的密码格式',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function cPassWordSBlur() {
	// 确认密码验证
	var PassWord = $("#passWordS").val();
	var CPassWord = $("#cPassWordS").val();
	var CPsdFilter = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,16}$/;
	if (CPassWord == "") {
		$("#cPassWordS").tips({
			side : 2,
			msg : '请输入确认密码',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	} else if (!(CPsdFilter.test(CPassWord))) {
		$("#cPassWordS").tips({
			side : 2,
			msg : '请输入正确的确认密码格式',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	if (CPassWord != PassWord) {
		$("#cPassWordS").tips({
			side : 2,
			msg : '确认密码和密码不一致',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function groupNmSBlur() {
	// 院校名称验证
	var GroupName = $("#groupNameS").val();
	if ($.trim(GroupName) == "") {
		$("#groupNameS").tips({
			side : 2,
			msg : '请输入院校名称',
			bg : '#AE81FF',
			time : 3
		});
		$("#groupNameS").val('');
		return false;
	}
}

function ocodeSBlur() {
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
		return false;
	}else if (Ocode.length != 10 && Ocode.length != 18) {
		$("#ocodeS").tips({
			side : 2,
			msg : '必须为10位组织机构代码或18位社会信用代码',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	} else {
		if (!(OcodeFilter.test(Ocode)) && !filter.test(Ocode)) {
			$("#ocodeS").tips({
				side : 2,
				msg : '请输入正确的组织代码格式',
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
	}
}

function addressSBlur() {
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
		return false;
	}
}

function contactSBlur() {
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
		return false;
	}
}

function phoneSBlur() {
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
		return false;
	} else {
		if (!(Filter.test(Phone)) && !(phoneFilter.test(Phone))) {
			$("#phoneS").tips({
				side : 2,
				msg : '请输入正确的联系电话格式',
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
	}
}

function ckeckCodeSBlur() {
	//图片验证码验证
	if ($("#ckeckCodeS").val() == "") {
		$("#ckeckCodeS").tips({
			side : 2,
			msg : '请输入图片验证码',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function changeS() {
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
}

function userNmPBlur() {
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
		return false;
	} else if (UserNm.length < 4) {
		$("#userNmP").tips({
			side : 2,
			msg : '用户名至少要有4位',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	} else if (!(UserNmFilter.test(UserNm))) {
		$("#userNmP").tips({
			side : 2,
			msg : '请输入正确的用户名格式,字母和数字',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function emailPBlur() {
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
		return false;
	} else if (!(EmailFilter.test(Email))) {
		$("#emailP").tips({
			side : 2,
			msg : '请输入正确的电子邮箱格式',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function passWordPBlur() {
	// 密码验证
	var PassWord = $("#passWordP").val();
	var PsdFilter = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,16}$/;
	if (PassWord == "") {
		$("#passWordP").tips({
			side : 2,
			msg : '请输入密码',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	} else if (PassWord.length < 6) {
		$("#passWordP").tips({
			side : 2,
			msg : '密码至少包含6个字符',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	if (!(PsdFilter.test(PassWord))) {
		$("#passWordP").tips({
			side : 2,
			msg : '请输入正确的密码格式',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function cPassWordPBlur() {
	// 确认密码验证
	var PassWord = $("#passWordP").val();
	var CPassWord = $("#cPassWordP").val();
	var CPsdFilter = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,16}$/;
	if (CPassWord == "") {
		$("#cPassWordP").tips({
			side : 2,
			msg : '请输入确认密码',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	} else if (!(CPsdFilter.test(CPassWord))) {
		$("#cPassWordP").tips({
			side : 2,
			msg : '请输入正确的确认密码格式',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
	if (CPassWord != PassWord) {
		$("#cPassWordP").tips({
			side : 2,
			msg : '确认密码和密码不一致',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}
function ocodePBlur() {
	// 组织代码验证
	var Ocode = $("#ocodeP").val();
	var OcodeFilter = /^[0-9A-Z]{18}$/;
	var filter=/[0-9]{8}-[a-zA-Z0-9]/;
	if(Ocode != ""){
		if (Ocode.length != 10 && Ocode.length != 18) {
			$("#ocodeP").tips({
				side : 2,
				msg : '必须为10位组织机构代码或18位社会信用代码',
				bg : '#AE81FF',
				time : 3
			});
			return false;
		} else {
			if (!(OcodeFilter.test(Ocode)) && !filter.test(Ocode)) {
				$("#ocodeP").tips({
					side : 2,
					msg : '请输入正确的组织代码格式',
					bg : '#AE81FF',
					time : 3
				});
				return false;
			}
		}
	}
}
function contactPBlur() {
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
		return false;
	}
}

function phonePBlur() {
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
		return false;
	} else {
		if (!(Filter.test(Phone)) && !(phoneFilter.test(Phone))) {
			$("#phoneP").tips({
				side : 2,
				msg : '请输入正确的联系电话格式',
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
	}
}

function ckeckCodePBlur() {
	//图片验证码验证
	if ($("#ckeckCodeP").val() == "") {
		$("#ckeckCodeP").tips({
			side : 2,
			msg : '请输入图片验证码',
			bg : '#AE81FF',
			time : 3
		});
		return false;
	}
}

function changeP() {
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
}

$('#userEmail').keyup(function(){
	var c = $(this);
	if (/[^a-zA-Z0-9! @ # $ % -.?_]/.test(c.val())) {//替换其他字符
		var temp_amount = c.val().replace(
				/[^a-zA-Z0-9! @ # $ % -.?_]/g, '');
	    $(this).val(temp_amount);
	}
});

$('#email').keyup(function(){
	var c = $(this);
	if (/[^a-zA-Z0-9! @ # $ % -.?_]/.test(c.val())) {//替换其他字符
		var temp_amount = c.val().replace(
				/[^a-zA-Z0-9! @ # $ % -.?_]/g, '');
	    $(this).val(temp_amount);
	}
});

$('#ocode').keyup(function(){
	var c = $(this);
	if (/[^a-zA-Z0-9! @ # $ % -.?_]/.test(c.val())) {//替换其他字符
		var temp_amount = c.val().replace(
				/[^a-zA-Z0-9! @ # $ % -.?_]/g, '');
	    $(this).val(temp_amount);
	}
});

$('#phone').keyup(function(){
	var c = $(this);
	if (/[^a-zA-Z0-9! @ # $ % -.?_]/.test(c.val())) {//替换其他字符
		var temp_amount = c.val().replace(
				/[^a-zA-Z0-9! @ # $ % -.?_]/g, '');
	    $(this).val(temp_amount);
	}
});

$('#emailI').keyup(function(){
	var c = $(this);
	if (/[^a-zA-Z0-9! @ # $ % -.?_]/.test(c.val())) {//替换其他字符
		var temp_amount = c.val().replace(
				/[^a-zA-Z0-9! @ # $ % -.?_]/g, '');
	    $(this).val(temp_amount);
	}
});

$('#ocodeI').keyup(function(){
	var c = $(this);
	if (/[^a-zA-Z0-9! @ # $ % -.?_]/.test(c.val())) {//替换其他字符
		var temp_amount = c.val().replace(
				/[^a-zA-Z0-9! @ # $ % -.?_]/g, '');
	    $(this).val(temp_amount);
	}
});

$('#phoneI').keyup(function(){
	var c = $(this);
	if (/[^a-zA-Z0-9! @ # $ % -.?_]/.test(c.val())) {//替换其他字符
		var temp_amount = c.val().replace(
				/[^a-zA-Z0-9! @ # $ % -.?_]/g, '');
	    $(this).val(temp_amount);
	}
});

$('#emailS').keyup(function(){
	var c = $(this);
	if (/[^a-zA-Z0-9! @ # $ % -.?_]/.test(c.val())) {//替换其他字符
		var temp_amount = c.val().replace(
				/[^a-zA-Z0-9! @ # $ % -.?_]/g, '');
	    $(this).val(temp_amount);
	}
});

$('#ocodeS').keyup(function(){
	var c = $(this);
	if (/[^a-zA-Z0-9! @ # $ % -.?_]/.test(c.val())) {//替换其他字符
		var temp_amount = c.val().replace(
				/[^a-zA-Z0-9! @ # $ % -.?_]/g, '');
	    $(this).val(temp_amount);
	}
});

$('#phoneS').keyup(function(){
	var c = $(this);
	if (/[^a-zA-Z0-9! @ # $ % -.?_]/.test(c.val())) {//替换其他字符
		var temp_amount = c.val().replace(
				/[^a-zA-Z0-9! @ # $ % -.?_]/g, '');
	    $(this).val(temp_amount);
	}
});

$('#emailP').keyup(function(){
	var c = $(this);
	if (/[^a-zA-Z0-9! @ # $ % -.?_]/.test(c.val())) {//替换其他字符
		var temp_amount = c.val().replace(
				/[^a-zA-Z0-9! @ # $ % -.?_]/g, '');
	    $(this).val(temp_amount);
	}
});

$('#ocodeP').keyup(function(){
	var c = $(this);
	if (/[^a-zA-Z0-9! @ # $ % -.?_]/.test(c.val())) {//替换其他字符
		var temp_amount = c.val().replace(
				/[^a-zA-Z0-9! @ # $ % -.?_]/g, '');
	    $(this).val(temp_amount);
	}
});

$('#phoneP').keyup(function(){
	var c = $(this);
	if (/[^a-zA-Z0-9! @ # $ % -.?_]/.test(c.val())) {//替换其他字符
		var temp_amount = c.val().replace(
				/[^a-zA-Z0-9! @ # $ % -.?_]/g, '');
	    $(this).val(temp_amount);
	}
});