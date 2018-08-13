<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>栏目树</title>
<base href="<%=basePath%>">
<link rel="stylesheet" href="static/css/ace.min.css" />
<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
<link rel="stylesheet" href="static/css/ace-skins.min.css" />
<link rel="stylesheet" href="static/css/font-awesome.min.css" />

<script type="text/javascript" src="static/js/jquery-1.5.1.min.js"></script>

<!-- 3.x -->
<link type="text/css" rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css"/>
<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.exedit.js"></script>	

<style type="text/css">
.tree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
</style>

</head>


<body>
	<ul id="tree" class="tree" style="overflow:auto;min-height:340px;"></ul>
	<input type="hidden" id="unit_id" name="unit_id"/>
	<input type="hidden" id="unit_name" name="unit_name"/>
</body>
<script type="text/javascript">

	var zTree;
	
	var setting = {
			check: {//是否显示复选框  
	            enable: true,
	            chkStyle: "radio",
	    		radioType: "all"
	        }, 
	        view: {  
	            selectedMulti: false,			//多选
	            showLine: true,					//节点连接线
	            showIcon: true,					//图标
	            dblClickExpand:false,			//双击时，是否展开节点
	        }, 
			data: {
				simpleData: {
					enable: true,
					idKey: "id",
					pIdKey: "pId"
				}
			},
	        callback: {//回调
	        	onCheck:onCheck
	    	}
	};
	
	$(document).ready(function(){
		var zn = ${zTreeNodes};
		zTree = $.fn.zTree.init($("#tree"), setting,zn);
// 		zTree.expandAll(true);//默认展开所有节点 
		
	});
	
	//获取当前被勾选的节点集合
	function onCheck(){
		var treeObj = $.fn.zTree.getZTreeObj("tree");
		var nodes = treeObj.getCheckedNodes(true);
		var strId = "";
		var strName = "";
		
		for(var i = 0;i < nodes.length;i++){
			if(strId == ""){
				strId = nodes[i].id;
			}else{
				strId = strId + "," + nodes[i].id;
			}
			if(strName == ""){
				strName = nodes[i].name;
			}else{
				strName = strName + "," + nodes[i].name;
			}
		}
		$("#unit_id").val(strId);
		$("#unit_name").val(strName);
	}

</script>
</html>