<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
    String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>国际市场开拓活动或百展计划服务贸易相关展览活动_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">
<link rel="stylesheet" href="shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/styleRegist.css">
<jsp:include page="../../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet"
	href="shyl/fileupload/css/jquery.fileupload-ui.css">
<link rel="stylesheet" href="shyl/css/font-awesome.css">
<link rel="stylesheet" href="shyl/css/non-responsive.css">
<script src="shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script type="text/javascript" src="shyl/js/bootstrap.js"></script>
<script type="text/javascript" src="shyl/js/images/apply/applyCommExpenses.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<script type="text/javascript">
	var checkSubmitFlg = false;
	function checkSubmit(){
	if(checkSubmitFlg ==true){
		return false; //当表单被提交过一次后checkSubmitFlg将变为true,根据判断将无法进行提交。
		}
		checkSubmitFlg ==true;
		return true;
	}
    $(document).keydown(function(event){   
        if (event.keyCode == 13) {     
            $('form').each(function() {       
                event.preventDefault();     
            });  
        }
    });
</script >
</head>
<body style="background-color: #f7f7f7;">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param value="2" name="menuType"/></jsp:include>
		<form class="form-horizontal" role="form" id="docForm"
								name="docForm" action="" method="post"  onsubmit="return checkSubmit();">
								<input type="hidden" value="${pd.info_id}" id="info_id" name="info_id">
						        <input type="hidden" name="user_id" value="${pd.user_id}">
						        <input type="hidden" id="methodUrl" value="<%=basePath%>">								
								<input type="hidden" name="toPage" value="${pageMap.toPage}">
		<div class="mypage_right">
			<h2 class="h2_font13">${pageMap.levelMap.levelMenu}国际市场开拓活动或百展计划服务贸易相关展览活动</h2>
				<c:if test="${pd.level==1}">
			<div>
				<p class="pull-right" style="margin-right: 50px;">
					<a data-toggle="modal" data-target="#upExcel" onclick="upEx();"
						class="more"><span
						class="btn btn-primary1 fileinput-button">批量导入</span></a>&nbsp;&nbsp;
					<a class="btn btn-link hover" data-toggle='modal'
						data-target='#expensesTypeModal'><span
						class="btn btn-primary1 fileinput-button"><span><strong>+</strong>&nbsp;活动名称</span>
						
					</span></a>
				</p>
			</div>
			<div style="margin-top:15px" id="files" class="col-sm-11">
				<table class="tableclass">
					<thead>
						<tr>
							<th style="width:10%; text-align: center;">序号</th>
							<th style="width:40%; text-align: center;">活动名称</th>
							<th style="width:30%; text-align: center;">操作</th>
						</tr>
					</thead>
					<tbody id="fileID">
					<c:choose>
							<c:when test="${not empty expensesTypelist}">
								<c:forEach items="${expensesTypelist}" var="var" varStatus="vs">
									<tr>
									<td style="text-align: center">${vs.index+1}</td>
										<c:choose>
											<c:when test="${fn:length(var.meeting_name) >25}">
												<td title="${var.meeting_name}"
													style="text-align: center">${fn:substring(var.meeting_name,0, 25)}...</td>
											</c:when>
											<c:otherwise>
												<td title="${var.meeting_name}"
													style="text-align: center;">${var.meeting_name}</td>
											</c:otherwise>
										</c:choose>
										<td style="text-align: center;"><a data-toggle='modal'
										data-target='#modifyModal' class="modify"
											onclick="modifyExpenseType(${var.id})">修改</a><a data-toggle='modal'
											data-target='#delModal' class="delete"
											onclick="delExpenseType(${var.id})">删除</a>
											 <a class="zview" id="view${var.id}" href="<%=basePath%>platform/toApplyCommExDetail.act?id=${var.id}&info_id=${pd.info_id}&level=${pd.level}">明细</a></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="3" style="text-align: center;"><span style="color: #ff6a00">没有相关记录</span></td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<table>
						<tr>
							<td style="font-size: 18px; font-weight: 700; width:100px;">
								申请金额
							<td width="15%">
							<input id="num" name="num" type="hidden" value="${pageMap.type}" />
							<input type="text" class="form-control"
								value="${pd.support_capital}" onkeypress="return myNumberic(event)"
								onkeyup="value=value.replace(/[^\d.]/g,'')" id="support_capital"
								onblur="checkMoney();" name="support_capital"
								style="width: 100px; font-size: 18px; font-weight: 700; height: 28px; border-radius: 5px; background-color: #ecf0f9;"></td>
							<td>&nbsp;万元</td>
						</tr>
					</table>
			</div>
			</c:if>
			<c:if test="${pd.level==2}">
			<div>
				<p class="pull-right" style="margin-right: 50px;">
					<a class="btn btn-link hover" data-toggle='modal'
						data-target='#expensesTypeModal'><span
						class="btn btn-primary1 fileinput-button"><span><strong>+</strong>&nbsp;活动名称</span>
						
					</span></a>
				</p>
			</div>
			<div style="margin-top:15px" id="files" class="col-sm-11">
				<table class="tableclass">
					<thead>
						<tr>
							<th style="width:10%; text-align: center;">序号</th>
							<th style="width:40%; text-align: center;">活动名称</th>
							<c:if test="${pd.level==2}">
							<th style="width:20%; text-align: center;">申请扶持资金（万元）</th>
							</c:if>
							<th style="width:30%; text-align: center;">操作</th>
						</tr>
					</thead>
					<tbody id="fileID">
					<c:choose>
							<c:when test="${not empty expensesTypelist}">
								<c:forEach items="${expensesTypelist}" var="var" varStatus="vs">
									<tr>
									<td style="text-align: center">${vs.index+1}</td>
										<c:choose>
											<c:when test="${fn:length(var.meeting_name) >25}">
												<td title="${var.meeting_name}"
													style="text-align: center">${fn:substring(var.meeting_name,0, 25)}...</td>
											</c:when>
											<c:otherwise>
												<td title="${var.meeting_name}"
													style="text-align: center;">${var.meeting_name}</td>
											</c:otherwise>
										</c:choose>
										<td style="text-align: center;">${var.total_money}<input
											type="hidden" value="${var.totalMoney}" id="total"></td>
										<td style="text-align: center;"><a data-toggle='modal'
											data-target='#modifyModal' class="modify"
											onclick="modifyExpenseType(${var.id})">修改</a><a data-toggle='modal'
											data-target='#delModal' class="delete"
											onclick="delExpenseType(${var.id})">删除</a> <a class="zview"
											id="view${var.id}" href="<%=basePath%>platform/toApplyCommExDetail.act?id=${var.id}&info_id=${pd.info_id}&level=${pd.level}"
											>明细</a></td>
									</tr>
								</c:forEach>
								<tr><td style="text-align: center;">合计</td>
							<td style="text-align: center;"></td>
							<td id="totalMoney" style="text-align: center;">${pd.totalMoney}</td>
							<td style="text-align: center;"></td></tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" style="text-align: center;"><span style="color: #ff6a00">没有相关记录</span></td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<c:choose>
				<c:when test="${not empty pd.totalMoney}">
								<h4 style="font-size: 20px; margin-top: 20px; margin-left: 12px">
					申请扶持资金合计：${pd.totalMoney}万元
				</h4>
				</c:when>	
				</c:choose>	
			</div>
			</c:if>
			<div>
				<div class="col-sm-2 col-sm-offset-2" style="margin-top: 20px;">
					<button type="button" onclick="OK();"
						class="btn btn-success btn-block" style="width:170px">
						<span class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp;${pageMap.toText}
					</button>
				</div>
				<div class="col-sm-2" style="margin-top: 20px;margin-left: 8px">
					<a onclick="GO('${pageMap.fromPage}');" class="btn btn-default btn-block"><span
						class="glyphicon glyphicon-circle-arrow-left"></span>&nbsp;&nbsp;上一步</a>
				</div>
			</div>
		</div>
		</form>
	</div>
	<jsp:include page="../../common/importExcel.jsp"></jsp:include>
	<script type="text/javascript">
	 function OK() {
		 $("#docForm").attr('action','<%=basePath%>platform/toNextPage.act');
			$("#docForm").submit();
	    }
	 // 返回
    function GO(url) {
        location.href = '<%=basePath%>'+url+'?&info_id='+$("#info_id").val();
    }
	</script>
	<div class="modal fade in" id="expensesTypeModal" role="dialog"
		aria-labelledby="expensesTypeModal" aria-hidden="false" data-backdrop="static">
		<form action="" id="test1">
			<div class="modal-dialog modal-lg">
				<div class="modal-content" style="width:800px">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							活动类型添加<small>（&nbsp;<span class="red_tip">*</span>为必填项&nbsp;）
							</small>
						</h4>
					</div>
					<div class="modal-body">
						<div class="form_table_box">
							<table class="table">
								<tbody>
									<tr>
										<th style="width:150px"><span class="red_tip">*</span>参加活动类型：</th>
										<td style="width:100px" colspan="3">
										
										<input class="form-control"
											data-val="true" data-val-length="长度<3"
											data-val-length-max="5" data-val-required="*"
											id="expensesType" name="expensesType" type="text"
											placeholder="请输入所需的活动类型" maxlength="30" onblur="trim(this);"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success"
							onclick="expensesTypeSave()">确认</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
			<input type="reset" style="display: none;" name="expensesTypeClear">
		</form>
	</div>
	<script type="text/javascript" src="shyl/js/jquery.tips.js"></script>
	<!--费用类型修改开始-->
	<div class="modal fade in" id="modifyModal" role="dialog"
		aria-labelledby="modifyModal" aria-hidden="false" data-backdrop="static">
		<form>
			<div class="modal-dialog modal-lg">
				<div class="modal-content" style="width:800px">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							活动类型修改<small>（&nbsp;<span class="red_tip">*</span>为必填项&nbsp;）
							</small>
						</h4>
					</div>
					<div class="modal-body">
						<div class="form_table_box">
							<table class="table">
								<tbody>
									<tr>
										<th style="width:150px"><span class="red_tip">*</span>参加活动类型：</th>
										<td style="width:100px" colspan="3"><input class="form-control"
											data-val="true" data-val-length="长度<3"
											data-val-length-max="5" data-val-required="*"
											id="expensesTypeUpd" name="expensesTypeUpd" type="text"
											placeholder="请输入所需的费用类型" maxlength="30" onblur="trim(this);"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="modal-footer">
					<input id="expensesTypeId" type="hidden" value="">
						<button type="button" class="btn btn-success"
							onclick="ExpensesTypeUpd()" data-dismiss="">确认</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
			<input type="reset" style="display: none;" name="expensesTypeClear">
		</form>
	</div>
	<!--费用类型修改结束-->
	<!--费用类型删除开始-->
	<div class="modal fade in" id="delModal" role="dialog"
		aria-labelledby="deledu" aria-hidden="false" data-backdrop="static">
		<div class="modal-dialog  modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<h4>您确定要删除吗？删除后不可恢复！！</h4>
					<br> <br>
				</div>
				<input id="Conid" name="Conid" type="hidden" value="">
				<div class="modal-footer">
					<button id="EduButton" type="button" class="btn btn-success"
						onclick="DeleteExpenseType()">确认</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<input type="hidden" value="" id="delExpenseId">
				</div>
			</div>
		</div>
	</div>
	<!--费用类型删除结束-->
	<div class="clear"></div>
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<script src="shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
	<script src="shyl/fileupload/js/jquery.fileupload.js"></script>
	<script src="shyl/fileupload/js/jquery.fileupload-process.js"></script>
	<script src="shyl/fileupload/js/jquery.fileupload-validate.js"></script>
	<script src="shyl/fileupload/js/jquery.iframe-transport.js"></script>
	<script type="text/javascript">
	
	function myNumberic(e,len) {
	    var obj=e.srcElement || e.target;
	    var dot=obj.value.indexOf(".");//alert(e.which);
	    len =(typeof(len)=="undefined")?2:len;
	    var  key=e.keyCode|| e.which;
	    if(key==8 || key==9 || key==46 || (key>=37  && key<=40))//这里为了兼容Firefox的backspace,tab,del,方向键
	        return true;
	    if (key<=57 && key>=48) { //数字
	        if(dot==-1)//没有小数点
	            return true;
	        else if(obj.value.length<=dot+len)//小数位数
	            return true;
	        } else if((key==46) && dot==-1){//小数点
	            return true;
	    }       
	    return false;
	}
	 //文本框失去焦点后
    function checkMoney(){
    	var support_capital = $("#support_capital").val();
    	var reg=/^\d*\.?\d{0,2}$/;
    	var PsdFilter = /^\d{0,7}(\.\d{0,2})?$/;
    	if(support_capital != null || support_capital != ''){
    		if(!reg.test(support_capital)){
    			$("#support_capital").tips({
    				side : 2,
    				msg : '"support_capital","申请金额必须大于0且小数位数不超过2位！"',
    				bg : '#AE81FF',
    				time : 3
    			});
    			return true;
        	}
    	}
		if (!(PsdFilter.test(support_capital))) {
			$("#support_capital").tips({
				side : 2,
				msg : '申请扶持金额最大值不能超过9999999.99',
				bg : '#AE81FF',
				time : 3
			});
			$("#support_capital").focus();
			return false;
		}
    }
	</script>
</body>
</html>
