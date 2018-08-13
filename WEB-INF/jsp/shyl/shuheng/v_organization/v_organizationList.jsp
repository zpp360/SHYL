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
					<form action="<%=basePath%>vOrg/list.do" method="post" name="Form" id="Form">
						<table style="margin-bottom: 20px;">
							<tr>
								<td class="form-inline">
									<label class="lbl" for="end_time" >组织名称：</label>
									<span class="input-icon"> 
									<input autocomplete="off" id="organization_name" type="text" name="organization_name" value="${pd.organization_name }" placeholder="这里输入组织名称" onblur="trim(this);" />
									 <i id="nav-search-icon" class="icon-search"></i>
									</span>
								</td>
								<c:if test="${pd.superAdmin || pd.isFlag}">
								<td class="form-inline"><label class="lbl" for="">省：</label>
									<select class="chzn-select" id="organization_province" name="organization_province" data-placeholder="请选择省">
										<option value=""></option>
										<c:forEach items="${provincelist}" var="list">
											<option value="${list.id}"
												<c:if test="${list.id==pd.province_id}">selected</c:if>>${list.name}</option>
										</c:forEach>
									</select>
								</td>
								<td class="form-inline"><label class="lbl" for="">市：</label>
									<c:if test="${not empty citylist}">
										<select class="chzn-select" id="organization_city" name="organization_city" data-placeholder="请选择市">
											<option value=""></option>
											<c:forEach items="${citylist}" var="list">
												<option value="${list.id}"
													<c:if test="${list.id==pd.organization_city}">selected</c:if>>${list.name}</option>
											</c:forEach>
										</select>
									</c:if>
									<c:if test="${empty citylist}">
										<select class="chzn-select" id="organization_city" name="organization_city" data-placeholder="请选择市">
											<option value=""></option>
										</select>
									</c:if>
								</td>
								<td class="form-inline"><label class="lbl" for="">县区：</label>
									<c:if test="${not empty countylist}">
										<select class="chzn-select" id="organization_county" name="organization_county" data-placeholder="请选择县区">
											<option value=""></option>
											<c:forEach items="${countylist}" var="list">
												<option value="${list.id}"
													<c:if test="${list.id==pd.organization_county}">selected</c:if>>${list.name}</option>
											</c:forEach>
										</select>
									</c:if>
									<c:if test="${empty countylist}">
										<select class="chzn-select" id="organization_county" name="organization_county" data-placeholder="请选择县区">
											<option value=""></option>
										</select>
									</c:if>
								</td>
								</c:if>
								<td style="vertical-align: top;">
									<button type="button" onclick="search();" class="btn btn-small btn-success btn-lg" title="检索" >查询<i class="icon-search icon-on-right"></i></button>
								</td>
								<td style="width: 20px"></td>
							</tr>
						</table>
						<hr/>
						<!-- 检索  -->
						<c:if test="${pd.isFlag}">
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
									<th class="center" style="width:3%;"><label><input type="checkbox"
											id="zcheckbox" /><span class="lbl"></span></label></th> 
									<th class="center" style="width:5%;">序号</th>
									<th class="center" style="width:15%;">组织名称</th>
									<th class="center" style="width:15%;">主管单位</th>
									<th class="center" style="width:10%;">省市区</th>
									<th class="center" style="width:9%;">联系人</th>
									<th class="center" style="width:10%;">联系人手机号</th>
									<th class="center" style="width:5%;">状态</th>
									<th class="center" style="width:10%;">更新时间</th>
									<th class="center" style="width:18%;">操作</th>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty pdList}">
											<c:forEach items="${pdList}" var="list" varStatus="vs">
												<tr>
													<td class='center' ><label><input
															type='checkbox' name='ids' value="${list.organization_id}" /><span
															class="lbl"></span></label></td>
													<td class='center' >${vs.index+1}</td>
													<td class="center"><a
														href="javascript:void(0);" title="${list.organization_name }"
														onclick="info('${list.organization_id}');">${list.organization_name }</a></td>
													<td class="center">${list.unit_name}</td>
													<td class="center">${list.organization_province }&nbsp;&nbsp;${list.organization_city}&nbsp;&nbsp;${list.organization_county}  </td>
													<td class="center">${list.organization_linkman}</td>
													<td class="center">${list.organization_phone }</td>
													<td class="center">${list.status_text }</td>
													<td class="center">${list.update_time }</td>
													<td>
													<c:if test="${pd.isEdit}">
														<a class="btn btn-mini btn-info" onclick="update('${list.organization_id}');" title="编辑"><i class="icon-edit"></i></a>
													</c:if>
													<c:if test="${pd.isFlag}">
														<a class="btn btn-mini btn-danger" onclick="del('${list.organization_id}');" title="删除"><i class="icon-trash"></i></a>
														<a class="btn btn-mini btn-success" title="获奖" onclick="award('${list.organization_id }');">获奖详情</a>
													</c:if>
														<a class="btn btn-mini btn-success" title="志愿者信息" onclick="volunteer('${list.organization_id }');">志愿者信息</a>
														<c:if test="${pd.isFlag && list.status=='0'}">
															<a class="btn btn-mini btn-success" title="审核" onclick="examine('${list.organization_id }');">审核</a>
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
									<c:if test="${pd.isFlag}">
										<td style="vertical-align: top;">
											<button type="button" class="btn btn-small btn-danger" onclick="batchDel('确定要删除选中的数据吗?')" title="批量删除">
												删除 <i class="icon-remove-sign icon-on-right"></i>
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
		function add(){
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="志愿者组织添加";
			 diag.URL = dialogPath+'vOrg/toAdd.do';
			 diag.Width = 1000;
			 diag.Height = 800;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage("${page.currentPage}");
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		function update(id){
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="志愿者组织更新";
			 diag.URL = dialogPath+'vOrg/toUpdate.do?organization_id='+id;
			 diag.Width = 1000;
			 diag.Height = 800;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage("${page.currentPage}");
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		function info(id){
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="详情";
			 diag.URL = dialogPath+'vOrg/toInfo.do?organization_id='+id;
			 diag.Width = 850;
			 diag.Height = 800;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage("${page.currentPage}");
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		function del(id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					$.ajax({
						type: "POST",
						url: "<%=basePath%>vOrg/delete.do",
						data:
							{
								organization_id:id
							},
						dataType:"text",
						cache : false,
						success:function(data){
							if(data=="success"){
								nextPage("${page.currentPage}");
							}
						}
					});
				}
			});
		}
		
		//批量操作
		function batchDel(msg){
			
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
								url: "<%=basePath%>vOrg/batchDel.do",
							data : {
								str : str
							},
							dataType : "text",
							cache : false,
							success : function(data) {
								nextPage("${page.currentPage}");
							}
						});
					}
				}
			});
		}
		
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

			//选择市
			$("#organization_province").change(function(){
				var province_id = $("#organization_province").val();
				$.ajax({
					type: "POST",
					url: "<%=basePath%>vOrg/selectCity.do",
					data:
						{
						province_id:province_id
						},
					dataType:"json",
					cache : false,
					success:function(data){
						var html='<option value=""></option>';
						var html_area = '<option value=""></option>';
						$("#organization_city").empty();
						$("#organization_county").empty();
						$.each(data.cityList,function(i,obj){
							html += "<option value="+obj.id+">"+obj.name+"</option>";
						});
						$("#organization_city").append(html);
						$("#organization_city").trigger("liszt:updated");
						$("#organization_county").append(html_area);
						$("#organization_county").trigger("liszt:updated");
					}
				});
			});
			//选择区县
			$("#organization_city").change(function(){
				var city_id = $("#organization_city").val();
				$.ajax({
					type:"POST",
					url:"<%=basePath%>vOrg/selectArea.do",
					data:
						{
						city_id:city_id
						},
					dataType:"json",
					cache:false,
					success:function(data){
						var html='<option value=""></option>';
						$("#organization_county").empty();
						$.each(data.areaList,function(i,obj){
							html += "<option value="+obj.id+">"+obj.name+"</option>";
						});
						$("#organization_county").append(html);
						$("#organization_county").trigger("liszt:updated");
					}
				});
			});
			
		});
		
		//审核
		function examine(organization_id){
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="审核";
			 diag.URL = dialogPath+'vOrg/toExamine.do?organization_id='+organization_id;
			 diag.Width = 850;
			 diag.Height = 800;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 setTimeout("self.location=self.location",100);
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//志愿者信息
		function volunteer(organization_id){
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="志愿者";
			 diag.URL = dialogPath+'vOrg/volunteerList.do?organization_id='+organization_id;
			 diag.Width = 1000;
			 diag.Height = 600;
			 diag.CancelEvent = function(){ //关闭事件
			 	setTimeout("self.location=self.location",100);
				diag.close();
			 };
			 diag.show();
		}
		
		//获奖信息
		function award(organization_id){
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Width = 1000;
			diag.Height = 600;
			diag.Title = "获奖信息";
			diag.ShowButtonRow = false;
			diag.URL = dialogPath + "vOrg/awardList.do?organization_id="+organization_id;
			
			diag.show();
			
		}
		
	</script>
</body>
</html>

