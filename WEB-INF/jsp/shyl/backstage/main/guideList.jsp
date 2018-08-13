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
<title>指南管理_济南市服务外包公共服务平台</title>
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

table {
	table-layout: fixed;
}

.tds a {
	width: 100%;
	word-break: keep-all;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.tds {
	width: 100%;
	word-break: keep-all;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
</head>
<body>
	<div class="container-fluid" id="main-container">
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<div class="row-fluid">
					<!-- 检索  -->
					<form action="<%=basePath%>guide/list.do" method="post" name="Form" id="Form">
						<table style="margin-bottom: 20px;">
							<tr>
								<td class="form-inline"><span class="input-icon"> <input
										autocomplete="off" id="nav-search-input" type="text"
										name="title" style="width: 350px" value="${pd.title }"
										placeholder="这里输入标题" onblur="trim(this);" /> <i id="nav-search-icon"
										class="icon-search"></i>
								</span></td>
								<td style="width: 20px"></td>
								<td class="form-inline"><label class="lbl" for="end_time">指南类别：</label>
									<select class="chzn-select" name="category" id="category"
									data-placeholder="请选择指南类别" style="width: 206px;">
										<option value=""></option>
										<option value="">全部</option>
										<c:forEach items="${NList}" var="ind">
											<option value="${ind.distinguish_id }"
												<c:if test="${ind.distinguish_id == pd.category}">selected</c:if>>${ind.value }</option>
										</c:forEach>
								</select></td>
								<td style="width: 20px"></td>
								<td style="vertical-align: top;">
									<button type="button" onclick="search();" class="btn btn-small btn-success btn-lg" title="检索" >查询<i class="icon-search icon-on-right"></i></button>
								</td>
							</tr>
						</table>
						<hr/>
						<!-- 检索  -->
						<table>
							<tbody>
							<tr>
								<td nowrap="nowrap">
									<div class="contentline-both" style="margin-bottom: 10px;">
										<button type="button" class="btn btn-small btn-success btn-lg"  onclick="add()" title="添加">
										新增 <i class="icon-plus-sign icon-on-right"></i>
										</button>
									</div>
								</td>
							</tr>
						  </tbody>
						</table>
						<table id="table_report"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center" style="width: 3%;"><label><input
											type="checkbox" id="zcheckbox" /><span class="lbl"></span></label></th>
									<th class="center" style="width: 5%;">序号</th>
									<th class="center" style="width: 8%;">指南类别</th>
									<th class="center" style="width: 20%;">标题</th>
									<th class="center" style="width: 8%;">审核状态</th>
									<th class="center" style="width: 9%;">指南来源</th>
									<th class="center" style="width: 8%;">发布者</th>
									<th class="center" style="width: 10%;">发布时间</th>
									<th class="center" style="width: 10%;">修改时间</th>
									<th class="center" style="width: 25%;">操作</th>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty varList}">
										<c:forEach items="${varList}" var="ps" varStatus="vs">
											<tr>
												<td class='center'><label><input
														type='checkbox' name='ids' value="${ps.employment_id}" /><span
														class="lbl"></span></label></td>
												<td class='center'>${vs.index+1}</td>
												<td class="center">${ps.category}</td>
												<td class="tds"><a href="javascript:void(0);"
													title="${ps.title}" onclick="info('${ps.employment_id}');">${ps.title}</a></td>
												<td class="center"><c:if test="${ps.status== 0}">未通过</c:if>
													<c:if test="${ps.status== 1}">已通过</c:if> <c:if
														test="${ps.status== 2}">审核中</c:if></td>
												<td class="tds" title="${ps.guide_sources}">${ps.guide_sources}</td>
												<td class="center">${ps.USERNAME}</td>
												<td class="center">${ps.insert_timestamp}</td>
												<td class="center">${ps.update_timestamp}</td>
												<td class="center">
														<a class="btn btn-small btn-info" title="编辑" onclick="edit('${ps.employment_id}');"><i class="icon-edit"></i></a>
														<a class="btn btn-small btn-danger" onclick="del('${ps.employment_id}');" title="删除"><i class="icon-trash"></i></a>
													<c:if test="${QX.edit=='1' || QX.edits =='1'}">
														<c:if test="${ps.status== 0 }">
																<a class='btn btn-small btn-purple' title="通过" onclick="locked('${ps.employment_id}');"><i class="icon-check"></i></a>
														</c:if>
														<c:if test="${ps.status== 1 }">
																<a class='btn btn-small btn-purple' title="驳回" onclick="editStatusNo('${ps.employment_id}');"><i class="icon-reply"></i></a>
														</c:if>
														<c:if test="${ps.status== 2 }">
															<a class='btn btn-small btn-purple' title="通过" onclick="locked('${ps.employment_id}');"><i class="icon-check"></i></a>
															<a class='btn btn-small btn-purple' title="驳回" onclick="editStatusNo('${ps.employment_id}');"><i class="icon-reply"></i></a>
														</c:if>
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
									<td style="vertical-align: top;"><button type="button" class="btn btn-small btn-danger" onclick="makeAll('确定要删除选中的数据吗?')" title="批量删除">
									删除 <i class="icon-remove-sign icon-on-right"></i>
									</button>
									</td>
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
		
		//新增
		function add(){
			window.location="<%=basePath%>guide/to_Add.do";
		}
		
		//修改
		function edit(employment_id){
			window.location="<%=basePath%>guide/toEdit.do?employment_id="+employment_id;
		}
		
		//详情
		function info(employment_id){
			window.location="<%=basePath%>guide/toInfo.do?employment_id="+employment_id;
		}
		
		//审核通过
		function locked(employment_id){
			bootbox.confirm("确定要通过吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>guide/editStatus.do?employment_id="+employment_id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage("${page.currentPage}");
					});
				}
			});
		}
		
		//驳回
		function editStatusNo(employment_id){
			bootbox.confirm("确定要驳回吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>guide/editStatusNo.do?employment_id="+employment_id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage("${page.currentPage}");
					});
				}
			});
		}
		
		//删除
		function del(employment_id,msg){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>guide/deleteGuide.do?employment_id="+employment_id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage("${page.currentPage}");
					});
				}
			});
		}
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					var emstr = '';
					var phones = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(str=='') str += document.getElementsByName('ids')[i].value;
						  	else str += ',' + document.getElementsByName('ids')[i].value;
						  	
						  	if(emstr=='') emstr += document.getElementsByName('ids')[i].id;
						  	else emstr += ';' + document.getElementsByName('ids')[i].id;
						  	
						  	if(phones=='') phones += document.getElementsByName('ids')[i].alt;
						  	else phones += ';' + document.getElementsByName('ids')[i].alt;
						  }
					}
					if(str==''){
						bootbox.dialog("您没有选择任何内容!", 
							[
							  {
								"label" : "关闭",
								"class" : "btn-small btn-success",
								"callback": function() {
									//Example.show("great success");
									}
								}
							 ]
						);
						
						$("#zcheckbox").tips({
							side:3,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>guide/deleteAllGuide.do?tm='
																+ new Date()
																		.getTime(),
														data : {
															IDS : str
														},
														dataType : 'json',
														//beforeSend: validateData,
														cache : false,
														success : function(data) {
															$
																	.each(
																			data.list,
																			function(
																					i,
																					list) {
																				nextPage("${page.currentPage}");
																			});
														}
													});
										} else if (msg == '确定要给选中的用户发送邮件吗?') {
											sendEmail(emstr);
										} else if (msg == '确定要给选中的用户发送短信吗?') {
											sendSms(phones);
										}

									}
								}
							});
		}

		$(function() {
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});

			//复选框
			$('table th input:checkbox').on(
					'click',
					function() {
						var that = this;
						$(this).closest('table').find(
								'tr > td:first-child input:checkbox').each(
								function() {
									this.checked = that.checked;
									$(this).closest('tr').toggleClass(
											'selected');
								});
					});
		});
	</script>
</body>
</html>

