<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>需求管理_济南市服务外包公共服务平台</title>
<jsp:include page="../../common/header.jsp"><jsp:param
		name="id" value="" /></jsp:include>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<script src="js/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/jquery-1.7.1.js"></script>
<script src="<%=basePath%>shyl/js/jquery.min.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
<style type="text/css">
table{  
    table-layout:fixed; 
}  
.tds a{  
    width:100%;  
    word-break:keep-all;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
}
.tds {  
    width:100%;  
    word-break:keep-all;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
}
</style>
<!--[if lt IE 9]>
<script type="text/javascript" src="/SHYL/shyl/js/html5shiv.min.js"></script>
<script type="text/javascript" src="/SHYL/shyl/js/respond.min.js"></script>
<![endif]-->
</head>
<body style="background-color: #f7f7f7;">
	<div class="clear"></div>
	<form action="<%=basePath%>platform/bidCompanyList.act" method="post" name="Form" id="Form">
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param
				value="7" name="menuType" /></jsp:include>
		<div class="mypage_right">
			<h2>需求管理</h2>
			<input type="hidden" name='projectId' value="${pd.project_id}"/>
			<input type="hidden" id="flagRequirement" value="${pd.flag}"/>
			<div class="tab" style="margin-bottom: 0;">
				<c:if test="${pd.projectId != null}">
					<a id="bid" href="javascript:void(0);" onclick="updateStatus('0',${pd.project_id})" class="more">&nbsp;&nbsp;中标</a>
				</c:if>
				<c:if test="${pd.personnelId != null}">
					<a id="bid" href="javascript:void(0);" onclick="updateStatus('1',${pd.personnel_id})" class="more">&nbsp;&nbsp;中标</a>
				</c:if>
			</div>
			<div class="jianli">
				<table class="tableclass">
					<thead>
						<tr>
							<th style="width: 3%; text-align: center;"></th>
							<th style="text-align: left; width: 25%;">竞标企业</th>
							<th style="text-align: center; width: 12%;">联系人</th>
							<th style="text-align: center; width: 15%;">电话</th>
							<th style="text-align: left; width: 25%;">邮箱</th>
							
							<th style="text-align: center; width: 10%;">竞标方案</th>
							<th style="text-align: center; width: 10%;">中标状态</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty companyList}">
								<c:forEach items="${companyList}" var="var" varStatus="vs">
									<tr>
										<c:if test="${var.BID_STATUS == '1'}">
											<td style="text-align: center;"><input type="hidden"
												id="bid_status" value="${var.BID_STATUS}" /> <input
												type="radio" name='ids' id='ids'
												value="${var.BID_COMPANY_ID}" checked="checked"
												onclick="checkStatus(${var.BID_STATUS})" /></td>
										</c:if>
										<c:if test="${var.BID_STATUS != '1'}">
											<td style="text-align: center;"><input type="radio"
												name='ids' id='ids' value="${var.BID_COMPANY_ID}" /></td>
										</c:if>
										<td style="width: 25%; text-align: left;overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
											<a title="${var.BID_COMPANY_NAME}"
											href="<%=basePath%>company/info.act?companyId=${var.BID_COMPANY_ID}">${var.BID_COMPANY_NAME}
											</a>
										</td>
										<td class="tds" style="width: 12%; text-align: center;">${var.CONTACT}</td>
										<td style="width: 15%; text-align: center;">${var.CONTACT_TEL}</td>
										<td class="tds" style="width: 25%; text-align: left;">${var.EMAIL}</td>
										

										<td style="width: 10%; text-align: center;"><a
											href="javascript:showDetail('${vs.index}','${var.APPENDIX_NAME}', '${var.APPENDIX_PATH}')">查看</a>
											
										<input type="hidden" id='id${vs.index}' value="${var.DETAIL_DESCRIPTION }"/>	
										
										</td>
										<td style="width: 10%; text-align: center;">${var.VALUE}</td>
									</tr>
									<input type="hidden" id="description"
										value="${var.DETAIL_DESCRIPTION}" />
									<tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="7" style="text-align:center;">
									<span style="color: #ff6a00">没有相关数据</span></td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<div class="page-header position-relative">
				<table style="width: 100%;">
					<tr>
						<td style="align: center;" align="center"><div
								class="pagination"
								style="padding-top: 15px; margin: 0 auto; font-size: 12px; display: inline-block;">${page.platformPageStr}</div></td>
					</tr>
				</table>
			</div>
			<div class="col-sm-2" style="float: right; margin-right: 15px;">
				<a onclick="GOPER();" class="btn btn-default btn-block"><span
					class="glyphicon glyphicon-circle-arrow-left"></span>&nbsp;&nbsp;返回</a>
			</div>
		</div>
	</div>
	</form>
	<div class="clear"></div>
	<div class="modal_h20 fade in" id="wtht" role="dialog"
		aria-labelledby="adoptModal" aria-hidden="false"
		data-backdrop="static">
		  <div class='modal my-modal-alert' id='my-modal-down-alert'>
	        <div class='modal-dialog boxBodySmall'>
	            <div class='modal-content'
	                style="width: 300px; text-align: center; position: fixed; right: 40%; bottom: 60%;">
	                <div class='modal-body' id='modal-body-alert'>
	                    <img alt="" src="<%=basePath%>shyl/images/mark.png">&nbsp;&nbsp;没有文件可供下载。
	                </div>
	            </div>
	        </div>
      </div>
		<div class="modal-dialog modal-lg" id="aaa">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						竞标方案<small> </small>
					</h4>
				</div>

				<form class="form-horizontal" role="form" action="" method="post"
					id="form1" name="form1">
					<table class="table">
						<tbody>
							<tr>
								<th style="text-align:right; width: 90px;">竞标方案：</th>
									<td><textarea
										style=" width: 90%; padding-left: 5px; background-color: #ecf0f9; border: 0; border-radius: 5px; font-size: 0.85em; resize: none !important;"
										rows="4" maxlength="500" id="introduction" name="introduction" disabled="disabled"></textarea></td>	</tr>
							<tr>
								<th style="text-align:right;">附件：</th>
								<td>
									<div class="row">
										<div class="col-md-12">
											<div>
												<div class="form-group">
													<div class="col-sm-12">
														<button id="file_download" onclick="dounfile();return false;"
															class="btn btn-primary fileinput-button" style="">下载附件
														</button>
														<input type="hidden" id="filepath"
															value="${pd.appendix_path}"> <input type="hidden"
															id="filename" value="${pd.appendix_name}">

													</div>
													<div class="col-sm-5" style="margin-left: 7%">
														<div class="caption" align="center" style="width: 100px;">
														</div>
													</div>
													<input
														style="border:0;height: 0.1px; width: 0px; padding: 0px; margin: 0px; position: absolute;"
														id="apply_report_path" name="apply_report_path"
														type="text" value="" /> <input
														style="border:0;height: 0.1px; width: 0px; padding: 0px; margin: 0px; position: absolute;"
														id="apply_report_name" name="apply_report_name"
														type="text" value="" />
												</div>
											</div>
										</div>
									</div> <input type="hidden" value="" id="PERSONNEL_ID"> <input
									type="hidden" value="" id="PROJECT_ID">
							</tr>
						</tbody>
					</table>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" onclick="Clear()">关闭</button>
					</div>
				</form>
			</div>
		</div>
		<form class="form-horizontal" action="" method="post" id="listForm"
			name="listForm"></form>
		<script type="text/javascript">
                            function Clear(){
                                $('#wtht').modal('hide');
                            }
                            function dounfile(){
                                var filename=$("#filename").val();
                                var filepath=$("#filepath").val();
                                $.ajax({
                                    type : "POST",
                                    url : '<%=basePath%>requirementdetail/downfile.act',
                                    data : {filepath:filepath},
                                    dataType : 'json',
                                    cache : false,
                                    success : function(data) {
                                            if(data.responseStr=="OK"){
                                                $("#listForm").attr("action","<%=basePath%>requirementdetail/download.act?fileName=" + filename + "&filePath=" + filepath);
                                                $("#listForm").submit();
                                            }else{
                                            	$('#my-modal-down-alert').show().delay(1000).fadeOut ();
                                            }
                                        },
                                    error: function(data){
                                    	$('#my-modal-down-alert').show().delay(1000).fadeOut ();
                                    }
                                });
                            }
                            </script>
	</div>
	<!--<footer开始>-->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!--</footer结束>-->
	<script type="text/javascript">
    $(document).ready(function(){
    	if ($('#bid_status').val() != null) {
    		$('#bid').hide();
    	}
	}); 
 	// 返回
    function GOPER() {
 		var flag = $("#flagRequirement").val();
 		// 项目需求
 		if(flag=="0"){
 			location.href = '<%=basePath%>requirement/toProjectRequirement.act';
 		}else{
 			// 人员需求
 			location.href = '<%=basePath%>requirement/toPersonalRequirement.act';
 		}
	}
    function updateStatus(flag,id){
        var str = '';
        for(var i=0;i < document.getElementsByName('ids').length;i++)
        {
              if(document.getElementsByName('ids')[i].checked){
                str = document.getElementsByName('ids')[i].value;
              }
        }

        if(str == ""){
            $("#ids").tips({
                side : 2,
                msg : "请选择一条中标企业",
                bg : '#AE81FF',
                time : 3
            });
            $("#ids").focus();
            return false;
        }
        //验证
        $.ajax({
            type : "POST",
            url : '<%=basePath%>platform/updateStatus.act',
            data : {info_id:str, flag:flag},
            dataType : 'json',
            cache : false,
            async: false,
            success : function(data) {
            	window.location.reload();
            }
        });
    }
    function showDetail(index,name,path){
    	$('#wtht').modal('show');
    	$('#introduction').text($('#id' + index).val());
    	$('#filename').val(name);
    	$('#filepath').val(path);
    }
</script>
</body>
</html>
