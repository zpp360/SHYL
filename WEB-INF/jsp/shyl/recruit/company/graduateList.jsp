<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>毕业生一览表_济南市服务外包公共服务平台</title>
<jsp:include page="../../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<script src="js/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/jquery-1.7.1.js"></script>
<script src="<%=basePath%>shyl/js/jquery.min.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
</head>
<body id="top" style="background-color: #f7f7f7;">
<script type="text/javascript">
    // 删除毕业生信息
    function Delete() {
            location.href = "<%=basePath%>graduate/deleteGraduate.act?id="+$("#id").val()+"&info_id="+$("#info_id").val();
    }
    function dels(id,divid) {
            $("#" + divid).attr("data-target", "#delGraduate");
            $("#delGraduate").attr("data-target", "");
            $("#id").val(id);
    }
    // 预览劳动合同
	function view(id,path) {
			 ret=false;
				//通过Ajax向后台传值
				$.ajax({
					type : "POST",
					url :'<%=basePath%>'+'register/isExistsFile.act',
					data : {
						filePath : path
					},
					dataType : 'json',
					async:false,
					success : function(data) {
						if(data=="1"){
							$("#"+id).attr('href','<%=basePath%>'+'register/showPdf.act?pdfFile='+path);
							ret=true;
						}else{
							$('#my-modal-errorfile-alert').show ().delay (1000).fadeOut ();
						}
						
					}
				});
    	
				return ret;

	}
	function clearAll(){
		   location.href =  '<%=basePath%>graduate/toGraduateList.act?info_id='+$("#info_id").val();
    }
</script>
<div class="modal modal fade bs-example-modal-sm in" id="delGraduate" data-toggle="modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="false" data-target="">
	<div class="modal-dialog modal-sm">
	   <div class="modal-content">
	       <div class="modal-header">
	           <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
	           <h4 class="modal-title" id="myModalLabel">提示</h4>
	       </div>
	       <div class="modal-body">
	           <p id="warntext">毕业生信息删除后不可恢复，确定删除吗？</p>
	       </div>
	       <div class="modal-footer">
	           <input type="hidden" id="id" name="id">
	           <input type="hidden" id="companyId" value="${pd.USERID}">
	           <button type="button" class="btn btn-success" onclick="Delete()" data-dismiss="modal">确认</button>
	           <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	       </div>
	   </div>
	</div>
</div>
<div class='modal my-modal-alert' id='my-modal-errorfile-alert'>
		<div class='modal-dialog boxBodySmall'>
			<div class='modal-content'
				style="width: 260px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
				<div class='modal-body' id='modal-body-alert'>
					<img alt="" src="<%=basePath%>shyl/images/mark.png">&nbsp;&nbsp;预览文件不存在!
				</div>
			</div>
		</div>
	</div>
<!-- /.modal -->
<div class="clear"></div>
<div class="register-box p0">
	<div class="rticon"></div>
    <jsp:include page="../../common/left.jsp"><jsp:param value="2" name="menuType"/></jsp:include>
	<div class="mypage_right" style="min-height:920px;">
		<h2>${py.year}年毕业生一览表</h2>
		<form action="<%=basePath%>graduate/updateMoney.act" method="post" name="Form" id="Form">
		<div class="tab" style="margin-bottom:0;">
			<a href="javascript:void(0);" data-toggle="modal" data-target="#upExcel" onclick="upExcel();"
						class="more">批量导入</a>&nbsp;&nbsp;
		    <a href="<%=basePath%>graduate/toAddGraduate.act?info_id=${pd.info_id}" class="more" style="margin-right: 10px;">&nbsp;&nbsp;&nbsp;+添加毕业生</a>
			<a href="" data-toggle="modal" data-target="#ssj" class="more" style="margin-right: 10px;" onclick="showOrHide()">+保险权益记录单</a>
			<input type="hidden" id="info_id" name="info_id" value="${pd.info_id}">
			<input type="hidden" id="toPage" name="toPage" value="${pageMap.toPage}">
			<input type="hidden" id="hiddenReward" name="hiddenReward" value="${py.reward}">
		</div>
		<div class="jianli">
			<table class="tableclass">
				<thead>
					<tr>
						<th style="width:5%;text-align: left;">序号</th>
						<th style="width:10%;text-align: left;">姓名</th>
						<th style="width:18%;text-align: left;">身份证号码</th>
						<th style="width:9%;text-align: left;">学历</th>
						<th style="width:23%;text-align: left;">毕业学校</th>
						<th style="width:5%;text-align: left;">专业</th>
						<th style="width:25%;text-align: center;">操作</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
				<c:when test="${not empty graduateList}">
					<c:forEach items="${graduateList}" var="var" varStatus="vs">
						<tr>
						    <td style="width:5%;text-align:left;">${vs.index+1}</td>
							<td style="width:10%;text-align: left;">
							${var.name}
							</td>
							<td style="width:18%;text-align: left;">
								${var.id_number}
							</td>
							<td style="width:9%;text-align: left;">
							${var.education}
							</td>
							<td style="width:23%;text-align: left;">
							${var.school}
							</td>
							<td style="width:5%;text-align: left;">
							${var.major}
							</td>
							<td style="width:25%;text-align: center;">
							<a href="<%=basePath%>graduate/toUpdateGraduate.act?&id=${var.id}&info_id=${pd.info_id}" class="modify">修改</a>
							<a href="#" data-toggle="modal" id="delGraduate_${var.id}" onclick="dels(${var.id},'delGraduate_${var.id}');" class="delete">删除</a>
							<a class="zview" id="view${var.id}" title="" href="javascript:void(0);" onclick="return view('view${var.id}','${var.labour_path}');" target="_blank">&nbsp;预览</a>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="7" style="text-align: center;"><span style="color: #ff6a00">没有相关记录</span></td>
								</tr>
				</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div>
		<div class="page-header position-relative">
			<table style="width: 100%;">
				<tr>
					<td style="align: center;" align="center"><div
							class="pagination"
							style="padding-top: 15px; margin: 0 auto; font-size:12px; display: inline-block;">${page.platformPageStr}</div></td>
				</tr>
			</table>
		</div>
		<div class="jianli">
		    <table class="tableclass">
					<tr>
						<td style="font-size: 18px;font-weight:700;" width="28%">申请应届大学生培训扶持资金
						<td width="15%"><input type="text" maxlength="10" class="form-control" value="${py.reward}" id="reward" onblur="changeFloat(this);checkMoney();" name="reward" style="width:100px;font-size: 18px;font-weight:700;height:28px;border-radius:5px;background-color: #ecf0f9;"></td>
						<td>&nbsp;万元</td>
					</tr>
				   </tbody>
		   </table>
		</div>
		</form>
		<div>
				<div class="col-sm-2 col-sm-offset-2" style="margin-top: 20px;">
					<button type="button" onclick="OK('${pageMap.toPage}');"
						class="btn btn-success btn-block"style="width:172px">
						<span class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp;${pageMap.toText}
					</button>
				</div>
				<div class="col-sm-2" style="margin-top: 20px;">
					<a onclick="GO('${pageMap.fromPage}');"
						class="btn btn-default btn-block"><span
						class="glyphicon glyphicon-circle-arrow-left"></span>&nbsp;&nbsp;上一步</a>
				</div>
		</div>
	</div>
</div>
<div class="clear" ></div>
<jsp:include page="../../common/importExcel.jsp"></jsp:include>
<!-- 上传保险权益记录单 -->
	<div class="modal fade in" id="ssj" role="dialog"
			aria-labelledby="adoptModal" aria-hidden="false" data-backdrop="static">
			
			<div class="modal-dialog modal-lg"style="top: 145px; left: -15px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" onclick="clearAll();">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							保险权益记录单上传<small> </small>
						</h4>
					</div>
					<form class="form-horizontal" role="form" action="<%=basePath%>graduate/upLoadBxqyFile.act" method="post"
						id="bxqyForm" name="form1">
						<table class="table">
							<tbody>
								<tr>
									<th style="width: 195px">保险权益记录单：</th>
									<td>
										<div class="row">
											<div class="col-md-12">
												<div>
													<div class="form-group">
														<div class="col-sm-12">
															<ul style="float: left;">
															<li>
															<input type="text" id="pdfShowName" name="pdfShowName" class="inputtxt2New" style="font-size:0.99em;" value="${pg.file_name}">
															</li>
															<li>
															<span style="display: none;" id="xg"><a id="pdfView" href='javascript:void(0);' target='_blank' onclick="return watchPdf('pdfView');" class='zview'>预览</a></span>
															<span style="display: none;" id="sc"><a id="pdfDelete" onclick="deleteBxqy();" class="delete">删除</a></span>
															</li>
															</ul>
														</div>
														<div class="col-sm-5" style="margin-left: 7%">
															<div class="caption" align="center" style="width: 100px;">
																<span id="file_uploadCon"
																	class="btn btn-primary fileinput-button"
																	style="margin-top: 20px;"> <span>上传保险权益记录单</span> <input
																	type="file" id="file_uploadCon" name="file_uploadCon" multiple />
																</span>
															</div>
														</div>
														<input id="pdfPath" name="pdfPath" type="hidden" value="${pg.file_path}" />
														<input id="pdfName" name="pdfName" type="hidden" value="${pg.file_name}" />
														<input type="hidden" id="info_id" name="info_id" value="${pd.info_id}"/>
														<input type="hidden" id="file_type" name="file_type" value="3">
													</div>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="modal-footer">
						    <input type="hidden" value="" id="defauinfo_id">
							<button id="EduButton" type="button" class="btn btn-success"
								onclick="updateBxqyFile()">确认</button>
							<button type="button" class="btn btn-default" onclick="clearAll();"
								data-dismiss="modal">关闭</button>
						</div>
					</form>
				</div>
			</div>
		</div>
       <!--<footer开始>-->
		<script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
		<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
		<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
		<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
		<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
		<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
		<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
		<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
		<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
		<script type="text/javascript">
			var tips=function(id,msg){
				$("#"+id).tips({
					side : 2,
					msg : msg,
					bg : '#AE81FF',
					time :2
				});
			}
			$("#file_uploadCon").fileupload({
				 autoUpload: true,
				 maxNumberOfFiles : 3,
				 url: '<%=basePath%>platform/uploadSjBc.act',
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
			   		 // 设定pdf路径
			   		 $("#pdfPath").val(data.result);
			   		 // 设定pdf名称
			   		 $("#pdfName").val(data.originalFiles[0].name);
			   		 // 显示pdf名称
			   		 $("#pdfShowName").val(data.originalFiles[0].name);
			   		 
			   		 var path=$("#pdfPath").val();
			   		 $("#pdfView").attr('href','<%=basePath%>'+'register/showPdf.act?pdfFile='+path);

			   		 $("#xg").show();
			   		 $("#sc").show();
			   	 }
		   });
			//调用批量导入功能
			function upExcel(){
				var options = {
				        data:{info_id:$("#info_id").val(), alias:"graduate"},
		 				getresult: function(data) {fileuploaddoneExcel();},
		 				fileNmae:"毕业生一览.xlsx",
		 				filePath:"templateFiles/graduateList.xlsx"
				 };
				fileuploadExcel(options);
			}
			
			//批量导入回调函数
			function fileuploaddoneExcel(){
				location.href = "<%=basePath%>graduate/toGraduateList.act?info_id="+$("#info_id").val();
			}
			// 确定上传保险权益记录单
			function updateBxqyFile(){
				$("#bxqyForm").submit();
			}

		    // 预览保险权益记录单
		    function watchPdf(id) {
		    	var ret=false;
		    	var path = $("#pdfPath").val();
		    	//通过Ajax向后台传值
				$.ajax({
					type : "POST",
					url :'<%=basePath%>'+'register/isExistsFile.act',
					data : {
						filePath : path
					},
					dataType : 'json',
					async:false, 
					success : function(data) {
						if(data=="1"){
							$("#"+id).attr('href','<%=basePath%>'+'register/showPdf.act?pdfFile='+path);
							ret=true;
						}else{
							$('#my-modal-errorfile-alert').show ().delay (1000).fadeOut ();
						}
						
					}
				});
		    	
				return ret;
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
			// 更新扶持资金
			function updateMoney(){
				var reward = $("#reward").val();
				var info_id = $("#info_id").val();
				$.ajax({
					type : "POST",
					url :'<%=basePath%>graduate/updateMoney.act',
						data : {
							reward: reward,
							info_id: info_id
						},
						dataType : 'json',
						cache : false,
						success : function(data) {
						}
					});
			}
			 function OK(url) {
				 if (checkMoney()) {
					 $("#reward").focus();
					 return false;
				 }
				 $("#Form").submit();
			 }
			 // 返回
		    function GO(url) {
		    	location.href =  '<%=basePath%>'+url+'?&info_id='+$("#info_id").val();
		    }
			 
		      // 设置预览删除按钮显示还是隐藏
			  function showOrHide(){
			    	var filename=$("#pdfShowName").attr("value");
			    	if(filename != null && filename != ""){
			    		$("#xg").show();
			    		$("#sc").show();
			    	}
			    }
		        // 删除保险权益单
				function deleteBxqy(){
			   		 // 设定隐藏的pdf路径为空
			   		 $("#pdfPath").val("");
			   		 // 设定隐藏的pdf名称为空
			   		 $("#pdfName").val("");
			   		 // 设定显示pdf名称为空
			   		 $("#pdfShowName").val("");
			   		 // 隐藏预览和删除
			   		 $("#xg").hide();
		    		 $("#sc").hide();
				}
		</script>
		
<jsp:include page="../../common/footer.jsp"></jsp:include>
<!--</footer结束>-->
</html>
