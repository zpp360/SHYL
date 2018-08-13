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
				<form action="<%=basePath%>meeting/list.do" method="post" name="Form" id="Form">
					<table style="margin-bottom: 20px;">
						<tr>
							<td class="form-inline">
								<span class="input-icon"> 
									<input autocomplete="off" id="meeting_title" type="text" name="meeting_title" style="width: 350px" value="${pd.meeting_title}" placeholder="这里输入标题" onblur="trim(this);"/>
								 	<i id="nav-search-icon" class="icon-search"></i>
								</span>
							</td>
							<td class="form-inline">
								<label class="lbl" for="">会议类型：</label> 
								<select class="" id="meeting_type" name="meeting_type" data-placeholder="请选择状态">
									<option value="">全部</option>
									<option value="0" <c:if test="${pd.meeting_type == '0'}">selected</c:if>>内部</option>
									<option value="1" <c:if test="${pd.meeting_type == '1'}">selected</c:if>>开放</option>
								</select>
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
										<button type="button" class="btn btn-small btn-success btn-lg"  onclick="addMeeting()" title="添加">添加 <i class="icon-plus-sign icon-on-right"></i></button>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<table id="table_report" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class="center" style="width:3%;"><label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label></th> 
								<th class="center" style="width:5%;">序号</th>
								<th class="center" style="width:20%;">会议名称</th>
								<th class="center" style="width:5%;">会议类型</th>
								<th class="center" style="width:10%;">开始时间</th>
								<th class="center" style="width:10%;">结束时间</th>
								<th class="center" style="width:17%;">会议地点</th>
								<th class="center" style="width:10%;">主办单位</th>
								<th class="center" style="width:20%;">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty meetingList}">
										<c:forEach items="${meetingList}" var="list" varStatus="vs">
											<tr>
												<td class='center' ><label>
													<input type='checkbox' name='ids' value="${list.meeting_id}" /><span class="lbl"></span></label>
												</td>
												<td class='center' >${vs.index+1}</td>
												<td class="center tds"><a href="javascript:void(0);" title="${list.meeting_title}" onclick="info('${list.meeting_id}');">${list.meeting_title}</a></td>	
												<td class="center tds"><c:if test='${list.meeting_type==0}'>内部</c:if><c:if test='${list.meeting_type==1}'>开放</c:if></td>
												<td class="center tds">${list.meeting_begin_time}</td>
												<td class="center">${list.meeting_end_time}</td>
												<td class="center tds" title="${list.meeting_place}">${list.meeting_place}</td>		
												<td class="center tds" title="${list.unit_name}">${list.unit_name}</td>
												<td class="center" style="width: 50px;">
													<c:if test="${list.is_outtime == 1 }">
														<a class="btn btn-small btn-info" style="cursor:not-allowed;opacity: 0.2;" title="编辑" ><i class="icon-edit"></i></a>
													</c:if>
													<c:if test="${list.is_outtime == 0 }">
														<a class="btn btn-small btn-info" title="编辑" onclick="update('${list.meeting_id}');"><i class="icon-edit"></i></a>
													</c:if>
													<a class="btn btn-small btn-danger" onclick="deleteMeeting('${list.meeting_id}');" title="删除"><i class="icon-trash"></i></a>
													<a class="btn btn-small btn-purple" onclick="meetingData('${list.meeting_id}')" title="资料中心">资料中心</a>
													<a class="btn btn-small btn-warning" onclick="viewSign('${list.meeting_id}')" title="签到表">签到表</a>
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
		function addMeeting(){
			window.location = "<%=basePath%>meeting/toAdd.do";
		}
		
		//添加修改会议资料
		function meetingData(meetingId){
			top.jzts();
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Title ="添加会议资料";
			diag.URL = dialogPath+'meeting/toEditData.do?meeting_id='+meetingId;
			diag.Width = 800;
			diag.Height = 500;
			diag.CancelEvent = function(){ //关闭事件
				if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage('${page.currentPage}');
				}
				diag.close();
			};
			diag.show();
		}
		
		function viewSign(meetingId){
			top.jzts();
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Title ="签到列表";
			diag.URL = dialogPath+'meeting/userSignListPage.do?meeting_id='+meetingId;
			diag.Width = 800;
			diag.Height = 500;
			diag.CancelEvent = function(){ //关闭事件
				if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage('${page.currentPage}');
				}
				diag.close();
			};
			diag.show();
		}
		
		
		//详情
		function info(meetingId){
			window.location = "<%=basePath%>meeting/toInfo.do?meeting_id="+meetingId;
		}
		//修改
		function update(meetingId){
			window.location = "<%=basePath%>meeting/toUpdate.do?meeting_id="+meetingId;
		}
		
		//删除
		function deleteMeeting(meetingId){
			bootbox.confirm("确定要删除吗?", function(result){
				if(result){
					top.jzts();
					$.ajax({
						type : "POST",
						url : "<%=basePath%>meeting/del.do?tm=" + new Date().getTime(),
						dataType : "text",
						cache : false,
						data :{meeting_id:meetingId},
						success:function(data){
							if(data){
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
						url : "<%=basePath%>meeting/deleteBatch.do?tm=" + new Date().getTime(),
						dataType : "json",
						cache : false,
						data :{str:str},
						success:function(data){
							if(data){
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