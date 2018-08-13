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
<base href="<%=basePath%>">
<!-- jsp文件头和头部 -->
<%@ include file="../../../system/admin/top.jsp"%>
<link rel="stylesheet" href="static/css/thing.css" />
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
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
	<div class="container-fluid" id="main-container">
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<div class="row-fluid">
				<form action="<%=basePath%>courseSale/toCourseSaleSummry.do" method="post" name="Form" id="Form">
						<div class="form-inline"  style="margin-bottom: 20px;">
						<div style="height: 40px;">
							<label class="lbl" for="repair_title" >课程名称：</label>
							<input autocomplete="off"  id="" maxlength="50" style="width: 206px; height: 22px !important;" type="text"
								name="course_name" value="${pd.course_name}" placeholder="课程名称" onblur="trim(this);" />
							<label class="lbl" style="margin-left:20px;">开始日期：</label>
							<input class="date-picker" name="start_timestamp" id="start_timestamp" 
							    value="${pd.start_timestamp}" type="text" data-date-format="yyyy-mm-dd" 
							    readonly="readonly" style="width:206px;" placeholder="开始日期" />
							<label class="lbl" style="margin-left:20px;">结束日期：</label>
							<input class="date-picker" name="end_timestamp" id="end_timestamp" 
							    value="${pd.end_timestamp}" type="text" data-date-format="yyyy-mm-dd" 
							    readonly="readonly" style="width:206px;" placeholder="结束日期" />
							    <button type="button" style="margin-left:20px" onclick="search();" class="btn btn-small btn-success btn-lg" title="检索" >查询<i class="icon-search icon-on-right"></i></button>
						
						</div>
						</div>
						<div class="position-relative" style="margin-top: -30px">
							<table style="width:100%;">
								<tr>
									<td
										style="vertical-align: top; float: left; margin-top:25px"><font style="color:#393939; font-size: 14px;font-weight: normal;line-height: 20px;">合计金额:<input type="text" value="${pd.summary}" readonly style="width:100px; height:20px; margin-bottom:2px;text-align:right">元</font>
									</td>
									<td
										style="vertical-align: top; float: right; margin-right: 30px"><a
										class="btn btn-small btn-success" onClick="toExcel();">导出</a>
									</td>
								</tr>
							</table>
						</div>
						<hr/>
						<table id="table_report"
							class="table table-striped table-bordered table-hover" >
							<thead>
								<tr>
								    <th class="center" width="5%">序号</th>
								    <th class="center" width="20%">课程名称</th>
									<th class="center" width="20%">所属类别</th>
									<th class="center" width="10%">价格</th>
									<th class="center" width="20%">订单号</th>
									<th class="center" width="20%">用户名</th>
									<th class="center" width="20%">购买日期</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty varList}">
											<c:forEach items="${varList}" var="course" varStatus="vs">
												<tr>
													<td class='center' width="5%" title="${vs.index+1}" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${vs.index+1}</td>
													<td class="left" width="30%"  title="${course.course_name}" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${course.course_name}</td>
													<td class="center" width="35%" title="${course.subject}" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${course.subject}</td>
													<td class="center" width="30%"  title="${course.price}" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${course.price}</td>
													<td class="center" width="30%"  title="${course.order_number}" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${course.order_number}</td>
													<td class="center" width="30%"  title="${course.user_name}" style="overflow:hidden; white-space: nowrap; text-overflow: ellipsis;">${course.user_name}</td>
													<td class="center" width="30%"  title="${course.insert_date}" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${course.insert_date}</td>
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
									<td style="vertical-align: top;"><div class="pagination"
											style="float: right; padding-top: 0px; margin-top: 0px;">${page.pageStr}</div></td>
								</tr>
							</table>
						</div>
					</form>
					
				</div>
				<!-- PAGE CONTENT ENDS HERE -->
			</div>
			<!--/row-->

		</div>
		<!--/#page-content-->
	</div>
	<!--/.fluid-container#main-container-->

	<!-- 返回顶部  -->
	<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse"> <i
		class="icon-double-angle-up icon-only"></i>
	</a>

	<!-- 引入 -->
	<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>

	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript" src="static/js/bootbox.min.js"></script>
	<!-- 确认窗口 -->
	<!-- 引入 -->
	
	<!-- 日期框 -->
	<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!--提示框-->
	<script type="text/javascript">
		$(top.hangge());
		//检索
		function search(){
			var start_time=$("#start_timestamp").val();
			var end_time=$("#end_timestamp").val();
			if(start_time.length>0&&end_time.length>0){
				if(start_time>end_time)
				{
				$("#start_timestamp").tips({
					side : 3,
					msg : '开始时间不能大于结束时间！',
					bg : '#FF5080',
					time : 2
				});
				$("#start_timestamp").focus();
				return false;		
				}
			}
			$("#Form").submit();
		}
		
		
		//重置密码
		function toExcel(user_id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="导出区间";
			 diag.URL = dialogPath+'courseSale/addTime.do?user_id='+user_id;
			 diag.Width = 400;
			 diag.Height = 300;
			 diag.CancelEvent = function() {
				//关闭事件
				window.location.href = window.location.href;
				top.jzts();
				diag.close();
			};
			
			diag.show();
		}
		
	</script>
	<script type="text/javascript">
		$(function() {
			//日期框
			$('.date-picker').datepicker();
			//下拉框
			$(".status-select").chosen();
		});
	</script>
</body>
</html>

