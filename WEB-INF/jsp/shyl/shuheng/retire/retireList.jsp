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
					<form action="<%=basePath%>retire/list.do" method="post" name="Form" id="Form">
						<input type="hidden" id="is_super_admin" value="${is_super_admin }"/>
						<input type="hidden" id="lgbj" value="${pd.lgbj }"/>
						<input type="hidden" id="unit_type" value="${pd.unit_type }"/>
						<table style="margin-bottom: 20px;">
							<tr>
								<td class="form-inline">
								<label class="lbl" for="user_name" >姓名：</label>
								<span class="input-icon"> <input
										autocomplete="off" id="user_name" type="text"
										name="user_name" style="width: 130px" value="${pd.user_name }"
										placeholder="这里输入姓名" onblur="trim(this);" /> <i id="nav-search-icon"
										class="icon-search"></i>
								</span></td>
								<c:if test="${is_super_admin || pd.lgbj}">
								<td class="form-inline">
								<label class="lbl" for="unit_id" >单位：</label>
								<select class="chzn-select" id="user_unit" name="user_unit" data-placeholder="请选择单位">
										<option value="">全部</option>
										<c:forEach items="${unitList}" var="list">
											<option value="${list.unit_id}" <c:if test="${list.unit_id == pd.user_unit}">selected</c:if>>${list.unit_name_full}</option>
										</c:forEach>
								</select></td>
								</c:if>
								<c:if test="${is_super_admin}">
									<td class="form-inline">
									<label class="lbl" for="unit_province" >省：</label>
									<select class="chzn-select" id="unit_province" name="unit_province" data-placeholder="请选择省">
											<option value="">全部</option>
											<c:forEach items="${provinceList}" var="list">
												<option value="${list.id}" <c:if test="${list.id == pd.unit_province}">selected</c:if>>${list.name}</option>
											</c:forEach>
									</select></td>
									<td class="form-inline">
									<label class="lbl" for="unit_city" >市：</label>
									<select class="chzn-select" id="unit_city" name="unit_city" data-placeholder="请选择市">
											<option value="">全部</option>
											<c:forEach items="${cityList}" var="list">
												<option value="${list.id}" <c:if test="${list.id == pd.unit_city}">selected</c:if>>${list.name}</option>
											</c:forEach>
									</select></td>
									<td class="form-inline">
									<label class="lbl" for="unit_county" >区：</label>
									<select class="chzn-select" id="unit_county" name="unit_county" data-placeholder="请选择区">
											<option value="">全部</option>
											<c:forEach items="${countyList}" var="list">
												<option value="${list.id}" <c:if test="${list.id == pd.unit_county}">selected</c:if>>${list.name}</option>
											</c:forEach>
									</select></td>
								</c:if>
								<c:if test="${pd.lgbj && pd.unit_type==2 }">
									<td class="form-inline">
									<label class="lbl" for="unit_city" >市：</label>
									<select class="chzn-select" id="unit_city" name="unit_city" data-placeholder="请选择市">
											<option value="">全部</option>
											<c:forEach items="${cityList}" var="list">
												<option value="${list.id}" <c:if test="${list.id == pd.unit_city}">selected</c:if>>${list.name}</option>
											</c:forEach>
									</select></td>
									<td class="form-inline">
									<label class="lbl" for="unit_county" >区：</label>
									<select class="chzn-select" id="unit_county" name="unit_county" data-placeholder="请选择区">
											<option value="">全部</option>
											<c:forEach items="${countyList}" var="list">
												<option value="${list.id}" <c:if test="${list.id == pd.unit_county}">selected</c:if>>${list.name}</option>
											</c:forEach>
									</select></td>
								</c:if>
								<c:if test="${pd.lgbj && pd.unit_type==3 }">
									<td class="form-inline">
									<label class="lbl" for="unit_county" >区：</label>
									<select class="chzn-select" id="unit_county" name="unit_county" data-placeholder="请选择区">
											<option value="">全部</option>
											<c:forEach items="${countyList}" var="list">
												<option value="${list.id}" <c:if test="${list.id == pd.unit_county}">selected</c:if>>${list.name}</option>
											</c:forEach>
									</select></td>
								</c:if>
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
									<th class="center" style="width:15%;">姓名</th>
									<th class="center" style="width:5%;">性别</th>
									<th class="center" style="width:15%;">联系电话</th>
									<th class="center" style="width:10%;">出生年月</th>
									<th class="center" style="width:22%;">现服务单位</th>
									<th class="center" style="width:10%;">更新时间</th>
									<th class="center" style="width:15%;">操作</th>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty list}">
											<c:forEach items="${list}" var="list" varStatus="vs">
												<tr>
													<td class='center' ><label><input
															type='checkbox' name='ids' value="${list.user_id}" /><span
															class="lbl"></span></label></td>
													<td class='center' >${vs.index+1}</td>
													<td class="center"><a
														href="javascript:void(0);" title="${list.user_name }"
														onclick="info('${list.user_id}');">${list.user_name }</a></td>
													<td class="center">
														<c:if test="${list.user_sex==0}">男</c:if>
														<c:if test="${list.user_sex==1}">女</c:if>
													</td>
													<td class="center">${list.user_phone}</td>
													<td class="center">${list.user_birthday }</td>
													<td class="center">${list.unit_name }</td>
													<td class="center">${list.update_time }</td>
													<td  class="center">
														<c:if test="${pd.is_super_admin || list.unit_id ==pd.unit_id }">
															<c:if test="${list.user_die==0}">
															<a class="btn btn-small btn-warning" onclick="logout('${list.user_id}')">注销</a>
															</c:if>
															<c:if test="${list.user_die==1}">
																<a class="btn btn-small btn-warning" style="opacity: 0.2;cursor:not-allowed;" onclick="">注销</a>
															</c:if>
															<a class="btn btn-small btn-info" onclick="update('${list.user_id}');" title="编辑"><i class="icon-edit"></i></a>
															<a class="btn btn-small btn-danger" onclick="del('${list.user_id}');" title="删除"><i class="icon-trash"></i></a>
														</c:if>
														<c:if test="${!pd.is_super_admin && list.unit_id !=pd.unit_id }">
															<a class="btn btn-small btn-warning" style="opacity: 0.2;cursor:not-allowed;" onclick="">注销</a>
															<a class="btn btn-small btn-info" style="opacity: 0.2;cursor:not-allowed;" onclick="" title="编辑"><i class="icon-edit"></i></a>
															<a class="btn btn-small btn-danger" style="opacity: 0.2;cursor:not-allowed;" onclick="" title="删除"><i class="icon-trash"></i></a>
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
										<c:if test="${pd.is_super_admin}">
										<button type="button" class="btn btn-small btn-danger" onclick="batchDel('确定要删除选中的数据吗?')" title="批量删除">
											删除 <i class="icon-remove-sign icon-on-right"></i>
										</button>
										</c:if>
									</td>
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
			 diag.Title ="离休老干部添加";
			 diag.URL = dialogPath+'retire/toAdd.do';
			 diag.Width = 900;
			 diag.Height = 700;
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
			 diag.Title ="离休老干部详情";
			 diag.URL = dialogPath+'retire/toInfo.do?user_id='+id;
			 diag.Width = 900;
			 diag.Height = 700;
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
			 diag.Title ="离休老干部更新";
			 diag.URL = dialogPath+'retire/toUpdate.do?user_id='+id;
			 diag.Width = 900;
			 diag.Height = 700;
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
		function logout(id){
			bootbox.confirm("确定要注销吗（注销后该用户不作为数据分析对象）?", function(result) {
				if(result) {
					top.jzts();
					$.ajax({
						type: "POST",
						url: "<%=basePath%>retire/logout.do",
						data:
							{
								user_id:id
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
		
		function del(id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					$.ajax({
						type: "POST",
						url: "<%=basePath%>retire/delete.do",
						data:
							{
								user_id:id
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
								url: "<%=basePath%>retire/batchDel.do",
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
			var isSuperAdmin = $("#is_super_admin").val();
			var lgbj = $("#lgbj").val();
			var unitType = $("#unit_type").val();
			if("true"==isSuperAdmin){
				$("#unit_province").change(function() {
				    BindCId2(0);
				});
			}
			if("true"==isSuperAdmin || (lgbj=='true' && unitType=='2')){
				$("#unit_city").change(function() {
				    BindCId3(0);
				});
			}
			
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});

		});
		
		
		function BindCId2(cid) {
			var PID = $("#unit_province").val();
			$("#unit_city").empty();
			$("#unit_county").empty();
			if (PID == "") {
		        $("<option value=''></option>").appendTo("#unit_city");
		    }else{
		    	$.ajax({
					type:"POST",
					url:"<%=basePath%>unit/getcityList.do",
					data:{'PID' : PID},
					dataType:"json",
					cache:false,
					success:function(data){
						var html='<option value=""></option>';
						var html1 = '<option value=""></option>';
						$.each(data.citylist,function(i,list){
							if(list.id==cid){
								if(cid!=0){
									html+="<option value="+list.id+" selected='selected' >"+list.name+"</option>";
								}
							}else{
								html+="<option value="+list.id+">"+list.name+"</option>";
							}
						});
						$("#unit_city").append(html);
						$("#unit_city").trigger("liszt:updated");
						$("#unit_county").append(html1);
						$("#unit_county").trigger("liszt:updated");
					}
				});
		    }
		}
		
		function BindCId3(cid) {
			var PID = $("#unit_city").val();
			$("#unit_county").empty();
			if (PID == "") {
		        $("<option value=''></option>").appendTo("#unit_county");
		    }else{
		    	$.ajax({
					type:"POST",
					url:"<%=basePath%>unit/getareaList.do",
					data:{'PID' : PID},
					dataType:"json",
					cache:false,
					success:function(data){
						var html='<option value=""></option>';
						$.each(data.arealist,function(i,list){
							if(list.id==cid){
								if(cid!=0){
									html+="<option value="+list.id+" selected='selected' >"+list.name+"</option>";
								}
							}else{
								html+="<option value="+list.id+">"+list.name+"</option>";
							}
						});
						$("#unit_county").append(html);
						$("#unit_county").trigger("liszt:updated");
					}
				});
		    }
		}
	</script>
</body>
</html>

