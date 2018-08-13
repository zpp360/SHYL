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
</style>
</head>
<body>
    <div class="container-fluid" id="main-container">
        <input type="hidden" id="fieldNum" value="${pd.fieldNum}"/>
		<input type="hidden" id="pointNum" value="${pd.pointNum}"/>
        <div id="page-content" class="clearfix">
            <div class="row-fluid">
                <div class="row-fluid">
                    <!-- 检索  -->
                    <form action="<%=basePath%>examPaper/getAllField.do?fieldNum=${pd.fieldNum}&pointNum=${pd.pointNum}" method="post" name="userForm"
                        id="userForm" class="form-horizontal">
                        <input value="${pd.checkedIds}" id="checkedIds" name="checkedIds" type="hidden"/>
                        <table style="margin-bottom: 20px;">
                           <tr>
								<td class="form-inline">
									<label class="lbl" for="">&#12288;&#12288;题库：</label> 
									<select style="width: 200px;" class="chzn-select" id="Questions" name="Questions" data-placeholder="请选择题库" disabled="disabled">
									    <option value=""></option>
										<option value="">全部</option>
										<c:forEach items="${questionslist}" var="que">
											<option value="${que.id }" <c:if test="${que.id == pd.Questions }">selected</c:if>>${que.name }</option>
										</c:forEach>
									</select>
								</td>
								<td class="form-inline">
									<label class="lbl" for="">&#12288;&#12288;知识分类：</label> 
									<select  style="width: 200px;" class="chzn-select" id="Knowledge" name="Knowledge" data-placeholder="请选择知识分类" disabled="disabled">
									    <option value=""></option>
										<option value="">全部</option>
										<c:forEach items="${knowledgelist}" var="know">
											<option value="${know.id }" <c:if test="${know.id == pd.Knowledge }">selected</c:if>>${know.name }</option>
										</c:forEach>
									</select>
								</td>
								<td class="form-inline">
									<label class="lbl" for="user_status">&#12288;&#12288;试题分类：</label> 
									<select  style="width: 200px;" class="chzn-select" id="TestQuestion" name="TestQuestion" data-placeholder="请选择试题分类">
									    <option value=""></option>
										<option value="">全部</option>
										<c:forEach items="${testquestionlist}" var="testq">
											<option value="${testq.id }" <c:if test="${testq.id == pd.TestQuestion }">selected</c:if>>${testq.name }</option>
										</c:forEach>
									</select>
								</td>
								<td style="width: 20px"></td>
								<td style="vertical-align: top;">
									<button type="button" onclick="search();" class="btn btn-small btn-success btn-lg" title="检索" >查询<i class="icon-search icon-on-right"></i></button>
								</td>
							</tr>
                        </table>
                        <!-- 检索  -->
                        <hr/>
                        <table id="table_report"
                            class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th class="center" style="width: 3%;"><label><input
											type="checkbox" id="zcheckbox1" /><span class="lbl"></span></label></th>
                                    <th class="center" width="5%">序号</th>
                                    <th class="center" width="25%">试题名称</th>
                                    <th class="center" width="10%">试题类型</th>
                                    <th class="center" width="15%">专业</th>
                                    <th class="center" width="20%">知识分类</th>
                                </tr>
                            </thead>
                            <tbody id="tbodyId">
                                <!-- 开始循环 -->
                                <c:choose>
                                    <c:when test="${not empty fieldlist}">
                                        <c:forEach items="${fieldlist}" var="field" varStatus="vs">
                                            <tr>
                                                <td class='center'><label><input
														type='checkbox' name='ids' value="${field.id}" /><span
														class="lbl"></span></label></td>
                                                <td class='center' style="width: 30px;">${vs.index+1}</td>
                                                <td class="tds" style="width:400px"><a
														href="javascript:void(0);" title='<c:out value="${field.name}"></c:out>'
														onclick="info('${field.id}');"><xmp>${field.name}</xmp></a></td>
                                                <td class='center'>${field.questionTypeName}</td>
                                                <td class='center'>${field.fieldName}</td>
                                                <td class='center'>${field.pointName}</td>
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
		
	</script>

	<script type="text/javascript">
	
		$(function() {
			//换页保存数据开始
			//页码切换时，获取试题ID
			var values = $("#checkedIds").val();
			var checkedIds;
			var ids;
			if(values!=""){
				checkedIds= values.split(",");// 在每个逗号(,)处进行分解。
				for(var i=0;i<checkedIds.length;i++){
					var checkboxs = $("#tbodyId input[type=checkbox]");
					$.each(checkboxs, function() {
						var id = $(this).val();
						if($(this).val()==checkedIds[i]){
							$(this).prop("checked",true);
						}
					});
					}
			}else{
				checkedIds= new Array();
			}
			var checkboxsAll = $("#tbodyId input[type=checkbox]:checked");
			if(checkboxsAll.length==15){
				$('table th input:checkbox').prop("checked",true);
			}else{
				$('table th input:checkbox').prop("checked",false);
			}
			$("#tbodyId input[type=checkbox]").change(
					function() {
						if($(this).prop("checked")==true){
							var id = $(this).val();
							checkedIds.push(id);
						}else if($(this).prop("checked")==false){
							var id = $(this).val();
							var index = checkedIds.indexOf(id); 
							checkedIds.splice(index,1);
						}
						ids = checkedIds.join(',');
						$("#checkedIds").val(ids);
						var checkboxsAll = $("#tbodyId input[type=checkbox]:checked");
						if(checkboxsAll.length==15){
							$('table th input:checkbox').prop("checked",true);
						}else{
							$('table th input:checkbox').prop("checked",false);
						}
					});	
			//换页保存数据结束
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			
			//复选框
			$('table th input:checkbox').on('click' , function(){
				var values = $("#checkedIds").val();
				var ids;
				var that = this;
				//获取隐藏域中的已选中的试题ID
				if(values!=""){
					checkedIds= values.split(",");// 在每个逗号(,)处进行分解。
				}else{
					checkedIds = new Array();
				}
				$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function(){
					this.checked = that.checked;
					if(this.checked){
						var id = $(this).val();
						if(checkedIds.indexOf(id)==-1){
						checkedIds.push(id);}
					}else{
						var id = $(this).val();
						var index = checkedIds.indexOf(id); 
						if(checkedIds.indexOf(id)!=-1){
							checkedIds.splice(index, 1);}
					}
					$(this).closest('tr').toggleClass('selected');
				});
				ids = checkedIds.join(',');
				$("#checkedIds").val(ids);	
			});
			
		});
		
		//检索
		function search(){
			top.jzts();
			$("#userForm").submit();
			 nextPage('${page.currentPage}');
		}
		
		//详情
		function info(field_id){
			var fieldNum =$("#fieldNum").val();
	    	var pointNum =$("#pointNum").val();
			window.location="<%=basePath%>examPaper/to_Preview.do?questionId="+field_id+"&fieldNum="+fieldNum+"&pointNum="+pointNum;
		}
		</script>

</body>
</html>