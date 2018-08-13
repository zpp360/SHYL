<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>项目竞标详情编辑画面_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/uploadify.css">
<script src="<%=basePath%>shyl/js/jquery-1.7.2.js"></script>
<script src="<%=basePath%>shyl/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>shyl/js/jquery.min.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.min.js"></script>
<script src="<%=basePath%>shyl/js/datepicker/WdatePicker.js" type="text/javascript"></script>
<link href="<%=basePath%>shyl/css/maincss/mypage.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<style type="text/css">
.textareatxt2{
	background-color: #f7f7f7 !important ;
}
.edui-default .edui-editor {
	background-color: #ecf0f9 !important ;
}
div.mypage_right div.input_class ul li span {
	width: 130px !important ;
}
.select_btnNew {
display: inline-block;
margin-bottom: 0;
font-size: 14px;
line-height: 42px;
color: #333;
text-align: center;
text-shadow: 0 1px 1px rgba(255,255,255,0.75);
vertical-align: middle;
cursor: pointer;
background-color: #f5f5f5;
background-repeat: repeat-x;
border: 1px solid #ccc;
border-color: #e6e6e6 #e6e6e6 #bfbfbf;
border-color: rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);
border-bottom-color: #b3b3b3;
-webkit-border-radius: 4px;
-moz-border-radius: 4px;
border-radius: 4px;
filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff',endColorstr='#ffe6e6e6',GradientType=0);
filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
-webkit-box-shadow: inset 0 1px 0 rgba(255,255,255,0.2),0 1px 2px rgba(0,0,0,0.05);
-moz-box-shadow: inset 0 1px 0 rgba(255,255,255,0.2),0 1px 2px rgba(0,0,0,0.05);
box-shadow: inset 0 1px 0 rgba(255,255,255,0.2),0 1px 2px rgba(0,0,0,0.05);
}
.btnNew {
float:left; margin-top:5px; width:275px;
}

</style>


</head>
<body id="top" style="background-color: #f7f7f7;">
	<!--<header开始>-->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!--</header结束>-->
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../common/left.jsp"><jsp:param value="19" name="menuType"/></jsp:include>
		<div class="mypage_right">
		<input id="appendix_path" type="hidden" value="${pd.appendix_path}">
		
		<input id="bid_company_id" type="hidden" value="${pd.bid_company_id}">
		
		<input id="project_id" type="hidden" value="${pd.project_id}">
			<h2>竞标管理/项目竞标修改：</h2>
			<!--竞标内容修改开始-->
			<div class="input_class" >
			<form>
				<ul >
					<li>
						<span class="detail-name">
							<small style="color:red">*</small>&nbsp; 联系人:</span> 
						<input id="contact" name="contact" type="text" 
							value="${pd.contact}" maxlength="50" class="inputtxt2" onblur="trim(this);">
					</li>
				</ul>
				<ul >
					<li>
						<span class="detail-name">
							<small style="color:red">*</small>&nbsp; 联系电话:</span> 
						<input id="contact_tel" name="contact_tel" type="text" value="${pd.contact_tel}"
							maxlength="20" class="inputtxt2" onblur="trim(this);">
					</li>
				</ul>
				<ul >
					<li>
						<span class="detail-name">
							<small style="color:red">*</small>&nbsp;E-Mail:</span>
						 <input id="email" name="email" type="text" value="${pd.email}"
							maxlength="50" class="inputtxt2" onblur="trim(this);">
					</li>
				</ul>
				<ul style="margin-top: 0px">
					<li style="height:150px;width: 100%;">
					     <span>竞标方案:</span>
	                        <textarea style="width:700px;padding-left:5px;background-color:#ecf0f9;border:0;border-radius:5px;font-size:0.85em;resize:none!important;" rows="4" maxlength="500" id="detail_description" name="Introduction"maxlength="500" >${pd.detail_description}</textarea>
					</li>
				</ul>
				<ul style="margin-top: 30px">
					<li style="width: 100%;">
						<span>上传附件:<br/>
						（50M以内）</span>
						<div class="form-group">
							<table>
								<tr>
									<td colspan="1" style="text-align: left;font-size: 0.85em; " > 
										<input id="docName" class="inputtxt2" value="${pd.appendix_name}" maxlength="500"/>
									</td>
									<td colspan="1" id="fileDiv">
										<span id="file_upload" class="btn btn-primary fileinput-button" style="width: 100px;height: 42px;padding: 0;"> 
											<span style="width: 50px;height: 42px;padding: 0;font-size: 1em;margin: 10px 0px;text-align: center;">浏览</span>
											<input type="file" id="file_upload" name="file_upload1" multiple>
											<input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="appendix_path" value="${pd.appendix_path}" maxlength="500" name="appendix_path" type="text" value="" onblur="trim(this);" />
											<input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="appendix_name" name="appendix_name" maxlength="500" type="text" value="" onblur="trim(this);" />
										</span>														
									</td>
								</tr>
								<tr>
									<td>
										<p  style="font-size:12px" class="style1">支持的文件格式为.doc/.docx/.pdf/.xls/.xlsx/.ppt/.pptx/.txt/.jpg</p>									</td>
								</tr>
							</table>																										                  
		                </div>																				
					</li>
				</ul> 
				</form>
				<br/>
				<br/>
				<a href="javascript:void(0);" class="save3" onclick="ibtnModify_Click()">确认</a>
				<a  class="sback"  
					href="<%=basePath%>requirementdetail/bidListInfo.act">返回</a>


				<!-- 提交结果 -->
				<div class='modal my-modal-alert' id='success'
					style="display: none;">
					<div class='modal-dialog boxBodySmall'>
						<div class='modal-content'
							style="width: 150px; text-align: center; position: fixed; right: 40%; bottom: 60%;">
							<div class='modal-body' id='modal-body-alert'>
								<img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;修改成功!
							</div>
						</div>
					</div>
				</div>
				<div class='modal my-modal-alert' id='error' style="display: none;">
					<div class='modal-dialog boxBodySmall'>
						<div class='modal-content'
							style="width: 150px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
							<div class='modal-body' id='modal-body-alert'>
								<img alt="" src="<%=basePath%>shyl/images/fail.png">&nbsp;&nbsp;修改失败!
							</div>
						</div>
					</div>
				</div>
				
				
			</div>
		</div>
	</div>


	<!--<footer开始>-->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!--</footer结束>-->
<script
	src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
<script
	src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
<script
	src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
<script
	src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>

<script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
	<script type="text/javascript">
	var tips=function(id,msg){
		$("#"+id).tips({
			side : 2,
			msg : msg,
			bg : '#AE81FF',
			time : 5
		});
	}
	//文件上传
	 $("#file_upload").fileupload({
		 dataType :'iframe text',
		 autoUpload: true,
		 maxNumberOfFiles : 1,
		 maxFileSize: 50000000,
         url: '<%=basePath%>bidCtrl/Upload.act',
			sequentialUploads : true
		}).bind('fileuploadchange', function(e, data) {
			 
			if (data.files.length > 1) {
				tips("docName", "只能上传一个文件。");
				return false;
			}
		}).bind('fileuploaddone', function(e, data) {
			var result=data.result;
			if ("no" == data.result) {
				tips("docName", "请上传格式为.doc/.docx/.pdf/.xls/.xlsx/.ppt/.pptx/.txt/.jpg格式的文档文件。");
			}else if("nosize"==data.result){
	    		 tips("docName", "请上传文件大小在50M以内的文件。");
		 	 } else {
				$("#appendix_path").val(data.result);
				$("#appendix_name").val(data.originalFiles[0].name);
				
				$("#appendix_path").text(data.result);

				$("#appendix_name").text(data.originalFiles[0].name);
				$("#docName").val(data.originalFiles[0].name);
			}
		});
	</script>

<script type="text/javascript"
	src="<%=basePath%>shyl/js/jquery.tips.js"></script>

	<script type="text/javascript">

	function openmy(){
		$('#success').hide();
	}
	function errorshow(){
		$('#error').hide();
	}

	  function returnback(){
	    	window.location.href="<%=basePath%>requirementdetail/bidListInfo.act";}
	//提交
	function ibtnModify_Click() {
		
    	//联系人
		 var contact=$.trim($("#contact").val());
		if (contact == "") {
			$("#contact").tips({
				side : 2,
				msg : '请输入联系人',
				bg : '#AE81FF',
				time : 3
			});
			$("#contact").focus();
			$("#contact").val("");
			return false;
		}
    	
    	//电话
		var contact_tel=$.trim($("#contact_tel").val());
		if (contact_tel == "") {
			$("#contact_tel").tips({
				side : 2,
				msg : '请输入电话',
				bg : '#AE81FF',
				time : 3
			});
			$("#contact_tel").focus();
			$("#contact_tel").val("");
			return false;
		}
    	var filter =/(^([048][0-9]{2,3}\-)+([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$)|(^((\(\d{3}\))|(\d{3}\-))?(1[34578]\d{9})$)/;
    	if (contact_tel != "" && !(filter.test(contact_tel))) {
    		$("#contact_tel").tips({
    			side : 1,
    			msg : '请输入正确的电话格式',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
    	}
    	
    	//Email
		 var email=$.trim($("#email").val());
		if (email == "") {
			$("#email").tips({
				side : 2,
				msg : '请输入Email',
				bg : '#AE81FF',
				time : 3
			});
			$("#email").focus();
			$("#email").val("");
			return false;
		}
    	var filter = /^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT)$/;
    	if (email != "" && !(filter.test(email))) {
    		$("#email").tips({
    			side : 1,
    			msg : '请输入正确的Email格式',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
    	}

		 //详情描述
		 var detail_description=$.trim($("#detail_description").val());
		 
		 //附件
		 var appendix_path=$.trim($("#appendix_path").val());
		 var appendix_name=$.trim($("#appendix_name").val());
		 var project_id=$.trim($("#project_id").val());
		 var bid_company_id=$.trim($("#bid_company_id").val());
		 
		$.ajax({
			type : "POST",
			url : '<%=basePath%>bidCtrl/edit.act',
			data : {

				bid_company_id:bid_company_id,
				project_id:project_id,
				contact:contact,
				contact_tel : contact_tel,
				email : email,
				detail_description : detail_description,
				appendix_path : appendix_path,
				appendix_name : appendix_name
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				if ("success" == data.result) {
					$('#success').show()
					setTimeout("returnback()", 1000);
				} else {
					$('#error').show()
					setTimeout("errorshow()", 1000);
				}
			}
		});
	}
	</script>
</body>
</html>
