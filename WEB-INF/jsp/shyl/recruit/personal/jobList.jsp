<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<jsp:include page="../../common/header.jsp"><jsp:param name="id" value="rctd" /></jsp:include>
<link href="<%=basePath%>shyl/css/maincss/rencai.css" rel="stylesheet" type="text/css">
<script src="<%=basePath%>shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/box.js" type="text/javascript"></script>
<style type="text/css">
table{  
    table-layout:fixed; 
}  
.tds a{  
    width:100%;  
    word-break:keep-all;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
}
.tds {  
    width:100%;  
    word-break:keep-all;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
}
</style>
<script type="text/javascript">
function jobSearch(type, id) {
	if ("fd" == type) {
		$("#JobType").val(id);
	} else if ("type" == type) {
		$("#WorkTypeID").val(id);
	} else if ("salary" == type) {
		$("#Salary").val(id);
	} else if ("oriented_group" == type) {
		$("#Oriented_group").val(id);
	}
	$("#Form").submit();
}
</script> 
</head>
<body>
<!--<header开始>-->
<!--</header结束>-->

<div class="clear"></div>
<form action="<%=basePath%>joblist/tolist.act" method="post" name="Form" id="Form">

<div class="rc_qy_paihang clearfix" style="margin-top: 100px;padding-bottom:20px;">
	<div class="rc_zw_category">
		<dl><dt>职位：</dt>
			<dd class="fd7">
				<a id ="fdqb" href="#" onclick="jobSearch('fd','')" <c:if test="${pd.JobType == null or pd.JobType == ''}">class='hover'</c:if>>全部</a>
			    <!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty industryList}">
						<c:forEach items="${industryList}" var="var" varStatus="vs">
							<a id="fd${var.DISTINGUISH_ID}" href="#" <c:if test="${pd.JobType == var.DISTINGUISH_ID}">class='hover'</c:if> onclick="jobSearch('fd','${var.DISTINGUISH_ID}')">${var.VALUE}</a>
					</c:forEach>
					</c:when>
				</c:choose>
				<input type="hidden" id="JobType" name="JobType" value="${pd.JobType}" />
			</dd>
		</dl>
		<dl>
			<dt>类型 :</dt>
			<dd class="type">
				<a id ="typeqb" href="#" onclick="jobSearch('type','')" <c:if test="${pd.WorkTypeID == null or pd.WorkTypeID == ''}">class='hover'</c:if>>不限</a>
			    <!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty jobTypeList}">
						<c:forEach items="${jobTypeList}" var="var" varStatus="vs">
							<a id="type${var.DISTINGUISH_ID}" href="#" <c:if test="${pd.WorkTypeID == var.DISTINGUISH_ID}">class='hover'</c:if> onclick="jobSearch('type','${var.DISTINGUISH_ID}')">${var.VALUE}</a>
					</c:forEach>
					</c:when>
				</c:choose>
				<input type="hidden" id="WorkTypeID"  name="WorkTypeID"  value="${pd.WorkTypeID}"/>
			</dd>
		</dl>
		<dl>
			<dt>范围 :</dt>
			<dd class="type">
				<a id ="oriented_groupqb" href="#" onclick="jobSearch('oriented_group','')" <c:if test="${pd.Oriented_group == null or pd.Oriented_group == ''}">class='hover'</c:if>>不限</a>
			    <a id="oriented_group0" href="#" onclick="jobSearch('oriented_group','0')" <c:if test="${pd.Oriented_group == '0'}">class='hover'</c:if>>社会招聘</a>
			    <a id="oriented_group1" href="#" onclick="jobSearch('oriented_group','1')" <c:if test="${pd.Oriented_group == '1'}">class='hover'</c:if>>校园招聘</a>
				<input type="hidden" id="Oriented_group" name="Oriented_group"  value="${pd.Oriented_group}"/>
			</dd>
		</dl>
		<dl>
			<dt>月薪 :</dt>
			<dd class="salary">
				<a id ="salaryqb" href="#" onclick="jobSearch('salary','')" <c:if test="${pd.Salary == null or pd.Salary == ''}">class='hover'</c:if>>不限</a>
				<c:choose>
					<c:when test="${not empty salRangeList}">
						<c:forEach items="${salRangeList}" var="var" varStatus="vs">
							<a  id="salary${var.DISTINGUISH_ID}" href="#" <c:if test="${pd.Salary == var.DISTINGUISH_ID}">class='hover'</c:if> onclick="jobSearch('salary','${var.DISTINGUISH_ID}')">${var.VALUE}</a>
					</c:forEach>
					</c:when>
				</c:choose>
				<input type="hidden" id="Salary"  name="Salary"  value="${pd.Salary}"/>
			</dd>
		</dl>
		<dl>
			<dt>搜索 :</dt>
			<dd>
				<input type="text" class="search2" placeholder="请输入职位名称关键词" id="JobName" value="${pd.JobName}" name="JobName" style="padding-left:10px"/><input type="submit" class="searchbtn" value="搜索"/>
			</dd>
		</dl>
		
	</div>
</div>
<div class="recruit_list">
	<table>
		<thead>
			<tr>
				<td>职位名称</td>
				<td>公司名称</td>
				<td>区域</td>
				<td>薪资</td>
			</tr>
		</thead>
		<tbody>
            <!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty varList}">
						<c:forEach items="${varList}" var="var" varStatus="vs">
							<tr>
								<td class="tds" style="color: #111f42;font-size: 1em"><a href="<%=basePath%>job/detail/info.act?companyId=${var.USER_ID}&positionId=${var.RECRUITMENT_INFO_ID}&flag=findJob" target="_blank" title="${var.POSITION_NAME}">${var.POSITION_NAME}</a></td>
								<td class="tds" style="color: #111f42;font-size: 1em"><a href="<%=basePath%>company/info.act?companyId=${var.USER_ID}" target="_blank" title="">${var.COMPANY_NAME}</a></td>
								<td style="color: #111f42;font-size: 1em">${var.WORK_PLACE_CITY}</td>
								<td style="color: #f42328;font-size: 1em">${var.SALARY}</td>
							</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
				<tr><td align="center" colspan="4" style="color: #000000; font-size: 16px; ">没有相关数据</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
					<div class="page-header position-relative">
						<table style="width: 100%;">
							<tr>
								<td style="align: center;" align="center"><div
										class="pagination"
										style="padding-top: 0px; margin: 0 auto; display: inline-block;">${page.platformPageStr}</div></td>
							</tr>
						</table>
					</div>
</form>
<div class="clear"></div>
<!--<footer开始>-->
<%@ include file="../../common/footer.jsp"%>
<!--</footer结束>-->
</body>
</html>
