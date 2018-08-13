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
					<form action="<%=basePath%>appuser/list.do" method="post" name="Form" id="Form">
						<table style="margin-bottom: 20px;">
							<tr>
								<td class="form-inline">
								<label class="lbl" for="end_time" >用户名：</label>
								<span class="input-icon"> <input
										autocomplete="off" id="user_name" type="text"
										name="user_name" style="width: 200px" value="${pd.user_name }"
										placeholder="这里输入用户名" onblur="trim(this);" /> <i id="nav-search-icon"
										class="icon-search"></i>
								</span></td>
								<td class="form-inline">
								<label class="lbl" for="end_time" >手机号：</label>
								<span class="input-icon"> <input
										autocomplete="off" id="user_phone" type="text"
										name="user_phone" style="width: 200px" value="${pd.user_phone }"
										placeholder="这里输入手机号" onblur="trim(this);" /> <i id="nav-search-icon"
										class="icon-search"></i>
								</span></td>
								<c:if test="${is_super_admin}">
								<td class="form-inline">
								<label class="lbl" for="end_time" >单位：</label>
								<select class="chzn-select" id="unit_id" name="unit_id" data-placeholder="请选择单位">
										<option value="">全部</option>
										<c:forEach items="${unitList}" var="list">
											<option value="${list.unit_id}" <c:if test="${list.unit_id == pd.unit_id}">selected</c:if>>${list.unit_name_full}</option>
										</c:forEach>
								</select></td>
								</c:if>
								<td style="width: 20px"></td>
<!-- 								<td class="form-inline"> -->
<!-- 									<label class="lbl" for="">是否禁用：</label>  -->
<!-- 									<select class="chzn-select" id="user_disabled" name="user_disabled" data-placeholder="请选择属性类型"> -->
<!-- 										<option value="">全部</option> -->
<%-- 									    <option value="1" <c:if test="${pd.user_disabled=='1' }">selected</c:if>>是</option> --%>
<%-- 									    <option value="0" <c:if test="${pd.user_disabled=='0' }">selected</c:if>>否</option> --%>
<!-- 									</select> -->
<!-- 								</td> -->
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
										<button type="button" class="btn btn-small btn-success btn-lg"  onclick="excelImport()" title="添加">
										批量导入 <i class="icon-plus-sign icon-on-right"></i>
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
									<th class="center" style="width:10%;">用户名</th>
									<th class="center" style="width:15%;">手机号</th>
									<th class="center" style="width:15%;">身份证</th>
									<th class="center" style="width:15%;">所属单位</th>
									<th class="center" style="width:10%;">用户类型</th>
									<th class="center" style="width:27%;">操作</th>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty userList}">
											<c:forEach items="${userList}" var="list" varStatus="vs">
												<tr>
													<td class='center' ><label><input
															type='checkbox' name='ids' value="${list.user_id}" /><span
															class="lbl"></span></label></td>
													<td class='center' >${vs.index+1}</td>
													<td class="tds" style="width:500px"><a
														href="javascript:void(0);" title="${list.user_name }"
														onclick="info('${list.user_id }');">${list.user_name }</a></td>
													<td class="center">${list.user_phone }</td>
													<td class="center">${list.user_id_number }</td>
													<td class="tds">
														<if test="${list.DEL_FLG  == '0'}">${list.UNIT_NAME_FULL }</if>
													</td>
													<td class="center">${list.user_type }</td>
													<td style="width: 50px;" class="left">
														<a class="btn btn-small btn-info" title="编辑" onclick="edit('${list.user_id }');"><i class="icon-edit"></i></a>
														<a class="btn btn-small btn-danger" onclick="del('${list.user_id}');" title="删除"><i class="icon-trash"></i></a>
														<a class="btn btn-small btn-primary" onclick="linkman('${list.user_id}');" title="常用联系人">常用联系人</a>
														<c:if test="${list.user_status==2 }">
														<a class="btn btn-small btn-primary" onclick="registCheck('${list.user_id}');" title="注册审核">注册审核</a>
														</c:if>
														<c:if test="${list.user_status==3 }">
														<a class="btn btn-small btn-primary" onclick="editCheck('${list.user_id}');" title="修改信息审核">修改信息审核</a>
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
										<button type="button" class="btn btn-small btn-danger" onclick="deleteAll('确定要删除选中的数据吗?')" title="批量删除">
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
		//查看常用联系人
		function linkman(user_id){
			window.location="<%=basePath%>appuser/linkmanList.do${url}&user_id="+user_id;
		}
		
		//注册审核
		function registCheck(user_id){
			window.location="<%=basePath%>appuser/goInfo.do${url}&regist_check=1&user_id="+user_id;
		}
		//修改信息审核
		function editCheck(user_id){
			window.location="<%=basePath%>appuser/toEditCheck.do${url}&user_id="+user_id;
		}
		
		//检索
		function search(){
			var user_name = $("#user_name").val();
			if(isSpeChar(user_name)){
				$("#user_name").tips({
					side : 3,
					msg : '用户名不允许包含非法字符',
					bg : '#FF5080',
					time : 2
				});
				$("#user_name").focus();
				return false;
			}
			var userPhone = $("#user_phone").val();
			if(userPhone!=null&&userPhone!=""){
				var myreg = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9]|17[0|1|2|3|5|6|7|8|9])\d{8}$/;
				if(!myreg.test(userPhone)){
					$("#user_phone").tips({
						side : 3,
						msg : '请输入正确格式手机号',
						bg : '#FF5080',
						time : 2
					});
					$("#user_phone").focus();
					return false;
				}
			}
			top.jzts();
			$("#Form").submit();
			 nextPage('${page.currentPage}');
		}
	
		
		//新增
		function add(){
			window.location="<%=basePath%>appuser/to_Add.do${url}";
		}
		
		//修改
		function edit(user_id){
			window.location="<%=basePath%>appuser/goEdit.do${url}&user_id="+user_id;
		}
		
		//详情
		function  info(user_id){
			window.location="<%=basePath%>appuser/goInfo.do${url}&user_id="+user_id;
		}
		
		function excelImport(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="app用户导入";
			 diag.URL = dialogPath+'appuser/toExcelImport.do';
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
		
		
		//删除
		function del(user_id,msg){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>appuser/del.do?user_id="+user_id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						window.location.reload();
					});
				}
			});
		}
		
		
		//批量操作   修改操作时，先提示删除后提示选择内容的提示。 edit yanghaibo 2017-11-10
		function deleteAll(msg){
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
					//var str = '';
					//var emstr = '';
					//var phones = '';
					/* for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(str=='') str += document.getElementsByName('ids')[i].value;
						  	else str += ',' + document.getElementsByName('ids')[i].value;
						  	
						  	if(emstr=='') emstr += document.getElementsByName('ids')[i].id;
						  	else emstr += ';' + document.getElementsByName('ids')[i].id;
						  	
						  	if(phones=='') phones += document.getElementsByName('ids')[i].alt;
						  	else phones += ';' + document.getElementsByName('ids')[i].alt;
						  }
					} */
					/* if(str==''){
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
					} */
					//else{
						if(msg == '确定要删除选中的数据吗?'){
							
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>appuser/deleteAll.do?tm='
																+ new Date()
																		.getTime(),
														 data : {
															IDS : str
														}, 
														dataType : 'json',
														//beforeSend: validateData,
														cache : false,
														success : function(data) {
															$.each(data.list,
																			function(i,list) {
																				window.location.reload();
																			});
														}
													});
										} else if (msg == '确定要给选中的用户发送邮件吗?') {
											sendEmail(emstr);
										} else if (msg == '确定要给选中的用户发送短信吗?') {
											sendSms(phones);
										}

									//}
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

			//复选框  修改复选框选择  edit yanghaibo 2017-11-10
			/* $('table th input:checkbox').on(
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
					}); */
					
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

