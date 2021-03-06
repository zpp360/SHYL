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
					<form action="<%=basePath%>volunteer/list.do" method="post" name="Form" id="Form">
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
									<th class="center" style="width:3%;"><label><input type="checkbox"
											id="zcheckbox" /><span class="lbl"></span></label></th> 
									<th class="center" style="width:5%;">序号</th>
									<th class="center" style="width:20%;">用户名</th>
									<th class="center" style="width:30%;">单位</th>
									<th class="center" style="width:12%;">爱心小时数</th>
									<th class="center" style="width:15%;">加入时间</th>
									<th class="center" style="width:15%;">操作</th>
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
													<td class="center tds">
														<a href="javascript:void(0);" title="${list.user_name}" onclick="info('${list.volunteer_id}');">${list.user_name }</a>
													</td>
													<td class="center tds" title="${list.unit_name}">${list.unit_name} </td>
													<td class="center tds" title="${list.volunteer_love_hour}">${list.volunteer_love_hour}</td>
													<td class="center tds" title="${list.create_time}">${list.create_time }</td>
													<td  class="center">
<%-- 														<a class="btn btn-mini btn-danger" onclick="del('${list.volunteer_id}');" title="删除"><i class="icon-trash"></i></a> --%>
														<a class="btn btn-mini btn-success" title="获奖" onclick="award('${list.volunteer_id}');">获奖详情</a>
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
<!-- 									<td style="vertical-align: top;"> -->
<!-- 									<button type="button" class="btn btn-small btn-danger" onclick="deleteBatch('确定要删除选中的数据吗?')" title="批量删除"> -->
<!-- 										删除 <i class="icon-remove-sign icon-on-right"></i> -->
<!-- 									</button> -->
<!-- 									</td> -->
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

			//复选框
			$("#zcheckbox").click(function(){
				if(this.checked){//如果 全选按钮被选中，所有的复选框都被选中
					$('[name=ids]').attr("checked",true);
				}else{//如果全选按钮取消，所有的复选框都取消
					$('[name=ids]').attr("checked",false);
				}
			});
			
			//当复选框组有一个没被选中时，取消全选按钮的选中状态
			$('[name=ids]').click(function(){
				var flag = true;//定义变量为ture
				$('[name=ids]').each(function(){//遍历复选框组
					if(!this.checked){//如果有一个不是选中状态
						flag = false;
					}
				});
				$('#zcheckbox').attr("checked",flag);//通过遍历 flag的值 为全选框赋状态
			});	
			
		});
		
		//删除
		function del(volunteer_id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					$.ajax({
						type: "POST",
						url: "<%=basePath%>volunteer/delete.do",
						data:
							{
							volunteer_id:volunteer_id
							},
						dataType:"json",
						cache : false,
						success:function(data){
							setTimeout("self.location=self.location",100);
						}
					});
				}
			});
		}
		
		//批量删除
		function deleteBatch(){
			var str = "";
			$('[name=ids]').each(function(){//遍历复选框组
				if(this.checked){
					if(str == ""){
						str = this.value;
					}else{
						str = str + "," + this.value;
					}
				}
			});
			if(str.length == 0){
				bootbox.dialog("请选择要删除的内容！",
					[
						{
						"label" : "关闭",
						"class" : "btn-small btn-success",
						"callback": function() {
								
							}
						}
					]			
				);
				return false;
			}
			
			bootbox.confirm("确定要删除选中的数据吗?", function(result){
				if(result){
					top.jzts();
					$.ajax({
						type : "POST",
						url : "<%=basePath%>volunteer/deleteBatch.do?tm=" + new Date().getTime(),
						dataType : "json",
						cache : false,
						data :{str:str},
						success:function(data){
							setTimeout("self.location=self.location",100);
						}
					});
				}
			});
			
			
		}
		
		//详情
		function info(volunteer_id){
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="详情";
			 diag.URL = dialogPath+'volunteer/toInfo.do?volunteer_id='+volunteer_id;
			 diag.Width = 600;
			 diag.Height = 550;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 setTimeout("self.location=self.location",100);
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//获奖信息
		function award(volunteer_id){
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Width = 1000;
			diag.Height = 600;
			diag.Title = "获奖信息";
			diag.ShowButtonRow = false;
			diag.URL = dialogPath + "volunteer/awardList.do?volunteer_id="+volunteer_id;
			
			diag.show();
			
		}
		
	</script>
</body>
</html>

