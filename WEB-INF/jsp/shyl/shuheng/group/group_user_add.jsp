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
	<div id="zhongxin">
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<div class="row-fluid">
					<!-- 检索  -->
					<form action="<%=basePath%>group/toAddGroupUser.do" method="post" name="Form" id="Form">
						<input type="hidden" id="group_id" name="group_id" value="${pd.group_id}"/>
						
						<table>
							<tr>
								<td class="form-inline">
								<label class="lbl" for="end_time" >单位：</label>
								<span class="input-icon"><select class="chzn-select" name="user_unit" id="user_unit" 
								data-placeholder="请选择所属单位" style="height: 20px; width: 200px;" >
								<option value="">----------</option>
								<c:forEach items="${unitList}" var="list">
									<option value="${list.unit_id}" 
									<c:if test="${list.unit_id == pd.user_unit }">selected</c:if>>${list.unit_name_full}</option>
								</c:forEach>
								</select></span></td>
							
								<td class="form-inline">
								<label class="lbl" for="end_time" >用户名：</label>
								<span class="input-icon"> <input
										autocomplete="off" id="user_name" type="text"
										name="user_name" style="width: 150px" value="${pd.user_name }"
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
								<td style="width: 20px"></td>
								<td style="vertical-align: top;">
									<button type="button" onclick="search();" class="btn btn-small btn-success btn-lg" title="检索" >查询</button>
								</td>
								<td style="width: 20px"></td>
							</tr>
						</table>
						
						<!-- 检索  -->
						<table id="table_report"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center" style="width:5%;"><label><input type="checkbox"
											id="zcheckbox" /><span class="lbl"></span></label></th> 
									<th class="center" style="width:5%;">序号</th>
									<th class="center" style="width:20%;">用户名</th>
									<th class="center" style="width:30%;">手机号</th>
									<th class="center" style="width:20%;">所属单位</th>
									<th class="center" style="width:20%;">职务</th>
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
													<td class="tds" style="width:500px">${list.user_name }</td>
													<td class="center user_phone_td">${list.user_phone}</td>
													<td class="tds">
														${list.UNIT_NAME_FULL }
													</td>
													<td class="center">${list.user_job}</td>
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
						<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
						
						<div class="page-header position-relative">
							<table style="width: 100%;">
								<tr>
									<td width="20%" style="padding:0;">
										<button type="button" class="btn btn-small btn-info" onclick="addUserToGroup()" title="添加到分组">
											添加 <i class="icon-plus-sign icon-on-right"></i>
										</button>
									</td>
									<td width="80%"><div class="pagination"
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
		</div>
		<!--/#page-content-->
	</div>
	<!--/.fluid-container#main-container-->

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
		//添加用户到分组
		function addUserToGroup(){
			var groupId = $("#group_id").val();
			var userIdsArr = new Array();
			$("input[name='ids']:checked").each(function(){
				userIdsArr.push($(this).val());
			});
			var userIds = "";
			if(userIdsArr!=null&&userIdsArr.length>0){
				userIds = userIdsArr.toString();
			}
			location.href = "<%=basePath%>group/addGroupUser.do?userIds="+userIds+"&group_id="+groupId;
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
	
	</script>
	<script type="text/javascript">
		$(function() {
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});

					
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
			
			
			//手机号隐藏显示
			$(".user_phone_td").each(function(){
				var phone = $(this).text();
				var myreg = /^(1)[0-9]{10}$/;
				if(myreg.test(phone)){
					phone = phone.substring(0,3)+"****"+phone.substring(7,11);
					$(this).text(phone);
				}
			});
			
		});
	</script>
</body>
</html>

