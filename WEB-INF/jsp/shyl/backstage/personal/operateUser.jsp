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
</head>
<body>
	<div class="container-fluid" id="main-container">
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<div class="row-fluid">
				<form action="<%=basePath%>users/list.do" method="post" id="forms" class="form-horizontal">
						<div class="row-fluid" style="margin-bottom: 20px;">
							<div class="form-inline" style="float: left;">
								<label class="lbl">用户名：</label>
									<input autocomplete="off" class="input-content" type="text" style="width: 206px;"
										name="user_id" value="${pd.user_id}" placeholder="用户名" onblur="trim(this);" maxlength="50"/>
								<label class="lbl" style="margin-left:20px;">状态：</label>
								<select class="status-select" name="user_status" style="width: 206px;" data-placeholder="请选择状态">
									<option></option>
									<option value="">全部</option>
									<option value="4"
										<c:if test="${pd.user_status == '4'}">selected</c:if>>被锁定</option>
									<option value="2"
										<c:if test="${pd.user_status == '2'}">selected</c:if>>正常</option>
								</select>
							</div>
							<div class="form-inline" style="float: left;margin-left: 20px;">
								<button type="button" onclick="search();" class="btn btn-small btn-success btn-lg" title="检索" >查询<i class="icon-search icon-on-right"></i></button>
							</div>
						</div>
						<hr></hr>
						<!-- 检索  -->
						<table id="table_report"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
								  	<th class="center">序号</th>
									<th class="center">用户名</th>
									<th class="center">会员类型</th>
									<th class="center">姓名</th>
									<th class="center">注册时间</th>
									<th class="center">联系电话</th>
									<th class="center">邮箱</th>
									<th class="center">状态</th>
									<th class="center">最后活跃</th>
									<th class="center">操作</th>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty varList}">
											<c:forEach items="${varList}" var="vars" varStatus="vs">
												<tr>
												   	<td class='center' style="width: 30px;">${vs.index+1}</td>
													<td class='left'>${vars.user_name }</td>
													<td class='center'>${vars.type }</td>
													<td class='left'>${vars.name }</td>
													<td class='center'>${vars.registe_time }</td>
													<td class='center'>${vars.contact_info }</td>
													<td class='left'>${vars.mail }</td>
													<td class='center'>${vars.user_status }</td>
													<td class='center'>${vars.login_time }</td>
													<td class='center' style="width: 100px;">
														<c:if test="${vars.user_status == '正常'}">
															<a class='btn btn-small btn-info'  title="锁定"  onclick="edit('${vars.user_id}',4)"><i class="icon-lock"></i></a>
														</c:if>
														<c:if test="${vars.user_status == '被锁定'}"> 
														<a class='btn btn-small btn-purple' title="解锁" onclick="edit('${vars.user_id}',2)"><i class="icon-unlock"></i></a>
														
														</c:if>
														<a class='btn btn-small btn-important' title="重置密码" onclick="reset('${vars.user_id}');"><i class="icon-cog"></i></a>
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
			top.jzts();
			$("#forms").submit();
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
		
		
		
		
		//详细
		function edit(user_id,user_status){
			window.location="<%=basePath%>users/goEditS.do?user_id="+user_id+"&user_status="+user_status;
		}
		$(function() {
			//下拉框
			$(".status-select").chosen();
		});
	</script>
</body>
</html>

