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
.tds p{  
    width:100%;  
    word-break:keep-all;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
    vertical-align: middle;
    margin: 0 0 0px;
} 
</style>
</head>
<body>
	<div class="container-fluid" id="main-container">
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<div class="row-fluid">
				<form action="<%=basePath%>feedback/questionFeedbacklist.do" method="post" id="forms" class="form-horizontal">
						<div class="row-fluid" style="margin-bottom: 20px;">
						<div class="form-inline" style="float: left;">
						<label class="lbl" for="repair_title" ></label>
									<span class="input-icon"><input
										autocomplete="off" id="nav-search-input" type="text"
										name="title" style="width: 350px" value="${pd.title }"
										placeholder="请输入意见标题" onblur="trim(this);" maxlength="100"/><i id="nav-search-icon"
										class="icon-search"></i>
								</span>
						</div>
						<div class="form-inline" style="float: left;margin-left: 20px;">
                        <button type="button" onclick="search();" class="btn btn-small btn-success btn-lg" title="检索" >查询<i class="icon-search icon-on-right"></i></button>
						</div>
						</div>
						<!-- 检索  -->
						<hr></hr>
						<table>							
						</table>
						<table id="table_report"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									 <th class="center" style="width:3%;">
									 	<label>
										 	<input type="checkbox" id="zcheckbox" />
										 	<span class="lbl"></span>
									 	</label>
									 </th> 								
									<th class="center" style="width:5%;">序号</th>
									<th class="center" style="width:23%;">意见标题</th>
									<th class="center" style="width:23%;">意见描述</th>
									<th class="center" style="width:6%;">反馈者</th>
									<th class="center" style="width:10%;">反馈时间</th>
									<th class="center" style="width:6%;">处理情况</th>
									<th class="center" style="width:10%;">处理时间</th>
									<th class="center" style="width:15%;">操作</th>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty resultList}">
										
											<c:forEach items="${resultList}" var="vars" varStatus="vs">
												<tr>
													<td class='center'>
														<label><input type='checkbox' name='ids' value="${vars.id}"/><span class="lbl"></span></label>
													</td>												
													<td class='center'>${vs.index+1}</td>	
													<td class="tds" style="width:115px;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"><a href="javascript:void(0);" title="${vars.title}" onclick="info('${vars.id }');">${vars.title}</a>
													</td>
													<td class='tds' style="width:115px;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title="${vars.description }">${vars.description }</td>
													<td class='tds'>${vars.insert_user }</td>
													<td class='center'>${vars.insert_date}</td>
													<c:if test="${vars.flag == 0}">
														<td class='center'>未处理</td>
													</c:if>
													<c:if test="${vars.flag == 1}">
														<td class='center'>已处理</td>
													</c:if>
													<td class='center'>${vars.update_date}</td>
													<td class='center'>
													<c:if test="${vars.flag == 0}">
														<a class="btn btn-small btn-info" title="处理" onclick="edit('${vars.id }','${vars.email }','${vars.title}');"><i class="icon-edit"></i></a>
													</c:if>	
													<c:if test="${vars.flag == 1}">
														<a class="btn btn-small btn-danger" title="删除" onclick="deleteFeedback('${vars.id }');"><i class="icon-trash"></i></a>
													</c:if>																									
													<a class="btn btn-small btn-purple" href="javascript:void(0);" title="下载" 
													onclick="downloadFile('${vars.appendix_name}','${vars.appendix_path}');"><i class=" icon-download-alt"></i> </a>													
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
									<td style="vertical-align: top;">
										<button type="button" class="btn btn-small btn-danger" onclick="batchDelete('确定要删除选中的数据吗?')" title="批量删除">删除 
											<i class="icon-remove-sign icon-on-right"></i>
										</button>
									</td>
									<td style="vertical-align: top;">
										<div class="pagination" style="float: right; padding-top: 0px; margin-top: 0px;">${page.pageStr}</div>
									</td>
								</tr>
							</table>
						</div>
					</ >
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

	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!--提示框-->
	<script type="text/javascript">
		
		$(top.hangge());
		
		//检索
		function search(){
			top.jzts();
			$("#forms").submit();
		}							
		//详细
		function  info(id){
			window.location="<%=basePath%>feedback/toQuestionFeedbackInfo.do?id="+id;
		}
		//下载 
		function downloadFile(name,path) {
			if(!!name && !!path){
				path =  encodeURI(encodeURI(path));
	 			name =  encodeURI(encodeURI(name));				
				$.ajax({
					type:"GET",
					url: "<%=basePath%>feedback/checkDownloadFile.do?fileName=" + name+ "&filePath=" + path,
					dataType : 'json',
					cache : false,
					success : function(data) {
						if ("error" == data.result) {
							bootbox.confirm("没有可下载的文件");
						}else{
							$("#forms").attr("action","<%=basePath%>feedback/feedbackDownload.do?fileName=" + name+ "&filePath=" + path);
							$("#forms").submit();
							$("#forms").attr("action","<%=basePath%>feedback/questionFeedbacklist.do");
						}					
					}
				});				
			}else{
				bootbox.confirm("没有可下载的文件");
			}
		}
		//修改
		function edit(id,email,title){
			$.post('<%=basePath%>feedback/edit.do', {id:id,email:email,title:title}, function(data){
				if ("success" == data.result) {
					bootbox.confirm("反馈意见处理成功");
					window.location="<%=basePath%>feedback/questionFeedbacklist.do";
				}
			});
		}
		//删除
		function deleteFeedback(id){
			bootbox.confirm("确定要删除该条数据吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>feedback/deleteFeedback.do?id="+id;
					$.get(url,function(data){
						nextPage("${page.currentPage}");
					});
				}
			});
		}
		//批量操作
		function batchDelete(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(str=='') str += document.getElementsByName('ids')[i].value;
						  	else str += ',' + document.getElementsByName('ids')[i].value;						  							  	
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
								url: '<%=basePath%>feedback/batchDelete.do',
						    	data: {IDS:str},
								dataType:'json',
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage("${page.currentPage}");
									 });
								}
							});
						}												
					}
				}
			});
		}
	</script>
	<script type="text/javascript">		
		$(function() {
			//复选框
			$('table th input:checkbox').on('click' , function(){
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function(){
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});					
			});			
		});
	</script>
</body>
</html>

