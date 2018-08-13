<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<meta charset="utf-8" />
<title>通知公告添加</title>
<meta name="description" content="overview & stats" />
<%@ include file="../../../system/admin/top.jsp"%>

<!-- 上传 -->
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
<script type="text/javascript" src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
<%-- <script type="text/javascript" src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script> --%>
<%-- <script type="text/javascript" src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script> --%>
<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>

<!-- 添加按钮 -->
<link rel="stylesheet" href="static/assets/css/font-awesome.css" />

<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>

<!-- <script src="static/js/jquery-1.9.1.min.js"></script> -->
<script src="static/js/bootstrap.min.js"></script>
		<script src="static/multiselect/js/multiselect.min.js"></script>
		<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/prettify/r298/prettify.min.js"></script>
<script src="static/js/ace-elements.min.js"></script>
<script src="static/js/ace.min.js"></script>

<!-- 下拉框 -->
<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>

<link type="text/css" rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css"/>
<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.excheck.js"></script> 

<style type="text/css">
.upload_img {
	float: left;
	width: 60%;
	position: relative;
}

.upload_img img {
	float: left;
}

.upload_img a {
	position: absolute;
	left: 210px;
	top: 0;
	font-size: 0.85em;
	border: 0;
	background-color: #3961c2;
	color: #fff;
	padding: 0;
	width: 160px;
	text-align: center;
	height: 50px;
	line-height: 50px;
	display: inline-block;
	border-radius: 4px;
	float: left;
	margin-top: 20px;
}

.upload_img p {
	position: absolute;
	bottom: 50px;
	left: 210px;
	color: #737373;
	line-height: 30px;
	width: 60%;
	font-size: 1.1em;
	float: left;
}

.upload_img p i {
	color: #1c1c1c;
	font-weight: bold;
	font-size: 1.1em;
}

select, input[type="file"] {
	height: 45px;
	line-height: 30px;
}

.uploadbtn {
	position: absolute;
	top: 0;
	margin: 0;
	opacity: 0;
	-ms-filter: 'alpha(opacity=0)';
	font-size: 8px !important;
	direction: ltr;
	height: 100px;
	width: 300px;
	cursor: pointer;
}

.a-upload {
	padding: 4px 10px;
	height: 20px;
	line-height: 20px;
	position: relative;
	cursor: pointer;
	color: #888;
	background: #fafafa;
	border: 1px solid #ddd;
	border-radius: 4px;
	overflow: hidden;
	display: inline-block;
	*display: inline;
	*zoom: 1
}

.a-upload input {
	position: absolute;
	font-size: 100px;
	right: 0;
	top: 0;
	opacity: 0;
	filter: alpha(opacity = 0);
	cursor: pointer
}

.upload a {
	position: absolute;
	left: 330px;
	font-size: 0.85em;
	border: 0;
	background-color: #3961c2;
	color: #fff;
	padding: 0;
	width: 100px;
	text-align: center;
	height: 30px;
	line-height: 30px;
	display: inline-block;
	border-radius: 4px;
	float: left;
	margin-left: 100px;
}

.upload p {
	bottom: 50px;
	left: 100px;
	color: #737373;
	line-height: 30px;
	width: 60%;
	font-size: 1.1em;
}

.ques-remove-opt {
    color: #d2322d;
    cursor: pointer;
    margin-left: 5px;
    margin-top: 12px;
}
.tree_content{
	position:absolute;
	top:32px;
	width:300px;
	height:400px;
	background-color: #fff;
    z-index: 1000;
    border: 1px solid #ccc;
    border-top: none;
    overflow:auto;
}

.div_txt {
    border: 1px solid #c3c3c3;
    border-top: 1px solid #7c7c7c;
    border-left: 1px solid #9a9a9a;
    background-color:white;
    padding: 1px;
    width: auto;
    height: auto;
    min-height: 18px;
}
.div_txt b{
	padding-left:2px;
}

</style>
</head>
<body>
	<br>
	<form name="Form" id="Form" method="post">
		<div id="zhongxin">
			<table class="table">
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<span style="color: #C00; padding-right: 4px;">*</span><B>公告标题</B>
					</td>
					<td>
						<input type="text" name="notifiTitle" id="notifiTitle" maxlength="50" style="height: 20px; width: 300px;" placeholder="请输入公告标题" title="公告标题" onblur="trim(this);"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<B>文件编号</B>
					</td>
					<td>
						<input type="text" name="notifiTitleOther" id="notifiTitleOther" maxlength="50" style="height: 20px; width: 300px;" placeholder="请输入文件编号" title="文件编号" onblur="trim(this);"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<B>来源</B>
					</td>
					<td>
						<input type="text" name="notifiSource" id="notifiSource" maxlength="50" style="height: 20px; width: 300px;" placeholder="请输入来源" title="来源" onblur="trim(this);"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;">
						<B>接收用户</B>
					</td>
					<td style="position:relative;">
						<input type="hidden" name="userIds" id="userIds" maxlength="50" />
						<div id="toAreaCtrl" class="noime div_txt" style="cursor: text;">
						</div>
						<div class="tree_content">
							<ul id="tree" class="tree" style="overflow:auto;"></ul>
						</div>
					</td>
				</tr>
				<tr>
					<td nowrap="nowrap" style="width: 80px; text-align: left; padding-top: 13px;"><B>公告内容</B></td>
					<td><textarea id="notifiContent" name="notifiContent" maxlength="10000" style="min-height: 450px; margin: 0 auto; width: 80%; float: left" title="公告内容"></textarea></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		<div align="center" style="margin-top: 10px;">
			<a class="btn  btn-success" onclick="save('0');"><i class="icon-save"></i>发送</a>
			<a class="btn  btn-success" onclick="save('1');"><i class="icon-save"></i>保存草稿</a>  
			<a class="btn  btn-light" onclick="returnback()"><i class=" icon-circle-arrow-left"></i>返回</a>
		</div>
		<div id="zhongxin2" class="center" style="display: none">
			<br /> <br /> <br /> <br /> <img src="<%=basePath%>static/images/jiazai.gif" /><br />
			<h4 class="lighter block green"></h4>
		</div>
	</form>
	
	<script type="text/javascript">
		$(top.hangge());
		
		$(document).ready(function(){
			
			/*------------------ 富文本编辑器  start------------------ */
			
		    var ue = UE.getEditor("notifiContent");
			
			/*------------------ 富文本编辑器  end------------------ */
			$("#toAreaCtrl").click(function(){
				$(".tree_content").toggle();
			});
			
			ue.addListener("focus",function(){
				if($(".tree_content:visible")){
					$(".tree_content").hide();
				}
			})
		});
		
		//返回
	    function returnback(){
	    	window.location.href="<%=basePath%>notice/list.do${url}";
		}
		
	   //保存
	    function save(notifiFlag){
	    	//校验
	    	if ($("#notifiTitle").val() == "") {
	    		$("#notifiTitle").tips({
	    			side : 3,
	    			msg : '请输入公告标题',
	    			bg : '#FF5080',
	    			time : 2
	    		});
	    		$("#notifiTitle").focus();
	    		return false;
	    	}
	    	if(exitUsers!=null&&exitUsers.length>0){
	    		var userIdsStr = "";
	    		for(var i=0;i<exitUsers.length;i++){
	    			userIdsStr = userIdsStr + exitUsers[i].user_id + ",";
	    		}
	    		userIdsStr = userIdsStr.substring(0, userIdsStr.length-1);
	    		$("#userIds").val(userIdsStr);
	    	}else{
	    		$("#toAreaCtrl").tips({
	    			side : 3,
	    			msg : '请选择接收用户',
	    			bg : '#FF5080',
	    			time : 2
	    		});
	    		return false;
	    	}
	    	
	    	$("#Form").attr("action","<%=basePath%>notice/saveNotice.do?notifiFlag="+notifiFlag);
	    	$("#Form").submit();
	    	$("#zhongxin").hide();
	    	$("#zhongxin2").show();
	    	
	    }
		
		
		//ztree
	    var zTreeObj,
		setting = {
	    	check: {  
	            enable: true,  
	            nocheckInherit: false,
	            chkboxType: { "Y": "s", "N": "ps" }
	        },  	
			async: {
				enable: true,
				url: "<%=basePath%>group/group_user_tree.do",
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
				onCheck: zTreeOnCheck
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
		 //被选中时触发
		 var maxLevel = 3;
		 var exitUsers = new Array();
		 function zTreeOnCheck(event, treeId, treeNode) {
			 if(treeNode.checked){
				 //被选中
				 var checkedUser = new Array();
				 var checkedUser = getLeafUser(treeNode,checkedUser);
				 writeArea(checkedUser,"+");
				 //调整ztree div的位置
				 var height = $("#toAreaCtrl").outerHeight(true);
				 $(".tree_content").css("top",height+8);
			 }else{
				 //取消选中
				 var unCheckedUser = new Array();
				 var unCheckedUser = getLeafUser(treeNode,unCheckedUser);
				 writeArea(unCheckedUser,"-")
				//调整ztree div的位置
				 var height = $("#toAreaCtrl").outerHeight(true);
				 $(".tree_content").css("top",height+8);
			 }
			 
		 };
		 //获取叶子节点的用户
		 function getLeafUser(treeNode,user){
			 if(treeNode.level==maxLevel){
				 //叶子节点，肯定是用户
				 user.push(treeNode)
			 }else{
				 //非叶子节点，递归获取叶子节点
				 var children = treeNode.children;
				 if(children!=null&&children.length>0){
					 for(var i=0;i<children.length;i++){
						 getLeafUser(children[i],user);
					 }
				 }
			 }
			 return user;
		 }
		 
		 //将用户在div里添加，删除
		 function writeArea(userNodes,symbol){
			 var area = $("#toAreaCtrl");
			 if(symbol!=null&&"+"==symbol){
				 //添加到div
				 for(var i=0;i<userNodes.length;i++){
					 var flag = true;
					 for(var j=0;j<exitUsers.length;j++){
						 if(exitUsers[j].user_id == userNodes[i].user_id){
							 //文本框内已存在此元素，不再添加，并且叶子节点不再选中
							 flag = false;
							 var treeObj = $.fn.zTree.getZTreeObj("tree");
							 var node = treeObj.getNodeByTId(userNodes[i].tId);
							 var userId = userNodes[i].user_id; 
							 var nodes = treeObj.getNodesByParam("user_id", userId, null);
							 if(nodes.length>1){
								 treeObj.checkNode(node, false, true);
							 }
						 }
					 }
					 if(flag){
						area.append("<b class='"+userNodes[i].tId+"'>"+userNodes[i].name+"</b>");
						exitUsers.push(userNodes[i]); 
					 }
				 }
			 }
			 if(symbol!=null&&"-"==symbol){
				 for(var i=0;i<userNodes.length;i++){
					 var tId = userNodes[i].tId;
					 $("."+tId).remove();
					 exitUsers.remove(userNodes[i])
				 }
			 }
		 }
		 
		 
		 
	</script>
</body>
</html>