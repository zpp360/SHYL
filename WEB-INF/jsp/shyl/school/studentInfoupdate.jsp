<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>修改学生信息_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<base href="<%=basePath%>">
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link href="<%=basePath%>shyl/css/maincss/css.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath%>shyl/css/maincss/mypage.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<!-- 引入jQuery UI的css文件 -->
<link href="<%=basePath%>shyl/css/maincss/jquery-ui.css"
	rel="stylesheet">
<script src="<%=basePath%>shyl/js/mainjs/jquery-v1.10.2.js"
	type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js"
	type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js"
	type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/datepicker/WdatePicker.js"
	type="text/javascript"></script>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript"
	src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<!-- 引入jQuery的js文件 -->
<!-- 引入jQuery UI的js文件 -->
<script type="text/javascript"
	src="<%=basePath%>shyl/js/mainjs/jquery-ui.js"></script>
</head>
<body style="background-color: #f7f7f7;">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../common/left.jsp"><jsp:param
				value="42" name="menuType" /></jsp:include>
		<div class="mypage_right">
			<input type="hidden" id="userid" value="${pd.user_id}" />
			<input type="hidden" id="schoolId" value="${pd.department_id}" />
			<input type="hidden" id="codetype" value="${pd.certificate_type}" />
			<h2>修改学生信息</h2>
			<div class="input_class">
				<ul>
					<li><span><lable style="color: #FF0000">*</lable>姓名：</span><input
						type="text" id="name" name="name" class="inputtxt2"
						value="${pd.name}" maxlength="50" onblur="trim(this);"></li>
					<li><span><lable style="color: #FF0000">*</lable>性别：</span><label><input
							type="radio" id="sex" name="sex" value="0"
							<c:if test="${pd.sex == 0 }">checked="checked"</c:if>
							checked="checked"> 男</label><label id="sexli"><input
							type="radio" id="sex1" name="sex"
							<c:if test="${pd.sex == 1 }">checked="checked"</c:if> value="1">
							女</label></li>
					<li><span><lable style="color: #FF0000">*</lable>学号：</span><input
						type="text" id="studentNo" name="studentNo" class="inputtxt2"
						value="${pd.student_no}" maxlength="30"
						onkeyup="value=value.replace(/[^0-9]/g,'')" onblur="trim(this);"></li>
					<li><span><lable style="color: #FF0000">*</lable>出生日期：</span><input
						type="text" id="brithDate" name="brithDate" class="inputtxt2"
						onFocus="WdatePicker({isShowWeek:true});" value="${pd.brith_date}"
						placeholder="出生日期" title="出生日期"></li>
					<li><span>毕业时间：</span><input
						type="text" id="graduationDate" name="graduationDate"
						class="inputtxt2" onFocus="WdatePicker({isShowWeek:true});"
						value="${pd.graduation_date}" placeholder="毕业时间" title="毕业时间"></li>
					<c:if test="${pd.certificate_type == 1 }">
						<li><span><lable style="color: #FF0000">*</lable>身份证号：</span><input
							type="text" id="idCode" maxlength="18" name="idCode"
							class="inputtxt2" value="${pd.certificate_num}"
							onblur="trim(this);"></li>
					</c:if>
					<c:if test="${pd.certificate_type == 2 }">
						<li><span><lable style="color: #FF0000">*</lable>军官证：</span><input
							type="text" id="idCode" maxlength="18" name="idCode"
							class="inputtxt2" value="${pd.certificate_num}"
							onblur="trim(this);"></li>
					</c:if>
					<c:if test="${pd.certificate_type == 3 }">
						<li><span><lable style="color: #FF0000">*</lable>其他：</span><input
							type="text" id="idCode" maxlength="18" name="idCode"
							class="inputtxt2" value="${pd.certificate_num}"
							onblur="trim(this);"></li>
					</c:if>
					<li><span><lable style="color: #FF0000">*</lable>专业名称：</span>
					<input type="hidden" id="profe_id"/>
					<input type="text" id="profession" maxlength="30" name="profession"
						class="inputtxt2" value="${pd.profession}" onblur="trim(this);"></li>
					<li><span><lable style="color: #FF0000">*</lable>联系方式：</span>
						<input class="inputtxt2" type="text" id="telephone"
						name="telephone" value="${pd.contact_info}" maxlength="20"
						onblur="trim(this);"></li>
					<li><span><lable style="color: #FF0000">*</lable>电子邮箱：</span><input
						class="inputtxt2" type="text" id="email" name="email"
						value="${pd.mail}" maxlength="50" style="ime-mode: disabled" onblur="trim(this);"></li>
				</ul>
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-4" style="margin-top: 40px;">
						<button type="button" onclick="saveinfo();"
							class="btn btn-success btn-block">保存</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<!-- 中间部分结束 -->
	<div class='modal my-modal-alert' id='success' style="display: none;">
		<div class='modal-dialog boxBodySmall'>
			<div class='modal-content'
				style="width: 150px; text-align: center; position: fixed; right: 40%; bottom: 60%;">
				<div class='modal-body' id='modal-body-alert'>
					<img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;修改成功!
				</div>
			</div>
		</div>
	</div>
	<div class='modal my-modal-alert' id='error' style="display: none;">
		<div class='modal-dialog boxBodySmall'>
			<div class='modal-content'
				style="width: 150px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
				<div class='modal-body' id='modal-body-alert'>
					<img alt="" src="<%=basePath%>shyl/images/fail.png">&nbsp;&nbsp;修改失败!
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="<%=basePath%>static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript"
		src="<%=basePath%>static/js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>shyl/js/jquery.tips.js"></script>

	<!--<footer开始>-->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!--</footer结束>-->
	<script>
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
function errorshow(){
	$('#error').hide();
}
function returnback(){
	window.location.href="<%=basePath%>schoolContro/list.act";
}
function saveinfo(){
	var userid = $("#userid").val();
	var schoolId = $("#schoolId").val();
	var codetype = $("#codetype").val();
	//姓名
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
	//性别
	var sex=$("input:radio[name='sex']:checked").val();
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
	if(codetype=="2"){
		var idCode = $("#idCode").val();
		var codeid=idCode.replace(/(^\s*)|(\s*$)/g, "");
		var reg=/南字第(\d{8})号|北字第(\d{8})号|沈字第(\d{8})号|兰字第(\d{8})号|成字第(\d{8})号|济字第(\d{8})号|广字第(\d{8})号|海字第(\d{8})号|空字第(\d{8})号|参字第(\d{8})号|政字第(\d{8})号|后字第(\d{8})号|装字第(\d{8})号/;
		if (codeid == "") {
			$("#idCode").tips({
				side : 2,
				msg : '请输入军官证',
				bg : '#AE81FF',
				time : 3
			});
			$("#idCode").focus();
			return false;
		} else if (!(reg.test(codeid))) {
			$("#idCode").tips({
				side : 2,
				msg : '请输入正确的军官证格式',
				bg : '#AE81FF',
				time : 3
			});
			$("#idCode").focus();
			return false;
		} 
	}else if(codetype=="1"){
		var idCode = $("#idCode").val();
		if (idCode == "") {
			$("#idCode").tips({
				side : 2,
				msg : '请输入身份证',
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
			$("#IdCode").focus();
			return false;
		}
	}else if(codetype=="3"){
		var idCode = $("#idCode").val();
		var reg=/^1[45][0-9]{7}|([P|p|S|s]\d{7})|([S|s|G|g]\d{8})|([Gg|Tt|Ss|Ll|Qq|Dd|Aa|Ff]\d{8})|([H|h|M|m]\d{8，10})$/;
		if (idCode == "") {
			$("#idCode").tips({
				side : 2,
				msg : '请输入护照',
				bg : '#AE81FF',
				time : 3
			});
			$("#idCode").focus();
			return false;
		} else if (!(reg.test(idCode))) {
			$("#idCode").tips({
				side : 2,
				msg : '请输入正确的护照格式',
				bg : '#AE81FF',
				time : 3
			});
			$("#idCode").focus();
			return false;
		} 
	}
	// 专业
	var profession=$("#profession").val();
	if (profession == "") {
		$("#profession").tips({
			side : 2,
			msg : '请输入专业名称',
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
		url : '<%=basePath%>schoolContro/edit.act',
		data : {
			id : userid,
			name : name,
			sex : sex,
			studentNo : studentNo,
			brithDate : brithDate,
			graduationDate : graduationDate,
			idCode : idCode,
			profession : profession,
			telephone : telephone,
			email : email,
			school_id : schoolId
		},
		dataType : 'json',
		cache : false,
		success : function(data) {
			if ("success" == data.result) {
				$('#success').show()
				setTimeout("returnback()", 1000);
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
			} else {
				$('#error').show()
				setTimeout("errorshow()", 1000);
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
//专业名称自动输入
$("#profession").autocomplete({
    source: function( request, response ) {
        $.ajax({
            url: '<%=basePath%>schoolContro/getprofession.act', // 后台请求路径
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
</script>
</body>

</html>