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
<title>企业交流费用汇总表_济南市服务外包公共服务平台</title>
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
<script type="text/javascript" src="shyl/js/images/apply/applyCommExpDetail.js"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<style type="text/css">
.voucher-scrollbar{
	padding-left: 20px;
	margin-right: 40px; 
	overflow-y: auto; 
	height: 250px;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param
				value="2" name="menuType" /></jsp:include>
		<div class="mypage_right">
			<h2>${pd.meeting_name}费用汇总表</h2>
			<div>
				<p class="pull-right" style="margin-right: 50px;">
					<a class="btn btn-link hover" data-toggle='modal'
						data-target='#expenDetaiModal'><span
						class="btn btn-primary1 fileinput-button"><span><strong>+</strong>&nbsp;费用明细</span>
							<input type="hidden" value="${pd.id}" id="ex_info_id">
							<input type="hidden" value="${pd.info_id}" id="info_id">
							<input type="hidden" value="${levelPd.level}" id="level">
							<input type="hidden" value="<%=basePath%>" id="methodUrl">
							</span></a>
				</p>
			</div>
			<div style="margin-top: 15px" id="files" class="col-sm-12">
				<table class="tableclass">
					<thead>
						<tr>
							<th style="width: 10%; text-align: center;">序号</th>
							<th style="width: 10%; text-align: center;">日期</th>
							<th style="width: 15%; text-align: center;">凭证号</th>
							<th style="width: 10%; text-align: center;">出差人员</th>
							<th style="width: 15%; text-align: center;">金额（元）</th>
							<th style="width: 15%; text-align: center;">备注</th>
							<th style="width: 15%; text-align: center;">操作</th>
						</tr>
					</thead>
					<tbody id="tbodyId">
						<c:choose>
							<c:when test="${not empty expensesDetaillist}">
								<c:forEach items="${expensesDetaillist}" var="var"
									varStatus="vs">
									<tr>
										<td style="text-align: center;">${vs.index+1}</td>
										<td style="text-align: center;">${var.doc_date}</td>
										<c:choose>
											<c:when test="${fn:length(var.doc_num) >8}">
												<td style="text-align: center;" title="${var.doc_num}">${fn:substring(var.doc_num,0, 8)}...</td>
											</c:when>
											<c:otherwise>
												<td style="text-align: center;">${var.doc_num}</td>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${fn:length(var.business_traveler) >6}">
												<td style="text-align: center;" title="${var.business_traveler}">${fn:substring(var.business_traveler,0, 6)}...</td>
											</c:when>
											<c:otherwise>
												<td style="text-align: center;">${var.business_traveler}</td>
											</c:otherwise>
										</c:choose>
										<td style="text-align: center;">${var.money}<input
											type="hidden" value="${var.totalMoney}" id="total"></td>
											<c:choose>
											<c:when test="${fn:length(var.remark) >10}">
												<td style="text-align: center;" title="${var.remark}">${fn:substring(var.remark,0, 10)}...</td>
											</c:when>
											<c:otherwise>
												<td style="text-align: center;">${var.remark}</td>
											</c:otherwise>
										</c:choose>
										<td style="text-align: center;"><a data-toggle='modal' data-target='#modifyModal' class="modify"
											onclick="modifyExpenseDetail(${var.id})">修改</a><a
											data-toggle='modal' data-target='#delModal' class="delete"
											onclick="delExpenseDetail(${var.id})">删除</a> <a
											data-toggle='modal' data-target='#promptModal' class="upload"
											onclick="uploadExpenseVoucher(${var.id})"
											href="javascript:void(0);">凭证</a><a data-toggle='modal'
											data-target='#viewVoucherModal' class="zview"
											onclick="viewExpenseVoucher(${var.id})"
											href="javascript:void(0);">预览</a></td>
									</tr>
								</c:forEach>
								<tr>
									<td style="text-align: center;">合计</td>
									<td></td>
									<td></td>
									<td></td>
									<td id="totalMoney" style="text-align: center;"></td>
									<td></td>
									<td></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="7" style="text-align: center;"><span
										style="color: #ff6a00">没有相关记录</span></td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<c:if test="${levelPd.level==2}">
					<div class="jianli">
						<table>
							<tr>
								<td style="font-size: 18px; font-weight: 700;" width="28%">
									申请境外实训扶持资金
								<td width="15%"><input type="text" class="form-control"
									value="${pd.fcTotalMoney}"
									onkeypress="return myNumberic(event)"
									onkeyup="value=value.replace(/[^\d.]/g,'')" id="reward"
									onblur="checkMoney();" name="reward"
									style="width: 100px; font-size: 18px; font-weight: 700; height: 28px; border-radius: 5px; background-color: #ecf0f9;"></td>
								<td>&nbsp;万元</td>
							</tr>
							</tbody>
						</table>
					</div>
				</c:if>
			</div>
			<div>
				<div class="col-sm-2 col-sm-offset-2" style="margin-top: 20px;">
					<button type="button" onclick="OK();"
						class="btn btn-success btn-block" style="margin-left: 170px">
						<span class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp; 保存
					</button>
				</div>
			</div>
		</div>
	</div>
	<!--费用明细添加开始-->
	<div class="modal fade in" id="expenDetaiModal" role="dialog"
		aria-labelledby="sEdu" aria-hidden="false" data-backdrop="static">
		<form action="" id="test1">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							添加费用明细<small>（&nbsp;<span class="red_tip">*</span>为必填项&nbsp;）
							</small>
						</h4>
					</div>
					<div class="modal-body">
						<div class="form_table_box">
							<table class="table">
								<tbody>
									<tr>
										<th style="width: 150px"><span class="red_tip">*</span>出差人员名称：</th>
										<td colspan="3"><input class="form-control"
											data-val="true" data-val-length="长度<50"
											data-val-length-max="50" data-val-required="*"
											id="business_traveler" name="business_traveler" type="text"
											placeholder="请输入出差人员名称(30字以内)" maxlength="20" onblur="trim(this);"></td>
									</tr>
									<tr>
										<th style="width: 150px"><span class="red_tip">*</span>凭证号：</th>
										<td><input class="form-control" data-val="true"
											data-val-length="长度<50" data-val-length-max="50"
											data-val-required="*" id="doc_num" name="doc_num" type="text"
											placeholder="请输入凭证号(30字以内)" maxlength="20" onblur="trim(this);"></td>

									</tr>
									<tr>
										<th style="width: 150px"><span class="red_tip">*</span>金额（元）：</th>
										<td><input class="form-control" data-val="true"
											data-val-length="长度<50" data-val-length-max="50"
											data-val-required="*" id="money" name="money" type="text"
											placeholder="请输入金额只允许为数字" maxlength="11" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" style="ime-mode:disabled" value="0.00" onblur="changeFloat(this);"></td>
									</tr>
									<tr>
										<th style="width: 150px"><span class="red_tip">*</span>日期：</th>
										<td><input class="form-control" data-val="true"
											data-val-length="长度<50" data-val-length-max="50"
											data-val-required="*" id="doc_date" name="doc_date"
											type="text" placeholder="请选择日期"
											onFocus="WdatePicker({isShowWeek:true});"></td>
									</tr>
									<tr>
										<th>备注：</th>
										<td><input class="form-control" data-val="true"
											data-val-length="长度<50" data-val-length-max="50"
											data-val-required="*" id="remark" name="remark"
											placeholder="请输入备注（20字以内）" maxlength="20" onblur="trim(this);"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<button id="EduButtonedu" type="button" class="btn btn-success"
							onclick="expenseDetailSave()" data-dismiss="">确认</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
			<input type="reset" style="display: none;" name="expensesDetailClear">
		</form>
	</div>
	<!--费用明细添加结束-->
	<script type="text/javascript" src="shyl/js/jquery.tips.js"></script>
	<!--费用明细修改开始-->
	<div class="modal fade in" id="modifyModal" role="dialog"
		aria-labelledby="sEdu" aria-hidden="false" data-backdrop="static">
		<form action="" id="test1">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							修改费用明细<small>（&nbsp;<span class="red_tip">*</span>为必填项&nbsp;）
							</small>
						</h4>
					</div>
					<div class="modal-body">
						<div class="form_table_box">
							<table class="table">
								<tbody>
									<tr>
										<th style="width: 150px"><span class="red_tip">*</span>出差人员名称：</th>
										<td colspan="3"><input class="form-control"
											data-val="true" data-val-length="长度<50"
											data-val-length-max="50" data-val-required="*"
											id="business_travelerUpd" name="business_travelerUpd"
											type="text" placeholder="请输入出差人员名称(30字以内)" maxlength="20" onblur="trim(this);"></td>
									</tr>
									<tr>
										<th style="width: 150px"><span class="red_tip">*</span>凭证号：</th>
										<td><input class="form-control" data-val="true"
											data-val-length="长度<50" data-val-length-max="50"
											data-val-required="*" id="doc_numUpd" name="doc_numUpd"
											type="text" placeholder="请输入凭证号(30字以内)" maxlength="20" onblur="trim(this);"></td>

									</tr>
									<tr>
										<th style="width: 150px"><span class="red_tip">*</span>金额（元）：</th>
										<td><input class="form-control" data-val="true"
											data-val-length="长度<50" data-val-length-max="50"
											data-val-required="*" id="moneyUpd" name="moneyUpd"
											type="text" placeholder="请输入金额只允许为数字" maxlength="11" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" style="ime-mode:disabled" value="0.00" onblur="changeFloat(this);"></td>
									</tr>
									<tr>
										<th style="width: 150px"><span class="red_tip">*</span>日期：</th>
										<td><input class="form-control" data-val="true"
											data-val-length="长度<50" data-val-length-max="50"
											data-val-required="*" id="doc_dateUpd" name="doc_dateUpd"
											type="text" placeholder="请选择日期"
											onFocus="WdatePicker({isShowWeek:true});"></td>
									</tr>
									<tr>
										<th>备注：</th>
										<td><input class="form-control" data-val="true"
											data-val-length="长度<50" data-val-length-max="50"
											data-val-required="*" id="remarkUpd" name="remarkUpd"
											placeholder="请输入备注（20字以内）" maxlength="20" onblur="trim(this);"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<button id="EduButtonedu" type="button" class="btn btn-success"
							onclick="ExpensesDetailUpd()" data-dismiss="">确认</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
			<input type="hidden" value="" id="expensesDetailId"> <input
				type="reset" style="display: none;" name="reportedu">
		</form>
	</div>
	<!--费用明细修改结束-->
	<!--费用明细删除开始-->
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
						onclick="DeleteExpenseDetail()">确认</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<input type="hidden" value="" id="delExpenseDetailId">
				</div>
			</div>
		</div>
	</div>
	<!--费用明细删除结束-->
	<!-- 提示上传信息模态框（Modal）开始 -->
	<div class="modal fade in" id="promptModal" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">上传凭证温馨提示</h4>
				</div>
				<div class="modal-body">
					支持的文件<font color="red">小于1MB</font><br /> 支持的文件格式为<font
						color="red">.jpg、.png、.jpeg、.gif</font><br /> <br />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
				</div>
			</div>
		</div>
	</div>
	<!--上传文件模态框开始-->
	<div class="modal fade in" id="uploadVoucherModal" role="dialog"
		aria-labelledby="uploadVoucherModal" aria-hidden="false"
		data-backdrop="static">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						凭证上传<small> </small>
					</h4>
				</div>
				<form class="form-horizontal" role="form" action="" method="post"
					id="form1" name="form1">
					<div class="row">
						<div class="col-md-12">
							<div>
								<div class="form-group" id="businessDiv">
									<div>

										<ul id="imagesID" style="overflow: hidden">

										</ul>
									</div>
									<div class="col-sm-5" style="margin-left: 7%">
										<div class="caption" align="center" style="width: 100px;">
											<span id="upload_voucher"
												class="btn btn-primary fileinput-button"
												style="margin-top: 20px;"> <span>上传凭证</span> <input
												type="file" id="upload_voucher" name="upload_voucher"
												multiple />
											</span>
										</div>
										<div class="help-block" style="margin-top: 30px;">支持的文件格式为.jpg、.png、.jpeg、.gif</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-body">
						<input id="voucherId" name="voucherId" type="hidden" value="">
					</div>
					<div class="modal-footer">
						<button id="EduButton" type="button" class="btn btn-success"
							onclick="uploadVoucher()">确认</button>
						<button type="button" class="btn btn-default"
							data-dismiss="modal">关闭</button>
					</div>
				</form>
				<script src="shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
				<script src="shyl/fileupload/js/jquery.fileupload.js"></script>
				<script src="shyl/fileupload/js/jquery.fileupload-process.js"></script>
				<script src="shyl/fileupload/js/jquery.fileupload-validate.js"></script>
				<script src="shyl/fileupload/js/jquery.iframe-transport.js"></script>
			</div>
		</div>
	</div>
	<!--上传文件模态框结束-->
	<!-- 预览上传凭证开始 -->
	<div class="modal fade in" id="viewVoucherModal" role="dialog"
		aria-labelledby="uploadVoucherModal" aria-hidden="false"
		data-backdrop="static">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						预览凭证<small> </small>
					</h4>
				</div>
				<form class="form-horizontal" role="form" action="" method="post"
					id="form1" name="form1">
					<div class="row">
						<div class="col-md-12">
							<div>
								<div class="form-group" id="businessDiv">
									<div >
										<ul id="voucherID" style="overflow: hidden">
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-body">
						<input id="voucherDetailId" name="voucherDetailId" type="hidden" value="">
					</div>
					<div class="modal-footer">
						<button id="button" type="button" class="btn btn-success"
							data-dismiss="modal">确认</button>
						<button type="button" class="btn btn-default"
							data-dismiss="modal">关闭</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 预览上传凭证结束 -->
	<script src="/SHYL/shyl/js/datepicker/WdatePicker.js"
		type="text/javascript"></script>
	<div class="clear"></div>
	<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
</html>
