<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
    String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<title>技术引进、研发创新技术奖项、境外专利_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">
<jsp:include page="../../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/styleRegist.css">
<link rel="stylesheet" href="shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet"
	href="shyl/fileupload/css/jquery.fileupload-ui.css">
<link rel="stylesheet" href="shyl/css/font-awesome.css">
<link rel="stylesheet" href="shyl/css/non-responsive.css">
<script src="shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script type="text/javascript" src="shyl/js/bootstrap.js"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<style>
a:focus {
	outline: none !important;
}

#tbodyId a:hover, a:focus {
	color: #416cc5;
}

.mypage_tab a:hover, a:focus {
	color: #416cc5;
}.T-tit{
color: #666;
    display: block;
    width: 117px;
    font-size: 12px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    }
    .T-tit1{
	color: #666;
    width: 117px;
    font-size: 12px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    }
</style>
<script type="text/javascript">
    //预览审计报告
    function sjbg(pdf_id,info_id) {
    	var ret=false;
		$.ajax({
			type : "POST",
			url : '<%=basePath%>platform/viewryj.act',
			dataType : 'json',
			data : {
				id : info_id,
			},
			cache : false,
			async: false,
			success : function(data) {
				if(data.responseStr=="OK"){
					var path=data.responsePath;
					$("#view"+info_id).attr('href','<%=basePath%>'+'register/showPdf.act?pdfFile='+path);
					ret=true;
				} else {
					$('#my-modal-success-alert').show ().delay (1000).fadeOut ();
					ret=false;
				}
			}
		});
		return ret; 
	}
    //隐藏审计报告预览删除
  function hidesjbg(){
    	var filename=$("#ssss").attr("filename");
    	var fildd=$("#apply_report_namewtht").val();
   		$("#finame").html(filename);
   	 	$("#sc a").attr("data-target","#delWtht");
   	 	$("#sc a").attr("onclick","delWtht('${ry.id}')");
    	if(filename!=null&&filename!=""){
    		$("#xg").show();
    		$("#sc").show();
    	}
    }
  function htmlsjbg(){
		$("#sc a").attr("data-target","");
		$("#finame").html("");
		 $("#xg").hide();
 		 $("#sc").hide();
 		 var fildd=$("#apply_report_namewtht").val();
 		$("#apply_report_namewtht").val("");
 		// $("#filename").html(fildd);
	}
  function deleteSjBg(id){
		 //删除审计报告
			$("#defauinfo_id").val(id);
	}
</script>
</head>
<body style="background-color: #f7f7f7;">
<input type="hidden" value="${pd.contryflag}" id="contry">
<input type="hidden" value="" id="listurl">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param value="2" name="menuType"/></jsp:include>
		<div class="mypage_right">
			<h2 class="h2_font13">${pageMap.levelMap.levelMenu}技术引进、研发创新技术奖项、境外专利</h2>
			<div class="tab" style="margin-bottom:0;">
			<a href="javascript:;" data-toggle="modal" data-target="#upExcel" onclick="upExcel();" class="more" style="position:relative;right:310px;">&nbsp;&nbsp;&nbsp;批量导入</a>
		    <a href="<%=basePath%>org/toAddSoft.act?info_id=${pd.info_id}" class="more" style="margin-right:-85px;">&nbsp;&nbsp;&nbsp;+添加</a>
			<a href="javascript:;" class="more" style="margin-right:20px;" data-target="#ssj" data-toggle="modal" onclick="hidesjbg()">&nbsp;&nbsp;&nbsp;+上传</a>
			<input type="hidden" id="info_id" name="info_id" value="${pd.info_id}">
		</div>
			<div class="mypage_tab" style="width: 80%;display: none;" id="contryyea">
				<div class="hd">
					<ul>
						<li class="on" id="years15"><a href="javascript:void(0);" data-var="${previousYear}">国家级</a></li>
						
						</a></li>
					</ul>
				</div>
			</div>
			<div class="jianli">
				<input type="hidden" id="info_id" name="info_id"
					value="${pd.info_id}" />
					<input type="hidden" value="${softlist}" id="dddddd"/>
				<table class="tableclass">
					<thead>
						<tr class="active">
							<th style="width: 8%; text-align: center;">年</th>
							<th style="width: 8%; text-align: left;">月</th>
							<th style="width: 8%; text-align: left;">日</th>
							<th style="width: 9%; text-align:left;">类型</th>
							<th style="width: 10%; text-align:left;">凭证号数</th>
							<th style="width: 10%; text-align: left;">摘要</th>
							<th style="width: 13%; text-align: left;">人民币</th>
							<th style="width: 10%; text-align: left;">备注</th>
							<th style="width: 15%; text-align: center;">操作</th>
						</tr>
					</thead>
					<tbody id="tbodyId">
					<c:choose>
				<c:when test="${not empty softlist}">
					<c:forEach items="${softlist}" var="var" varStatus="vs">
						<tr>
							<td style="width:8%;text-align: center;">
							${fn:substring(var.apply_date, 0,4)}
							</td>
							<td style="width:8%;text-align: left;">
							${fn:substring(var.apply_date, 5,7)}
							</td>
							<td style="width:8%;text-align: left;">
							${fn:substring(var.apply_date, 8,10)}
							</td>
							<td style="width:9%;text-align: left;">
							${var.soft_type1}
							</td>
							<td style="text-align: left;">
							${var.voucher}
							</td>
							<td style="text-align: left;" class="T-tit">
							${var.abstract_info}
							</td>
							<td style="width:5%;text-align: left;">
							${var.rmb}
							</td>
							<td style="text-align: left;" class="T-tit">
							${var.remarks}
							</td>
							<td style="width:25%;text-align: center;">
							<a href="<%=basePath%>org/toUpdateSoft.act?&id=${var.id}&info_id=${pd.info_id}" class="modify">修改</a>
							<a href="#" data-toggle="modal" id="delGraduate_${var.id}" id="delnews_${var.id}" onclick="del(${var.id},'delnews_${var.id}');" class="delete" data-target="#delnews">删除</a>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="9" style="text-align: center;"><span style="color: #ff6a00">没有相关记录</span></td>
					</tr>
				</c:otherwise>
				</c:choose>
					</tbody>
				</table>
			</div>
				<table>
						<tr>
							<td style="font-size: 18px; font-weight: 700; width:100px;">
								申请金额
							<td width="15%">
							<input id="num" name="num" type="hidden" value="${pageMap.type}" />
							<input type="text" class="form-control"
								value="${pd.support_capital}" onkeypress="return myNumberic(event)"
								onkeyup="value=value.replace(/[^\d.]/g,'')" id="support_capital"
								onblur="checkMoney();" name="support_capital"
								style="width: 100px; font-size: 18px; font-weight: 700; height: 40px; border-radius: 5px; background-color: #ecf0f9;"></td>
							<td>&nbsp;万元</td>
						</tr>
					</table>
			<div>
			
				<div class="col-sm-2 col-sm-offset-2" style="margin-top: 20px;">
					<a href="<%=basePath%>${pageMap.toPage}?&info_id=${pd.info_id}"
					onclick="updateMoney()" class="btn btn-success btn-block">
						<span class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp;${pageMap.toText}</a>
				</div>
				<div class="col-sm-2" style="margin-top: 20px;margin-left:10px">
					<a onclick="GO('${pageMap.fromPage}');" class="btn btn-default btn-block"><span
						class="glyphicon glyphicon-circle-arrow-left"></span>&nbsp;&nbsp;上一步</a>
				</div>
			</div>
		</div>
	</div>
		<div class="modal fade bs-example-modal-sm in" id="delnews"
			data-toggle="modal" tabindex="-1" role="dialog"
			aria-labelledby="mySmallModalLabel" aria-hidden="false"
			data-target="">
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
						<p id="warntext">确认删除该信息吗？</p>
					</div>
					<div class="modal-footer">
						<input type="hidden" id="id" value=""> <input
							type="hidden" id="company_id" value="${pd.info_id}">
						<button type="button" class="btn btn-success" onclick="Delete()"
							data-dismiss="modal">确认</button>
						<button type="button" class="btn btn-default"
							data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
			<div class="modal fade in" id="ssj" role="dialog"
			aria-labelledby="adoptModal" aria-hidden="false" data-backdrop="static">
			
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							软硬件汇总表上传<small> </small>
						</h4>
					</div>
					<form class="form-horizontal" role="form" action="" method="post"
						id="form1" name="form1">
						<table class="table">
							<tbody>
								<tr>
									<th style="width: 195px"><span class="red_tip">*</span>软硬件汇总表 ：</th>
									<td>
										<div class="row">
											<div class="col-md-12">
												<div>
													<div class="form-group">
														<div class="col-sm-12">
															<ul id="docNamewtht" style="float: left;">
															<li id="ssss" filename="${ry.file_name}">
															<span id="finame">${ry.file_name}</span>		
															<span id="xg" style="display: none;"><a  id="view${ry.id}" href='javascript:void(0);' target='_blank' onclick="return sjbg('view${ry.id}','${ry.id}');" class='zview'>预览</a></span>
															<span id="sc" style="display: none;"><a data-toggle="modal" data-target="#delWtht" onclick="delWtht('${ry.id}')" class="delete">删除</a></span>
															</li>
															</ul>
														</div>
														<div class="col-sm-5" style="margin-left: 7%">
															<div class="caption" align="center" style="width: 100px;">
																<span id="file_uploadwtht"
																	class="btn btn-primary fileinput-button"
																	style="margin-top: 20px;"> <span>上传软硬件汇总文件 </span> <input
																	type="file" id="file_uploadwtht" name="file_uploadwtht" multiple />
																</span>
															</div>
															<div style="margin-top:5px; color: #818590;">支持的文件格式为.pdf</div>
														</div>
														<input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="apply_report_pathwtht" name="apply_report_pathwtht" maxlength="255" onblur="trim(this);" type="text" value="${ry.file_path}" />
														<input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="apply_report_namewtht" name="apply_report_namewtht" maxlength="255" onblur="trim(this);" type="text" value="${ry.file_name}" />
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
								onclick="updateWthtFile()">确认</button>
							<button type="button" class="btn btn-default" onclick="Clear()"
								data-dismiss="modal">关闭</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	<script type="text/javascript">
	 function OK(url) {
	        location.href = '<%=basePath%>'+url+'?info_id='+$("#info_id").val();
	    }
	 function updateMoney(){
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
	 // 返回
    function  GO(url) {
        location.href = '<%=basePath%>'+url+'?info_id='+$("#info_id").val();
    }
	</script>
	<div class="clear"></div>
	<!-- 删除委托合同 -->
	<div class="modal fade in" id="delWtht" role="dialog"
		aria-labelledby="deledu" aria-hidden="false" data-backdrop="static">
		<div class="modal-dialog  modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<h4>您确定要删除吗？删除后不可恢复！！</h4>
					<br> <br>
				</div>
				<input id="Conid" name="Conid" type="hidden" value="">
				<div class="modal-footer">
					<button id="wthtbutton" type="button" class="btn btn-success"
						onclick="delWTHT()" data-dismiss="modal">确认</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<input type="hidden" value="" id="defauwthtinfo_id">
				</div>
			</div>
		</div>
			<script type="text/javascript">
				function delWTHT(){
				var id =$("#defauwthtinfo_id").val();
					$.ajax({
				type : "POST",
				url :'<%=basePath%>platform/deleterj.act',
					data : {
						id: id
					},
					dataType : 'json',
					cache : false,
					success : function(data) {
						$('#delWtht').modal('hide');
						location.reload();
					}
				});
			}
		</script>
		</div>
	<jsp:include page="../../common/importExcel.jsp"></jsp:include>
	<jsp:include page="../../common/footer.jsp"></jsp:include>
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
	function Delete() {
    	location.href = "<%=basePath%>org/delSoft.act?info_id="+ $("#info_id").val() + "&id="+ $("#id").val();
	}
	 function del(id, divid) {
			$("#" + divid).attr("data-target", "#delnews");
			$("#delnews").attr("data-target", "");
			$("#id").val(id);
		}
	 $("#file_uploadwtht").fileupload({
		 autoUpload: true,
		 maxNumberOfFiles : 3,
		 url: '<%=basePath%>platform/uploadSjBc.act',
        sequentialUploads: true
	 }).bind('fileuploadchange', function (e, data) {
		 if(data.files.length > 1){
			 $("#file_uploadwtht").tips({
				 side : 2,
				 msg : "只能上传一个文件。",
				 bg : '#AE81FF',
				 time : 2
			 });
           return false;
		 }
    }).bind('fileuploaddone', function (e, data) {
   	 if("no"==data.result){
	   		 $("#file_uploadwtht").tips({
					 side : 2,
					 msg : "请上传格式为.pdf格式的文件。",
					 bg : '#AE81FF',
					 time : 2
				 });
	   		 return false;
	   	 } else {
	   		 $("#apply_report_pathwtht").val(data.result);
	   		 var path=$("#apply_report_pathwtht").val();
	   		 $("#apply_report_namewtht").val(data.originalFiles[0].name);
	   		 $("#docNamewtht").val(data.originalFiles[0].name);
	   		 $("#ssss").attr("value",data.originalFiles[0].name);
	   		$("#ssss").val("value",data.originalFiles[0].name);
	   		 //$("#ssss").prepend(data.originalFiles[0].name);
	   		 $("#view").attr('href','<%=basePath%>'+'register/showPdf.act?pdfFile='+path);
	   		 $("#view").attr("onclick","");
	   		 $("#xg").show();
	   		 $("#sc").show();
	   		 $("#finame").text(data.originalFiles[0].name);
	   		 $("#sc a").attr("onclick","htmlsjbg()");
	   	 }
    });
	 
	 function updateWthtFile(){
			//取得所有上传图片的文件名
		    //var filePaths = new Array();
			//取得所有上传合同的路径
			var adoptPath = $("#apply_report_pathwtht").val();
			if (adoptPath=="") {
				$("#finame").tips({
					side : 2,
					msg : '文件不能为空！',
					bg : '#AE81FF',
					time : 3
				});
				return true;
			}	

			//取得所有上传合同的文件名
			var adoptNm = $("#apply_report_namewtht").val();
			//信息ID
			var info_id=$("#info_id").val();

			// 有效证件验证
			// 合同验证
			if (adoptPath == "") {
				$("#file_upload").tips({
					side : 2,
					msg : '请选择合同',
					bg : '#AE81FF',
					time : 2
				});
				return false;
			}
			//通过Ajax向后台传值
			$.ajax({
				type : "POST",
				url : '<%=basePath%>platform/upLoadRyjFile.act',
				data : {
					adoptPath : adoptPath,
					adoptNm : adoptNm,
					info_id:info_id,
					file_type:6
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
					if ("success" == data.result) {
						$('#adoptModal').modal('hide');
						location.reload();
					}
				}
			});
		}
	 function delWtht(id){
			$("#defauwthtinfo_id").val(id);
		}
		function upExcel(){
			var options = {
			        url:'<%=basePath%>govUploadCommon/uploadExcel.act',
			        data:{info_id:$("#info_id").val(),alias:"softwareAndHard"},
	 				getresult: function(data) {fileuploaddoneExcel();},
	 				fileNmae:"软硬件汇总表.xlsx",
	 				filePath:"templateFiles/softwareAndHard.xlsx"
			 };
			fileuploadExcel(options);
		}
		//批量导入回调函数
		function fileuploaddoneExcel(){
			location.href = "<%=basePath%>org/softta.act?info_id="+$("#info_id").val();
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
		
		<%-- function downloadFile() {	
			$("#form1").attr("action","<%=basePath%>gov/download.act?fileName=软硬件汇总表.xlsx&filePath=templateFiles/softwareAndHard.xlsx");
			$("#form1").submit();			
		} --%>
	 </script>
</body>
</html>
