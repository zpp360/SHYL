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
<title>用户组树</title>
<base href="<%=basePath%>">
<%@ include file="../../../system/admin/top.jsp"%>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
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
	<ul id="tree" class="tree" style="overflow:auto;"></ul>
	<input type="hidden" id="user_id" name="user_id"/>
	<input type="hidden" id="notifiId" name="notifiId" value="${pd.notifiId}"/>
</body>
<script type="text/javascript">
$(top.hangge());

	var zTreeObj,
	setting = {
		check: {  
	        enable: true,  
	        nocheckInherit: false,
	        chkboxType: { "Y": "s", "N": "ps" }
	    },  	
		async: {
			enable: true,
			url: "<%=basePath%>sign_up/selectUserTree.do?sign_up_id="+"${pd.relatedId}",
			autoParam: ["id=id","level=level"]
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
			onCheck: onCheck
		}
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

	 //展开根节点，会自动调用异步方法  
	 function expandRoot(){
		 var zTree = $.fn.zTree.getZTreeObj("tree");  
		 nodes = zTree.getNodes();
		 zTree.expandNode(nodes[0], true, true, true);
	 }
	
	//获取当前被勾选的节点集合
	function onCheck(){
		var treeObj = $.fn.zTree.getZTreeObj("tree");
		var nodes = treeObj.getCheckedNodes(true);
		var str = "";
			
		for(var i = 0;i < nodes.length;i++){
			if(nodes[i].level=="3"){
				if(str == ""){
					str = nodes[i].user_id;
				}else{
					str = str + "," + nodes[i].user_id;
				}
			}
		}
		$("#user_id").val(str);
	}
	 
</script>
</html>