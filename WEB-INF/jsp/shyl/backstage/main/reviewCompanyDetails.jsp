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
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<style type="text/css">
input[disabled] {
background: #ffffff;
}
</style>
</head>
<body>
	<div class="container-fluid" id="main-container">
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<div class="row-fluid">
					<h4>企业信息</h4>
					<hr>
					<form action="" method="post" id="forms" class="form-horizontal">
						<div >
							<table >
								<tr style="height: 30px;" >
									<td style="width: 80px;"><B>公司名称：</B></td>
									<td><input type="text" value="${pd.company_name}"
										style="height: 20px; width: 300px;margin-top: 5px;" title="公司名称" disabled/></td>
									<td style="width: 110px;padding-left: 20px;"><B>组织机构代码：</B></td>
									<td><input type="text" value="${pd.organize_code}"
										style="height: 20px; width: 300px;margin-top: 5px;" title="组织机构代码" disabled/></td>
								</tr>
								<tr style="height: 30px;" >
									<td style="width: 120px;"><B>营业执照扫描件：</B></td>
									<td style="padding-top: 10px;padding-bottom: 10px;">
									<img onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="<%=basePath%>images/${pd.business_license}" alt="license" style="width: 248px; height: 176px;">
									</td>
									<td style="width: 100px;padding-left: 20px;"><B>公司Logo：</B></td>
									<td style="padding-top: 10px;padding-bottom: 10px;">
									<img onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="<%=basePath%>images/${pd.logo}" alt="LOGO" style="width: 248px; height: 176px;">
									</td>
								</tr>
								<tr style="height: 30px;" >
									<td style="width: 100px;"><B>机构法人代表：</B></td>
									<td><input type="text" value="${pd.legal_representative}"
										style="height: 20px; width: 300px;margin-top: 5px;" title="机构法人代表" disabled/></td>
									<td style="width: 100px;padding-left: 20px;"><B>注册资金：</B></td>
									<td><input type="text" value="${pd.registered_capital}"
										style="height: 20px; width: 300px;margin-top: 5px;" title="注册资金" disabled/></td>
								</tr>
								<tr style="height: 30px;" >
									<td style="width: 100px;"><B>企业性质：</B></td>
									<td><input type="text" value="${pd.enterprise_nature}"
										style="height: 20px; width: 300px;margin-top: 5px;" title="企业性质" disabled/></td>
									<td style="width: 100px;padding-left: 20px;"><B>企业规模：</B></td>
									<td><input type="text" value="${pd.scale}"
										style="height: 20px; width: 300px;margin-top: 5px;" title="企业规模" disabled/></td>
								</tr>
								<tr style="height: 30px;" >
									<td style="width: 100px; "><B>注册时间：</B></td>
									<td><input type="text" value="${pd.registration_year}"
										style="height: 20px; width: 300px;margin-top: 5px;" title="注册时间" disabled/></td>
									<td style="width: 100px;padding-left: 20px;"><B>税号：</B></td>
									<td><input type="text" value="${pd.tax_number}"
										style="height: 20px; width: 300px;margin-top: 5px;" title="税号" disabled/></td>
								</tr>
								<tr style="height: 30px;" >
									<td style="width: 100px; "><B>业务分布：</B></td>
									<td><input type="text" value="${pd.service_distribution}"
										style="height: 20px; width: 300px;margin-top: 5px;" title="业务分布" disabled/></td>
									<td style="width: 100px;padding-left: 20px;"><B>公司邮编：</B></td>
									<td><input type="text" value="${pd.zip_code}"
										style="height: 20px; width: 300px;margin-top: 5px;" title="公司邮编" disabled/></td>
								</tr>
								<tr style="height: 30px;" >
									<td style="width: 100px; "><B>公司网址：</B></td>
									<td><input type="text" value="${pd.website}"
										style="height: 20px; width: 300px;margin-top: 5px;" title="公司网址" disabled/></td>
									<td style="width: 100px;padding-left: 20px;"><B>联系人：</B></td>
									<td><input type="text" value="${pd.contact}"
										style="height: 20px; width: 300px;margin-top: 5px;" title="联系人" disabled/></td>
								</tr>
								<tr style="height: 30px;" >
									<td style="width: 100px; "><B>固定电话：</B></td>
									<td><input type="text" value="${pd.contact_tel}"
										style="height: 20px; width: 300px;margin-top: 5px;" title="固定电话" disabled/></td>
									<td style="width: 100px;padding-left: 20px;"><B>E-mail：</B></td>
									<td><input type="text" value="${pd.mail}"
										style="height: 20px; width: 300px;margin-top: 5px;" title="E-mail" disabled/></td>
								</tr>
								<tr style="height: 30px;" >
									<td style="width: 100px;"><B>所属行业：</B></td>
									<td colspan="3"><input type="text" value="${pd.industry}"
										style="height: 20px; width: 95%;margin-top: 5px;" title="所属行业" disabled/></td>
								</tr>
								<tr style="height: 30px;" >
									<td style="width: 100px;"><B>公司地址：</B></td>
									<td colspan="3"><input type="text" value="${pd.address_province}${pd.address_city}${pd.address_detail}"
										style="height: 20px; width:95%;margin-top: 5px;" title="公司地址" disabled/></td>
								</tr>
								<tr style="height: 30px;" >
									<td style="width: 100px;"><B>公司介绍：</B></td>
									<td colspan="3">
										<textarea id="company_introduction" name="company_introduction" readonly="readonly"
											style="min-height: 100px; margin-top:5px;width:80%" title="公司介绍">${pd.company_introduction}</textarea>
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
	
		var ue = UE.getEditor("company_introduction",{readonly:true});
		//ueditor有标签文本

		function getContent() {
			var arr = [];
			arr.push(UE.getEditor('company_introduction').getContent());
			return arr.join("");
		}

		function clean() {
			ue.setContent("");
		}

		function setFocus() {
			UE.getEditor('company_introduction').focus();
		}
	</script>
	<!-- 富文本编辑器end -->
</body>
</html>

