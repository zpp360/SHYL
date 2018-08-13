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
<%@ include file="../../../system/admin/top.jsp"%>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script type="text/javascript" src="static/js/jquery-1.5.1.min.js"></script>

<!-- 3.x -->
<link type="text/css" rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css"/>
<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>
<!-- <script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.excheck-3.5.js"></script> -->
<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.exedit.js"></script>	

<style type="text/css">
.tree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
</style>

</head>


<body>
	<ul id="tree" class="tree" style="overflow:auto;"></ul>
</body>
<script type="text/javascript">
$(top.hangge());

	var zTree;
	
	var setting = {
			async: {//异步加载
				enable: true,
				url: "<%=basePath%>columnManagement/columnZtree.do",
				autoParam: ["id"]
			},
			simpleData: {
				enable: true,
				dataType: "text",
				idKey: "id",
				pIdKey: 0
			},
			edit:{
				enable:true,
				removeTitle:"删除",
				renameTitle:"编辑",
				showRemoveBtn: showRemoveBtn,//是否显示删除按钮
				showRenameBtn: showRenameBtn//是否显示编辑按钮
			},
	        view: {  
	            selectedMulti: false,			//多选
	            showLine: true,					//节点连接线
	            showIcon: true,					//图标
	            dblClickExpand:false,			//双击时，是否展开节点
	            addHoverDom: addHoverDom,		//移动到节点时，显示控件按钮
	    		removeHoverDom: removeHoverDom	//移出节点时，隐藏控件按钮
	        }, 
	        callback: {//回调
				beforeEditName: beforeEditName,
				beforeRemove: beforeRemove
	    	}
	};
	
	//编辑
	function beforeEditName(treeId, treeNode) {
		var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="修改栏目";
		 diag.URL = dialogPath+'columnManagement/to_edit.do?column_id='+treeNode.id+'&column_name='+treeNode.name;
		 diag.Width = 350;
		 diag.Height = 250;
		 diag.CancelEvent = function(){ //关闭事件
			if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				setTimeout("location.reload()",100);
			}
			diag.close();
		 };
		 diag.show();
		return false;
	}
	//删除
	function beforeRemove(treeId, treeNode) {
		if(confirm("确认删除 节点 -- " + treeNode.name + " 吗？")){
			$.ajax({
				type : "POST",
				url : "<%=basePath%>columnManagement/deleteColumn.do?tm=" + new Date().getTime(),
				dataType : "json",
				cache : false,
				data :{column_id:treeNode.id},
				success:function(data){
					if(data == "1"){
						alert("请先删除子栏目！");
						setTimeout("location.reload()",100);
					}
					if(data == "2"){
						alert("请先删除栏目下的内容！");
						setTimeout("location.reload()",100);
					}
					if(data == "3"){
						setTimeout("location.reload()",100);
					}
				},
				error:function(){
					alert("操作失败,请重新操作!");
				}
			});
		}
		return false;
	}
	//是否显示删除按钮
	function showRemoveBtn(treeId, treeNode) {
		if(treeNode.pId==null){
			return false;
		}
		return true;
	}
	//是否显示编辑按钮
	function showRenameBtn(treeId, treeNode) {
		if(treeNode.pId==null){
			return false;
		}
		return true;
	}

	//移动到节点时，显示控件按钮
	function addHoverDom(treeId, treeNode) {
		var sObj = $("#" + treeNode.tId + "_span");
		if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) {
			return;
			}
		var addStr = "<span class='button add' id='addBtn_" + treeNode.tId + "' title='添加' onfocus='this.blur();'></span>";
		sObj.after(addStr);
		var btn = $("#addBtn_"+treeNode.tId);
		if (btn) {
			btn.bind("click", function(){//添加
				var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="新增栏目";
				 diag.URL = dialogPath+'columnManagement/to_Add.do?column_id='+treeNode.id+'&level='+treeNode.level;
				 diag.Width = 350;
				 diag.Height = 250;
				 diag.CancelEvent = function(){ //关闭事件
					if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
						setTimeout("location.reload()",100);
					}
					diag.close();
				 };
				 diag.show();
				return;
			});
		}
	};
	//移出节点时，隐藏控件按钮
	function removeHoverDom(treeId, treeNode) {
		$("#addBtn_"+treeNode.tId).unbind().remove();
	};
	
	
	
	$(document).ready(function(){
		var zTreeNodes = [{"name":"根节点","id":"1","isParent":"true"}];
		zTree = $.fn.zTree.init($("#tree"), setting,zTreeNodes);
		expand();
	});

	//默认展开 根节点
	function expand(){
		var treeObj = $.fn.zTree.getZTreeObj("tree");
		var nodes = treeObj.getNodes();
		treeObj.expandNode(nodes[0], true, true, true);
	}
	
</script>
</html>