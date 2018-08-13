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
<title>字典管理_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">
<!-- jsp文件头和头部 -->
<%@ include file="../../../system/admin/top.jsp"%>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js"
	type="text/javascript"></script>
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
					<form action="<%=basePath%>backtester/list.do?id=${pd.id}" method="post"
						name="Form" id="Form">
						<table style="margin-bottom: 20px;">
							<tr>
								<td class="form-inline"><span class="input-icon"> <input
										autocomplete="off" type="text" id="tester_name"
										name="tester_name" style="width: 350px"
										value="${pd.tester_name }" placeholder="这里输入测试人员姓名"
										onblur="trim(this);" /> <i id="nav-search-icon"
										class="icon-search"></i>
								</span></td>
								<td style="width: 20px"></td>
								<td style="vertical-align: top;">
									<button class="btn btn-warning btn-mini lineh"
										onclick="search();" title="搜索">
										<i id="nav-search-icon" class="icon-search"
											style="color: #FFFFFF;"></i>搜索
									</button>
								</td>
							</tr>
						</table>
						<!-- 检索  -->
						<hr />
						<table id="table_report"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center" width="5%">序号</th>
									<th style="text-align: center;">姓名</th>
									<th style="text-align: center;">测试日期</th>
									<th style="text-align: center;">测试结果</th>
									<th style="text-align: center;">测试项目名称</th>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty VarList}">
										<c:forEach items="${VarList}" var="var" varStatus="vs">
											<tr>
												<td class='center' style="width: 30px;">${vs.index+1}</td>
												<td style="text-align: center;" class="tds">${var.tester_name}</td>
												<td style="text-align: center;" class="tds">${var.insert_date}</td>
												<td style="text-align: center; cursor: pointer;}"><a data-toggle="modal"
													onclick="test('${var.exam_paper_id}','${var.user_id}');">测试结果</a></td>
													<td style="text-align: center;" class="tds">${var.exam_paper_name}</td>
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
<div>
		<a class="btn  btn-light"  href="<%=basePath%>examPaper/list.do"><i class=" icon-circle-arrow-left"></i>返回</a>
</div>
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


	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!--提示框-->
	<script type="text/javascript">
	    $(top.hangge());
		// 检索
		function search(){
			$("#Form").submit();
		}
			//测试结果
			function test(exam_paper_id,user_id){
				 top.jzts();
				 var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="测试结果";
				 diag.URL = dialogPath+'backtester/goInfoN.do?exam_paper_id='+exam_paper_id+'&user_id='+user_id;
				 diag.Width = 800;
				 diag.Height = 700;
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