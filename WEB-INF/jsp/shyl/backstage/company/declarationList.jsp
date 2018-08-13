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
<link rel="stylesheet" href="static/css/thing.css" />
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<style type="text/css">
table{  
    table-layout:fixed; 
}  
.tds a{  
    width:100%;  
    word-break:keep-all;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
}
.tds {  
    width:100%;  
    word-break:keep-all;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
}
.dropdown-menu li a:hover{
	background: #87b87f;
}
</style>
	</head>
<body>
	<div class="container-fluid" id="main-container">
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<div class="row-fluid">
					<!-- 检索  start-->
					<form action="<%=basePath%>search/list.do" method="post" name="Form" id="Form" class="form-horizontal">
						<table>
							<tr>
								<td class="form-inline" >
									<label class="lbl" for="com_title" >申报公司：</label>
	                                <input type="text" id="com_title" name="com_title" style="width:206px;height:30px" value="${pd.com_title}" placeholder="申报公司" class="onlyName" onblur="trim(this);">
								</td>
								<td align="right">
									&#12288;&#12288;<button type="button" onclick="search();" class="btn btn-info btn-success btn-lg" title="查询" >查询<i class="icon-search icon-on-right"></i></button>
								</td>
								<!-- <td class="form-inline" >
									<button type="button" onclick="huizong();" class="btn btn-info btn-success btn-lg" title="汇总" >汇总<i class=""></i></button>
								</td>
								<td class="form-inline" >
									<a href="javascript:;" class="btn btn-info btn-success btn-lg" title="下载" id="yl" onclick="downloadWordFile()" >下载<i class=""></i></a>
								</td> -->
								<td class="form-inline" >
									<div class="btn-group">
									    <button type="button" class="btn btn-info btn-success btn-lg" style="border: 5px solid #87b87f !important;" data-toggle="dropdown" title="汇总下载">汇总下载<i class=""></i>
									        <span class="caret"></span>
									    </button>
									    <ul class="dropdown-menu" role="menu" style="min-width: 105px;">
											<c:forEach items="${typeList}" var="arealist">
												<li>
										            <a href="javascript:void(0);" onclick="downloadWordFile(${arealist.DISTINGUISH_ID});">${arealist.VALUE}</a>
										        </li>
											</c:forEach>	
									    </ul>
									</div>
							</td>	
							</tr>
						</table>
						<hr>
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center" nowrap="nowrap" style="width:5%;">序号</th>
									<th class="center" nowrap="nowrap" style="width:15%;">公司名称</th>
									<th class="center" nowrap="nowrap" style="width:8%;">申报级别</th>
									<th class="center" nowrap="nowrap" style="width:10%;">
										<c:choose>
										<c:when test="${not empty typeList}">
										<select id="type" name="type" class="inputtxt2" style="width:100%;color: #707070;font-size: 13px;font-weight: bold;"
											onchange="checkAreaId();">
												<option value="">申请类型</option>
												<c:forEach items="${typeList}" var="arealist">
													<option value="${arealist.DISTINGUISH_ID}"
														<c:if test="${arealist.DISTINGUISH_ID == pd.type}">selected</c:if>>${arealist.VALUE}</option>
												</c:forEach>
										</select>
										</c:when>
										</c:choose>
									</th>
									<th class="center" nowrap="nowrap" style="width:8%;">申报年度</th>
									<th class="center" nowrap="nowrap" style="width:10%;">上报时间</th>
									<th class="center" nowrap="nowrap" style="width:10%;">
									<c:choose>
									<c:when test="${not empty areaList}">
									<select id="areaId" name="areaId" class="inputtxt2" style="width:100%;color: #707070;font-size: 13px;font-weight: bold;text-align:center"
										onchange="checkAreaId();">
											<option value="" >审批区县</option>
											<c:forEach items="${areaList}" var="arealist">
												<option value="${arealist.REGION_ID}"
													<c:if test="${arealist.REGION_ID == pd.areaId}">selected</c:if>>${arealist.REGION_NAME}商务局</option>
											</c:forEach>
									</select>
									</c:when>
									<c:otherwise>
									审批区县
									</c:otherwise>
									</c:choose>
									</th>
									<th class="center" nowrap="nowrap" style="width:13%;">审批结果</th>
									<th class="center" nowrap="nowrap" style="width:16%;">操作<br/><label style="cursor: default;font-size:11px; color: red;">※如果预览文件过大时，建议下载后再预览</label></th>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
							<c:choose>
										<c:when test="${not empty varList}">
											<c:forEach items="${varList}" var="var" varStatus="vs">
												<tr>
													<td class="center" style="width: 30px;">${vs.index+1}</td>
													<td class="tds" title="${var.company_name}" style="vertical-align: middle">${var.company_name}</td>
													<td class="center" style="vertical-align: middle">${var.level}</td>
													<td class="center" style="vertical-align: middle">${var.declaration_type}</td>
													<td class="center" style="vertical-align: middle">${var.declaration_year}</td>
													<td class="center" style="vertical-align: middle">${var.report_time}</td>
													<td class="center" title="${var.region_name}" style="vertical-align: middle">
													<c:choose>
													<c:when test="${var.region_name ==null or var.region_name ==''}">
													</c:when>
													<c:otherwise>
													  ${var.region_name}商务局
													</c:otherwise>
													</c:choose>
													</td>
													<td class="center" style="vertical-align: middle;"><a href="javascript:void(0);" onclick="approvalOpinionView('${var.info_id}')">${var.examination_result}</a></td>
													<td class="center" style="width: 160px;" nowrap="nowrap">
														<a class='btn btn-small btn-info' id="view${vs.index+1}" title="${var.declaration_filename}" href="javascript:void(0);"
															onclick="return view('view${vs.index+1}','${var.info_id}');" target="_blank" ><i class=" icon-eye-open"></i>预览</a>
														<a class="btn btn-small btn-purple" href="javascript:void(0);" title="下载PDF" onclick="downloadFile('${var.info_id}');"><i class=" icon-download-alt"></i>下载 </a>
														<c:if test="${QX.edits != '1'}">
														<c:if test="${pd.roleId != '1'}">
														<a class="btn btn-small " href="javascript:void(0);" title="审批" onclick="Examination('${var.info_id}')" ><i class=" icon-edit"></i>审批</a>
														</c:if>							
														</c:if>	
													</td>
												</tr>
												</c:forEach>
										</c:when>
										<c:otherwise>
											<tr class="main_info">
												<td colspan="100" class="center">没有相关数据</td>
											</tr>
										</c:otherwise>
									</c:choose>
							</tbody>
						</table>
						<div class="page-header position-relative">
							<table style="width: 100%;">
								<tr>
									<td style="vertical-align: top;"><div class="pagination"
											style="float: right; padding-top: 0px; margin-top: 0px;">${page.pageStr}</div></td>
								</tr>
							</table>
						</div>
					</form>
					<form action="" method="post" name="Form1" id="Form1" class="form-horizontal"></form>
				</div>
				<!-- PAGE CONTENT ENDS HERE -->
			</div>
			<!--/row-->
		</div>
		<!--/#page-content-->
	</div>
	<!--/.fluid-container#main-container-->
	<!-- 引入 -->
	<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<script type="text/javascript" src="static/js/myjs/head.js"></script>
	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript"
		src="static/js/bootstrap-datepicker.min.js"></script>
	<!-- 日期框 -->
	<script type="text/javascript" src="static/js/bootbox.min.js"></script>
	<!-- 确认窗口 -->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!--提示框-->
	<script type="text/javascript">
		$(top.hangge());
		function downloadFile(info_id) {
			 var info_id = encodeURI(encodeURI(info_id));
			 $.ajax({
					type : "POST",
					url : '<%=basePath%>search/downfile.do?info_id='+info_id,
					dataType : 'json',
					cache : false,
					success : function(data) {
						if(data.responseStr=="OK"){
							$("#Form1").attr("action","<%=basePath%>search/download.do?fileName=" + data.responseName+ "&filePath=" + data.responsePath);
							$("#Form1").submit();
						}else{
							bootbox.confirm("PDF文件未上报");
						}
					}
				});
		}
		function view(id,info_id) {
			var ret=false;
			$.ajax({
				type : "POST",
				url : '<%=basePath%>search/view.do?info_id='+info_id,
				dataType : 'json',
				cache : false,
				async: false,
				success : function(data) {
					if(data.responseStr=="OK"){
						var path=data.responsePath;
						$("#"+id).attr('href','register/showPdf.act?pdfFile='+path);
						ret=true;
					}else{
						bootbox.confirm("PDF文件未上报");
					}
				}
			});
			return ret; 
		}
		
        function downloadWordFile(type){
            $.ajax({
                type : "POST",
                url : '<%=basePath%>search/huizong.do',
                data:{declaration_type:type},
                dataType : 'json',
                cache : false,
                async: false,
                success : function(data) {
                	if(data.result=="OK"){
                        $("#Form1").attr("action","<%=basePath%>search/download.do?fileName=" + data.filename+ "&filePath=" + data.filepath);
                        $("#Form1").submit();
                    } else if (data.result == 'fail') {
                        bootbox.dialog("没有查询到可汇总的数据", 
                                [
                                    {
                                        "label" : "关闭",
                                        "class" : "btn-small btn-primary"
                                    }
                        ]);
                    }

                }
            });
        }
		function search() {
			top.jzts();
			$("#Form").attr("action","<%=basePath%>search/list.do");
			$("#Form").submit();
		}
		
		//审批
		function Examination(id){
			$.ajax({
                type : "POST",
                url : '<%=basePath%>search/resultCheck.do',
                data : {info_id : id},
                dataType : 'json',
                cache : false,
                async: false,
                success : function(data) {
                    if (data.result == 'firstErro') {
                    	
                        bootbox.alert("已进入复审阶段，不能再进行审批。");
                        return false;
                    } else if (data.result == 'complexErro') {
                    	bootbox.confirm("该申报还未初审通过，您确定要审批吗？", function(result) {
            				if(result) {
            					upresult(id);
            				}
            			});
                    } else {
                    	upresult(id);
                    }
                }
            });
		}
		
		function upresult(id){
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="修改属性";
			 diag.URL = dialogPath+'search/goExamination.do?id='+id;
			 diag.Width = 700;
			 diag.Height = 500;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage("${page.currentPage}");
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//审批
		function approvalOpinionView(id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="审批意见";
			 diag.URL = dialogPath+'search/goApprovalOpinionView.do?id='+id;
			 diag.Width = 600;
			 diag.Height = 400;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage("${page.currentPage}");
				}
				diag.close();
			 };
			 diag.show();
		}
		
		function ylan(){
		var yl=$("#yl").attr("href");
		if(yl=="javascript:;"){
			bootbox.dialog("请先汇总文件", 
					[
					    {
					    	"label" : "关闭",
					    	"class" : "btn-small btn-primary"
					    }
			]);
			}
		}
		 function checkAreaId(){
// 		    	var field = $("#areaId > option:selected");
// 		    	var REGION_ID = field.attr("value");
		    	$("#Form").attr("action","<%=basePath%>search/list.do");
				$("#Form").submit();
		    }
	</script>
</body>
</html>

