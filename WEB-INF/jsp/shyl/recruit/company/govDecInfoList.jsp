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
<style type="text/css">
table{  
    table-layout:fixed; 
}  
.tds {  
    width:100%;  
    word-break:keep-all;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
}
</style>
<head>
<title>申报资料管理-济南市服务外包平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../common/header.jsp"%>
<base href="<%=basePath%>">
<link rel="stylesheet" href="<%=basePath%>shyl/css/maincss/mypage.css" />
<!--分页  -->
<script type="text/javascript" src="<%=basePath%>shyl/js/common/head.js"></script>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/styleRegist.css"> 
<link rel="stylesheet" href="<%=basePath%>shyl/css/maincss/showLoading.css"> 
<script src="js/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
</head>

<body style="background-color: #f7f7f7;" id="top">
<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<!-- start -->
        <div class='modal my-modal-alert' id='my-modal-success-alert'>
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:200px;text-align:center;position:fixed;right:40%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;生成PDF成功!
                    </div>
                </div>
            </div>
        </div>
        
        <div class='modal my-modal-alert' id='my-modal-failure-alert'>
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:200px;text-align:center;position:fixed;right:40%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/fail.png">&nbsp;&nbsp;生成PDF失败!
                    </div>
                </div>
            </div>
        </div>
        
        <div class='modal my-modal-alert' id='my-modal-imperfect-alert'>
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:300px;text-align:center;position:fixed;right:40%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/mark.png">&nbsp;&nbsp;请完善信息后，再生成PDF!
                    </div>
                </div>
            </div>
        </div>
        <div class='modal my-modal-alert' id='my-modal-view-alert'>
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:300px;text-align:center;position:fixed;right:40%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/mark.png">&nbsp;&nbsp;请生成PDF文件后，再预览!
                    </div>
                </div>
            </div>
        </div>
        <div class='modal my-modal-alert' id='my-modal-view-alerts'>
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:300px;text-align:center;position:fixed;right:40%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/mark.png">&nbsp;&nbsp;请生成PDF文件后，再上报!
                    </div>
                </div>
            </div>
        </div>
        <div class='modal my-modal-alert' id='my-modal-down-alert'>
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:300px;text-align:center;position:fixed;right:40%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/mark.png">&nbsp;&nbsp;请生成PDF文件后，再下载!
                    </div>
                </div>
            </div>
        </div>
        
        <div class='modal my-modal-alert' id='my-modal-report-alert'>
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:300px;text-align:center;position:fixed;right:40%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/mark.png">&nbsp;&nbsp;该资料已复审通过，无需再上报!
                    </div>
                </div>
            </div>
        </div>
        <div class='modal my-modal-alert' id='my-modal-createPdf-alert'>
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:300px;text-align:center;position:fixed;right:40%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/mark.png">&nbsp;&nbsp;该资料已复审通过，无需再生成PDF!
                    </div>
                </div>
            </div>
        </div>
        <div class='modal my-modal-alert' id='my-modal-report-not-approved-alert'>
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:400px;text-align:center;position:fixed;right:40%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/mark.png">&nbsp;&nbsp;第一次上报的还未初审，请勿重复上报!
                    </div>
                </div>
            </div>
        </div>
        <div class='modal my-modal-alert' id='my-modal-report-final-not-approved-alert'>
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:400px;text-align:center;position:fixed;right:40%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/mark.png">&nbsp;&nbsp;市商务局还未审批，请勿重复上报!
                    </div>
                </div>
            </div>
        </div>
        <div class='modal my-modal-alert' id='my-modal-report-exist-alert'>
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:500px;text-align:center;position:fixed;right:30%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/mark.png">&nbsp;&nbsp;该年度的申报资料已经存在，若要操作，请点击修改!
                    </div>
                </div>
            </div>
        </div>

		<div class='modal my-modal-alert' id='my-modal-license-alert'>
			<div class='modal-dialog boxBodySmall'>
				<div class='modal-content'
					style="width: 300px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
					<div class='modal-body' id='modal-body-alert'>
						<img alt="" src="<%=basePath%>shyl/images/mark.png">&nbsp;&nbsp;请在企业信息中上传营业执照扫描件后，再生成PDF!
					</div>
				</div>
			</div>
		</div>
		<div class='modal my-modal-alert' id='my-modal-reset-final-alert'>
			<div class='modal-dialog boxBodySmall'>
				<div class='modal-content'
					style="width: 400px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
					<div class='modal-body' id='modal-body-alert'>
						<img alt="" src="<%=basePath%>shyl/images/fail.png">&nbsp;&nbsp;重置失败，请到企业基本情况画面手动录入!
					</div>
				</div>
			</div>
		</div>
		<div class='modal my-modal-alert' id='my-modal-reset-success-alert'>
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:200px;text-align:center;position:fixed;right:40%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;重置成功!
                    </div>
                </div>
            </div>
        </div>
		<jsp:include page="../../common/left.jsp"><jsp:param value="2" name="menuType"/></jsp:include>
		<div class="mypage_right">
			<h2>政府申报</h2>
			<div>						<span
							style="font-size: 12px; padding-left: 10px;margin-right:100px; display: inline-block; vertical-align: bottom;border:1px solid #d2c7c7;width:86%;">
								<label style="color: red; ">※温馨提示：</label><label style="">申报资料作成前，请先点击【申报操作指南】按钮，下载并详细阅读操作指南后再进行操作。</label><br/>
								<label style="color: red; ">※预览提示：</label><label style="">如果预览文件过大时，建议下载后再预览。</label><br/>
								<label style="color: red; ">※生成PDF提示：</label><label style="">生成PDF前，请务必确保企业信息里已上传营业执照扫描件。</label>
						</span></div>
			<div class="tab">
				<a href="javascript:void(0);" class="more" data-toggle="modal" onclick="reportStatus()" id="reportStatus" style="margin-left:10px;margin-right:50px;">&nbsp;&nbsp;上报</a>
				<a href="javascript:void(0);" class="more" onclick="creatPDF()" id="creatPDF">&nbsp;&nbsp;生成PDF</a>
				<a href="javascript:void(0);" class="more" data-toggle="modal" data-target="#myApply" style="margin-left:10px;margin-right:10px;">+&nbsp;&nbsp;申报资料制作</a>
				<a href="javascript:void(0);" class="more" onclick="downloadNotice();" style="margin-left:10px;margin-right:2px;">&nbsp;&nbsp;申报操作指南</a>
			</div>
			<form class="form-horizontal" action="<%=basePath%>gov/list.act" method="post" id="listForm" name="listForm">
			<input type="hidden" name="user_id" value="${pd.user_id}">
			<input id="business_license" type="hidden" name="business_license" value="${pdCompany.business_license}">
			<input type="hidden" name="toPage" value="${pageMap.toPage}">
			<input type="hidden" name="para" id="para" value="">
			<div class="jianli">
			<table class="tableclass1">
				<thead>
					<tr>
						<th style="width:5%;text-align: left;"></th> 
						<th style="width:5%;text-align: left;">序号</th>
						<th style="width:15%;text-align: left;">申报资料名称</th>
						<th style="width:8%;text-align: center;">申报年度</th>
						<th style="width:8%;text-align: center;">申报级别</th>
						<th style="width:10%;text-align: center;">申报类型</th>
						<th style="width:8%;text-align: center;">状态</th>
						<th style="width:12%;text-align: center">审批结果</th>
						<th style="width:35%;text-align: center;">操作</th>
					</tr>
				</thead>
				<tbody>
					<!-- 开始循环 -->
					<c:choose>
						<c:when test="${not empty varList}">
								<c:forEach items="${varList}" var="var" varStatus="vs">
									<tr onclick="selectCheckbox(this,'${var.examination_result}')">
										<td class="checkbox" style="text-align: center;"><input type='checkbox' name='ids' id='ids' value="${var.info_id}" /><input type='hidden' value="${var.declaration_type}" /></td>
										<td style="text-align: left;">${vs.index+1}</td>
										<td style="text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="${var.declaration_name}">${var.declaration_name}</td>
										<td style="text-align: center;">${var.declaration_year}</td>
										<td style="text-align: center;">${var.declaration_level}</td>
										<td style="text-align: center;">${var.declaration_type}</td>
										<td style="text-align: center;">${var.status}</td>
										<c:choose>
										<c:when test="${var.examination_result=='0'}">
										<td style="text-align: center;"><a id="appro" param="${var.examination_result}" href="javascript:void(0)" data-target="#shenpi" data-toggle="modal" onclick="shenpi1('${var.info_id}')">初审驳回</a></td>
										</c:when>
										<c:when test="${var.examination_result=='1'}">
										<td style="text-align: center;"><a id="appro" param="${var.examination_result}" href="javascript:void(0)" data-target="#shenpi" data-toggle="modal" onclick="shenpi1('${var.info_id}')">初审通过</a></td>
										</c:when>
										<c:when test="${var.examination_result=='2'}">
										<td style="text-align: center;"><a id="appro" param="${var.examination_result}" href="javascript:void(0)" data-target="#shenpi" data-toggle="modal" onclick="shenpi1('${var.info_id}')">复审通过</a></td>
										</c:when>
										<c:when test="${var.examination_result=='3'}">
										<td style="text-align: center;"><a id="appro" param="${var.examination_result}" href="javascript:void(0)" data-target="#shenpi" data-toggle="modal" onclick="shenpi1('${var.info_id}')">复审驳回</a></td>
										</c:when>
										<c:when test="${var.examination_result=='4'}">
										<td style="text-align: center;"><a id="appro" param="${var.examination_result}" href="javascript:void(0)" data-target="#shenpi" data-toggle="modal" onclick="shenpi1('${var.info_id}')">初审驳回再上报</a></td>
										</c:when>
										<c:when test="${var.examination_result=='5'}">
										<td style="text-align: center;"><a id="appro" param="${var.examination_result}" href="javascript:void(0)" data-target="#shenpi" data-toggle="modal" onclick="shenpi1('${var.info_id}')">复审驳回再上报</a></td>
										</c:when>
										<c:when test="${var.examination_result=='6'}">
										<td style="text-align: center;"><a id="appro" param="${var.examination_result}">待审批</a></td>
										</c:when>
										<c:when test="${var.examination_result=='7'}">
										<td style="text-align: center;"><a id="appro" param="${var.examination_result}">待上报</a></td>
										</c:when>
										</c:choose>
										<td >
											<a class='zview' id="view${vs.index+1}" title="${var.declaration_filename}" href="javascript:void(0);"
													onclick="return view('view${vs.index+1}','${var.info_id}');" target="_blank" >&nbsp;预览</a>
											<a class='zdown'  href="javascript:void(0);" title="下载PDF" onclick="downloadFile('${var.info_id}');">&nbsp;下载</a>
											<c:if test="${var.examination_result != '2'}">
								 				<c:choose>
													<c:when test="${var.declaration_level== '国家级'}">
											 		<a class='modify' href="<%=basePath%>gov/toApply.act?info_id=${var.info_id}&level=1">&nbsp;修改</a>
													</c:when>
													<c:otherwise>
													<a class='modify' href="<%=basePath%>gov/toApply.act?info_id=${var.info_id}&level=2">&nbsp;修改</a>
													</c:otherwise>
												</c:choose>
											</c:if>
											<c:if test="${var.statusType == '0'}">
												<a class="delete" style="cursor:pointer;" data-toggle="modal" title="删除申报资料" id="deldec_${var.info_id}" onclick="del(${var.info_id},'deldec_${var.info_id}');" data-target="#deldec">删除</a>
											</c:if>
										</td>
									</tr>
								</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="9" style="text-align: center;">
									<span style="color: #ff6a00">没有相关数据</span>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			</div>
		</form>
			<!-- 分页开始 -->
			<div class="page-header position-relative">
				<table style="width: 100%;">
					<tr><td style="align: center;" align="center"><div class="pagination"
								style="padding-top: 0px; margin:0 auto;  display: inline-block;">${page.platformPageStr}</div></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
	
	<div class="modal fade" id="myApply" tabindex="-1" role="dialog" aria-labelledby="myApply" 
		aria-hidden="true" data-backdrop="static">
		<form class="form-horizontal" role="form" id="docForm" name="docForm" action="" method="post" >			
   		 	<div class="modal-dialog modal-lg">
	        	<div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" onclick="Clear()"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		                <h4 class="modal-title" id="myModalLabel">申请</h4>
		            </div>
		            <div class="modal-body">
			            <div class="form-group" style="height:35px;margin-top:10px;">
			                <label class="col-sm-2" id="level" style="margin-left:30px;float:left;">级别：</label>
	                    	<div class="col-sm-6" style="float:left;">
				                <select class="form-control  input-sm" id="declaration_level"
									name="declaration_level" style="line-height:40px;height:37px;font-size:14px" onchange="changeLevel(this);">
								 <option value="1" selected>2017年度中央外经贸发展专项资金促进服务贸易创新发展项目</option>
								 <option value="2" selected>2017年度济南市开放型经济发展引导资金项目</option>
								</select>
	                    	</div>
			            </div>
						<div class="form-group" style="height: 30px;">
							<label for="declaration_type" class="col-sm-2 "
								style="margin-left: 30px; float: left;">申报类型：</label>
							<div class="col-sm-6" style="float: left;">
								<select class="form-control" id="declaration_type"
									name="declaration_type">
									<c:if test="${pd.result2=='false' && pd.result1=='success'}">
									<option value="1"  selected="selected">服务外包业务</option>
									<option value="2">技术出口贴息</option>
									</c:if>
									<c:if test="${pd.result1=='false' && pd.result2=='success'}">
									<option value="1">服务外包业务</option>
									<option value="2"  selected="selected">技术出口贴息</option>
									</c:if>
									<c:if test="${(pd.result1=='false' && pd.result2=='false')||(pd.result1=='success' && pd.result2=='success')}">
									<option value="1">服务外包业务</option>
									<option value="2">技术出口贴息</option>
									</c:if>
								</select>
							</div>
						</div>
						<div class="form-group" style="height:30px;">
							<label for="declaration_year" class="col-sm-2 "style="margin-left:30px;float:left;">申报年度：</label>
							<div class="col-sm-6"style="float:left;">
								<select class="form-control" id="declaration_year"
									name="declaration_year">
								</select>
							</div>
						</div>
						 <div class="form-group" style="height:30px;">
							<label for="declaration_name" class="col-sm-2 "style="margin-left:30px;float:left;">申报资料名称：</label>
							<div class="col-sm-6"style="float:left;">
								<input id="declaration_name" type="text" class="form-control" maxlength="127" style="width:94%; padding:0px 0px 0px 15px;" name="declaration_name" placeholder="请输入资料名称" onblur="trim(this);">
							</div>
						</div>
					</div>
		            <div class="modal-footer">
		                <input type="reset" style="display:none;" name="clearData">
		                <button type="button" class="btn btn-success" onclick="confirm()" >确认</button>
		                <button type="button" class="btn btn-default" onclick="Clear()" data-dismiss="modal">关闭</button>
		            </div>
	            </div>
	        </div>
	     </form>
	</div>
	
	<div class="modal_h20 fade bs-example-modal-sm in" id="upreport"
			data-toggle="modal" tabindex="-1" role="dialog"
			aria-labelledby="mySmallModalLabel" aria-hidden="false"
			data-target="">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							onclick="ClearV()">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">提示</h4>
					</div>
					<div class="modal-body">
						<p id="warntext">请确保最新的申报资料PDF已经生成。确认上报该资料吗？</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" onclick="reSta()"
							data-dismiss="modal">确认</button>
						<button type="button" class="btn btn-default"
							data-dismiss="modal" onclick="ClearV()">取消</button>
					</div>
				</div>
			</div>
		</div>
		<div class="modal_h20 fade bs-example-modal-sm in" id="resetInfo"
			data-toggle="modal" tabindex="-1" role="dialog"
			aria-labelledby="mySmallModalLabel" aria-hidden="false"
			data-target="">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							onclick="ClearV()">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">提示</h4>
					</div>
					<div class="modal-body">
						<p id="warntext">请与<span id="resetType"></span>时的企业基本情况一致，是否重置？重置后再次生成PDF文件后上报</p>
					</div>
					<div class="modal-footer">
						<input type="hidden" id="reset_info_id" name="reset_info_id" value="">
						 <button type="button" class="btn btn-success" onclick="resetInfo()"
							data-dismiss="modal">重置</button> 
						<button type="button" class="btn btn-default"
							data-dismiss="modal" onclick="ClearV()">关闭</button>
					</div>
				</div>
			</div>
		</div>
		<div class="modal_h20 fade bs-example-modal-sm in" id="deldec" data-toggle="modal" tabindex="-1" role="dialog"
			aria-labelledby="mySmallModalLabel" aria-hidden="false" data-target="">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" onclick="Clear()">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">提示</h4>
					</div>
					<div class="modal-body">
						<p id="warntext">您确定要删除吗？删除后不可恢复!</p>
					</div>
					<div class="modal-footer">
						<input type="hidden" id="info_id" name="info_id" value="">
						<button type="button" class="btn btn-success" onclick="Delete()" data-dismiss="modal">确认</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade in" id="shenpi" tabindex="-1" role="dialog" aria-labelledby="delresume" aria-hidden="false" data-backdrop="static" data-target="" style="display: none;"><div class="modal-dialog modal-sm">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" onclick="Clear()"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="myModalLabel">审批意见</h4>
        </div>
        <div class="modal-body">
            <span >审批者：</span><span id="approver"></span>
            <span id="warntextshenpi"></span>
        </div>
        <input type="hidden" value="" id="shenpi1">
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        </div>
    </div>
    <script type="text/javascript">
        function shenpi1(id){
        	$.ajax({
    			type : "POST",
    			url :'<%=basePath%>gov/shenpidetail.act',
    			data : {
    				info_id : id
    			},
    			dataType : 'json',
    			cache : false,
    			success : function(data) {
    				$("#approver").html(data.name);
    				$("#warntextshenpi").html(data.approval_opinion);
    				var lengthte=$("#warntextshenpi").find("p").length;
    				for(var i=0;i<lengthte;i++){
    					$($("#warntextshenpi").find("p")[i]).prepend('<span style="color:#7F7F7F;">'+(i+1)+"."+'</span>');
    					$($("#warntextshenpi").find("p")[i]).css({"width":"570px","word-wrap":"break-word","word-break":"normal"});
    				}
    			}
    		});
        }
        </script>
</div>
</div>
	<%@ include file="../../common/footer.jsp"%>

	<script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
	<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.showLoading.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>shyl/js/images/apply/govDecInfoList.js"></script>
	<p id="back-to-top" style="display: block;">
		<a href="#top"><span></span></a>
	</p>
</body>
</html>