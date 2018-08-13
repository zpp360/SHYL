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
<title>资金项目申请表_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<jsp:include page="../../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/work.css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/uploadify.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/introjs.css">

<script src="/SHYL/shyl/js/datepicker/WdatePicker.js" type="text/javascript"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>/shyl/js/mainjs/jquery.placeholder.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/intro.js"></script>	
<style>
.table {
	border: 0px solid;
	border-color: #ddd;
	margin-bottom: 0px !important;
}

.table td {
	border: 1px solid;
	border-color: #ddd;
	border-collapse: collapse;
	text-align: center;
	vertical-align: middle !important;
}
.table td label{
	font-size: 0.85em;
}

.inputtext {
	padding-left: 5px;
	background-color: #ecf0f9;
	line-height: 42px;
	height: 42px;
	border: 0;
	border-radius: 5px;
	font-size: 0.85em;
}

.labelwidth{
	width: 15%;
	float:left;
	margin-top:1%
}
.cheackboxError{
   outline: 1px solid red;
}

.inputError{
	border: 1px solid #f00 !important;
}

.vertical {
	width: 20px;
	font-size: 12px;
	word-wrap: break-word;
	letter-spacing: 20px;
}
.width70{
 width: 70%  !important;
}

.font-size85{
    color: #b6b6b6;
    font-size: 0.85em;
}
* {
    box-sizing: content-box;
}
.introjs-arrow.right {
	width: 0px;
}
</style>

</head>		
<body id="top" style="background-color: #f7f7f7;">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param value="2" name="menuType"/></jsp:include>
				<!--  我的简历管理部分页面-->
		<div class="mypage_right">
					<h2 class="h2_font13"><img id="catalogTree" src="<%=basePath%>/shyl/images/catalog.png" style="margin-bottom: 5px;"/>中央促进服务贸易创新发展扶持资金申请书
					</h2>
					<div class="input_class" style="margin-bottom: 100px;">
						<form action="" class="form-inline"
							method="post" id="form1" >
							<input type="hidden" name="info_id" value="${pd.info_id}"/>
							<input type="hidden" name="id" value="${pd.id}">
							<input type="hidden" name="toPage" value="${pageMap.toPage}">
							<h3>

							<label>${pd.declaration_year}</label>
							年中央促进服务贸易创新发展扶持资金申请书
								</h3>
							<div class="col-md-12 col-xs-12 col-sm-12 col-lg-12" style="padding-top: 80px; font-size: 0.85em;">
								<label class="control-label labelwidth"><span
										style="color: #FF0000;">*</span>申请单位（盖章）：</label>
								<div>
									<input class="inputtext" id="company_name" maxlength="50"style="width: 70%;"
										name="company_name" placeholder="请输入申请单位" type="text" value="${pd.company_name}" onblur="trim(this);">

								</div>
							</div>
							<div class="col-md-12 col-xs-12 col-sm-12 col-lg-12" style="padding-top: 10px; font-size: 0.85em;">
								<label class=" labelwidth"><span
										style="color: #FF0000;">*</span>填表日期：</label>
								<div>
									<input class="inputtext" id="apply_date" name="apply_date" 
								    style="width:180px;"onFocus="WdatePicker({isShowWeek:true});"placeholder="请输入填表日期"
								    type="text" value="${pd.apply_date}" />
								</div>
							</div>
							<div class="col-md-12 col-xs-12 col-sm-12 col-lg-12" style="padding-top: 10px; font-size: 0.85em;">
								<label class="control-label labelwidth"><span
										style="color: #FF0000;">*</span>填表人：</label>
								<div style="float:left;">
									<input class="inputtext" id="contact" maxlength="20"placeholder="请输入填表人"
										name="contact" placeholder="" type="text" value="${pd.contact}" onblur="trim(this);">
								</div>
							</div>
							<div class="col-md-12 col-xs-12 col-sm-12 col-lg-12" style="padding-top: 10px; font-size: 0.85em;">
								<label class="labelwidth"><span
										style="color: #FF0000;">*</span>电话：</label>
								<div style="float:left;">
									<input class="inputtext"  id="tel" name="tel" maxlength="13"
										placeholder="固定电话 或手机号" type="text" value="${pd.tel}" onblur="trim(this);">

								</div>
							</div>
							<div class="col-md-12 col-xs-12 col-sm-12 col-lg-12" style="padding-top: 10px; font-size: 0.85em;">
								<label class="labelwidth"><span
										style="color: #FF0000;">*</span>传真：</label>
								<div style="float:left;">
									<input class="inputtext"  id="fax" name="fax" maxlength="13"
										placeholder="区号-传真号码" type="text" value="${pd.fax}" onblur="trim(this);">

								</div>
							</div>
							
						</form>
						<div class="form-group">
						<div class="col-sm-2" style="margin-top: 60px;margin-left:35%">
							<button type="button" onclick="OK();"
								class="btn btn-success btn-block">
								<span class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp;${pageMap.toText}
							</button>
						</div>
					</div>
					</div>

					
				</div>

			</div>

	<%@ include file="../../common/footer.jsp"%>
	<p id="back-to-top" style="display: block;">
		<a href="#top"><span></span></a>
	</p>
	<script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
	<script src="<%=basePath%>shyl/js/jquery.validate.js"></script>
	<script type="text/javascript">
	function localcheck(){
		var Filter = /^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
		var phoneFilter = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
		
		if($("#declaration_year").val() == ""){
			$("#declaration_year").tips({
				side : 2,
				msg : "不能为空",
				bg : '#AE81FF',
				time : 3
			});
			$("#declaration_year").focus();
			return false;
		}
		 var companyName = $("#company_name").val();
		 if($.trim(companyName) == ""){
			$("#company_name").tips({
				side : 2,
				msg : "请输入申请单位",
				bg : '#AE81FF',
				time : 3
			});
			$("#company_name").focus();
			return false;
		} 
		if($("#apply_date").val() == ""){
			$("#apply_date").tips({
				side : 2,
				msg : "请输入填表日期",
				bg : '#AE81FF',
				time : 3
			});
			$("#apply_date").focus();
			return false;
		}
		 var contact = $("#contact").val();
		if($.trim(contact) == ""){
			$("#contact").tips({
				side : 2,
				msg : "请输入填表人",
				bg : '#AE81FF',
				time : 3
			});
			$("#contact").focus();
			return false;
		}
		var tel = $("#tel").val();
		if(tel == ""){
			$("#tel").tips({
				side : 2,
				msg : "请输入电话",
				bg : '#AE81FF',
				time : 3
			});
			$("#tel").focus();
			return false;
		} else {
			if (!(Filter.test(tel)) && !(phoneFilter.test(tel))) {
				$("#tel").tips({
					side : 2,
					msg : '请输入正确的电话格式',
					bg : '#AE81FF',
					time : 3
				});
				$("#tel").focus();
				return false;
			}
		}
		if($("#fax").val() == ""){
			$("#fax").tips({
				side : 2,
				msg : "请输入传真",
				bg : '#AE81FF',
				time : 3
			});
			$("#fax").focus();
			return false;
		}else {
			if (!(Filter.test($("#fax").val()))) {
				$("#fax").tips({
					side : 2,
					msg : '请输入正确的传真格式',
					bg : '#AE81FF',
					time : 3
				});
				$("#fax").focus();
				return false;
			}
		}
		return true;
	} 
	</script>
	<jsp:include page="../../common/govCatalog.jsp"></jsp:include>
	<script type="text/javascript">
	
		$(function() {
			$('input, textarea').placeholder({
				customClass : 'my-placeholder'
			});
			var cur_val = 1;
			if (!$.cookie("intro_cookie_index")&&!$.cookie('catalogTree')) {
				introJs().setOptions({
					//对应的按钮
					prevLabel : "上一步",
					nextLabel : "下一步",
					skipLabel : "跳过",
					doneLabel : "结束",
					keyboardNavigation : true,
					//对应的数组，顺序出现每一步引导提示
					steps : [ {
						element : '#catalogTree',
						intro : '这里是【目录】打开按钮',
						position : 'right'
					}, {
						//第二步引导
						element : '#layui-layer1',
						intro : '目录显示在这里，可选择菜单进行跳转',
						position : 'left'
					}, {
						//第三步引导
						element : '.layui-layer-close',
						intro : '这里关闭目录',
						position : 'left'
					} ]

				}).oncomplete(function() {
					//点击跳过按钮后执行的事件(这里保存对应的版本号到cookie,并且设置有效期为一年）
					$.cookie("intro_cookie_index", cur_val, {
						expires : 365
					});
				}).onexit(function() {
					//点击结束按钮后， 执行的事件
					$.cookie("intro_cookie_index", cur_val, {
						expires : 365
					});
				}).start();
			}
		});

		function OK() {
			if (localcheck()) {
				$("#form1").attr('action','<%=basePath%>orgApp/saveCountry.act?info_id=${pd.info_id}');
				$("#form1").submit();
			}
		}
	
	</script>
	
</body>
</html>