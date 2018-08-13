<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<meta charset="utf-8" />
<title></title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link href="static/css/bootstrap.min.css" rel="stylesheet" />
<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link rel="stylesheet" href="static/css/font-awesome.min.css" />
<!-- 下拉框 -->
<link rel="stylesheet" href="static/css/chosen.css" />
<link rel="stylesheet" href="static/css/ace.min.css" />
<link rel="stylesheet" href="static/css/thing.css" />
<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
<link rel="stylesheet" href="static/css/ace-skins.min.css" />
<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>

</head>
<body>
	<form action="testquestion/save.do" name="userForm" id="userForm"
		method="post">
		
		<div id="zhongxin">
			<table class="table ">
				<tr>
					<td><label class="control-label"
						style="padding-top: 8px; width: 100px; float: right;"
						for=""> 专业：</label></td>
					<td><select id="Major" name="Major"  data-placeholder="请选择专业" class="chzn-select"
						style="vertical-align: top;">
							<option value=""></option>
							<c:forEach items="${questionslist}" var="question">
							<c:if test="${question.id==8}">
								<option value="${question.id}"
									<c:if test="${question.id == pd.Major}">selected</c:if>>${question.name}</option>
									</c:if>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td>
					<input type="hidden" id="Knowledges"  name="Knowledges" value="${pd.pointId}"/>
					<input type="hidden" id="questionId"  name="questionId" value="${pd.Id}"/>
					<label class="control-label"
						style="padding-top: 8px; width: 100px; float: right;"
						for=""> 知识类：</label></td>
					<td><select id="Knowledge" name="Knowledge" class="chzn-select"
						data-placeholder="请选择知识类">
							<option value=""></option>
					</select></td>
				</tr>
				<tr>
					<td style="text-align: center;" colspan="10"><a
						class="btn btn-mini btn-primary" onclick="save();">保存</a> <a
						class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
					</td>
				</tr>
			</table>
		</div>

		<div id="zhongxin2" class="center" style="display: none">
			<br /> <br /> <br /> <br /> <img src="static/images/jiazai.gif" /><br />
			<h4 class="lighter block green"></h4>
		</div>

	</form>

	<!-- 引入 -->
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript" src="static/js/bootbox.min.js"></script>
	<script type="text/javascript">
		$(top.hangge());
		$(function(){
			var Knowledges = $("#Knowledges").val();
			if(""!=Knowledges){
				BindCId(Knowledges);
			}
		    $("#Major").change(function() {
			    BindCId(0);
			}); 
		    
		    // 合并的$(function(){});
			//单选框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
		    
		});
		
		//检索
		function save(){
			if($("#Major").val()==""){
				
				$("#Major").tips({
					side:3,
		            msg:'请选择专业',
		            bg:'#AE81FF',
		            time:2
		        });
				
				$("#Major").focus();
				return false;
			}
            if($("#Knowledge").val()==""){
				
				$("#Knowledge").tips({
					side:3,
		            msg:'请选择知识类',
		            bg:'#AE81FF',
		            time:2
		        });
				
				$("#Knowledge").focus();
				return false;
			}
			
			top.jzts();
			$("#userForm").submit();
		}
		
		function BindCId(Knowledge) {
			var major = $("#Major").val();
			$("#Knowledge").empty();
			$("<option value=''></option>").appendTo("#Knowledge");
			$.ajax({
				type:"POST",
				url:"<%=basePath%>testquestion/getKnowledges.do",
				data:{'Major' : major},
				dataType:"json",
				cache:false,
				success:function(data){
					var html='<option value=""></option>';
					var s = '';
					$.each(data.KnowledgeList,function(i,list){
						if(list.id==Knowledge){
							if(Knowledge!=0){
								html+="<option value="+list.id+" selected='selected' >"+list.name+"</option>";
							}
						}else{
							html+="<option value="+list.id+">"+list.name+"</option>";
						}
					});
					$("#Knowledge").append(html);
					$("#Knowledge").trigger("liszt:updated");
				}
			});
		}
		
	</script>
</body>
</html>