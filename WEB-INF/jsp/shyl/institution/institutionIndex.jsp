<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv=”X-UA-Compatible” content="IE=EmulateIE7" />
<meta charset="utf-8" />
<base href="<%=basePath%>" />
<title>培训晋升_济南市服务外包公共服务平台</title>
<jsp:include page="../common/header.jsp"><jsp:param name="id" value="pxjs" /></jsp:include>
<link href="shyl/css/maincss/css.css" rel="stylesheet" type="text/css" />
<link href="shyl/css/maincss/peixun.css" rel="stylesheet" type="text/css" />
<script src="shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script type="text/javascript">
<!--禁止F5刷新-->
 document.onkeydown = function(e){  
    e = window.event || e;  
    var keycode = e.keyCode || e.which;  
    if(keycode == 116){  
        if(window.event){// ie  
            try{e.keyCode = 0;}catch(e){}  
            e.returnValue = false;  
        }else{// firefox  
            e.preventDefault();  
        }  
    }  
} 
		function Model() {

		}
		Model.prototype = {
			ajax:function(obj){
				var itemId=obj.prev().val();
				if(itemId!=''){
					
				
				$.ajax({
				    type : "POST",
				    url :  '<%=basePath%>courseapp/courses.app',
					data : {
						//查询参数
						itemOneId : itemId,
						courseFlag : 'all',
						page : '1',
						cusorder : 'new'
					},
					dataType : 'json',
					async : false,
					success : function(data) {
		    		if (data.flag == "0") {
		    			var html1='';
		    			var html2='';
						 $.each(data.data.result,
								function(i, tag) {
									html1 += '<li style="float: left; width: 230px;margin-top: 10px;">';
										html1 +='<a href=<%=basePath%>institution/notFreeCourse.act?classTypeId='
																+ tag.classTypeId
																+ ' target="_blank">';
														html1 += '<img style="width:230px;height:200px;border: 1px solid rgba(0, 0, 0, 0.14);-webkit-box-shadow: 5px 5px 10px #737373;border-radius: 9px;';
														html1 += '	-webkit-border-radius: 9px;-moz-border-radius: 9px;" src="'+tag.cover+'" />';
														html1 += '<span>'
																+ tag.name
																+ '</span></a></li>';
														if (i % 3 == 0) {
															html2 += "<li></li>";
														}
													});
									obj.find(".piclist").html(html1);
									obj.find(".list").html(html2);
									obj.slide({
										titCell : ".list li",
										mainCell : ".piclist",
										effect : "left",
										vis : 3,
										scroll : 3,
										delayTime : 800,
										trigger : "click",
										easing : "easeOutCirc"
									});
								}
							}
						});
			}
		},
		language : function() {
			var itemId = $(".a").prev().val();
			this.ajax($(".a"));
		},
		back : function() {
			var itemId = $(".b").prev().val();
			this.ajax($(".b"));
		},
		data : function() {
			var itemId = $(".c").prev().val();
			this.ajax($(".c"));
		},
		init : function() {
			var _this = this;
			//默认情况查询所有课程
			_this.language();
			_this.back();
			_this.data();
		}

	}
	$(document).ready(function() {
		var model = new Model();
		model.init();
	});
</script>
</head>
<body>
<script src="shyl/js/affairs/box.js" type="text/javascript"></script>
<!--<header开始>-->
<!--</header结束>-->
<!--<banner开始>-->
<div id="main" class="mbanner">
<input type="hidden" name="number" id="number" value="${num.num}"/>
    <ul class="b2">
    <c:choose>
	        <c:when test="${not empty bannerList}">
	    		<c:forEach items="${bannerList}" var="banner" varStatus="vs">
	    			<li><a  title="" target=""><img src="<%=basePath%>images/${banner.file_path}" style="width:1920px;height:430px;"></a></li>
	    		</c:forEach>
	    	</c:when>
	    	<c:otherwise>
			<li><a ><img src="<%=basePath%>shyl/images/banner/banner51.jpg"></a></li>
			<li><a ><img src="<%=basePath%>shyl/images/banner/calssroom1.jpg"></a></li>
			<li><a ><img src="<%=basePath%>shyl/images/banner/banner71.jpg"></a></li>
			<%-- <li><a ><img src="<%=basePath%>shyl/images/banner/banner8.jpg"></a></li> --%>
			</c:otherwise>
		</c:choose>
		</ul>
	<div class="num">
		<ul>
		</ul>
	</div>
</div>
<script>
var number = $('#number').val();
var width_banner = '';
if(number == 0){
	width_banner = -3*10;
}else{
	width_banner = -number*10;
}
$('.num').css("margin-left",width_banner);
$(".mbanner").slide({ titCell:".num ul" , mainCell:".b2" , effect:"fold", autoPlay:true, delayTime:500 , autoPage:true, defaultIndex:0 });
</script>
<!--</banner结束>-->
<div class="clear"></div>
<div class="mpx">
	<div class="px_1">
		<h1>最新课程：</h1>
		<c:choose>
			<c:when test="${not empty fenleiList}">
				<c:forEach items="${fenleiList}" var="fenlei" varStatus="vs">
					<c:if test="${vs.index < 6 && empty fenlei.parentId}">
						<a href='<%=basePath%>institution/webList.act?oneItemIdSearchKey=${fenlei.id}'>${fenlei.itemName }</a>
					</c:if>
				</c:forEach>
			</c:when>
		</c:choose>
	</div>
	<div class="px_2">
		<h1>热门课程：</h1>
		<c:choose>
			<c:when test="${not empty fenleiList}">
				<c:forEach items="${fenleiList}" var="fenlei" varStatus="vs">
					<c:if test="${vs.index >= 6 && empty fenlei.parentId}">
						<a href='<%=basePath%>institution/webList.act?oneItemIdSearchKey=${fenlei.id}'>${fenlei.itemName }</a>
					</c:if>
				</c:forEach>
			</c:when>
		</c:choose>
	</div>
	<div class="px_3">
		<a href="<%=basePath%>joblist/typeList.act?CATEGORY=3" class="px_3_i1"><h1>就业前景<span>领先一步 行业解读</span></h1></a>
		<a href="<%=basePath%>joblist/typeList.act?CATEGORY=4" class="px_3_i2"><h1>行业资讯<span>实时行情  技能解读</span></h1></a>
		<a href="<%=basePath%>joblist/typeList.act?CATEGORY=5" class="px_3_i3"><h1>就业动态<span>实时了解就业动态</span></h1></a>
		<a href="<%=basePath%>joblist/typeList.act?CATEGORY=0" class="px_3_i4"><h1>面试问题<span>专业 行业 咨询</span></h1></a>
	</div>
	<div class="px_4 color001">
		<i></i>
		<h1>前端开发＞<span>千里之行，始于足下 </span></h1>
		<div class="px_4_1">
			<span class="bg01"></span>
			<span class="bg02"></span>
			<input type="hidden" value="${languageItemId}"/>
			  <div class="scrollBox a"> 
			   <div class="ohbox"> 
			    <ul class="piclist">
			    </ul>
			   </div> 
			   <div class="pageBtn"> 
			    <span class="prev" style="top:40%">&lsaquo;</span> 
			    <span class="next" style="top:40%">&rsaquo;</span>
			    <ul class="list">
			    </ul> 
			   </div>
			  </div> 
		</div>
	</div>
	<div class="px_4 color002">
		<i></i>
		<h1>后端开发＞<span>个人能力提升</span></h1>
		<div class="px_4_1">
			<span class="bg01"></span>
			<span class="bg02"></span>
			<input type="hidden" value="${backItemId}"/>
			  <div class="scrollBox b"> 
			   <div class="ohbox"> 
			    <ul class="piclist"> 
			    </ul> 
			   </div> 
			   <div class="pageBtn"> 
			    <span class="prev" style="top:40%">&lsaquo;</span> 
			    <span class="next" style="top:40%">&rsaquo;</span>
			    <ul class="list">
			    </ul> 
			   </div>
			  </div> 
		</div>
	</div>
	<div class="px_4 color003">
		<i></i>
		<h1>数据相关＞<span>数据库知识<br />云计算、大数据知识等</span></h1>
		<div class="px_4_1">
			<span class="bg01"></span>
			<span class="bg02"></span>
			  <input type="hidden" value="${dataItemId}"/>
			  <div class="scrollBox c"> 
			   <div class="ohbox"> 
			    <ul class="piclist"> 
			    </ul> 
			   </div> 
			   <div class="pageBtn"> 
			    <span class="prev" style="top:40%">&lsaquo;</span> 
			    <span class="next" style="top:40%">&rsaquo;</span>
			    <ul class="list">
			    </ul> 
			   </div>
			  </div> 
		</div>
	</div>
</div>
<div class="clear"></div>
<!--<footer开始>-->
 	<jsp:include page="../common/footer.jsp"></jsp:include>
<!--</footer结束>-->
</body>
</html>
