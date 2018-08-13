/**
 * 电话号或者手机号
 * @param phone
 * @returns
 */
function isTelephone(phone){
	var reg =  /^(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$/;
	if(!reg.test(phone)){ 
		return false;
	}
	return true;
}
/**
 * email
 * @param email
 * @returns {Boolean}
 */
function isEmail(email){
	var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
	if(!reg.test(email)){
		return false;
	}
	return true;
}
/**
 * 身份证号码
 * @param num
 * @returns {Boolean}
 */
function isIdCard(num){
	var reg = /^(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)$/;
	if(!reg.test(num)){
		return false;
	}
	return true;
}
/**
 * 国内电话号码(0511-4405222、021-87888822)
 * @param num
 */
function isFixPhone(num){
	var reg = /\d{3}-\d{8}|\d{4}-\d{7}/;
	if(!reg.test(num)){
		return false;
	}
	return true;
}
/**
 * 手机号
 * @param num
 */
function isPhone(num){
	var reg = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9]|17[0-9])\d{8}$/;
	if(!reg.test(num)){
		return false;
	}
	return true;
}
/**
 * 0或者非0开头的数字
 * @param num
 */
function isNumberNoBeginZero(num){
	var reg = /^(0|[1-9][0-9]*)$/;
	if(!reg.test(num)){
		return false;
	}
	return true;
}