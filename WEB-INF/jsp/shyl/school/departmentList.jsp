 <%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<title>院系管理_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
<jsp:include page="../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<script src="shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/jquery.min.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.js"></script>
<style type="text/css">
table{  
    table-layout:fixed; 
}
.tds {
    width:100%;  
    word-break:keep-all;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../common/left.jsp"><jsp:param value="43" name="menuType"/></jsp:include>
		<div class="mypage_right">
			<h2>院系管理</h2>
			<div>						
				<span style="font-size: 12px; padding-left: 10px;margin-right:100px; display: inline-block; vertical-align: bottom;border:1px solid #d2c7c7;width:86%;">
					<label style="color: red; ">※温馨提示：</label><label style="">所有添加过的院系的用户名为：院校、院系首字母的组合，密码为添加时输入的密码。</label><br/>
			</span></div>
			<div class="tab" style="margin-bottom:0;width: 850px;">
				<a href="<%=basePath%>department/departmentAdd.act" class="more" style="font-size: 1em;margin-right: 10px;">+&nbsp;&nbsp;新增</a>
				<form action="<%=basePath%>department/list.act" method="post" name="schoolform" id="schoolform">
					<input type="text" class="search" id="titlename" name="titlename" value="${pd.titlename}" maxlength="25" placeholder="请输入院系名称关键字" style="background-color: #ecf0f9;">
					<input type="submit" class="sbtnNew" value="搜索" onclick="search();" style="margin-top:0px;line-height: 46px;height: 46px;color: #ffffff;margin-left: 20px;">
				</form>
			</div>
			<div class="jianli">
				<table class="tableclass" style="width: 100%">
					<thead>
						<tr>
							<th style="width: 20%;text-align: center;">院系名称</th>
							<th style="width: 15%;text-align: center;">用户名</th>
							<th style="width: 15%;text-align: center;">联系人</th>
							<th style="width: 20%;text-align: center;">联系电话</th>
							<th style="width: 20%;text-align: center;">邮箱</th>
							<th style="text-align: center;width: 20%;">操作</th>
						</tr>
					</thead>
					<tbody>
					    <c:choose>
					        <c:when test="${not empty departmentList}">
					            <c:forEach items="${departmentList}" var="var" varStatus="vs">
									<tr>
										<td class="tds" style="text-align: center;" title="${var.school_name}">${var.school_name}</td>
										<td class="tds" style="text-align: center;" title="${var.user_name}">${var.user_name}</td>
										<td class="tds" style="text-align: center;" title="${var.contact}">${var.contact}</td>
										<td class="tds" style="text-align: center;" title="${var.contact_tel}">${var.contact_tel}</td>
										<td class="tds" style="text-align: center;" title="${var.mail}">${var.mail}</td>
										<td style="text-align: center;">
										    <a href="<%=basePath%>department/toEdit.act?school_id=${var.school_id}" class="modify">修改</a>
										    <%-- <a data-toggle='modal' data-target='#deledu' id="deljob_${var.school_id}" onclick="delTeacher('${var.school_id}');" class="delete">删除</a> --%>
										</td>
									</tr>
							    </c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5" style="text-align: center;">
										<span style="color: #ff6a00">没有相关数据</span>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<!-- 分页开始 -->
			<div class="page-header position-relative">
				<table style="width: 100%;">
					<tr>
						<td style="align: center;" align="center"><div
							class="pagination"
							style="padding-top: 15px; margin: 0 auto; font-size:12px; display: inline-block;">${page.platformPageStr}</div></td>
					</tr>
				</table>
			</div>
			<!-- 分页结束 -->
		</div>
		
	<div class="modal_h20 fade in" id="deledu" role="dialog"
		aria-labelledby="deledu" aria-hidden="false" data-backdrop="static">
		<div class="modal-dialog  modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<h4>您确定要删除吗？删除后不可恢复！</h4>
					<br> <br>
				</div>
				<input type="hidden" value="" id="delectinfoid">
				<div class="modal-footer">
					<button id="EduButton" type="button" class="btn btn-success"
						onclick="Delete()">确认</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
    <script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
	</div>
	<div class="clear"></div>
	<script type="text/javascript">
		//模态框初始加载合同
		function delTeacher(school_id) {
			$("#delectinfoid").val(school_id);
		}
		function Delete(){
			var id =$("#delectinfoid").val();
			location.href = "<%=basePath%>department/delSch.act?school_id="+id;
		}
		
		//检索
		function search(){
			top.jzts();
			$("#teachersForm").submit();
		}
</script>
<%@ include file="../common/footer.jsp"%>
</body>
</html>