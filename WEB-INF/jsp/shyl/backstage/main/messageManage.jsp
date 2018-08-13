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
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- jsp文件头和头部 -->
<%@ include file="../../../system/admin/top.jsp"%>
<style type="text/css">
.btnlist {
	padding: 5px;
	margin: 5px;
	border: 1px solid #ddd;
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="container-fluid" id="main-container">
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<div class="row-fluid">
					<!-- 检索  -->
					<form action="messageManage/list.do" method="post" name="message"
						id="userForm">
						<table style="margin-bottom: 20px;">
						
						</table>
						<!-- 检索  -->
						<hr/>
						<table id="table_report"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center" width="10%">序号</th>
									<th class="center" width="20%">标题</th>
									<th class="center" width="30%">内容</th>
									<th class="center" width="20%">留言日期</th>
									<th class="center" width="20%">操作</th>
									<th> <a class='btn-mini btnlist' title="详情"
															onclick="reply('${message.ID }')"><i
															class="icon-pencil"></i>详情</a></th>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty managelist}">
										<c:forEach items="${managelist}" var="message" varStatus="vs">
											<tr>
												<td class='center' style="width: 30px;">${vs.index+1}</td>
												<td class='center'>${message.MESSAGE_TITLE }</td>
												<td class='center'>${message.MESSAGE_CONTENT }</td>
												<td class='center'>${message.PUBLISH_DATE }</td>
												<td class='center' style="width: 200px;">
													 <a class='btn-mini btnlist' title="详情"
															onclick="reply('${message.ID }')"><i
															class="icon-pencil"></i>详情</a>
												</td>
											</tr>
										</c:forEach>
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
			</div>
		</div>
	</div>

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
	<script type="text/javascript"
		src="static/js/bootstrap-datepicker.min.js"></script>
	<!-- 日期框 -->
	<script type="text/javascript" src="static/js/bootbox.min.js"></script>
	<!-- 确认窗口 -->
	<!-- 引入 -->

	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!--提示框-->
	<script type="text/javascript">
		$(top.hangge());
		//详情
			function reply(id){
				 top.jzts();
				 var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="详情";
				 diag.URL = dialogPath+"messageManage/messageReply.do?id="+id;
				diag.Width = 500;
				diag.Height = 750;
				diag.CancelEvent = function() { //关闭事件
					window.location.href = window.location.href;
					top.jzts();
					diag.close();
				};
				diag.show();
			}
	</script>

</body>
</html>