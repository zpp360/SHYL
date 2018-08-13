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
<title>活动管理</title>
<base href="<%=basePath%>">
<!-- jsp文件头和头部 -->
<%@ include file="../../../system/admin/top.jsp"%>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js"
	type="text/javascript"></script>

<!-- 引入filmList.js -->
<script type="text/javascript" src="shyl/js/film/filmAdd.js"></script>

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
	text-decoration: none;
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
					<form action="<%=basePath%>sign_up/list.do" method="post"
						name="Form" id="Form">
						<table style="margin-bottom: 20px;">
							<tr>
								<td class="form-inline"><label class="lbl" for="end_time">报名标题：</label>
									<span class="input-icon"> <input autocomplete="off"
										id="sign_up_title" type="text" name="sign_up_title"
										style="width: 350px" value="${pd.sign_up_title}"
										placeholder="这里输入报名标题" onblur="trim(this);" /> <i
										id="nav-search-icon" class="icon-search"></i>
								</span></td>
								<td class="form-inline"><label class="lbl" for="">报名类型：</label>
									<select class="chzn-select" id="sign_up_type"
									name="sign_up_type" data-placeholder="请选择报名类型">
										<option value="">全部</option>
										<c:forEach items="${typeList}" var="list">
											<option value="${list.distinguish_id}"
												<c:if test="${list.distinguish_id==pd.sign_up_type}">selected</c:if>>${list.value}</option>
										</c:forEach>
								</select></td>
								<td style="width: 20px"></td>
								<td style="vertical-align: top;">
									<button type="button" onclick="search();"
										class="btn btn-small btn-success btn-lg" title="检索">
										查询<i class="icon-search icon-on-right"></i>
									</button>
								</td>
								<td style="width: 20px"></td>
							</tr>
						</table>
						<hr />
						<!-- 检索  -->
						<table>
							<tbody>
								<tr>
									<td nowrap="nowrap">
										<div class="contentline-both" style="margin-bottom: 10px;">
											<button type="button"
												class="btn btn-small btn-success btn-lg" onclick="add()"
												title="添加">
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
									<th class="center" style="width: 5%;"><label><input
											type="checkbox" id="zcheckbox" /><span class="lbl"></span></label></th>
									<th class="center" style="width: 5%;">序号</th>
									<th class="center" style="width: 15%;">报名标题</th>
									<th class="center" style="width: 5%;">报名类型</th>
									<th class="center" style="width: 10%;">报名开始时间</th>
									<th class="center" style="width: 10%;">报名结束时间</th>
									<!-- 									<th class="center" style="width:10%;">开始时间</th> -->
									<!-- 									<th class="center" style="width:10%;">结束时间</th> -->
									<th class="center" style="width: 10%;">举办单位</th>
									<th class="center" style="width: 10%;">更新时间</th>
									<th class="center" style="width: 10%;">报名状态</th>
									<th class="center" style="width: 20%;">操作</th>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty listPage}">
										<c:forEach items="${listPage}" var="list" varStatus="vs">
											<tr>
												<td class='center'><label><input
														type='checkbox' name='ids' value="${list.sign_up_id}" /><span
														class="lbl"></span></label></td>
												<td class='center'>${vs.index+1}</td>
												<td class="tds" style="width: 500px"><a
													href="javascript:void(0);" title="${list.sign_up_title}"
													onclick="info('${list.sign_up_id}');">${list.sign_up_title}</a>
												</td>
												<td class="center"><c:if
														test="${list.sign_up_type == '1'}">会议</c:if> <c:if
														test="${list.sign_up_type == '2'}">培训</c:if> <c:if
														test="${list.sign_up_type == '3'}">活动</c:if></td>
												<td class="center">${list.begin_time}</td>
												<td class="center tds">${list.end_time }</td>
												<%-- 													<td class="center tds">${list.going_begin_time}</td> --%>
												<%-- 													<td class="center tds">${list.going_end_time}</td> --%>
												<td class="center tds" title="${list.unit_name_full}">${list.unit_name_full}</td>
												<td class="center tds">${list.update_time}</td>
												<td class="center tds">
													<c:if test="${list.sign_flag=='0'}">已结束</c:if> 
													<c:if test="${list.sign_flag=='1'}">进行中</c:if>
												</td>
												<td style="width: 50px;">
													<a class="btn btn-small btn-primary" onclick="signUpUserDetail('${list.sign_up_id}');" title="查看">查看</a>
													<a class="btn btn-small btn-danger" onclick="deleteSignUp('${list.sign_up_id}');" title="删除"><i class="icon-trash"></i></a> 
													<c:if test="${list.sign_flag=='0'}">
														<a class="btn btn-small btn-info" title="编辑" style="opacity: 0.2;cursor:not-allowed;"><i class="icon-edit"></i></a>
														<a class="btn btn-small btn-purple" title="发送通知" style="opacity: 0.2;cursor:not-allowed;">发送通知</a>
													</c:if> 
													<c:if test="${list.sign_flag=='1'}"> 
														<a class="btn btn-small btn-info" onclick="update('${list.sign_up_id}');" title="编辑"><i class="icon-edit"></i></a>
														<a class="btn btn-small btn-purple" title="发送通知" onclick="send('${list.sign_up_id}');">发送通知</a>
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
										<button type="button" class="btn btn-small btn-danger"
											onclick="makeAll('确定要删除选中的数据吗?')" title="批量删除">
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
			setTimeout("self.location=self.location",100);
		}
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = dialogPath+'sign_up/toAdd.do';
			 diag.Width = 900;
			 diag.Height = 600;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage("${page.currentPage}");
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//详情
		function info(sign_up_id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="详情";
			 diag.URL = dialogPath+'sign_up/toInfo.do?sign_up_id='+sign_up_id;
			 diag.Width = 900;
			 diag.Height = 600;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage("${page.currentPage}");
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//修改
		function update(sign_up_id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="修改";
			 diag.URL = dialogPath+'sign_up/toUpdate.do?sign_up_id='+sign_up_id;
			 diag.Width = 900;
			 diag.Height = 600;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage("${page.currentPage}");
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//发送通知
		function send(sign_up_id){
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="发送通知";
			 diag.URL = dialogPath+'sign_up/toSend.do?sign_up_id='+sign_up_id;
			 diag.Width = 300;
			 diag.Height = 300;
			 
			 diag.OKEvent = function(){//确定事件
				var ids = diag.innerFrame.contentWindow.user_id;
			 	var notifiId = diag.innerFrame.contentWindow.notifiId;
			 	if(ids!=""){
			 		$.ajax({
						type: "POST",
						url: "<%=basePath%>sign_up/send.do",
						data:{
							ids:ids.value,
							notifiId:notifiId.value,
							sign_up_id:sign_up_id
						},
						dataType:"json",
						cache : false,
						success:function(data){
							setTimeout("self.location=self.location",100);
						},
						error:function(){
							alert("系统异常！");
						}
					});
			 	}
	 			diag.close();
				};
			 
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		
		//查看
		function signUpUserDetail(sign_up_id){
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Width = 1500;
			diag.Height = 650;
			diag.Title = "查看";
			diag.ShowButtonRow = false;
			diag.URL = dialogPath + "sign_up/signUpUserDetail.do?sign_up_id="+sign_up_id;
			
			diag.OKEvent = function(){//确定事件
 				diag.close();
			};
			
 			diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			diag.show();
		}
		
		//删除
		function deleteSignUp(sign_up_id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					$.ajax({
						type: "POST",
						url: "<%=basePath%>sign_up/deleteSignUp.do",
						data:
							{
								sign_up_id:sign_up_id
							},
						dataType:"json",
						cache : false,
						success:function(data){
							if(!data){
								alert("请先删除关联的智能会议！");
							}
							nextPage("${page.currentPage}");
						}
					});
				}
			});
		}
		
		
		//批量操作
		function makeAll(msg){
			
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
			
			bootbox.confirm(msg, function(result) {
				if(result) {
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: "<%=basePath%>sign_up/deleteBatch.do",
							data : {
								str : str
							},
							dataType : "json",
							cache : false,
							success : function(data) {
								nextPage("${page.currentPage}");
							}
						});
					}
				}
			});
		}
	</script>
	<script type="text/javascript">
		$(function() {

			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});

			//复选框
			$("#zcheckbox").click(function() {
				if (this.checked) {//如果 全选按钮被选中，所有的复选框都被选中
					$('[name=ids]').attr("checked", true);
				} else {//如果全选按钮取消，所有的复选框都取消
					$('[name=ids]').attr("checked", false);
				}
			});

			//当复选框组有一个没被选中时，取消全选按钮的选中状态
			$('[name=ids]').click(function() {
				var flag = true;//定义变量为ture
				$('[name=ids]').each(function() {//遍历复选框组
					if (!this.checked) {//如果有一个不是选中状态
						flag = false;
					}
				});
				$('#zcheckbox').attr("checked", flag);//通过遍历 flag的值 为全选框赋状态
			});

		});
	</script>
</body>
</html>

