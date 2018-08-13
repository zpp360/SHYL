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
<title>资金项目申请表_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<jsp:include page="../../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/work.css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/uploadify.css">
<link rel="stylesheet"
	href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet"
	href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">


<script src="/SHYL/shyl/js/datepicker/WdatePicker.js"
	type="text/javascript"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript"
	src="<%=basePath%>/shyl/js/mainjs/jquery.placeholder.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js"
	type="text/javascript"></script>
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

.table td label {
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

.labelwidth {
	width: 15%;
	float: left;
	margin-top: 1%
}

.cheackboxError {
	outline: 1px solid red;
}

.inputError {
	border: 1px solid #f00 !important;
}

.vertical {
	width: 20px;
	font-size: 12px;
	word-wrap: break-word;
	letter-spacing: 20px;
}

.width70 {
	width: 70% !important;
}
.font-size10{
	font-size: 10px;
}
.font-size85 {
	color: #b6b6b6;
	font-size: 0.85em;
}

* {
	box-sizing: content-box;
}
</style>

</head>
<body id="top" style="background-color: #f7f7f7;">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param
				value="2" name="menuType" /></jsp:include>
		<div class="mypage_right">
			<h2 class="h2_font13"><img id="catalogTree" src="<%=basePath%>/shyl/images/catalog.png" style="margin-bottom: 5px;"/>企业基本情况</h2>
			<div class="input_class" style="margin-bottom: 100px;">
				<form action="<%=basePath%>declare/save.act" class="form-inline"
					method="post" id="form1">
					<input type="hidden" name="info_id" value="${pd.info_id}"
						id="info_id" /> <input type="hidden" name="toPage"
						value="${pageMap.toPage}"> 
						<input type="hidden" id="pid"
						name="pid" value="${pd.parent_id}">
					<div class="form-horizontal company_list font-size10">
						<label style="margin-top: 20px;"> <!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->申请企业、单位应当符合《资金办法》第十一条所规定的基本条件及本通知的有关要求，同时还应满足以下条件：<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
							id="parent_id1" name="isQuoted"
							<c:if test="${pd.parent_id == 1 or empty pd.parent_id}">checked="checked"</c:if> value="1"><i
							onchange="radioSelect(0)">（1）服务外包企业。企业已与服务外包发包商签订的业务合同并在商务部“服务外包管理信息系统”如实填<br>报商务部、国家统计局印发的《服务外包管理信息系统》核准的执行额为依据，且满足以下条件：
						</i><br>
						<br>
							<div class="checkbox">
								 <label style="max-width: 100px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;・2016年度服务外包业务执行额
								 <input id="money" name="money" size="15"
									style="width: 85px;text-align:center; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1px solid rgb(192, 192, 192)"
									maxlength="10"
									onkeyup="value=value.replace(/[^\d.]/g,'')" onblur="checkMoney();" style="ime-mode:disabled"
									value="${pd.money}">万美元，其中向境外最终客户提供服务外包业<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务执行额占本企业服务执行额<input
									id="percentage1" name="percentage1" size="15"
									style="width: 65px;text-align:center; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1px solid rgb(192, 192, 192)"
									maxlength="5"
									onkeyup="this.value=this.value.replace(/\D/g,'.')" onblur="delZero(this);" style="ime-mode:disabled"
									value="${pd.percentagea}">%以上。
								</label><br><br>
								 <label style="max-width: 100px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;・企业具有服务外包承接能力及服务外包市场开拓和项目管理人员，大学（含大专，下同）毕<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业及以上学历员工总数<input
									id="percentage2" name="percentage2" size="15"
									style="width: 65px;text-align:center; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1px solid rgb(192, 192, 192)"
									maxlength="5"
									onkeyup="this.value=this.value.replace(/\D/g,'.')" onblur="delZero(this);" style="ime-mode:disabled"
									value="${pd.percentageb}">%以上。
								</label>
							</div> <br>
						</label>
						<br>
						<label style="margin-top: 20px;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
							id="parent_id2" name="isQuoted" value="2"
							<c:if test="${pd.parent_id == 2}">checked="checked"</c:if>><i
							onchange="radioSelect(1)">（2）培训机构。培训机构为按照《山东省服务外包人才培训机构认定管理方法(试行)》认定的“山东省服务<br>外包人才培训机构（2017-2018）”、经国家示范城市认定且报省商务厅备案的服务外包人才培训机构。
						</i>
						</label> <br /> <br />
						<label style="margin-top: 20px;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
							id="parent_id3" name="isQuoted" value="3"
							<c:if test="${pd.parent_id == 3}">checked="checked"</c:if>><i
							onchange="radioSelect(1)">（3）示范城市。经国务院批准的中国服务外包示范城市建设的服务外包公共服务平台。
						</i>
						</label>
						<br />
					</div>
				</form>
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-2" style="margin-top: 40px;">
						<button type="button" onclick="sub();"
							class="btn btn-success btn-block">
							<span class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp;${pageMap.toText}
						</button>
					</div>
					<c:if test="${not empty pageMap.fromPage}">
						<div class="col-sm-2" style="margin-top: 40px;">
							<a href="<%=basePath%>${pageMap.fromPage}?&info_id=${pd.info_id}"
								class="btn btn-default btn-block"><span
								class="glyphicon glyphicon-circle-arrow-left"></span>&nbsp;&nbsp;上一步</a>
						</div>
					</c:if>

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
		$(function() {
			changerParent();
		});

		$("#parent_id2").click(function() {
			changerParent();
		});
		
		$("#parent_id1").click(function() {
			changerParent();
		});

		$("#parent_id3").click(function() {
			changerParent();
		});
		
		function changerParent() {
			if ($("#parent_id1").is(":checked")) {
				$("#money").removeAttr("disabled");
				$("#percentage1").removeAttr("disabled");
				$("#percentage2").removeAttr("disabled");
			} else {
				$("#money").attr("disabled","disabled");
				$("#percentage1").attr("disabled","disabled");
				$("#percentage2").attr("disabled","disabled");
			}
		}
		
		function sub() {
			
			if($("#parent_id1").is(":checked")){
				
				if($("#money").val() == "0"){	
				document.getElementById("money").value="";
				}			
				//外包业务额未入力的情况
				if($("#money").val() == ""){
					$("#money").tips({
						side : 2,
						msg : "请输入业务额",
						bg : '#AE81FF',
						time : 2
					});
					$("#money").focus();
					return false;
				}else if($("#money").val()!=""){
					var money = $("#money").val();
			    	var reg=/^(?!0+(?:\.0+)?$)(?:[1-9]\d*|0)(?:\.\d{1,4})?$/;
			    	var PsdFilter = /^\d{0,5}(\.\d{0,4})?$/;
			    	if(money != null || money != ''){
			    		if(!reg.test(money)){
			    			$("#money").tips({
			    				side : 2,
			    				msg : '业务额必须大于0且小数位数不超过4位！',
			    				bg : '#AE81FF',
			    				time : 3
			    			});
			    			$("#money").focus();
			    			return false;
			        	}
			    	}
					if (!(PsdFilter.test(money))) {
						$("#money").tips({
							side : 2,
							msg : '业务额最大值不能超过99999.9999',
							bg : '#AE81FF',
							time : 3
						});
						$("#money").focus();
						return false;
					}
				}
				if($("#percentage1").val() == "0"){	
					document.getElementById("percentage1").value="";
					}
				
				//外包业务额（%）未入力的情况
				 var k=/^(100|[1-9]?\d(\.\d\d?\d?)?)$/; 
				if($("#percentage1").val() == ""){
					$("#percentage1").tips({
						side : 2,
						msg : "请输入业务额比率",
						bg : '#AE81FF',
						time : 2
					});
					$("#percentage1").focus();
					return false;
				}
				else if (!(k.test($("#percentage1").val()))) {
					$("#percentage1").tips({
						side : 2,
						msg : '请输入正确的业务额比率',
						bg : '#AE81FF',
						time : 3
					});
					$("#percentage1").focus();
					return false;
				}
				if($("#percentage2").val() == "0"){	
					document.getElementById("percentage2").value="";
					}
				//外包业务额2（%）未入力的情况
				if($("#percentage2").val() == ""){
					$("#percentage2").tips({
						side : 2,
						msg : "请输入员工比率",
						bg : '#AE81FF',
						time : 2
					});
					$("#percentage2").focus();
					return false;
				}
				else if (!(k.test($("#percentage2").val()))) {
					$("#percentage2").tips({
						side : 2,
						msg : '请输入正确的员工比率',
						bg : '#AE81FF',
						time : 3
					});
					$("#percentage2").focus();
					return false;
				}
			}
			
			$("form").submit();
		}
		
		 //文本框失去焦点后
	    function checkMoney(){
	    	var money = $("#money").val();
	    	var reg=/^(?!0+(?:\.0+)?$)(?:[1-9]\d*|0)(?:\.\d{1,4})?$/;
	    	var PsdFilter = /^\d{0,5}(\.\d{0,4})?$/;
	    	if(money != null || money != ''){
	    		if(!reg.test(money)){
	    			$("#money").tips({
	    				side : 2,
	    				msg : '业务额必须大于0且小数位数不超过4位！',
	    				bg : '#AE81FF',
	    				time : 3
	    			});
	    			$("#money").focus();
	    			return false;
	        	}
	    	}
			if (!(PsdFilter.test(money))) {
				$("#money").tips({
					side : 2,
					msg : '业务额最大值不能超过99999.9999',
					bg : '#AE81FF',
					time : 3
				});
				$("#money").focus();
				return false;
			}
			return true;
	    }
	</script>
	<jsp:include page="../../common/govCatalog.jsp"></jsp:include>
</body>
</html>