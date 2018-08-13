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
<title>试卷管理_济南市服务外包公共服务平台</title>
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
					<form action="<%=basePath%>examPaper/list.do" method="post" name="Form" id="Form">
						<input type="hidden" id="knowledges" value="${pd.knowledge}"/>
						<table style="margin-bottom: 20px;">
							<tr>
								<td class="form-inline"><span class="input-icon"> <input
										autocomplete="off" id="nav-search-input" type="text"
										name="title" style="width: 236px" value="${pd.title}"
										placeholder="这里输入试卷名称" onblur="trim(this);" /> <i id="nav-search-icon"
										class="icon-search"></i>
								</span></td>
								<td style="width: 20px"></td>
								<td class="form-inline"><label class="lbl" for="end_time">题库：</label>
									<select class="chzn-select" name="fieldType" id="fieldType"
									data-placeholder="请选择题库类别" >
										<option value=""></option>
										<option value="">全部</option>
										<c:forEach items="${fieldList}" var="ind">
											<option value="${ind.fieldId}"
												<c:if test="${ind.fieldId == pd.fieldType}">selected</c:if>>${ind.fieldName }
											</option>
										</c:forEach>
								</select></td>
								<td style="width: 20px"></td>
								<td class="form-inline"><label class="lbl" for="end_time">知识分类：</label>
									<select class="chzn-select" name="knowledge" id="knowledge"
									data-placeholder="请选择知识类别" >
										<option value=""></option>
										<option value="">全部</option>
								</select></td>
							</tr>
							<tr>
								<td class="form-inline"><label class="lbl" for="paper_status">状态：</label> 
								<select class="chzn-select" name="paper_status" data-placeholder="请选择状态">
										<option value=""></option>
										<option value="">全部</option>
										<option value="0"
											<c:if test="${pd.paper_status == '0'}">selected</c:if>>未上线</option>
										<option value="1"
											<c:if test="${pd.paper_status == '1'}">selected</c:if>>已上线</option>
										<option value="2"
											<c:if test="${pd.paper_status == '2'}">selected</c:if>>已下线</option>
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
									<th class="center" style="width: 24%;">试卷名称</th>
									<th class="center" style="width: 16%;">时长</th>
									<th class="center" style="width: 10%;">题库</th>
									<th class="center" style="width: 20%;">知识分类</th>
									<th class="center" style="width: 20%;">参与人数</th>
									<th class="center" style="width: 10%;">创建人</th>
									<th class="center" style="width: 10%;">状态</th>
									<th class="center" style="width: 30%;">操作</th>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty varList}">
										<c:forEach items="${varList}" var="ps" varStatus="vs">
											<tr>
												<td class='center'><label><input
														type='checkbox' name='ids' id="${ps.statust}" value="${ps.id}" /><span
														class="lbl"></span></label></td>
												<td class='center'>${vs.index+1}</td>
												<td class="tds"><a href="javascript:void(0);"
													title="${ps.name}" onclick="info('${ps.id}');">${ps.name}</a></td>
												<td class="center">${ps.duration}分钟</td>
												<td class="tds" title="${ps.field_name}">${ps.field_name}</td>
												<td class="tds" title="${ps.point_name}">${ps.point_name}</td>
												<c:if test="${ps.total != null && ps.total != ''}">
													<td class="center">
														<a href="<%=basePath%>backtester/list.do?id=${ps.id}">${ps.total}</a>
													</td>
												</c:if>
												<c:if test="${ps.total == null || ps.total == ''}">
													<td class="center">0</td>
												</c:if>
												<td class="center">${ps.creator}</td>
												<c:if test="${ps.statust==0}">
												<td class="center">未上线</td>
												</c:if>
												<c:if test="${ps.statust==1}">
												<td class="center">已上线</td>
												</c:if>
												<c:if test="${ps.statust==2}">
												<td class="center">已下线</td>
												</c:if>
												<td class="center">
													<c:if test="${ps.statust==0}">
														<a class="btn btn-small btn-info" title="修改内容"
														    onclick="editContent('${ps.id}','${ps.field_id}','${ps.point_id}','${ps.pass_point}');"><i class="icon-edit"></i></a>
														<a class='btn btn-small btn-purple' title="修改属性"
														    onclick="editAttribute('${ps.id}');"><i class="icon-wrench"></i></a>
														<a class='btn btn-small btn-success' title="上线"
														    onclick="toOnline('${ps.id}');"><i class="icon-circle-arrow-up"></i></a>
														<a class="btn btn-small btn-danger"
														    onclick="del('${ps.id}');" title="删除"><i class="icon-trash"></i></a>
													</c:if>
													<c:if test="${ps.statust==1}">
														<a class="btn btn-small btn-warning"
														    onclick="toOffline('${ps.id}');" title="下线"><i class="icon-circle-arrow-down"></i></a>
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
									<td style="vertical-align: top;">
											<button type="button" class="btn btn-small btn-danger" onclick="makeAll('确定要删除选中的数据吗?')" title="批量删除">
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
			window.location="<%=basePath%>examPaper/to_Add.do";
		}
		
		//详情
		function info(id){
			window.location="<%=basePath%>examPaper/toInfo.do?generatedId="+id;
		}
		
		//修改内容
		function editContent(id,fieldId,pointId,passPoint){
			window.location="<%=basePath%>examPaper/to_Edit.do?generatedId="+id+"&fieldNum="+fieldId+"&pointNum="+pointId+"&passPoint="+passPoint+"&flagType=2";
		}
		
		//修改属性
		function editAttribute(id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="修改属性";
			 diag.URL = dialogPath+'examPaper/goEditAttribute.do?id='+id;
			 diag.Width = 550;
			 diag.Height = 260;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage("${page.currentPage}");
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//上线
		function toOnline(id){
			bootbox.confirm("确定要上线吗?上线后的试卷将可以进行考试。", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>examPaper/toOnline.do?id="+id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						if(data=="error"){
							alert("上线失败，请先下线已经上线的试题",function(){});
						}
						nextPage("${page.currentPage}");
					});
				}
			});
		}
		
		//下线
		function toOffline(id){
			bootbox.confirm("确定要下线吗?下线后的试卷将无法再进行考试。", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>examPaper/toOffline.do?id="+id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage("${page.currentPage}");
					});
				}
			});
		}
		
		//删除单条数据
		function del(id,msg){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>examPaper/deletePaper.do?id="+id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage("${page.currentPage}");
					});
				}
			});
		}
		
		// 批量删除
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
					}
					if(emstr.indexOf(1) > -1 || emstr.indexOf(2) > -1){
						bootbox.dialog("所选试卷中含有已上线或已下线的试卷!", 
								[
								  {
									"label" : "关闭",
									"class" : "btn-small btn-success",
									"callback": function() {
										}
									}
								 ]
							);
						return;
					} else{
						if (msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>examPaper/deleteAllExam.do?tm='
																+ new Date()
																		.getTime(),
														data : {
															IDS : str
														},
														dataType : 'json',
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
			
// 			var knowledges = $("#knowledges").val();
// 			if(""!=knowledges){
// 				knowledgeGet(knowledges);
// 			}else{
// 				knowledgeGet(0);
// 			}
// 			$("#fieldType").change(function() {
// 				knowledgeGet(0);
// 			});
			
		});
		
// 		function knowledgeGet(cid) {
// 			var PID = $("#fieldType").val();
// 			$("#knowledge").empty();
// 			if (PID == "") {
// 		        $("<option value=''>全部</option>").appendTo("#knowledge");
// 		    }else{
// 		    	$.ajax({
// 					type:"POST",
<%-- 					url:"<%=basePath%>examPaper/getKnowledges.do", --%>
// 					data:{'PID' : PID},
// 					dataType:"json",
// 					cache:false,
// 					success:function(data){
// 						var html='<option value="">全部</option>';
// 						$.each(data.knowledgelist,function(i,list){
// 							console.info(data.knowledgelist);
// 							if(list.id==cid){
// 								if(cid!=0){
// 									html+="<option value="+list.id+" selected='selected' >"+list.name+"</option>";
// 								}
// 							}else{
// 								html+="<option value="+list.id+">"+list.name+"</option>";
// 							}
// 						});
// 						$("#knowledge").append(html);
// 						$("#knowledge").trigger("liszt:updated");
// 					}
// 				});
// 		    }
// 		}
	</script>
</body>
</html>

