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
<link rel="stylesheet" href="static/css/thing.css" />
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
					<form action="<%=basePath%>operateCompany/list.do" method="post" id="forms"
						class="form-horizontal">
						<input type="hidden" id="citys" value="${pd.City}"/>
						<table style="margin-bottom: 20px;">
							<tr>
								<td class="form-inline">
									<label class="lbl" for="company_name">企业名称：</label> 
									<input autocomplete="off" type="text" id="company_name" name="company_name" value="${pd.company_name }" placeholder="请输入企业名称" style="width:206px;" onblur="trim(this);"/>
								</td>
                                <td class="form-inline">
                                    <label class="lbl" for="user_name" style="margin-left:26px">用户名：</label> 
                                    <input autocomplete="off" type="text" id="user_name" name="user_name" value="${pd.user_name }" placeholder="请输入用户名" style="width:206px;" onblur="trim(this);"/>
                                </td>
							</tr>
							<tr style="height:10px;"></tr>
							<tr>
								<td class="form-inline" >
									<label class="lbl" for="">地&#12288;&#12288;址：</label> 
									<select class="chzn-select" id="Province" name="Province" data-placeholder="请选择所在省份">
										<option></option>
										<option value="">全部</option>
										<c:forEach items="${ProvinceList}" var="pro">
											<option value="${pro.region_id }" <c:if test="${pro.region_id == pd.Province}">selected</c:if>>${pro.region_name }</option>
										</c:forEach>
									</select>
									</td>
									<td >&#12288;&#12288;&#8194;&#151;&#8194;&#12288;&#12288;&#8197;
									<select id="City" name="City" class=" chzn-select" data-placeholder="请选择所在城市">
										<option value=""></option>
									</select> 
								</td>
								<td class="form-inline">
									<button type="button" onclick="search();" style="margin-left: 30px;" class="btn btn-small btn-success btn-lg" title="检索" >查询<i class="icon-search icon-on-right"></i></button>
								</td>
							</tr>
						</table>
						<hr/>
					<!-- 检索  -->
					<table id="table_report"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class="center" style="width:3%;">序号</th>
								<th class="center" style="width:10%;">企业名称</th>
								<th class="center" style="width:6%;">用户名</th>
								<th class="center" style="width:10%;">
                                    <select class="inputtxt2" id="usertype" name="usertype" data-placeholder="会员类型" style="width:100%;color: #707070;font-size: 13px;font-weight: bold;" onchange="search();">
                                        <option value="">会员类型</option>
                                        <option value="1" <c:if test="${pd.usertype == '1'}">selected</c:if>>企业会员</option>
                                        <option value="2" <c:if test="${pd.usertype == '2'}">selected</c:if>>培训机构</option>
                                        <option value="3" <c:if test="${pd.usertype == '3'}">selected</c:if>>院校会员</option>
                                        <option value="4" <c:if test="${pd.usertype == '4'}">selected</c:if>>其他</option>
                                    </select>
                                </th>
								<th class="center" style="width:8%;">申请时间</th>
								<th class="center" style="width:10%;">
                                    <select class="inputtxt2" name="user_status" data-placeholder="会员状态" style="width:100%;color: #707070;font-size: 13px;font-weight: bold;" onchange="search();">
                                        <option value="">会员状态</option>
                                        <option value="1" <c:if test="${pd.user_status == '1'}">selected</c:if>>审核中</option>
                                        <option value="2" <c:if test="${pd.user_status == '2'}">selected</c:if>>审核通过</option>
                                        <option value="3" <c:if test="${pd.user_status == '3'}">selected</c:if>>未通过</option>
                                        <option value="4" <c:if test="${pd.user_status == '4'}">selected</c:if>>锁定</option>
                                    </select>
								</th>
								<th class="center" style="width:7%;">审核人</th>
								<th class="center" style="width:10%;">审核日期</th>
								<th class="center" style="width:10%;">地址</th>
								<th class="center" style="width:10%;">最后活跃</th>
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
												<td class="tds"><a href="javascript:void(0);" title="${var.company_name }" onclick="info('${var.userId}','${var.types_val}');">${var.company_name }</a></td>
												<td class="center tds"  title="${var.user_name }">${var.user_name}</td>
												<td class="center">${var.types}</td>
												<td class="center">${var.registration_time}</td>
												<td class="center">${var.status}</td>
												<td class="center">${var.reviewer}</td>
												<td class="center">${var.review_time}</td>
												<td class="tds" title="${var.address_detail}">${var.address_detail}</td>
												<td class="center">${var.login_time}</td>
												<td style="width:150px;" class="center">
														<c:if test="${var.user_status == 1 }">
															<a class='btn btn-small btn-purple' title="通过" onclick="reviewSuccess('${var.userId }','${var.types_val}');"><i class="icon-check"></i></a>
															<a class='btn btn-small btn-purple' title="驳回" onclick="reviewFail('${var.userId }','${var.types_val}');"><i class="icon-reply"></i></a>
														</c:if>
														<c:if test="${var.user_status == 2 }">
														<a class='btn btn-small btn-info'  title="锁定"  onclick="locked('${var.userId }','${var.types_val}');"><i class="icon-lock"></i></a>
														<a class="btn btn-small btn-danger" onclick="cancle('${var.userId }','${var.types_val}');" title="删除"><i class="icon-trash"></i></a>
														</c:if>
														<c:if test="${var.user_status == 3 }">
														<a class='btn btn-small btn-purple' title="通过" onclick="reviewSuccess('${var.userId }','${var.types_val}');"><i class="icon-check"></i></a>
														<a class="btn btn-small btn-danger" onclick="cancle('${var.userId }','${var.types_val}');" title="删除"><i class="icon-trash"></i></a>
														</c:if>
														<c:if test="${var.user_status == 4 }">
															<a class='btn btn-small btn-purple' title="解锁" onclick="unlock('${var.userId }','${var.types_val}');"><i class="icon-unlock"></i></a>
															<a class="btn btn-small btn-danger" onclick="cancle('${var.userId }','${var.types_val}');" title="删除"><i class="icon-trash"></i></a>
														</c:if>
														<a class='btn btn-small btn-important' title="重置密码" onclick="reset('${var.userId }');"><i class="icon-cog"></i></a>
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
			
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});

			//复选框
			$('table th input:checkbox').on('click' , function(){
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function(){
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});
			});
		});
		
		function BindCId(cid) {
			var PID = $("#Province").val();
			$("#City").empty();
			$("<option value=''></option>").appendTo("#City");
			$.ajax({
				type:"POST",
				url:"<%=basePath%>operateCompany/getCities.do",
				data:{'PID' : PID},
				dataType:"json",
				cache:false,
				success:function(data){
					var html='<option value=""></option>';
					var s = '';
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
			$("#forms").submit();
		}
		
		//审核通过
		function reviewSuccess(userId,types){
			bootbox.confirm("确定要通过审核吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>operateCompany/reviewSuccess.do?userId="+userId+"&institutions_id="+userId+"&types="+types+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage("${page.currentPage}");
					});
				}
			});
		}
		
		//审核未通过
		function reviewFail(userId,types){
			bootbox.confirm("确定驳回该公司信息吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>operateCompany/reviewFail.do?userId="+userId+"&institutions_id="+userId+"&types="+types+"&tm="+new Date().getTime();
					$.get(url,function(data){
							nextPage("${page.currentPage}");
					});
				}
			});
		}
		
		//锁定
		function locked(userId,type){
			bootbox.confirm("确定要锁定该公司信息吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>operateCompany/locked.do?userId="+userId+"&types="+type+"&tm="+new Date().getTime();
					$.get(url,function(data){
							nextPage("${page.currentPage}");
					});
				}
			});
		}
		
		//解锁
		function unlock(userId,type){
			bootbox.confirm("确定要解锁该公司信息吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>operateCompany/reviewSuccess.do?userId="+userId+"&institutions_id="+userId+"&types="+type+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage("${page.currentPage}");
					});
				}
			});
		}
		
		//注销
		function cancle(userId,types){
			bootbox.confirm("确定要注销该公司信息吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>operateCompany/cancle.do?userId="+userId+"&institutions_id="+userId+"&types="+types+"&tm="+new Date().getTime();
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
		function info(userId,type){
			var typea="1",typeb="2",typec="3",typed="4";
			if(typea==type||typed==type){
				window.location="<%=basePath%>operateCompany/goDetails.do?userId="+userId;	
			}else if(typeb==type){
				window.location="<%=basePath%>manages/goInfoN.do?institutions_id="+userId;
			}else if(typec==type){
				window.location="<%=basePath%>colleges/goDetails.do?userId="+ userId;
			}
		}
		
	</script>
</body>
</html>

