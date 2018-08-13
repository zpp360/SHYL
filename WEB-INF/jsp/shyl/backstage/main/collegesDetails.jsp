<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- jsp文件头和头部 -->
<%@ include file="../../../system/admin/top.jsp"%>
<link rel="stylesheet" href="shyl/css/bootstrap.css" />
<link rel="stylesheet" href="static/css/thing.css" />
<style type="text/css">
input[disabled] {
background: #ffffff;
}
</style>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>

</head>
<body>
	<div class="container-fluid" id="main-container">
	<input type="hidden" value="${pd.logo}">
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<div class="row-fluid">
					<h4>院校信息</h4>
					<hr>
					<form action="" method="post" id="forms" class="form-horizontal">
						<div >
							<table >
								<tr style="height: 30px;" >
									<td style="width: 80px;"><B>院校名称：</B></td>
									<td><input type="text" value="${pd.school_name}"
										style="height: 20px; width: 300px;margin-top: 5px;" title="院校名称" disabled/></td>
									<td style="width: 110px;padding-left: 20px;"><B>组织机构代码：</B></td>
									<td><input type="text" value="${pd.organize_code}"
										style="height: 20px; width: 300px;margin-top: 5px;" title="组织机构代码" disabled/></td>
								</tr>
								<tr style="height: 30px;" >
									<td style="width: 120px;"><B>事业单位法人证书：</B></td>
									<td style="padding-top: 10px;padding-bottom: 10px;">
									<img onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="<%=basePath%>images/${pd.government_license}" alt="license" style="width: 248px; height: 176px;">
									</td>
									<td style="width: 100px;padding-left: 20px;"><B>院校Logo：</B></td>
									<td style="padding-top: 10px;padding-bottom: 10px;">
									<img onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="<%=basePath%>images/${pd.school_log}" alt="LOGO" style="width: 248px; height: 176px;">
									</td>
								</tr>
								<tr style="height: 30px;" >
									<td style="width: 100px;"><B>院校邮编：</B></td>
									<td><input type="text" value="${pd.zip_code}"
										style="height: 20px; width: 300px;margin-top: 5px;" title="院校邮编" disabled/></td>
									<td style="width: 100px;padding-left: 20px;"><B>院校网址：</B></td>
									<td><input type="text" value="${pd.website}"
										style="height: 20px; width: 300px;margin-top: 5px;" title="院校网址" disabled/></td>
								</tr>
								<tr style="height: 30px;" >
									<td style="width: 100px;"><B>院校联系人：</B></td>
									<td><input type="text" value="${pd.contact}"
										style="height: 20px; width: 300px;margin-top: 5px;" title="院校联系人" disabled/></td>
									<td style="width: 100px;padding-left: 20px;"><B>院校联系电话：</B></td>
									<td><input type="text" value="${pd.contact_tel}"
										style="height: 20px; width: 300px;margin-top: 5px;" title="院校联系电话" disabled/></td>
								</tr>
								<tr style="height: 30px;" >
									<td style="width: 100px;"><B>院校邮箱：</B></td>
									<td><input type="text" value="${pd.mail}"
										style="height: 20px; width: 300px;margin-top: 5px;" title="院校邮箱" disabled/></td>
								</tr>
								<tr style="height: 30px;" >
									<td style="width: 100px;"><B>院校地址：</B></td>
									<td colspan="3"><input type="text" value="${pd.address_province}${pd.address_city}${pd.address_detail}"
										style="height: 20px; width:95%;margin-top: 5px;" title="院校地址" disabled/></td>
								</tr>
								<tr style="height: 30px;" >
									<td style="width: 100px;"><B>院校介绍：</B></td>
									<td colspan="3">
										<textarea id="school_detail" name="school_detail" readonly="readonly"
											style="min-height: 100px; margin-top:5px;width:80%" title="院校介绍">${pd.school_detail}</textarea>
									</td>
								</tr>
							</table>
						</div>
						<div align="center" style="margin-top:20px;">
							<a class="btn  btn-light" onclick="returnback()"><i class=" icon-circle-arrow-left"></i>返回</a>
						</div>
						
						
					</form>
				</div>
				<!-- PAGE CONTENT ENDS HERE -->
			</div>
			<!--/row-->
		</div>
		<!--/#page-content-->
	</div>
	<!--/.fluid-container#main-container-->

	<!-- 返回顶部  -->
	<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse"> <i
		class="icon-double-angle-up icon-only"></i>
	</a>

	<!-- 引入 -->
	<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>

	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript" src="static/js/bootbox.min.js"></script>
	<!-- 确认窗口 -->
	<!-- 引入 -->
	
	<!-- 日期框 -->
	<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!--提示框-->
	<script type="text/javascript">
		//返回
	    function returnback(){
	    	window.location="<%=basePath%>operateCompany/list.do";
		}
	</script>
	<!-- 富文本编辑器start -->
	<!-- 配置文件 -->
	<script type="text/javascript" src="plugins/ueditor/ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript" src="plugins/ueditor/ueditor.all.js"></script>
	<!-- 实例化编辑器 -->
	<script type="text/javascript">
	
		var ue = UE.getEditor("school_detail",{readonly:true});
		//ueditor有标签文本

		function getContent() {
			var arr = [];
			arr.push(UE.getEditor('school_detail').getContent());
			return arr.join("");
		}

		function clean() {
			ue.setContent("");
		}

		function setFocus() {
			UE.getEditor('school_detail').focus();
		}
	</script>
	<!-- 富文本编辑器end -->
</body>
</html>