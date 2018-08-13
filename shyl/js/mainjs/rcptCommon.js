/**
 * 去掉前后空格
 */
function trim(obj) {
	strValue = obj.value;
	obj.value= strValue.replace(/^\s+|\s+$/gm,''); 
}

function trimAll(obj) {
	strValue = obj.value;
	obj.value= strValue.replace(/\s+/g,"");
}

/**
 * 整数去掉前面的0
 * @returns
 */
function delZero(obj) {
	// 首先删除字符串的空格
	strValue = obj.value;
	// 然后去掉前面的0
	obj.value= strValue.replace(/^(\s|\u00A0)+/,'').replace(/(\s|\u00A0)+$/,'').replace(/\b(0+)/gi,"");
	
	// 如果入力内容为空，则显示默认值
	if (obj.value=="") {
		obj.value = 0;
	}
}

/**
 * float型变换
 * 如输入0则会自动变换为0.00
 * @returns
 */
function changeFloat(obj) {
	// 首先删除字符串的空格
	strValue = obj.value;
	// 然后去掉前面的0
	obj.value= change(strValue);
	
	// 如果入力内容为空，则显示默认值
	if (obj.value=="") {
		obj.value = "0.00";
	}
}

/**
 * num 金额
 */
function change(inptuNum) {
    num = parseFloat(inptuNum);
    if (isNaN(num)) {
        return inptuNum;
    } else {
        var newnum="";
        num = num+"";
        var temp = num.split("\.");
        var mylength = 0;
        if(temp.length >= 2){
            mylength=temp[1].length;
        }
        
        switch(mylength){
            case 0:
                newnum=num+".00";
                break;
            case 1:
                newnum=num+"0";
                break;
            default:
                newnum = temp[0] + "." + temp[1].substring(0,2);
                break;
        }
        return newnum;
    }
}

/**
 * 清空入力框中的默认值
 */
function clearInput(obj, defaultValue) {
	// 如果数值与默认值相同，则清空默认值
	if (obj.value == defaultValue) {
		obj.value = "";
	}
}

/**
 * float型变换
 * 如输入0则会自动变换为0.00
 * @returns
 */
function changeFloat(obj, defaultValue, len) {
	// 首先删除字符串的空格
	strValue = obj.value;
	strValue = strValue.replace(/^(\s|\u00A0)+/,'').replace(/(\s|\u00A0)+$/,'');
	// 如果入力内容为空，则显示默认值
	if (strValue == "") {
		obj.value = defaultValue;
		return;
	}

	// 转换成浮点型
    num = parseFloat(strValue);
    if (isNaN(num)) {
    	if (strValue == "0.0" || strValue == "0.00" || strValue == "0.000") {
    		obj.value = formatNumber(0, len);
    	}
        return;
    } else {
    	obj.value = formatNumber(num, len);
    }
}
/**
 * 自动设定为固定位数
 */
function formatNumber(value, num){
	// 定义变量
    var strValue, valIndex, valLength;
    // 把数值转化为字符串
    strValue = value.toString();
    // 获取小数点的位置
    valIndex = strValue.indexOf(".");
    // 获取字符串长度
    valLength = strValue.length;
    if (num == 0) {
        if (valIndex != -1) {
        	strValue = strValue.substring(0, valIndex);
        }
    } else {//如果没有小数点
        if (valIndex == -1) {
        	strValue = strValue + ".";
            for (i = 1; i <= num; i++) {
            	strValue = strValue + "0";
            }
        } else {//有小数点，超出位数自动截取，否则补0
        	strValue = strValue.substring(0, valIndex + num + 1);
            for (i = valLength; i <= valIndex + num; i++) {
            	strValue = strValue + "0";
            }
        }
    }
    return strValue;
}



//数组index方法
Array.prototype.indexOf = function (val) {
	 for (var i = 0; i < this.length; i++) {
	     if (this[i] == val) return i;
	 }
	 return -1;
};
//数组remove方法
Array.prototype.remove = function (val) {
	 var index = this.indexOf(val);
	 if (index > -1) {
	     this.splice(index, 1);
	 }
};