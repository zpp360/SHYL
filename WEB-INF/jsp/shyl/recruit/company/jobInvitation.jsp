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
<head>
<title>发布职位列表</title>
<base href="<%=basePath%>">
<link href="<%=basePath%>static/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=basePath%>static/css/font-awesome.min.css" />
<%-- <script type="text/javascript" src="<%=basePath%>static/js/jquery-1.7.2.js"></script> --%>
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
<body>
	<div class="container-fluid" id="main-container" style="font-family:'Open Sans';font-size:13px;color:#393939;height: auto;">
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<div class="row-fluid">
					<form action="<%=basePath%>company/jobList.act" method="post" name="Form" id="Form">					
						<table id="table_report"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>									
									<th class="center" style="width:10%;">序号</th>
									<th class="center" style="width:24%;">职位</th>
									<th class="center" style="width:17%;">工作地点</th>
									<th class="center" style="width:20%;">更新日期</th>
									<th class="center" style="width:15%;">学历要求</th>
									<th class="center" style="width:19%;">薪资范围</th>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty jobList}">
											<c:forEach items="${jobList}" var="job" varStatus="vs">
												<tr>													
													<td class='center'>
														<label>
															<input type='checkbox' name='ids' value="${job.recruitment_info_id}" /> 
															<span class="lbl">${vs.index+1}</span>
														</label>
													</td>													
													<td class="tds" style="width:500px">
													<a href="javascript:void(0);" title="${job.POSITION_NAME }"
														onclick="info('${job.recruitment_info_id }','${pd.USERID}');">${job.POSITION_NAME }</a></td>
													<td class="center">${job.WORK_PLACE_CITY }</td>
													<td class="center">${job.UPDATE_TIMESTAMP }</td>
													<c:choose>
													<c:when test="${job.EDUCATION!=null}">
													<td class="center">${job.EDUCATION }</td>
													</c:when>
													<c:otherwise>
													<td class="center">不限</td>
													</c:otherwise>
													</c:choose>
													<td class="center">${job.SALARY}</td>										
												</tr>
											</c:forEach>
									</c:when>
									<c:otherwise>
										<tr class="main_info">
											<td colspan="100" class="center">没有相关数据</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<div class="page-header position-relative">
							<table style="width: 100%;">
								<tr>
									<td style="vertical-align: top;width: 30%">
										<button type="button" class="btn btn-small btn-danger" onclick="saveJobInvitation()" title="发送邀请 ">发送邀请 </button>
									</td>
									<td style="vertical-align: top;width: 70%">
									<div class="pagination" style="float: right; padding-top: 0px; margin-top: 0px;">
										<c:if test="${pageNos>1 }">
										<a href="javaScript:void(0)" onclick="nextPage(1)" >首页</a>
										<a href="javaScript:void(0)" onclick="nextPage('${pageNos-1 }')">上一页</a>
										</c:if>
										<c:if test="${pageNos <recordCount }">
										<a href="javaScript:void(0)" onclick="nextPage('${pageNos+1 }')">下一页</a>
										<a href="javaScript:void(0)" onclick="nextPage('${recordCount}')">末页</a>
										</c:if>
									</div></td>
								</tr>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!--提示框-->
	<script type="text/javascript">
	
		// 跳转到职位详情页面
		function info(id,userId){
			window.location.href = '<%=basePath%>job/detail/info.act?companyId='+userId+'&positionId='+id;
		}
	
		//发送职位邀请
		function saveJobInvitation(){
			var str = '';
			for(var i=0;i < document.getElementsByName('ids').length;i++){
				if(document.getElementsByName('ids')[i].checked){
					if(str=='') str += document.getElementsByName('ids')[i].value;
					else str += ',' + document.getElementsByName('ids')[i].value;
				}
			}
			if(str==''){
				// layer.closeAll();
				layer.alert('未选择任何职位',{
					title:'提示'
				});
				return;
			}else{
				layer.closeAll();
				var cvUserId = $("#userId").val();
				var cvId = $("#cvId").val();
				$.post('<%=basePath%>company/countInvitation.act', {recruitment_info_id:str,userId:cvUserId,cvId:cvId}, function(data){
					if (data.result== '0') {
						$.post('<%=basePath%>company/sendJobInvitation.act', {ids:str,cvUserId:cvUserId,cvId:cvId}, function(data){
							layer.open({
							 	 title:'职位邀请' ,
						         type: 1,
						         shadeClose : true,
						         scrollbar : false,
								 skin: 'layui-layer-rim', 
								 area: ['40%', '510px'],
								 offset: ['20%', '25%'],
								 content: data			
						   	});			
						});
					}else if (data.result== '2') {
						layer.alert('此人已投递过该职位简历，无需再发送职位邀请',{
							title:'提示'
						});
		        	}else{
		        		layer.alert('已对此人发送过职位邀请，无需重复发送！',{
							title:'提示'
						});
		        	} 						
				});							
			}		
		}
		function nextPage(pageNos){
			$.post('<%=basePath%>company/jobList.act', {pageNos:pageNos}, function(str){
				layer.closeAll();
				layer.open({
				 	 title:'已发布职位' ,
			         type: 1,
			         shadeClose : true,
			         scrollbar : false,
					 skin: 'layui-layer-rim', 
					 area: ['48%', 'auto'],
					 content: str						
			   	});
			});			 
		}
	</script>
	<script type="text/javascript">
		$(function() {			
			$('table td input:checkbox').on('click',function() {
				var that = this;
				var n = $("table td input:checkbox:checked").length;
			 	if (n >= 1) {
			 		$("table td input:checkbox").each(function() {
			 			if (!$(this).is(":checked")) {
			 				$(this).attr("disabled", true);
			 			}
			 		});
				} else {
			 		$("table td input:checkbox").each(function() {
			 			$(this).attr("disabled", false);
					});
			 	}				
			});
		});
	</script>
</body>
</html>

