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
<html>
<head>
<meta charset="utf-8">
<title>企业技术出口贴息申请表_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">    
<meta charset="UTF-8"/>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"/> -->
<link rel="stylesheet" href="/SHYL/shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/styleRegist.css">
<jsp:include page="../../common/header.jsp"></jsp:include>
<script src="/SHYL/shyl/js/datepicker/WdatePicker.js"
	type="text/javascript"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="shyl/js/images/apply/exportDiscount.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<style>
a{
    cursor: pointer;
    color: #333;
    }
.mypage_tab a:hover, a:focus {
	color: #333;
}
#docNameImpExcel li { 
	width: 50%; /*如果显示三列 则width改为30%*/ 
	float: left; 
	display: block; 
} 
.inputtxt2NNew {
    width: 275px;
    padding-left: 5px;
    border: 1px solid #ccc !important;
    line-height: 34px;
    height: 34px;
    border: 0;
    border-radius: 5px;
    font-size: 0.85em;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
<form action="<%=basePath%>govUploadCommon/saveExportDiscount.act" method="post" id="form">
<input type="hidden" value="${pd.contryflag}" id="contry">
<input type="hidden" value="" id="listurl">
<input type="hidden" value="" id="inserturl">
<input type="hidden" value="" id="updateurl">
<input type="hidden" value="<%=basePath%>" id="baseurl">
<input type="hidden" value="${lastYear}" id="lastYear">
<input type="hidden" value="${currentYear}" id="currentYear">
<input type="hidden" value="${pageMap.toPage}" name="toPage">
<input type="hidden" id="file_type" name="file_type" value="${pd.file_type}">

	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param value="2" name="menuType"/></jsp:include>
		<div class="mypage_right">
			<h2 class="h2_font13"><img id="catalogTree" src="<%=basePath%>/shyl/images/catalog.png" style="margin-bottom: 5px;"/>${pageMap.levelMap.levelMenu}${currentYear}企业技术出口贴息申请表</h2>
			<p class="pull-right">
				<a data-toggle="modal" data-target="#certificateUploadDialog"
					class="btn btn-link hover"><span
					class="btn btn-primary1 fileinput-button"><span>上传合同文件</span>
				</span> </a> <a data-toggle="modal" data-target="#upExcel" onclick="upExcel();"
					class="btn btn-link hover"><span
					class="btn btn-primary1 fileinput-button"> <span>批量导入</span>
				</span> </a>
				<a data-toggle="modal" data-target="#sEdu"
					class="btn btn-link hover"><span
					class="btn btn-primary1 fileinput-button"> <span>添加新合同</span>
				</span> </a>
			</p>
			<div class="jianli">
			    <table class="tableclass">
					<tbody>
						<tr>
							<td style="font-size: 0.9em; width:28%;padding-left: 20px;">申请企业：
							<span>
								<c:choose>
									<c:when test="${fn:length(pd.company_name)>= 40}">
										${fn:substring(pd.company_name,0, 40)}...
									</c:when>
									<c:otherwise>
							            ${pd.company_name}
							        </c:otherwise>	
								</c:choose>
							</span>
							</td>
							<td style="font-size: 0.9em; width:20%; text-align: right;padding-right:10px">金额单位：万美元</td>
						</tr>
					</tbody>
			   </table>
			</div>
			<div class="jianli">
				<input type="hidden" id="info_id" name="info_id"
					value="${pd.info_id}" />
				<table class="tableclass">
					<thead>
						<tr class="active">
							<th style="width: 7%; text-align: center;">序号</th>
							<th style="width: 13%; text-align: center;">合同登记证书号</th>
							<th style="width: 13%; text-align: center;">合同号</th>
							<th style="width: 14%; text-align: center;">合同名称</th>
							<th style="width: 10%; text-align: center;">合同金额</th>
							<th style="width: 15%; text-align: center;">${lastYear}年实际出口额</th>
							<th style="width: 22%; text-align: center;">操作</th>
						</tr>
					</thead>
					<tbody id="tbodyId">
						<c:choose>
							<c:when test="${not empty contractlist}">
								<c:forEach items="${contractlist}" var="contract" varStatus="vs">
										<tr align="left">
											<td style="text-align: center;">${vs.index+1}</td>
											<td style="text-align: center;"
												title="${contract.contract_regist_no}">
												<c:choose>
												<c:when test="${fn:length(contract.contract_regist_no)>= 8}">
												${fn:substring(contract.contract_regist_no,0, 8)}...
												</c:when>
									            <c:otherwise>
									            ${contract.contract_regist_no}
									            </c:otherwise>	
												</c:choose>
											</td>
											<td style="text-align: center;"
												title="${contract.contract_no}">
												<c:choose>
												<c:when test="${fn:length(contract.contract_no)>= 8}">
												${fn:substring(contract.contract_no,0, 8)}...
												</c:when>
									            <c:otherwise>
									            ${contract.contract_no}
									            </c:otherwise>	
												</c:choose>
											</td>
											<td style="text-align: center;"
												title="${contract.contract_name}">
												<c:choose>
												<c:when test="${fn:length(contract.contract_name)>= 8}">
												${fn:substring(contract.contract_name,0, 8)}...
												</c:when>
									            <c:otherwise>
									            ${contract.contract_name}
									            </c:otherwise>	
												</c:choose>
											</td>
											<td style="text-align: center;"
												title="${contract.contract_money}">${contract.contract_money}</td>
											<td style="text-align: center;" title="${contract.export_money}">${contract.export_money}</td>
											<td style="text-align: center;"><a data-toggle="modal"
												data-target="#eEdu" onclick="eduUpdate(${contract.id})"
												class="modify">修改</a> <a data-toggle='modal'
												data-target='#deledu' onclick="delCon(${contract.id})"
												class="delete">删除</a></td>
										</tr>
								</c:forEach>
						<tr align="left">
                        <td style="text-align: center;">合计</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td style="text-align: center;">${pd.contractTotalMoney}</td>
						<td style="text-align: center;">${pd.exportTotalMoney}</td>
						<td></td>
						</tr>
							</c:when>
							<c:otherwise>
							<tr>
                            <td colspan="8" style="text-align: center;"><span style="color: #ff6a00">没有相关记录</span></td>
                            </tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<div class="jianli">
			    <table class="tableclass">
					<tbody>
						<tr>
							<td style="font-size: 0.9em; width:28%;padding-left: 20px;">注：业务金额精确到个位数。例：28万美元</td>
						</tr>
					</tbody>
			   </table>
			</div>
				<table>
				<tr style="height:42px">
					<td style="font-size: 18px; font-weight: 700; width: 100px;height:42px">
						申请金额
					<td width="15%;" height="42px"><input  id="num" name="num" type="hidden"
						value="${pageMap.type}" /><input type="text" class="form-control"
						value="${pd.support_capital}"
						onkeyup="value=value.replace(/[^\d.]/g,'')" maxlength="10"
						id="support_capital" onblur="checkMoney(this);"
						onfocus="clearInput(this,'0.0000')" name="support_capital"
						style="width: 130px; font-size: 18px; font-weight: 700; height: 42px; border-radius: 5px; background-color: #ecf0f9;"></td>
					<td>&nbsp;万元</td>
					<td><input type="text" style="display: none" /></td>
				</tr>
			</table>
			</div>
			<div>
				<div class="col-sm-2 col-sm-offset-2" style="margin-top: 20px;">
					<button type="button" onclick="OK('${pageMap.toPage}');"
						class="btn btn-success btn-block" style="width:172px">
						<span class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp;${pageMap.toText}
					</button>
				</div>
				<div class="col-sm-2" style="margin-top: 20px;margin-left:8px">
					<a onclick="GO('${pageMap.fromPage}');" class="btn btn-default btn-block"><span
						class="glyphicon glyphicon-circle-arrow-left"></span>&nbsp;&nbsp;上一步</a>
				</div>
			</div>
		</div>
	</div>
	</form>
	<jsp:include page="../../common/importExcel.jsp"></jsp:include>
	<div class="modal fade bs-example-modal-sm in" id="sEdu" role="dialog"
		aria-labelledby="sEdu" aria-hidden="false" data-backdrop="static">
		<form action="" id="test1">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							添加合同<small>（&nbsp;<span class="red_tip">*</span>为必填项&nbsp;）
							</small>
						</h4>
					</div>
					<div class="modal-body">
						<div class="form_table_box">
							<table class="table">
								<tbody>
									<tr>
										<th style="width: 195px"><span class="red_tip">*</span>合同登记证书号：</th>
										<td colspan="3"><input class="form-control"
											data-val="true" data-val-length="长度<50"
											data-val-length-max="50" data-val-required="*"
											id="certificateNo" name="certificateNo" type="text"
											placeholder="请输入合同登记证书号" maxlength="30" onblur="trim(this);"></td>
									</tr>
									<tr>
										<th style="width: 195px"><span class="red_tip">*</span>合同号：</th>
										<td><input class="form-control" data-val="true"
											data-val-length="长度<50" data-val-length-max="50"
											data-val-required="*" id="contractNo" name="contractNo"
											type="text" placeholder="请输入合同号" maxlength="30" onblur="trim(this);"></td>

									</tr>
									<tr>
										<th style="width: 195px"><span class="red_tip">*</span>合同名称：</th>
										<td><input class="form-control" data-val="true"
											data-val-length="长度<50" data-val-length-max="50"
											data-val-required="*" id="contractName" name="contractName"
											type="text" placeholder="请输入合同名称" maxlength="30" onblur="trim(this);"></td>
									</tr>
									<tr>
										<th style="width: 195px"><span class="red_tip">*</span>合同金额（万美元）：</th>
										<td><input class="form-control" data-val="true"
											data-val-length="长度<50" data-val-length-max="50"
											data-val-required="*" id="contractMoney" name="contractMoney"
											type="text" placeholder="请输入合同金额（万美元）只允许为数字" onkeyup="value=value.replace(/[^0-9]/g,'')" 
											onblur="delZero(this);" maxlength="9" style="ime-mode:disabled" value="0"></td>
									</tr>
									<tr>
										<th style="width: 195px"><span class="red_tip">*</span>实际出口额（万美元）：</th>
										<td><input class="form-control" data-val="true"
											data-val-length="长度<50" data-val-length-max="50"
											data-val-required="*" id="exportVolume" name="exportVolume"
											type="text" placeholder="请输入实际出口额（万美元）只允许为数字" onkeyup="value=value.replace(/[^0-9]/g,'')"
											onblur="delZero(this);" maxlength="9" style="ime-mode:disabled" value="0"></td>
									</tr>
									<tr>
										<th>备注：</th>
										<td><input class="form-control" data-val="true"
											data-val-length="长度<50" data-val-length-max="50"
											data-val-required="*" id="remarks" name="remarks"
											placeholder="请输入备注(最多15个字)" maxlength="15"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<button id="EduButtonedu" type="button" class="btn btn-success"
							onclick="certificateSave()" data-toggle="modal">确认</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
			<input type="reset" style="display: none;" name="reportedu">
		</form>
	</div>
		<script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
		<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
		<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
		<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
		<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
		<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
		<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
		<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
		<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
	<!-- 添加合同结束 -->
	<!-- 修改合同模态框开始 -->
	<div class="modal fade in" id="eEdu" role="dialog"
		aria-labelledby="eEdu" aria-hidden="false" data-backdrop="static">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						修改合同<small>（&nbsp;<span class="red_tip">*</span>为必填项&nbsp;）
						</small>
					</h4>
				</div>
				<div class="modal-body">
					<div class="form_table_box">
						<table class="table">
							<tbody>
								<tr>
									<th style="width: 195px"><span class="red_tip">*</span>合同登记证书号：</th>
									<td colspan="3"><input class="form-control"
										data-val="true" data-val-length="长度<50"
										data-val-length-max="50" data-val-required="*"
										id="certificateNoUpd" name="certificateNoUpd" type="text"
										value="" placeholder="请输入合同登记证书号" maxlength="50" onblur="trim(this);"></td>
								</tr>
								<tr>
									<th style="width: 195px"><span class="red_tip">*</span>合同号：</th>
									<td><input class="form-control" data-val="true"
										data-val-length="长度<50" data-val-length-max="50"
										data-val-required="*" id="contractNoUpd" name="contractNoUpd"
										type="text" value="" placeholder="请输入合同号" maxlength="50" onblur="trim(this);"></td>

								</tr>
								<tr>
									<th style="width: 195px"><span class="red_tip">*</span>合同名称：</th>
									<td><input class="form-control" data-val="true"
										data-val-length="长度<50" data-val-length-max="50"
										data-val-required="*" id="contractNameUpd"
										name="contractNameUpd" type="text" value=""
										placeholder="请输入合同名称" maxlength="50" onblur="trim(this);"></td>
								</tr>
								<tr>
									<th style="width: 195px"><span class="red_tip">*</span>合同金额（万美元）：</th>
									<td><input class="form-control" data-val="true"
										data-val-length="长度<50" data-val-length-max="50"
										data-val-required="*" id="contractMoneyUpd"
										name="contractMoneyUpd" type="text" value=""
										placeholder="请输入合同金额（万美元）只允许为数字" onkeyup="value=value.replace(/[^0-9]/g,'')"
										onblur="delZero(this);" maxlength="9" style="ime-mode:disabled" value="0"></td>
								</tr>
								<tr>
									<th style="width: 195px"><span class="red_tip">*</span>实际出口额（万美元）：</th>
									<td><input class="form-control" data-val="true"
										data-val-length="长度<50" data-val-length-max="50"
										data-val-required="*" id="exportVolumeUpd"
										name="exportVolumeUpd" type="text" value=""
										placeholder="请输入实际出口额（万美元）只允许为数字" onkeyup="value=value.replace(/[^0-9]/g,'')"
										onblur="delZero(this);" maxlength="9" style="ime-mode:disabled" value="0"></td>
								</tr>	
								<tr>
									<th>备注：</th>
									<td><input class="form-control" data-val="true"
										data-val-length="长度<50" data-val-length-max="50"
										data-val-required="*" id="remarksUpd" name="remarksUpd"
										type="text" value="" placeholder="请输入备注(最多15个字)" maxlength="15" onblur="trim(this);"></td>
								</tr>
							</tbody>		
						</table>
					</div>
					<input id="cerid" name="cerid" type="hidden" value="">						
				</div>
				<div class="modal-footer">
					<button id="EduButton" type="button" class="btn btn-success"
						onclick="updateCon()">确认</button>
					<button type="button" class="btn btn-default" onclick="Clear()"
						data-dismiss="modal">关闭</button>
				</div>
<script type="text/javascript" src="shyl/js/jquery.validate.js"></script>
	<script src="shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
	<script src="shyl/fileupload/js/jquery.fileupload.js"></script>
	<script src="shyl/fileupload/js/jquery.fileupload-process.js"></script>
	<script src="shyl/fileupload/js/jquery.fileupload-validate.js"></script>
	<script src="shyl/fileupload/js/jquery.iframe-transport.js"></script>
	<script type="text/javascript" src="shyl/js/jquery.tips.js"></script>
			</div>
		</div>
	</div>
	<!-- 修改合同模态框结束-->
	<!--上传文件模态框开始-->
				<script src="shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
				<script src="shyl/fileupload/js/jquery.fileupload.js"></script>
				<script src="shyl/fileupload/js/jquery.fileupload-process.js"></script>
				<script src="shyl/fileupload/js/jquery.fileupload-validate.js"></script>
				<script src="shyl/fileupload/js/jquery.iframe-transport.js"></script>
	<!--上传文件模态框结束-->
	<!-- 删除合同模态框开始 -->
	<div class="modal fade in" id="deledu" role="dialog"
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
						onclick="Delete()">确认</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<input type="hidden" value="" id="delectinfoid">
				</div>
			</div>
		</div>
	</div>
	<!-- 删除合同模态框框结束 -->
	<!-- 提示上传信息模态框（Modal）开始 -->
	<div class="modal fade in" id="promptModal" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">上传文件温馨提示</h4>
				</div>
				<div class="modal-body">
					支持的文件<font color="red">小于1MB</font><br /> 支持的文件格式为<font color="red">.jpg、.png、.jpeg、.gif</font><br />
					<br />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 提示上传信息模态框（Modal）结束 -->
	<div class='modal my-modal-alert' id='my-modal-success-alert'>
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:260px;text-align:center;position:fixed;right:40%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/mark.png">&nbsp;&nbsp;预览文件不存在!
                    </div>
                </div>
            </div>
        </div>
<!--批量上传合同文件开始 -->
        <div class="modal fade in" id="certificateUploadDialog" role="dialog"
		aria-labelledby="adoptModal" aria-hidden="false">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						 合同上传<small> </small>
					</h4>
				</div>
				<form class="form-horizontal" role="form" action="" method="post"
					id="form1" name="form1">
					<span id="file_uploadCon"
						class="btn btn-primary fileinput-button"
						style="margin-top: 20px; margin-left: 50px"><span>+上传文件</span>
						<input type="file" id="file_uploadCon" name="file_uploadCon" multiple /></span>
						<span
						style="font-size: 12px; color: red; padding-left: 50px; display: inline-block; height: 30px; vertical-align: bottom;">
							<label>※可以上传多个文件，文件格式为.pdf</label>
					</span>
					<table class="table"
						style="margin-top: 20px;margin-left:40px; width: 90%; max-width:90%; margin-bottom: 20px;">
						<thead>
							<tr>
								<th style="width: 150px; text-align:center;">合同名</th>
								<th style="width: 100px; text-align:center;">操作</th>
							</tr>
						</thead>
					</table>
					<div style="overflow-x:hidden; overflow-y: auto; height: 350px;">
					<table class="table"
						style="margin-left:40px;width: 90%; max-width: 90%; margin-bottom: 20px;">
						<tbody id="filesId">
							<c:choose>
								<c:when test="${not empty filesList}">
									<c:forEach items="${filesList}" var="file" varStatus="vs">
										<tr>
											<td
												style="width: 150px; text-align: center; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" title="${file.file_name}">${file.file_name}</td>
											<td style="width: 100px; text-align: center;"><input
												type="hidden" id="pdf${file.id}" value="${file.file_path}">
												<a id="pdfView${file.id}" href='javascript:void(0);'
												target='_blank' onclick="return viewPdf(${file.id});"
												class='zview'>预览</a><a id="pdfDelete"
												onclick="delFile(${file.id});" class="delete">删除</a></td>
										<tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="2" style="text-align: center;"><span
											style="color: #ff6a00">没有相关记录</span></td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					</div>
					<div class="modal-footer">
						<button id="button" type="button" class="btn btn-success"
													data-dismiss="modal">确认</button>
						<button type="button" class="btn btn-default" onclick="Clear()"
													data-dismiss="modal">关闭</button>
					</div>
				
										</form>
			</div>
		</div>
	</div>
	<!--批量上传合同文件结束 -->
	    <div class='modal my-modal-alert' id='my-modal-errorfile-alert'>
		<div class='modal-dialog boxBodySmall'>
			<div class='modal-content'
				style="width: 260px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
				<div class='modal-body' id='modal-body-alert'>
					<img alt="" src="<%=basePath%>shyl/images/mark.png">&nbsp;&nbsp;预览文件不存在!
				</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<jsp:include page="../../common/govCatalog.jsp"></jsp:include>
	<script type="text/javascript">
	 function OK(url) {
		 if(checkMoney(document.getElementById('support_capital'))){
<%-- 		 $("#form").attr('action','<%=basePath%>govUploadCommon/toNextPage.act'); --%>

		 $("#form").submit();
		 }
	 }
	// 文本框失去焦点后
	function checkMoney(obj) {

		var support_capital = $("#support_capital").val();
		var reg=/^(?!0+(?:\.0+)?$)(?:[1-9]\d*|0)(?:\.\d{1,4})?$/;
		var PsdFilter = /^\d{0,5}(\.\d{0,4})?$/;
		if (support_capital != null || support_capital != '') {
			if (!reg.test(support_capital)) {
				$("#support_capital").tips({
					side : 2,
					msg : '申请金额必须大于0且小数位数不超过4位！',
					bg : '#AE81FF',
					time : 3
				});
				$("#support_capital").focus();
				return false;
			}
		}
		if (!(PsdFilter.test(support_capital))) {
			$("#support_capital").tips({
				side : 2,
				msg : '申请扶持金额最大值不能超过99999.9999',
				bg : '#AE81FF',
				time : 3
			});
			$("#support_capital").focus();
			return false;
		}
		changeFloat(obj, '0.0000', 4);
		return true;
	}
	</script>
</body>
</html>
