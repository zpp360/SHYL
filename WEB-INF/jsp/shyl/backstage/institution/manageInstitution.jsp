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
				<form action="<%=basePath%>manages/list.do" method="post" id="forms" class="form-horizontal">
						<div class="form-inline"  style="margin-bottom: 20px;">
						<div style="height: 40px;">
							<label class="lbl" for="repair_title" >机构名称：</label>
							<input autocomplete="off"  id="" maxlength="50" style="width: 206px; height: 22px !important;" type="text"
								name="institutions_name" value="${pd.institutions_name}" placeholder="机构名称" onblur="trim(this);" />
							<label class="lbl" style="margin-left:20px;">开始日期：</label>
							<input class="date-picker" name="start_timestamp" id="start_timestamp" 
							    value="${pd.start_timestamp}" type="text" data-date-format="yyyy-mm-dd" 
							    readonly="readonly" style="width:206px;" placeholder="开始日期" />
							<label class="lbl" style="margin-left:20px;">结束日期：</label>
							<input class="date-picker" name="end_timestamp" id="end_timestamp" 
							    value="${pd.end_timestamp}" type="text" data-date-format="yyyy-mm-dd" 
							    readonly="readonly" style="width:206px;" placeholder="结束日期" />
						</div>
						<div style="height: 40px;">
							<label class="lbl">审批状态：</label>
							<select class="status-select" name="user_status" style="float: left; width: 218px;" data-placeholder="请选择审批状态">
								<option value=""></option>
								<option value="">全部</option>
								<option value="1" <c:if test="${pd.user_status == '1'}">selected</c:if>>审核中</option>
								<option value="2" <c:if test="${pd.user_status == '2'}">selected</c:if>>审核通过</option>
								<option value="3" <c:if test="${pd.user_status == '3'}">selected</c:if>>未通过</option>
								<option value="4" <c:if test="${pd.user_status == '4'}">selected</c:if>>锁定</option>
							</select>
								<button type="button" style="margin-left:20px" onclick="search();" class="btn btn-small btn-success btn-lg" title="检索" >查询<i class="icon-search icon-on-right"></i></button>
						</div>
						</div>
						<hr/>
						<!-- 检索  -->
						<table id="table_report"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
								    <th class="center" style="width:5%;">序号</th>
									<th class="center" style="width:20%;">申请机构</th>
									<th class="center" style="width:8%;">用户名</th>
									<th class="center" style="width:15%;">申请时间</th>
									<th class="center" style="width:25%;">申请行业</th>
									<th class="center" style="width:12%;">审批状态</th>
									<th class="center" style="width:10%;">审核人</th>
									<th class="center" style="width:15%;">审核日期</th>
									<th class="center" style="width:15%;">最后活跃</th>
									<th class="center" style="width:18%;">操作</th>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty varList}">
											<c:forEach items="${varList}" var="vars" varStatus="vs">
												<tr>
												   <td class='center' style="width: 30px;">${vs.index+1}</td>
													<td class='tds left'><a href="javascript:void(0);" title="${vars.institutions_name }" onclick="info('${vars.institutions_id}');">${vars.institutions_name }</a></td>
													<td class='tds left'>${vars.user_name }</td>
													<td class='center'>${vars.registe_time }</td>
													<td class='tds left' title="${vars.distinguish }">${vars.distinguish }</td>
													<td class='center'>${vars.status }</td>
													<td class="center">${vars.reviewer}</td>
													<td class="center">${vars.review_time}</td>
													<td class="center">${vars.login_time}</td>
													<td class='center'>
														<c:if test="${vars.user_status == 1}">
															<a class='btn btn-small btn-purple' title="通过" onclick="reviewSuccess('${vars.institutions_id }');"><i class="icon-check"></i></a>
															<a class='btn btn-small btn-purple' title="驳回" onclick="reviewFail('${vars.institutions_id }');"><i class="icon-reply"></i></a>
														</c:if>
														<c:if test="${vars.user_status == 2 }">
															<a class='btn btn-small btn-info'  title="锁定"  onclick="locked('${vars.institutions_id }');"><i class="icon-lock"></i></a>
															<a class="btn btn-small btn-danger" onclick="cancle('${vars.institutions_id }');" title="删除"><i class="icon-trash"></i></a>
														</c:if>
														<c:if test="${vars.user_status == 3 }">
														<a class='btn btn-small btn-purple' title="通过" onclick="reviewSuccess('${vars.institutions_id }');"><i class="icon-check"></i></a>
														<a class="btn btn-small btn-danger" onclick="cancle('${vars.institutions_id }');" title="删除"><i class="icon-trash"></i></a>
														</c:if>
														<c:if test="${vars.user_status == 4 }">
														<a class='btn btn-small btn-purple' title="解锁" onclick="unlock('${vars.institutions_id }');"><i class="icon-unlock"></i></a>
															<a class="btn btn-small btn-danger" onclick="cancle('${vars.institutions_id }');" title="删除"><i class="icon-trash"></i></a>
														</c:if>
														<a class='btn btn-small btn-important' title="重置密码" onclick="reset('${vars.userId }');"><i class="icon-cog"></i></a>
													</td>
												</tr>
											</c:forEach>
										<c:if test="${QX.cha == 0 }">
											<tr>
												<td colspan="10" class="center">您无权查看</td>
											</tr>
										</c:if>
									</c:when>
									<c:otherwise>
										<tr class="main_info">
											<td colspan="10" class="center">没有相关数据</td>
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
			$("#forms").submit();
		}
		//详细
		function info(institutions_id){
			window.location="<%=basePath%>manages/goInfoN.do?institutions_id="+institutions_id;
		}

		//审核通过
		function reviewSuccess(institutions_id){
			bootbox.confirm("确定要通过审核吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>manages/reviewSuccess.do?institutions_id="+institutions_id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage("${page.currentPage}");
					});
				}
			});
		}
		
		//驳回
		function reviewFail(institutions_id){
			bootbox.confirm("确定要驳回机构信息吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>manages/reviewFail.do?institutions_id="+institutions_id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage("${page.currentPage}");
					});
				}
			});
		}
		
		//锁定
		function locked(institutions_id){
			bootbox.confirm("确定要锁定该公司信息吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>manages/locked.do?institutions_id="+institutions_id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage("${page.currentPage}");
					});
				}
			});
		}
		
		//解锁
		function unlock(institutions_id){
			bootbox.confirm("确定要解锁该公司信息吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>manages/reviewSuccess.do?institutions_id="+institutions_id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage("${page.currentPage}");
					});
				}
			});
		}
		
		//注销
		function cancle(institutions_id){
			bootbox.confirm("确定要注销该公司信息吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>manages/cancle.do?institutions_id="+institutions_id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage("${page.currentPage}");
					});
				}
			});
		}
		
		//重置密码
		function reset(user_id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="重置密码";
			 diag.URL = dialogPath+'operateCompany/toReset.do?user_id='+user_id;
			 diag.Width = 350;
			 diag.Height = 150;
			 diag.CancelEvent = function() { //关闭事件
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

