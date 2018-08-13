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
<title>试卷详情_济南市服务外包公共服务平台</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../../system/admin/top.jsp"%>
<link rel="stylesheet" href="static/css/thing.css" />
<link rel="stylesheet" href="shyl/css/question/css/exam.css" />
<link rel="stylesheet" href="shyl/css/question/testQuestionPreview.css" />
 <link rel="stylesheet" href="static/css/question.css" /> 
<script src="shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
<script src="shyl/fileupload/js/jquery.iframe-transport.js"></script>
<script type="text/javascript" src="static/js/bootbox.min.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script type="text/javascript" src="shyl/js/jquery.tips.js"></script>

<style>
input[type=checkbox], input[type=radio] {
    opacity: 1;
    position: inherit;
    width: 13px;
    height: 13px;
    margin-right: 8px;
    margin-top: -1px;
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
*{
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
}
</style>

</head>
<body>
	<br>
	<form action="" name="Form" id="Form" method="post">
		<div id="zhongxin">
			<table class="table " style="width: 97%;">
				<tr>
					<td style="width: 240px; text-align: left; padding-top: 13px;">
						<ul id="exampaper-body" style="padding:0px;">${htmlStr}
						<div class="answer-desc-detail">
											<label class="label label-primary"><i class="fa fa-check-square-o"></i><span> 添加人</span></label>
											<div class="answer-desc-content" style = "color: rgb(96, 106, 108);">
												<ul style = "margin: 0 0 10px;">${user}</ul>
											</div>
										</div>
						</ul>
						<input type="hidden" id="question_id" name="question_id" value="${pd.questionId }"/>
					</td>
				</tr>
			</table>
		</div>
		<div align="center" style="margin-top: 10px;">
		    <a class='btn btn-small btn-danger'  title="取消" onclick="delField();">删除
		    <i  class="icon-remove-sign icon-on-right"></i></a>
			<a class="btn btn-small btn-light" onclick="returnback()"><i class=" icon-circle-arrow-left"></i>返回</a>
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
		});
		
		//返回
	    function returnback(){
			window.location.href="<%=basePath%>testquestion/list.do";
		}
		
	  //删除
	    function delField(){
	    	bootbox.confirm("确定要删除该试题?", function(result) {
				if(result) {
					top.jzts();
					var id =$("#question_id").val();
					var url = "<%=basePath%>testquestion/del.do?Id="+id;
					$.get(url,function(data){
						window.location.href="<%=basePath%>testquestion/list.do";
					});
				}
			});
		}
	</script>
	
</body>
</html>