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
<title>政策管理_济南市服务外包公共服务平台</title>
<!-- jsp文件头和头部 -->
<%@ include file="../../../system/admin/top.jsp"%>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<style type="text/css">
.btnlist {
	padding: 5px;
	margin: 5px;
	border: 1px solid #ddd;
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}
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
</style>
</head>
<body>
	<div id ="zhongxin">
	<div class="container-fluid" id="main-container">
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<div class="row-fluid">
					<!-- 检索  -->
					<form action="<%=basePath%>position/list.do" method="post" name="Form" id="Form">
						<table style="margin-bottom: 20px;">
							<tr>
								<td class="form-inline"><span class="input-icon"> <input
										autocomplete="off" id="nav-search-input" type="text"
										name="POS_NAME" style="width: 350px" value="${pd.POS_NAME }"
										placeholder="这里输入职位名称" onblur="trim(this);" /> <i id="nav-search-icon"
										class="icon-search"></i>
								</span></td>
								<td style="width: 20px"></td>
								<td class="form-inline">
								<label class="lbl" for="end_time" >单位名称：</label>
								<select
									class="chzn-select" name="UNIT_ID" id="UNIT_ID" data-placeholder="请选择单位名称"
									style="width: 206px;">
									<option value=""></option>
										<option value="">全部</option>
										<c:forEach items="${NList}" var="ind">
											<option value="${ind.UNIT_ID }" <c:if test="${ind.UNIT_ID == pd.UNIT_ID}">selected</c:if>>${ind.UNIT_NAME_ABBREVIATION }</option>
										</c:forEach>
								</select></td>
								<td style="width: 20px"></td>
								<td class="form-inline">
								<label class="lbl" for="end_time" >部门名称：</label>
								<select
									class="chzn-select" name="DEPART_ID" id="DEPART_ID" data-placeholder="请选择部门名称"
									style="width: 206px;">
									<option value=""></option>
										<option value="">全部</option>
										<c:forEach items="${MList}" var="imd">
											<option value="${imd.DEPART_ID }" <c:if test="${imd.DEPART_ID == pd.DEPART_ID}">selected</c:if>>${imd.DEPART_NAME }</option>
										</c:forEach>
								</select></td>
								<td style="width: 20px"></td>

								<td style="vertical-align: top;">
									<button type="button" onclick="search();" class="btn btn-small btn-success btn-lg" title="检索" >查询<i class="icon-search icon-on-right"></i></button>
								</td>
								<td style="width: 20px"></td>
							</tr>
						</table>
						<hr/>
						<!-- 检索  -->
						<table id="table_report"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center" style="width:5%;">序号</th>
									<th class="center" style="width:17%;">单位名称</th>
									<th class="center" style="width:17%;">部门名称</th>
									<th class="center" style="width:17%;">职位名称</th>
									<th class="center" style="width:11%;">发布者</th>
									<th class="center" style="width:11%;">发布时间</th>
									<th class="center" style="width:11%;">修改时间</th>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty varList}">
										<c:forEach items="${varList}" var="ps" varStatus="vs">
											<tr>
												<td class='center' >${vs.index+1}</td>
												<td class="center">${ps.UNIT_NAME_ABBREVIATION }</td>
												<td class="center">${ps.DEPART_NAME }</td>
												<td class="tds"><a href="javascript:void(0);"
													title="${ps.POS_NAME }" onclick="info('${ps.POS_ID }','${ps.UNIT_ID }');">${ps.POS_NAME }</a></td>												
												<td class="center">${ps.USERNAME }</td>
												<td class="center">${ps.insert_timestamp }</td>
												<td class="center">${ps.update_timestamp}</td>
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
				</div>

				<!-- PAGE CONTENT ENDS HERE -->
			</div>
			<!--/row-->

		</div>
		<!--/#page-content-->
	</div>
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
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!--提示框-->
	<script type="text/javascript">
		$(top.hangge());
		//检索
		function search(){
			top.jzts();
			$("#Form").submit();
			 nextPage('${page.currentPage}');
		}
		
		
		//详情
		function info(POS_ID,UNIT_ID){
			<%-- window.location="<%=basePath%>unithis/to_Add.do?POS_ID="+POS_ID + "&UNIT_ID=" + UNIT_ID; --%>
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增个人经历";
			 diag.URL = dialogPath+"unithis/postion_to_Add.do?POS_ID="+POS_ID + "&UNIT_ID=" + UNIT_ID;
			 diag.Width = 600;
			 diag.Height = 400;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage("${page.currentPage}");
				}
				diag.close();
			 };
			 $("#ssd").dialog("close");
			 diag.show();
			
		}
			
		
		$(function() {	
			//级联
			var knowledges = $("#UNIT_ID").val();
			if(""!=knowledges){
				BindCId(knowledges);
			}else{
				BindCId(0);
			}
			$("#UNIT_ID").change(function() {
			    BindCId(0);
			});
				
			//下拉框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			
			//复选框
			$('table th input:checkbox').on('click' , function(){
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function(){
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});
			});
		});
		
		function BindCId(cid) {
			var PID = $("#UNIT_ID").val();
			$("#DEPART_ID").empty();
			if (PID == "") {
		        $("<option value=''>全部</option>").appendTo("#DEPART_ID");
		    }else{
		    	$.ajax({
					type:"POST",
					url:"<%=basePath%>position/getListAllDepart.do",
					data:{'PID' : PID},
					dataType:"json",
					cache:false,
					success:function(data){
						var html='<option value="">全部</option>';
						$.each(data.listAllDepart,function(i,list){
							if(list.DEPART_ID==cid){
								if(cid!=0){
									html+="<option value="+list.DEPART_ID+" selected='selected' >"+list.DEPART_NAME+"</option>";
								}
							}else{
								html+="<option value="+list.DEPART_ID+">"+list.DEPART_NAME+"</option>";
							}
						});
						$("#DEPART_ID").append(html);
						$("#DEPART_ID").trigger("liszt:updated");
					},
					error:function(data){
						var html='<option value="">全部</option>';
						$.each(data.listAllDepart,function(i,list){

							if(list.DEPART_ID==cid){
								if(cid!=0){
									html+="<option value="+list.DEPART_ID+" selected='selected' >"+list.DEPART_NAME+"</option>";
								}
							}else{
								html+="<option value="+list.DEPART_ID+">"+list.DEPART_NAME+"</option>";
							}
						});
						$("#DEPART_ID").append(html);
						$("#DEPART_ID").trigger("liszt:updated");
					}
				});
		    }
		}
		</script>
</body>
</html>

