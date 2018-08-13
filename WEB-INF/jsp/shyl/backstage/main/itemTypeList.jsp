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
</head>
<body>
    <div class="container-fluid" id="main-container">
        <div id="page-content" class="clearfix">
            <div class="row-fluid">
                <div class="row-fluid">
                    <!-- 检索  -->
                    <form action="<%=basePath%>question/list.do" method="post" name="itemForm" id="itemForm">
                        <table style="margin-bottom: 20px;">
                        	<tr>
								<td class="form-inline">
									<span class="input-icon"> 
										<input autocomplete="off" id="nav-search-input" type="text" name="title" style="width: 350px" value="${pd.title }" placeholder="输入题库类型" onblur="trim(this);" /> 
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
                        <table id="table_report"
                            class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th class="center" width="5%">序号</th>
                                    <th class="center" width="30%">题库类型</th>
                                    <th class="center" width="45%">题库描述</th>
                                    <th class="center" width="20%">操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- 开始循环 -->
                                <c:choose>
                                    <c:when test="${not empty fieldlist}">
                                        <c:forEach items="${fieldlist}" var="field" varStatus="vs">
                                            <tr>
                                                <td class='center' style="width: 30px;">${vs.index+1}</td>
                                                <td class="tds" title="${field.field_name }">${field.field_name }</td>
                                                <td class="tds" title="${field.memo }">${field.memo }</td>
                                                <td class='center' style="width: 200px;">
                                                     <a class="btn btn-small btn-info" title="修改" onclick="edit('${field.field_id }');"><i class="icon-edit"></i></a>
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
			$("#itemForm").submit();
		}
        
        
      //新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = dialogPath+'question/goAdd.do';
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
		function edit(field_id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="修改";
			 diag.URL = dialogPath+'question/goUpdate.do?field_id='+field_id;
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
		function del(field_id){
			bootbox.confirm("确定要删除该条数据吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>question/delField.do?field_id="+field_id;
					$.get(url,function(data){
						nextPage("${page.currentPage}");
					});
				}
			});
		}
      
    </script>

</body>
</html>