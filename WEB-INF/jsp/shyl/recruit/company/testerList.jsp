<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<title>测评管理_济南市服务外包公共服务平台</title>
<link rel="stylesheet" href="<%=basePath%>shyl/css/pagination.css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/maincss/css.css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/maincss/mypage.css">
<script src="<%=basePath%>shyl/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>shyl/js/jquery.tips.js"></script>
<script src="<%=basePath%>/shyl/js/layer/layer.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.min.js"></script>
<script src="<%=basePath%>plugins/attention/zDialog/zDrag.js"></script>
<script src="<%=basePath%>plugins/attention/zDialog/zDialog.js"></script>
<!--分页  -->
<script type="text/javascript" src="<%=basePath%>shyl/js/common/head.js"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript">
        $(function () {
            $('#mega-menu-8').dcMegaMenu({
                rowItems: '3',
                speed: 'fast',
                effect: 'fade'
            });
        });
    </script>
<style type="text/css">
table {
	table-layout: fixed;
}

.tds a {
	width: 100%;
	word-break: keep-all;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.tds {
	width: 100%;
	word-break: keep-all;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

input {
	text-align: center;
	border: none;
}

textarea {
	margin-left: 35px;
	margin-top: 15px;
	width: 800px;
	border: 0;
	resize: none;
	outline: none
}
</style>
</head>
<body id="top" style="background-color: #f7f7f7;">
	<%@ include file="../../common/header.jsp"%>
	<!--</header结束>-->
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param
				value="32" name="menuType" /></jsp:include>
		<div class="mypage_right">
			<h2>参与测试人员一览</h2>
			<div class="tab" style="margin-bottom: 0;">
				<form action="<%=basePath%>tester/list.act?id=${pd.id}" method="post" name="form1" id="form1">
					<input type="text" class="search" id="tester_name" name="tester_name" value="${pd.tester_name}" placeholder="测试人员姓名" style="background-color: #ecf0f9;text-align: left;">
					<input type="submit" class="sbtnNew" value="搜索" onclick="search();" style="margin-top:0px;line-height: 46px;height: 46px;color: #ffffff;margin-left: 20px;">
				</form>
			</div>
			<div class="jianli">
				<table class="tableclass">
					<thead>
						<tr>
							<th style="padding-left: 30px; text-align: left;">姓名</th>
							<th style="text-align: center;">测试日期</th>
							<th style="text-align: center;">测试结果</th>
							<th style="text-align: center;">测试项目名称</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty varList }">
							<tr>
								<td colspan="4" style="text-align: center;"><span
									style="color: #ff6a00">没有相关记录</span></td>
							</tr>
						</c:if>
						<c:forEach items="${varList}" var="var" varStatus="vs">
							<tr>
								<td style="padding-left: 30px;" class="tds"><a href="<%=basePath%>tester/show.act?user_id=${var.user_id}&id=${var.exam_paper_id}">${var.tester_name}</a></td>
								<td style="text-align: center;" class="tds">${var.insert_date}</td>
								<td style="text-align: center;"><a href="javascript:;"
									data-toggle="modal" class="more" data-target="#wtht"
									onclick="test('${var.exam_paper_id}','${var.user_id}')">${var.test_result}</a></td>
								<td style="text-align: center;">${var.exam_paper_name}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- 分页开始 -->
			<div class="page-header position-relative">
				<table style="width: 100%;">
					<tr>
						<td style="align: center;" align="center"><div
								class="pagination"
								style="padding-top: 15px; margin: 0 auto; font-size: 12px; display: inline-block;">${page.platformPageStr}</div></td>
					</tr>
				</table>
			</div>
			<!-- 分页结束 -->
		</div>
	</div>
	<script type="text/javascript">
	 //检索
	function search(){
		top.jzts();
		$("#form1").submit();
		
	}
	</script>

	<script type="text/javascript">
		function test(exam_paper_id, user_id){
			 $.ajax({
					type : "POST",
					url : '<%=basePath%>tester/goInfoN.act',
								data : {
									exam_paper_id : exam_paper_id,
									user_id : user_id
								},
								success : function(str) {
									layer.open({
									 	 title:'测评结果' ,
								         type: 1,
								         shadeClose : true,
								         scrollbar : true,
										 skin: 'layui-layer-rim', 
										 area: ['48%', 'auto'],
										 offset: ['15%', '25%'],
										 content: str
								   	});
								}
				
			});
			
		}
	</script>
	<%@ include file="../../common/footer.jsp"%>
</body>
</html>
