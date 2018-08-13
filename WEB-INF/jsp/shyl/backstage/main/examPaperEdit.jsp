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

<meta charset="utf-8" />
<title>修改试卷内容_济南市服务外包公共服务平台</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../../system/admin/top.jsp"%>
<link rel="stylesheet" href="shyl/css/question/css/exam.css" />
<script type="text/javascript" src="static/js/bootbox.min.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script type="text/javascript" src="shyl/js/jquery.tips.js"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>

<style>
.question-title {
    width: 1664px;
    margin-left: -35px;
}
input[type=checkbox], input[type=radio] {
    opacity: 1;
    position: inherit;
    width: 13px;
    height: 13px;
    margin-right: 8px;
    margin-top: -1px;
}
.fa-send:before, .fa-paper-plane:before {
    content: "\f1d8";
}
.fa {
    display: inline-block;
    font-family: FontAwesome;
    font-style: normal;
    font-weight: normal;
    line-height: 1;
    -webkit-font-smoothing: antialiased;
    margin-right: 4px;
}
.question-point {
    padding: 0 5px 0 5px;
    color: #428bca;
    cursor: pointer;
} 
#add-more-qt-to-paper {
    cursor: pointer;
    color: #1ba1e2;
}
#add-more-qt-to-paper i {
    color: #47a447;
    cursor: pointer;
    margin-right: 5px;
}
.fa-plus-square:before {
    content: "\f0fe";
}
.question-opt-list {
    padding-left: 0px;
    margin-left: 0px;
}
*{
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    -webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box
}
</style>

</head>
<body>
	<br>
	<input type="hidden" id="generatedId" value="${pg.generatedId}" />
	<input type="hidden" id="flagType" value="${pg.flagType}"/>
	<input type="hidden" id="exampaper-id" value="${exampaperid}" />
	<input type="hidden" id="fieldNum" value="${pg.fieldNum}"/>
	<input type="hidden" id="pointNum" value="${pg.pointNum}"/>
	<input type="hidden" id="passPoint" value="${pg.passPoint}"/>
	<div id="zhongxin">
		<table class="table " style="width: 97%;">
			<tr>
				<td style="width: 100px; text-align: left; padding-top: 13px;">
					<i class="fa fa-send"></i><B>${exampapername}</B>
				</td>
			</tr>
			<tr>
				<td style="width: 100px; text-align: left; padding-top: 13px;">
					<div id="exampaper-desc" class="exampaper-filter"></div>
					<div style="margin-top: 5px;">
						<span>试卷总分：</span><span id="exampaper-total-point" style="margin-right:20px;"></span>
						<span id="add-more-qt-to-paper"><i class="small-icon fa fa-plus-square" title="添加选项"></i><span>增加更多题目</span></span>
					</div>
				</td>
			</tr>
			<tr>
				<td style="width: 240px; text-align: left; padding-top: 13px;">
					<ul id="exampaper-body" style="padding:0px;">${htmlStr}</ul>
				</td>
			</tr>
		</table>
	</div>
	<div align="center" style="margin-top: 10px;">
		<a class="btn  btn-success" onclick="save();"><i class="icon-save"></i>保存</a>
		<a class="btn  btn-light" onclick="returnback('${pg.flagType}')"><i class=" icon-circle-arrow-left"></i>返回</a>
	</div>
	
	<div id="exampaper-footer">
		<div id="question-navi">
			<div id="question-navi-controller">
				<i class="fa fa-arrow-circle-down"></i>
				<span>答题卡</span>
			</div>
			<div id="question-navi-content"></div>
		</div>
	</div>
									
	<div id="zhongxin2" class="center" style="display: none">
		<br /> <br /> <br /> <br /> <img src="<%=basePath%>static/images/jiazai.gif" /><br />
		<h4 class="lighter block green">提交中...</h4>
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

	<script type="text/javascript">
		$(top.hangge());
		$(function() {
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			// 刷新试题导航
			refreshNavi();
			// 绑定答题卡
			bindNaviBehavior();
			// 更新题目简介信息
			updateSummery();
			// 对题目重新编号排序
			addNumber();
			// 切换考题类型事件
			bindQuestionFilter();
			// 绑定考题focus事件(点击考题导航)
			bindfocus();
			// 画面显示删除按钮
			addRemoveBtn();
			
			// 删除按钮按下
			$("#exampaper-body").on("click", "a.tmp-ques-remove", function(){
				$(this).parent().parent().remove();
				refreshNavi();
				addNumber();
				updateSummery();
			});
			
			// 分数按下，去修改分数
			$("#exampaper-body").on("click", "span.question-point", function(){
				top.jzts();
				var generatedId = $("#generatedId").val();
				var score = $(this).text();
				var questions = $("li.question");
				var indexno = questions.index($(this).parent().parent().parent());
				var diag = new top.Dialog();
				diag.Drag=true;
				diag.Title ="修改分数";
				diag.URL = dialogPath+'examPaper/goEditScore.do?score='+score+'&indexno='+indexno+'&generatedId='+generatedId;
				diag.Width = 550;
				diag.Height = 150;
				diag.CancelEvent = function(){ //关闭事件
					if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){}
					// 题号
				    var th=parseInt(indexno);
					var flag=diag.innerFrame.contentWindow.document.getElementById('flag').value;
					// 修改后的分数
					var fs=diag.innerFrame.contentWindow.document.getElementById('score').value;
					if(flag==1){
						// 修改单题分数
						$($("li.question")[th]).find(".question-point").text(fs);
					} else if(flag==2){
						// 批量修改分数
						var qt_type = $($("li.question")[th]).find(".question-type").text();
						$("li.qt-" + qt_type + " .question-point").text(fs);
					}
					// 刷新总分
					refreshTotalPoint();
					
					diag.close();
				};
				diag.show();
			});
			
			// 点击添加更多题目
			$("#add-more-qt-to-paper").click(function() {
				top.jzts();
				var fieldNum = $("#fieldNum").val();
				var pointNum = $("#pointNum").val();
				var questionIds;
				var questions = new Array();
				var forms = $(".question");
				forms.each(function(){
					questions.push($(this).find("span.question-id").text());
						});
				questionIds = questions.join(',');
				var diag = new top.Dialog();
				diag.Drag=true;
				diag.Title ="选择试题添加到试卷中";
				diag.URL = dialogPath+'examPaper/goAddQuestion.do?fieldNum='+fieldNum+'&pointNum='+pointNum;
				diag.Width = 1100;
				diag.Height = 780;
				diag.CancelEvent = function(){ //关闭事件
					if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){}
				    // 选中的所要添加的题目
					var values = diag.innerFrame.contentWindow.document.getElementById('values').value;
					var pointns = diag.innerFrame.contentWindow.document.getElementById('pointns').value;
					// 选中的题目
					var checkedIds = diag.innerFrame.contentWindow.document.getElementById("checkedIdValues").value;
				    if(values.length!=0 && values!=null){
				    	$("#pointn").val(pointns);
				    	var request = $.ajax({
						    type : "POST",
						    url :  '<%=basePath%>examPaper/addQuestionFiled.do',
							data : {
								values : JSON.stringify(checkedIds),
								questionIds : JSON.stringify(questionIds)
							},
							dataType : 'json',
							cache : false
						});
						request.done(function(questionList,tst,jqXHR) {
							for(var i=0;i<questionList.length;i++){
								var question=questionList[i];
								var deletehtml = "<a class=\"tmp-ques-remove\" title=\"删除此题\">删除</a>";
								var newquestion = $('<div/>').html(question.content).contents();
								newquestion.find(".question-title").append(deletehtml);
								$("#exampaper-body").append(newquestion);
							}
							refreshNavi();
							addNumber();
							updateSummery();
							$("#question-selector-modal").modal('hide');

							var questions = $("li.question");
							scrollToElement($(questions[questions.length-1]));
						});
						request.fail(function(jqXHR, textStatus) {
							bootbox.alert("操作失败请稍后尝试");
						});
				    }
				    
					diag.close();
				};
				diag.show();
			});
		});
		
		//保存
		function save() {
			var passPoint = $("#passPoint").val();
			var totalPoint = $("#exampaper-total-point").text();
			if(parseInt(passPoint)>parseInt(totalPoint)){
				bootbox.alert("总分不能低于创建试卷时的及格分数");
				return false;
			}
			var map = composeEntity();
			if(map==null){
				bootbox.alert("存在分数为0的题");
				return false;
			}else{
				var count = 0;
				for (var k in map) {
				    if (map.hasOwnProperty(k)) {
				       ++count;
				    }
				}
				if(getType($("#exampaper-total-point").text())=="float"){
					bootbox.alert("总分不能有小数");
					return false;
				}
				if(count!=  $(".question").length){
					bootbox.alert("存在重复的题目，请检查");
					return false;
				}else{
					var exampaperid = $("#exampaper-id").val();
					$.ajax({
					    type : "POST",
					    url :  '<%=basePath%>examPaper/edit.do',
						data : {
							exampaperid : exampaperid,
							map_data : JSON.stringify(map)
						},
						dataType : 'json',
						cache : false,
						success : function(message, tst, jqXHR) {
							if (message.result == "success") {
								// 跳转到一览页面
								window.location.href = "<%=basePath%>examPaper/list.do";
							} else {
								bootbox.alert("操作失败请稍后尝试");
							}
						},
						error : function(jqXHR, textStatus) {
							bootbox.alert("操作失败请稍后尝试");
						}
					});
				}
			}
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		function composeEntity(){
			var forms = $(".question");
			var map = new Object();
			var scoreno = "0";
			forms.each(function(){
				var question_point = $(this).find("span.question-point").text();
				if(question_point=="0"){
					scoreno = "1";
					return false;
				}
				var question_id = $(this).find("span.question-id").text();
				map[question_id] = question_point;
			});
			if(scoreno == "1"){
				map = null;
			}
			return map;
		}
		
		function getType(input) {
		    var m = (/[\d]+(\.[\d]+)?/).exec(input);
		    if (m) {
		       if (m[1]) { return 'float'; }
		       else { return 'int'; }          
		    }
		    return 'string';
		}
		
		//返回
	    function returnback(flagType){
			if(flagType==2){
				window.location.href="<%=basePath%>examPaper/list.do";
			} else if(flagType==1){
				window.location.href="<%=basePath%>examPaper/to_Add.do";
			}
		}
	</script>
	
<script type="text/javascript" src="shyl/js/exam/examPaperEdit.js"></script>
</body>
</html>