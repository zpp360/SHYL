<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv=”X-UA-Compatible” content=”IE=EmulateIE7″ />
<meta charset="utf-8">
<title>咨询服务详情_济南市服务外包公共服务平台</title>
<link href="<%=basePath%>shyl/css/integrated/zixun.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<script src="<%=basePath%>shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<jsp:include page="../common/header.jsp"><jsp:param name="id" value="zxfw" /></jsp:include>
<script src="<%=basePath%>shyl/js/jquery-1.7.2.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<script src="<%=basePath%>shyl/js/affairs/box.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/jquery.bxslider.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="<%=basePath%>shyl/css/maincss/jquery.bxslidernew.css" />
<style type="text/css">
.tit-t { 	
	width: 610px; 
	display: block;
	overflow: hidden;
	float:left;
 	white-space: nowrap;   
 	text-overflow: ellipsis; 
 	}
 .li-t{
 	width: 400px; 
	display: block;
	overflow: hidden;
	float:left;
 	white-space: nowrap;   
 	text-overflow: ellipsis;
 }
 .rc_qy_2 img{
 width:100%;
 }
 div.rc_qy_2{
	 word-wrap: break-word; 
	 word-break: normal; 
}
</style>
</head>
<body>
<div class="clear"></div>
<div class="rc_qy_paihang clearfix" >
    <div class="rc_qy_1">
        <h1 title="${pd.TITLE}" class="tit-t">${pd.TITLE}</h1>
        <div class="rc_qy_1_2">
            <ul>
                <li>服务类型：${pd.VALUE} </li>
                <li class="li-t" >联系人：${pd.PERSON}</li>
                <li>联系电话：${pd.TEL}</li>
            </ul>
        </div>
    </div>
    <h1>详情描述</h1>
    <div class="rc_qy_2">
    <c:if test="${pd.CONTENT == '' || pd.CONTENT == null}">&nbsp;&nbsp;&nbsp;没有相关描述</c:if>
    <c:if test="${pd.CONTENT != '' && pd.CONTENT != null}">${pd.CONTENT}</c:if>
    </div>
</div>

<div class="clear"></div>
<%@ include file="../common/footer.jsp"%>
</body>
</html>
