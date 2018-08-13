<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<title>banner列表展示</title>
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
				<form action="<%=basePath%>app/bannerList.do" method="post" name="Form" id="Form">
					<table style="margin-bottom: 20px;">
						<tr>
							<td class="form-inline"><label class="lbl" for="end_time">标题：</label>
								<span class="input-icon"> 
									<input autocomplete="off" maxlength="50" id="banner_title" type="text" name="banner_title" style="width: 200px" value="${pd.banner_title}" placeholder="这里输入标题" onblur="trim(this);"/>
									<i id="nav-search-icon" class="icon-search"></i>
								</span>
							</td>
							<td class="form-inline">
								<label class="lbl" for="">类型：</label> 
								<select class="chzn-select" id="banner_type" name="banner_type" data-placeholder="请选择类型">
									<option value="">全部</option>
									<c:forEach items="${typeList}" var="list">
										<option value="${list.distinguish_id}" <c:if test="${list.distinguish_id == pd.banner_type}">selected</c:if>>${list.value}</option>
									</c:forEach>
								</select>
							</td>
							<td class="form-inline">
								<label class="lbl" for="">状态：</label> 
								<select class="chzn-select" id="status" name="status" data-placeholder="请选择状态">
									<option value="">全部</option>
									<option value="0" <c:if test="${pd.status == '0'}">selected</c:if>>下架</option>
									<option value="1" <c:if test="${pd.status == '1'}">selected</c:if>>上架</option>
								</select>
							</td>
							<td style="width: 20px"></td>
							<td style="vertical-align: top;">
								<button type="button" onclick="search();" class="btn btn-small btn-success btn-lg" title="检索"> 查询
									<i class="icon-search icon-on-right"></i>
								</button>
							</td>
							<td style="width: 20px"></td>
						</tr>
					</table>
					<hr/>
						<table>
							<tbody>
								<tr>
									<td nowrap="nowrap">
										<div class="contentline-both" style="margin-bottom: 10px;">
											<button type="button" 
											<c:if test="${pd.flag}">disabled="disabled"</c:if> 
											class="btn btn-small btn-success btn-lg"  onclick="add()" title="添加">添加 <i class="icon-plus-sign icon-on-right"></i></button>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					<table id="table_report" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class="center" style="width:5%;"><label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label></th> 
								<th class="center" style="width:5%;">序号</th>
								<th class="center" style="width:20%;">标题</th>
								<th class="center" style="width:10%;">类型</th>
								<th class="center" style="width:5%;">状态</th>
								<th class="center" style="width:13%;">更新时间</th>
								<th class="center" style="width:12%;">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty pdList}">
										<c:forEach items="${pdList}" var="list" varStatus="vs">
											<tr>
												<td class='center' ><label>
													<input type='checkbox' name='ids' value="${list.banner_id}" /><span class="lbl"></span></label>
												</td>
												<td class='center' >${vs.index+1}</td>
												<td class="center tds">${list.banner_title}</td>
												<td class="center tds">
													<c:if test="${list.banner_type == '1'}">评选</c:if>
												</td>
												<td class="center tds">
													<c:if test="${list.status == '0'}">已下架</c:if>
													<c:if test="${list.status == '1'}">已上架</c:if>
												</td>
												<td class="center tds">${list.update_time}</td>
												<td class="center" style="width: 50px;">
													<a class="btn btn-small btn-info" title="编辑" onclick="updateBanner('${list.banner_id}');"><i class="icon-edit"></i></a>
													<a class="btn btn-small btn-danger" onclick="deleteBanner('${list.banner_id}');" title="删除"><i class="icon-trash"></i></a>
													<c:if test="${list.status == 0}">
														<a class="btn btn-small btn-warning" onclick="updateStatus('${list.banner_id}',this,'${list.status}')">上架</a>
													</c:if>
													<c:if test="${list.status == 1}">
														<a class="btn btn-small btn-warning" onclick="updateStatus('${list.banner_id}',this,'${list.status}')">下架</a>
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
									<button type="button" class="btn btn-small btn-danger" onclick="deleteBatch('确定要删除选中的数据吗?')" title="批量删除">删除 <i class="icon-remove-sign icon-on-right"></i></button>
								</td>
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
			var news_title = $("#news_title").val();
			if(isSpeChar(news_title)){
				$("#news_title").tips({
					side : 3,
					msg : '标题不允许包含非法字符',
					bg : '#FF5080',
					time : 2
				});
				$("#news_title").focus();
				return false;
			}
			
			top.jzts();
			$("#Form").submit();
			nextPage('${page.currentPage}');
		}
		//新增
		function add(){
			window.location = "<%=basePath%>app/toAdd.do${url}";
		}
		
		//修改
		function updateBanner(banner_id){
			window.location = "<%=basePath%>app/toUpdate.do${url}&banner_id=" + banner_id;
		}
		
		//删除
		function deleteBanner(banner_id){
			bootbox.confirm("确定要删除吗?", function(result){
				if(result){
					top.jzts();
					$.ajax({
						type : "POST",
						url : "<%=basePath%>app/deleteBatch.do?tm=" + new Date().getTime(),
						dataType : "json",
						cache : false,
						data :{str:banner_id},
						success:function(data){
							setTimeout("location.reload()",100);
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
						url : "<%=basePath%>app/deleteBatch.do?tm=" + new Date().getTime(),
						dataType : "json",
						cache : false,
						data :{str:str},
						success:function(data){
							nextPage("${page.currentPage}");
						}
					});
				}
			});
			
			
		}
		
		
		
		//上架、下架
		function updateStatus(banner_id,obj,status){
			var str = $(obj).text();
			
			bootbox.confirm("确定要"+str+"吗?", function(result) {
				if(result){
					$.ajax({
						type:"POST",
						url:"<%=basePath%>app/updateStatus.do?tm="+new Date().getTime(),
						dataType:"json",
						cache : false,
						data:{
							banner_id:banner_id,
							status:status
						},
						success:function(data){
							if(!data){
								alert("上架数量不能超过6个！");
							}
							nextPage("${page.currentPage}");
						}
					});
				}
			});
		}
		
	</script>
	
</body>
</html>