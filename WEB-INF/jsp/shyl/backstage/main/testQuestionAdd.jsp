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

<meta charset="utf-8" />
<title>创建新试卷_济南市服务外包公共服务平台</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../../system/admin/top.jsp"%>
<link rel="stylesheet" href="static/css/thing.css" />
<link rel="stylesheet" href="static/css/question.css" /> 
<link rel="stylesheet" href="static/assets/css/font-awesome.css" />
<link rel="stylesheet" href="shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="shyl/fileupload/css/jquery.fileupload-ui.css">
<link rel="stylesheet" href="shyl/css/question/testQuestionAdd.css">
<script type="text/javascript" src="shyl/js/mainjs/jquery-1.7.2.js"></script>
<script src="shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
<script src="shyl/fileupload/js/jquery.fileupload.js"></script>
<script src="shyl/fileupload/js/jquery.fileupload-process.js"></script>
<script src="shyl/fileupload/js/jquery.fileupload-validate.js"></script>
<script src="shyl/fileupload/js/jquery.iframe-transport.js"></script>
<script type="text/javascript" src="static/js/bootbox.min.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/question/testQuestionAdd.js" type="text/javascript"></script>
<script type="text/javascript" src="shyl/js/jquery.tips.js"></script>

<script type="text/javascript">
    $(top.hangge());
	
	function checkPointDuplicate(p) {
		var points = $("#point-to-select option");
		for (var i = 0; i < points.length; i++) {
			var point = $(points[i]).attr("value");
			if (point == p) return false;
		}
		return true;
	}
	
	//返回
    function returnback(){
    	window.location.href="<%=basePath%>testquestion/list.do";
	}
</script>
</head>
<body>
	<br>
	<form action="<%=basePath%>testquestion/add.do" name="Form" id="Form" method="post">
		<div id="zhongxin">
			<table class="table ">

				<tr>
					<td style="width: 100px; vertical-align:top; text-align: left; padding-top: 13px;"><span class="warning-label">*</span><B>试题类型</B></td>
					<td>
					<select class="chzn-select" name="questionType"
						id="questionType" data-placeholder="请选择试题类型"
						style="height: 30px; width: 300px" onchange="changeQuestionType();">
							<option value="1">单选题</option>
							<option value="2">多选题</option>
							<option value="3">判断题</option>
					</select></td>
				</tr>
				<tr id="field-select-div">
					<td style="width: 100px; text-align: left; vertical-align:top; padding-top: 13px;"><span class="warning-label">*</span><B>知识点</B></td>
					<td>
						<fieldset>
							<div>
							<div class="clearfix">
								<div id="aq-course1" style="padding:0px;float:left; width:48%;">
									<select id="field-select" class="df-input-narrow" size="4" style="width:100%;">
										<c:forEach items="${NList }" var="item">
											<option value="${item.fieldId}">${item.fieldName }</option>
										</c:forEach>
									</select>
								</div>
								<div id="aq-course2" style="padding:0px; float:right;width:48%;">
									<select id="point-from-select" class="df-input-narrow" size="4" style="width:100%;">
									</select>
								</div>
							</div>
							
							<div style="text-align:center;margin:10px 0;">
								<button id="add-point-btn" class="btn btn-primary btn-xs">选择知识点</button>
								<button id="del-point-btn" class="btn btn-danger btn-xs">删除知识点</button>
								<button id="remove-all-point-btn" class="btn btn-warning btn-xs">清除列表</button>
							</div>
							<div id="kn-selected" style="padding-left:0px;text-align:center;margin-bottom:20px;">
									<select id="point-to-select" class="df-input-narrow" size="4" style="width:80%;">
									</select>
									<p style="font-size:12px;color:#AAA;">您可以从上面选择1个知识点</p>
							</div>
						</div>
						</fieldset>
					</td>
				</tr>
				<tr>
					<td nowrap="nowrap" style="width: 100px; vertical-align:top; text-align: left; padding-top: 13px;"><span class="warning-label">*</span><B>试题内容</B></td>
					<td>
					    <input id="license" name="news_thumbnail" type="hidden" value=""/>
						<textarea id="testContent" name="testContent" class="textareatxt2" 
						style=" float: left;height:100px; width: 100%; resize:none" maxlength="250"></textarea>
						<span class="add-img add-content-img" style="width:100px;">
						<a href="javascript:;" class="a-upload" style="text-decoration:none; height:20px; color:#ffffff;">添加图片
							<input type="file" id="weixin_image" placeholder="上传本地图片" name="weixin_image" multiple></a>
						</span>
						<span id ="preview"  style="width:60px; display:none; float:left;padding-top: 5px; ">
						 <a id="preview_a" href="JavaScript:void(0)" target="_blank" style="text-decoration:none; height:20px;  ">图片预览</a>
						</span> 
					</td>
				</tr>
				<tr id = "field-option">
					<td nowrap="nowrap" style="width: 100px; vertical-align:top; text-align: left; padding-top: 13px;"><span class="warning-label">*</span><B>选项</B></td>
					<td>
					<fieldset>
							<div class="add-opt-items-option">
								<span class="add-opt-item"> <label class="que-opt-no">A</label>
								    <input id="license1" class="question-opt-itme-hidden" name="news_thumbnail1" type="hidden" />
									<input id ="textbox1" name ="textbox1" maxlength="100" type="text" style="height:25px;" class="question-opt-item-input"> <span
									class="question-opt-item">
									<a href="javascript:;" class="a-upload" style="text-decoration:none;height:20px; color:#ffffff;">添加图片
							        <input type="file" id="weixin_image1" placeholder="上传本地图片" name="weixin_image1" multiple></a>
									</span>
									<span id ="preview1"  style="width:80px; display:none; float:left;padding-top: 5px; padding-left:5px ">
						                <a id="preview_a1" href="JavaScript:void(0)" target="_blank" style="text-decoration:none; height:20px;  ">图片预览</a>
									</span> 
								</span>
								<span class="add-opt-item"><label class="que-opt-no">B</label>
								    <input id="license2" class="question-opt-itme-hidden" name="news_thumbnail2" type="hidden" value=""/>
									<input id ="textbox2" name ="textbox2" maxlength="100" type="text" style="height:25px;" class="question-opt-item-input"> <span
									class="question-opt-item">
									<a href="javascript:;" class="a-upload" style="text-decoration:none;height:20px; color:#ffffff;">添加图片
							        <input type="file" id="weixin_image2" placeholder="上传本地图片" name="weixin_image2" multiple></a>
									</span>
									<span id ="preview2"  style="width:80px; display:none; float:left;padding-top: 5px; padding-left:5px ">
						                <a id="preview_a2" href="JavaScript:void(0)" target="_blank" style="text-decoration:none; height:20px;  ">图片预览</a>
									</span> 
								 </span>
								 <span id ="span_option3" class="add-opt-item"><label class="que-opt-no">C</label>
								    <input id="license3" class="question-opt-itme-hidden" name="news_thumbnail3" type="hidden" value=""/>
									<input id ="textbox3" name ="textbox3" maxlength="100" type="text" style="height:25px;" class="question-opt-item-input"> <span
									class="question-opt-item">
									<a href="javascript:;" class="a-upload" style="text-decoration:none;height:20px; color:#ffffff;">添加图片
							        <input type="file" id="weixin_image3" placeholder="上传本地图片" name="weixin_image3" multiple></a>
									</span>
									<span id ="preview3"  style="width:60px; display:none; float:left;padding-top: 5px; padding-left:5px ">
						 				<a id="preview_a3" href="JavaScript:void(0)" target="_blank" style="text-decoration:none; height:20px;  ">图片预览</a>
									</span> 
									 <span><i
										class="small-icon ques-remove-opt fa fa-minus-square"
										title="删除此选项" onclick="del_option()"></i></span> 
								 </span>
								 <span id ="span_option4" class="add-opt-item"><label class="que-opt-no">D</label>
								    <input id="license4" class="question-opt-itme-hidden" name="news_thumbnail4" type="hidden" value=""/>
									<input id ="textbox4" name ="textbox4" maxlength="100" type="text" style="height:25px;" class="question-opt-item-input"> <span
									class="question-opt-item" style="margin-left: 9px;">
									<a href="javascript:;" class="a-upload" style="text-decoration:none;height:20px; color:#ffffff;">添加图片
							        <input type="file" id="weixin_image4" placeholder="上传本地图片" name="weixin_image4" multiple></a>
									</span>
									<span id ="preview4"  style="width:60px; display:none; float:left;padding-top: 5px; padding-left:5px ">
						 				<a id="preview_a4" href="JavaScript:void(0)" target="_blank" style="text-decoration:none; height:20px;  ">图片预览</a>
									</span>  
									<span><i
										class="small-icon ques-remove-opt fa fa-minus-square"
										title="删除此选项" onclick="del_option()"></i></span> 
								 </span>
								 <span id ="span_option5" class="add-opt-item"><label class="que-opt-no">E</label>
								    <input id="license5" class="question-opt-itme-hidden" name="news_thumbnail5" type="hidden" value=""/>
									<input id ="textbox5" name ="textbox5" maxlength="100" type="text" style="height:25px;" class="question-opt-item-input"> <span
									class="question-opt-item">
									<a href="javascript:;" class="a-upload" style="text-decoration:none;height:20px; color:#ffffff;">添加图片
							        <input type="file" id="weixin_image5" placeholder="上传本地图片" name="weixin_image5" multiple></a>
									</span>
									<span id ="preview5"  style="width:60px; display:none; float:left;padding-top: 5px;padding-left:5px ">
						 				<a id="preview_a5" href="JavaScript:void(0)" target="_blank" style="text-decoration:none; height:20px;  ">图片预览</a>
									</span> 
									 <span><i
										class="small-icon ques-remove-opt fa fa-minus-square"
										title="删除此选项" onclick="del_option()"></i></span> 
								 </span>
								 <span id ="span_option6" class="add-opt-item"><label class="que-opt-no">F</label>
								    <input id="license6" class="question-opt-itme-hidden" name="news_thumbnail6" type="hidden" value=""/>
									<input id ="textbox6" name ="textbox6" maxlength="100" type="text" style="height:25px;" class="question-opt-item-input"> <span
									class="question-opt-item">
									<a href="javascript:;" class="a-upload" style="text-decoration:none;height:20px; color:#ffffff;">添加图片
							        <input type="file" id="weixin_image6" placeholder="上传本地图片" name="weixin_image6" multiple></a>
									</span>
									<span id ="preview6"  style="width:60px; display:none; float:left;padding-top: 5px;padding-left:5px ">
										 <a id="preview_a6" href="JavaScript:void(0)" target="_blank" style="text-decoration:none; height:20px;  ">图片预览</a>
									</span> 
									 <span><i
										class="small-icon ques-remove-opt fa fa-minus-square"
										title="删除此选项" onclick="del_option()"></i></span> 
								 </span>
								 <span id="ques-add-opt"><i class="small-icon fa fa-plus-square" style="cursor:pointer;color: #219823;" onclick="add_option()" title="添加选项"></i></span>
								 <input id="add_option_hidden" name="news_thumbnail" type="hidden" value="4"/>
							</div>
							<span class="form-message"></span>
						</fieldset>
					</td>
				</tr>
				<tr id = "field-answer-select">
					<td style="width: 100px; text-align: left; vertical-align:top; padding-top: 13px;"><span class="warning-label">*</span><B>正确答案</B></td>
					<td>
					  <select class="chzn-select" name="answer"
						id="answer" data-placeholder="请选择正确答案"
						style="height: 30px; width: 300px">
							<option value="A">A</option>
							<option value="B">B</option>
							<option id="option_select_answer3" value="C">C</option>
							<option id="option_select_answer4" value="D">D</option>
							<option id="option_select_answer5" value="E">E</option>
							<option id="option_select_answer6" value="F">F</option>
					  </select>
					</td>
				</tr>
				<tr id = "field-answer-double"  >
					<td nowrap="nowrap" style="width: 100px; vertical-align:top; text-align: left; padding-top: 13px;"><span class="warning-label">*</span><B>正确答案</B></td>
					<td>
					<fieldset>
							<div class="add-opt-items-answer">
								<span class="add-opt-item-checkbox"> <label class="testque-che">A</label> <input type="checkbox"
									value="A" style="opacity:1" class="que-opt-no" id ="checkbox1" name ="checkbox1" >  <br>
								</span>
								<span class="add-opt-item-checkbox"> <label class="testque-che">B</label> <input type="checkbox"
									value="B" style="opacity:1" class="que-opt-no" id ="checkbox2" name ="checkbox2">  <br>
								</span>
								<span id ="answer-double3" class="add-opt-item-checkbox"> <label class="testque-che">C</label> <input type="checkbox"
									value="C" style="opacity:1" class="que-opt-no" id ="checkbox3" name ="checkbox3">  <br>
								</span>
								<span id ="answer-double4" class="add-opt-item-checkbox"> <label class="testque-che">D</label> <input type="checkbox"
									value="D" style="opacity:1" class="que-opt-no" id ="checkbox4" name ="checkbox4">  <br>
								</span>
								<span id ="answer-double5" class="add-opt-item-checkbox"> <label class="testque-che">E</label> <input type="checkbox"
									value="E" style="opacity:1" class="que-opt-no" id ="checkbox5" name ="checkbox5">  <br>
								</span>
								<span id ="answer-double6" class="add-opt-item-checkbox"> <label class="testque-che">F</label> <input type="checkbox"
									value="F" style="opacity:1" class="que-opt-no" id ="checkbox6" name ="checkbox6">  <br>
								</span>
							</div>
						</fieldset>
					</td>
				</tr> 
				<tr id = "field-answer-judge">
					<td style="width: 100px; text-align: left; vertical-align:top; padding-top: 13px;"><span class="warning-label">*</span><B>正确答案</B></td>
					<td>
					  <select class="chzn-select" name="answer_judge"
						id="answer_judge" data-placeholder="请选择正确答案"
						style="height: 30px; width: 300px">
							<option value="正确">正确</option>
							<option value="错误">错误</option>
					  </select>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; vertical-align:top; text-align: left; padding-top: 13px;"><span class="warning-label-ffffff">*</span><B>来源</B></td>
					<td><input type="text" name="origin" id="origin" maxlength="100"
						style="height: 30px; width: 286.5px" placeholder="请输入来源"
						title="来源" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 100px; vertical-align:top; text-align: left; padding-top: 13px;"><span class="warning-label-ffffff">*</span><B>考点</B></td>
					<td><input type="text" name="testCenter" id="testCenter" maxlength="100"
						style="height: 30px; width: 286.5px" placeholder="请输入考点"
						title="考点" onblur="trim(this);"  /></td>
				</tr>
				<tr>
					<td style="width: 100px; vertical-align:top; text-align: left; padding-top: 13px;"><span class="warning-label-ffffff">*</span><B>关键字</B></td>
					<td><input type="text" name="keyword" id="keyword" maxlength="100"
						style="height: 30px; width: 286.5px" placeholder="请输入关键字"
						title="关键字" onblur="trim(this);"  /></td>
				</tr>
				<tr>
					<td nowrap="nowrap" style="width: 100px; vertical-align:top; text-align: left; padding-top: 13px;"><span class="warning-label-ffffff">*</span><B>题目解析</B></td>
					<td>
						<textarea id="evaluationStandard" name="evaluationStandard" maxlength="200" class="textareatxt2" 
						style=" float: left;height:100px; width: 80%;"></textarea>
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		<div align="center" style="margin-top: 10px;">

			<a class="btn  btn-success" onclick="save();" id="df-submit"> <i class="icon-save"></i>保存
			</a>
			<a class="btn  btn-light" onclick="returnback()"><i class=" icon-circle-arrow-left"></i>返回</a>
		</div>
		<div id="zhongxin2" class="center" style="display: none">
			<br /> <br /> <br /> <br /> <img src="<%=basePath%>static/images/jiazai.gif" /><br />
			<h4 class="lighter block green">提交中...</h4>
		</div>
	</form>
	<!-- 引入 -->
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript"
		src="static/js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	
	<!-- 下拉框 -->

	<!-- 日期框 -->
	<!-- 富文本编辑器start -->
	<!-- 配置文件 -->
	<script type="text/javascript" src="plugins/ueditor/ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript" src="plugins/ueditor/ueditor.all.js"></script>

</body>
</html>