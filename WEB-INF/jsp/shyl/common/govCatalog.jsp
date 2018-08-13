<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<link rel="stylesheet" href="<%=basePath%>shyl/css/zTreeStyle/zTreeStyle.css">
<style>
.layui-layer-rim {
    border: 2px solid rgba(0,0,0,.3) !important;
}
</style>
<div style="width: 250px;float: left; display: none" id="treeDiv">
	<ul id="tree" class="ztree" ></ul>
</div>
<input type="hidden" id="treeData" value='${pageMap.treeData}'>
<script src="<%=basePath%>shyl/js/mainjs/jquery.ztree.core-3.5.js" type="text/javascript"></script>
<script src="<%=basePath%>/shyl/js/layer/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>/shyl/js/jquery.cookie.js"></script>	
<script type="text/javascript">
var setting = {
		data: {
		simpleData: {
		enable: true
		},
		showTitle:true, 
		key: {title:"title"}
	}
};
zTreeNodes =JSON.parse($("#treeData").val());
var COOKIE_NAME='catalogTree';
$(function(){
	zTreeObj = $.fn.zTree.init($("#tree"), setting, zTreeNodes);
 	if(!$.cookie(COOKIE_NAME) ){
 		openLayer('171');
	 }
	$("#catalogTree").click(function(){
		 var curtop = $(this).offset().top; 
		 openLayer(curtop);
	})
});
function openLayer(curtop){
	layer.open({
	 	 title:'目录' ,
        type: 1,
         shade: false, 
        shadeClose : true,
        area: ['280px','350px'],
        offset: [
          curtop-35
          ,document.body.clientWidth -310
        ],
		 skin: 'layui-layer-rim', 
		 content: $("#treeDiv"),
		 success: function(layero, index){
			 $.cookie(COOKIE_NAME,null,{expires:-1,path: '/'});  
		 },
		 end: function () {
			 $.cookie(COOKIE_NAME, 'close', {
				path: '/',expires :365
			}); 
		}
  	}); 
}
 
</script>