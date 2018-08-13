<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link href="static/css/bootstrap.min.css" rel="stylesheet" />
<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link rel="stylesheet" href="static/css/font-awesome.min.css" />
<!-- 下拉框 -->
<link rel="stylesheet" href="static/css/chosen.css" />
<link rel="stylesheet" href="static/css/ace.min.css" />
<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
<link rel="stylesheet" href="static/css/ace-skins.min.css" />
<link rel="stylesheet" href="static/css/jquery.datetimepicker.css" />
<!-- 日期框 -->	
<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript" src="static/js/bootbox.min.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<style type="text/css">

.custom-date-style {
	background-color: red !important;
}
.input{	
}
.input-wide{
	width: 500px;
}
label{
    font-size: 12px;
    line-height: 20px;
}
.lbl {
    vertical-align: middle;
    width: 100px;
}
</style>
</head>
<body>
	<div class="container-fluid" id="main-container">
		<div id="page-content" class="clearfix">
			<div class="row-fluid">
				<br>
				<div class="row-fluid">
					<form action="<%=basePath%>examPaper/save.do" name="Form" id="Form"
						method="post">
						<div id="zhongxin">
							<div class="row-fuild form-inline">
								<label class="lbl" for="paperName" style="color: #000000; font-weight: bold;">试卷名称：&nbsp;&nbsp;</label>
								<input maxlength="40" class="onlyNum" type="text" id="paperName" name="paperName" 
								title="试卷名称" placeholder="请输入试卷名称" onblur="trim(this);" style="width: 300px" />
							</div>
							<br>
							<div class="row-fuild form-inline">
								<label class="lbl" for="creatType" style="color: #000000; font-weight: bold;">组卷方式：&nbsp;&nbsp;</label>
								<select class="chzn-select" id="creatType" name="creatType" style="width: 314px"
									data-placeholder="请选择组卷方式" onchange="changeCreatType();">
									<option value="2">自动组卷</option>
									<option value="1">手动组卷</option>
								</select>
							</div>
							<br>
							<div class="row-fuild form-inline">
								<label class="lbl" for="duration" style="color: #000000; font-weight: bold;">时长（分钟）：</label>
								<input maxlength="10" class="onlyNum" type="text" id="duration" name="duration" style="width: 300px"  
								value="0" title="时长" placeholder="请输入时长" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" />
							</div>
							<br>
							<div class="row-fuild form-inline">
								<label class="lbl" style="vertical-align: top; margin-top: 8px; color: #000000; font-weight: bold;">知识点：&nbsp;&nbsp;</strong></label>
								<label>
									<fieldset style="width: 1515px;">
										<legend>
											知识点范围
										</legend>
										<div>
											<div class="clearfix">
												<div id="aq-course1" style="padding:0px;float:left; width:48%;">
													<select id="field-select" class="df-input-narrow" size="4" style="width:100%;">
														<c:forEach items="${NList }" var="item">
															<option value="${item.fieldId }">${item.fieldName }</option>
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
													<p style="font-size:12px;color:#AAA;">只能选择一个知识点</p>
													<input type="hidden" id="fieldNo" value=""/>
													<input type="hidden" id="pointNo" value=""/>
											</div>
										</div>
									</fieldset>
								</label>
							</div><br>
							<div class="row-fuild form-inline" id="ques-type-div">
								<label class="lbl" style="vertical-align: top; margin-top: 8px; color: #000000; font-weight: bold;">题型：&nbsp;&nbsp;</label>
								<label>
									<fieldset style="width: 1515px;">
										<legend>
											选择题型分布
										</legend>
										<span class="add-ques-type">
											<label style="display: inherit;">单选题</label>
											<input type="hidden" class="ques-id" value="1">
											<input type="text" id="single_select" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="df-input-narrow add-ques-amount" style="width: 50px; height: 20px;margin-bottom: 2px;">
											<span>道</span>
											<label style="display: inherit;">每道题</label>
											<input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="df-input-narrow add-ques-score" style="width: 50px; height: 20px;margin-bottom: 2px;">
											<span>分</span><span style="margin-left:30px; cursor:normal;color:red" id="Num1"></span>
										</span>
										<br>
										<span class="add-ques-type">
											<label style="display: inherit;">多选题</label>
											<input type="hidden" class="ques-id" value="2">
											<input type="text" id="multiple_select" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="df-input-narrow add-ques-amount" style="width: 50px; height: 20px;margin-bottom: 2px;">
											<span>道</span>
											<label style="display: inherit;">每道题</label>
											<input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="df-input-narrow add-ques-score" style="width: 50px; height: 20px;margin-bottom: 2px;">
											<span>分</span><span style="margin-left:30px; cursor:normal;color:red" id="Num2"></span>
										</span>
										<br>
										<span class="add-ques-type">
											<label style="display: inherit;">判断题</label>
											<input type="hidden" class="ques-id" value="3">
											<input type="text" id="true_or_false_select" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="df-input-narrow add-ques-amount" style="width: 50px; height: 20px;margin-bottom: 2px;">
											<span>道</span>
											<label style="display: inherit;">每道题</label>
											<input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="df-input-narrow add-ques-score" style="width: 50px; height: 20px;margin-bottom: 2px;">
											<span>分</span><span style="margin-left:30px; cursor:normal;color:red" id="Num3"></span>
										</span>
										<br>
									</fieldset>
								</label>
							</div>
							<br>
							<div class="row-fuild form-inline" id="tatol-point-div">
								<label class="lbl" for="tatolPoint" style="color: #000000; font-weight: bold;">总分：&nbsp;&nbsp;&nbsp;&nbsp;</strong></label>
								<input class="onlyNum" type="text" id="tatolPoint" name="tatolPoint" maxlength="4"
									title="总分" onblur="delZero(this);" value="0" style="width: 300px" readonly />
							</div>
							<br>
								<div class="row-fuild form-inline">
								<label class="lbl" for="passPoint" style="color: #000000; font-weight: bold;">及格分数：&nbsp;&nbsp;</label>
								<input maxlength="4" class="onlyNum" type="text" id="passPoint" name="passPoint" 
								value="0" title="passPoint" placeholder="请输入passPoint" onblur="delZero(this);" 
								onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" style="width: 300px" />
							</div>
							<br>
							<div class="row-fuild form-inline">
								<label class="lbl" for="paperName" style="color: #000000; font-weight: bold;">结果测评标准：</label>
								<label id="stageArea">
									<div id="stadiv0" style="margin-bottom: 2px;">
									<input type="text" id="start_number0" name="start_number0" maxlength="4" 
									onkeyup="value=value.replace(/[^\d.]/g,'')" onblur="delZero(this);" 
									value="0" style="width: 90px;" placeholder="起始分数" />
									<span>-</span>
									<input type="text" id="end_number0" name="end_number0" maxlength="4" 
									onkeyup="value=value.replace(/[^\d.]/g,'')" onblur="delZero(this);" 
									value="0" style="width: 90px;" placeholder="结束分数" />&#12288;
									<input type="text" id="stage0" name="stage0" maxlength="255" value="" 
									 onblur="trim(this);" style="width: 150px;" placeholder="评分阶段" />&#12288;
									<input type="text" id="describe0" name="describe0" maxlength="1000" value="" 
									 onblur="trim(this);" style="width: 460px;" placeholder="描述" />
									<button type="button" class="btn btn-small btn-success btn-lg" onclick="addStage();" 
									    style="margin-top: 0px;" title="添加"><i class="icon-plus-sign icon-on-right"></i>
									</button></div>
									
								</label>
								<input type="hidden" id="counttd" value="0" />
							</div>
							<br>
							<div align="center" class="row row-height" style="width: 90%;">
								<table>
									<tr>
										<td style="text-align: center;" colspan="10">
										<a class="btn btn-success" onclick="save();"><i class="icon-save"></i>下一步</a> 
										<a class="btn btn-light" onclick="returnback()"><i class=" icon-circle-arrow-left"></i>返回</a>
										</td>
									</tr>
								</table>
							</div>
						</div>
						<div id="zhongxin2" class="center" style="display: none">
							<br /> <br /> <br /> <br /> <br /> <img
								src="<%=basePath%>static/images/jiazai.gif" /><br />
							<h4 class="lighter block green">提交中...</h4>
						</div>

					</form>
				</div>
				<!-- PAGE CONTENT ENDS HERE -->
			</div>
			<!--/row-->
		</div>
		<!--/#page-content-->
	</div>
	<!-- 引入 -->
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
</body>
<script type="text/javascript">
	// 合并的$(function(){});
	$(top.hangge());
	$(function(){
		//下拉框
		$(".chzn-select").chosen();
		$(".chzn-select-deselect").chosen({
			allow_single_deselect : true
		});
		
		//题型
		$(".add-ques-amount").change(function() {
			calculateTotalPoints();
		});
		//题型分数
		$(".add-ques-score").change(function() {
			calculateTotalPoints();
		});
		
		//知识点
		var selection = $("#aq-course1").find("select");
		var point_list = $("#aq-course2").find("select");
		selection.change(function(){
			$.post('<%=basePath%>examPaper/getKnowledgePoint.do', {
				fieldId : selection.val()
			}, function(data) {
				point_list.empty();
				$.each(data.knowledgePointList, function(i, list) {
					point_list.append("<option value=\"" + list.pointId + "\">" + list.pointName + "</option>");
				});
			});
		});
		//点击选择知识点按钮
		$("#add-point-btn").click(function() {
			var field = $("#field-select > option:selected");
			var point = $("#point-from-select > option:selected");
			var fieldNo = $("#fieldNo").val();
			var pointNo = $("#pointNo").val();
			if (field.length == 0 || point.length == 0) {
				$("#aq-course2").tips({
					side : 3,
					msg : '请选择需要添加的知识点',
					bg : '#AE81FF',
					time : 2
				});
				return false;
			}
			//TODO
			$.ajax({
			type : "POST",
			url :  '<%=basePath%>examPaper/selectTestTypeNum.do',
			data : {
				fieldNo:field.val(),
				pointNo:point.val()
			},
			cache : false,
			async : false,
			success : function(data) {
				if(data!=null && data!=""){
					console.log()
					$("#single_select").val(data.Num1);
					$("#multiple_select").val(data.Num2);
					$("#true_or_false_select").val(data.Num3);
					$("#Num1").text("本知识点的单选题共"+data.Num1+"道题");
					$("#Num2").text("本知识点的多选题共"+data.Num2+"道题");
					$("#Num3").text("本知识点的判选题共"+data.Num3+"道题");
				}else{
					$("#Num1").text("本知识点的单选题共0道题");
					$("#Num2").text("本知识点的多选题共0道题");
					$("#Num3").text("本知识点的判选题共0道题");
				}
			}
		});
			//TODO
			var html = "<option value=\"" + point.attr("value") + "\">" + field.text() + " > " + point.text() + "</option>";
			var p = point.attr("value");
			if (!checkPointDuplicate(p)) {
				$("#point-to-select").tips({
					side : 2,
					msg : '不能重复添加',
					bg : '#AE81FF',
					time : 2
				});
				return false;
			}
			$("#point-to-select").empty();
			$("#point-to-select").append(html);
			$("#fieldNo").val(field.val());
			$("#pointNo").val(point.val());
			return false;
		});
		//点击删除知识点按钮
		$("#del-point-btn").click(function() {
			var st = $("#point-to-select > option:selected");
			if(st.val() != null && st.val() != ""){
				$("#fieldNo").val('');
				$("#pointNo").val('');
				$("#Num1").text('');
				$("#Num2").text('');
				$("#Num3").text('');
			}
			$("#point-to-select > option:selected").remove();
			return false;
		});
		//点击请出列表按钮
		$("#remove-all-point-btn").click(function() {
			$("#point-to-select").empty();
			$("#fieldNo").val('');
			$("#pointNo").val('');
			$("#Num1").text('');
			$("#Num2").text('');
			$("#Num3").text('');
			return false;
		});
	});
	
	// 题型/题型分数计算
	function calculateTotalPoints() {
		var qt = $(".add-ques-type");
		var amount = 0;
		for(var i = 0 ; i< qt.length;i++){
			var itemamount = parseInt($(qt[i]).find(".add-ques-amount").val());
			var itemscore = parseFloat($(qt[i]).find(".add-ques-score").val());
			if(isNaN(itemamount)||isNaN(itemscore)){
				continue;
			}else{
				amount = amount +  itemamount * itemscore * 10;
			}
		}
		$("#tatolPoint").val(amount / 10);
	}
	
	function checkPointDuplicate(p) {
		var points = $("#point-to-select option");
		for (var i = 0; i < points.length; i++) {
			var point = $(points[i]).attr("value");
			if (point == p) return false;
		}
		return true;
	}
	
	//组卷方式切换
	function changeCreatType() {
		var creatType = $("#creatType").val();
		if (creatType == 1) {
			$("#ques-type-div").hide();
			$("#tatol-point-div").hide();
		} else if (creatType == 2) {
			$("#ques-type-div").show();
			$("#tatol-point-div").show();
			$("#field-select-div").show();
		}
	}
	
	//保存
	function save() {
		if ($("#paperName").val() == "") {
			$("#paperName").tips({
				side : 2,
				msg : '请输入试卷名称',
				bg : '#AE81FF',
				time : 2
			});
			$("#paperName").focus();
			return false;
		}
		var duration = $("#duration").val();
		if (duration == "") {
			$("#duration").tips({
				side : 2,
				msg : '请输入考试时长（如：120）',
				bg : '#AE81FF',
				time : 2
			});
			$("#duration").focus();
			return false;
		} else if (!(parseInt(duration) > 30 && parseInt(duration) < 241)) {
			$("#duration").tips({
				side : 2,
				msg : '数字范围无效，考试的时长必须设置在30到240的范围内',
				bg : '#AE81FF',
				time : 2
			});
			$("#duration").focus();
			return false;
		}
// 		var field = $("#field-select > option:selected");
// 		var point = $("#point-from-select > option:selected");
// 		if (field.length == 0 || point.length == 0) {
// 			$("#aq-course2").tips({
// 				side : 3,
// 				msg : '请选择需要添加的知识点',
// 				bg : '#AE81FF',
// 				time : 2
// 			});
// 			return false;
// 		}
		if($("#creatType").val()==2){
			if ($("#tatolPoint").val() == "" || $("#tatolPoint").val() == "0") {
				$("#tatolPoint").tips({
					side : 2,
					msg : '无效的分数',
					bg : '#AE81FF',
					time : 2
				});
				return false;
			}
			var passPoint = $("#passPoint").val();
			if (passPoint == "" || passPoint == "0") {
				$("#passPoint").tips({
					side : 2,
					msg : '请输入及格分数',
					bg : '#AE81FF',
					time : 2
				});
				$("#passPoint").focus();
				return false;
			}
			if (parseInt($("#passPoint").val()) > parseInt($("#tatolPoint").val())) {
		    	$("#passPoint").tips({
					side : 2,
					msg : '及格分数必须小于或等于总分数',
					bg : '#AE81FF',
					time : 2
				});
				$("#passPoint").focus();
				return false;
		    }
		}
		if(document.getElementById("point-to-select").options.length==0){
			$("#point-to-select").tips({
				side : 2,
				msg : '请选择知识点',
				bg : '#AE81FF',
				time : 2
			});
			return false;
		}
		// 结果测评标准
		var count = parseInt($("#counttd").val());
		for(i=0;i<count+1;i++){
			var start_number=$("#start_number"+i).val();
			var end_number=$("#end_number"+i).val();
			if(parseInt(start_number)>parseInt(end_number)){
				$("#start_number"+i).tips({
					side : 3,
					msg : '开始分数不能大于结束分数',
					bg : '#AE81FF',
					time : 2
				});
				return false;
			}
		}
		
		// 页面各个控件的值
	    var question_entity = composeEntity();
	    var passPoint = $("#passPoint").val();
	    var fieldNum = $("#fieldNo").val();
		var pointNum = $("#pointNo").val();
	    // 结果测评标准
	    var dataArray = new Array();
	    if(count==0){
	    	var dataAll=new Object();
	    	dataAll.start_number=$("#start_number0").val();
		    dataAll.end_number=$("#end_number0").val();
		    dataAll.stage=$("#stage0").val();
		    dataAll.describe=$("#describe0").val();
		    dataArray.push(dataAll);
	    } else {
	    	for(i=0;i<count+1;i++){
				var dataAll=new Object();
			    dataAll.start_number=$("#start_number"+i).val();
			    dataAll.end_number=$("#end_number"+i).val();
			    dataAll.stage=$("#stage"+i).val();
			    dataAll.describe=$("#describe"+i).val();
			    dataArray.push(dataAll);
			}
	    }
	    $.ajax({
		    type : "POST",
		    url :  '<%=basePath%>examPaper/save.do',
			data : {
				question_entity : JSON.stringify(question_entity),
				addList :JSON.stringify(dataArray)
			},
			dataType : 'json',
			cache : false,
			success : function(message, tst, jqXHR) {
				if (message.result == "success") {
					// 跳转到修改试卷页面
					window.location.href = "<%=basePath%>examPaper/to_Edit.do?generatedId="+message.generatedId+"&fieldNum="+fieldNum+"&pointNum="+pointNum+"&passPoint="+passPoint+"&flagType=1";
				} else {
					bootbox.dialog("操作失败请稍后尝试:" + message.result, 
						[
						    {
						    	"label" : "关闭",
						    	"class" : "btn-small btn-success",
						    	"callback": function() {
						    		window.location.href = "<%=basePath%>examPaper/to_Add.do";
						    	}
						    }
					    ]
				    );
				}
			},
			error : function(jqXHR, textStatus) {
				bootbox.dialog("操作失败请稍后尝试", 
						[
						    {
						    	"label" : "关闭",
						    	"class" : "btn-small btn-success",
						    	"callback": function() {
						    		window.location.href = "<%=basePath%>examPaper/to_Add.do";
						    	}
						    }
					    ]
				    );
			}
		});
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
	//返回
    function returnback(){
    	window.location.href="<%=basePath%>examPaper/list.do";
	}
	
    // 页面各个控件的值
    function composeEntity(){
    	var paperParam = new Object();
		paperParam.paperName = $("#paperName").val();
		paperParam.passPoint = parseInt($("#passPoint").val());
		paperParam.time = $("#duration").val();
		paperParam.paperPoint = $("#tatolPoint").val();
		paperParam.paperType = $("#creatType").val();
		paperParam.fieldNo = $("#fieldNo").val();
		paperParam.pointNo = $("#pointNo").val();
		
		var qt = $(".add-ques-type");
		var amountMap = new Object();
		var pointMap = new Object();
		for(var i = 0 ; i< qt.length;i++){
			var itemamount = parseInt($(qt[i]).find(".add-ques-amount").val());
			var itemscore = parseFloat($(qt[i]).find(".add-ques-score").val());
			var itemsid = $(qt[i]).find(".ques-id").val();
			if(isNaN(itemamount)||isNaN(itemscore)){
				continue;
			}else{
				amountMap[itemsid] = itemamount;
				pointMap[itemsid] = itemscore;
			}
		}
		if($("#creatType").val() == 2){
			paperParam.questionTypeNum = amountMap;
			paperParam.questionTypePoint = pointMap;
			paperParam.paperPoint = $("#tatolPoint").val();
		}else{
			paperParam.paperPoint = "100";
		}
		
		var knowledges = $("#point-to-select option");
		var rateMap = new Object();
		knowledges.each(function(){
			rateMap[$(this).val()] = 0;
		});
		
		paperParam.questionKnowledgePointRate = rateMap;
		
		return paperParam;
    }
    // 增加评分标准
    function addStage(){
    	var count = parseInt($("#counttd").val())+1;
    	var tr="<div id='stadiv"+count+"' style='margin-bottom: 2px;'><input type='text' id='start_number"+count+"' name='start_number"+count+"' maxlength='4'"+
			"onblur='delZero(this);' value='0' style='width: 90px;' placeholder='起始分数' />"+
			"<span> - </span>"+
			"<input type='text' id='end_number"+count+"' name='end_number"+count+"' maxlength='4' onblur='delZero(this);'"+
			"value='0' style='width: 90px;' placeholder='结束分数' />&#12288;  "+
			"<input type='text' id='stage"+count+"' name='stage"+count+"' maxlength='255' value=''"+
			 "onblur='trim(this);' style='width: 150px;' placeholder='评分阶段' />&#12288;  "+
			"<input type='text' id='describe"+count+"' name='describe"+count+"' maxlength='1000' value=''"+
			 "onblur='trim(this);' style='width: 460px;' placeholder='描述' />  "+
			"<a class='btn btn-small btn-danger' style='margin-top: -1px;' onclick='delStage("+count+");' title='删除'>"+
			"<i class='icon-trash'></i></a></div>";
    	$("#stageArea").append(tr);
    	$("#counttd").val(count);
    }
    // 删除评分标准
    function delStage(countnum){
    	$("#stadiv"+countnum).remove();
    	$("#counttd").val(countnum-1);
    }
</script>
</html>