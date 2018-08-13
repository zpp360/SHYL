<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
	.group_tree{
		float:left;
		width:20%;
	}
</style>
<!-- 本页面涉及的js函数，都在head.jsp页面中     -->
<div id="group_tree" class="group_tree">
	<ul id="tree" class="tree" style="overflow:auto;"></ul>
	
</div>


<script type="text/javascript">

	var zTreeObj,
	setting = {
		async: {
			enable: true,
			url: "<%=basePath%>group/group_tree.do",
			autoParam: ["id=id"]
		},
		simpleData: {
			enable: true,
			dataType: "text",
			idKey: "id",
			pIdKey: "pId",
			rootPId: 0
		},
		view: {
			selectedMulti: false
		},
		callback: {
			onAsyncSuccess: zTreeOnAsyncSuccess,
			onExpand: zTreeOnExpand,
			onClick: zTreeOnClick
		}
	}
	//异步调用成功后调用
	function zTreeOnAsyncSuccess(){
	}
	//展开调用
	function zTreeOnExpand(event, treeId, treeNode){
		
	}
	//点击调用
	function zTreeOnClick(event, treeId, treeNode){
		var id = treeNode.id;
		var level = treeNode.level;
		var frame = document.getElementById('groupFrame');
		frame.src = "<%=basePath%>group/right_list.do?group_id="+id+"&level="+level;
	}
	
	
	var zTreeNodes = [
		{"name":"根节点","id":"0","isParent":"true"}
	];
	
	
	 $(document).ready(function(){  
         $.fn.zTree.init($("#tree"), setting,zTreeNodes);  
         setTimeout(function(){  
             expandRoot();  
         },100);//延迟加载  
     });  
       
	 function expandRoot(){
		 var zTree = $.fn.zTree.getZTreeObj("tree");  
		 nodes = zTree.getNodes();
		 zTree.expandNode(nodes[0], true, true, true);
	 }
	 //刷新父节点
	 function refreshParentNode(groupId){
		var treeObj = $.fn.zTree.getZTreeObj("tree");
		var node = treeObj.getNodeByParam("id", groupId, null);
		var parentNode = node.getParentNode();
		if (parentNode!=null&&parentNode!="undefined") {
			treeObj.reAsyncChildNodes(parentNode, "refresh");
			if(parentNode.children.length==0&&parentNode.parentTId!=null){
				parentNode.isParent = false;
			}
		}
		
	 }
	 
	 //刷新节点
	 function refreshNode(groupId){
		var treeObj = $.fn.zTree.getZTreeObj("tree");
		var node = treeObj.getNodeByParam("id", groupId, null);
		if (node!=null&&node!="undefined") {
			node.isParent = true;
			treeObj.reAsyncChildNodes(node, "refresh");
		}
	 }
</script>
