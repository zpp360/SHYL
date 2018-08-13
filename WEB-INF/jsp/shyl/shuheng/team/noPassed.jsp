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
<title>审核未通过原因页面</title>
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
					原因：<textarea rows="10" cols="" style="width: 280px;" disabled="disabled">${pd.reason}</textarea>
				</div>
			</div>
			<!--/row-->

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

