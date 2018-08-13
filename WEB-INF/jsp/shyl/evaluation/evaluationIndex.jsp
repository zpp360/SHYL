<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!doctype html>
<html>
<head>
<meta http-equiv=”X-UA-Compatible” content=”IE=EmulateIE7″ />
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>测评_济南市服务外包公共服务平台</title>
<jsp:include page="../common/header.jsp"><jsp:param name="id" value="cp" /></jsp:include>
<link href="/SHYL/shyl/css/maincss/css.css" rel="stylesheet" type="text/css">
<link href="/SHYL/shyl/css/maincss/pingce.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="shyl/css/bootstrap.css">
<script type="text/javascript" src="shyl/js/question/jquery/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="shyl/js/question/bootstrap/js/bootstrap.min.js"></script>
<script src="/SHYL/shyl/js/mainjs/box.js" type="text/javascript"></script>
</head>
<body>
<!--<banner开始>-->
<div id="main" class="mbanner" style="height:430px">
<input type="hidden" name="number" id="number" value="${num.num}"/>
    <ul class="b2">
    <c:choose>
	        <c:when test="${not empty bannerList}">
	    		<c:forEach items="${bannerList}" var="banner" varStatus="vs">
	    			<li><a><img src="<%=basePath%>images/${banner.file_path}" style="width:1920px;height:430px;"></a></li>
	    		</c:forEach>
	    	</c:when>
	    	<c:otherwise>
        <li><a><img src="<%=basePath%>shyl/images/banner/cpbanner1.jpg"></a></li>
        <li><a><img src="<%=basePath%>shyl/images/banner/cpbanner2.jpg"></a></li>
        <li><a><img src="<%=basePath%>shyl/images/banner/cpbanner3.jpg"></a></li>
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
$(".mbanner").slide({ titCell:".num ul" , mainCell:".b2" , effect:"fold", autoPlay:true, delayTime:500 , autoPage:true });
</script>
<!--</banner结束>-->
<!--</banner结束>-->
<div class="clear"></div>
<div class="cp-index">
    <input type="hidden" value="${platUser.USER_ID}" id="loginstatus">
    <input type="hidden" value="${platUser.USER_TYPE}" id="user_type">
    <div class="cpall">
        <div class="fl"> <img src="<%=basePath%>shyl/images/evaluation/cpimg1.jpg" /> </div>
        <div class="cp-font fr">
            <h1>能力测试体系</h1>
            <h2>工作胜任的能力强弱</h2>
            <hr/>
            <p>能力测验旨在针对个人工作的潜力进行测评,该项测试可以用来预测在一定环境下人是否有能力胜任工作。</p>
            <a onclick="logint(13)" href="javascript:void(0)"><button>点击测试</button></a>
       </div>
       <div class="clear"></div>
   </div>
   <div class="cpall">
       <div class="cp-font fl">
       <h1>职业倾向测试</h1>
       <h2>心理特征和行为倾向</h2>
       <hr />
       <p>通过测试，它能帮助你更加清晰地分析自己的个性特性和自己最适合的工作环境，同时为自己提供相应的职业发展建议。让您更好地理解你自己、扩宽思路、规划职业生涯。</p>
       <a onclick="logint(12)" href="javascript:void(0)"><button>点击测试</button></a>
       </div>
       <div class="fr"> <img src="<%=basePath%>shyl/images/evaluation/cpimg2.jpg" /> </div>
       <div class="clear"></div>
   </div>
   <div class="cpall">
       <div class="fl"> <img src="<%=basePath%>shyl/images/evaluation/cpimg3.jpg" /> </div>
       <div class="cp-font fr">
       <h1>专业知识测试</h1>
       <h2>全面和符合要求的测试</h2>
       <hr />
       <p>本测试帮助测试者了解自身知识水平，有助于测试者充分了解自己，通过有针对性的自我调节，提高自身的知识储备，提高自身的专业知识水平。</p>
       <a href="<%=basePath%>evaluation/evaluationTestPaperList.act?field_id=8&point_id=00"><button>点击测试</button></a>
       </div>
       <div class="clear"></div>
   </div>
 </div>
<div class="clear"></div>
        <div class="modal fade bs-example-modal-sm" id="layhomewarn"
        role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm" style="margin-top: 250px">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                    </button>
                    <h4 class="modal-title" id="mySmallModalLabel">提示</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" value="" id="startid" name="startid">
                    请登录后操作！点此&nbsp;<a style="cursor: pointer;"
                        href="<%=basePath%>userLogin/goLogin.act?returnUrl=evaluation/evaluationIndex.act">
                        <b style="text-decoration: underline; color: #0a7295;">登录</b>
                    </a>
                </div>
            </div>
        </div>
    </div>
        <!-- 无权访问开始 -->
    <div class="modal fade bs-example-modal-sm" id="wqfw" role="dialog"
        aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm" style="margin-top: 250px">
            <div class="modal-content" style="width: 410px">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                    </button>
                    <h4 class="modal-title" id="mySmallModalLabel">提示</h4>
                </div>
                <div class="modal-body">
                    <div class="modal-body"
                        style="width: 410px; height: 60px; padding-top: 0px">
                        <h4>您无权限进行操作，请以个人用户登录！！</h4>
                        <br> <br>
                    </div>
                    <div class="modal-footer" style="height:15px" id="testPaperSubmit">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 无权访问结束 -->
<!--<footer开始>-->
<jsp:include page="../common/footer.jsp"></jsp:include>
<!--</footer结束>-->
     <script type="text/javascript">
        function logint(field_id){
        var userid = $('#loginstatus').val();
        var usertype = $('#user_type').val();
        if(userid==""){
            $("#layhomewarn").modal('show');
        }else if(usertype==1){
        	location.href='<%=basePath%>evaluation/abilityTest.act?field_id='+field_id;
        }else{
             $('#wqfw').modal('show');
            }
        }
        </script>
</body>
</html>