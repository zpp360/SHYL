<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<style type="text/css">

.btnlist {
	padding: 5px;
	margin: 5px;
	border: 1px solid #ddd;
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}
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
					<!-- 检索  -->
					<form action="<%=basePath%>team/toSelectUserInfo.do?user_id=${pd.user_id}" method="post" name="Form" id="Form">
						<table style="margin-bottom: 20px;">
							<tr>
								<td class="form-inline">
								<label class="lbl" for="vote_name" >用户名：</label>
								<span class="input-icon"> <input
										autocomplete="off" id="user_name" type="text"
										name="user_name" style="width: 200px" value="${pd.user_name}"
										placeholder="这里输入名称" onblur="trim(this);" /> <i id="nav-search-icon"
										class="icon-search"></i>
								</span></td>
								<td class="form-inline">
									<label class="lbl" for="">单位：</label> 
									<select class="chzn-select" id="unit_id" name="unit_id" data-placeholder="请选择单位">
										<option value="">全部</option>
										<c:forEach items="${unitList}" var="list">
											<option value="${list.unit_id}" <c:if test="${list.unit_id == pd.unit_id}">selected</c:if>>${list.unit_name_full}</option>
										</c:forEach>
									</select>
								</td>
								<td style="vertical-align: top;">
									<button type="button" onclick="search();" class="btn btn-small btn-success btn-lg" title="检索" >查询<i class="icon-search icon-on-right"></i></button>
								</td>
								<td style="width: 20px"></td>
							</tr>
						</table>
						<hr/>
						<table id="table_report"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center" style="width:5%;">序号</th>
									<th class="center" style="width:20%;">用户名</th>
									<th class="center" style="width:20%;">职务</th>
									<th class="center" style="width:20%;">用户状态</th>
									<th class="center" style="width:35%;">所属单位</th>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty userList}">
											<c:forEach items="${userList}" var="list" varStatus="vs">
												<tr>
													<td class='center' >${vs.index+1}</td>
													<td class="center">${list.user_name}</td>
													<td class="center">${list.user_job}</td>
													<td class="center">
														<c:if test="${list.user_type=='0'}">
															离休
														</c:if>
														<c:if test="${list.user_type=='1'}">
															退休
														</c:if>
														<c:if test="${list.user_type=='2'}">
															在职
														</c:if>
													</td>
													<td class="center">${list.UNIT_NAME_FULL} </td>
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
			</div>
			<!--/row-->

		</div>
		<!--/#page-content-->
	</div>

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


	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!--提示框-->
	<script type="text/javascript">
		$(top.hangge());
		
		//检索
		function search(){
			top.jzts();
			$("#Form").submit();
			 nextPage('${page.currentPage}');
		}
		
		$(function() {
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			
			
		});
		
		
	</script>
</body>
</html>

