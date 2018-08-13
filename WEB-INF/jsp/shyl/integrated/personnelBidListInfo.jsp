<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>竞标管理_济南市服务外包公共服务平台</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/pagination.css">
<link href="/SHYL/shyl/css/integrated/css.css" rel="stylesheet" type="text/css">
<link href="css/mypage.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<script src="js/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
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
<body style="background-color: #f7f7f7;margin-top:-24px">
	<!--<header开始>-->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!--</header结束>-->

	<div class="clear"></div>
	<div class="register-box p0" style="margin-top: 155px;">
		<div class="rticon"></div>
        <jsp:include page="../common/left.jsp"><jsp:param value="19" name="menuType"/></jsp:include>
	    <form action="<%=basePath%>requirementdetail/personnelBidListInfo.act" method="post" name="Form" id="Form">
		<div class="mypage_right">
			<h2>竞标管理</h2>
			<div class="tab">
					<a href="javascript:;"  id="xiangmubtn" onclick="xiangmuclick()">项目竞标</a>
					<a href="javascript:;" class="hover" onclick="renyuanclick()" id="renyuanbtn">人员竞标</a>
			</div>
			<div class="xiangmu-radio" id="renyuan">
				<label><input id="radio" name="Fruit" type="radio" value="" checked="checked" onclick="jobSearch('')" />全部</label> 
				<label><input id="radio0" name="Fruit" type="radio" value="" onclick="jobSearch('0')" />竞标中</label> 
				<label><input id="radio1" name="Fruit" type="radio" value="" onclick="jobSearch('1')" />已中标</label> 
				<label><input id="radio2" name="Fruit" type="radio" value="" onclick="jobSearch('2')" />未中标</label>
				<input value="${pd.bid_status} " id="opendd" type="hidden">
			</div> 
			<div class="xiangmu" id="xiangmu" >	
				<ul class="bg1">
					<li class="a1">标题</li>
					<li class="a1">发布企业</li>
					<li class="a3">发布时间</li>
					<li class="a4">竞标状态</li>
					<li class="a6">操作</li>
				</ul>
				<c:choose>
				<c:when test="${not empty bidList}">
				<c:forEach items="${bidList}" var="var" varStatus="vs">
					<ul>
						<li class="a1 n-tit"><a href="<%=basePath%>requirementdetail/personnelDetailinfo.act?Id=${var.personnel_id}"
							target="_blank" id="CVID" title="${var.personnel_title}">${var.personnel_title}</a></li>
						<li class="a1 n-tit"><a href="<%=basePath%>company/info.act?companyId=${var.insert_user}"
							target="_blank" id="title_id" title="${var.publish_company_name}">${var.publish_company_name}</a></li>
						<li class="a3">${var.insert_timestamp}</li>
						<li class="a4">${var.bid_status}</li>
						<li style="width:20%;text-align: center;">
							<c:if test="${var.bid_status =='竞标中' || var.bid_status=='已中标'}">
								<a href="javascript:;" class="modify" onclick="showDetails('${var.personnel_id}')">修改</a>
							</c:if>
							<c:if test="${var.bid_status =='未中标'} ">
							-
							</c:if>
						</li>
					</ul>
				</c:forEach>
				</c:when>
				<c:otherwise>
						<span class="message-nodate">没有相关记录</span>
				</c:otherwise>
				</c:choose>
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
		</div>
		</form>
	<div class="clear"></div>
</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!--<footer开始>-->
	<!-- 删除简历 -->
	<div class="modaldel fade in" id="delresume" tabindex="-1" role="dialog" aria-labelledby="delresume" aria-hidden="false" data-backdrop="static" data-target="" style="display: none;"><div class="modal-dialog modal-sm">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" onclick="Clear()"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="myModalLabel">提示</h4>
        </div>
        <div class="modal-body">
            <p id="warntext">简历取消后不可恢复，确定取消吗？</p>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-success" onclick="" data-dismiss="modal" id="d">确认</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        </div>
    </div>
</div>

</div>
	<div class="modaldel fade in" id="makesure" tabindex="-1" role="dialog" aria-labelledby="delresume" aria-hidden="false" data-backdrop="static" data-target="" style="display: none;"><div class="modal-dialog modal-sm">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" onclick="Clear()"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="myModalLabel">提示</h4>
        </div>
        <div class="modal-body">
            <p id="warntext">只能创建三份简历？</p>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-success" onclick="" data-dismiss="modal" id="d">确认</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        </div>
    </div>
</div>

</div>
	<script type="text/javascript">
	
	function jobSearch(id) {
		var f = document.createElement("form");
		document.body.appendChild(f);
		f.method = 'post';
		f.action = "<%=basePath%>requirementdetail/personnelBidListInfo.act?bid_status="+id;
		
		f.submit();
	}
	
	$(document).ready(function(){
		var id2 = $("#opendd").val();
		if (id2 == "/") {
			$("#radio").attr("checked","checked");
		} else {
			$("#radio"+id2.replace("/","")).attr("checked","checked");
		}
	});
		function showDetails(Id){
			window.location.href='<%=basePath%>PersonnelBidDetail/toUpdate.act?Id='+ Id;
		}
		/* 人员竞标 */
		function renyuanclick(){
			$("#renyuan").show();
			$("#xiangmubtn").removeClass("hover");
			$("#renyuanbtn").addClass("hover");
			$("#fenye").hide();
		}
		function xiangmuclick(){
			window.location.href='<%=basePath%>requirementdetail/bidListInfo.act';
		}
	</script>
	<!--</footer结束>-->
</body>
</html>
