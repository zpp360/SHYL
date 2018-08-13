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
					<form action="<%=basePath%>voteConfig/list.do" method="post" name="Form" id="Form">
						<table style="margin-bottom: 20px;">
							<tr>
								<td class="form-inline">
									<label class="lbl" for="">类型：</label> 
									<select class="chzn-select" id="vote_type" name="vote_type" data-placeholder="请选择预约状态">
										<option value="">全部</option>
									    <option value="1" <c:if test="${pd.vote_type=='1'}">selected</c:if>>文体团队</option>
									</select>
								</td>
								<td style="vertical-align: top;">
									<button type="button" onclick="search();" class="btn btn-small btn-success btn-lg" title="检索" >查询<i class="icon-search icon-on-right"></i></button>
								</td>
								<td style="width: 20px"></td>
							</tr>
						</table>
						<hr/>
						<!-- 检索  -->
						<table>
							<tbody>
							<tr>
								<td nowrap="nowrap">
									<div class="contentline-both" style="margin-bottom: 10px;">
										<c:if test="${pd.is_lgbj}">
											<button type="button" class="btn btn-small btn-success btn-lg"  onclick="add()" title="添加">
											新增 <i class="icon-plus-sign icon-on-right"></i>
											</button>
										</c:if>
									</div>
								</td>
							</tr>
						  </tbody>
						</table>
						<table id="table_report"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center" style="width:3%;"><label><input type="checkbox"
											id="zcheckbox" /><span class="lbl"></span></label></th> 
									<th class="center" style="width:5%;">序号</th>
									<th class="center" style="width:15%;">投票限制</th>
									<th class="center" style="width:15%;">人员比例（在职：离退）</th>
									<th class="center" style="width:15%;">投票类型 </th>
									<th class="center" style="width:15%;">创建单位</th>
									<th class="center" style="width:15%;">创建时间</th>
									<th class="center" style="width:17%;">操作</th>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty pdList}">
											<c:forEach items="${pdList}" var="list" varStatus="vs">
												<tr>
													<td class='center' ><label><input
															type='checkbox' name='ids' value="${list.vote_config_id}" /><span
															class="lbl"></span></label></td>
													<td class='center' >${vs.index+1}</td>
													<td class="center">每<span style="color:red;">${list.vote_day}</span>天<span style="color:red;">${list.vote_ticket}</span>票</td>
													<td class="center">${list.vote_on_job}:${list.vote_out_job}</td>
													<td class="center"><c:if test="${list.vote_type == 1}">文体团队</c:if></td>
													<td class="center">${list.unit_name }</td>
													<td class="center">${list.create_time }</td>
													<td  class="center">
														<a class="btn btn-mini btn-danger" onclick="delVote('${list.vote_config_id}');" title="删除"><i class="icon-trash"></i></a>
														<c:if test="${pd.is_lgbj}">
															<a class="btn btn-mini btn-info" title="编辑" onclick="editVote('${list.vote_config_id }');"><i class="icon-edit"></i></a>
														</c:if>
													</td>
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
		
		function add(){
			top.jzts();
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Title ="添加投票";
			diag.URL = dialogPath+'voteConfig/toAddVoteConfig.do';
			diag.Width = 800;
			diag.Height = 500;
			diag.CancelEvent = function(){ //关闭事件
				if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					location.reload();
				}
				diag.close();
			};
			diag.show();
		}
		
		function editVote(voteId){
			top.jzts();
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Title ="修改投票";
			diag.URL = dialogPath+'voteConfig/toEditVoteConfig.do?vote_config_id='+voteId;
			diag.Width = 800;
			diag.Height = 500;
			diag.CancelEvent = function(){ //关闭事件
				if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					location.reload();
				}
				diag.close();
			};
			diag.show();
		}
		
		function delVote(voteId){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>voteConfig/deleteVoteConfig.do?vote_config_id="+voteId+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage("${page.currentPage}");
					});
				}
			});
		}
	</script>
</body>
</html>

