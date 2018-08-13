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
<html>

	<head>
		<meta charset="UTF-8">
		<title>购买</title>
	</head>
	<body style="background-color: #f7f7f7;">
		<div class="deng">
			<img src="<%=basePath%>shyl/images/course/pay1.png" style="" />
		</div>
		<div class="deng">
			<table style="margin-left: 30px;">
				<tr >
					<td><span style="color: #888888;">支付方式：</span></td>
					<td>
						<div style="border:1px solid #FF7905;padding: 1px 5px;" onclick="weixin();">
							<a href="#" style="text-decoration:none;color:#000000;">
								<span style="font-size: 12px;">
									微信支付
								</span>
							</a>
						</div>
					</td>
					<td>
						<div style="border:1px solid #FF7905;padding: 1px 5px;">
							<a href="#" style="text-decoration:none;color:#000000;">
								<span style="font-size: 12px;">
									支付宝
								</span>
							</a>
						</div>
					</td>
					<td>
						<div style="border:1px solid #FF7905;padding: 1px 5px;">
							<a href="#" style="text-decoration:none;color:#000000;">
								<span style="font-size: 12px;">
									银行卡
								</span>
							</a>
						</div>
					</td>
					<td style="width:27px;"></td>
				</tr>
				<tr style="height: 10px;"></tr>
				<tr>
					<td><span style="color: #888888;">支付金额：</span></td>
					<td><span style="color: #E8536D;">29.9</span>元</td>
				</tr>
				<tr style="height: 10px;"></tr>
				<tr>
					<td></td>
					<td></td>
					<td colspan="3">
						<div id="payImg" style="display:none;margin-left: -18px;">
							<img src="<%=basePath%>shyl/images/course/timg.jpg" style="width:150px;">
						</div>
					</td>
					
				</tr>
			</table>
		</div>
	</body>
	<script type="text/javascript" src="/SHYL/shyl/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
		function weixin(){
			$("#payImg").css("display","block");
		}
	
	
	</script>

</html>