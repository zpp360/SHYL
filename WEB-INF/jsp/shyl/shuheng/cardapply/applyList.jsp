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
<title>电影管理</title>
<base href="<%=basePath%>">
<!-- jsp文件头和头部 -->
<%@ include file="../../../system/admin/top.jsp"%>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>

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
					<form action="<%=basePath%>cardApply/list.do" method="post" name="Form" id="Form">
						<table style="margin-bottom: 20px;">
							<tr>
								<td class="form-inline">
									<label class="lbl" for="">申请类型：</label> 
									<select class="chzn-select" id="apply_card_type" name="apply_card_type" data-placeholder="请选择属性类型">
										<option value="">全部</option>
									    <option value="5" <c:if test="${pd.apply_card_type=='5' }">selected</c:if>>活动证</option>
									    <option value="6" <c:if test="${pd.apply_card_type=='6' }">selected</c:if>>舞厅证</option>
									    <option value="7" <c:if test="${pd.apply_card_type=='7' }">selected</c:if>>停车证</option>
									</select>
								</td>
								<td class="form-inline">
									<label class="lbl" for="">申请状态：</label> 
									<select class="chzn-select" id="status" name="status" data-placeholder="请选择属性类型">
										<option value="">全部</option>
									    <option value="1" <c:if test="${pd.status=='1' }">selected</c:if>>审核中</option>
									    <option value="2" <c:if test="${pd.status=='2' }">selected</c:if>>审核通过</option>
									    <option value="3" <c:if test="${pd.status=='3' }">selected</c:if>>驳回</option>
									</select>
								</td>
								<td style="width: 20px"></td>
								<td style="vertical-align: top;">
									<button type="button" onclick="search();" class="btn btn-small btn-success btn-lg" title="检索" >查询<i class="icon-search icon-on-right"></i></button>
								</td>
								<td style="width: 20px"></td>
							</tr>
						</table>
						<hr/>
						<!-- 检索  -->
<!-- 						<table> -->
<!-- 							<tbody> -->
<!-- 							<tr> -->
<!-- 								<td nowrap="nowrap"> -->
<!-- 									<div class="contentline-both" style="margin-bottom: 10px;"> -->
<!-- 										<button type="button" class="btn btn-small btn-success btn-lg"  onclick="add()" title="添加"> -->
<!-- 										新增 <i class="icon-plus-sign icon-on-right"></i> -->
<!-- 										</button> -->
<!-- 									</div> -->
<!-- 								</td> -->
<!-- 							</tr> -->
<!-- 						  </tbody> -->
<!-- 						</table> -->
						<table id="table_report"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center" style="width:3%;"><label><input type="checkbox"
											id="zcheckbox" /><span class="lbl"></span></label></th> 
									<th class="center" style="width:5%;">序号</th>
									<th class="center" style="width:10%;">申请类型</th>
									<th class="center" style="width:15%;">申请状态</th>
									<th class="center" style="width:15%;">申请人</th>
									<th class="center" style="width:20%;">申请人单位</th>
									<th class="center" style="width:17%;">证件服务单位</th>									
									<th class="center" style="width:15%;">操作</th>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty applyList}">
											<c:forEach items="${applyList}" var="list" varStatus="vs">
												<tr>
													<td class='center' ><label><input
															type='checkbox' name='ids' value="${list.apply_id}" /><span
															class="lbl"></span></label></td>
													<td class='center'>${vs.index+1}</td>
													<td class="center">
														<c:if test="${list.apply_card_type==5}">活动证</c:if>
														<c:if test="${list.apply_card_type==6}">舞厅证</c:if>
														<c:if test="${list.apply_card_type==7}">停车证</c:if>
													</td>
													<td class="center">
														<c:if test="${list.status==0}">初始录入</c:if>
														<c:if test="${list.status==1}">审批中</c:if>
														<c:if test="${list.status==2}">审核通过</c:if>
														<c:if test="${list.status==3}">驳回</c:if>
													</td>
													<td class="center">${list.user_name }</td>
													<td class="center">${list.unit_name }</td>
													<td class="center">${list.apply_service_unit_name }</td>
													<td style="width: 50px;" class="center">
														<a class="btn btn-small btn-info" onclick="viewApply('${list.apply_id}');">查看申请</a>
														<c:if test="${list.status==0}">
															<a class="btn btn-small btn-primary" onclick="apply('${list.apply_id}');" title="申请">申请</a>
														</c:if>
														<c:if test="${pd.isSuperAdmin}">
															<a class="btn btn-small btn-danger" onclick="del('${list.apply_id}');" title="删除"><i class="icon-trash"></i></a>
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
		
		//查看流程
		function viewApply(applyId){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="流程审核";
			 diag.URL = dialogPath+'cardApply/view_apply.do?apply_id='+applyId;
			 diag.Width = 800;
			 diag.Height = 600;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 top.jzts();
					 setTimeout("self.location=self.location",100);
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//新增
		function add(){
			var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = dialogPath+'cardApply/toAdd.do';
			 diag.Width = 800;
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
		function edit(applyId){
			var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = dialogPath+'cardApply/toEdit.do?apply_id='+applyId;
			 diag.Width = 800;
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
	
	
		//删除
		function del(applyId,msg){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>cardApply/del.do?apply_id="+applyId+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage("${page.currentPage}");
					});
				}
			});
		}
		
		function apply(applyId){
			bootbox.confirm("确定要启动申请流程吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>workflow/start_apply.do?apply_id="+applyId+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage("${page.currentPage}");
					});
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
	</script>
</body>
</html>

