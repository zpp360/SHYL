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
<title>测评_济南市服务外包公共服务平台</title>
<jsp:include page="../../common/header.jsp"><jsp:param name="id" value="cp" /></jsp:include>
<base href="<%=basePath%>">
<link href="/SHYL/shyl/css/maincss/fuwu.css" rel="stylesheet"
	type="text/css">
<link href="/SHYL/shyl/css/maincss/rencai.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" href="shyl/css/bootstrap.css">
<script type="text/javascript"
	src="shyl/js/question/jquery/jquery-1.9.0.min.js"></script>
<script type="text/javascript"
	src="shyl/js/question/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		//知识点的选中状态
		var point_id = $("#point_id").val();
		if(point_id=="00"){
			$("#pointAll").addClass("active");
		}else{
			$("#point"+point_id).addClass("active");
		}
	});
//搜索框检相应的测试试卷
function testPaperKensaku() {
	$("#Form").submit();
}
function startTesting(id) {
	//题库ID
	var field_id = $('#field_id').val();
	//知识点ID
	var userid = $('#userid').val();
	//用户类型   1：个人，2：公司，3：培训机构，4：学校，9：管理员
	var usertype = $('#usertype').val();
	//用户不登录的情况，提示用户登录
	if (userid == "") {
		$('#layhomewarn').modal('show');
		$('#startid').val(id);
	} else if(usertype==1){
			 location.href = "<%=basePath%>evaluation/evaluationStartTesting.act?id="+id;
	}else{
		    $('#wqfw').modal('show');
		 }
    }
</script>
<style type="text/css">
div.rc_zw_category dl dd a{
width: 123px;
}
div.rc_zw_category dl dd a:hover, div.rc_zw_category dl dd a.hover {
    color: #ff8a10;
    background-color: #ffffff;
    border: 1px solid #ff8a10;
    }
.rc_zw_category .active {
	border-radius: 5px;
	border: 1px solid #ff8a10;
	color: #ff8a10;
}
</style>
</head>
<body style="background: #f7f7f7;">
	<!--竞标人员内容-->
	<form
		action="<%=basePath%>evaluation/evaluationTestPaperList.act?field_id=${pd.field_id}&point_id=${pd.point_id}"
		method="post" name="Form" id="Form">
		<div class="w1100" style="margin-top: 90px;">
			<div class="tit-name">
				<p>专业知识测试</p>
				<input type="hidden" value="${pd.field_id}" id="field_id"> <input
					type="hidden" value="${pd.point_id}" id="point_id"> <input
					type="hidden" id="userid" value="${pd.userid}"> <input
					type="hidden" id="usertype" value="${pd.user_type}">
			</div>
			<div id="menu_div">
				<div class="rc_qy_paihang clearfix"
					style="width: 1020px; padding: 40px; float: left; margin-top: 20px; border: 1px solid #e3e3e3; background: #fff;">
					<input type="hidden" value="${pd.field_id}" id="field_id">
					<input type="hidden" value="${pd.point_id}" id="point_id">
					<div class="rc_zw_category"
						style="font-size: 15px; color: #666; line-height: 20px; text-indent: 10px;">
						<dl>
							<dd
								style="margin-top: 5px; width: 80px; font-size: 14px; color: #666; border-left: 3px solid #ff8142; height: 20px; line-height: 20px; text-indent: 10px;">知识分类
								:</dd>
							<dd style="width: 930px; float: left">
								<a id="pointAll"
									href="<%=basePath%>evaluation/evaluationTestPaperList.act?field_id=${pd.field_id}&point_id=00">全部</a>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty knowledgePointList}">
										<c:forEach items="${knowledgePointList}" var="var"
											varStatus="vs">
											<c:choose>
												<c:when test="${fn:length(var.point_name)>7}">
													<a id="point${var.point_id}" title="${var.point_name}"
														href="<%=basePath%>evaluation/evaluationTestPaperList.act?field_id=${pd.field_id}&point_id=${var.point_id}">${fn:substring(var.point_name,0, 7)}...</a>
												</c:when>
												<c:otherwise>
													<a id="point${var.point_id}" title="${var.point_name}"
														href="<%=basePath%>evaluation/evaluationTestPaperList.act?field_id=${pd.field_id}&point_id=${var.point_id}">${var.point_name}</a>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:when>
								</c:choose>
							</dd>
						</dl>
						<dl>
							<dd
								style="margin-top: 5px; width: 46px; font-size: 14px; color: #666; border-left: 3px solid #ff8142; height: 20px; line-height: 20px; text-indent: 10px;">搜索
								:</dd>
							<dd style="width: 500px;">
								<input type="text" class="search2" placeholder="请输入查询的试卷名称"
									id="testPaperName" value="${pd.testPaperName}"
									name="testPaperName"
									style="padding-left: 10px; margin-left: 35px"><input
									type="submit" class="searchbtn" value="搜索"
									onclick="testPaperKensaku()"
									style="border-radius: 5px; border: none; background: #016ab9; width: 50px; height: 35px; line-height: 35px; text-align: center; color: #fff;">
							</dd>
						</dl>
					</div>
				</div>
				<div class="bid-cont">
					<!--测评列表开始-->
					<c:choose>
						<c:when test="${not empty testPaperList}">
							<c:forEach items="${testPaperList}" var="var" varStatus="vs">
								<div class="bid-list">
									<c:choose>
										<c:when test="${fn:length(var.name)>50}">
											<p class="bid-list-tit" title="${var.name}">${fn:substring(var.name,0,50)}...</p>
										</c:when>
										<c:otherwise>
											<p class="bid-list-tit" title="${var.name}">${var.name}</p>
										</c:otherwise>
									</c:choose>
									<!--测评时间-->
									<div class="fl">
										<div class="bid-one">
											<p class="one-style">
												${var.duration} <span style="font-size: 14px;">分钟</span>
											</p>
											<p>测评时间</p>
										</div>
									</div>
									<span class="bid-border"></span>
									<!--测评过-->
									<div class="fl">
										<div class="bid-one">
											<p class="one-styles">
												<span>${var.totalPeoples}</span>人
											</p>
											<p>测评过</p>
										</div>
									</div>
									<span class="bid-border"></span>
									<!--题数-->
									<div class="fl">
										<div class="bid-one">
											<p class="one-styles">
												<span>${var.totalTestNum}</span>道题
											</p>
											<p>题数</p>
										</div>
									</div>
									<span class="bid-border"></span>
									<!--类别-->
									<div class="fl">
										<div class="bid-one" style="width: 250px;">
											<p class="one-styles">
												<c:choose>
													<c:when test="${fn:length(var.point_name)>7}">
														<span title="${var.point_name}">${fn:substring(var.point_name,0, 7)}...</span>
													</c:when>
													<c:otherwise>
														<span>${var.point_name}</span>
													</c:otherwise>
												</c:choose>
											</p>
											<p>知识分类</p>
										</div>
									</div>
									<span class="bid-border"></span>
									<div class="fr">
										<div class="bid-list-right">
											<span>创建日期：${var.create_time1}</span><br> <a
												style="margin-left: -12px; cursor: pointer; color: #fff; height: 25px; line-height: 25px; display: inline-block; width: 120px;"
												class="ljjb" onclick="startTesting(${var.id})">开始测试</a>
										</div>
									</div>
									<div class="clear"></div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<li style="width: 1200px; padding: 0px"><span
								style="color: #ff6a00; margin-left: 40%">没有相关记录</span></li>
						</c:otherwise>
					</c:choose>
					<!--测评列表开始-->
					<div class="page-header position-relative">
						<table style="width: 100%;">
							<tr>
								<td style="align: center;" align="center"><div
										class="pagination"
										style="padding-top: 15px; margin: 0 auto; font-size: 12px; display: inline-block;">${page.platformPageStr}</div></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<!--人员结束-->
		</div>
	</form>
	<div class="clear"></div>
	<!--<footer开始>-->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!--</footer结束>-->
	<!-- 确认到登录界面 开始-->
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
						href="<%=basePath%>userLogin/goLogin.act?returnUrl=evaluation/evaluationTestPaperList.act?field_id=${pd.field_id}%26point_id=${pd.point_id}">
						<b style="text-decoration: underline; color: #0a7295;">登录</b>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 确认到登录界面 结束-->
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
					<div class="modal-footer" style="height: 15px" id="testPaperSubmit">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 无权访问结束 -->
</body>
</html>
