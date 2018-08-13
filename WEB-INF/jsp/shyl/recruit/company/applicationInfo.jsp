<%@page import="com.sun.org.glassfish.gmbal.IncludeSubclass"%>
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
<title>申请承诺书_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<base href="<%=basePath%>">
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link href="<%=basePath%>shyl/css/maincss/css.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>shyl/css/maincss/mypage.css" rel="stylesheet" type="text/css">
<!--分页  -->
<%@ include file="../../common/header.jsp"%>

<script src="js/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="/SHYL/shyl/js/datepicker/WdatePicker.js" type="text/javascript"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<!--分页  -->
<script type="text/javascript" src="shyl/js/common/head.js"></script>
<script type="text/javascript">
function saves(){
	 if(localcheck()){ 
		$("#docForm").attr('action','<%=basePath%>apply/save.act');
		$("#docForm").submit();
	 } 
}

</script>
<script type="text/javascript">
	var checkSubmitFlg = false;
	function checkSubmit(){
	if(checkSubmitFlg ==true){
		return false; //当表单被提交过一次后checkSubmitFlg将变为true,根据判断将无法进行提交。
		}
		checkSubmitFlg ==true;
		return true;
	}
</script >
<style>
.modal-body h3{
	text-align:left;
	width: 25%; 
}
.modal-body h3 i{
	width: 100%;
	height:42px;
	border-bottom: 2px solid #3d68ce; 
	display: inline-block; 
	position: relative;
}
.modal-body h3 i span{
	border-left: 5px solid #3d68ce;
	padding-left: 15px;
}
</style>
</head>

<body>
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>	
		<jsp:include page="../../common/left.jsp"><jsp:param value="2" name="menuType"/></jsp:include>
		<div class="mypage_right">
		<form class="form-horizontal" role="form" id="docForm"
								name="docForm" action="" method="post"  onsubmit="return checkSubmit();">
								<input type="hidden" name="info_id" value="${pd.info_id}"/>
								<input type="hidden" name="user_id" value="${pd.user_id}">							
								<input type="hidden" name="toPage" value="${pageMap.toPage}">
			<h2><img id="catalogTree" src="<%=basePath%>/shyl/images/catalog.png" style="margin-bottom: 5px;"/>申请承诺书</h2>
			<div class="form-horizontal company_list">
				<label  style="margin-bottom: 10px !important;">
            			<input id="apply_area" name="apply_area" size="15" style="border-left: medium none; border-right: medium none; border-top: medium none; 
            			border-bottom: 1px solid rgb(192,192,192)" maxlength="50" value="${pd.apply_area}">
                  	商务主管部门、财政局：
                  	</label>
                  	<br/>
                  	<label style="margin-top:20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本单位认真阅读并充分理解了《关于做好2017年度济南市开放性经济发展
                  	引导资金项目申报工作的通知》（以下简称“通知”）的有关申报要求。本单位及本单位法定代表人在此承诺，本单位本次按“通知”申请
                  	的项目（项目名称：服务外包企业项目：
					<a class="btn select_btn" data-toggle="modal"
					id="inText" data-target="#myProject" onclick="InChecked()">
					 <c:if test="${pd.apply_project == null || pd.apply_project == ''}">
					  请选择项目名称&nbsp;
					</c:if>
					 <c:if test="${pd.apply_project != null || pd.apply_project != ''}">
					  ${pd.apply_project}
					</c:if>
					<b
					class="caret"></b></a> <input id="apply_project_code" name="apply_project_code" type="hidden" 
					value="${pd.apply_project_code}"> <input id="apply_company_type" name="apply_company_type" type="hidden" 
					value="${pd.apply_company_type}"> <input id="apply_project" name="apply_project" 
					type="hidden" value="${pd.apply_project}" />
                  	）真实发生，完全属实，本单位提报的项目申请材料均真实有效，所有申请材料复印件已与其原文件核对无误，均完全
                  	一致。本单位如有弄虚作假、骗取套取等违法违规行为，或者在获得产业扶持资金后没有按照“通知”申报要求，资金使用要求等合规使用，
                  	本单位承诺自愿缴回全部扶持资金，且三年内不再申请各类商务产业发展引导资金，本单位法定代表人承诺对此承担连带责任。本单位及
                  	本单位法定代表人自愿承担弄虚作假及资金未合规使用所产生的一切法律法规等责任及后果。
                  	</label>
                  	<br/>
                 		<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本单位在获得资金扶持后，自愿按要求接受审计和检查。如不配合
                 		或者拒绝接受审计和检查，视同弄虚作假及资金未合规使用行为，将承担本承诺书第一款相应的责任。</label>
                 		<br/>
                 		<label style="margin-left:25px;">特此承诺。</label>
                 		<br/><br/>
                 		<label style="margin-left:40px;">单位盖章：</label>
                 		<br/>	
                 		<label style="margin-left:550px;">法定代表人（签字）：</label>
                 		<label style="margin-left:600px;">
					    <input class="inputtxt2" id="apply_date" name="apply_date" 
					    style="width:180px;"onFocus="WdatePicker({isShowWeek:true});"
					    type="text" value="${pd.apply_date}" />
            			</label>
                  	
			</div>
			<div class="col-sm-2 col-sm-offset-2" style="margin-top:5%;margin-left:40%">
					<button type="button" onclick="saves();"
						class="btn btn-success btn-block"style="width:172px">
						<span class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp;${pageMap.toText}
					</button>
			</div>
		</form>
		</div>
		<div class="clearfix"></div>
				
		<!-- Modal -->
		<div class="modal fade in" id="myProject" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
			data-backdrop="static">
			<div class="modal-lg" style="margin:200px auto;width: 680px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							onclick="Clear()">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">请选择项目名称</h4>
					</div>
					<div class="modal-body">
						<h3><input name="projectSelect" type="radio" value="1" style="display:none;"/><i><span>企业</span></i></h3>
						<ul class="list-inline xz_list">
							<c:forEach items="${ApplicationList}" var="pdD">
								<li>
									<div class="checkbox">
										<label style="max-width:100px;font-size: 14px;">
										<input type="checkbox" name="Ind1" value="${pdD.distinguish_id}"><span>${pdD.value}</span></label>
									</div>
								</li>
							</c:forEach>
						</ul>
						<h3 style="text-align:left;"><input name="projectSelect"  type="radio" value="2" style="display:none;"/><i><span>园区（基地）</span></i></h3>
						<ul class="list-inline xz_list">
								<li>
									<div class="checkbox">
										<label style="max-width:100px;font-size: 14px;">
										<input type="checkbox" name="Ind2" value="1" ><span>服务外包园区（基地）、孵化器、创客空间和公共服务项目</span></label>
									</div>
								</li>
						</ul>
						<h3 style="text-align:left;"><input name="projectSelect" type="radio" value="3" style="display:none;"/><i><span>其他</span></i></h3>
						<ul class="list-inline xz_list">
								<li>
									<div class="checkbox">
										<label style="max-width:100px;font-size: 14px;">
										<input type="checkbox" name="Ind3" value="1" ><span>服务外包公共发展环境建设项目</span></label>
									</div>
								</li>
						</ul>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success"
							onclick="Industrychecks()" data-dismiss="modal">确认</button>
						<button type="button" class="btn btn-default" onclick="Clear()"
							data-dismiss="modal">关闭</button>
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
<script type="text/javascript" src="<%=basePath%>shyl/js/regist.js"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/registCheck.js"></script>
	<script type="text/javascript">	
		 function search(){
			 $("#listForm").attr("action","<%=basePath%>gov/list.act");
				$("#listForm").submit();
		 }
			    $('input[name="Ind1"]').change(function() { 
			    	if ($(this).is(':checked')) {
			    		$('input[name="Ind2"]').removeAttr("checked");
			    		$('input[name="Ind3"]').removeAttr("checked");
			    		$('input:radio[name="projectSelect"]').eq(0).attr("checked","checked");
			    		if($(this).val()=='1'){
			    			$('input[name="Ind1"]').eq(1).removeAttr("checked");
				    	}else if($(this).val()=='2'){
				    		$('input[name="Ind1"]').eq(0).removeAttr("checked");
				    	}
			    	}
			    	
			    });
			    $('input[name="Ind2"]').change(function() { 
			    	if ($(this).is(':checked')) {
			    		$('input[name="Ind1"]').removeAttr("checked");
			    		$('input[name="Ind3"]').removeAttr("checked");
			    		$('input:radio[name="projectSelect"]').eq(1).attr("checked","checked");
			    	}
			    });
			    $('input[name="Ind3"]').change(function() { 
			    	if ($(this).is(':checked')) {
			    		$('input[name="Ind2"]').removeAttr("checked");
			    		$('input[name="Ind1"]').removeAttr("checked");
			    		$('input:radio[name="projectSelect"]').eq(2).attr("checked","checked");
			    	}
			    });
			    
			    
			    
	</script>
	<script type="text/javascript">
	//保存
		function localcheck(){
			 var applyArea = $("#apply_area").val();
			if($.trim(applyArea) == ""){
				$("#apply_area").tips({
					side : 2,
					msg : "请输入申请地区",
					bg : '#AE81FF',
					time : 3
				});
				$("#apply_area").focus();
				return false;
			}
			 if($("#apply_project").val() == ""){
				$("#inText").tips({
					side : 2,
					msg : "请选择申请项目",
					bg : '#AE81FF',
					time : 3
				});
				$("#inText").focus();
				return false;
			} 
			if($("#apply_date").val() == ""){
				$("#apply_date").tips({
					side : 2,
					msg : "请输入申请日期",
					bg : '#AE81FF',
					time : 3
				});
				$("#apply_date").focus();
				return false;
			}
		
			return true;
		}
	
		//获取项目选中值
		function Industrychecks() {
			var relateIds = "";
			var texts = "";
			//yc 2017/1/16 添加
			var codes = "";
			var applyCompanyType=$('input:radio[name="projectSelect"]:checked').val();
			$("input[name^='Ind']:checked").each(function() {
				texts += $(this).next().text() + ',';
				codes += $(this).val() + ',';
			});//得到选中复选框的text 
			if (texts.length > 400) {
				texts = texts.substring(0, 400) + "....";
			} else {
				texts = texts.substring(0, texts.length - 1);
			}
			if (texts == "") {
				$("#inText").text("请选择项目名称");
				$("#inText").append('&nbsp;<b class="caret"></b>')
				$("#apply_project").val("");
				$("#apply_company_type").val("");
				$("#apply_project_code").val("");
			} else {
				$("#inText").text(texts);
				$("#apply_project").val(texts);
				$("#apply_project_code").val(codes.substring(0, codes.length - 1));
				$("#apply_company_type").val(applyCompanyType);
			}
			$("[name ^='Ind']").removeAttr("checked");//取消全选
			InChecked();
		}
	    //checkbox反选
	    function InChecked() {
	        // 行业
	        if ($("#apply_project_code").val() != "") {
	            var st = $("#apply_project_code").val();
	            var applyCompanyType = $("#apply_company_type").val();
	            var cklist = st.split(',');
	            $("input[name^='Ind']").removeAttr("checked");
	            for (var i = 0; i < cklist.length; i++) {
	            	$("input[name='Ind"+applyCompanyType+"']").each(function() {
	    				if($(this).val()==cklist[i]){
	    					$(this).attr("checked","checked");
	    				}
	    			});
	            	
	            }
	        }
	    }
	</script>
<jsp:include page="../../common/govCatalog.jsp"></jsp:include>
</body>
</html>