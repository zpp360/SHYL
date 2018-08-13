<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
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
					<form action="<%=basePath%>team/list.do" method="post" name="Form" id="Form">
						<table style="margin-bottom: 20px;">
							<tr>
								<td class="form-inline">
								<label class="lbl" for="vote_name" >团队名称：</label>
								<span class="input-icon"> <input
										autocomplete="off" id="team_name" type="text"
										name="team_name" style="width: 188px" value="${pd.team_name }"
										placeholder="这里输入名称" onblur="trim(this);" /> <i id="nav-search-icon"
										class="icon-search"></i>
								</span></td>
								<td class="form-inline">
									<label class="lbl" for="">团队类型：</label> 
									<select class="chzn-select" name="team_type" id="team_type" data-placeholder="请选择类型"  style="height: 20px; width: 215px;">
										<option value="">全部</option>
										<c:forEach items="${typeList}" var="list">
											<option value="${list.distinguish_id}" <c:if test="${list.distinguish_id==pd.team_type}">selected</c:if>>${list.value}</option>
										</c:forEach>
									</select>
								</td>
								<td class="form-inline">
									<label class="lbl" for="">状态：</label> 
									<select class="chzn-select" name="status" id="status" data-placeholder="请选择状态"  style="height: 20px; width: 215px;">
										<option value="">全部</option>
										<option value="0" <c:if test="${pd.status=='0'}">selected</c:if>>通过</option>
										<option value="1" <c:if test="${pd.status=='1'}">selected</c:if>>未通过</option>
										<option value="2" <c:if test="${pd.status=='2'}">selected</c:if>>审核中</option>
									</select>
								</td>
								<td class="form-inline">
									<label class="lbl" for="">主管单位：</label> 
									<select class="chzn-select" id="unitId" name="unitId" data-placeholder="请选择单位">
										<option value="">全部</option>
										<c:forEach items="${unitList}" var="list">
											<option value="${list.unit_id}" <c:if test="${list.unit_id == pd.unitId}">selected</c:if>>${list.unit_name_full}</option>
										</c:forEach>
									</select>
								</td>
								<td class="form-inline">
									<label class="lbl" for="">推荐单位：</label> 
									<select class="chzn-select" id="push_unit_id" name="push_unit_id" data-placeholder="请选择单位">
										<option value="">全部</option>
										<c:forEach items="${pushUnitList}" var="list">
											<option value="${list.unit_id}" <c:if test="${list.unit_id == pd.push_unit_id}">selected</c:if>>${list.unit_name_full}</option>
										</c:forEach>
									</select>
								</td>
								<td style="width: 20px"></td>
							</tr>
							<tr>
								<td class="form-inline">
									<label class="lbl" for="" style="margin-left: 42px;">省：</label> 
									<select class="chzn-select" name="province_id" id="province_id" data-placeholder="请选择省">
										<option value=""></option>
										<c:forEach items="${provinceList}" var="list">
											<option value="${list.region_id }" <c:if test="${list.region_id == pd.province_id}">selected</c:if>>${list.region_name }</option>
										</c:forEach>
									</select>
								</td>
								<td class="form-inline">
									<label class="lbl" for="" style="margin-left: 42px;">市：</label> 
									<c:if test="${not empty cityList}">
										<select name="city_id" id="city_id" data-placeholder="请选择市" style="width: 215px;">
											<option value="">全部</option>
											<c:forEach items="${cityList}" var="list">
												<option value="${list.region_id }" <c:if test="${list.region_id == pd.city_id}">selected</c:if>>${list.region_name }</option>
											</c:forEach>
										</select>
									</c:if>
									<c:if test="${empty cityList}">
										<select name="city_id" id="city_id" data-placeholder="请选择市" style="width: 215px;">
											<option value="">全部</option>
										</select>
									</c:if>
								</td>
								<td class="form-inline">
									<label class="lbl" for="">县区：</label>
									<c:if test="${not empty areaList}">
										<select name="area_id" id="area_id" data-placeholder="请选择县区" style="width: 215px;">
											<option value="">全部</option>
											<c:forEach items="${areaList}" var="list">
												<option value="${list.region_id}" <c:if test="${list.region_id == pd.area_id}">selected</c:if>>${list.region_name }</option>
											</c:forEach>
										</select>
									</c:if>
									<c:if test="${empty areaList}">
										<select name="area_id" id="area_id" data-placeholder="请选择县区" style="width: 215px;">
											<option value="">全部</option>
										</select>
									</c:if>
								</td>
								<td>
									&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="team_push" id="team_push" value="${pd.team_push}" <c:if test="${pd.team_push=='1'}">checked</c:if> style="opacity:1;position: relative;"/>&nbsp;&nbsp;推荐
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="search();" class="btn btn-small btn-success btn-lg" title="检索" >查询<i class="icon-search icon-on-right"></i></button>
								</td>
							</tr>
						</table>
						<hr/>
						<!-- 检索  -->
						<c:if test="${!pd.superAdmin}">
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
						</c:if>
						<table id="table_report"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center" style="width:3%;">
<!-- 										<label> -->
<!-- 										<input type="checkbox" id="zcheckbox" /><span class="lbl"></span> -->
<!-- 										</label> -->
									</th> 
									<th class="center" style="width:5%;">序号</th>
									<th class="center" style="width:10%;">团队名称</th>
									<th class="center" style="width:10%;">主管单位</th>
									<th class="center" style="width:5%;">类型</th>
									<th class="center" style="width:10%;">团队负责人</th>
									<th class="center" style="width:10%;">负责人职务 </th>
									<th class="center" style="width:10%;">更新时间</th>
									<th class="center" style="width:10%;">推荐单位</th>
									<th class="center" style="width:5%;">状态</th>
									<th class="center" style="width:5%;">票数</th>
									<th class="center" style="width:12%;">操作</th>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty selectTeamlistPage}">
											<c:forEach items="${selectTeamlistPage}" var="list" varStatus="vs">
												<tr>
													<td class='center' >
													<label>
														<c:choose>
															<c:when test="${list.status=='0' && list.flag}">
																<input type='checkbox' name='ids' value="${list.team_id}"/>
															</c:when>
															<c:otherwise>
																<input type='checkbox' disabled="disabled" name='ids' value="${list.team_id}"/>
															</c:otherwise>
														</c:choose>
														<span class="lbl"></span>
													</label>
													</td>
													<td class='center' >${vs.index+1}</td>
													<td class="tds">
														<c:if test="${list.team_push=='1'}">
															[推荐]
														</c:if>
														<a href="javascript:void(0);" onclick="info('${list.team_id}');" title="${list.team_name}">${list.team_name}</a>
													</td>
													<td class="center tds" title="${list.unit_name}">${list.unit_name }</td>
													<td class="center">
														${list.value}
													</td>
													<td class="center tds" title="${list.user_name}">${list.user_name}</td>
													<td class="center tds" title="${list.user_job}">${list.user_job}</td>
													<td class="center tds" title="${list.update_time}">${list.update_time }</td>
													<td class="center tds" title="${list.push_unit_name}">${list.push_unit_name }</td>
													<td class="center tds">
														<c:if test="${list.status==''}">
															草稿
														</c:if>
														<c:if test="${list.status=='0'}">
															通过
														</c:if>
														<c:if test="${list.status=='1'}">
															<a href="javascript:void(0);" onclick="noPassed('${list.team_id}');">未通过</a>
														</c:if>
														<c:if test="${list.status=='2'}">
															审核中
														</c:if>
													</td>
													<td class="center tds">${list.vote_count}</td>
													<td class="center" >
														<a class="btn btn-mini btn-danger" onclick="delTeam('${list.team_id}');" title="删除"><i class="icon-trash"></i></a>
														<c:if test="${pd.superAdmin}">
															<a class="btn btn-mini btn-info" title="编辑" onclick="updateTeam('${list.team_id }');"><i class="icon-edit"></i></a>
														</c:if>
														<c:if test="${!pd.superAdmin}">
															<c:if test="${list.status=='2' || !list.flag || !pd.flag}">
															<a class="btn btn-mini btn-info" title="编辑" style="opacity: 0.2;cursor:not-allowed;"><i class="icon-edit"></i></a>
															</c:if>
															<c:if test="${list.status!='2' && list.flag && pd.flag}">
																<a class="btn btn-mini btn-info" title="编辑" onclick="updateTeam('${list.team_id }');"><i class="icon-edit"></i></a>
															</c:if>
															<a class="btn btn-mini btn-success" title="获奖情况" onclick="award('${list.team_id }');">获奖情况</a>
															<c:if test="${list.status=='2' && pd.lgbj && list.flag}">
															<a class="btn btn-mini btn-success" title="审核" onclick="examine('${list.team_id }');">审核</a>
															</c:if>
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
									<c:if test="${pd.lgbj}">
										<td style="vertical-align: top;">
											<button type="button" class="btn btn-small btn-success btn-lg"  onclick="push('1')" title="推荐">推荐 <i class="icon-plus-sign icon-on-right"></i></button>
											<button type="button" class="btn btn-small btn-success btn-lg"  onclick="push('0')" title="推荐">取消推荐 <i class="icon-plus-sign icon-on-right"></i></button>
											<button type="button" onclick="exportExcel();" class="btn btn-small btn-success btn-lg" title="导出">
												批量导出<i class="icon-plus-sign icon-on-right"></i>
											</button>
										</td>
									</c:if>
									<td style="vertical-align: top;"><div class="pagination"
											style="float: right; padding-top: 0px; margin-top: 0px;">${page.pageStr}</div></td>
								</tr>
							</table>
						</div>
					</form>
				</div>




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
		
		$(function() {
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});

			//复选框
			$("#zcheckbox").click(function() {
				if (this.checked) {//如果 全选按钮被选中，所有的复选框都被选中
					$('[name=ids]').attr("checked", true);
				} else {//如果全选按钮取消，所有的复选框都取消
					$('[name=ids]').attr("checked", false);
				}
			});

			//当复选框组有一个没被选中时，取消全选按钮的选中状态
			$('[name=ids]').click(function() {
				var flag = true;//定义变量为ture
				$('[name=ids]').each(function() {//遍历复选框组
					if (!this.checked) {//如果有一个不是选中状态
						flag = false;
					}
				});
				$('#zcheckbox').attr("checked", flag);//通过遍历 flag的值 为全选框赋状态
			});
			
			//选择市
			$("#province_id").change(function(){
				var province_id = $("#province_id").val();
				$.ajax({
					type: "POST",
					url: "<%=basePath%>team/selectCity.do",
					data:
						{
						province_id:province_id
						},
					dataType:"json",
					cache : false,
					success:function(data){
						var html='<option value="">全部</option>';
						var html_area = '<option value="">全部</option>';
						$("#city_id").empty();
						$("#area_id").empty();
						$.each(data.cityList,function(i,obj){
							html += "<option value="+obj.region_id+">"+obj.region_name+"</option>";
						});
						$("#city_id").append(html);
						$("#area_id").append(html_area);
					}
				});
			});
			//选择区县
			$("#city_id").change(function(){
				var city_id = $("#city_id").val();
				$.ajax({
					type:"POST",
					url:"<%=basePath%>team/selectArea.do",
					data:
						{
						city_id:city_id
						},
					dataType:"json",
					cache:false,
					success:function(data){
						var html='<option value="">全部</option>';
						$("#area_id").empty();
						$.each(data.areaList,function(i,obj){
							html += "<option value="+obj.region_id+">"+obj.region_name+"</option>";
						});
						$("#area_id").append(html);
					}
				});
			});
			
			$("#team_push").click(function(){
				if(this.checked){
					$("#team_push").val("1");		
				}else{
					$("#team_push").val("");
				}
			});
			
		});
		
		//新增
		function add(){
			window.location = "<%=basePath%>team/toAddTeam.do";
		}
		
		//详情
		function info(team_id){
			window.location = "<%=basePath%>team/toInfoTeam.do?team_id=" + team_id;
		}
		
		//修改
		function updateTeam(team_id){
			window.location = "<%=basePath%>team/toUpdate.do?team_id=" + team_id;
		}
		
		//删除
		function delTeam(team_id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					$.ajax({
						type: "POST",
						url: "<%=basePath%>team/deleteTeam.do",
						data:
							{
								team_id:team_id
							},
						dataType:"json",
						cache : false,
						success:function(data){
							nextPage("${page.currentPage}");
						}
					});
				}
			});
		}
		
		//审核
		function examine(team_id){
			window.location = "<%=basePath%>team/toExamine.do?team_id=" + team_id;
		}
		
		//推荐
		function push(team_push){
			
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
				bootbox.dialog("请选择要操作的选项！",
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
			
			bootbox.confirm("确定要操作选中的数据吗?", function(result){
				if(result){
					top.jzts();
					$.ajax({
						type: "POST",
						url: "<%=basePath%>team/updatePush.do",
						data:{
							str:str,
							team_push:team_push
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
			});
			
			
		}
		
		//获奖情况
		function award(team_id){
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Width = 1000;
			diag.Height = 600;
			diag.Title = "获奖情况";
			diag.ShowButtonRow = false;
			diag.URL = dialogPath + "team/awardList.do?team_id="+team_id;
			
			diag.show();
		}
		
		//导出
		function exportExcel(){
			var team_name = $("#team_name").val();
			var team_type = $("#team_type").val();
			var status = $("#status").val();
			var unitId = $("#unitId").val();
			var push_unit_id = $("#push_unit_id").val();
			var province_id = $("#province_id").val();
			var city_id = $("#city_id").val();
			var area_id = $("#area_id").val();
			var team_push = $("#team_push").val();
			window.location = "<%=basePath%>team/exportExcel.do?team_name="+team_name+"&team_type="+team_type+"&status="+status+"&unitId="+unitId+"&push_unit_id="+push_unit_id+"&province_id="+province_id+"&city_id="+city_id+"&area_id="+area_id+"&team_push="+team_push;
		}
		
		//未通过
		function noPassed(team_id){
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Width = 400;
			diag.Height = 260;
			diag.Title = "拒绝原因";
			diag.ShowButtonRow = false;
			diag.URL = dialogPath + "team/toNoPassed.do?team_id="+team_id;
			
			diag.show();
		}
		
	</script>
</body>
</html>

