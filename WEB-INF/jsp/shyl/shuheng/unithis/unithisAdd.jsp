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
	<form action="<%=basePath%>unithis/${msg}.do" name="Form" id="Form"
		method="post">
		
		<div id="zhongxin">
			<table class="table ">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>姓名</B></td>
					<td><select class="chzn-select" name="name_id" id="name_id"
						data-placeholder="请选择姓名"  style="height: 20px; width: 315px;">
							<option value=""></option>
							<c:forEach items="${userlist}" var="name">
								<option value="${name.user_id }" <c:if test="${name.user_id == pd.name_id}">selected</c:if>>${name.name }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>单位</B>
					<input type="hidden" id="unit_ids" value="${pd.unit_id}"/>
					</td>
					<td><select class="chzn-select" name="unit_id" id="unit_id"
						data-placeholder="请选择单位"  style="height: 20px; width: 315px;">
							<option value=""></option>
							<c:forEach items="${unitlist}" var="unit">
								<option value="${unit.unit_id }" <c:if test="${unit.id == pd.unit_id}">selected</c:if>>${unit.unit_name }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>部门</B>
					</td>
					<td><select class="chzn-select" name="depart_id" id="depart_id"
						data-placeholder="请选择部门"  style="height: 20px; width: 315px;">
								<option value=""></option>
								  <c:forEach items="${departlist}" var="unit">
								<option value="${unit.id }" <c:if test="${unit.id == pd.depart_id}">selected</c:if>>${unit.name }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><B>职位</B></td>
					<td><select class="chzn-select" name="pos_id" id="pos_id"
						data-placeholder="请选择职位"  style="height: 20px; width: 315px;">
										 <option value=""></option>
					</select></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>开始时间</B></td>
					<td><input
						class="span10 date-picker" name="start_time"
						id="start_time" value="${pd.start_time}" type="text"
						data-date-format="yyyy-mm-dd" readonly="readonly"
						style="width: 250px;" placeholder="请选择开始日期" onblur="trim(this);" /></td>
					<td style="width: 20px"></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>结束时间</B></td>
					<td><input
						class="span10 date-picker" name="end_time"
						id="end_time" value="${pd.end_time}" type="text"
						data-date-format="yyyy-mm-dd" readonly="readonly"
						style="width: 250px;" placeholder="请选择结束日期" onblur="trim(this);" /></td>
					<td style="width: 20px"></td>
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
	<!-- 日期框 -->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript" src="static/js/bootbox.min.js"></script>
	<script type="text/javascript">
		$(top.hangge());
		$(function(){
			//部门
			var knowledges = $("#unit_ids").val();
			if(""!=knowledges){
				BindCId(knowledges);
			}else{
				BindCId(0);
			}
			$("#unit_id").change(function() {
			    BindCId(0);
			});
			
			//职位
			$("#depart_id").change(function() {
			    BindCId1(0);
			});
		    
		  	//日期框
			$('.date-picker').datepicker({
				language : 'zh-CN',
				format : 'yyyy-mm-dd',
				weekStart : 1,
				todayBtn : 'linked',
				autoclose : 1,
				todayHighlight : 1,
				minViewMode : 'dd', //这里就设置了默认视图为年视图
				minView : 2, //设置最小视图为年视图
				forceParse : 0
			});
		    
		    // 合并的$(function(){});
			//单选框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
		    
		});
		
		
		function BindCId(cid) {
			var PID = $("#unit_id").val();
			$("#depart_id").empty();
			$("#pos_id").empty();
			if (PID == "") {
		        $("<option value=''></option>").appendTo("#depart_id");
		    }else{
		    	$.ajax({
					type:"POST",
					url:"<%=basePath%>unithis/getdepartList.do",
					data:{'PID' : PID},
					dataType:"json",
					cache:false,
					success:function(data){
						var html='<option value=""></option>';
						var html1='<option value=""></option>';
						$.each(data.departlist,function(i,list){
							if(list.id==cid){
								if(cid!=0){
									html+="<option value="+list.id+" selected='selected' >"+list.name+"</option>";
								}
							}else{
								html+="<option value="+list.id+">"+list.name+"</option>";
							}
						});
						$("#depart_id").append(html);
						$("#depart_id").trigger("liszt:updated");
						$("#pos_id").append(html1);
						$("#pos_id").trigger("liszt:updated");
					}
				});
		    }
		}
		
		function BindCId1(cid) {
			var UNIT_ID = $("#unit_id").val();
			var DEPART_ID = $("#depart_id").val();
			$("#pos_id").empty();
			if (DEPART_ID == "") {
		        $("<option value=''></option>").appendTo("#pos_id");
		    }else{
		    	$.ajax({
					type:"POST",
					url:"<%=basePath%>unithis/getposList.do",
					data:{'unit_id' : UNIT_ID,'depart_id': DEPART_ID},
					dataType:"json",
					cache:false,
					success:function(data){
						var html='<option value=""></option>';
						$.each(data.poslist,function(i,list){
							if(list.id==cid){
								if(cid!=0){
									html+="<option value="+list.id+" selected='selected' >"+list.name+"</option>";
								}
							}else{
								html+="<option value="+list.id+">"+list.name+"</option>";
							}
						});
						$("#pos_id").append(html);
						$("#pos_id").trigger("liszt:updated");
					}
				});
		    }
		}
		
		//保存
		function save() {
			if ($("#name_id").val() == "") {
				$("#name_id").tips({
					side : 3,
					msg : '请选择姓名',
					bg : '#FF5080',
					time : 2
				});
				$("#name_id").focus();
				return false;
			}
			if ($("#unit_id").val() == "") {
				$("#unit_id").tips({
					side : 3,
					msg : '请选择单位',
					bg : '#FF5080',
					time : 2
				});
				$("#unit_id").focus();
				return false;
			}
			if ($("#depart_id").val() == "") {
				$("#depart_id").tips({
					side : 3,
					msg : '请选择部门',
					bg : '#FF5080',
					time : 2
				});
				$("#depart_id").focus();
				return false;
			}
			if ($("#pos_id").val() == "") {
				$("#pos_id").tips({
					side : 3,
					msg : '请选择职位',
					bg : '#FF5080',
					time : 2
				});
				$("#pos_id").focus();
				return false;
			}
			var start_time=$("#start_time").val();
	    	var end_time=$("#end_time").val();
	    	if(start_time.length>0&&end_time.length>0){
	    		if(start_time>end_time)
	    		{
	    		$("#start_time").tips({
	    			side : 3,
	    			msg : '开始时间不能大于结束时间！',
	    			bg : '#FF5080',
	    			time : 2
	    		});
	    		$("#start_time").focus();
	    		return false;		
	    		}
	    	}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
	</script>
</body>
</html>