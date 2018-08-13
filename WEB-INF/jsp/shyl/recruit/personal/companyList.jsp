<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv=”X-UA-Compatible” content=”IE=EmulateIE7″ />
<meta charset="utf-8">
<title>找工作_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">
<link href="/SHYL/shyl/css/maincss/css.css" rel="stylesheet" type="text/css">
<link href="/SHYL/shyl/css/maincss/rencai.css" rel="stylesheet" type="text/css">
<script src="/SHYL/shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="/SHYL/shyl/js/mainjs/box.js" type="text/javascript"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	var id2 = $("#enterprise_nature").val();
	if (id2 == "") {
		$("#typeqb").addClass("hover");
	} else {
		$("#type"+id2).addClass("hover");
	}
});
function jobSearch(id) {
	if (id < 10) {
		id="0"+id;
		
	}
	if (id == "###") {
		$("#typeqb").addClass("hover");
		$("#enterprise_nature").val("");
	} else {
		$(".type a").removeClass("hover");
		$("#type"+id).addClass("hover");
		$("#enterprise_nature").val(id);
	}
	$("#Form").submit();
}
function jobKensaku() {
	$("#Form").submit();
}
</script>
</head>
<body>
<!--<header开始>-->
<jsp:include page="../../common/header.jsp"><jsp:param name="id" value="rctd" /></jsp:include>
<!--</header结束>-->
<form action="<%=basePath%>joblist/toCompanyList.act" method="post" name="Form" id="Form">
<div class="clear"></div>
	<div class="rc_qy_paihang clearfix">
		<div class="rc_qy_category">
			<dl><dt>类型：</dt>
				<dd class="type">
					<a id ="typeqb" style="cursor: pointer;" onclick="jobSearch('###')">不限</a>
				    <!-- 开始循环 -->	
					<c:choose>
						<c:when test="${not empty companyTypeList}">
							<c:forEach items="${companyTypeList}" var="var" varStatus="vs">
								<a id="type${var.DISTINGUISH_ID}" style="cursor: pointer;" onclick="jobSearch(${var.DISTINGUISH_ID})">${var.VALUE}</a>
						</c:forEach>
						</c:when>
					</c:choose>
					<input type="hidden" id="enterprise_nature" name="enterprise_nature" value="${pd.enterprise_nature}"/>
				</dd>
			</dl>
			<dl>
				<dt>搜索 :</dt>
				<dd>
					<input type="text" class="search2" style="padding-left: 5px;" placeholder="请输入公司名称" id="company_name"  name="company_name"   value="${pd.company_name}">
					<input type="button" class="searchbtn" value="搜索" onclick="jobKensaku();">
				</dd>
			</dl>
		</div>
		<div class="rc_qy_list">
			<ul>
				<c:choose>
					<c:when test="${not empty companyList}">
						<c:forEach items="${companyList}" var="var" varStatus="vs">
							<c:if test="${vs.index%3!=2}">
								<li>
									<a href="<%=basePath%>company/info.act?companyId=${var.USER_ID}" >
										<i></i>
										<c:if test="${not empty var.PICTURE_PATH}">
											<div class="img"><img style="width: 290px; height: 150px;" onerror="showImgDelay(this,'<%=basePath%>shyl/images/sys_logo.png');" src="<%=basePath%>images/${var.PICTURE_PATH}"></div>
										</c:if>
										<c:if test="${empty var.PICTURE_PATH}">
											<div class="img"><img style="width: 290px; height: 150px;" src="<%=basePath%>shyl/images/img.png"></div>
										</c:if>
										<div class="rc_qy_list_1">
											<c:if test="${not empty var.LOGO}">
												<div class="img2"><img onerror="showImgDelay(this,'<%=basePath%>shyl/images/mylogo.jpg');" style="width: 80px; height: 80px;" src="<%=basePath%>images/${var.LOGO}"></div>
											</c:if>
											<c:if test="${empty var.LOGO}">
												<div class="img2"><img style="width: 80px; height: 80px;" src="<%=basePath%>shyl/images/mylogo.jpg"></div>
											</c:if>
											<h1 title="${var.COMPANY_NAME}">
											<c:choose> 
											     <c:when test="${fn:length(var.COMPANY_NAME) > 10}"> 
											      <c:out value="${fn:substring(var.COMPANY_NAME, 0, 10)}..." /> 
											     </c:when> 
											     <c:otherwise> 
											      <c:out value="${var.COMPANY_NAME}" /> 
										     </c:otherwise>
										    </c:choose>
											 </h1>
											<p>
												<b>更新时间<br/><strong>${var.UPDATE_TIMESTAMP}</strong></b>
												<label>公司地址：</label>${var.ADDRESS_PROVINCE}${var.ADDRESS_CITY}<br />
												<label>联系人：</label>${var.CONTACT}<br />
												<label>联系电话：</label>${var.CONTACT_TEL}<br />
											</p>
										</div>
									</a>
								</li>
							</c:if>
							<c:if test="${vs.index%3==2}">
								<li class="nomargin">
									<a href="<%=basePath%>company/info.act?companyId=${var.USER_ID}">
										<i></i>
										<c:if test="${not empty var.PICTURE_PATH}">
											<div class="img"><img style="width: 290px; height: 150px;" onerror="showImgDelay(this,'<%=basePath%>shyl/images/sys_logo.png');" src="<%=basePath%>images/${var.PICTURE_PATH}"></div>
										</c:if>
										<c:if test="${empty var.PICTURE_PATH}">
											<div class="img"><img style="width: 290px; height: 150px;" src="<%=basePath%>shyl/images/img.png"></div>
										</c:if>
										<div class="rc_qy_list_1">
											<c:if test="${not empty var.LOGO}">
												<div class="img2"><img onerror="showImgDelay(this,'<%=basePath%>shyl/images/mylogo.jpg');" style="width: 80px; height: 80px;" src="<%=basePath%>images/${var.LOGO}"></div>
											</c:if>
											<c:if test="${empty var.LOGO}">
												<div class="img2"><img style="width: 80px; height: 80px;" src="<%=basePath%>shyl/images/mylogo.jpg"></div>
											</c:if>
											<h1 title="${var.COMPANY_NAME}">
											<c:choose> 
											     <c:when test="${fn:length(var.COMPANY_NAME) > 10}"> 
											      <c:out value="${fn:substring(var.COMPANY_NAME, 0, 10)}..." /> 
											     </c:when> 
											     <c:otherwise> 
											      <c:out value="${var.COMPANY_NAME}" /> 
										     </c:otherwise>
										    </c:choose>
											 </h1>
											<p>
												<b>更新时间<br/><strong>${var.UPDATE_TIMESTAMP}</strong></b>
												<label>公司地址：</label>${var.ADDRESS_PROVINCE}${var.ADDRESS_CITY}<br />
												<label>联系人：</label>${var.CONTACT}<br />
												<label>联系电话：</label>${var.CONTACT_TEL}<br />
											</p>
										</div>
									</a>
								</li>
							</c:if>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="100" class="center">没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<div class="page-header position-relative">
			<table style="width: 100%;">
				<tr>
					<td style="align: center;" align="center">
						<div class="pagination" style="padding-top: 0px; margin: 0 auto; display: inline-block;">${page.platformPageStr}</div></td>
				</tr>
			</table>
		</div>
	</div>
<div class="clear"></div>
</form>
<!--<footer开始>-->
<jsp:include page="../../common/footer.jsp"></jsp:include>
<!--</footer结束>-->
</body>
</html>
