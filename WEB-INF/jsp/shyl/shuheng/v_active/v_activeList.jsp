<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<title>志愿者活动列表展示</title>
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
				<form action="<%=basePath%>active/list.do" method="post" name="Form" id="Form">
					<table style="margin-bottom: 20px;">
						<tr>
							<td class="form-inline">
							<label class="lbl" for="end_time">活动名称：</label>
								<span class="input-icon"> 
									<input autocomplete="off" id="active_name" type="text" name="active_name" value="${pd.active_name}" placeholder="这里输入活动名称" onblur="trim(this);" /> 
									<i id="nav-search-icon" class="icon-search"></i>
								</span></td>
							<td class="form-inline">
								<label class="lbl" for="">活动类型：</label> 
								<select id="active_type" class="chzn-select" name="active_type"  data-placeholder="请选择类型">
									<option value="">全部</option>
									<c:forEach items="${typeList}" var="list">
										<option value="${list.distinguish_id}" <c:if test="${list.distinguish_id==pd.active_type}">selected</c:if>>${list.value}</option>
									</c:forEach>
								</select>
							</td>
							<c:if test="${!pd.isEdit}">
								<td class="form-inline">
									<label class="lbl" for="">服务组织或需求单位：</label> 
									<select id="id" class="chzn-select" name="id"  data-placeholder="请选择服务组织或需求单位">
										<option value="">全部</option>
										<c:forEach items="${selectAllList}" var="list">
											<option value="${list.id}" <c:if test="${list.id==pd.id}">selected</c:if>>${list.name}</option>
										</c:forEach>
									</select>
								</td>
							</c:if>
							
							<td style="width: 20px"></td>
							<td style="vertical-align: top;">
								<button type="button" onclick="search();" class="btn btn-small btn-success btn-lg" title="检索" >查询<i class="icon-search icon-on-right"></i></button>
							</td>
						</tr>
					</table>
					<hr/>
					<c:if test="${pd.isEdit}">
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
								<th class="center" style="width:3%;"><label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label></th> 
								<th class="center" style="width:5%;">序号</th>
								<th class="center" style="width:15%;">活动名称</th>
								<th class="center" style="width:5%;">活动类型</th>
								<th class="center" style="width:5%;">招募人数</th>
								<th class="center" style="width:10%;">开始时间</th>
								<th class="center" style="width:10%;">结束时间</th>
								<th class="center" style="width:5%;">爱心小时数</th>
								<th class="center" style="width:5%;">联系人</th>
								<th class="center" style="width:7%;">联系电话</th>
								<th class="center" style="width:10%;">发布者</th>
								<th class="center" style="width:10%;">更新时间</th>
								<th class="center" style="width:10%;">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty selectList}">
										<c:forEach items="${selectList}" var="list" varStatus="vs">
											<tr>
												<td class='center' ><label>
													<input type='checkbox' name='ids' value="${list.active_id}" /><span class="lbl"></span></label>
												</td>
												<td class='center' >${vs.index+1}</td>
												<td class="center tds"><a href="javascript:void(0);" title="${list.active_name}" onclick="info('${list.active_id}');">${list.active_name}</a></td>	
												<td class="center tds">
												<c:if test="${list.active_type=='1'}">扶贫济困</c:if>
												<c:if test="${list.active_type=='2'}">助老助残</c:if>
												<c:if test="${list.active_type=='3'}">生态建设</c:if>
												<c:if test="${list.active_type=='4'}">平安巡防</c:if>
												<c:if test="${list.active_type=='5'}">实践培训</c:if>
												<c:if test="${list.active_type=='6'}">社区服务</c:if>
												<c:if test="${list.active_type=='7'}">大型活动</c:if>
												<c:if test="${list.active_type=='8'}">抢险救灾</c:if>
												<c:if test="${list.active_type=='9'}">网络文明</c:if>
												<c:if test="${list.active_type=='10'}">社会管理</c:if>
												<c:if test="${list.active_type=='11'}">文化建设</c:if>
												<c:if test="${list.active_type=='12'}">海外服务</c:if>
												<c:if test="${list.active_type=='13'}">西部开发</c:if>
												<c:if test="${list.active_type=='14'}">三下乡</c:if>
												<c:if test="${list.active_type=='15'}">平安志愿</c:if>
												<c:if test="${list.active_type=='16'}">应急救援</c:if>
												<c:if test="${list.active_type=='17'}">公益小天使</c:if>
												</td>
												<td class="center tds" title="${list.active_count}">${list.active_count}</td>
												<td class="center tds" title="${list.active_start_time}">${list.active_start_time}</td>
												<td class="center tds" title="${list.active_end_time}">${list.active_end_time}</td>
												<td class="center tds" title="${list.active_love_hour}">${list.active_love_hour}</td>
												<td class="center tds" title="${list.active_linkman}">${list.active_linkman}</td>		
												<td class="center tds" title="${list.active_linkman_phone}">${list.active_linkman_phone}</td>
												<td class="center tds" title="${list.active_organization}">${list.or_name}</td>
												<td class="center tds" title="${list.update_time}">${list.update_time}</td>
												
													<td class="center" style="width: 50px;">
														<a class="btn btn-mini btn-success" title="志愿者" onclick="volunteer('${list.active_id}');">志愿者</a>
														<c:if test="${pd.isEdit}">
															<a class="btn btn-mini btn-info" title="编辑" onclick="update('${list.active_id}');"><i class="icon-edit"></i></a>
															<a class="btn btn-mini btn-danger" onclick="deleteActive('${list.active_id}');" title="删除"><i class="icon-trash"></i></a>
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
								<c:if test="${pd.isEdit}">
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
			window.location = "<%=basePath%>active/toAdd.do";
		}
		//详情
		function info(active_id){
			window.location = "<%=basePath%>active/toInfo.do?active_id="+active_id;
		}
		//修改
		function update(active_id){
			window.location = "<%=basePath%>active/toUpdate.do?active_id="+active_id;
		}
		
		//删除
		function deleteActive(active_id){
			bootbox.confirm("确定要删除吗?", function(result){
				if(result){
					top.jzts();
					$.ajax({
						type : "POST",
						url : "<%=basePath%>active/deleteActive.do?tm=" + new Date().getTime(),
						dataType : "text",
						cache : false,
						data :{active_id:active_id},
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
						url : "<%=basePath%>active/deleteBatch.do?tm=" + new Date().getTime(),
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