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
<title>企业变更状况_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">
<link rel="stylesheet" href="shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/styleRegist.css">
<jsp:include page="../../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet"
	href="shyl/fileupload/css/jquery.fileupload-ui.css">
<link rel="stylesheet" href="shyl/css/font-awesome.css">
<link rel="stylesheet" href="shyl/css/non-responsive.css">
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<style>
.progress {
    padding: 1px;
    width: 220px;
    height: 11px;
    overflow: hidden;
    border: 1px solid #428bca;
    -webkit-border-radius: 6px;
    margin-bottom: 0px;
    border-radius: 6px;
    display:none;
    float:left;
}
.bar {
    height: 11px;
    border-radius: 6px;
    -webkit-border-radius: 6px;
    background: #428bca;
    color: #ffffff;
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 12px;
    padding: 0px;
    line-height: 11px;
    text-align: center;
}
.bar-error{
  width:100%;
  background:#f44336;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param
				value="2" name="menuType" /></jsp:include>
				<form class="form-horizontal" role="form" id="docForm"
								name="docForm" action="" method="post">
								<input type="hidden" value="${pd.info_id}" id="info_id" name="info_id">
								<input type="hidden" name="user_id" value="${pd.user_id}">
								<input type="hidden" id="methodUrl" value="<%=basePath%>">										
								<input type="hidden" name="toPage" value="${pageMap.toPage}">
		<div class="mypage_right">
			<h2 style="float:none"><img id="catalogTree" src="<%=basePath%>/shyl/images/catalog.png" style="margin-bottom: 5px;"/>企业变更情况</h2>
			<div>
			<ul><li>
					<span id="file_upload"
						class="btn btn-primary fileinput-button"
						style="margin-top: 20px; margin-left: 30px"><span>+上传变更情况</span>
						<input type="file" id="file_upload" name="file_upload" multiple /></span>
					<span
						style="font-size: 12px; color: red; padding-left: 50px; display: inline-block; height: 30px; vertical-align: bottom;">
							<label>※可以上传多个文件，文件格式为.pdf</label></span>
							</li></ul>
			</div>
			<div style=" height: 20px;margin-bottom: 10px;">
						<div id="progress" class="progress" style="float: left;margin-top: 10px; margin-left: 28px;">
							<div class="bar" style="width: 0%;"></div>
						</div>
					</div>
			<div id="files" class="col-sm-10">
				<table class="tableclass" style="margin-left: 15px">
					<thead>
						<tr>
							<th style="width: 500px; text-align: center;">企业变更文件名</th>
							<th style="width: 200px; text-align: center;">操作</th>
						</tr>
					</thead>
					<tbody id="fileID">
						<c:choose>
							<c:when test="${not empty filetlist}">
								<c:forEach items="${filetlist}" var="var" varStatus="vs">
									<tr>
										<c:choose>
											<c:when test="${fn:length(var.file_info_name) >30}">
												<td title="${var.file_info_name}"
													style="width: 140px; text-align: center">${fn:substring(var.file_info_name,0, 30)}...</td>
											</c:when>
											<c:otherwise>
												<td title="${var.file_info_name}"
													style="width: 140px; text-align: center;">${var.file_info_name}</td>
											</c:otherwise>
										</c:choose>
										<input type="hidden" value="${var.id}"/>
										<td style="text-align: center;">
										<a class="zview"
											id="view${var.id}" href="javascript:void(0);" target="_blank"
											onclick="return view(view${var.id},${var.id})">预览</a>
										<a data-toggle='modal'
											data-target='#delComAlterFile' class="delete"
											onclick="delComAlterFile(${var.id})">删除</a> </td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="2" style="text-align: center;"><span style="color: #ff6a00">没有相关记录</span></td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
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
					<a onclick="GO('${pageMap.fromPage}');"
						class="btn btn-default btn-block"><span
						class="glyphicon glyphicon-circle-arrow-left"></span>&nbsp;&nbsp;上一步</a>
				</div>
			</div>
		</div>
		</form>
	</div>
	<script type="text/javascript">
	 function OK(url) {
		 $("#docForm").attr('action','<%=basePath%>platform/toNextPage.act');
			$("#docForm").submit();
	    }
	 // 返回
    function GO(url) {
    	location.href =  '<%=basePath%>'+url+'?&info_id='+$("#info_id").val();
    }
	 </script>
	<!-- 删除企业信息变更情况模态框开始 -->
	<div class="modal_h20 modal fade bs-example-modal-sm in" id="delComAlterFile" data-toggle="modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="false" data-target="">
	<div class="modal-dialog modal-sm">
	   <div class="modal-content">
	       <div class="modal-header">
	           <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
	           <h4 class="modal-title" id="myModalLabel">提示</h4>
	       </div>
	       <div class="modal-body">
	           <p id="warntext">您确定要删除吗？删除后不可恢复！！</p>
	       </div>
				<div class="modal-footer">
					<button id="EduButton" type="button" class="btn btn-success"
						onclick="deleteUploadComAlterFile()">确认</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<input type="hidden" value="" id="delectAltid">
				</div>
			</div>
		</div>
	</div>
	<!-- 删除企业信息变更情况模态框结束-->
	<div class='modal my-modal-alert' id='my-modal-success-alert'>
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
	<script
		src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
	<script
		src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
	<script
		src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
	<script
		src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
		<script type="text/javascript"
		src="<%=basePath%>shyl/js/jquery.tips.js"></script>
		<script src="shyl/js/images/apply/companyAlteration.js" type="text/javascript"></script>
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<jsp:include page="../../common/govCatalog.jsp"></jsp:include>
</body>
</html>
