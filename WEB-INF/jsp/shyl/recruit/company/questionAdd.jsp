<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
   		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>试题管理</title>
		<jsp:include page="../../common/header.jsp"></jsp:include>
		<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
		<script src="js/jquery-v1.10.2.js" type="text/javascript"></script>
		<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
		<link rel="stylesheet" href="<%=basePath%>shyl/css/style_another.css" />
		<link rel="stylesheet" href="<%=basePath%>shyl/css/question/font-awesome/css/font-awesome.min.css" />
		<link rel="stylesheet" href="<%=basePath%>shyl/css/question/font-awesome/css/exam.css" />
		<link rel="stylesheet" href="<%=basePath%>shyl/css/question/font-awesome/css/morris.css" />
		<script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>

		<link href="<%=basePath%>shyl/css/question/css/question-add.css" rel="stylesheet">
		<link href="<%=basePath%>shyl/css/question/css/jquery-ui-1.9.2.custom.min.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
		    .box
			{
			box-sizing:border-box;
			-moz-box-sizing:border-box; /* Firefox */
			-webkit-box-sizing:border-box; /* Safari */
			width:100%;
			float:left;
			}
			.uploadify-button-text{
				text-decoration: underline;
			}
			
			span.add-img{
				text-decoration: underline;
				cursor:pointer;
			}
			
			span.add-img:hover{
				text-decoration: underline;
			}
			
			.swfupload {
   				z-index: 10000 !important;
			}
			
			.add-content-img{
				display:block;
			}
			
			.diaplay-img{
				margin-right:5px;
			}
			
			.diaplay-img:hover{
				text-decoration: underline;
				
			}
			
			.selectCss {
				width: 100px;
				background-color: #ecf0f9;
				line-height: 42px;
				height: 28px;
				border: 0;
				border-radius: 5px;
				font-size: 1.0em;
            }
           .selectshort {
				width: 40px;
				background-color: #ecf0f9;
				line-height: 42px;
				height: 28px;
				border: 0;
				border-radius: 5px;
				font-size: 1.0em;
            }
            .selectlong {
				width: 60px;
				background-color: #ecf0f9;
				line-height: 42px;
				height: 28px;
				border: 0;
				border-radius: 5px;
				font-size: 1.0em;
            }
            .inputCss {
				width: 160px;
				background-color: #ecf0f9;
				line-height: 42px;
				height: 28px;
				border: 0;
				border-radius: 5px;
				font-size: 1.0em;
				float:left;
            }
		</style>
		<!-- 动态知识点设置 -->
		<script type="text/javascript">
			$(function(){
				var selection = $("#aq-course1").find("select");
				var point_list = $("#aq-course2").find("select");
				selection.change(function(){
					$.post('<%=basePath%>papermain/get-knowledge-point.act', {
						fieldId : selection.val()
					}, function(data) {
						point_list.empty();
						$.each(data.knowledgepoint, function(i, list) {
							point_list.append("<option value=\"" + list.pointId + "\">" + list.pointName + "</option>");
						});
					});
				});
		   });
		</script>
	</head>
	<body>
	<div class="clear"></div>
<div class="register-box p0">
	<div class="rticon"></div>
	<jsp:include page="../../common/left.jsp"><jsp:param value="35" name="menuType"/></jsp:include>
	<div class="mypage_right" style="min-height:920px;">
		<h2 style="color:black;">添加试题</h2>
		<div>
			<div class="container" style="min-height:500px;font-size:0.85em !important;color:black;">

				<div class="row">
					<div class="col-xs-9">
						<div class="page-content row">
							<form id="question-add-form" style="margin-top:40px;-webkit-box-sizing:border-box;box-sizing:border-box;">
							<input type="hidden" name="field_id" id="field_id" value="${pd.field_id}">
							<input type="hidden" name="data" id="data" value="">
							<input type="hidden" name="point_id" id="point_id" value="${pd.point_id}">
							<input type="hidden" name="question_type_id" id="question_type_id" value="${pd.question_type_id}">
								<div class="form-line question-type" id="question-type" style="vertical-align: middle !important">
									<span class="form-label" style="color:black;"><span class="warning-label">*</span>试题类型：</span>
									<select id="question-type-select" class="selectCss" style="color:black;">
										<c:forEach items="${questionTypeList}" var="questionType">
								           <option value="${questionType.id}">${questionType.name}</option>
							            </c:forEach>
									</select><span class="form-message"></span>
								</div>
								<div class="form-line question-knowledge">
									<span class="form-label"><span class="warning-label">*</span>知识点：</span>
									<div>
										<div class="clearfix">
											<div id="aq-course1" style="padding:0px;float:left; width:48%;">
												<select id="field-select" class="df-input-narrow" size="4" style="width:100%;background-color:#ecf0f9;">
													<c:forEach items="${fieldList }" var="item">
													<c:if test="${item.fieldId==8}">
														<option value="${item.fieldId }">${item.fieldName }</option>
													</c:if>
													</c:forEach>
												</select>
											</div>
											<div id="aq-course2" style="padding:0px; float:right;width:48%;">
												<select id="point-from-select" class="df-input-narrow" size="4"  style="width:100%;background-color:#ecf0f9;">
												</select>
											</div>
										</div>
										
										<div style="text-align:center;margin:10px 0;">
											<button id="add-point-btn" class="btn btn-success">选择知识点</button>
											<button id="del-point-btn" class="btn btn-success">删除知识点</button>
											<button id="remove-all-point-btn" class="btn btn-success">清除列表</button>
										</div>
										<div  id="kn-selected" style="padding-left:0px;text-align:center;margin-bottom:20px;">
												<select id="point-to-select" class="df-input-narrow" size="4"  style="width:80%;background-color:#ecf0f9;">
												</select>
										</div>
									</div>
									<span class="form-message"></span>
								</div>
								
								<div class="form-line question-content">
									<span class="form-label"><span class="warning-label">*</span>试题内容：</span>
									<textarea class="add-question-ta" style="width:700px;padding-left:5px;
									background-color:#ecf0f9;border:0;border-radius:5px;font-size:1.0em;
									resize:none!important;" rows="4" maxlength="250" onblur="trim(this);"></textarea>
									<a id="tupian" href="" style="display: none" class="diaplay-img display-content-img" target="_blank" data-url="">预览图片</a>								
									<span class="add-img add-content-img" style="width:100px;">添加图片</span>
									<span class="form-message"></span>
								</div>
								<div class="form-line form-question-opt" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>选项：</span>
									<div class="add-opt-items" style="color:black;">
										<span class="add-opt-item box"><label class="que-opt-no" >A</label>
											<input type="text" class="inputCss inputCssST" maxlength="100">
											<span class="add-img add-opt-img">添加图片</span>
										</span>
										<span class="add-opt-item box"><label class="que-opt-no">B</label>
											<input type="text" class="inputCss inputCssST" maxlength="100">
											<span class="add-img add-opt-img">添加图片</span>
										</span>
										<span class="add-opt-item box"><label class="que-opt-no">C</label>
											<input type="text" class="inputCss inputCssST" maxlength="100">
											<span class="add-img add-opt-img">添加图片</span> <span><i class="small-icon ques-remove-opt fa fa-minus-square" title="删除此选项"></i></span>
										</span>
										<span class="add-opt-item box"><label class="que-opt-no">D</label>
											<input type="text" class="inputCss inputCssST" maxlength="100">
											<span class="add-img add-opt-img">添加图片</span> <span><i class="small-icon ques-remove-opt fa fa-minus-square" title="删除此选项"></i></span>
										</span>
									</div>
									<span id="ques-add-opt"><i class="small-icon fa fa-plus-square" title="添加选项"></i></span>
									<br>
									<span class="form-message"></span>
								</div>
								<div class="form-line form-question-answer1 correct-answer" style="display: block;">
									<span class="form-label"><span class="warning-label">*</span>正确答案：</span>
									<select class="selectshort">
										<option value="A">A</option><option value="B">B</option><option value="C">C</option><option value="D">D</option>
									</select><span class="form-message"></span>
								</div>
								<div class="form-line form-question-answer-muti correct-answer" style="display: none;">
									<span class="form-label"><span class="warning-label">*</span>正确答案：</span>

									<span class="muti-opt-item">
										<input type="checkbox" value="A">
										<label class="que-opt-no" id="questionAnswer">A</label>
										<br>
									</span>
									<span class="muti-opt-item">
										<input type="checkbox" value="B">
										<label class="que-opt-no">B</label>
										<br>
									</span>
									<span class="muti-opt-item">
										<input type="checkbox" value="C">
										<label class="que-opt-no">C</label>
										<br>
									</span>
									<span class="muti-opt-item">
										<input type="checkbox" value="D">
										<label class="que-opt-no">D</label>
										<br>
									</span>
									<span class="form-message"></span>
								</div>
								<div class="form-line form-question-answer-boolean correct-answer" style="display: none;">
									<span class="form-label"><span class="warning-label">*</span>正确答案：</span>
									<select class="selectlong">
										<option value="T">正确</option>
										<option value="F">错误</option>
									</select><span class="form-message"></span>
								</div>
								<div class="form-line correct-answer form-question-answer-text" style="display: none;">
									<span class="form-label form-question-answer-more"><span class="warning-label">*</span>参考答案：</span>
									<textarea class="add-question-ta"></textarea>									<span class="form-message"></span>
									<br>

								</div>
								<div class="form-line form-question-reference" style="display: block;">
									<span class="form-label"><span class="warning-label"></span>来源：</span>
										<input type="text" class="inputCss" maxlength="50"><span class="form-message"></span>
									<br>
								</div>
								<div class="form-line form-question-examingpoint" style="display: block;">
									<span class="form-label"><span class="warning-label"></span>考点：</span>
										<input type="text" class="inputCss" maxlength="50"><span class="form-message"></span>
									<br>
								</div>
								<div class="form-line form-question-keyword" style="display: block;">
									<span class="form-label"><span class="warning-label"></span>关键字：</span>
										<input type="text" class="inputCss" maxlength="50"><span class="form-message"></span>
									<br>
								</div>
								<div class="form-line form-question-analysis" style="display: block;">
									<span class="form-label"><span class="warning-label"></span>题目解析：</span>
									<textarea class="add-question-ta" 
									       style="width:700px;padding-left:5px;background-color:#ecf0f9;border:0;border-radius:5px;font-size:1.0em;resize:none!important;" 
									       rows="4" maxlength="200" onblur="trim(this);"></textarea><span class="form-message"></span>
									<br>

								</div>
								<div class="col-sm-offset-5 col-sm-2">
								      <button type="submit" class="btn btn-success btn-block" id="subm"><span class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp;保存</button>
							    </div>
							</form>

						</div>
						<div class="modal_h20 fade in">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						        <h4 class="modal-title" style="color:black;">上传图片</h4>
						      </div>
						      <div class="modal-body">
						        <div id="add-question-img-dialog" title="上传图片">
									 <form>
										<div class="form-line img-destination">
											<span class="form-label">添加至：</span>
											<label></label>
											<input type="hidden" value=""/>
										</div>
										<div class="form-line add-update-quetstionfile">
											<span class="form-label">图片：</span>
											<div id="div-file-list">
											</div>
											<div class="form-line" id="uploadify"></div>
											<span class="form-message" id="form-message">请上传png、jpg或jpeg、gif图片文件，且不能大于5MB。为了使得图片显示正常，请上传的图片长宽比例为2:1</span>
										</div>
									</form> 
								</div>
						      </div>
						      
						    </div>
						    <!-- /.modal-content -->
						  </div>
						  <!-- /.modal-dialog -->
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>
<div class="clear"></div>
<!--<footer开始>-->
<jsp:include page="../../common/footer.jsp"></jsp:include>
<!--</footer结束>-->
		<script type="text/javascript" src="<%=basePath%>shyl/js/question/jquery.uploadify3.1Fixed.js"></script>
		<script type="text/javascript" src="<%=basePath%>shyl/js/question/question-upload-img.js"></script>
		<script type="text/javascript" src="<%=basePath%>shyl/js/question/question-add.js"></script>
		
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
		
	</body>
</html>