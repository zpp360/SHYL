<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>院校审批_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">
<!-- jsp文件头和头部 -->
<%@ include file="../../../system/admin/top.jsp"%>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
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
					<form action="<%=basePath%>colleges/list.do" method="post" name="Form" id="Form">
					    <input type="hidden" id="citys" value="${pd.City}"/>
						<table style="margin-bottom: 20px;">
							<tr>
								<td class="form-inline">
								<label class="lbl" for="school_name">院校名称：</label> 
								<input autocomplete="off"
									type="text" id="school_name" name="school_name"
									value="${pd.school_name }" placeholder="请输入院校名称"
									style="width: 206px;" onblur="trim(this);" /></td>
									<td style="width: 20px"></td>
								<td class="form-inline">
								<label class="lbl" for="user_status">会员状态：</label> 
								<select
									class="chzn-select" name="user_status"
									data-placeholder="请选择会员状态">
										<option value=""></option>
										<option value="">全部</option>
										<option value="1"
											<c:if test="${pd.user_status == '1'}">selected</c:if>>审核中</option>
										<option value="2"
											<c:if test="${pd.user_status == '2'}">selected</c:if>>审核通过</option>
										<option value="3"
											<c:if test="${pd.user_status == '3'}">selected</c:if>>未通过</option>
										<option value="4"
											<c:if test="${pd.user_status == '4'}">selected</c:if>>锁定</option>
								</select></td>
								
								</tr>
								<tr style="height:10px;"></tr>
								<tr>
								<td class="form-inline" >
								<label class="lbl" for="">院校地址：</label> 
									<select
									class="chzn-select" id="Province" name="Province"
									data-placeholder="请选择所在省份">
										<option value=""></option>
										<c:forEach items="${ProvinceList}" var="pro">
											<option value="${pro.region_id }"
												<c:if test="${pro.region_id == pd.Province}">selected</c:if>>${pro.region_name }</option>
										</c:forEach>
								</select>
								</td>
								<td style="width: 20px"></td>
								<td >&#12288;&#8194;&#151;&#12288;&#12288;&#8197;&#8197;&#8194;
								<select id="City" name="City" 
 									class=" chzn-select" data-placeholder="请选择所在城市">
										<option value=""></option>
								</select></td>
								<td style="width: 20px"></td>
								<td class="form-inline">
									<button type="button" onclick="search();" class="btn btn-small btn-success btn-lg" title="检索" >查询<i class="icon-search icon-on-right"></i></button>
								</td>
							</tr>
						</table>
						<hr/>
						<!-- 检索  -->
						<table id="table_report"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center" style="width:5%;">序号</th>
									<th class="center" style="width:22%;">院校名称</th>
									<th class="center" style="width:8%;">用户名</th>
									<th class="center" style="width:12%;">申请日期</th>
									<th class="center" style="width:10%;">会员状态</th>
									<th class="center" style="width:10%;">审核人</th>
									<th class="center" style="width:15%;">审核日期</th>
									<th class="center" style="width:20%;">院校地址</th>
									<th class="center" style="width:15%;">最后活跃</th>
									<th class="center" style="width:15%;">操作</th>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty varList}">

										<c:forEach items="${varList}" var="var" varStatus="vs">
											<tr>
												<td class='center' style="width: 30px;">${vs.index+1}</td>
												<td class="tds"><a href="javascript:void(0);" title="${var.school_name }" onclick="info('${var.schoolId }');">${var.school_name }</a></td>
												<td class="tds">${var.user_name}</td>
												<td class="center">${var.registe_time}</td>
												<td class="center">${var.status}</td>
												<td class="center">${var.reviewer}</td>
												<td class="center">${var.review_time}</td>
												<td class="tds" title="${var.address_detail}">${var.address_detail}</td>
												<td class="center">${var.login_time}</td>
												<td style="width: 150px;" class="center"><c:if
														test="${var.user_status == 1 }">
															<a class='btn btn-small btn-purple' title="通过" onclick="reviewSuccess('${var.schoolId }');"><i class="icon-check"></i></a>
															<a class='btn btn-small btn-purple' title="驳回" onclick="reviewFail('${var.schoolId }');"><i class="icon-reply"></i></a>
													</c:if> <c:if test="${var.user_status == 2 }">
															<a class='btn btn-small btn-info'  title="锁定"  onclick="locked('${var.schoolId }');"><i class="icon-lock"></i></a>
															<a class="btn btn-small btn-danger" onclick="cancle('${var.schoolId }');" title="删除"><i class="icon-trash"></i></a>
													</c:if> <c:if test="${var.user_status == 3 }">
															<a class='btn btn-small btn-purple' title="通过" onclick="reviewSuccess('${var.schoolId }');"><i class="icon-check"></i></a>
															<a class="btn btn-small btn-danger" onclick="cancle('${var.schoolId }');" title="删除"><i class="icon-trash"></i></a>
													</c:if> <c:if test="${var.user_status == 4 }">
															<a class='btn btn-small btn-purple' title="解锁" onclick="unlock('${var.schoolId }');"><i class="icon-unlock"></i></a>
															<a class="btn btn-small btn-danger" onclick="cancle('${var.schoolId }');" title="删除"><i class="icon-trash"></i></a>
													</c:if>
													<a class='btn btn-small btn-important' title="重置密码" onclick="reset('${var.user_id }');"><i class="icon-cog"></i></a>
													</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr class="main_info">
											<td colspan="10" class="center">没有相关数据</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>

						<div class="page-header position-relative">
							<table style="width: 100%;">
								<tr>
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
		
		$(function(){
			var citys = $("#citys").val();
			if(""!=citys){
				BindCId(citys);
			}
			$("#Province").change(function() {
			    BindCId(0);
			});
			
			//合并的：$(function(){});
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			
		});
		
		function BindCId(cid) {
			var PID = $("#Province").val();
			$("#City").empty();
			$("<option value=''></option>").appendTo("#City");
			$.ajax({
				type:"POST",
				url:"<%=basePath%>colleges/getCities.do",
				data:{'PID' : PID},
				dataType:"json",
				cache:false,
				success:function(data){
					var html='<option value=""></option>';
					$.each(data.cityList,function(i,list){
						if(list.region_id==cid){
							if(cid!=0){
								html+="<option value="+list.region_id+" selected='selected' >"+list.region_name+"</option>";
							}
						}else{
							html+="<option value="+list.region_id+">"+list.region_name+"</option>";
						}
					});
					$("#City").append(html);
					$("#City").trigger("liszt:updated");
				}
			});
		}

		//检索
		function search(){
			top.jzts();
			$("#Form").submit();
		}
		
		//审核通过
		function reviewSuccess(schoolId){
			bootbox.confirm("确定要通过审核吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>colleges/reviewSuccess.do?userId="+schoolId+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage("${page.currentPage}");
					});
				}
			});
		}
		
		//审核未通过
		function reviewFail(schoolId){
			bootbox.confirm("确定驳回该公司信息吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>colleges/reviewFail.do?userId="+schoolId+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage("${page.currentPage}");
					});
				}
			});
		}
		
		//锁定
		function locked(schoolId){
			bootbox.confirm("确定要锁定该公司信息吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>colleges/locked.do?userId="+schoolId+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage("${page.currentPage}");
					});
				}
			});
		}
		
		//解锁
		function unlock(schoolId){
			bootbox.confirm("确定要解锁该公司信息吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>colleges/reviewSuccess.do?userId="+schoolId+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage("${page.currentPage}");
					});
				}
			});
		}
		
		//注销
		function cancle(schoolId){
			bootbox.confirm("确定要注销该公司信息吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>colleges/cancle.do?userId="+schoolId+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage("${page.currentPage}");
					});
				}
			});
		}
		
		
		//重置密码
		function reset(user_id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="重置密码";
			 diag.URL = dialogPath+'operateCompany/toReset.do?user_id='+user_id;
			 diag.Width = 350;
			 diag.Height = 150;
			 diag.CancelEvent = function() { //关闭事件
				window.location.href = window.location.href;
				top.jzts();
				diag.close();
			};
			diag.show();
		}
		
		//查看公司信息详情
		function info(schoolId){
			window.location="<%=basePath%>colleges/goDetails.do?userId="
					+ schoolId;
		}
	</script>
</body>
</html>