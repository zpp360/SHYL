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
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
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
				<h4>机构信息</h4>
					<hr>
					<form action="" method="post" id="forms" class="form-horizontal">
							<div>
								<table >
									<tr style="height: 30px;" >
										<td style="width: 80px;"><B>机构名称：</B></td>
										<td><input type="text" value="${pd.institutions_name}"
											style="height: 20px; width: 300px;margin-top: 5px;" title="机构名称" disabled/></td>
										<td style="width: 110px;padding-left: 20px;"><B>组织机构代码：</B></td>
										<td><input type="text" value="${pd.organize_code}"
											style="height: 20px; width: 300px;margin-top: 5px;" title="组织机构代码" disabled/></td>
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
										<td style="width: 120px;"><B>营业执照扫描件：</B></td>
										<td style="padding-top: 10px;padding-bottom: 10px;">
										<img onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="<%=basePath%>images/${pd.business_license}" alt="license" style="width: 248px; height: 176px;">
										</td>
										<td style="width: 100px;padding-left: 20px;"><B>机构logo：</B></td>
										<td style="padding-top: 10px;padding-bottom: 10px;">
										<img onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="<%=basePath%>images/${pd.logo}" alt="LOGO" style="width: 248px; height: 176px;">
										</td>
									</tr>
									<tr style="height: 30px;" >
										<td style="width: 100px;"><B>机构邮编：</B></td>
										<td><input type="text" value="${pd.zip_code}"
											style="height: 20px; width: 300px;margin-top: 5px;" title="机构邮编" disabled/></td>
										<td style="width: 100px;padding-left: 20px;"><B>机构网址：</B></td>
										<td><input type="text" value="${pd.website}"
											style="height: 20px; width: 300px;margin-top: 5px;" title="机构网址" disabled/></td>
									</tr>
									<tr style="height: 30px;" >
										<td style="width: 100px; "><B>联系人：</B></td>
										<td><input type="text" value="${pd.contact}"
											style="height: 20px; width: 300px;margin-top: 5px;" title="联系人" disabled/></td>
										<td style="width: 100px;padding-left: 20px;"><B>固定电话：</B></td>
										<td><input type="text" value="${pd.contact_tel}"
											style="height: 20px; width: 300px;margin-top: 5px;" title="固定电话" disabled/></td>
									</tr>
									<tr style="height: 30px;" >
										<td style="width: 100px;"><B>所属行业：</B></td>
										<td colspan="3"><input type="text" value="${pd.distinguish}"
											style="height: 20px; width: 95%;margin-top: 5px;" title="所属行业" disabled/></td>
									</tr>
									<tr style="height: 30px;" >
										<td style="width: 100px;"><B>机构地址：</B></td>
										<td colspan="3"><input type="text" value="${pd.province}${pd.city}${pd.address_detail}"
											style="height: 20px; width:95%;margin-top: 5px;" title="机构地址" disabled/></td>
									</tr>
									<tr style="height: 30px;" >
										<td style="width: 100px;"><B>培训课程：</B></td>
										<td colspan="3"><input type="text" value="${pd.course}"
											style="height: 20px; width: 95%;margin-top: 5px;" title="培训课程" disabled/></td>
									</tr>
									<tr style="height: 30px;" >
										<td style="width: 100px;"><B>学生就业情况：</B></td>
										<td colspan="3"><textarea id="employment" name="employment" readonly="readonly"
											style="min-height: 100px; margin-top:5px;width:80%" title="学生就业情况">${pd.employment}</textarea>
										</td>
									</tr>
									<tr style="height: 30px;" >
										<td style="width: 100px;"><B>师资情况：</B></td>
										<td colspan="3"><textarea id="teachers" name="teachers" readonly="readonly"
											style="min-height: 100px; margin-top:5px;width:80%" title="师资情况">${pd.teachers}</textarea>
										</td>
									</tr>
									<tr style="height: 30px;" >
										<td style="width: 100px;"><B>设备场地情况：</B></td>
										<td colspan="3"><textarea id="equipment_site" name="equipment_site" readonly="readonly"
											style="min-height: 100px; margin-top:5px;width:80%" title="设备场地情况">${pd.equipment_site}</textarea>
										</td>
									</tr>
									<tr style="height: 30px;" >
										<td style="width: 100px;"><B>机构介绍：</B></td>
										<td colspan="3">
											<textarea id="introduction_detail" name="introduction_detail" readonly="readonly"
												style="min-height: 100px; margin-top:5px;width:80%" title="机构介绍">${pd.introduction_detail}</textarea>
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
		//审批结果
	    function institution(institutions_id,user_status){
	    	window.location="<%=basePath%>manages/goEditS.do?institutions_id="+institutions_id+"&user_status="+user_status;
		}
	</script>
	<!-- 富文本编辑器start -->
	<!-- 配置文件 -->
	<script type="text/javascript" src="plugins/ueditor/ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript" src="plugins/ueditor/ueditor.all.js"></script>
	<!-- 实例化编辑器 -->
	<script type="text/javascript">
	
		var ueEm = UE.getEditor("employment",{readonly:true});
		var ueTe = UE.getEditor("teachers",{readonly:true});
		var ueEq = UE.getEditor("equipment_site",{readonly:true});
		var ueIn = UE.getEditor("introduction_detail",{readonly:true});
		//ueditor有标签文本

		function getContent() {
			var arr = [];
			arr.push(UE.getEditor('employment').getContent());
			arr.push(UE.getEditor('teachers').getContent());
			arr.push(UE.getEditor('equipment_site').getContent());
			arr.push(UE.getEditor('introduction_detail').getContent());
			return arr.join("");
		}

		function clean() {
			ueEm.setContent("");
			ueTe.setContent("");
			ueEq.setContent("");
			ueIn.setContent("");
		}

		function setFocus() {
			UE.getEditor('employment').focus();
			UE.getEditor('teachers').focus();
			UE.getEditor('equipment_site').focus();
			UE.getEditor('introduction_detail').focus();
		}
	</script>
	<!-- 富文本编辑器end -->
</body>
</html>

