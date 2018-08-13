<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
.group_tree{
	float:left;
	width:15%;
}
</style>



	<div id="group_tree" class="group_tree">
		<ul id="tree" class="tree" style="overflow:auto;"></ul>
	</div>	
<script type="text/javascript">

	var zTree;
	
	var setting = {
			async: {
				enable: true,
				type: "post",
				url: "<%=basePath%>columnManagement/contentLeft.do",
				autoParam: ["id"]
			},
			simpleData: {
				enable: true,
				dataType: "text",
				idKey: "id",
				pIdKey: "pId"
			},
	        view: {  
	            selectedMulti: false,			//多选
	            showLine: true,					//节点连接线
	            showIcon: true,					//图标
	            dblClickExpand:false			//双击时，是否展开节点
	        }, 
	        callback: {//回调
	    		onClick: selectlistpage			//点击事件
	    	}
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
	
	function selectlistpage(event, treeId, treeNode){
		var frame = document.getElementById('groupFrame');
		frame.src = "<%=basePath%>columnManagement/contentRight.do?column_id="+treeNode.id;
	}

</script>
