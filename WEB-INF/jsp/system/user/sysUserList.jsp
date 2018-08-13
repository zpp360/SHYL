<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- jsp文件头和头部 -->
<%@ include file="../admin/top.jsp"%>
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
</style>
</head>
<body>
	<div class="container-fluid" id="main-container">
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<div class="row-fluid">
					<!-- 检索  -->
					<form action="sysUser/listUsers.do" method="post" name="userForm"
						id="userForm">
						<table style="margin-bottom: 20px;">
							<tr>
								<td class="form-inline">
								<label class="lbl" for="USERNAME" >用户名：</label>
								<span class="input-icon"> <input
										autocomplete="off" id="nav-search-input" type="text"
										style="width: 350px" name="USERNAME" value="${pd.USERNAME }"
										placeholder="这里输入用户名或姓名" maxlength="50" onblur="trim(this);"/> <i id="nav-search-icon"
										class="icon-search"></i>
								</span></td>
								<td class="form-inline">
								<label class="lbl" for="role_id" >角色：</label>
								 	<select class="chzn-select" name="ROLE_ID" id="role_id" data-placeholder="请选择角色" style="vertical-align:top;width: 200px;">
									<option value=""></option>
									<option value="">全部</option>
									<c:forEach items="${roleList}" var="role">
										<option value="${role.ROLE_ID }" <c:if test="${pd.ROLE_ID==role.ROLE_ID}">selected</c:if>>${role.ROLE_NAME }</option>
									</c:forEach>
								  	</select>
								</td>
								<c:if test="${pd.IS_SUPER_ADMIN}">
								<td class="form-inline">
								<label class="lbl" for="unit_id" >单位：</label>
								<select class="chzn-select" id="unit_id" name="unit_id" data-placeholder="请选择单位">
										<option value="">全部</option>
										<c:forEach items="${unitList}" var="list">
											<option value="${list.unit_id}" <c:if test="${list.unit_id == pd.unit_id}">selected</c:if>>${list.unit_name_full}</option>
										</c:forEach>
								</select></td>
								</c:if>
								<td style="vertical-align: top;">
									<button type="button" onclick="search();" class="btn btn-small btn-success btn-lg" title="检索" >查询<i class="icon-search icon-on-right"></i></button>
								</td>
								<td style="width: 20px"></td>
							</tr>
						</table>
						<!-- 检索  -->
						<hr/>
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
									<th class="center"><label><input type="checkbox"
											id="zcheckbox" /><span class="lbl"></span></label></th>
									<th class="center">序号</th>
									<th class="center">用户名</th>
									<th class="center">姓名</th>
									<th class="center">角色</th>
									<th class="center">联系电话</th>
									<th class="center">所属单位</th>
<!-- 									<th class="center"><i class="icon-envelope"></i>邮箱</th> -->
									<th class="center">最后登录时间</th>
									<th class="center">操作</th>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty userList}">
										<c:forEach items="${userList}" var="user" varStatus="vs">
											<tr>
												<td class='center' style="width: 30px;"><c:if
														test="${user.USERNAME != 'admin'}">
														<label><input type='checkbox' name='ids'
															value="${user.USER_ID }" id="${user.EMAIL }"
															alt="${user.PHONE }" /><span class="lbl"></span></label>
													</c:if> <c:if test="${user.USERNAME == 'admin'}">
														<label><input type='checkbox' disabled="disabled" /><span
															class="lbl"></span></label>
													</c:if></td>
												<td class='center' style="width: 30px;">${vs.index+1}</td>
												<td class='center'>${user.USERNAME }</td>
												<td class='center'>${user.NAME }</td>
												<td class='center'>${user.ROLE_NAME }</td>
												<td class='center'>${user.PHONE }</td>
												<td class='center'><if test="${user.DEL_FLG  == '0'}">${user.UNIT_NAME_FULL}</if></td>
<%-- 												<td class='center'>${user.EMAIL }</td> --%>
												<td class='center'>${user.LAST_LOGIN }</td>
												<td class='center' style="width: 200px;">
													<a class='btn btn-small btn-info' title="修改" onclick="editUser('${user.USER_ID }');"><i class="icon-pencil"></i></a> 
													<a class='btn btn-small btn-purple' title="修改密码" onclick="editPwd('${user.USER_ID }');"><i class="icon-wrench"></i></a>
													<a class='btn btn-small btn-danger' title="删除" onclick="delUser('${user.USER_ID }')"><i class="icon-trash"></i></a>
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
									<td style="vertical-align: top;"><button type="button" class="btn btn-small btn-danger" onclick="makeAll('确定要删除选中的数据吗?')" title="批量删除">
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
			</div>
		</div>
	</div>

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
	<script type="text/javascript"
		src="static/js/bootstrap-datepicker.min.js"></script>
	<!-- 日期框 -->
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
			$("#userForm").submit();
		}
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增系统用户";
			 diag.URL = dialogPath+'sysUser/goAddU.do';
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
		
		//修改
		function editUser(user_id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="修改系统用户";
			 diag.URL = dialogPath+'sysUser/goEditU.do?USER_ID='+user_id;
			 diag.Width = 750;
			 diag.Height = 330;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage("${page.currentPage}");
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//重置密码
		function editPwd(user_id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="修改密码";
			 diag.URL = dialogPath+'sysUser/goEditPwd.do?USER_ID='+user_id;
			 diag.Width = 550;
			 diag.Height = 200;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage("${page.currentPage}");
				}
				diag.close();
			 };
			 diag.show();
		}
		
	    //删除用户
        function delUser(user_id){
        	bootbox.confirm("确定要删除此用户吗?", function(result) {
        		if (result) {
        			top.jzts();
                    $.ajax({
                        type: "POST",
                        url: '<%=basePath%>sysUser/deleteAllU.do?tm='
                                                        + new Date()
                                                                .getTime(),
                                                data : {
                                                    USER_IDS : user_id
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
					/* var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(str=='') str += document.getElementsByName('ids')[i].value;
						  	else str += ',' + document.getElementsByName('ids')[i].value;
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
					}else{ */
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>sysUser/deleteAllU.do?tm='
																+ new Date()
																		.getTime(),
														data : {
															USER_IDS : str
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
										}
									//}
								}
							});
		}
	</script>

	<script type="text/javascript">
		$(function() {
			//日期框
			$('.date-picker').datepicker();

			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});

			//复选框
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