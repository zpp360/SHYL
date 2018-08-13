<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<title>查看</title>
<base href="<%=basePath%>">
<%@ include file="../../../system/admin/top.jsp"%>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js"
	type="text/javascript"></script>

<script type="text/javascript">
	window.jQuery
			|| document
					.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
</script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/ace-elements.min.js"></script>
<script src="static/js/ace.min.js"></script>
<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="static/js/jquery.tips.js"></script>

<script type="text/javascript" src="static/js/bootbox.min.js"></script>

<!-- 引入news.js -->
<script type="text/javascript" src="shyl/js/news/news.js"></script>


<style type="text/css">
.btnlist {
	padding: 5px;
	margin: 5px;
	border: 1px solid #ddd;
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}

table {
	table-layout: fixed;
}

.tds a {
	width: 100%;
	word-break: keep-all;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.tds {
	width: 100%;
	word-break: keep-all;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
</head>
<body>
	<div class="container-fluid" id="main-container">
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<form action="<%=basePath%>sign_up/signUpUserDetail.do"
					method="post" name="Form" id="Form">
					<input type="hidden" id="sign_up_id" name="sign_up_id"
						value="${pd.sign_up_id}" />
					<table style="margin-bottom: 20px;">
						<tr>
							<td class="form-inline">
								<label class="lbl" for="end_time">参会人员：</label>
								<span class="input-icon"> 
									<input autocomplete="off" id="user_name" type="text" name="user_name" style="width: 100px" value="${pd.user_name}" placeholder="输入参会人员" onblur="trim(this);" />
									 <i id="nav-search-icon" class="icon-search"></i>
								</span>
							</td>
							<td class="form-inline">
								<label class="lbl" for="end_time">报名操作人：</label>
								<span class="input-icon"> 
									<input autocomplete="off" id="create_name" type="text" name="create_name" style="width: 100px" value="${pd.create_name}" placeholder="输入报名操作人" onblur="trim(this);" />
									 <i id="nav-search-icon" class="icon-search"></i>
								</span>
							</td>
							<td class="form-inline"><label class="lbl" for="">单位：</label>
								<select class="chzn-select" id="unit_id" name="unit_id" data-placeholder="请选择单位">
									<option value="">全部</option>
									<c:forEach items="${unitList}" var="list">
										<option value="${list.unit_id}"
										<c:if test="${list.unit_id==pd.unitId}">selected</c:if>>${list.unit_name_full}</option>
									</c:forEach>
								</select>
							</td>
							<td class="form-inline"><label class="lbl" for="">读取状态：</label>
								<select class="chzn-select" id="is_read" name="is_read" data-placeholder="请选择读取状态">
									<option value="">全部</option>
									<option value="0" <c:if test="${pd.is_read == '0'}">selected</c:if>>未读</option>
									<option value="1" <c:if test="${pd.is_read == '1'}">selected</c:if>>已读</option>
								</select>
							</td>
							<td class="form-inline"><label class="lbl" for="">报名状态：</label>
								<select class="chzn-select" id="status" name="status" data-placeholder="请选择报名状态">
									<option value="">全部</option>
									<option value="0" <c:if test="${pd.status == '0'}">selected</c:if>>未报名</option>
									<option value="1" <c:if test="${pd.status == '1'}">selected</c:if>>已报名</option>
								</select>
							</td>
							<td></td>
							<td style="vertical-align: top;">
								<button type="button" onclick="search();"
									class="btn btn-small btn-success btn-lg" title="检索">
									查询<i class="icon-search icon-on-right"></i>
								</button>
							</td>
						</tr>
					</table>
					<table id="table_report"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class="center" style="width: 5%;">已报名人数</th>
								<th class="center" style="width: 10%;">住宿人数</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="center tds">${countPd.status}</td>
								<td class="center tds">${countPd.is_hotel}</td>
							</tr>
						</tbody>
					</table>
					<table id="table_report"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<!-- 								<th class="center" style="width:5%;"><label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label></th>  -->
								<th class="center" style="width: 4%;">序号</th>
								<th class="center" style="width: 8%;">参会人员</th>
								<th class="center" style="width: 5%;">性别</th>
								<th class="center" style="width: 10%;">民族</th>
								<th class="center" style="width: 20%;">所属单位</th>
								<th class="center" style="width: 10%;">(原)职务(职级)或职称</th>
								<th class="center" style="width: 5%;">是否住宿</th>
								<th class="center" style="width: 5%;">读取状态</th>
								<th class="center" style="width: 5%;">报名状态</th>
								<th class="center" style="width: 10%;">报名时间</th>
								<th class="center" style="width: 8%;">报名操作人</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty signUpUserDetailList}">
									<c:forEach items="${signUpUserDetailList}" var="list"
										varStatus="vs">
										<tr>
											<!-- 												<td class='center' ><label> -->
											<%-- 													<input type='checkbox' name='ids' value="${list.sign_up_user_id}" /><span class="lbl"></span></label> --%>
											<!-- 												</td> -->
											<td class='center'>${vs.index+1}</td>
											<td class="center tds" title="${list.user_name}">${list.user_name}</td>
											<td class="center tds">
												<c:if test="${list.user_sex == '0'}">男</c:if> 
												<c:if test="${list.user_sex == '1'}">女</c:if>
											</td>
											<td class="center tds" title="${list.mz_name}">${list.mz_name}</td>
											<td class="center tds" title="${list.UNIT_NAME_FULL}">${list.UNIT_NAME_FULL}</td>
											<td class="center tds" title="${list.user_job}">${list.user_job}</td>
											<td class="center tds">
												<c:if test="${list.is_hotel == '0'}">不住宿</c:if> 
												<c:if test="${list.is_hotel == '1'}">住宿</c:if>
											</td>
											<td class="center tds">
												<c:if test="${list.is_read == '0'}">未读</c:if> 
												<c:if test="${list.is_read == '1'}">已读</c:if>
											</td>
											<td class="center tds">
												<c:if test="${list.status == '0'}">未报名</c:if> 
												<c:if test="${list.status == '1'}">已报名</c:if>
											</td>
											<td class="center tds" title="${list.create_time}">${list.create_time}</td>
											<td class="center tds" title="${list.create_name}">${list.create_name}</td>
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
									<c:if test="${pd.go_sign_flag=='0'}">
										<button type="button" onclick="add();" class="btn btn-small btn-success btn-lg" title="报名">
											报名<i class="icon-plus-sign icon-on-right"></i>
										</button>
									</c:if>
									<button type="button" onclick="exportExcel();" class="btn btn-small btn-success btn-lg" title="导出">
										批量导出<i class="icon-plus-sign icon-on-right"></i>
									</button>
								</td>
								<td style="vertical-align: top;">
									<div class="pagination"
										style="float: right; padding-top: 0px; margin-top: 0px;">${page.pageStr}</div>
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

		$(document).ready(function() {

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

		});

		//检索
		function search() {
			top.jzts();
			$("#Form").submit();
			nextPage('${page.currentPage}');
		}

		//添加
		function add() {
			var sign_up_id = $("#sign_up_id").val();

			top.jzts();
			var diag = new top.Dialog();
			diag.Drag = true;
			diag.Title = "新增";
			diag.URL = dialogPath + 'sign_up/toAddUser.do?sign_up_id='
					+ sign_up_id;
			diag.Width = 400;
			diag.Height = 480;
			diag.CancelEvent = function() { //关闭事件
				if (diag.innerFrame.contentWindow.document
						.getElementById('zhongxin').style.display == 'none') {
					if ('${page.currentPage}' == '0') {
						top.jzts();
						setTimeout("self.location=self.location", 100);
					} else {
						nextPage("${page.currentPage}");
					}
				}
				diag.close();
			};
			diag.show();
		}
		
		//导出
		function exportExcel(){
			var sign_up_id = $("#sign_up_id").val();
			var user_name = $("#user_name").val();
			var create_name = $("#create_name").val();
			var unit_id = $("#unit_id").val();
			var status = $("#status").val();
			var is_read = $("#is_read").val();
			window.location = "<%=basePath%>sign_up/exportExcel.do?sign_up_id="+sign_up_id+"&user_name="+user_name+"&create_name="+create_name+"&unit_id="+unit_id+"&status="+status+"&is_read="+is_read;
		}
		
	</script>

</body>
</html>