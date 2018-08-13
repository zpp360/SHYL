<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>修改院系信息_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<base href="<%=basePath%>">
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link href="<%=basePath%>shyl/css/maincss/css.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>shyl/css/maincss/mypage.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<!-- 引入jQuery UI的css文件 -->
<link href="<%=basePath%>shyl/css/maincss/jquery-ui.css" rel="stylesheet">
<link href="<%=basePath%>shyl/css/maincss/jquery.autocomplete.css" rel="stylesheet">
<script src="<%=basePath%>shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/datepicker/bootstrap.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/datepicker/WdatePicker.js" type="text/javascript"></script>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<!-- 引入jQuery的js文件 -->
<!-- 引入jQuery UI的js文件 -->
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery-ui.js"></script>
</head>
<body style="background-color: #f7f7f7;">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../common/left.jsp"><jsp:param value="43" name="menuType"/></jsp:include>
		<div class="mypage_right">
			<h2>修改院系信息</h2>
			<div class="input_class">
			<input type="hidden" id="school_id" name="school_id" value="${pd.school_id}" />
				<ul>
					<li><span><lable style="color: #FF0000">*</lable>院系名称：</span><input type="text" id="school_name" name="school_name"
						class="inputtxt2" value="${pd.school_name}" maxlength="20" onblur="trim(this);"></li>
					<li><span><lable style="color: #FF0000">*</lable>联系人：</span><input type="text" class="inputtxt2"
						id="contact" name="contact" maxlength="50"
						value="${pd.contact}" onblur="trim(this);"></li>
					<li><span><lable style="color: #FF0000">*</lable>联系电话：</span>
						<input class="inputtxt2" type="text" id="contact_tel" name="contact_tel" value="${pd.contact_tel}"
						 maxlength="20" onblur="trim(this);"></li>
					<li><span><lable style="color: #FF0000">*</lable>邮箱：</span><input class="inputtxt2"  type="text"
					maxlength="30" id="mail" name="mail" value="${pd.mail}" style="ime-mode:disabled" onblur="trim(this);"></li>
				</ul>
				   <div class="form-group">
						<div class="col-sm-2 col-sm-offset-4" style="margin-top: 40px;">
							<button type="button" onclick="save();"
								class="btn btn-success btn-block">保存
							</button>
						</div>
					</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<!-- 中间部分结束 -->
		<div class='modal my-modal-alert' id='success' style="display:none;">
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:150px;text-align:center;position:fixed;right:40%;bottom:60%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;修改成功!
                    </div>
                </div>
            </div>
        </div>
         <div class='modal my-modal-alert' id='error' style="display: none;">
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:150px;text-align:center;position:fixed;right:40%;bottom:45%;">
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
function returnback(){
	window.location.href="<%=basePath%>department/list.act";}
function save(school_id) {

	var school_id = $("#school_id").val();
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
		url : '<%=basePath%>department/edit.act',
		data : {
			school_id : school_id,
			school_name : school_name,
			contact : contact,
			contact_tel :contact_tel ,
			mail : mail,
			tm : new Date().getTime()
		},
		dataType : 'json',
		cache : false,
		success : function(data) {
			if ("success" == data.result) {
				$('#success').show();
				setTimeout("returnback()", 1000);
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

</script>
</body>

</html>