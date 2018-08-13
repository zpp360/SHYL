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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测评管理_济南市服务外包公共服务平台</title>
<jsp:include page="../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<script src="shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/jquery.min.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.js"></script>
<script src="<%=basePath%>/shyl/js/layer/layer.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script type="text/javascript">
	function evaluation(x,y){
		$.post('<%=basePath%>consoleEvaluation/showTestResult.act', {examPaperId:x,field_id:y,flag:1}, function(str){
			layer.open({
			 	 title:'测评结果' ,
		         type: 1,
		         shadeClose : true,
		         scrollbar : true,
				 skin: 'layui-layer-rim', 
				 area: ['48%', '50%'],
				 offset: ['15%', '25%'],
				 content: str
		   	});
		});
		
	}
	
	//检索
	function search(){
		top.jzts();
		$("#evaluationform").submit();
	}
</script>
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
	width:50%;  
    word-break:keep-all;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../common/left.jsp"><jsp:param value="34" name="menuType"/></jsp:include>
		<div class="mypage_right">
			<h2>测评管理</h2>
			<div class="tab" style="margin-bottom:0;">
				<form action="<%=basePath%>consoleEvaluation/list.act" method="post" name="evaluationform" id="evaluationform">
					<input type="text" class="search" id="paperName" name="paperName" value="${pd.paperName}" placeholder="请输入名称关键字" onblur="trim(this);" style="background-color: #ecf0f9;">
					<input type="submit" class="sbtnNew" value="搜索" onclick="search();" style="margin-top:0px;line-height: 46px;height: 46px;color: #ffffff;margin-left: 20px;">
				</form>
			</div>
			<div class="jianli">
				<table class="tableclass">
					<thead>
						<tr>
							<th style="padding-left: 30px;text-align: left;width:50%;">测评名称</th>
							<th style="text-align: center;width:25%;">测评日期</th>
							<th style="text-align: center;width:25%;">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty evaluationManagementList}">
								<c:forEach items="${evaluationManagementList}" var="var" varStatus="vs">
									<tr>
										<td class="tds" style="padding-left: 30px;text-align: left;">${var.exam_paper_name}</td>
										<td style="text-align: center;">${var.update_timestamp}</td>
										<td style="text-align: center;">
											<a href="javaScript:evaluation('${var.exam_paper_id}','${var.field_id}')" class="modify" 
											style="padding:5px 20px;background:#edeff5;background-image: none;color: #818590">测评结果</a>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" style="text-align: center;">
										<span style="color: #ff6a00">没有相关数据</span>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<div class="page-header position-relative">
				<table style="width: 100%;">
					<tr>
						<td style="align: center;" align="center">
							<div class="pagination" style="padding-top: 15px; margin: 0 auto; font-size:12px; display: inline-block;">
								${page.platformPageStr}
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>