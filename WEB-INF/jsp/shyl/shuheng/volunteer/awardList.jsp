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
						<input name="award_id" id="award_id" type="hidden"/>
<!-- 							<tr> -->
<!-- 								<td class="form-inline"> -->
<!-- 									<label class="lbl" for="vote_name" >获奖时间：</label> -->
<!-- 									<span class="input-icon">  -->
<!-- 										<input name="award_time" id="award_time" class="Wdate" type="text" readonly="readonly" placeholder="请选择时间" onclick="WdatePicker({dateFmt:'yyyy',isShowClear:true});"/> -->
<!-- 									</span> -->
<!-- 								</td> -->
<!-- 								<td style="width: 20px"></td> -->
<!-- 								<td style="vertical-align: top;"> -->
<!-- 									<button type="button" class="btn btn-small btn-success btn-lg"  onclick="save()" title="更新"> -->
<!-- 										更新 <i class="icon-plus-sign icon-on-right"></i> -->
<!-- 									</button> -->
<!-- 								</td> -->
<!-- 							</tr> -->
						</table>
						<hr/>
						<form action="<%=basePath%>volunteer/awardList.do?volunteer_id=${pd.volunteer_id}" method="post" name="Form" id="Form">
						<input type="hidden" id="volunteer_id" name="volunteer_id" value="${pd.volunteer_id}"/>
						<table id="table_report"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
<!-- 									<th class="center" style="width:3%;"> -->
<!-- 									</th>  -->
									<th class="center" style="width:10%;">序号</th>
									<th class="center" style="width:40%;">获奖时间(年)</th>
									<th class="center" style="width:50%;">评奖协会</th>
<!-- 									<th class="center" style="width:30%;">操作</th> -->
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty selectAwardList}">
											<c:forEach items="${selectAwardList}" var="list" varStatus="vs">
												<tr>
<!-- 													<td class='center' > -->
<!-- 													<label> -->
<%-- 														<input type='checkbox' name='ids' value="${list.award_id}"/> --%>
<!-- 														<span class="lbl"></span> -->
<!-- 													</label> -->
<!-- 													</td> -->
													<td class='center' >${vs.index+1}</td>
													<td class="center tds" title="${list.award_time}">${list.award_time}</td>
													<td class="center tds" title="${list.association_name}">${list.association_name}</td>
<!-- 													<td class="center"> -->
<%-- 														<a class="btn btn-mini btn-danger" onclick="deleteAward('${list.award_id}');" title="删除"><i class="icon-trash"></i></a> --%>
<!-- 													</td> -->
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
						url: "<%=basePath%>volunteer/awardInfo.do",
						data:
							{
							award_id:this.value
							},
						dataType:"json",
						cache : false,
						success:function(data){
							$("#award_id").val(data.award_id);
							$("#award_time").val(data.award_time);
						}
					});
				}else{
					$("#award_id").val("");
					$("#award_time").val("");
				}
				$('[name=ids]').not(this).attr("checked", false);
				
			});
			
		});
		
		
		/**
		    *保存
		    */
		    function save(){
		    	if ($("#award_time").val() == "") {
		    		$("#award_time").tips({
		    			side : 3,
		    			msg : '请选择时间',
		    			bg : '#FF5080',
		    			time : 2
		    		});
		    		return false;
		    	}
				var award_id = $("#award_id").val();
		    	var volunteer_id = $("#volunteer_id").val();
		    	var award_time = $("#award_time").val();
		    	$.ajax({
					type: "POST",
					url: "<%=basePath%>volunteer/award.do",
					data:
						{
							award_id:award_id,
							volunteer_id:volunteer_id,
							award_time:award_time
						},
					dataType:"json",
					cache : false,
					success:function(data){
						setTimeout("self.location=self.location",100);
					}
				});
		    }
		
		
		//删除
		function deleteAward(award_id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					$.ajax({
						type: "POST",
						url: "<%=basePath%>volunteer/deleteAward.do",
						data:
							{
							award_id:award_id
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

