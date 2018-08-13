<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<title>年度评选列表展示</title>
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
				<form action="<%=basePath%>volunteerYearAward/list.do" method="post" name="Form" id="Form">
					<table style="margin-bottom: 20px;">
						<tr>
							<td class="form-inline">
								<label class="lbl" for="">获奖名称：</label> 
								<select id="award_name" class="chzn-select" name="award_name"  data-placeholder="请选择获奖名称">
									<option value="">全部</option>
									<c:forEach items="${typeList}" var="list">
										<option value="${list.distinguish_id}" <c:if test="${list.distinguish_id==pd.award_name}">selected</c:if>>${list.value}</option>
									</c:forEach>
								</select>
							</td>
							<td class="form-inline">
								<label class="lbl" for="">年度：</label> 
								<input name="award_time" id="award_time" value="${pd.award_time}" class="Wdate" type="text" placeholder="请选择年份" onclick="WdatePicker({dateFmt:'yyyy',isShowClear:true});" autocomplete="off"/>
							</td>
							
							<td style="width: 20px"></td>
							<td style="vertical-align: top;">
								<button type="button" onclick="search();" class="btn btn-small btn-success btn-lg" title="检索" >查询<i class="icon-search icon-on-right"></i></button>
							</td>
						</tr>
					</table>
					<hr/>
					<c:if test="${pd.isAssociation}">
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
<!-- 								<th class="center" style="width:3%;"> -->
<!-- 									<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label> -->
<!-- 								</th>  -->
								<th class="center" style="width:5%;">序号</th>
								<th class="center" style="width:15%;">级别</th>
								<th class="center" style="width:15%;">年度</th>
								<th class="center" style="width:35%;">奖项名称</th>
								<th class="center" style="width:15%;">获奖对象数量</th>
								<th class="center" style="width:15%;">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty selectList}">
										<c:forEach items="${selectList}" var="list" varStatus="vs">
											<tr>
<!-- 												<td class='center' ><label> -->
<%-- 													<input type='checkbox' name='ids' value="${list.year_award_id}" /><span class="lbl"></span></label> --%>
<!-- 												</td> -->
												<td class='center' >${vs.index+1}</td>
												<td class="center tds">
													<c:if test="${list.award_level=='1'}">省级</c:if>
													<c:if test="${list.award_level=='2'}">市级</c:if>
													<c:if test="${list.award_level=='3'}">县级</c:if>
												</td>
												<td class="center tds">${list.award_time}</td>
												<td class="center tds">${list.name}</td>
												<td class="center tds">${list.num}</td>
												<td class="center" style="width: 50px;">
													<a class="btn btn-mini btn-success" title="详情" onclick="award_info('${list.year_award_id}','${list.award_name}');">获奖对象添加</a>
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
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="添加";
			 diag.URL = dialogPath+'volunteerYearAward/toAdd.do';
			 diag.Width = 600;
			 diag.Height = 300;
			 diag.CancelEvent = function(){ //关闭事件
				 setTimeout("self.location=self.location",100);
				diag.close();
			 };
			 diag.show();
		}
		
		
		//详情
		function award_info(year_award_id,award_name){
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="详情";
			 diag.Width = 1000;
			 diag.Height = 600;
			 
			 if(award_name=='1'){//最美志愿者
				 diag.URL = dialogPath+'volunteerYearAward/toVolunteer.do?year_award_id='+year_award_id;
			 }
			 if(award_name=='2'){//最美志愿服务组织
				 diag.URL = dialogPath+'volunteerYearAward/toOrganization.do?year_award_id='+year_award_id;
			 }
			 if(award_name=='3'){//最美志愿服务项目
				 diag.URL = dialogPath+'volunteerYearAward/toInfo.do?active_id='+active_id;
			 }
			 diag.OKEvent = function(){//确定事件
				 if(award_name=='1'){//最美志愿者
					 var volunteer_id = diag.innerFrame.contentWindow.document.getElementById('volunteer_id').value;
						$.ajax({
							type: "POST",
							url: "<%=basePath%>volunteerYearAward/saveVolunteerAward.do",
							data:{
								year_award_id:year_award_id,
								volunteer_id:volunteer_id
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
				 if(award_name=='2'){//最美志愿服务组织
					 var organization_id = diag.innerFrame.contentWindow.document.getElementById('organization_id').value;
						$.ajax({
							type: "POST",
							url: "<%=basePath%>volunteerYearAward/saveOrganizationAward.do",
							data:{
								year_award_id:year_award_id,
								organization_id:organization_id
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
			 	setTimeout("self.location=self.location",100);
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function del(year_award_id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					$.ajax({
						type: "POST",
						url: "<%=basePath%>volunteerYearAward/deleteYearAward.do",
						data:
							{
							year_award_id:year_award_id
							},
						dataType:"text",
						cache : false,
						success:function(data){
							setTimeout("self.location=self.location",100);
						}
					});
				}
			});
		}
		
	</script>
	
</body>
</html>