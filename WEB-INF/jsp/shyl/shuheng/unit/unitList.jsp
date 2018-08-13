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
<title>单位管理</title>
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
					<form action="<%=basePath%>unit/list.do" method="post" name="Form" id="Form">
						<table style="margin-bottom: 20px;">
							<tr>
								<td class="form-inline">
								<label class="lbl" for="end_time" >单位名称：</label>
								<span class="input-icon"> <input
										autocomplete="off" id="unit_name" type="text"
										name="unit_name" style="width: 350px" value="${pd.unit_name }"
										placeholder="这里输入单位名称" onblur="trim(this);" /> <i id="nav-search-icon"
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
<!-- 								<td nowrap="nowrap"> -->
<!-- 									<div class="contentline-both" style="margin-bottom: 10px;"> -->
<!-- 										<button type="button" class="btn btn-small btn-success btn-lg"  onclick="excelImport()" title="添加"> -->
<!-- 										excel导入 <i class="icon-plus-sign icon-on-right"></i> -->
<!-- 										</button> -->
<!-- 									</div> -->
<!-- 								</td> -->
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
									<th class="center" style="width:15%;">单位简称</th>
									<th class="center" style="width:22%;">单位全称</th>
									<th class="center" style="width:12%;">地址</th>
									<th class="center" style="width:11%;">发布时间</th>
									<th class="center" style="width:11%;">修改时间</th>
									<th class="center" style="width:24%;">操作</th>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty unitAllList}">
											<c:forEach items="${unitAllList}" var="unit" varStatus="vs">
												<tr>
													<td class='center' ><label><input
															type='checkbox' name='ids' value="${unit.unit_id}" /><span
															class="lbl"></span></label></td>
													<td class='center' >${vs.index+1}</td>
													<td class="tds">${unit.unit_name_abbreviation }</td>
													<td class="tds" style="width:500px"><a
														href="javascript:void(0);" title="${unit.unit_name_full }"
														onclick="info('${unit.unit_id }');">${unit.unit_name_full }</a></td>
													<td class="tds">${unit.unit_add }</td>
													<td class="center"><fmt:formatDate value="${unit.insert_timestamp }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
													<td class="center"><fmt:formatDate value="${unit.update_timestamp }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
													<td style="width: 50px;" class="center">
														<c:if test="${pd.is_super_admin}">
															<a class="btn btn-mini btn-purple" title="单位类型" onclick="selectUnitStatus('${unit.unit_id }','${unit.unit_name_abbreviation}');"><i class="icon-pencil">单位类型</i></a>
															<a class="btn btn-mini btn-purple" title="栏目权限" onclick="editColumn('${unit.unit_id }','${unit.unit_name_abbreviation}');"><i class="icon-pencil">栏目权限</i></a>
															<a class="btn btn-mini btn-purple" title="场地权限" onclick="editPemission('${unit.unit_id }');"><i class="icon-pencil">场地权限</i></a>
														</c:if>
														<a class="btn btn-mini btn-info" title="编辑" onclick="editUnits('${unit.unit_id }');"><i class="icon-edit"></i></a>
														<a class="btn btn-mini btn-danger" onclick="delUnits('${unit.unit_id}');" title="删除"><i class="icon-trash"></i></a>
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
			var unit_name = $("#unit_name").val();
			if(isSpeChar(unit_name)){
				$("#unit_name").tips({
					side : 3,
					msg : '单位名不允许包含非法字符',
					bg : '#FF5080',
					time : 2
				});
				$("#unit_name").focus();
				return false;
			}
			
			top.jzts();
			$("#Form").submit();
			 nextPage('${page.currentPage}');
		}
	
		
		//新增
		function add(){
			window.location="<%=basePath%>unit/to_Add.do${url}";
		}
		
		//修改
		function editUnits(unit_id){
			window.location="<%=basePath%>unit/goEditUnit.do${url}&unit_id="+unit_id;
		}
		
		//详情
		function  info(unit_id){
			window.location="<%=basePath%>unit/goInfoUnit.do${url}&unit_id="+unit_id;
		}
		
		//单位类型
		function selectUnitStatus(unit_id,unitName){
			
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Width = 280;
			diag.Height = 370;
			diag.Title = '"'+unitName+'"单位类型';
			diag.ShowButtonRow = false;
			diag.URL = dialogPath+"unit/toUnitStatus.do?unit_id="+unit_id;
			
			diag.OKEvent = function(){//确定事件
				var status = diag.innerFrame.contentWindow.distinguish_id;
				var defaultValue = diag.innerFrame.contentWindow.defaultValue;
 				$.ajax({
					type: "POST",
					url: "<%=basePath%>unit/saveUnitStatus.do",
					data:{
						unit_id:unit_id,
						status:status.value,
						defaultValue:defaultValue.value
					},
					dataType:"json",
					cache : false,
					success:function(data){
					},
					error:function(){
						alert("系统异常！");
					}
				});
 				diag.close();
			};
			
 			diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			diag.show();
		}
		
		//栏目权限
		function editColumn(unit_id,unitName){
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Width = 280;
			diag.Height = 370;
			diag.Title = '"'+unitName+'"栏目权限';;
			diag.ShowButtonRow = false;
			diag.URL = dialogPath+"unit/toEditColumn.do?unit_id="+unit_id;
			
			diag.OKEvent = function(){//确定事件
				var column_id = diag.innerFrame.contentWindow.column_id;
 				$.ajax({
					type: "POST",
					url: "<%=basePath%>unit/saveColumnUnit.do",
					data:{
						unit_id:unit_id,
						column_id:column_id.value
					},
					dataType:"json",
					cache : false,
					success:function(data){
					},
					error:function(){
						alert("系统异常！");
					}
				});
 				diag.close();
			};
			
 			diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			diag.show();
		}
		
		//设置权限
		function editPemission(unit_id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="场地权限";
			 diag.URL = dialogPath+'unit/toEditPemission.do?unit_id='+unit_id+"&pemissionType=1";
			 diag.Width = 800;
			 diag.Height = 400;
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
		
		
		//删除
		function delUnits(unit_id,msg){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>unit/deleteUnit.do?unit_id="+unit_id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						if("fail"==data){
							//存在
							alert("存在用户，不允许删除")
						}
						nextPage("${page.currentPage}");
					});
				}
			});
		}
		
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					var emstr = '';
					var phones = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(str=='') str += document.getElementsByName('ids')[i].value;
						  	else str += ',' + document.getElementsByName('ids')[i].value;
						  	
						  	if(emstr=='') emstr += document.getElementsByName('ids')[i].id;
						  	else emstr += ';' + document.getElementsByName('ids')[i].id;
						  	
						  	if(phones=='') phones += document.getElementsByName('ids')[i].alt;
						  	else phones += ';' + document.getElementsByName('ids')[i].alt;
						  }
					}
					if(str==''){
						bootbox.dialog("您没有选择任何内容!", 
							[
							  {
								"label" : "关闭",
								"class" : "btn-small btn-success",
								"callback": function() {
									//Example.show("great success");
									}
								}
							 ]
						);
						
						$("#zcheckbox").tips({
							side:3,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>unit/deleteAllUnits.do?tm='
																+ new Date()
																		.getTime(),
														data : {
															IDS : str
														},
														dataType : 'json',
														//beforeSend: validateData,
														cache : false,
														success : function(data) {
															$
																	.each(
																			data.list,
																			function(
																					i,
																					list) {
																				nextPage("${page.currentPage}");
																			});
														}
													});
										} else if (msg == '确定要给选中的用户发送邮件吗?') {
											sendEmail(emstr);
										} else if (msg == '确定要给选中的用户发送短信吗?') {
											sendSms(phones);
										}

									}
								}
							});
		}
		
		function excelImport(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增系统用户";
			 diag.URL = dialogPath+'unit/toExcelImport.do';
			 diag.Width = 750;
			 diag.Height = 400;
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
	</script>
	<script type="text/javascript">
		$(function() {
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});

			//复选框
			$('table th input:checkbox').on(
					'click',
					function() {
						var that = this;
						$(this).closest('table').find(
								'tr > td:first-child input:checkbox').each(
								function() {
									this.checked = that.checked;
									$(this).closest('tr').toggleClass(
											'selected');
								});
					});
		});
	</script>
</body>
</html>

