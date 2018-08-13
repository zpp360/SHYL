<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8" />
<title></title>
<meta name="description" content="overview & stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name='apple-mobile-web-app-capable' content='yes'>
<meta name='apple-mobile-web-app-status-bar-style' content='black'>
<meta name='format-detection' content='telephone=no'>
<script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="static/photoswipe/photoswipe.min.js"></script>
<script type="text/javascript" src="static/photoswipe/photoswipe-ui-default.min.js"></script>
<script type="text/javascript" src="static/layer/layer.js"></script>
<link href="static/layer/layer.css" rel="stylesheet" type="text/css">
<link href="static/photoswipe/photoswipe.css" rel="stylesheet" type="text/css">
<link href="static/photoswipe/default-skin/default-skin.css" rel="stylesheet" type="text/css">

<style type="text/css">
	body{
		 font-size:18px;
		 font-family:"微软雅黑";
		 backgroud-color:#fff9f9;
	}
	html, section, div, ul,p,form{
		padding:0px;margin:0px;border:0px;
	}
	li{list-style:none;margin:0;padding:0;}
	.container img{width:100% !important;height:auto !important;}
	.container{
		width:90vw;
		margin:0 auto;
	}
	.title{
		font-size:18px;
		font-weight:600;
	}	
	#comment_text{
		width:100%;
		height:150px;
		padding:5px;
		font-size:14px;
	}
	.submit{
		width:100%;
		height:30px;
		background-color:#07be03;
		border-radius:4px;
		text-align:center;
		color:#fff;
		line-height:30px;
		cursor:pointer;
	}
</style>
</head>
<body>
	<section class="container">
		<section class="title">
			赵乐际2013年在全国老干部局长会议上的讲话
		</section>
		<form action="<%=basePath%>/column/comment.app" method="post">
			<input type="hidden" value="${user_id}" name="user_id"/>
			<input type="hidden" value="${pd.news_id}" name="news_id"/>
			<textarea id="comment_text" name="comment_text" placeholder="留言审核后可见"></textarea>
		</form>
		<div class="submit">留言</div>
    </section>
<script type="text/javascript">
	$(function(){
		$(".submit").click(function(){
			if($("#comment_text").val()==null || $("#comment_text").val()==""){
				alert("留言不能为空")
				return false;
			}
			$.ajax({
				type: "POST",
				url: "<%=basePath%>column/comment.app",
				data:{user_id:$("input[name='user_id']").val(),news_id:$("input[name='news_id']").val(),comment_text:$("#comment_text").val()},
				dataType:"json",
				cache : false,
				success:function(data){
					if(data.errorCode=="200"){
						layer.open({
						    content: '留言成功，请等待审核'
						    ,skin: 'msg'
						    ,time: 2 //2秒后自动关闭
						});
						setTimeout(function(){
							history.back();
						},2000)
					}
				}
			});
		});
		
	})
</script>
    
</body>

</html>