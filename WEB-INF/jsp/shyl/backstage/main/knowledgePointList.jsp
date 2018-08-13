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
</style>
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
</style>
</head>
<body>
    <div class="container-fluid" id="main-container">
        <div id="page-content" class="clearfix">
            <div class="row-fluid">
                <div class="row-fluid">
                    <!-- 检索  -->
                    <form action="<%=basePath%>knowledge/list.do" method="post" name="pointForm" id="pointForm">
                        <table style="margin-bottom: 20px;">
                        	<tr>
								<td class="form-inline">
									<span class="input-icon"> 
										<input autocomplete="off" id="nav-search-input" type="text" name="title" style="width: 350px" value="${pd.title}" placeholder="输入知识点名" onblur="trim(this);" /> 
										<i id="nav-search-icon" class="icon-search"></i>
									</span>
								</td>
								<td style="width: 20px"></td>
								<td style="vertical-align: top;">
									<button class="btn btn-small btn-success btn-lg" onclick="search();" title="搜索">
										查询<i class="icon-search icon-on-right"></i>
									</button>
								</td>
								<td style="width: 20px"></td>
							</tr>
                        </table>
                        <!-- 检索  -->
                        <hr/>
                        <table>
							<tbody>
							<tr>
								<td nowrap="nowrap">
									<div class="contentline-both" style="margin-bottom: 10px;">
										<button type="button" class="btn btn-small btn-success btn-lg"  onclick="add()" title="添加">
										 新增<i class="icon-plus-sign icon-on-right"></i>
										</button>
									</div>
								</td>
							</tr>
						  </tbody>
						</table>
                        
                        <table id="table_report"
                            class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                	<th class="center" style="width:3%;">
                                		<label>
                                			<input type="checkbox" id="zcheckbox" /><span class="lbl"></span>
                                		</label>
                                	</th> 
                                    <th class="center" width="5%">序号</th>
                                    <th class="center" width="20%">知识点名</th>
                                    <th class="center" width="15%">题库</th>
                                    <th class="center" width="37%">描述</th>
                                    <th class="center" width="20%">操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- 开始循环 -->
                                <c:choose>
                                    <c:when test="${not empty pointList}">
                                        <c:forEach items="${pointList}" var="point" varStatus="vs">
                                            <tr>
                                            	<td class='center' ><label><input
															type='checkbox' name='ids' value="${point.point_id}" /><span
															class="lbl"></span></label></td>
                                                <td class='center' style="width: 30px;">${vs.index+1}</td>
                                                <td class='tds' title="${point.point_name }">${point.point_name }</td>
                                                <td class='center'>${point.field_name }</td>
                                                <td class='tds' title="${point.memo }">${point.memo }</td>
                                                <td class='center' style="width: 200px;">
                                                     <a class="btn btn-small btn-info" title="编辑" onclick="edit('${point.point_id }');"><i class="icon-edit"></i></a>
													 <a class="btn btn-small btn-danger" title="删除" onclick="del('${point.point_id}');"><i class="icon-trash"></i></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr class="main_info">
                                            <td colspan="10" class="center">没有相关数据</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                        <div class="page-header position-relative">
                            <table style="width: 100%;">
                                <tr>
                                	<td style="vertical-align: top;">
										<button type="button" class="btn btn-small btn-danger" onclick="makeAll('确定要删除选中的数据吗?')" title="批量删除">
											删除 <i class="icon-remove-sign icon-on-right"></i>
										</button>
									</td>
                                    <td style="vertical-align: top;"><div class="pagination"
                                            style="float: right; padding-top: 0px; margin-top: 0px;">${page.pageStr}</div></td>
                                </tr>
                            </table>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

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
			$("#pointForm").submit();
		}
        
        
      //新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = dialogPath+'knowledge/goAdd.do';
			diag.Width = 340;
			diag.Height = 330;
			diag.CancelEvent = function() { //关闭事件
				window.location.href = window.location.href;
				top.jzts();
				diag.close();
			};
			diag.show();
		}
      //修改
		function edit(point_id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="修改";
			 diag.URL = dialogPath+'knowledge/goUpdate.do?point_id='+point_id;
			diag.Width = 340;
			diag.Height = 330;
			diag.CancelEvent = function() { //关闭事件
				window.location.href = window.location.href;
				top.jzts();
				diag.close();
			};
			diag.show();
		}
      
		//删除
		function del(point_id){
			bootbox.confirm("确定要删除该条数据吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>knowledge/delPoint.do?point_id="+point_id;
					$.get(url,function(data){
						nextPage("${page.currentPage}");
					});
				}
			});
		}
		
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(str=='') str += document.getElementsByName('ids')[i].value;
						  	else str += ',' + document.getElementsByName('ids')[i].value;
						  }
					}
					if(str==''){
						bootbox.dialog("您没有选择任何内容!", 
							[
							  {
								"label" : "关闭",
								"class" : "btn-small btn-success",
								"callback": function() {
									}
								}
							 ]
						);
						
						$("#zcheckbox").tips({
							side:3,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>knowledge/deleteAllPoint.do?tm=' + new Date().getTime(),
								data : {
									IDS : str
								},
								dataType : 'json',
								cache : false,
								success : function(data) {
									$.each(
											data.list,
											function(
													i,
													list) {
												nextPage("${page.currentPage}");
											});
								}
													});
										} 
									}
								}
							});
		}
		
		$(function() {
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});

			//复选框
			$('table th input:checkbox').on(
					'click',
					function() {
						var that = this;
						$(this).closest('table').find(
								'tr > td:first-child input:checkbox').each(
								function() {
									this.checked = that.checked;
									$(this).closest('tr').toggleClass(
											'selected');
								});
					});
		});	
      
    </script>

</body>
</html>