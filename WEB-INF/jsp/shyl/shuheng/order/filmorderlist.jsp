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
	<div class="container-fluid" id="main-container">
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<div class="row-fluid">
					<!-- 检索  -->
					<form action="<%=basePath%>order/filmorderlist.do" method="post" name="Form" id="Form">
						<table style="margin-bottom: 20px;">
							<tr>
								<td class="form-inline">
								<label class="lbl" for="end_time" >预约码：</label>
								<span class="input-icon"> <input
										autocomplete="off" id="order_number" type="text"
										name="order_number" style="width: 130px" value="${pd.order_number }"
										placeholder="这里输入预约码" onblur="trim(this);" /> <i id="nav-search-icon"
										class="icon-search"></i>
								</span></td>
								<td class="form-inline">
									<label class="lbl" for="">预约状态：</label> 
									<select class="chzn-select" id="order_status" name="order_status" data-placeholder="请选择预约状态">
										<option value="">全部</option>
									    <option value="1" <c:if test="${pd.order_status=='1' }">selected</c:if>>预约成功</option>
									    <option value="0" <c:if test="${pd.order_status=='0' }">selected</c:if>>取消预约</option>
									</select>
								</td>
								<td class="form-inline">
									<label class="lbl" for="">电影院：</label> 
									<select class="chzn-select" id="place_id" name="place_id" data-placeholder="请选择电影院">
										<option value="">全部</option>
										<c:forEach items="${filmList}" var="p" >
										    <option value="${p.place_id}" <c:if test="${pd.place_id==p.place_id }">selected</c:if>>${p.p_name }</option>
										</c:forEach>
									</select>
								</td>
								<td class="form-inline">
									<label class="lbl" for="">电影：</label> 
									<select class="chzn-select" id="film_id" name="film_id" data-placeholder="请选择电影">
										<option value="">全部</option>
										
									</select>
								</td>
								<td class="form-inline">
									<label class="lbl" for="">场次：</label> 
									<select class="chzn-select" id="film_detail_id" name="film_detail_id" data-placeholder="请选择电影场次">
										<option value="">全部</option>
										
									</select>
								</td>
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
									<th class="center" style="width:3%;"><label><input type="checkbox"
											id="zcheckbox" /><span class="lbl"></span></label></th> 
									<th class="center" style="width:5%;">序号</th>
									<th class="center" style="width:10%;">姓名</th>
									<th class="center" style="width:10%;">预约码</th>
									<th class="center" style="width:10%;">预约状态</th>
									<th class="center" style="width:10%;">预约时间</th>
									<th class="center" style="width:10%;">电影名称</th>
									<th class="center" style="width:12%;">电影场次</th>
									<th class="center" style="width:15%;">影院名称</th>
									<th class="center" style="width:15%;">操作</th>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty pdList}">
											<c:forEach items="${pdList}" var="list" varStatus="vs">
												<tr>
													<td class='center' ><label><input
															type='checkbox' name='ids' value="${list.order_id}" /><span
															class="lbl"></span></label></td>
													<td class='center' >${vs.index+1}</td>
													<td class="center">${list.user_name }</td>
													<td class="center">${list.order_number }</td>
													<td class="center"><c:if test="${list.order_status == 0 }">取消预约</c:if> <c:if test="${list.order_status == 1 }">预约成功</c:if></td>
													<td class="center">${list.order_time }</td>
													<td class="center">${list.film_name }</td>
													<td class="center">${list.film_date } ${film_start_time }</td>
													<td class="center">${list.p_name}</td>
													<td  class="center">
														<a class="btn btn-small btn-info" onclick="qrCode('${list.order_id}');" title="查看二维码">二维码</a>
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
				</div>




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
		//查看二维码
		function qrCode(orderId){
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="二维码";
			 diag.URL = dialogPath+'order/qrcode.do?order_id='+orderId;
			 diag.Width = 140;
			 diag.Height = 140;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		
		
		$(function() {
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			
			
			$("#place_id").change(function(){
				var placeId = $(this).val();
				$("#film_id").empty()
				$("#film_detail_id").empty();
				$.ajax({
					   type : "POST",
					   url: "<%=basePath%>order/filmlist.do",
					   data:{'place_id' : placeId},
					   dataType:"json",
					   cache:false,
					   success: function(data){
						   var html='<option value="">全部</option>';
						   $.each(data,function(i,list){
							   html+="<option value='"+list.film_id+"'>"+list.film_name+"</option>";
						   });
						   $("#film_id").append(html);
						   $("#film_id").trigger("liszt:updated");
					   }
				 });
				
			});
			
			$("#film_id").change(function(){
				var filmId = $(this).val();
				$("#film_detail_id").empty();
				$.ajax({
					   type : "POST",
					   url: "<%=basePath%>order/filmdetaillist.do",
					   data:{'film_id' : filmId},
					   dataType:"json",
					   cache:false,
					   success: function(data){
						   var html='<option value="">全部</option>';
						   $.each(data,function(i,list){
							   html+="<option value='"+list.film_detail_id+"'>"+list.film_date+"</option>";
						   });
						   $("#film_detail_id").append(html);
						   $("#film_detail_id").trigger("liszt:updated");
					   }
				 });
				
			});
			
		});
	</script>
</body>
</html>

