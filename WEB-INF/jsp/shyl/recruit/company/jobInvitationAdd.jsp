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
<meta http-equiv=”X-UA-Compatible” content=”IE=EmulateIE7″ />
<meta charset="utf-8"/>
<base href="<%=basePath%>">
<title>添加职位邀请</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link href="shyl/css/platform/about.css" rel="stylesheet" type="text/css">
<link href="shyl/css/platform/bmap.css" rel="stylesheet" type="text/css">
<script type="text/javascript">	
	function GetDateT() {
		var d, s;
		d = new Date();
		s = d.getFullYear() + "年"; //取年份
		var mm = d.getMonth() + 1;
		if (mm < 10) {
			mm = "0" + mm;
		}
		s = s + mm + "月";//取月份
		var dd = d.getDate();
		if (dd < 10) {
			dd = "0" + dd;
		}
		s = s + dd + "日 "; //取日期
		var hh = d.getHours();
		if (hh < 10) {
			hh = "0" + hh;
		}
		s = s + hh + "时"; //取小时
		var MM = d.getMinutes();
		if (MM < 10) {
			MM = "0" + MM;
		}
		s = s + MM + "分"; //取分
		return (s);
	}
	function isOneSubmit() {
		var application_time = $("#application_time").val();
		if (application_time == "") {
			layer.tips('请输入面试开始时间', '#application_time', {
				tips : [ 2, '#AE81FF' ],
				maxWidth:110
			});
			$("#application_time").focus();
			return false;
		}
		var now_time = GetDateT();
		if (application_time < now_time) {
			layer.tips('面试开始时间不能小于当前时间', '#application_time', {
				tips : [ 2, '#AE81FF' ],
				maxWidth:110
			});
			$("#application_time").focus();
			return false;
		}
		
		var application_end_time = $("#application_end_time").val();
		if (application_end_time == "") {
			layer.tips('请输入面试结束时间', '#application_end_time', {
				tips : [ 2, '#AE81FF' ],
				maxWidth:110
			});
			$("#application_end_time").focus();
			return false;
		}
		if (application_end_time < application_time) {
			layer.tips('面试结束时间不能小于开始时间', '#application_end_time', {
				tips : [ 2, '#AE81FF' ],
				maxWidth:110
			});
			$("#application_end_time").focus();
			return false;
		}
		return true;
	}
	function sub() {
		if (isOneSubmit()) {
			var url = '<%=basePath%>company/addJobInvitation.act';
				var cvUserId = $("#cvUserId").val();
				var cvId = $("#cvId").val();
				var ids = $("#ids").val();
				var application_time = $("#application_time").val();
				var application_end_time = $("#application_end_time").val();
				var remarks = $("#remarks").val();
				$.ajax({
					type:"POST",
					url: url,
					data : {
						application_time : application_time,
						application_end_time : application_end_time,
						remarks : remarks,
						cvUserId : cvUserId,
						cvId : cvId,
						ids : ids
					},
					dataType : 'json',
					cache : false,
					success : function(data) {
						layer.closeAll();
						if ("success" == data.result) {
							layer.alert('职位邀请发送成功',{
								title:'提示'
							});
						}						
					}
				});
			}			
		}
</script>
<style type="text/css">
.inputtxt{height:44px;line-height:44px;color:#9a9a9a;border-radius:4px;width:56%;padding-left:1%;font-size:0.85em;float:left;}
.leftlable{width:22%;display:inline-block;float:left;text-align:right;padding-right:3%;line-height:50px;color: #404653;font-size:0.85em;position:relative;}
.leftlable i{color: #e54161;position: absolute;right: 11%;top:0;line-height: 56px;}
.btn-primary:hover, .btn-primary:focus, .btn-primary:active, .btn-primary.active, .open > .dropdown-toggle.btn-primary{background-color:#3c67ce; }
textarea {
	width:56%;padding-left:5px;border:1px solid #9a9a9a;border-radius:5px;font-size:0.85em;resize:none!important;line-height: normal;color:#9a9a9a;
}
textarea:HOVER {border:1px solid #566ef9}
.btn-primary{color: #fff;background-color:#4f70c0 ;border-color:#4f70c0}
div.cmain{margin-top: 0px;width: auto;min-height:auto;}
div.cml_1{width: 100%}
</style>
</head>
<body>	
<div class="clear"></div>
<div class="cmain">
	<div class="cml_1">
		<div class="cml_2 clearfix" style="background-color:white;">
			<div class="cml_content">
				<form action="<%=basePath%>company/addJobInvitation.act" method="post" name="Form" id="Form">
					<div class="cml_content_main">
						<ul>							
							<li>
								<label class="leftlable"><span style="color: red">*</span>面试开始时间：</label>
								<input type="text" name="application_time" id="application_time" class="inputtxt" 
								 onFocus="WdatePicker({dateFmt:'yyyy年MM月dd日 HH时mm分',isShowWeek:true})" 
								 onBlur="trim(this);" placeholder="请输入面试开始时间">
							</li>
							<li>
								<label class="leftlable"><span style="color: red">*</span>面试结束时间：</label>
								<input type="text" name="application_end_time" id="application_end_time" class="inputtxt" 
								 onFocus="WdatePicker({dateFmt:'yyyy年MM月dd日 HH时mm分',isShowWeek:true})" 
								 onBlur="trim(this);" placeholder="请输入面试结束时间">
							</li>
							<li>
								<label class="leftlable">备注信息：</label>
	                        	<textarea  rows="6"  id="remarks" name="remarks" placeholder="请输入备注信息" maxlength="500"></textarea>
							</li>														
							<li>
								<p class="text-center" data-toggle="modal" id="favpost"  data-target="">
								<a href="javascript:void(0);" class="save3" style="margin-left: 40%" onclick="sub()">发送邀请</a>
								</p>								
							</li>
						</ul>
					</div>	
					<input type="hidden" id="cvUserId" name="cvUserId" value="${pd.cvUserId}">
					<input type="hidden" id="cvId" name="cvId" value="${pd.cvId}">
					<input type="hidden" id="ids" name="ids" value="${pd.ids}">									
				</form>
			</div>
		</div>
	</div>
</div>
<div class="clear"></div>
</body>
</html>