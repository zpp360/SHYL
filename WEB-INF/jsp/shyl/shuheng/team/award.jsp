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
<title>获奖页面</title>
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
						<table style="margin-bottom: 20px;">
						<input type="hidden" id="team_award_id" name="team_award_id"/>
							<tr>
								<td class="form-inline">
									<label class="lbl" for="vote_name" >获奖名称：</label>
									<span class="input-icon"> 
										<input name="award_name" id="award_name" type="text" maxlength="50"/>
									</span>
								</td>
							</tr>
							<tr>
								<td class="form-inline">
									<label class="lbl" for="vote_name" >获奖时间：</label>
									<span class="input-icon"> 
										<input name="award_year" id="award_year" class="Wdate" type="text" readonly="readonly" placeholder="请选择时间" onclick="WdatePicker({dateFmt:'yyyy',isShowClear:true});"/>
									</span>
								</td>
								<td class="form-inline">
									<label class="lbl" for="">获奖级别：</label> 
									<select name="award_level" id="award_level" data-placeholder="请选择级别">
										<option value="">全部</option>
										<c:forEach items="${typeList}" var="list">
											<option text="${list.distinguish_id}" value="${list.distinguish_id}">${list.value}</option>
										</c:forEach>
									</select>
								</td>
								<td style="width: 20px"></td>
								<td style="vertical-align: top;">
									<button type="button" class="btn btn-small btn-success btn-lg"  onclick="save()" title="更新">
										更新 <i class="icon-plus-sign icon-on-right"></i>
									</button>
								</td>
							</tr>
						</table>
						<hr/>
						<form action="<%=basePath%>team/awardList.do?team_id=${pd.team_id}" method="post" name="Form" id="Form">
						<input type="hidden" id="team_id" name="team_id" value="${pd.team_id}"/>
						<table id="table_report"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center" style="width:3%;">
<!-- 										<label> -->
<!-- 										<input type="checkbox" id="zcheckbox" /><span class="lbl"></span> -->
<!-- 										</label> -->
									</th> 
									<th class="center" style="width:7%;">序号</th>
									<th class="center" style="width:20%;">获奖时间(年)</th>
									<th class="center" style="width:20%;">级别</th>
									<th class="center" style="width:20%;">获奖名称</th>
									<th class="center" style="width:30%;">操作</th>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty selectAwardlistPage}">
											<c:forEach items="${selectAwardlistPage}" var="list" varStatus="vs">
												<tr>
													<td class='center' >
													<label>
														<input type='checkbox' name='ids' value="${list.team_award_id}"/>
														<span class="lbl"></span>
													</label>
													</td>
													<td class='center' >${vs.index+1}</td>
													<td class="center tds" title="${list.award_year}">${list.award_year}</td>
													<td class="center tds">
														<c:if test="${list.award_level=='1'}">
															国家级
														</c:if>
														<c:if test="${list.award_level=='2'}">
															省级
														</c:if>
														<c:if test="${list.award_level=='3'}">
															市级
														</c:if>
														<c:if test="${list.award_level=='4'}">
															区县级
														</c:if>
													</td>
													<td class="center tds" title="${list.award_name}">${list.award_name}</td>
													<td class="center">
														<a class="btn btn-mini btn-danger" onclick="deleteAward('${list.team_award_id}');" title="删除"><i class="icon-trash"></i></a>
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

			//复选框单选
			$('[name=ids]').click(function() {
				if(this.checked){
					$.ajax({
						type: "POST",
						url: "<%=basePath%>team/updateAward.do",
						data:
							{
							team_award_id:this.value
							},
						dataType:"json",
						cache : false,
						success:function(data){
							$("#team_award_id").val(data.team_award_id);
							$("#award_name").val(data.award_name);
							$("#award_year").val(data.award_year);
							$("#award_level").val(data.award_level);
							$.each(data.list,function(index,val){
								if(data.award_level==val.distinguish_id){
									$("#award_level").find("option[value='"+data.award_level+"']").attr("selected",true);
								}
							});
						}
					});
				}else{
					$("#team_award_id").val("");
					$("#award_name").val("");
					$("#award_year").val("");
					$("#award_level").val("");
				}
				$('[name=ids]').not(this).attr("checked", false);
				
			});
			
		});
		
		
		/**
		    *保存
		    */
		    function save(){
		    	if ($("#award_name").val() == "") {
		    		$("#award_name").tips({
		    			side : 3,
		    			msg : '请输入获奖名称',
		    			bg : '#FF5080',
		    			time : 2
		    		});
		    		return false;
		    	}
		    	if ($("#award_year").val() == "") {
		    		$("#award_year").tips({
		    			side : 3,
		    			msg : '请选择时间',
		    			bg : '#FF5080',
		    			time : 2
		    		});
		    		return false;
		    	}
		    	if ($("#award_level").val() == "") {
		    		$("#award_level").tips({
		    			side : 3,
		    			msg : '请选择获奖级别',
		    			bg : '#FF5080',
		    			time : 2
		    		});
		    		return false;
		    	}
		    	var team_award_id = $("#team_award_id").val();
		    	var team_id = $("#team_id").val();
		    	var award_name = $("#award_name").val();
		    	var award_year = $("#award_year").val();
		    	var award_level = $("#award_level").val();
		    	$.ajax({
					type: "POST",
					url: "<%=basePath%>team/saveAward.do",
					data:
						{
							team_award_id:team_award_id,
							team_id:team_id,
							award_name:award_name,
							award_year:award_year,
							award_level:award_level
						},
					dataType:"json",
					cache : false,
					success:function(data){
						setTimeout("self.location=self.location",100);
					}
				});
		    }
		
		
		//删除
		function deleteAward(team_award_id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					$.ajax({
						type: "POST",
						url: "<%=basePath%>team/deleteAward.do",
						data:
							{
							team_award_id:team_award_id
							},
						dataType:"json",
						cache : false,
						success:function(data){
							setTimeout("self.location=self.location",100);
						}
					});
				}
			});
		}
		
		
	</script>
</body>
</html>

