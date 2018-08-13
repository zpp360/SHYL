<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh">
<head>
<base href="<%=basePath%>">
	<%@ include file="../../common/header.jsp"%>
<meta charset="utf-8" />
<title>课程管理_济南市服务外包公共服务平台</title>
<link rel="stylesheet" href="<%=basePath%>shyl/css/pagination.css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/maincss/css.css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/maincss/mypage.css">
<script src="<%=basePath%>shyl/js/jquery.tips.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<!--分页  -->
<script type="text/javascript" src="<%=basePath%>shyl/js/common/head.js"></script>
    <style type="text/css">
    -webkit-box-sizing: content-box;
    </style>
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
</head>    



<body id="top" style="background-color: #f7f7f7;">
	<!--</header结束>-->
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param value="31" name="menuType"/></jsp:include>
		<div class="mypage_right">
			<h2>购买课程</h2>
			<div class="tab" style="margin-bottom:0;">
			<label style="margin-left:110px" >已支付金额合计：</label>
			<input type="text"  value="${pd.total}" maxlength="15" style="border:0px;border-radius: 5px;width:120px;height:42px;background-color: #ecf0f9;"readonly="readonly">元
				<form action="<%=basePath%>course/list.act" method="post" name="course_name" id="course_name">
					<input type="text" class="search" id="course_name" name="course_name" value="${pd.course_name}" placeholder="请输入课程名称关键字"  maxlength="50" style="width:55%;background-color: #ecf0f9;">
					<input type="submit" class="sbtnNew" value="搜索" onclick="search();" maxlength="50" style="margin-top:0px;line-height: 46px;height: 46px;color: #ffffff;">
				</form>
			</div>
			<div class="jianli">
				<form action="<%=basePath%>company/collectionInfo/list.act"
					method="post" name="Form" id="Form">

					<table class="tableclass">
						<thead>
							<tr>
								<th style="width:180px;padding-left: 30px; text-align: left;">课程名称</th>
								<th style="width:180px;text-align: center;">学科</th>
								<th class="center" style="width:180px;text-align: center;">授课方式</th>
								<th class="center" style="width:110px;text-align: center;">价格(元)</th>
								<th class="center" style="width:180px;text-align: center;">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty varList }">
								<tr>
									<td colspan="5" style="text-align: center;"><span
										style="color: #ff6a00">没有相关记录</span></td>
								</tr>
							</c:if>
							<c:forEach items="${varList}" var="var" varStatus="vs">
								<tr>
									<td title="${var.course_name}" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;width:180px;padding-left: 30px;text-align: left;"><a href="<%=basePath%>institution/notFreeCourse.act?classTypeId=${var.course_id}">${var.course_name}</a></td>
									<td title="${var.subject}" class="center" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;width:180px;text-align: center;">${var.subject}</td>
									<td title="${var.teaching_style}" class="center" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;width:180px;text-align: center;">${var.teaching_style}</td>
									<td title="${var.price}" class="center" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;width:180px;text-align: center;">${var.price}</td>
									<c:choose>
									<c:when test="${var.pay_flg==1}">
									<td class="center" style="text-align:center;">
									<a style="padding:5px 20px;background:#edeff5;background-image: none;color: #818590">已购买</a>
									</c:when>
									<c:otherwise><td class="center" style="text-align:center;">
								<a data-toggle='modal' data-target='#cancelModal' onclick="delPay(${var.id})" class='delete' style="cursor:pointer">取消订单</a>
									<a data-toggle='modal' data-target='#wqfw' onclick="toWaitPay('${var.course_name}','${var.teaching_style}','${var.price}','${var.commodityId}','${var.course_id}','${var.subject_id}')" class='delete' style="cursor:pointer">去支付</a></td></c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
				<!-- 分页开始 -->
			<div class="page-header position-relative">
				<table style="width: 100%;">
					<tr>
						<td style="align: center;" align="center"><div
							class="pagination"
							style="padding-top: 15px; margin: 0 auto; font-size:12px; display: inline-block;">${page.platformPageStr}</div></td>
					</tr>
				</table>
			</div>
			<!-- 分页结束 -->
		</div>
	</div>
	<!-- 确认去支付订单模态框-->
	<div class="modal fade bs-example-modal-sm" id="wqfw" role="dialog"
		aria-labelledby="mySmallModalLabel">
		<form action="<%=basePath%>institution/pay.act" method="post" name="payWaitForm" id="payWaitForm">
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
						<h4>购买后可进行观看,确认购买此课程?</h4>
					    <input type="hidden" id="coursename" name="courseName" value="">
						<input type="hidden" id="realprice" name="price" value="">
						<input type="hidden" id="commodityId" name="commodityId" value="">
						<input type="hidden" id="teaching_style" name="teaching_style" value="">
						<input type="hidden" id="classTypeId" name="classTypeId" value="">
						<input type="hidden" id="subject_id" name="subject_id" value="">
					</div>
					<div class="modal-footer" style="height:20px">
						<button id="EduButtonedu" type="button" class="btn btn-success"
							onclick="payWaitForBuy()" data-toggle="modal">确认</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
	<!-- 确认去支付订单结束 -->
			<!-- 确认去取消订单模态框-->
	<div class="modal fade bs-example-modal-sm" id="cancelModal" role="dialog"
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
						<h4>确认取消订单吗？</h4>
					    <input type="hidden" id="cancelId" name="cancelId" value="">
					</div>
					<div class="modal-footer" style="height:20px">
						<button id="EduButtonedu" type="button" class="btn btn-success"
							onclick="delOrder()" data-toggle="modal">确认</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 确认去取消订单结束 -->
	<script type="text/javascript">
	    function search(){
	    	top.jzts();
	    	$("#course_name").submit();
	    }
	    function toWaitPay(name,style,price,commId,typeId,subject_id){
	    $("#coursename").val(name);
	    $("#teaching_style").val(style);
	    $("#realprice").val(price);
	    $("#subject_id").val(subject_id);
	    $("#commodityId").val(commId);
	    $("#classTypeId").val(typeId);
	    }
	    function payWaitForBuy(){
	    	$("#payWaitForm").submit();
		    }
	    function delPay(id){
	    	var cancelId = $("#cancelId").val(id);
	    }
	    function delOrder(){
	    	var cancelId = $("#cancelId").val();
	    	$.ajax({
	    		type : "POST",
	    		url :'<%=basePath%>/institution/cancelWaitForBuy.act',
	    		data : {
	    			id : cancelId
	    		},
	    		dataType : 'json',
	    		cache : false,
	    		success : function(data) {
	    			$('#cancelModal').modal('hide');
	    			location.reload();
	    		}
	    	});
	    }
	</script>
	<%@ include file="../../common/footer.jsp"%>

</body>
</html>
