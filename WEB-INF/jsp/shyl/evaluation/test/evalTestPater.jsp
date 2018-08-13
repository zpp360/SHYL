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
<title>${pd.name}_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">
<jsp:include page="../../common/header.jsp"><jsp:param name="id" value="cp" /></jsp:include>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<link rel="stylesheet" href="shyl/css/bootstrap.css">
<link href="shyl/css/question/css/style.css" rel="stylesheet">
<link href="shyl/css/question/bootstrap/css/bootstrap-huan1.css"
	rel="stylesheet">
<link href="shyl/css/question/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="shyl/css/question/css/exam1.css" rel="stylesheet"
	type="text/css">
</head>
<body style="background: #f7f7f7;">
	<div class="content" style="margin-top: 110px;">
		<div class="container" style="width: 1100px; max-width: 1100px">
			<div class="row">
				<div class="col-xs-3"
					style="padding-right: 0px; padding-bottom: 15px;">
					<div class="def-bk" id="bk-exam-control"
						style="width: 282px; border: border: 1px solid #e3e3e3; background: #fff">

						<div class="def-bk-content" id="exam-control"
							style="width: 282px; border: border: 1px solid #e3e3e3; background: #fff">

							<div id="question-time" class="question-time-normal">
								<div style="height: 140px; text-align: center;">
									<i id="time-icon" class="fa fa-clock-o"> </i>
								</div>
								<span style="margin-right: 10px; color: #B8B8B8;">已用时</span> <span
									id="exam-clock">&nbsp;</span>
								<h2 id="exam-timestamp" style="display: none;">${pd.duration*60}</h2>
								<div id="answer-save-info"></div>

							</div>
							<div id="question-submit">
								<button onclick="logint()"
									class="btn-success btn"
									style="width: 100%; background: #12b901; border-radius: 5px; padding: 10px 20px; border: none; color: #fff; font-size: 16px; margin-top: 20px;">
									我要交卷</button>
							</div>
							<div id="exam-info" style="display: none;">
							</div>
						</div>

					</div>

				</div>
				<div class="col-xs-9" style="padding-right: 0px;">
					<div class="def-bk" id="bk-exampaper">

						<div class="expand-bk-content" id="bk-conent-exampaper"
							style="width: 792px; margin-left: 20px; padding: 40px">
							<div id="exampaper-header">
								<div id="exampaper-title">
									<c:choose>
										<c:when test="${fn:length(pd.name)>35}">
											<p id="exampaper-title-name" title="${pd.name}">${fn:substring(pd.name,0,35)}...</p>
										</c:when>
										<c:otherwise>
											<p id="exampaper-title-name" title="${pd.name}">${pd.name}</p>
										</c:otherwise>
									</c:choose>
									<span style="display: none;" id="exampaper-id">${pd.id}</span>
								</div>
								<div id="exampaper-desc-container">
									<div id="exampaper-desc" class="exampaper-filter"></div>
								</div>
							</div>
							<input type="hidden" id="hist-id" value="${pd.id}"> 
							<input type="hidden" id="methodurl" value="<%=basePath%>"> 
							<input type="hidden" id="userid" value="${pd.USER_ID}"> 
							<input type="hidden" id="usertype" value="${pd.usertype}">
							<input type="hidden" id="paper-id" value="${pd.id}">
							<ul id="exampaper-body">${htmlStr}</ul>
							<div id="exampaper-footer">
								<div id="question-navi">
									<div id="question-navi-controller">
										<i class="fa fa-arrow-circle-down"></i> <span>答题卡</span>
									</div>
									<div id="question-navi-content"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div class="clear"></div>
	<!-- 确认交卷开始-->
	<div class="modal fade bs-example-modal-sm" id="confirmDialog"
		role="dialog" aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm" style="margin-top: 250px">
			<div class="modal-content" style="width: 410px">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="mySmallModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<div class="modal-body"
						style="width: 410px; height: 60px; padding-top: 0px">
						<h4>您确定要交卷吗？交卷后本次测评结束！！</h4>
						<br> <br>
					</div>
					<div class="modal-footer" style="height: 40px" id="testPaperSubmit">
						<button id="EduButton" type="button" class="btn btn-success"
							data-dismiss="modal">确认</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 确认交卷结束-->
		<div class="modal fade bs-example-modal-sm" id="layhomewarn"
		role="dialog" aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm" style="margin-top: 250px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="mySmallModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<input type="hidden" value="" id="startid" name="startid">
					请登录后操作！点此&nbsp;<a style="cursor: pointer;"
						href="<%=basePath%>userLogin/goLogin.act?returnUrl=evaluation/evaluationStartTesting.act?id=${pd.id}">
						<b style="text-decoration: underline; color: #0a7295;">登录</b>
					</a>
				</div>
			</div>
		</div>
	</div>
		<!-- 无权访问开始 -->
	<div class="modal fade bs-example-modal-sm" id="wqfw" role="dialog"
		aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm" style="margin-top: 250px">
			<div class="modal-content" style="width: 410px">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="mySmallModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<div class="modal-body"
						style="width: 410px; height: 60px; padding-top: 0px">
						<h4>您无权限进行操作，请以个人用户登录！！</h4>
						<br> <br>
					</div>
					<div class="modal-footer" style="height: 40px" id="testPaperSubmit">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 无权访问结束 -->
	<!--<footer开始>-->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!--</footer结束>-->
	<!-- jQuery -->
		<script type="text/javascript"
		src="shyl/js/question/jquery/jquery-1.9.0.min.js"></script>
	<script type="text/javascript"
		src="shyl/js/question/bootstrap/js/bootstrap.min.js"></script>

	<!--         Bootstrap JS -->
	<script type="text/javascript" src="shyl/js/question/all.js?v=0712"></script>
	<script type="text/javascript" src="shyl/js/question/paper-examing.js"></script>
	 <script type="text/javascript">
        function logint(){
        var userid = $('#userid').val();
        var usertype = $('#usertype').val();
        if(userid==""){
        	$("#layhomewarn").modal('show');
        }else if(usertype==1){
        	$("#confirmDialog").modal('show');
    	}else{
    		    $('#wqfw').modal('show');
    		 }
        }
        </script>
</body>
</html>
