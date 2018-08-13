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
</style>
</head>
<body>
	<section class="container">
		<h1 class="title">${pd.news_title}</h1>
		<h2 class="subhead"><c:if test="${!empty pd.news_source}">${pd.news_source}&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</c:if>     ${pd.release_time} </h2>
		<div class="content">
			　　${pd.news_content}
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


</script>
    
</body>

</html>