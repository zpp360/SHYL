<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv=”X-UA-Compatible” content=”IE=EmulateIE7″ />
<meta charset="utf-8"/>
<title>咨询服务一览_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>"/>
<link href="/SHYL/shyl/css/maincss/css.css" rel="stylesheet" type="text/css">
<link href="/SHYL/shyl/css/integrated/zixun.css" rel="stylesheet" type="text/css">
 
<script src="/SHYL/shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="/SHYL/shyl/js/mainjs/box.js" type="text/javascript"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<link rel="stylesheet" href="shyl/css/bootstrap.css">
<link rel="stylesheet" href="shyl/css/styleRegist.css">
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
    var id2 = $("#leixing").val();
    if (id2 == "/") {
        $("#typeqb").addClass("hover");
    } else {
        $("#type"+id2.replace("/","")).addClass("hover");
    }
});
function msgSearch(id) {
    var f = document.createElement("form");
    document.body.appendChild(f);
    f.action = "<%=basePath%>consultancy/consultancyList.act";

    var WorkTypeID = document.createElement("input");
    WorkTypeID.type = "hidden";
    f.appendChild(WorkTypeID);
    WorkTypeID.name = "TYPE";
    WorkTypeID.id = "TYPE";

    $("#leixing").val(id);
    if (id == "###") {
        $("#typeqb").addClass("hover");
    } else {
        $(".type a").removeClass("hover");
        $("#type"+id).addClass("hover");
        WorkTypeID.value = $("#leixing").val().replace("/","");
    }
    f.submit();
}
function btnSearch() {
    var f = document.createElement("form");
    document.body.appendChild(f);
    f.action = "<%=basePath%>consultancy/consultancyList.act";
    f.method="post";

    var WorkTypeID = document.createElement("input");
    WorkTypeID.type = "hidden";
    f.appendChild(WorkTypeID);
    WorkTypeID.name = "TYPE";
    WorkTypeID.id = "TYPE";
    WorkTypeID.value = $("#leixing").val().replace("/","");
    
    var msgName = document.createElement("input");
    msgName.type = "hidden";
    f.appendChild(msgName);
    msgName.name = "KEY_WORD";
    msgName.id = "KEY_WORD";
    msgName.value = $("#msgName").val().replace("/","");
    f.submit();
}
function reportStatus(person,tel){
	$('#modal-body-alert').html("联系人："+person+"<br>联系电话："+tel);
	$('#my-modal-view-alerts').show();
}
function ClearV() {
    $('#my-modal-view-alerts').hide();
}
</script>
</head>
<body>
    <!--<header开始>-->
    <jsp:include page="../common/header.jsp"><jsp:param name="id" value="zxfw" /></jsp:include>
    <!--</header结束>-->
    <form action="<%=basePath%>consultancy/consultancyList.act" method="post"
        name="Form" id="Form" style="margin-top:15px">
		<input type="hidden" name="TYPE" id="TYPE" value="${pd.TYPE}"/>
        <div class="clear"></div>
        <div class="rc_qy_paihang clearfix">
            <div class="rc_qy_category">
                <dl>
                    <dt>类型：</dt>
                    <dd class="type">
                        <a id="typeqb" style="cursor: pointer;" onclick="msgSearch('###')">不限</a>
                        <!-- 开始循环 -->
                        <c:choose>
                            <c:when test="${not empty consultancyType}">
                                <c:forEach items="${consultancyType}" var="var" varStatus="vs">
                                    <a id="type${var.DISTINGUISH_ID}" style="cursor: pointer;" onclick="msgSearch(${var.DISTINGUISH_ID})" title="${var.VALUE}" >${var.VALUE}</a>
                                </c:forEach>
                            </c:when>
                        </c:choose>
                        <input type="hidden" id="leixing" value=${pd.TYPE}/>
                    </dd>
                </dl>
                <dl>
                    <dt>搜索 :</dt>
                    <dd>
                        <input type="text" class="search2" style="padding-left: 5px;"
                            placeholder="请输入需要咨询的关键字" id="msgName" value="${pd.KEY_WORD}" onblur="trim(this);" maxlength="50"/>
                        <input type="button" class="searchbtn" value="搜索"
                            onclick="btnSearch();" />
                    </dd>
                </dl>
            </div>
            <div class="recruit_list">
                <table style="margin-top:130px">
                    <!-- 开始循环 -->
                    <c:choose>
                        <c:when test="${not empty consultancyList}">
                            <c:forEach items="${consultancyList}" var="var" varStatus="vs">
                                <tr >
                                    <c:if test="${var.LOGO == '' || var.LOGO == null}">
                                        <th rowspan="2" style="width:5em;height:4em;">
                                            <img style="width:4em;height:4em;" src="<%=basePath%>shyl/images/mylogo.jpg"/>
                                        </th>
                                    </c:if>
                                    <c:if test="${var.LOGO != '' && var.LOGO != null}">
                                        <th rowspan="2" style="width:5em;height:4em;">
                                            <img style="width:4em;height:4em;" onerror="showImgDelay(this,'<%=basePath%>shyl/images/mylogo.jpg');" src="<%=basePath%>images/${var.LOGO}"/>
                                        </th>
                                    </c:if>
                                    <th colspan="2" style="color: #111f42; font-size: 1em;padding-top:10px;"><a
                                        href="<%=basePath%>consultancy/consultancyDetail.act?id=${var.ID}" title="${var.TITLE}"
                                        target="_blank"><b>${var.TITLE}</b></a></th>
                                    <th rowspan="2">
                                        <a href="javascript:void(0);" data-toggle="modal" onclick="reportStatus('${var.PERSON}','${var.TEL}')" id="reportStatus" style="margin-left:10px;margin-right:50px;">立即咨询</a>
                                    </th>
                                </tr>
                                <tr>
                                    <td ><a href="<%=basePath%>company/info.act?companyId=${var.COMPANY_ID}"
                                        target="_blank" title="${var.COMPANY_NAME}">${var.COMPANY_NAME}</a></td>
                                    <td style="color: #797979; font-size: 0.85em">更新日期：${var.UPDATE_DATE}</td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                                <tr>
									<td colspan="7" style="text-align:center;">
                                    <span style="color: #ff6a00">没有相关数据</span></td>
								</tr>
                        </c:otherwise>
                    </c:choose>
                </table>
            </div>
            <div class="page-header position-relative">
                <table style="width: 100%;">
                    <tr>
                        <td style="align: center;" align="center">
                            <div class="pagination" style="padding-top: 0px; margin: 0 auto; display: inline-block;">${page.platformPageStr}</div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="clear">
        </div>
    </form>
    <div class="modal_h20 fade bs-example-modal-sm in"id='my-modal-view-alerts'>
        <div class="modal-content" style="color:#CC9933;width:300px;text-align:center;position:fixed;right:40%;bottom:45%;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                    onclick="ClearV()">
                    <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">联系方式</h4>
            </div>
            <div class="modal-body" id='modal-body-alert'>
            </div>
        </div>
    </div>
    
    <!--<footer开始>-->
    <jsp:include page="../common/footer.jsp"></jsp:include>
    <!--</footer结束>-->
</body>
</html>
