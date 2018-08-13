<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>中高端境外人才实训_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">
<jsp:include page="../../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/styleRegist.css">
<link rel="stylesheet"
	href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet"
	href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">

<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<script src="js/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/jquery-1.7.1.js"></script>
<script src="<%=basePath%>shyl/js/jquery.min.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.js"></script>

<script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
<script
	src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
<script
	src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<style type="text/css">
.voucher-scrollbar{
	padding-left: 20px;
	margin-right: 40px; 
	overflow-y: auto; 
	height: 145px;
}
.voucher-scrollbar1{
	padding-left: 20px;
	margin-right: 40px; 
	overflow-y: auto; 
	height: 290px;
}
</style>
</head>
<body style="background-color: #f7f7f7;">

	<!-- /.modal -->
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param
				value="2" name="menuType" /></jsp:include>
		<div class="mypage_right">
			<h2 class="h2_font13">${pageMap.levelMap.levelMenu}中高端境外人才实训</h2>
			<form action="<%=basePath%>training/list.act" method="post"
				name="Form" id="Form">
				<input type="hidden" value="${pd.info_id}" id="info_id"
					name="info_id"> <input type="hidden" value="${pd.id}"
					id="id" name="id"> <input type="hidden"
					value="${pd.update_timestamp}" id="update_timestamp"
					name="update_timestamp"> <input type="hidden"
					id="hiddenReward" name="hiddenReward" value="${py.reward}">
					<input type="hidden" value="${levelPd.level}" id="level">
				<div class="tab" style="margin-bottom: 0;">
					<a href="javascript:void(0);" data-toggle="modal" data-target="#upExcel" onclick="upExcel();"
						class="more">批量导入</a>&nbsp;&nbsp;
					<a href="<%=basePath%>training/create.act?info_id=${pd.info_id}"
						class="more" style="margin-right: 10px;">+&nbsp;&nbsp;实训人员</a>
				</div>
				<div class="jianli">
					<table class="tableclass">
						<thead>
							<tr>
								<th style="padding-left: 30px; text-align: center;">实训区间</th>
								<th style="text-align: center;">实训人员</th>
								<th style="text-align: center;">凭证号</th>
								<th style="text-align: center;">人民币(元)</th>
								<th style="text-align: center;">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty trainingList}">
									<c:forEach items="${trainingList}" var="var" varStatus="vs">
										<tr>
											<c:if
												test="${vs.index ==0 || (vs.index !=0 and trainingList[vs.index-1].train_id ne var.train_id )}">
												<td style="width: 250px; text-align: center;"
													rowspan="${var.counts1}">${var.strart_time}至
													${var.end_time}</td>
												<td style="width: 100px; text-align: center;"
													rowspan="${var.counts1}">${var.evection_people}</td>
											</c:if>
											<td style="width: 110px; text-align: center;">${var.certificate_number}</td>
											<td style="width: 110px; text-align: center;">${var.money}</td>
											<c:if
												test="${vs.index ==0 || (vs.index !=0 and trainingList[vs.index-1].train_id ne var.train_id )}">
												<td style="width: 320px;text-align: center;" rowspan="${var.counts1}">
													<a
													href="<%=basePath%>training/edit.act?train_id=${var.train_id}&info_id=${var.info_id}"
													class="modify">修改</a> <a class="delete"
													style="cursor: pointer;" data-toggle="modal" title="删除"
													id="delnews_${var.train_id}"
													onclick="del('${var.train_id}','delnews_${var.train_id}');"
													data-target="#delnews">删除</a> <a data-toggle='modal'
													data-target='#adoptModal' class='modify' <%-- href="<%=basePath%>training/updateFlg.act?train_id=${var.train_id}" --%>
													onclick="updFile('${var.id}');" style="cursor: pointer;">上传</a><br>
													<a data-toggle='modal' data-target='#picModal'
													class='zview' style="cursor: pointer;"
													onclick="openPic('${var.id}');">预览签证</a> <a
													data-toggle='modal' data-target='#picModalImg'
													class='zview' style="cursor: pointer;"
													onclick="openPicImg('${var.id}');">预览凭证</a> <a
													class='zview' id="view${var.id}" href="javascript:void(0);"
													onclick="return view(view${var.id},${var.id});"
													target="_blank">预览合同</a>
												</td>
											</c:if>
										</tr>
										<c:if test="${vs.last}">
											<tr style="padding-left: 50px;">
												<td style="text-align: center;">合计：</td>
												<td style="text-align: center;">${var.training_money}元</td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</c:if>
									</c:forEach>

								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="6" style="text-align: center;"><span
											style="color: #ff6a00">没有相关记录</span></td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<c:if test="${levelPd.level==2}">
				<div class="jianli">
					<table>
						<tr>
							<td style="font-size: 18px; font-weight: 700;" width="28%">
								申请境外实训扶持资金
							<td width="15%"><input type="text" class="form-control"
								value="${py.reward}" onkeypress="return myNumberic(event)"
								onkeyup="value=value.replace(/[^\d.]/g,'')" id="reward"
								onblur="checkMoney();" name="reward"
								style="width: 100px; font-size: 18px; font-weight: 700; height: 28px; border-radius: 5px; background-color: #ecf0f9;"></td>
							<td>&nbsp;万元</td>
						</tr>
						</tbody>
					</table>
				</div>
				</c:if>
				<c:if test="${levelPd.level==1}">
				<table>
						<tr>
							<td style="font-size: 18px; font-weight: 700; width:100px;">申请金额<td width="15%">
							<input id="num" name="num" type="hidden" value="${pageMap.type}" />
							<input type="text" class="form-control"
								value="${pd.support_capital}" onkeypress="return myNumberic(event)"
								onkeyup="value=value.replace(/[^\d.]/g,'')" id="support_capital"
								onblur="checkMoney1();" name="support_capital"
								style="width: 100px; font-size: 18px; font-weight: 700; height: 28px; border-radius: 5px; background-color: #ecf0f9;"></td>
							<td>&nbsp;万元</td>
						</tr>
					</table>
				</c:if>
			</form>
			<div>
				<div class="col-sm-2" style="margin-top: 20px; margin-left: 200px;margin-right: 15px;">
					<a href="<%=basePath%>${pageMap.toPage}?info_id=${pd.info_id}"
						onclick="updateMoney()" class="btn btn-success btn-block"><span
						class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp;${pageMap.toText}</a>
				</div>
				<div class="col-sm-2" style="margin-top: 20px;">
					<a href="<%=basePath%>${pageMap.fromPage}?info_id=${pd.info_id}"
						class="btn btn-default btn-block"><span
						class="glyphicon glyphicon-circle-arrow-left"></span>&nbsp;&nbsp;上一步</a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../../common/importExcel.jsp"></jsp:include>
	<div class="modal fade in" id="picModal" role="dialog"
		aria-labelledby="picModal" aria-hidden="false" data-backdrop="static">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						签证图片预览<small> </small>
					</h4>
				</div>
				<form class="form-horizontal" role="form" action="" method="post"
					id="form1" name="form1">
					<div class="row">
						<div class="col-md-12">
							<div>
								<div class="form-group" id="businessDiv">
									<div >
										<ul id="imagesPic" style="text-align: center;"></ul>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" onclick="Clear()"
							data-dismiss="modal">关闭</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="modal fade in" id="picModalImg" role="dialog"
		aria-labelledby="picModal" aria-hidden="false" data-backdrop="static">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						凭证图片预览<small> </small>
					</h4>
				</div>
				<form class="form-horizontal" role="form" action="" method="post"
					id="form1" name="form1">
					<div class="row">
						<div class="col-md-12">
							<div>
								<div class="form-group" id="businessDiv">
									<div >
										<ul id="imagesPicImg" style="text-align: center;"></ul>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" onclick="Clear()"
							data-dismiss="modal">关闭</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class='modal my-modal-alert' id='my-modal-success-alert'>
		<div class='modal-dialog boxBodySmall'>
			<div class='modal-content'
				style="width: 260px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
				<div class='modal-body' id='modal-body-alert'>
					<img alt="" src="<%=basePath%>shyl/images/mark.png">&nbsp;&nbsp;预览文件不存在!
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade bs-example-modal-sm in" id="delnews"
		data-toggle="modal" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="false" data-target="">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						onclick="Clear()">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<p id="warntext">确认删除该条信息吗？</p>
				</div>
				<div class="modal-footer">
					<input type="hidden" id="train_id" value="${pd.train_id}">
					<button type="button" class="btn btn-success" onclick="Delete()"
						data-dismiss="modal">确认</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade in" id="adoptModal" role="dialog"
		aria-labelledby="adoptModal" aria-hidden="false"
		data-backdrop="static">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						资料上传<small> </small>
					</h4>
				</div>
				<form class="form-horizontal" role="form" action="" method="post"
					id="form1" name="form1">
					<table class="table">
						<tbody>
							<tr>
								<th style="width: 195px"><span class="red_tip">*</span>凭证：</th>
								<td>
									<div class="row">
										<div class="col-md-12">
											<div>
												<div class="form-group">
													<div>
														<ul id="pingzhengID" style="overflow: hidden"></ul>
													</div>
													<div class="col-sm-5" style="margin-left: 7%">
														<div class="caption" align="center" style="width: 100px;">
															<span id="pingzheng_upload"
																class="btn btn-primary fileinput-button"> <span>上传凭证</span>
																<input type="file" id="pingzheng_image"
																name="pingzheng_image" multiple />
															</span>
														</div>
														<div class="help-block" style="margin-top: 5px;">支持的文件格式为.jpg、.png、.jpeg、.gif</div>
													</div>
												</div>
											</div>
										</div>
									</div> 
								</td>
							</tr>


							<tr>
								<th style="width: 195px"><span class="red_tip">*</span>签证：</th>
								<td>
									<div class="row">
										<div class="col-md-12">
											<div>
												<div class="form-group">
													<div >
														<ul id="imagesID" style="overflow: hidden"></ul>
													</div>
													<div class="col-sm-5" style="margin-left: 7%">
														<div class="caption" align="center" style="width: 100px;">
															<span id="weixin_upload"
																class="btn btn-primary fileinput-button" style="">
																<span>上传签证</span> <input type="file" id="weixin_image"
																name="weixin_image" multiple />
															</span>
														</div>
														<div class="help-block" style="margin-top: 5px;">支持的文件格式为.jpg、.png、.jpeg、.gif</div>
													</div>
												</div>
											</div>
										</div>
									</div> 
								</td>
							</tr>
							<tr>
								<th style="width: 195px"><span class="red_tip">*</span>劳动合同：</th>
								<td>
									<div class="row">
										<div class="col-md-12">
											<div>
												<div class="form-group">
													<div class="col-sm-12">
														<ul id="docName"></ul>
													</div>
													<div class="col-sm-5" style="margin-left: 7%">
														<div class="caption" align="center" style="width: 100px;">
															<span id="file_uploadCon"
																class="btn btn-primary fileinput-button" style="">
																<span>上传劳动合同</span> 
																<input type="hidden" id="id" value="${pd.id}">
																<input type="file" id="file_upload"
																name="file_upload" multiple />
															</span>
														</div>
														<div class="help-block" style="margin-top: 5px;">支持的文件格式为.pdf</div>
													</div>
													<input
														style="height: 0.5px; width: 0px; padding: 0px; margin: 0px; position: absolute;"
														id="apply_report_path" name="apply_report_path"
														type="text" value="" /> <input
														style="height: 0.5px; width: 0px; padding: 0px; margin: 0px; position: absolute;"
														id="apply_report_name" name="apply_report_name"
														type="text" value="" />
												</div>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="modal-footer">
						<button id="EduButton" type="button" class="btn btn-success"
							onclick="updateFile();updateFileImg();">确认</button>
						<button type="button" class="btn btn-default" onclick="Clear()"
							data-dismiss="modal">关闭</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="clear"></div>
	<script type="text/javascript">
	// 更新境外申请资金
	function updateMoney(){
		var level = $("#level").val();
		if(level==2){
			var reward = $("#reward").val();
			var info_id = $("#info_id").val();
			var hiddenReward = $("#hiddenReward").val();
			$.ajax({
				type : "POST",
				url :'<%=basePath%>training/updateMoney.act',
					data : {
						reward: reward,
						info_id: info_id,
						hiddenReward: hiddenReward
					},
					dataType : 'json',
					cache : false,
					success : function(data) {
					}
				});
		}else if(level==1){
			var support_capital = $("#support_capital").val();
			var info_id = $("#info_id").val();
			var num = $("#num").val();
			$.ajax({
				type : "POST",
				url :'<%=basePath%>training/updateNationMoney.act',
					data : {
						support_capital: support_capital,
						info_id: info_id,
						num: num
					},
					dataType : 'json',
					cache : false,
					success : function(data) {
					}
				});
		}

	}
	//调用批量导入功能
	function upExcel(){
		var options = {
		        data:{info_id:$("#info_id").val(), alias:"training"},
 				getresult: function(data) {fileuploaddoneExcel();},
 				fileNmae:"境外实训.xlsx",
 				filePath:"templateFiles/training.xlsx"
		 };
		fileuploadExcel(options);
	}
	
	//批量导入回调函数
	function fileuploaddoneExcel(){
		location.href = "<%=basePath%>training/list.act?info_id="+$("#info_id").val();
	}
	
	function myNumberic(e,len) {
	    var obj=e.srcElement || e.target;
	    var dot=obj.value.indexOf(".");//alert(e.which);
	    len =(typeof(len)=="undefined")?2:len;
	    var  key=e.keyCode|| e.which;
	    if(key==8 || key==9 || key==46 || (key>=37  && key<=40))//这里为了兼容Firefox的backspace,tab,del,方向键
	        return true;
	    if (key<=57 && key>=48) { //数字
	        if(dot==-1)//没有小数点
	            return true;
	        else if(obj.value.length<=dot+len)//小数位数
	            return true;
	        } else if((key==46) && dot==-1){//小数点
	            return true;
	    }       
	    return false;
	}
	 
	 //文本框失去焦点后
    function checkMoney(){
    	var reward = $("#reward").val();
    	var reg=/^\d*\.?\d{0,2}$/;
    	if(reward != null || reward != ''){
    		if(!reg.test(reward)){
    			tips("reward","扶持资金必须大于0且小数位数不超过2位！");
    			return true;
        	}
    	}
    	if (reward == '' || reward == null) {
    		tips("reward","请输入扶持资金");
    		return true;
    	}
    	
    }
	 //文本框失去焦点后
    function checkMoney1(){
    	var support_capital = $("#support_capital").val();
    	var reg=/^\d*\.?\d{0,2}$/;
    	var PsdFilter = /^\d{0,7}(\.\d{0,2})?$/;
    	if(support_capital != null || support_capital != ''){
    		if(!reg.test(support_capital)){
    			$("#support_capital").tips({
    				side : 2,
    				msg : '"support_capital","申请金额必须大于0且小数位数不超过2位！"',
    				bg : '#AE81FF',
    				time : 3
    			});
    			return true;
        	}
    	}
		if (!(PsdFilter.test(support_capital))) {
			$("#support_capital").tips({
				side : 2,
				msg : '申请扶持金额最大值不能超过9999999.99',
				bg : '#AE81FF',
				time : 3
			});
			$("#support_capital").focus();
			return false;
		}
    }
	
	function Delete() {
		var train_id=$("#train_id").val();
    	location.href = "<%=basePath%>training/deleteT.act?train_id="+ $("#train_id").val()+"&info_id="+$("#info_id").val()+"&id="+$("#id").val();
	}
    
    function del(id, divid) {
		$("#" + divid).attr("data-target", "#delnews");
		$("#delnews").attr("data-target", "");
		$("#train_id").val(id);
	}
	
	
		var pictureindex = 0;
		var pathArray=new Array();
		var pathArray2=new Array();
	    var person=new Object();
		$(function() {
			//凭证图片上传
			$("#pingzheng_image").fileupload({
				 dataType :'json',
				 autoUpload: true,
				 maxNumberOfFiles : 3,
		         url: '<%=basePath%>training/uploadPic.act',
		         sequentialUploads: true
			 }).bind('fileuploadchange', function (e, data) {
				  if(data.files.length > 10){
					$("#pingzheng_image").tips({
							side : 2,
							msg : '一次最多上传10张图片。',
							bg : '#AE81FF',
							time : 2
					});
		            return false;
				 } 
		     }).bind('fileuploaddone', function (e, data) {
		    	 if("NO"==data.result.fileTypeError){
		    		 $("#pingzheng_image").tips({
							side : 2,
							msg : '请上传格式为.jpg/.jpeg/.png./gif格式的图片。',
							bg : '#AE81FF',
							time : 2
					 });
		    	 } else {
		    		var index = ++pictureindex;
		    		addScrollbar($("#pingzhengID").parent(),"voucher-scrollbar");
		            $("#pingzhengID").append(html2(data.result.imgPath,data.result.imgName,index));
		            var img=new Object();
		            img.id = index;
		            img.filetype = 2;
		            img.name=data.result.imgName;
		            img.path=data.result.imgPath;
		            pathArray2.push(img);
		    	 }
		     });	
			//签证图片上传
		 $("#weixin_image").fileupload({
			 dataType :'json',
			 autoUpload: true,
			 maxNumberOfFiles : 3,
	         url: '<%=basePath%>training/uploadPic.act',
	         sequentialUploads: true
		 }).bind('fileuploadchange', function (e, data) {
			  if(data.files.length > 10){
				$("#weixin_image").tips({
						side : 2,
						msg : '一次最多上传10张图片。',
						bg : '#AE81FF',
						time : 2
				});
	            return false;
			 } 
	     }).bind('fileuploaddone', function (e, data) {
	    	 if("NO"==data.result.fileTypeError){
	    		 $("#weixin_image").tips({
						side : 2,
						msg : '请上传格式为.jpg/.jpeg/.png./gif格式的图片。',
						bg : '#AE81FF',
						time : 2
				 });
	    	 } else {
	    		var index = ++pictureindex;
	    		addScrollbar($("#imagesID").parent(),"voucher-scrollbar");
	            $("#imagesID").append(html(data.result.imgPath,data.result.imgName,index));
	            var img=new Object();
	            img.id = index;
	            img.filetype = 0;
	            img.name=data.result.imgName;
	            img.path=data.result.imgPath;
	            pathArray.push(img);
	    	 }
	     });
		 //pdf文件上传
			$("#file_upload").fileupload({
				 autoUpload: true,
				 maxNumberOfFiles : 3,
				 url: '<%=basePath%>training/uploadContract.act?id='+$("#id").val(),
		         sequentialUploads: true
			 }).bind('fileuploadchange', function (e, data) {
				 if(data.files.length > 1){
					 $("#file_uploadCon").tips({
						 side : 2,
						 msg : "只能上传一个文件。",
						 bg : '#AE81FF',
						 time : 2
					 });
		            return false;
				 }
		     }).bind('fileuploaddone', function (e, data) {
		    	 if("no"==data.result){
			   		 $("#file_uploadCon").tips({
							 side : 2,
							 msg : "请上传格式为.pdf格式的文件。",
							 bg : '#AE81FF',
							 time : 2
						 });
			   		 return false;
			   	 } else {
			   		 $("#apply_report_path").val(data.result);
			   		 $("#apply_report_name").val(data.originalFiles[0].name);
			   		 $("#docName").text(data.originalFiles[0].name);
			   	 }
		     });
	 	});
		
		//签证
		function html(src,imgName,index){
			var html='<li style="display:inline-block; ">';
			html+='<img src="<%=basePath%>images/'+src+'" name="weixin_show" style="width:170px; margin-left: 20px;height:100px;" data-holder-rendered="true"/><br/>'
			 if(imgName.length >9){
				 var name = imgName.substring(0,9); 
			html+='<p title="'+imgName+'" style="display:block;width:180px; padding-left:20px">'+name+'...</p>';
			 }else{
				 html+='<p title="'+imgName+'" style="display:block;width:180px; padding-left:20px">'+imgName+'</p>';
			 }
			html+='<input id="flie_path" data-val="true"  name="ConImg2" type="hidden" value="'+src+'" />';
			html+='<a style="margin-left:20px;" onclick="deleteLocalPicture('+index+')" class="delete">删除</a>';
			html+='</li>';
			return html;
		}
		//凭证
		function html2(src,imgName,index){
			var html='<li style="display:inline-block; float;left;">';
			html+='<img src="<%=basePath%>images/'+src+'" name="weixin_show" style="width:170px; margin-left: 20px;height:100px;" data-holder-rendered="true"/>'
			 if(imgName.length >9){
				 var name = imgName.substring(0,9); 
			html+='<p title="'+imgName+'" style="display:block;width:180px; padding-left:20px">'+name+'...</p>';
			 }else{
				 html+='<p title="'+imgName+'" style="display:block;width:180px; padding-left:20px">'+imgName+'</p>';
			 }
			html+='<input id="flie_path" data-val="true"  name="ConImg" type="hidden" value="'+src+'" />';
			html+='<a style="margin-left:20px;" onclick="deleteLocalPicture2('+index+')" class="delete">删除</a>';
			html+='</li>';
			return html;
		}
		function deleteLocalPicture2(index){
			for (var i =0;i<pathArray2.length;i++) {
				if (index == pathArray2[i].id) {
					pathArray2.splice(i,1);
					break;
				}
			}
			$("#pingzhengID").children().remove();
			setScrollbar(pathArray2,"pingzhengID","voucher-scrollbar");
			for (var j =0;j<pathArray2.length;j++) {
				$("#pingzhengID").append(html2(pathArray2[j].path,pathArray2[j].name,pathArray2[j].id));
			}
		}
		
		function deleteLocalPicture(index){
			for (var i =0;i<pathArray.length;i++) {
				if (index == pathArray[i].id) {
					pathArray.splice(i,1);
					break;
				}
			}
			$("#imagesID").children().remove();
			setScrollbar(pathArray,"imagesID","voucher-scrollbar");
			for (var j =0;j<pathArray.length;j++) {
				$("#imagesID").append(html(pathArray[j].path,pathArray[j].name,pathArray[j].id));
			}
		}
		
		function updFile(id){
			$("#id").val(id);
			}	
		</script>

	<script type="text/javascript">
			function updateFile(){
				//取得上传图片对应的用户ID
				var id = $("#id").val();
				
				//取得所有上传图片的文件名
			    var filePaths2 = new Array();
				$("#pingzhengID input[name=ConImg2]").each(
					function(i) {
						filePaths2[i]=$(this).val();
				});
				//取得所有上传图片的文件名
			    var filePaths = new Array();
				$("#imagesID input[name=ConImg]").each(
					function(i) {
						filePaths[i]=$(this).val();
				});
				//取得所有上传图片的数据
				var pingzhengID = $("#pingzhengID").val();
				//取得所有上传图片的数据
				var imagesID = $("#imagesID").val();
				//取得所有上传合同的路径
				var adoptPath = $("#apply_report_path").val();
				//取得所有上传合同的文件名
				var adoptNm = $("#apply_report_name").val();
				if (pathArray2.length == 0) {
					$("#pingzheng_upload").tips({
						side : 2,
						msg : "请选择需要上传的凭证图片。",
						bg : '#AE81FF',
						time : 2
					});
					$("#pingzheng_upload").fucus();
					return false;
				}else if(pathArray.length == 0){
					$("#weixin_upload").tips({
						side : 2,
						msg : "请选择需要上传的签证图片。",
						bg : '#AE81FF',
						time : 2
					});
					$("#weixin_upload").fucus();
					return false;
				}else if(adoptPath == "" || adoptNm ==""){
					$("#file_uploadCon").tips({
						side : 2,
						msg : "请选择需要上传的合同文件。",
						bg : '#AE81FF',
						time : 2
					});
					$("#file_uploadCon").fucus();
					return false;
				}
				//通过Ajax向后台传值
				$.ajax({
					type : "POST",
					url : '<%=basePath%>training/upLoadFile.act',
					data : {
						id : id,
						file_paths2 :JSON.stringify(pathArray2),
						file_paths :JSON.stringify(pathArray),
						adoptPath : adoptPath,
						adoptNm : adoptNm
					},
					dataType : 'json',
					cache : false,
					success : function(data) {
						if ("success" == data.result) {
							$('#adoptModal').modal('hide');
							location.reload();
						} else {
							$('#adoptModal').modal('hide');
							location.reload();
							alert("上传失败");
						} 
					}
				});
			}
			
			function updateFileImg(){
				//取得上传图片对应的用户ID
				var id = $("#id").val();
				
				//取得所有上传图片的文件名
			    var filePaths2 = new Array();
				$("#pingzhengID input[name=ConImg2]").each(
					function(i) {
						filePaths2[i]=$(this).val();
				});	
				//取得所有上传图片的数据
				var pingzhengID = $("#pingzhengID").val();
				if(pathArray2.length == 0){
					$("#pingzheng_upload").tips({
						side : 2,
						msg : "请选择需要上传的凭证图片。",
						bg : '#AE81FF',
						time : 2
					});
					("#pingzheng_upload").focus();
					return false;
				}
				//通过Ajax向后台传值
				$.ajax({
					type : "POST",
					url : '<%=basePath%>training/UpLoadFileImg.act',
					data : {
						id : id,
						file_paths2 :JSON.stringify(pathArray2),
					},
					dataType : 'json',
					cache : false,
					success : function(data) {
						if ("success" == data.result) {
							$('#adoptModal').modal('hide');
							location.reload();
						} else {
							$('#adoptModal').modal('hide');
							location.reload();
							alert("上传失败");
						} 
					}
				});
			}
		</script>



	<script type="text/javascript">
    $.ajaxSetup({ async: false });
    function bind() {
        location.href = "<%=basePath%>company/toJobManager.act";
    }
    function checkSelect(){
    	 var relateIds = "";
    	 $("input[name='isRead']:checked").each(function () {
             relateIds += $(this).attr('value') + ",";
         });
         $("#checkBoxFlag").val(relateIds);
    }
    
    // 预览合同
    function view(pdf_id,id) {
		var ret=false;
		$.ajax({
			type : "POST",
			url : '<%=basePath%>training/view.act',
			dataType : 'json',
			data : {
				id :id,
			},
			cache : false,
			async: false,
			success : function(data) {
				if(data.responseStr=="OK"){
					var path=data.responsePath;
					$("#view"+id).attr('href','<%=basePath%>'+'register/showPdf.act?pdfFile='+path);
					ret=true;
				} else {
					$('#my-modal-success-alert').show ().delay (1000).fadeOut ();
					ret=false;
				}
			}
		});
		return ret; 
	}
    
    function dels(userId, recordId, divid) {
		$("#" + divid).attr("data-target", "#delSend");
		$("#delSend").attr("data-target", "");
		$("#recordId").val(recordId);
		$("#user_id").val(userId);
	}
    
    // 预览图片
    function openPic(id) {
		$.ajax({
			type : "POST",
			url : '<%=basePath%>training/openPic.act',
			data : {
				training_id : id
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				$("#imagesPic").empty();
				setScrollbar(data,"imagesPic","voucher-scrollbar1");
				for(var i=0;i<data.length;i++){
					$("#imagesPic").append(voucherhtml(id,data[i].file_type,data[i].file_path,data[i].file_name,data[i].id));
 				}
			}
		});
	}
	function voucherhtml(training_id,type,src,imgName,id){
		var html='<li style="display:inline-block; padding:15px 14px">';
		html+='<img src="<%=basePath%>images/'+src+'" name="weixin_show" style="width:150px; margin-left: 20px;" data-holder-rendered="true"/><br/>'
		 if(imgName.length >9){
			 var name = imgName.substring(0,9); 
		html+='<p title="'+imgName+'" style="display:block;width:180px; padding-left:20px">'+name+'...</p>';
		 }else{
			 html+='<p title="'+imgName+'" style="display:block;width:180px; padding-left:20px">'+imgName+'</p>';
		 }
		html+='<input id="flie_path" data-val="true"  name="ConImg" type="hidden" value="'+src+'" />';
		html += '<a style="margin-left:20px;" onclick="deleteVoucherPicture(' + id
		+  ','+type+','+training_id+')" class="delete">删除</a>';
		html+='</li>';
		return html;
	}
    function showImgDelayNew(index){
    	var imgObj = document.getElementById(index);
    	imgObj.onerror=null;
    	imgObj.src='<%=basePath%>shyl/images/temp.png';  
    }  
    
    
    // 预览凭证
    function openPicImg(id) {

		$.ajax({
			type : "POST",
			url : '<%=basePath%>training/openPicImg.act',
			data : {
				training_id : id
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				$("#imagesPicImg").empty();
				setScrollbar(data,"imagesPicImg","voucher-scrollbar1");
				for(var i=0;i<data.length;i++){
					$("#imagesPicImg").append(voucherhtml2(id,data[i].file_type,data[i].file_path,data[i].file_name,data[i].id));
 				}
			}
		});
	}
	function voucherhtml2(training_id,type,src,imgName,id){
		var html='<li style="display:inline-block; padding:15px 14px">';
		html+='<img src="<%=basePath%>images/'+src+'" name="weixin_show" style="width:150px; margin-left: 20px;" data-holder-rendered="true"/><br/>'
		 if(imgName.length >9){
			 var name = imgName.substring(0,9); 
		html+='<p title="'+imgName+'" style="display:block;width:180px; padding-left:20px">'+name+'...</p>';
		 }else{
			 html+='<p title="'+imgName+'" style="display:block;width:180px; padding-left:20px">'+imgName+'</p>';
		 }
		html+='<input id="flie_path" data-val="true"  name="ConImg" type="hidden" value="'+src+'" />';
		html += '<a style="margin-left:20px;" onclick="deleteVoucherPicture(' + id
		+ ','+type+ ','+training_id+')" class="delete">删除</a>';
		html+='</li>';
		return html;
	}
	// 删除本地图片
	function deleteVoucherPicture(id,type,training_id) {
		$.ajax({
			type : "POST",
			url :'<%=basePath%>training/delVoucher.act',
			data : {
				id : id,
				training_id : training_id,
				file_type:type
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				if(type=="0"){
					$("#imagesPic").children().remove();
					var List = data.voucherlistdel;
					setScrollbar(List,"imagesPic","voucher-scrollbar1");
					for (var i = 0; i < List.length; i++) {
						$("#imagesPic").append(
								voucherhtml(training_id,List[i].file_type,List[i].file_path, List[i].file_name,
										List[i].id));
					}
				}else if(type=="2") {
					$("#imagesPicImg").children().remove();
					var List = data.voucherlistdel;
					setScrollbar(List,"imagesPicImg","voucher-scrollbar1");
					for (var i = 0; i < List.length; i++) {
						$("#imagesPicImg").append(
								voucherhtml2(training_id,List[i].file_type,List[i].file_path, List[i].file_name,
										List[i].id));
					}
				}
				
			}
		});
	}
	function appendPic(id,data,training_id){
		$("#"+id).children().remove();
		var List = data.voucherlistdel;
		setScrollbar(List,id);
		for (var i = 0; i < List.length; i++) {
			$("#"+id).append(
					voucherhtml(training_id,List[i].file_path, List[i].file_name,
							List[i].id));
		}
	}
	
	
    function showImgDelayNew(index){
    	var imgObj = document.getElementById(index);
    	imgObj.onerror=null;
    	imgObj.src='<%=basePath%>shyl/images/temp.png';  
    }
    
    function test(evection_people){
    	var url = encodeURI(encodeURI('<%=basePath%>training/edit.act?&evection_people=' + evection_people));
    	location.href = url;
    }
    function setScrollbar(list,id,cls){
    	if(list.length>0){
    		addScrollbar($("#"+id).parent(),cls);
    	}else{
    		delScrollbar($("#"+id).parent(),cls);
    	}
    }
    function addScrollbar(obj,cls){
    	if(!obj.is('.'+cls)){
    		obj.addClass(cls);
    	}
    }

    function delScrollbar(obj,cls){
    	if(obj.is('.'+cls)){
    		obj.removeClass(cls);
    	}
    }
    
</script>

	<!--<footer开始>-->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!--</footer结束>-->
</body>
</html>
