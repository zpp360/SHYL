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
<script src="<%=basePath%>shyl/js/question/fieldList.js" type="text/javascript"></script>
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
.tdex {  
    width:100%;  
    word-break:keep-all;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
    vertical-align: center;
}
</style>
</head>
<body>
    <div class="container-fluid" id="main-container">
        <div id="page-content" class="clearfix">
            <div class="row-fluid">
                <div class="row-fluid">
                    <!-- 检索  -->
                    <form action="<%=basePath%>testquestion/list.do" method="post" name="userForm"
                        id="userForm" class="form-horizontal">
                        <input type="hidden" id="knowledges" value="${pd.Knowledge}"/>
                        <table style="margin-bottom: 20px;">
                           <tr>
								<td class="form-inline">
									<label class="lbl" for="">题库：</label> 
									<select class="chzn-select" id="Questions" name="Questions" data-placeholder="请选择题库">
									    <option value=""></option>
										<option value="">全部</option>
										<c:forEach items="${questionslist}" var="que">
										<c:if test="${que.id==8}">
											<option value="${que.id }" <c:if test="${que.id == pd.Questions }">selected</c:if>>${que.name }</option>
										</c:if>
										</c:forEach>
									</select>
								</td>
								<td class="form-inline">
									<label class="lbl" for="">&#12288;&#12288;知识分类：</label> 
									<select class="chzn-select" id="Knowledge" name="Knowledge" data-placeholder="请选择知识分类">
									    <option value=""></option>
									</select>
								</td>
								<td class="form-inline">
									<label class="lbl" for="user_status">&#12288;&#12288;试题分类：</label> 
									<select class="chzn-select" id="TestQuestion" name="TestQuestion" data-placeholder="请选择试题分类">
									    <option value=""></option>
										<option value="">全部</option>
										<c:forEach items="${testquestionlist}" var="testq">
											<option value="${testq.id }" <c:if test="${testq.id == pd.TestQuestion }">selected</c:if>>${testq.name }</option>
										</c:forEach>
									</select>
								</td>
								<td style="width: 10px"></td>
								<td style="vertical-align: top;">
									<button type="button" onclick="search();" class="btn btn-small btn-success btn-lg" title="检索" >查询<i class="icon-search icon-on-right"></i></button>
								</td>
								
							</tr>
                        </table>
                        <!-- 检索  -->
                        <hr/>
                        <table>
							<tbody>
							<tr>
								<td nowrap="nowrap">
									<div class="contentline-both" style="margin-bottom: 10px;" >
										<button type="button" class="btn btn-small btn-success btn-lg"  onclick="add()" title="添加">
										新增 <i class="icon-plus-sign icon-on-right"></i>
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
                                    <th class="center" style="width: 3%;"><label><input
											type="checkbox" id="zcheckbox" /><span class="lbl"></span></label></th>
                                    <th class="center" width="3%">序号</th>
                                    <th class="center" width="25%">试题名称</th>
                                    <th class="center" width="19%">试题类型</th>
                                    <th class="center" width="15%">题库分类</th>
                                    <th class="center" width="20%">知识分类</th>
                                    <th class="center" width="15%">操作</th>
                                </tr>
                            </thead>
                            <tbody>
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
														onclick="info('${field.id}');"><xmp  class="tdex" >${field.name}</xmp></a></td>
                                                <td class='center'>${field.questionTypeName}</td>
                                                <td class='center tds'>${field.fieldName}</td>
                                                <td class='center tds'>${field.pointName}</td>
                                                <td class='center' style="width: 200px;">
                                                     <a class="btn btn-small btn-info" title="编辑" onclick="editField('${field.id }','${field.pointId }','${field.fieldId }');"><i class="icon-edit"></i></a>
													 <a class='btn btn-small btn-danger' title="取消" onclick="delField('${field.id }');"><i class="icon-trash"></i></a>
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
		
	</script>

	<script type="text/javascript">
	
		$(function(){
			var knowledges = $("#knowledges").val();
			if(""!=knowledges){
				BindCId(knowledges);
			}else{
				BindCId(0);
			}
			$("#Questions").change(function() {
			    BindCId(0);
			});
			
			//合并的：$(function(){});
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			
		});
		
		function BindCId(cid) {
			var PID = $("#Questions").val();
			$("#Knowledge").empty();
			if (PID == "") {
		        $("<option value=''>全部</option>").appendTo("#Knowledge");
		    }else{
		    	$.ajax({
					type:"POST",
					url:"<%=basePath%>testquestion/getKnowledgesList.do",
					data:{'PID' : PID},
					dataType:"json",
					cache:false,
					success:function(data){
						var html='<option value="">全部</option>';
						$.each(data.knowledgeList,function(i,list){
							if(list.point_id==cid){
								if(cid!=0){
									html+="<option value="+list.point_id+" selected='selected' >"+list.point_name+"</option>";
								}
							}else{
								html+="<option value="+list.point_id+">"+list.point_name+"</option>";
							}
						});
						$("#Knowledge").append(html);
						$("#Knowledge").trigger("liszt:updated");
					}
				});
		    }
		}
	
		//检索
		function search(){
			top.jzts();
			$("#userForm").submit();
			 nextPage('${page.currentPage}');
		}
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					var emstr = '';
					var phones = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(str=='') str += document.getElementsByName('ids')[i].value;
						  	else str += ',' + document.getElementsByName('ids')[i].value;
						  	
						  	if(emstr=='') emstr += document.getElementsByName('ids')[i].id;
						  	else emstr += ';' + document.getElementsByName('ids')[i].id;
						  	
						  	if(phones=='') phones += document.getElementsByName('ids')[i].alt;
						  	else phones += ';' + document.getElementsByName('ids')[i].alt;
						  }
					}
					if(str==''){
						bootbox.dialog("您没有选择任何内容!", 
							[
							  {
								"label" : "关闭",
								"class" : "btn-small btn-success",
								"callback": function() {
									//Example.show("great success");
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
								url: '<%=basePath%>testquestion/deleteAllNews.do?tm='+ new Date().getTime(),
														data : {IDS : str},
														dataType : 'json',
														//beforeSend: validateData,
														cache : false,
														success : function(data) {
															$
																	.each(
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
		
		//修改
		function editField(Id,pointId,fieldId){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="修改分类";
			 diag.URL = dialogPath+"testquestion/goEditQ.do?Id="+Id+"&pointId="+pointId+"&Major="+fieldId;
			 diag.Width = 400;
			 diag.Height = 150;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage("${page.currentPage}");
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除试题
		function delField(Id){
			bootbox.confirm("确定要删除该试题?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>testquestion/del.do?Id="+Id;
					$.get(url,function(data){
						nextPage("${page.currentPage}");
					});
				}
			});
		}
		</script>

</body>
</html>