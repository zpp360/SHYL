<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<title>新闻列表展示</title>
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

<!-- 引入news.js -->
<script type="text/javascript" src="shyl/js/news/news.js"></script>


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
				<form action="<%=basePath%>columnManagement/contentRight.do?column_id=${pd.column_id}" method="post" name="Form" id="Form">
					<table style="margin-bottom: 20px;">
						<tr>
							<td class="form-inline"><label class="lbl" for="end_time">标题：</label>
								<span class="input-icon"> 
									<input autocomplete="off" maxlength="50" id="news_title" type="text" name="news_title" style="width: 200px" value="${pd.news_title}" placeholder="这里输入标题" onblur="trim(this);"/>
									<i id="nav-search-icon" class="icon-search"></i>
								</span>
							</td>
							<c:if test="${pd.superAdmin}">
								<td class="form-inline">
									<label class="lbl" for="">单位：</label> 
									<select class="chzn-select" id="unit_id" name="unit_id" data-placeholder="请选择单位">
										<option value="">全部</option>
										<c:forEach items="${unitList}" var="list">
											<option value="${list.unit_id}" <c:if test="${list.unit_id == pd.unit_id}">selected</c:if>>${list.unit_name}</option>
										</c:forEach>
									</select>
								</td>
							</c:if>
							<td class="form-inline">
								<label class="lbl" for="">状态：</label> 
								<select class="chzn-select" id="del_flag" name="del_flag" data-placeholder="请选择状态">
									<option value="">全部</option>
									<option value="0" <c:if test="${pd.del_flag == '0'}">selected</c:if>>发布</option>
									<option value="2" <c:if test="${pd.del_flag == '2'}">selected</c:if>>草稿</option>
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
											class="btn btn-small btn-success btn-lg"  onclick="add('${pd.column_id}')" title="添加">添加 <i class="icon-plus-sign icon-on-right"></i></button>
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
								<th class="center" style="width:10%;">来源</th>
								<th class="center" style="width:10%;">所属栏目</th>
								<th class="center" style="width:10%;">所属单位</th>
								<th class="center" style="width:5%;">状态</th>
								<th class="center" style="width:10%;">更新人</th>
								<th class="center" style="width:13%;">更新时间</th>
								<th class="center" style="width:12%;">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty contentListPage}">
										<c:forEach items="${contentListPage}" var="list" varStatus="vs">
											<tr>
												<td class='center' ><label>
													<input type='checkbox' name='ids' value="${list.news_id}" /><span class="lbl"></span></label>
												</td>
												<td class='center' >${vs.index+1}</td>
												<td class="tds">
													<c:if test="${list.news_push_s==1}">
														[首页]
													</c:if>
													<c:if test="${list.news_push_d==1}">
														[单位]
													</c:if>
													<a href="javascript:void(0);" onclick="info('${list.news_id}');" title="${list.news_title}">${list.news_title}</a>
												</td>	
												<td class="center tds">${list.news_source}</td>
												<td class="center tds">${list.column_name}</td>
												<td class="center tds">${list.unit_name_full}</td>
												<td class="center tds">
													<c:if test="${list.del_flg == '0'}">发布</c:if>
													<c:if test="${list.del_flg == '2'}">草稿</c:if>
												</td>
												<td class="center tds">${list.user_name}</td>
												<td class="center tds">${list.update_date}</td>
												<td class="center" style="width: 50px;">
													<a class="btn btn-small btn-info" title="编辑" onclick="updateContent('${list.news_id}');"><i class="icon-edit"></i></a>
													<a class="btn btn-small btn-danger" onclick="deleteContent('${list.news_id}');" title="删除"><i class="icon-trash"></i></a>
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
									<button type="button" class="btn btn-small btn-success btn-lg"  onclick="recommendPush()" title="推荐">推荐 <i class="icon-plus-sign icon-on-right"></i></button>
									<button type="button" class="btn btn-small btn-success btn-lg"  onclick="cancelPush()" title="取消推荐">取消推荐 </button>
									<c:if test="${!pd.superAdmin}">
										<button type="button" class="btn btn-small btn-success btn-lg"  onclick="remove()" title="移动">移动 </button>
										<button type="button" class="btn btn-small btn-success btn-lg"  onclick="copy()" title="复制">复制 </button>
									</c:if>
								</td>
								<td style="vertical-align: top;width:60%;">
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
		function add(column_id){
			window.location = "<%=basePath%>columnManagement/toAdd.do${url}&column_id="+column_id;
		}
		
		//详情
		function info(news_id){
			window.location = "<%=basePath%>columnManagement/toInfo.do${url}&news_id=" + news_id;
		}
		//修改
		function updateContent(news_id){
			window.location = "<%=basePath%>columnManagement/toUpdate.do${url}&news_id=" + news_id;
		}
		
		//删除
		function deleteContent(news_id){
			bootbox.confirm("确定要删除吗?", function(result){
				if(result){
					top.jzts();
					$.ajax({
						type : "POST",
						url : "<%=basePath%>columnManagement/deleteContent.do?tm=" + new Date().getTime(),
						dataType : "json",
						cache : false,
						data :{news_id:news_id},
						success:function(data){
							if(data){
								setTimeout("location.reload()",100);
							}else{
								alert("操作失败,请重新操作!");
								setTimeout("location.reload()",100);
							}
						}
					});
				}
			});
		}
		
		//推荐
		function recommendPush(){
			
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
				bootbox.dialog("请选择要推荐的内容！",
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
			
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Width = 300;
			diag.Height = 130;
			diag.Title = "推荐";
			diag.ShowButtonRow = false;
			diag.URL = dialogPath+"columnManagement/toPush.do";
			
			diag.OKEvent = function(){//确定事件
				var news_push_s = diag.innerFrame.contentWindow.news_push_s;
				var news_push_d = diag.innerFrame.contentWindow.news_push_d;
				if(news_push_s.value == 1 || news_push_d.value == 1){
					$.ajax({
						type: "POST",
						url: "<%=basePath%>columnManagement/updateRecommendPush.do",
						data:{
							news_push_s:news_push_s.value,
							news_push_d:news_push_d.value,
							str:str
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
		
		//取消推荐
		function cancelPush(){
			
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
				bootbox.dialog("请选择要取消推荐的内容！",
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
			
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Width = 300;
			diag.Height = 130;
			diag.Title = "取消推荐";
			diag.ShowButtonRow = false;
			diag.URL = dialogPath+"columnManagement/toPush.do";
			
			diag.OKEvent = function(){//确定事件
				var news_push_s = diag.innerFrame.contentWindow.news_push_s;
				var news_push_d = diag.innerFrame.contentWindow.news_push_d;
				if(news_push_s.value == 1 || news_push_d.value == 1){
					$.ajax({
						type: "POST",
						url: "<%=basePath%>columnManagement/updateCancelPush.do",
						data:{
							news_push_s:news_push_s.value,
							news_push_d:news_push_d.value,
							str:str
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
						url : "<%=basePath%>columnManagement/deleteBatchContent.do?tm=" + new Date().getTime(),
						dataType : "json",
						cache : false,
						data :{str:str},
						success:function(data){
							if(data){
								nextPage("${page.currentPage}");
							}else{
								alert("操作失败,请重新操作!");
								nextPage("${page.currentPage}");
							}
						}
					});
				}
			});
			
			
		}
		
		//移动
		function remove(){
			
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
				bootbox.dialog("请选择要移动的内容！",
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
			
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Width = 280;
			diag.Height = 370;
			diag.Title = "移动";
			diag.ShowButtonRow = false;
			diag.URL = dialogPath+"columnManagement/toRemove.do";
			
			diag.OKEvent = function(){//确定事件
				var column_id = diag.innerFrame.contentWindow.column_id;
				if(column_id.value != null || column_id.value != ""){
					$.ajax({
						type: "POST",
						url: "<%=basePath%>columnManagement/updateRemove.do",
						data:{
							column_id:column_id.value,
							str:str
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
		
		//复制
		function copy(){
			
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
				bootbox.dialog("请选择要复制的内容！",
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
			
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Width = 280;
			diag.Height = 370;
			diag.Title = "复制";
			diag.ShowButtonRow = false;
			diag.URL = dialogPath+"columnManagement/toRemove.do";
			
			diag.OKEvent = function(){//确定事件
				var column_id = diag.innerFrame.contentWindow.column_id;
				if(column_id.value != null || column_id.value != ""){
					$.ajax({
						type: "POST",
						url: "<%=basePath%>columnManagement/updateCopy.do",
						data:{
							column_id:column_id.value,
							str:str
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
		
	</script>
	
</body>
</html>