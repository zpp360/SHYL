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
					<form action="<%=basePath%>film/list.do" method="post" name="Form" id="Form">
						<table style="margin-bottom: 20px;">
							<tr>
								<td class="form-inline">
								<label class="lbl" for="end_time" >电影名称：</label>
								<span class="input-icon"> <input
										autocomplete="off" id="filmName" type="text"
										name="filmName" style="width: 350px" value="${pd.filmName}"
										placeholder="这里输入电影名称" onblur="trim(this);" /> <i id="nav-search-icon"
										class="icon-search"></i>
								</span></td>
								<td style="width: 20px"></td>
								<td style="vertical-align: top;">
									<button type="button" onclick="search();" class="btn btn-small btn-success btn-lg" title="检索" >查询<i class="icon-search icon-on-right"></i></button>
								</td>
								<td style="width: 20px"></td>
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
									<th class="center" style="width:3%;"><label><input type="checkbox"
											id="zcheckbox" /><span class="lbl"></span></label></th> 
									<th class="center" style="width:5%;">序号</th>
									<th class="center" style="width:10%;">电影名称</th>
									<th class="center" style="width:7%;">导演</th>
									<th class="center" style="width:10%;">主演</th>
									<th class="center" style="width:7%;">电影时长</th>
									<th class="center" style="width:9%;">语言</th>
									<th class="center" style="width:7%;">放映地区</th>
									<th class="center" style="width:7%;">状态</th>
									<th class="center" style="width:10%;">电影类型</th>
									<th class="center" style="width:10%;">场地</th>
									<th class="center" style="width:15%;">操作</th>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty filmALLList}">
											<c:forEach items="${filmALLList}" var="film" varStatus="vs">
												<tr>
													<td class='center' ><label><input
															type='checkbox' name='ids' value="${film.filmId}" /><span
															class="lbl"></span></label></td>
													<td class='center' >${vs.index+1}</td>
													
													<td class="tds" style="width:500px"><a
														href="javascript:void(0);" title="${film.filmName }"
														onclick="info('${film.filmId }');">${film.filmName }</a></td>
													<td class="center tds">${film.director}</td>
													<td class="center tds">${film.performer }</td>
													<td class="tds">${film.filmTime }</td>
													<td class="tds">${film.filmLanguage }</td>
													<td class="tds">${film.filmLocal }</td>
													<td class="center">
														<c:if test="${film.filmStatus == 0}">已上架</c:if>
														<c:if test="${film.filmStatus == 1}">已下架</c:if>
													</td>
													<td class="center">${film.filmType }</td>
													<td class="center tds">${film.pName }</td>
													<td style="width: 50px;" class="center">
														<a class="btn btn-small btn-info" title="编辑" onclick="editFilms('${film.filmId }');"><i class="icon-edit"></i></a>
														<a class="btn btn-small btn-danger" onclick="delFilms('${film.filmId}');" title="删除"><i class="icon-trash"></i></a>
														<c:if test="${film.filmStatus == 0}">
															<a class="btn btn-small btn-warning" onclick="updateStatus('${film.filmId}',this,'${film.filmStatus}')">下架</a>
														</c:if>
														<c:if test="${film.filmStatus == 1}">
															<a class="btn btn-small btn-warning" onclick="updateStatus('${film.filmId}',this,'${film.filmStatus}')">上架</a>
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
			var filmName = $("#filmName").val();
			if(isSpeChar(filmName)){
				$("#filmName").tips({
					side : 3,
					msg : '电影名称不允许包含非法字符',
					bg : '#FF5080',
					time : 2
				});
				$("#filmName").focus();
				return false;
			}
			
			top.jzts();
			$("#Form").submit();
			 nextPage('${page.currentPage}');
		}
		
		//新增
		function add(){
			window.location="<%=basePath%>film/to_Add.do${url}";
		}
		
		//修改
		function editFilms(filmId){
			window.location="<%=basePath%>film/goEditFilm.do${url}&filmId="+filmId;
		}
		
		//详情
		function  info(filmId){
			window.location="<%=basePath%>film/goInfoFilm.do${url}&filmId="+filmId;
		}
		
		//上架、下架
		function updateStatus(filmId,obj,filmStatus){
			
			var str = $(obj).text();
			
			bootbox.confirm("确定要"+str+"吗?", function(result) {
				if(result){
					$.ajax({
						type:"POST",
						url:"<%=basePath%>film/updateStatus.do?tm="+new Date().getTime(),
						dataType:"json",
						cache : false,
						data:{
							str:str,
							filmStatus:filmStatus,
							filmId:filmId
						},
						success:function(data){
							if(data){
								nextPage("${page.currentPage}");
							}
						}
					});
				}
			});
			
			
			
			
			
		}
		
		
		//删除
		function delFilms(filmId,msg){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>film/deleteFilm.do?filmId="+filmId+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage("${page.currentPage}");
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
								url: "<%=basePath%>film/deleteAllFilms.do",
								data:{str:str},
								dataType:"json",
								cache : false,
								success:function(data){
									if(data){
										nextPage("${page.currentPage}");
									}
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

