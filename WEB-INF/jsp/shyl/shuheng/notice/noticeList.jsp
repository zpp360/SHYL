<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<title>通知公告列表展示</title>
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
				<form action="<%=basePath%>notice/list.do" method="post" name="Form" id="Form">
					<table style="margin-bottom: 20px;">
						<tr>
							<td class="form-inline">
								<span class="input-icon"> 
									<input autocomplete="off" id="notifiTitle" type="text" name="notifiTitle" style="width: 350px" value="${pd.notifiTitle}" placeholder="这里输入标题" onblur="trim(this);"/>
								 	<i id="nav-search-icon" class="icon-search"></i>
								</span>
							</td>
							<td style="width: 20px"></td>
							<td style="vertical-align: top;">
								<button type="button" onclick="search();" class="btn btn-small btn-success btn-lg" title="检索" >查询<i class="icon-search icon-on-right"></i></button>
							</td>
						</tr>
					</table>
					<hr/>
					<table>
						<tbody>
							<tr>
								<td nowrap="nowrap">
									<div class="contentline-both" style="margin-bottom: 10px;">
										<button type="button" class="btn btn-small btn-success btn-lg"  onclick="addNotice()" title="添加">添加 <i class="icon-plus-sign icon-on-right"></i></button>
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
								<th class="center" style="width:10%;">文件编号</th>
								<th class="center" style="width:10%;">来源</th>
								<th class="center" style="width:20%;">所属单位</th>
								<th class="center" style="width:10%;">创建时间</th>
								<th class="center" style="width:5%;">状态</th>
								<th class="center" style="width:15%;">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty noticelistPage}">
										<c:forEach items="${noticelistPage}" var="list" varStatus="vs">
											<tr>
												<td class='center' ><label>
													<input type='checkbox' name='ids' value="${list.notifiId}" /><span class="lbl"></span></label>
												</td>
												<td class='center' >${vs.index+1}</td>
												<td class="center tds"><a href="javascript:voik(0);" title="${list.notifiTitle}" onclick="info('${list.notifiId}')">${list.notifiTitle}</a></td>	
												<td class="center tds">${list.notifiTitleOther}</td>
												<td class="center tds">${list.notifiSource}</td>
												<td class="center tds">${list.unitNameFull}</td>
												<td class="center tds">${list.insertTime}</td>
												<td class="center tds">
													<c:if test="${list.notifi_flag=='0'}">发送</c:if>
													<c:if test="${list.notifi_flag=='1'}">草稿</c:if>
												</td>
												<td class="">
													<a class="btn btn-small btn-primary" onclick="noticeDetail('${list.notifiId}');" title="查看">查看</a>
													<a class="btn btn-small btn-danger" onclick="deleteNotice('${list.notifiId}');" title="删除"><i class="icon-trash"></i></a>
													<c:if test="${list.notifi_flag=='1'}">
														<a class="btn btn-small btn-info" title="编辑" onclick="updateNotice('${list.notifiId}');"><i class="icon-edit"></i></a>
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
		function addNotice(){
			window.location = "<%=basePath%>notice/toAdd.do${url}";
		}
		
		//详情
		function info(notifiId){
			window.location="<%=basePath%>notice/toInfo.do${url}&notifiId="+notifiId;
		}
		
		//修改
		function updateNotice(notifiId){
			window.location="<%=basePath%>notice/toUpdate.do${url}&notifiId="+notifiId;
		}
		
		//查看
		function noticeDetail(notifiId){
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Width = 900;
			diag.Height = 600;
			diag.Title = "查看";
			diag.ShowButtonRow = false;
			diag.URL = dialogPath + "notice/toNoticeDetail.do?notifiId="+notifiId;
			
			diag.OKEvent = function(){//确定事件
 				diag.close();
			};
			
 			diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			diag.show();
		}
		
		//删除
		function deleteNotice(notifiId){
			bootbox.confirm("确定要删除吗?", function(result){
				if(result){
					top.jzts();
					$.ajax({
						type : "POST",
						url : "<%=basePath%>notice/deleteNotice.do?tm=" + new Date().getTime(),
						dataType : "json",
						cache : false,
						data :{notifiId:notifiId},
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
						url : "<%=basePath%>notice/deleteBatch.do?tm=" + new Date().getTime(),
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
		
		
		
	</script>
	
</body>
</html>