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
    text-decoration:none;
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
					<form action="<%=basePath%>volunteerYearAward/toVolunteer.do" method="post" name="Form" id="Form">
					<input type="hidden" id="volunteer_id" name="volunteer_id" value="${pd.volunteer_id}" style="width: 1000px;"/>
					<input type = "hidden" id="year_award_id" name="year_award_id" value="${pd.year_award_id}"/>
						<table style="margin-bottom: 20px;">
							<tr>
								<td class="form-inline">
									<label class="lbl" for="end_time" >志愿者名称：</label>
									<span class="input-icon"> <input
											autocomplete="off" id="user_name" type="text"
											name="user_name" value="${pd.user_name}"
											placeholder="这里输入用户名" onblur="trim(this);" /> <i id="nav-search-icon"
											class="icon-search"></i>
									</span>
								</td>
								<td style="vertical-align: top;">
									<button type="button" onclick="search();" class="btn btn-small btn-success btn-lg" title="检索" >查询<i class="icon-search icon-on-right"></i></button>
								</td>
								<td style="width: 20px"></td>
							</tr>
						</table>
						<hr/>
						<!-- 检索  -->
						<table id="table_report"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center" style="width:5%;">
										<label>
<!-- 											<input type="checkbox" id="zcheckbox" /><span class="lbl"></span> -->
										</label>
									</th> 
									<th class="center" style="width:5%;">序号</th>
									<th class="center" style="width:15%;">姓名</th>
									<th class="center" style="width:15%;">获奖状态</th>
									<th class="center" style="width:15%;">所在市</th>
									<th class="center" style="width:15%;">所在县(市、区)</th>
									<th class="center" style="width:30%;">所在单位</th>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty pdList}">
											<c:forEach items="${pdList}" var="list" varStatus="vs">
												<tr>
													<td class='center' ><label><input
															type='checkbox' name='ids' value="${list.volunteer_id}" /><span
															class="lbl"></span></label></td>
													<td class='center' >${vs.index+1}</td>
													<td class="center tds">${list.user_name }</td>
													<td class="center tds">
														<c:if test="${list.award_status=='1'}">
															已获奖
														</c:if>
														<c:if test="${list.award_status!='1'}">
															未获奖
														</c:if>
													</td>
													<td class="center tds" title="${list.volunteer_city}">${list.volunteer_city} </td>
													<td class="center tds" title="${list.volunteer_county}">${list.volunteer_county}</td>
													<td class="center tds" title="${list.unit_name}">${list.unit_name}</td>
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
	<!--/.fluid-container#main-container-->

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

			var str = "${pd.volunteer_id}";
			var idsArr = new Array();
			if(str!=""){
				idsArr = str.split(",");
			}
			//回传，选中状态
			$.each(idsArr, function(i,obj) {
	            $("[name=ids][value="+obj+"]").prop("checked",true);
	        });
			
			
			$('[name=ids]').click(function(){
				if(this.checked){
					idsArr.push(this.value);
				}else{
					idsArr.remove(this.value);
				}
				$("#volunteer_id").val(idsArr);
			});	
			
			
		});
		
	</script>
</body>
</html>

