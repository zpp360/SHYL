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
<title>试题详情_济南市服务外包公共服务平台</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<%@ include file="../../../system/admin/top.jsp"%>
<link rel="stylesheet" href="static/css/thing.css" />
<link rel="stylesheet" href="static/css/font-awesome.min.css" />
<link rel="stylesheet" href="shyl/css/question/css/exam.css" />
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script type="text/javascript" src="shyl/js/jquery.tips.js"></script>
<script src="shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
<script src="shyl/fileupload/js/jquery.iframe-transport.js"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript" src="static/js/bootbox.min.js"></script>

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
.question-list-item {
    list-style-type: none;
    margin-left: 10px;
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
*{
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
}
</style>

</head>
<body>
	<br>
	<form action="" name="Form" id="Form" method="post">
		<input type="hidden" id="fieldNum" value="${pd.fieldNum}"/>
		<input type="hidden" id="pointNum" value="${pd.pointNum}"/>
		<div id="zhongxin">
			<table class="table " style="width: 97%;">
				<tr>
					<td style="width: 240px; text-align: left; padding-top: 13px;">
						<ul id="exampaper-body" style="padding:0px;">${htmlStr}</ul>
						<input type="hidden" id="question_id" name="question_id" value="${pd.questionId }"/>
					</td>
				</tr>
			</table>
		</div>
		<div align="center" style="margin-top: 10px;">
		    <a class='btn btn-small btn-danger' style="height:43px; width:79px; line-height:34px;padding:right;" title="取消" onclick="delField();"><i style="margin-right: 3px;" class="icon-remove-sign icon-on-right"></i>删除</a>
			<a class="btn  btn-light" onclick="returnback('${pd.fieldNum}','${pd.pointNum}')"><i class=" icon-circle-arrow-left"></i>返回</a>
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
	    function returnback(fieldNum,pointNum){
			window.location.href="<%=basePath%>examPaper/getAllField.do?fieldNum="+fieldNum+"&pointNum="+pointNum;
		}
		
	  //删除
	    function delField(){
	    	var fieldNum =$("#fieldNum").val();
	    	var pointNum =$("#pointNum").val();
	    	 var id =$("#question_id").val();
			 top.jzts();
			 var url = "<%=basePath%>examPaper/delqu.do?Id="+id;
			 $.get(url,function(data){
			 window.location.href="<%=basePath%>examPaper/getAllField.do?fieldNum="+fieldNum+"&pointNum="+pointNum;
			});
		}
	</script>
	
</body>
</html>