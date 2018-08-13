<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<title>公益讲堂列表展示</title>
<base href="<%=basePath%>">
<%@ include file="../../../system/admin/top.jsp"%>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>

<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/ace-elements.min.js"></script>
<script src="static/js/ace.min.js"></script>
<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="static/js/jquery.tips.js"></script>

<script type="text/javascript" src="static/js/bootbox.min.js"></script>

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
				<form action="<%=basePath%>volunteerClass/list.do" method="post" name="Form" id="Form">
					<table style="margin-bottom: 20px;">
						<tr>
							<td class="form-inline">
							<label class="lbl" for="end_time">活动名称：</label>
								<span class="input-icon"> 
									<input autocomplete="off" id="class_name" type="text" name="class_name" value="${pd.class_name}" placeholder="这里输入名称" onblur="trim(this);" /> 
									<i id="nav-search-icon" class="icon-search"></i>
								</span></td>
							<td style="width: 20px"></td>
							<td style="vertical-align: top;">
								<button type="button" onclick="search();" class="btn btn-small btn-success btn-lg" title="检索" >查询<i class="icon-search icon-on-right"></i></button>
							</td>
						</tr>
					</table>
					<hr/>
					<c:if test="${!pd.superAdmin}">
						<table>
							<tbody>
								<tr>
									<td nowrap="nowrap">
										<div class="contentline-both" style="margin-bottom: 10px;">
											<button type="button" class="btn btn-small btn-success btn-lg"  onclick="add()" title="添加">添加 <i class="icon-plus-sign icon-on-right"></i></button>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</c:if>
					<table id="table_report" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class="center" style="width:5%;"><label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label></th> 
								<th class="center" style="width:5%;">序号</th>
								<th class="center" style="width:35%;">公益讲堂名称</th>
								<th class="center" style="width:20%;">来源</th>
								<th class="center" style="width:20%;">更新时间</th>
								<c:if test="${!pd.superAdmin}">
									<th class="center" style="width:15%;">操作</th>
								</c:if>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty listPage}">
										<c:forEach items="${listPage}" var="list" varStatus="vs">
											<tr>
												<td class='center' ><label>
													<input type='checkbox' name='ids' value="${list.class_id}" /><span class="lbl"></span></label>
												</td>
												<td class='center' >${vs.index+1}</td>
												<td class="center tds"><a href="javascript:void(0);" title="${list.class_name}" onclick="info('${list.class_id}');">${list.class_name}</a></td>	
												<td class="center tds" title="${list.class_source}">${list.class_source}</td>
												<td class="center tds" title="${list.update_time}">${list.update_time}</td>
												<c:if test="${!pd.superAdmin}">		
													<td class="center" style="width: 50px;">
														<a class="btn btn-mini btn-info" title="编辑" onclick="update('${list.class_id}');"><i class="icon-edit"></i></a>
														<a class="btn btn-mini btn-danger" onclick="deleteClass('${list.class_id}');" title="删除"><i class="icon-trash"></i></a>
													</td>
												</c:if>	
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
								<c:if test="${!pd.superAdmin}">
									<td style="vertical-align: top;">
										<button type="button" class="btn btn-small btn-danger" onclick="deleteBatch('确定要删除选中的数据吗?')" title="批量删除">
											删除 <i class="icon-remove-sign icon-on-right"></i>
										</button>
									</td>
								</c:if>
								<td style="vertical-align: top;">
									<div class="pagination" style="float: right; padding-top: 0px; margin-top: 0px;">${page.pageStr}</div>
								</td>
							</tr>
						</table>
					</div>
				</form>
			</div>
	</div>
	</div>
	<script type="text/javascript">
		$(top.hangge());
		
		$(document).ready(function(){
			
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

		//检索
		function search(){
			top.jzts();
			$("#Form").submit();
			nextPage('${page.currentPage}');
		}
		//新增
		function add(){
			window.location = "<%=basePath%>volunteerClass/toAdd.do";
		}
		//详情
		function info(class_id){
			window.location = "<%=basePath%>volunteerClass/toInfo.do?class_id="+class_id;
		}
		//修改
		function update(class_id){
			window.location = "<%=basePath%>volunteerClass/toUpdate.do?class_id="+class_id;
		}
		
		//删除
		function deleteClass(class_id){
			bootbox.confirm("确定要删除吗?", function(result){
				if(result){
					top.jzts();
					$.ajax({
						type : "POST",
						url : "<%=basePath%>volunteerClass/deleteVolunteerClass.do?tm=" + new Date().getTime(),
						dataType : "text",
						cache : false,
						data :{class_id:class_id},
						success:function(data){
							if(data){
								setTimeout("self.location=self.location",100);
							}
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
						url : "<%=basePath%>volunteerClass/deleteBatch.do?tm=" + new Date().getTime(),
						dataType : "json",
						cache : false,
						data :{str:str},
						success:function(data){
							if(data){
								setTimeout("self.location=self.location",100);
							}
						}
					});
				}
			});
			
			
		}
		
		//志愿者
		function volunteer(active_id){
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="志愿者";
			 diag.URL = dialogPath+'active/volunteerList.do?active_id='+active_id;
			 diag.Width = 1000;
			 diag.Height = 600;
			 diag.CancelEvent = function(){ //关闭事件
			 	setTimeout("self.location=self.location",100);
				diag.close();
			 };
			 diag.show();
		}
		
		
	</script>
	
</body>
</html>