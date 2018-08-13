<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<meta charset="utf-8" />
<title>电影详情</title>
<meta name="description" content="overview & stats" />
<%@ include file="../../../system/admin/top.jsp"%>

<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>

<!-- 添加按钮 -->
<link rel="stylesheet" href="static/assets/css/font-awesome.css" />

<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>


<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/ace-elements.min.js"></script>
<script src="static/js/ace.min.js"></script>


<style type="text/css">

</style>
</head>
<body>
	<br>
	<form action="<%=basePath%>voteConfig/saveVoteConfig.do" name="Form" id="Form" method="post">
		<div id="zhongxin">
			<table class="table">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>投票类型</B>
					</td>
					<td>
						<select class="chzn-select" name="vote_type" id="vote_type" data-placeholder="请选择投票类型"  style="height: 20px; width: 215px;">
							<option value="1">文体团队</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>规则</B>
					</td>
					<td>
						每人<input type="number" name="vote_day" id="vote_day" value="1" maxlength="3" min="0" style="height: 20px; width: 90px;" placeholder="请输入天数" title="天数" onblur="trim(this);"/>天&nbsp;&nbsp;&nbsp;&nbsp;   
						<input type="number" name="vote_ticket" id="vote_ticket" value="1" maxlength="3" min="1" style="height: 20px; width: 90px;" placeholder="请输入票数" title="票数" onblur="trim(this);"/>票
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>人员比例</B>
					</td>
					<td>
						离退<input type="number" name="vote_on_job" id="vote_on_job" value="1" maxlength="3" min="1" style="height: 20px; width: 90px;" placeholder="请输入离职人数比例" title="离职" onblur="trim(this);"/>
						在职<input type="number" name="vote_out_job" id="vote_out_job" value="2" maxlength="3" min="1" style="height: 20px; width: 90px;" placeholder="请输入在职人数比例" title="在职" onblur="trim(this);"/>
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		<div align="center" style="margin-top: 10px;">
			<a class="btn  btn-success" onclick="update();"><i class="icon-save"></i>添加</a> 
		</div>
		<div id="zhongxin2" class="center" style="display: none">
			<br /> <br /> <br /> <br /> <img src="<%=basePath%>static/images/jiazai.gif" /><br />
			<h4 class="lighter block green"></h4>
		</div>
	</form>
	
	<script type="text/javascript">
		$(top.hangge());
		
		$(document).ready(function(){
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			
			
	   
		});
		
		var tips=function(id,msg){
			$("#"+id).tips({
				side : 2,
				msg : msg,
				bg : '#FF5080',
				time : 2
			});
		}
		
		function update(){
			if($("#vote_type").val()==null || $("#vote_type").val()==""){
				tips("vote_type","请选择投票类型")
				return false;
			}
			
			var flag = false;
			
			$.ajax({
				type : "POST",
				url : "<%=basePath%>voteConfig/exitType.do?tm=" + new Date().getTime(),
				dataType : "text",
				cache : false,
				async:false, 
				data :{vote_type:$("#vote_type").val()},
				success:function(data){
					if(data == "fail"){
						flag = true;
					}
				}
			});
			
			if(flag){
				tips("vote_type","存在此类型投票")
				return false;
			}
			
			if($("#vote_day").val()==null || $("#vote_day").val()==""){
				tips("vote_day","请输入天数")
				return false;
			}
			
			var voteDay = $("#vote_day").val();
			if(parseInt(voteDay)!=0 && parseInt(voteDay)!=1){
				tips("vote_day","只能填0或者1")
				return false;
			}
			
			if($("#vote_ticket").val()==null || $("#vote_ticket").val()==""){
				tips("vote_ticket","请输入票数")
				return false;
			}
			
			if($("#vote_on_job").val()==null || $("#vote_on_job").val()==""){
				tips("vote_on_job","请输入在职人员比例")
				return false;
			}
			
			if($("#vote_out_job").val()==null || $("#vote_out_job").val()==""){
				tips("vote_out_job","请输入离退休人员比例")
				return false;
			}
			
			$("#Form").submit();
			
		}
		
	</script>
</body>
</html>