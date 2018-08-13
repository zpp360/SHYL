<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
		
		<script src="static/js/jquery-1.9.1.min.js"></script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/multiselect/js/multiselect.min.js"></script>
		<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/prettify/r298/prettify.min.js"></script>
		<style type="text/css">
			.form_button{
				width:120px;
				margin:0 auto;
			}
		</style>
	</head>
<body>
	<div>
		${unitPd.unit_name_full }
		<input type="hidden" value="${unitPd.unit_id }" name="unit_id"/>
	</div>
	<div class="row">
	    <div class="col-xs-5" style="margin-top:20px;">
	    	<div>未关联</div>
	        <select name="from[]" id="undo_redo" class="form-control" size="13" multiple="multiple">
	        	<c:forEach items="${noRelatedList}" var="item" varStatus="vs">
		            <option value="${item.p_id }">${item.p_name} &nbsp;&nbsp;&nbsp;&nbsp;(${item.unit_name })</option>
	        	</c:forEach>
	        </select>
	    </div>
	    
	    <div class="col-xs-2" style="margin-top:42px;">
	        <button type="button" id="undo_redo_undo" class="btn btn-primary btn-block">undo</button>
	        <button type="button" id="undo_redo_rightAll" class="btn btn-default btn-block"><i class="glyphicon glyphicon-forward"></i></button>
	        <button type="button" id="undo_redo_rightSelected" class="btn btn-default btn-block"><i class="glyphicon glyphicon-chevron-right"></i></button>
	        <button type="button" id="undo_redo_leftSelected" class="btn btn-default btn-block"><i class="glyphicon glyphicon-chevron-left"></i></button>
	        <button type="button" id="undo_redo_leftAll" class="btn btn-default btn-block"><i class="glyphicon glyphicon-backward"></i></button>
	        <button type="button" id="undo_redo_redo" class="btn btn-warning btn-block">redo</button>
	    </div>
	    
	    <div class="col-xs-5" style="margin-top:20px;">
	    	<div>已关联</div>
	        <select name="to[]" id="undo_redo_to" class="form-control" size="13" multiple="multiple">
	        	<c:forEach items="${relatedList}" var="item" varStatus="vs">
		            <option value="${item.p_id }">${item.p_name} &nbsp;&nbsp;&nbsp;&nbsp;(${item.unit_name })</option>
	        	</c:forEach>
	        </select>
	    </div>
	</div>	
	<div class="form_button"> 
	    <button type="button" class="btn btn-primary form_sumbit">提交</button> 
	    <button type="button" class="btn btn-primary form_close" onclick="top.Dialog.close();">关闭</button> 
    </div>
	<div id="zhongxin"></div>
	<div id="zhongxin2" class="center" style="display:none"><br/><img src="static/images/jzx.gif" /><br/><h4 class="lighter block green"></h4></div>
		
<script type="text/javascript">
	$(top.hangge());
	$(function(){
		$('#undo_redo').multiselect();
	    
	    $(".form_sumbit").click(function(){
	    	//已关联
	    	var raleted="";
	    	$("#undo_redo_to option").each(function(){
	    		raleted = raleted + $(this).val() + ","
	    	});
	    	raleted = raleted.substr(0,raleted.length-1);
	    	
	    	var unitId = $("input[name='unit_id']").val();
	    	
	    	window.location="<%=basePath%>unit/editPemission.do?raleted="+raleted+"&unit_id="+unitId+"&pemissionType=1";
	    });
	});

</script>
	
</body>
</html>