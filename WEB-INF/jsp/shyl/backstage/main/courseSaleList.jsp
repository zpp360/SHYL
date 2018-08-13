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
<body>
	<div class="container-fluid" id="main-container">
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<div class="row-fluid">
					<!-- 检索  -->
					<form action="<%=basePath%>courseSale/list.do" method="post" name="Form" id="Form">
						<table style="margin-bottom: 20px;">
							<tr>
								<td class="form-inline">
								
								<span class="input-icon"> <input
										autocomplete="off" type="text" id="NAME"
										name="NAME" style="width: 350px" value="${pd.Name }"
										placeholder="这里输入课程名称" onblur="trim(this);" /> <i id="nav-search-icon"
										class="icon-search"></i>
								</span></td>
								<td style="width: 20px"></td>
								<td style="vertical-align: top;">
									<button class="btn btn-small btn-success btn-lg"  onclick="search();" title="查询">
										查询<i id="nav-search-icon" class="icon-search" style="color: #FFFFFF;"></i>
									</button>
								</td>
							</tr>
						</table>
						<hr/>
						<!-- 检索  -->
						<table id="table_report"
							class="table table-striped table-bordered table-hover" >
							<thead>
								<tr>
								    <th class="center" width="5%">序号</th>
									<th class="center" width="35%">课程名</th>
									<th class="center" width="30%">销售数量（套）</th>
									<th class="center" width="30%">销售总金额（元）</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty varList}">
											<c:forEach items="${varList}" var="course" varStatus="vs">
												<tr>
													<td class='center' width="5%">${vs.index+1}</td>
													<td class="tds" width="35%">
													<a href="<%=basePath%>courseSale/courseSaleInfo.do?courseId=${course.COURSEID}&courseName=${course.NAME}" title="${course.NAME}">
													${course.NAME}
													</a></td>
													<td class="center" width="30%">${course.COUNT}</td>
													<td class="center" width="30%">${course.SUM}</td>
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
		function myBrowser(){
		    
		    }
	</script>
</body>
</html>

