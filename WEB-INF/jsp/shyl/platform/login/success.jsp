<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
<base href="<%=basePath%>">
<title>提示页面</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->

<link href="static/login/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" href="shyl/css/bootstrap.css">
<link rel="stylesheet" href="shyl/css/styleRegist.css">
<script type="text/javascript" src="shyl/js/jquery-1.7.1.js"></script>

</head>
<body onLoad="javascript:countDown(5);">
	<div class="container-fluid">
		<div class="container">
			<div class="container">
				<div class="panel panel-default wapper">
					<div class="col-md-12">
						<div align="center">
							<div style="font-size:36px; margin-top:230px;">
								<img style="width: 50px; height: 50px;"
									src="<%=basePath%>shyl/images/successImg.jpg" alt=""> ${msg}
							</div>
							页面将在 <span style="font: '新宋体'; font-size: 18px; color: #FF0000"
								id="jump"></span> 秒后自动跳转
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function countDown(secs) {
		document.getElementById("jump").innerHTML = secs;
		if (--secs > 0) {
			setTimeout("countDown(" + secs + " )", 1000);
		} else {
			window.location.href = "<%=basePath%>${url}";
		}
	}
</script>

</html>