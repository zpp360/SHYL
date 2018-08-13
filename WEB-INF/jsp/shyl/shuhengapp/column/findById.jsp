<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="img_host" value="${applicationScope.get('img_host')}"></c:set>
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
<link href="static/photoswipe/photoswipe.css" rel="stylesheet" type="text/css">
<link href="static/photoswipe/default-skin/default-skin.css" rel="stylesheet" type="text/css">

<style type="text/css">
	body{
		 font-size:18px;
		 font-family:"微软雅黑";
	}
	html, section, div, ul,p{
		padding:0px;margin:0px;border:0px;
	}
	li{list-style:none;margin:0;padding:0;}
	.container img{width:100% !important;height:auto !important;}
	.container{
		max-width:740px;
		padding:0 0;
		width:90vw;
		margin:0 auto;
	}
	.container p{
		width:100% !important;
		word-break:break-all;
	}
	.container table{
		width:100% !important;
	}
	.container div{
		width:100% !important;
	}
	.container .title{
		font-size:1.3em;
		text-align: left;
		word-break:break-all;
	}
	.container .subhead{
		font-weight: normal;
	    font-size: 12px;
	    color: #ccc;
		text-align: left;
	}
	.container .views{
		font-weight: normal;
	    font-size: 12px;
	    color: #ccc;
		float: right;
	}
	.container .content{
		color:#3d3c3d;
		min-height:400px;
	}
	.container .content > p:first-child{
		margin-top: -30px !important;
	}
	
	.container iframe{
		width:100%;
		height:auto;
	}
	.container video{
		width:100%;
		height:auto;
	}
	.container .up{
		width:100%;
		
	}
	.container .up .up_button{
		position: relative;
		margin:0 auto;
		width:70px !important;
		height:70px;
		border-radius:100%;
		-webkit-border-radius: 100%;
		border:1px solid #999999;
		cursor: pointer;
		line-height:44px;
		text-align:center;
		color: #4d4c4c;
    	font-size: 13px;
	}
	.container .up .up_button:before{
		width: 17px;
	    height: 17px;
	    display: block;
	    position: absolute;
	    content: "";
	    bottom: 13px;
	    left: 27px;
	    background: url(shyl/images/news/content-down.png) top center no-repeat;
	}
	.comment{
		width:100%;
		overflow:hidden;
	}
	.comment_title{
		padding-top:30px;
		text-align:center;
	    font-size: 16px;
	}
	.comment_list{
		padding-top: 10px;
    	border-bottom: 1px dotted #c7c7c7;
		width:100%;
		display: -webkit-flex; /* Safari ,Webkit内核的浏览器，必须加上-webkit前缀。*/
  		display: flex;
  		flex-direction: row;
  		flex-wrap: nowrap;
  		justify-content: flex-start;
	}
	.user_img{
		order:0;
		flex-basis:50px;
		width:20px !important;
	}
	.user_img img{
		width:35px !important;
		height:35px !important;
		border-radius:100%;
	}
	.comment_txt{
		order:1;
	}
	.user_name{
		letter-spacing:2px;
		font-size:14px;
		color:#999;
	}
	.user_comment{
		font-family: "微软雅黑";
	    font-size: 15px;
	    line-height: 22px;
	}
	
	
</style>
</head>
<body>
	<input type="hidden" value="${user_id}" name="user_id"/>
	<input type="hidden" value="${pd.news_id}" name="news_id"/>
	<section class="container">
		<h1 class="title">${pd.news_title}</h1>
		<h2 class="subhead"><c:if test="${!empty pd.news_source}">${pd.news_source}&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</c:if>     ${pd.release_time}  <span class="views">阅读  ${pd.views + 1}</span></h2>
		<div class="content">
			　　${pd.news_content}
		</div>
		<c:if test="${user_id!=null}">
			<div class="up">
				<input type="hidden" value="${hasLike}" name="has_like"/>
				<div class="up_button">${likeCount} </div>
			</div>
		</c:if>
		
		<div class="comment">
			<div class="comment_title">
				<span style="float:left;color:#999;">精选留言</span>
				<c:if test="${user_id!=null}">
				<span style="float:right;color:blue;cursor:pointer;" onclick="toComment('${user_id}','${pd.news_id}')">留言</span>
				</c:if>
			</div>
			<c:forEach items="${commentList}" var="comment" varStatus="vs">
			<div class="comment_list">
				<div class="user_img">
					<c:if test="${comment.user_pic!=null}">
					<img src="${img_host}${comment.user_pic}" width="35" height="35" alt="">
					</c:if>
					<c:if test="${comment.user_pic==null}">
					<img src="<%=basePath%>shyl/images/temp.png" width="35" height="35" alt="">
					</c:if>
				</div>
				<div class="comment_txt">
					<div class="user_name">${comment.user_name}</div>
					<div class="user_comment">${comment.comment_text}</div>
				</div>
			</div>
			</c:forEach>
		</div>
		
	</section>
	
	
	<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="pswp__bg"></div>
        <div class="pswp__scroll-wrap">
            <div class="pswp__container">
                <div class="pswp__item"></div>
                <div class="pswp__item"></div>
                <div class="pswp__item"></div>
            </div>
            <div class="pswp__ui pswp__ui--hidden">
                <div class="pswp__top-bar">
                    <div class="pswp__counter"></div>
                    <button class="pswp__button pswp__button--close" title="Close (Esc)"></button>
                    <button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button>
                    <div class="pswp__preloader">
                        <div class="pswp__preloader__icn">
                            <div class="pswp__preloader__cut">
                                <div class="pswp__preloader__donut"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
                    <div class="pswp__share-tooltip"></div>
                </div>
                <button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)">
                </button>
                <button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)">
                </button>
                <div class="pswp__caption">
                    <div class="pswp__caption__center"></div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
	var items = [];
	var imgIndex;
	$(function(){
		var hasLike = $("input[name='has_like']").val();
		if(hasLike=="true"){
			$(".up_button").css("border","1px solid #1e8dff")
			$(".up_button").append("<style>.container .up .up_button:before{background: url(shyl/images/news/content-ups.png) top center no-repeat;}</style>");
		}
		
		$(".container .up .up_button").click(function(){
			var hasLike = $("input[name='has_like']").val();
			if(hasLike=="true"){
				//取消点赞
				$.ajax({
					type: "POST",
					url: "<%=basePath%>column/like.app",
					data:{user_id:$("input[name='user_id']").val(),news_id:$("input[name='news_id']").val(),like:false},
					dataType:"json",
					cache : false,
					success:function(data){
						if(data.errorCode=="200"){
							$("input[name='has_like']").val(false)
							var count = $(".up_button").text();
							count = parseInt(count)-1;
							$(".up_button").text(count)
							$(".up_button").css("border","1px solid #999999")
							$(".up_button").append("<style>.container .up .up_button:before{background: url(shyl/images/news/content-down.png) top center no-repeat;}</style>");
						}
					}
				});
			}else{
				//点赞
				$.ajax({
					type: "POST",
					url: "<%=basePath%>column/like.app",
					data:{user_id:$("input[name='user_id']").val(),news_id:$("input[name='news_id']").val(),like:true},
					dataType:"json",
					cache : false,
					success:function(data){
						if(data.errorCode=="200"){
							$("input[name='has_like']").val(true)
							var count = $(".up_button").text();
							count = parseInt(count) + 1;
							$(".up_button").text(count)
							$(".up_button").css("border","1px solid #1e8dff")
							$(".up_button").append("<style>.container .up .up_button:before{background: url(shyl/images/news/content-ups.png) top center no-repeat;}</style>");
						}
					}
				});
			}
		});
		
		
		
		$(".content img").click(function(event){
			//去除包裹img的a标签的跳转
			if($(this).parent().is("A")){
				$(this).parent().attr("href","javascript:void(0)")
			}
			//重置items
			items = [];
			var src = $(this).attr("src")
			$(".content img").each(function(index){
				var item;
				var thisSrc = $(this).attr("src")
				if(thisSrc==src){
					imgIndex = index;
				}
				
				var naturalWidth = document.getElementsByTagName("img")[index].naturalWidth,
				    naturalHeight = document.getElementsByTagName("img")[index].naturalHeight;
				if(naturalWidth==null || naturalHeight==null || naturalWidth=="undefined" || naturalHeight=='undefined'){
					naturalWidth = $(this).width();
					naturalHeight = $(this).height();
				}
				if(naturalWidth==null || naturalHeight==null || naturalWidth=="undefined" || naturalHeight=='undefined'){
					return false;
				}
				item = {
					src:thisSrc,
					w:naturalWidth,
					h:naturalHeight
				};
				items.push(item)
			});
			
			openPhotoSwipe();
			
		});
	});
	
	var openPhotoSwipe = function() {
	    var pswpElement = document.querySelectorAll('.pswp')[0];

	    // define options (if needed)
	    var options = {
	             // history & focus options are disabled on CodePen        
	        history: false,
	        focus: false,

	        showAnimationDuration: 0,
	        hideAnimationDuration: 0
	        
	    };
	    
	    var gallery = new PhotoSwipe( pswpElement, PhotoSwipeUI_Default, items, options);
	    gallery.init();
	    //跳转到点击的图片
	    gallery.goTo(imgIndex);
	    
	};

	
	function toComment(userId,newsId){
		location.href = "<%=basePath%>column/toComment.app?user_id="+userId+"&news_id="+newsId;
	}
</script>
    
</body>

</html>