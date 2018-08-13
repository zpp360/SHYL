<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>${years}年度济南市服务外包企业申请汇总表_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<jsp:include page="../../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/work.css">
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>/shyl/js/mainjs/jquery.placeholder.js"></script>
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
	text-align: left;
	vertical-align: middle !important;
}
.inputtxt2 {
    width: 100%  !important;
 }
.table td label{
	font-size: 0.85em;
}
.cheackboxError {
	outline: 1px solid red;
}

.inputError {
	border: 1px solid #f00 !important;
}

#appTable input {
	width: 100%;
}

.vertical {
	width: 20px;
	font-size: 12px;
	word-wrap: break-word;
	letter-spacing: 20px;
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
					<h2>
						${years}年度济南市服务外包企业申请汇总表
					</h2>
					<div class="panel-heading">
						<form action="<%=basePath%>org/saveaAppSum.act" class="form-inline"
							method="post" id="form1" onsubmit="stringifyJSONCapital();">
							<input type="hidden" name="info_id" id="info_id" value="${sumPd.info_id}"/>
							<input type="hidden" name="id" value="${sumPd.id}"/>
							<input type="hidden" name="company_id" value="${pd.id}"/>
							<input type="hidden" id="apply_capital" name="apply_capital" />
							<!-- 下一页 -->
							<input type="hidden" name="toPage" value="${pageMap.toPage}">
							<table id="appTable" width="900" border="1" bordercolor="black"
								cellspacing="1" class="table">
								<tr>
									<td width="30%" colspan="2"><label class="control-label">单位名称</label></td>
									<td width="70%" colspan="2"><input
										class="inputtxt2" maxlength="50" id="company_name" name="company_name"  
										placeholder="" type="text" value="${pd.company_name}" readonly="readonly">
									</td>
								</tr>
								<tr>
									<td colspan="2"><label class="control-label">申报期内录用大学生人数</label></td>
									<td colspan="2"><input
										class="inputtxt2 num" maxlength="4"  id="college_student_num" name="college_student_num" 
										placeholder="0" type="text" value="${sumPd.college_student_num}" onblur="delZero(this);"></td>
								</tr>
								<tr>
									<td  colspan="2"><label class="control-label">${previousYear}离（在）岸外包执行额（万美元）</label></td>
									<td  colspan="2"><input
										class="inputtxt2 num" maxlength="10" id="previous_year_capital" name="previous_year_capital"
										placeholder="0" type="text" value="${sumPd.previous_year_capital}" onblur="changeFloat(this);"></td>
								</tr>
								<tr>
									<td  colspan="2"><label class="control-label">${lastYear}离（在）岸外包执行额（万美元）</label></td>
									<td  colspan="2"><input
										class="inputtxt2 num" maxlength="10"  id="last_year_capital" name="last_year_capital"
										placeholder="0" type="text" value="${sumPd.last_year_capital}" onblur="changeFloat(this);"></td>
								</tr>
								<tr>
									<td  colspan="2"><label class="control-label">根据“服务外包业务管理与统计系统”，执行额及就业应享受的扶持比例（100%或50%）</label></td>
									<td  colspan="2"><input
										class="inputtxt2 num" maxlength="3"  id="support_ratio" name="support_ratio"
										placeholder="" type="text" value="${sumPd.support_ratio}" onblur="trim(this);"></td>
								</tr>
								<tr>
									<td  width="20%" rowspan="${fn:length(applyCapitalList)+1}"><label class="control-label">按应享受比例申请金额</label></td>

								</tr>
								<c:forEach items="${applyCapitalList}" var="applyCapital">
									<tr>
									<td width="10%"><label class="control-label">${applyCapital.VALUE}</label></td>
									
									<td  colspan="2"><input
										class="inputtxt2 subtotal num"  maxlength="10" id="applyCapital${applyCapital.DISTINGUISH_ID}"
										placeholder="0.00" type="text" data-id="${applyCapital.DISTINGUISH_ID}" 
											<c:forEach items="${sumPd.apply_capital}" var="capitalVal">
											 	<c:if test="${applyCapital.DISTINGUISH_ID==capitalVal.id}">value="${capitalVal.value}"</c:if>
											 	
											</c:forEach>
										>
										</td>

									</tr>
								
								</c:forEach>   
								<tr>
									<td colspan="2"><label class="control-label">小计</label></td>
									<td ><input
										class="inputtxt2 num"id="subtotal" name="subtotal"
										placeholder="0.00" type="text" value="${sumPd.subtotal}" readonly="readonly" ></td>
								</tr>

								<tr>
									<td colspan="2"><label class="control-label">备注</label></td>
									<td ><input
										class="inputtxt2" id="remarks" name="remarks" maxlength="80"
										placeholder="" type="text"  value="${sumPd.remarks}" onblur="trim(this);"></td>
								</tr>

							</table>

						</form>
					</div>

					<div class="form-group">
						<div class="col-sm-2 col-sm-offset-2" style="margin-top: 40px;">
							<button type="button" onclick="OK();"
								class="btn btn-success btn-block" style="width:170px">
								<span class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp;${pageMap.toText}
							</button>
						</div>
						<c:if test="${not empty pageMap.fromPage}">
							<div class="col-sm-2" style="margin-top: 40px;">
								<a href="<%=basePath%>${pageMap.fromPage}?&info_id=${pd.info_id}" class="btn btn-default btn-block"><span
									class="glyphicon glyphicon-circle-arrow-left"></span>&nbsp;&nbsp;上一步</a>
							</div>
						</c:if>
						
						
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
	$(function(){
		$('input, textarea').placeholder({customClass:'my-placeholder'});
	});
	function stringifyJSONCapital(){
		var capitalArray=new Array();
		 $('form :input.subtotal').each(function(){
		       var obj=new Object();
		       obj.id=$(this).attr("data-id");
               obj.value=$(this).val();
               capitalArray.push(obj);
		}); 
		$("#apply_capital").val(JSON.stringify(capitalArray));
	}
	$.validator.addMethod(
		    "amtCheck",
		    function(value, element){
		    	if(value !=''){
		    		return value && /^(?!0+(?:\.0+)?$)(?:[1-9]\d*|0)(?:\.\d{1,2})?$/.test(value);
		    	}else{
		    		return true;
		    	}
		        
		    },
		    "金额必须大于0且小数位数不超过2位"
		);
	
	var tips=function(id,msg){
		$("#"+id).tips({
			side : 2,
			msg : msg,
			bg : '#AE81FF',
			time :2
		});
	}
	$('#form1').validate({
        errorPlacement: function (error, element) {
			if(error.text()!=""){
				var eid =element.attr('id')
	           	tips(eid,error.text());
	           	$("#"+eid).focus();
			}
           
        },
        
        success: function (label) {
            label.addClass('valid');
        },
        rules: {
        	college_student_num: {
        		required: false,
                digits:true,
                max:9999
            },
            previous_year_capital:{
            	required: false,
            	amtCheck:true
            },
            last_year_capital:{
            	required: false,
            	amtCheck:true
            },
            support_ratio: {
            	required: false,
                digits:true,
                max:100
            }
        },
        messages: {
        	college_student_num:{
                digits: "只能输入整数",
                max:"不能超4位数"
            },support_ratio:{
                digits: "只能输入整数",
                max:"不能大于100"
            }
        }
    });
	 //文本框失去焦点后
    $('form :input.subtotal').blur(function(){
    	var subtotal=0;
    	var reg=/^\d*\.?\d{0,2}$/;
    	if($(this).val()!='' ){
    		if(reg.test($(this).val())){
    			$('form :input.subtotal').each(function(){
    				if(reg.test($(this).val())){
    					subtotal=(Number(subtotal)+Number($(this).val())).toFixed(2);
    				}
            	  });
            	$("#subtotal").val(subtotal);
    		}else{
    			tips($(this).attr("id"),"金额必须大于0且小数位数不超过2位");
    			
        	}
    	}
    	
    });

	function OK() {
		 $("form :input.subtotal").trigger('blur');
         var numError = $('.jq_tips_info').length;
         if(numError){
             return false;
         }
		$("#form1").submit();

	}
		
	</script>
</body>
</html>