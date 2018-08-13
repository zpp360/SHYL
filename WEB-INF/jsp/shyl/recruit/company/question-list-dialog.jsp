<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>试题管理_济南市服务外包公共服务平台</title>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link href="/SHYL/shyl/css/maincss/css.css" rel="stylesheet" type="text/css">
<link href="/SHYL/shyl/css/maincss/mypage.css" rel="stylesheet" type="text/css">
<link href="/SHYL/shyl/css/maincss/banner.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/SHYL/shyl/css/maincss/pager.css" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<script src="<%=basePath%>shyl/js/jquery.min.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.js"></script>
<style type="text/css">
.inputtxt2NNew {
	padding-left: 5px;
	background-color: #ecf0f9;
	line-height: 42px;
	height: 42px;
	border: 0;
	border-radius: 5px;
	font-size: 0.85em;
}
</style>
</head>
<body id="top" style="background-color: #f7f7f7;">
<div class="modal_h20 modal fade bs-example-modal-sm in" id="delquestion" data-toggle="modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="false" data-target="">
	<div class="modal-dialog modal-sm">
	   <div class="modal-content">
	       <div class="modal-header">
	           <button type="button" class="close" data-dismiss="modal" onclick="Clear()"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
	           <h4 class="modal-title" id="myModalLabel">提示</h4>
	       </div>
	       <div class="modal-body">
	           <p id="warntext">试题删除后不可恢复，确定删除吗？</p>
	       </div>
	       <div class="modal-footer">
	           <input type="hidden" id="questionID" value="">
	           <button type="button" class="btn btn-success" onclick="Delete()" data-dismiss="modal">确认</button>
	           <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	       </div>
	   </div>
	</div>
	<script type="text/javascript">
	    function Delete() {
	            location.href = "<%=basePath%>company/deleteQuestion.act?id="+$("#questionID").val()+"&field_id="+$("#field_id").val()+"&point_id="+$("#point_id").val()+"&question_type_id="+$("#question_type_id").val();
	    }
	    // 删除试题
	    function dels(id,divid) {
	            $("#" + divid).attr("data-target", "#delquestion");
	            $("#delquestion").attr("data-target", "");
	            $("#questionID").val(id);
	    }
	    // 题库和知识点联动
	    $(function () {
	        $("#field_id").change(function () { BindPId(); });
	    })
	    
	    function BindPId() {
	        var FID = $("#field_id").val();
	        var point = $("#point").val();
	        $("#point_id").find('option').remove();
	        if (FID == "") {
	            $("<option value=''>全部</option>").appendTo("#point_id");
	        }
	        $.post('<%=basePath%>company/pointList.act', { 'FID': FID }, function (data) {
	        	if (data.result == 'success') {
		            $.each(data.pointList, function (i, list) {
		            	if (point == list.pointId) {
		            		$("<option value='" + list.pointId + "' selected>" + list.pointName + "</option>").appendTo("#point_id");
		            	} else {
		            		$("<option value='" + list.pointId + "'>" + list.pointName + "</option>").appendTo("#point_id");
		            	}
		            });
	        	} else {
	        		$("<option value=''>全部</option>").appendTo("#point_id");
	        	}

	        });
	    }
	    
	    function showUpdateQuestionTp(field_id, point_id,question_id){
	    	$("#question_id").val(question_id);
	    	for(var i=0;i<document.getElementById("field_id_a").options.length;i++)
	        {
	            if(document.getElementById("field_id_a").options[i].value == field_id)
	            {
	                document.getElementById("field_id_a").options[i].selected=true;
	                break;
	            }
	        }
	    	$("#point_id_a").find('option').remove();
	    	if (field_id == "") {
	            $("<option value=''>全部</option>").appendTo("#point_id_a");
	        }
	    	$.post('<%=basePath%>company/pointList.act', { 'FID': field_id }, function (data) {
	        	if (data.result == 'success') {
		            $.each(data.pointList, function (i, list) {
		            	if (point_id == list.pointId) {
		            		$("<option value='" + list.pointId + "' selected>" + list.pointName + "</option>").appendTo("#point_id_a");
		            	} else {
		            		$("<option value='" + list.pointId + "'>" + list.pointName + "</option>").appendTo("#point_id_a");
		            	}
		            });
	        	} else {
	        		$("<option value=''>全部</option>").appendTo("#point_id");
	        	}

	        });
	    }
	    
	    
	    // 修改分类：题库和知识点联动
	    $(function () {
	        $("#field_id_a").change(function () { BindPIdA(); });
	    })
	    
	    function BindPIdA() {
	        var FID = $("#field_id_a").val();
	        $("#point_id_a").find('option').remove();
	        if (FID == "") {
	            $("<option value=''>全部</option>").appendTo("#point_id_a");
	        }
	        $.post('<%=basePath%>company/pointList.act', { 'FID': FID }, function (data) {
	        	if (data.result == 'success') {
		            $.each(data.pointList, function (i, list) {
		            		$("<option value='" + list.pointId + "'>" + list.pointName + "</option>").appendTo("#point_id_a");
		            });
	        	} else {
	        		$("<option value=''>全部</option>").appendTo("#point_id_a");
	        	}

	        });
	    }
	    
	    function updateQuestionPoint() {
	    	location.href = "<%=basePath%>company/updateQuestionPoint.act?question_id="+$("#question_id").val()+"&point_id_a="+$("#point_id_a").val()+"&field_id="+$("#field_id").val()+"&point_id="+$("#point_id").val()+"&question_type_id="+$("#question_type_id").val();
	    }
	</script>
</div>
<!-- /.modal -->
<div class="register-box" style="width: 789px;margin-top: 0px;">
<input type="hidden" value="<%=session.getAttribute("pointid")%>" id="pointids">
<input type="hidden" value="<%=session.getAttribute("fieldid")%>" id="fieldids">
<input type="hidden" value="<%=session.getAttribute("USERID")%>" id="userid">
		<form action="<%=basePath%>papermain/questionlist.act?point_id=<%=session.getAttribute("pointid")%>&field_id=<%=session.getAttribute("fieldid")%>&USERID=<%=session.getAttribute("USERID") %>" method="post" name="Form" id="Form">
		<div class="tab" style="margin-bottom:0;">
		<input type="text" value="${pd.checkedIds}" id="checkedIds" name="checkedIds" style="display:none">
		<table style="width:113%;">
		   <tr>
		       <td><span>题库：</span><select style="width: 120px;"class="inputtxt2NNew" name="field_id"
							id="field_id">
							<option value="">全部</option>
							<c:forEach items="${fieldList}" var="field">
								<option value="${field.fieldId}"
									<c:if test="${field.fieldId == pd.field_id }">selected</c:if>>${field.fieldName}</option>
							</c:forEach>
				</select>
				</td>
		       <td><span>知识分类：</span><select style="width: 220px;" class="inputtxt2NNew" name="point_id"
							id="point_id">
							<option value="">全部</option>
							<c:forEach items="${knowledgeList}" var="knowledge">
								<option value="${knowledge.pointId}"
									<c:if test="${knowledge.pointId == pd.point_id }">selected</c:if>>${knowledge.pointName}</option>
							</c:forEach>
				</select>
				<input type="hidden" id="knowledgeList" name="knowledgeList" value="${knowledgeList}" />
				<input type="hidden" id="point" name="point" value="${pd.point_id}" />
				</td>
		       <td><span>试题分类：</span><select style="width: 80px;" class="inputtxt2NNew" name="question_type_id"
							id="question_type_id">
							<option value="">全部</option>
							<c:forEach items="${questionTypeList}" var="questionType">
								<option value="${questionType.id}"
									<c:if test="${questionType.id == pd.question_type_id}">selected</c:if>>${questionType.name}</option>
							</c:forEach>
				</select></td>
		       <td><input type="submit" class="sbtnNew" value="搜索"  style="margin-top:0px;line-height: 46px;height: 46px;color: #ffffff;margin-right: 62px;"></td>
		   </tr>
		</table>
			</div>
		<div class="jianli">
			<table class="tableclass">
				<thead>
					<tr>
						<th style="width:3%;text-align: center;"></th> 
						<th style="width:5%;text-align: center;">序号</th>
						<th style="width:25%;text-align: left;">试题名称</th>
						<th style="width:10%;text-align: left;">试题类型</th>
						<th style="width:15%;text-align: left;">专业</th>
						<th style="width:20%;text-align: left;">知识类</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
				<c:when test="${not empty questionList}">
					<c:forEach items="${questionList}" var="items" varStatus="vs">
						<tr>
							<td style="text-align: center;"><input type='checkbox' name='ids' id='ids' value="${items.ids}" /></td>
										<td style="text-align: center;">${vs.index+1}</td>
							<td style="width:25%;text-align: left;">
							<a href="<%=basePath%>company/previewQuestion.act?question_id=${items.id}" title='<c:out value="${items.name}"></c:out>' target="_blank"><c:if test="${fn:length(items.name) >=15}"><xmp>${fn:substring(items.name,0, 15)}...</xmp></c:if><c:if test="${fn:length(items.name) < 15}"><xmp>${items.name}</xmp></c:if></a></td>
							<td style="width:10%;text-align: left;">
							  ${items.questionTypeName }
							</td>
                            <td style="width:15%;text-align: left;"><span title="${items.fieldName }" style="display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">${items.fieldName }</span></td>
							<td style="width:20%;text-align: left;"><span title="${items.pointName }" style="display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">${items.pointName }</span></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4" style="text-align: center;">
							<span style="color: #ff6a00">没有相关数据</span>
						</td>
					</tr>
				</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div>
		<div class="page-header position-relative">
			<table style="width: 100%;">
				<tr>
					<td style="align: center;" align="center"><div
							class="pagination"
							style="padding-top: 15px; margin: 0 auto; font-size:12px; display: inline-block;">${page.platformPageStr}</div></td>
				</tr>
			</table>
		</div>
		<input type="reset" id="resetButton" name="resetButton" style="display:none">
		</form>
</div>
<div class="clear"></div>
<!-- 修改分类 -->
	<div class="modal_h20 fade in" id="ssj" role="dialog"
			aria-labelledby="adoptModal" aria-hidden="false" data-backdrop="static">
			
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" onclick="clearAll();">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							修改分类<small> </small>
						</h4>
					</div>
					<form class="form-horizontal" role="form" action="" method="post"
						id="form1" name="form1">
						<table class="table">
							<tbody>
								<tr>
								<td style="text-align: right;width:30%;">
									<span style="color:red;">*</span>专业：
				                    </td>
				                    <td style="width:70%;">
				                        <select class="inputtxt2" name="field_id_a" id="field_id_a">
				                        <option value="">全部</option>
							<c:forEach items="${fieldList}" var="field">
								<option value="${field.fieldId}" >${field.fieldName}</option>
							</c:forEach>
				                        </select>
				                    </td>
								</tr>
								<tr>
								<td style="text-align: right;width:30%;">
								<span style="color:red;">*</span>知识类：
								</td>
								<td style="width:70%;">
								<select class="inputtxt2" name="point_id_a" id="point_id_a">
								    <option value="">全部</option>
									<c:forEach items="${knowledgeList}" var="knowledge">
										<option value="${knowledge.pointId}"
											<c:if test="${knowledge.pointId == pd.point_id }">selected</c:if>>${knowledge.pointName}</option>
									</c:forEach>
				               </select>
								</td>
								</tr>
							</tbody>
						</table>
						<div class="modal-footer">
						    <input type="hidden" value="" id="defauinfo_id">
							<button id="EduButton" type="button" class="btn btn-success"
								onclick="updateQuestionPoint()">确认</button>
							<button type="button" class="btn btn-default" onclick="clearAll();"
								data-dismiss="modal">关闭</button>
							<input type="hidden" value="" id="question_id" name="question_id">
						</div>
					</form>
				</div>
			</div>
		</div>
		<input type="hidden" value="" id="point">
		<input  type="hidden" value="" id="field">
		<script type="text/javascript">
		function childtest(pointid,fieldid,USERID){
			$("#field_id").val(fieldid);
			$("#point_id").val(pointid);
			$("#point").val(pointid);
			$("#field").val(fieldid);
			if(fieldid!=null&&fieldid!=""){
				$("#field_id").attr("disabled","disabled");
			}if(pointid!=null&&pointid!=""){
				$("#point_id").attr("disabled","disabled");
			}
		}
		$(function(){
			//页码切换时，获取试题ID
			var values = $("#checkedIds").val();
			var checkedIds;
			var ids;
			if(values!=""){
				checkedIds= values.split(",");// 在每个逗号(,)处进行分解。
				for(var i=0;i<checkedIds.length;i++){
					var checkboxs = $(".tableclass input[type=checkbox]");
					$.each(checkboxs, function() {
						var id = $(this).val();
						if($(this).val()==checkedIds[i]){
							$(this).prop("checked",true);
						}
					});
					}
			}else{
				checkedIds= new Array();
			}
			$(".tableclass input[type=checkbox]").change(
					function() {
						if($(this).prop("checked")==true){
							var id = $(this).val();
							checkedIds.push(id);
						}else if($(this).prop("checked")==false){
							var id = $(this).val();
							var index = checkedIds.indexOf(id); 
							checkedIds.splice(index,1);
						}
						ids = checkedIds.join(',');
						$("#checkedIds").val(ids);
					});			
			var pointid=$("#pointids").val();
			$("#point_id").val(pointid);
			var fieldid=$("#fieldids").val();
			$("#field_id").val(fieldid);
			if(fieldid!=null&&fieldid!=""){
				$("#field_id").attr("disabled","disabled");
			}if(pointid!=null&&pointid!=""){
				$("#point_id").attr("disabled","disabled");
			}
		})
		</script>
</html>
