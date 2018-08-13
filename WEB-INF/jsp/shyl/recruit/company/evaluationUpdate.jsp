<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.shyl.framework.entity.system.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String pointid = request.getParameter("pointid");//用request得到 
	String fieldid = request.getParameter("fieldid");//用request得到 
	session.setAttribute("pointid",pointid);
	session.setAttribute("fieldid",fieldid);
	User platUser = (User)request.getSession().getAttribute("platUser");
	String USERID = platUser.getUSER_ID();
	session.setAttribute("USERID",USERID);
%>
<!DOCTYPE html>
<html lang="en">
<title>修改试卷_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<base href="<%=basePath%>">
<jsp:include page="../../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link rel="stylesheet"
	href="<%=basePath%>shyl/css/question/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="<%=basePath%>shyl/css/question/font-awesome/css/exam.css" />
<link rel="stylesheet"
	href="<%=basePath%>shyl/css/question/font-awesome/css/morris.css" />
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/question/all.js"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/question/exampaper-edit.js"></script>
<style>
			#add-more-qt-to-paper{
				cursor: pointer;
				color: #1ba1e2;
			}
			#add-more-qt-to-paper:hover{
				color:#ff7f74;
			}
			#add-more-qt-to-paper i{
				color: #47a447;
				cursor: pointer;
				margin-right:5px;	
			}
			
			#qt-selector-iframe{
				border:none;
				height:600px;
			}
			.tmp-ques-remove{
				margin-left:10px;
			}
			
			.question-point{
				padding:0 8px;
				margin:0 2px;
				border-bottom: 1px solid;
				cursor:pointer;
			}
			.question-point:hover{
				color:#ff7f74;
			}
		</style>
</head>
<body>
<input type="hidden" value="<%=pointid%>" id="pointid">
<input type="hidden" value="<%=fieldid%>" id="fieldid">
<input type="hidden" value="<%=USERID%>" id="USERID">
<!-- 及格分值 -->
<input type="hidden" value="${pass_point}" id="pass_point">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param
				value="32" name="menuType" /></jsp:include>
		<div class="mypage_right" style="min-height:920px;">
		<h2 style="color:color:black;">修改试卷</h2>
		<div>
			<div class="container" style="min-height:500px;font-size:0.85em !important;color:black;">

				<div class="row">
			<div class="col-xs-8">
						<div class="page-content row">
							<div class="def-bk" id="bk-exampaper">

								<div class="expand-bk-content" id="bk-conent-exampaper">
									<div id="exampaper-header">
										<div id="exampaper-title">
											<i class="fa fa-send"></i>
											<span id="exampaper-title-name"> ${exampapername} </span>
											<span style="display:none;" id="exampaper-id">${exampaperid}</span>
											
										</div>
										<div id="exampaper-desc-container">
											<div id="exampaper-desc" class="exampaper-filter">
												
											
											</div>
											<div style="margin-top: 5px;">
												<span>试卷总分：</span><span id="exampaper-total-point" style="margin-right:20px;"></span>
												<span id="add-more-qt-to-paper"><i class="small-icon fa fa-plus-square" title="添加选项"></i><span onclick="test()">增加更多题目</span></span>
											</div>
										</div>
										
										
									</div>
									<input id="single" type="hidden" value="" />
									<ul id="exampaper-body" style="padding:0px;">
										${htmlStr}
									</ul>
									<div id="exampaper-footer">
										<div id="question-navi">
										<div id="question-navi-controller">
											<i class="fa fa-arrow-circle-down"></i>
											<span>答题卡</span>
										</div>
										<div id="question-navi-content">
										</div>
										</div>
										<div style="padding-left:30px;">
											<button class="btn btn-danger"><i class="fa fa-save"></i>保存试卷</button>
										</div>
										
									</div>
								</div>

							</div>
						</div>
					</div>
					</div>
					</div>
					</div>
					</div>
					</div>
					<div class="modal_h10 fade" id="question-selector-modal">
						  <div class="modal-dialog modal-lg">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						        <h4 class="modal-title">选择试题添加到试卷中</h4>
						      </div>
						      <div class="modal-body">
						        <iframe  id="qt-selector-iframe" src="<%=basePath%>papermain/questionlist.act?point_id=<%=pointid%>&field_id=<%=fieldid%>&USERID=<%=USERID%>" width="100%"></iframe>
						      </div>
						      <div class="modal-footer">
							        <button type="button" class="btn btn-default" data-dismiss="modal">关闭窗口</button>
							        <button id="add-list-to-exampaper" type="button" class="btn btn-primary">添加选中</button>
							      </div>
						      
						    </div>
						    <!-- /.modal-content -->
						  </div>
						  <!-- /.modal-dialog -->
			</div>
			<!--修改分数 -->
			<div class="modal_h20 fade" id="question-point-modal">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				        <h4 class="modal-title">修改分数</h4>
				      </div>
				      <div class="modal-body">
				        	<form>
								<div class="form-line qt-point-destination">
									<span class="form-label">分数：</span>
									<label></label>
									<input type="text" value=""/>
								</div>
								<div class="form-line">
									<button class="btn btn-sm btn-success" id="update-point-btn"><i class="fa fa-check"></i>仅修改第<span id="qt-point-target-index"></span>题</button>
									<button class="btn btn-sm btn-warning" id="update-point-type-btn"><i class="fa fa-random"></i>批量更新该题型</button>
								</div>
							</form> 

				      </div>
				      
				    </div>
				    <!-- /.modal-content -->
				  </div>
				  <!-- /.modal-dialog -->
			</div>
			<div class="modaldel fade in" id="resultzero" tabindex="-1" role="dialog" aria-labelledby="delresume" aria-hidden="false" data-backdrop="static" data-target="" style="display: none;">
				<div class="modal-dialog modal-sm">
				    <div class="modal-content">
				        <div class="modal-header">
				            <button type="button" class="close" data-dismiss="modal" onclick="Clear()"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
				            <h4 class="modal-title" id="myModalLabel">提示</h4>
				        </div>
				        <div class="modal-body">
				            <p id="warntext">分数不能为0</p>
				        </div>
				        <div class="modal-footer">
				            <button type="button" class="btn btn-success"  data-dismiss="modal" id="d">确认</button>
				            <button type="button" class="btn btn-default"  data-dismiss="modal">关闭</button>
				        </div>
				    </div>
				</div>
			</div>
			
			<div class="modaldel fade in" id="sumSurpuls" tabindex="-1" role="dialog" aria-labelledby="delresume" aria-hidden="false" data-backdrop="static" data-target="" style="display: none;">
				<div class="modal-dialog modal-sm">
				    <div class="modal-content">
				        <div class="modal-header">
				            <button type="button" class="close" data-dismiss="modal" onclick="Clear()"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
				            <h4 class="modal-title" id="myModalLabel">提示</h4>
				        </div>
				        <div class="modal-body">
				            <p id="warntext">总分不能小于及格分数</p>
				        </div>
				        <div class="modal-footer">
				            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				        </div>
				    </div>
				</div>
			</div>
			
			<script type="text/javascript">
			$(function(){
				$("div.head").attr("style","width: 100%;box-shadow: 0 5px 5px rgba(0,0,0,0.1);left: 0;top: 0;z-index: 9999;");
				$('#question-selector-modal').on('hidden.bs.modal', function() {
					$("#qt-selector-iframe").contents().find("input[name='resetButton']").trigger("click");
					$("#qt-selector-iframe").contents().find("input[name='checkedIds']").val('');
					$('#qt-selector-iframe').attr('src', $('#qt-selector-iframe').attr('src'));
				});
			})
			$("#exampaper-footer button").click(function(){
				
				// 当前总分 
				var sumCount = parseInt($("#exampaper-total-point").html());
				// 及格分值
				var sumPass = parseInt($("#pass_point").val());
				/* // 新更题分值
				var newPoint = parseFloat($(".qt-point-destination input").val());
				// 当前题分值
				var frontCount=parseInt($("#single").val());
				// 除去当前题剩余题分值
				var sumSurpuls = sumCount-frontCount+newPoint; */
				//成功/失败。
				if(sumPass>sumCount){
					$("#sumSurpuls").modal('show');
					return false;
				}
				
				var map=composeEntity();
				var count = 0;
				for (var k in map) {
				    if (map.hasOwnProperty(k)) {
				       ++count;
				    }
				}
				if(examing.getType($("#exampaper-total-point").text())=="float"){
// 					util.error("总分不能有小数");
					$("#sumSurpuls").modal('show');
					$("#sumSurpuls #warntext").text("总分不能有小数");
					return false;
				}
				if(count!= $(".question").length){
					return false;
				}else{
					var exampaperid=($("#exampaper-id").text());
					$.ajax({
						type : "POST",
						url : '<%=basePath%>papermain/updateExampaper.act',
						data : {
							exampaperid:exampaperid,
							newpoint:JSON.stringify(map)
							},
							dataType : 'json',
							cache : false,
							success : function(message, tst, jqXHR) {
								if (message.result == "success") {
									// 跳转到一览页面
									window.location.href = "<%=basePath%>papermain/list.act";
								} else {
// 									bootbox.alert("操作失败请稍后尝试");
									$("#sumSurpuls").modal('show');
									$("#sumSurpuls #warntext").text("操作失败请稍后尝试");
								}
							},
							error : function(jqXHR, textStatus) {
// 								bootbox.alert("操作失败请稍后尝试");
								$("#sumSurpuls").modal('show');
								$("#sumSurpuls #warntext").text("操作失败请稍后尝试");
							}
					});
				}
			});
			function composeEntity(){
			var forms = $(".question");
			var map = new Object();
			forms.each(function(){
				var question_point = $(this).find("span.question-point").text();
				if(question_point=="0"){
					$("#resultzero").modal('show');
					return false;
				}
				var question_id = $(this).find("span.question-id").text();
				map[question_id] = question_point;
			});
			return map;
			}
			$("button#add-list-to-exampaper").click(function() {
				var values = new Array();
				var questions = new Array();
				var questionIds;
				var forms = $(".question");
				forms.each(function(){
					questions.push($(this).find("span.question-id").text());
						});
				questionIds = questions.join(',');
// 				var checkboxs = $("#qt-selector-iframe").contents().find("table input:checked");
				var checkedIds = $("#qt-selector-iframe").contents().find("#checkedIds").val();
// 				$.each(checkboxs, function() {
// 					var id = $(this).val();
// 					values.push(id);
// 				});
				if (checkedIds=="") {
					$("#sumSurpuls").modal('show');
					$("#sumSurpuls #warntext").text("请选择需要添加的试题!");
				}else{
					var request = $.ajax({
						type : "POST",
						url : '<%=basePath%>papermain/addquestion.act',
						data :{values:JSON.stringify(checkedIds),
							questionIds : JSON.stringify(questionIds)}
					});
					request.done(function(questionList,tst,jqXHR) {
						if(!util.checkSessionOut(jqXHR))return false;
						for(var i=0;i<questionList.length;i++){
							var question=questionList[i];
							var deletehtml = "<a class=\"tmp-ques-remove\" title=\"删除此题\">删除</a>";
							var newquestion = $('<div/>').html(question.content).contents();
							newquestion.find(".question-title").append(deletehtml);
							$("#exampaper-body").append(newquestion);
						}
						examing.refreshNavi();
						examing.addNumber();
						examing.updateSummery();
						$("#question-selector-modal").modal('hide');

						var questions = $("li.question");
						examing.scrollToElement($(questions[questions.length-1]));
						
					});
						 
					request.fail(function(jqXHR, textStatus) {
// 						util.error("操作失败请稍后尝试");
						$("#sumSurpuls").modal('show');
						$("#sumSurpuls #warntext").text("操作失败请稍后尝试");
					});
				}
			});
			function test(){
				var pointid=$("#pointid").val();
				var fieldid=$("#fieldid").val();
				var USERID=$("#USERID").val();
				document.getElementById("qt-selector-iframe").contentWindow.childtest(pointid,fieldid,USERID);
			}
			</script>
<%@ include file="../../common/footer.jsp"%>
</body>
</html>