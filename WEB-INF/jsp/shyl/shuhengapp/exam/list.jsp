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
<title></title>
<meta name="description" content="overview & stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<script type="text/javascript" src="static/js/zepto/zepto.js"></script>
<script type="text/javascript" src="static/js/common/apputils.js"></script>
<script type="text/javascript" src="static/icheck/js/icheck.min.js"></script>
<script type="text/javascript" src="static/icheck/js/ajax.js"></script>
<link  href="static/icheck/flat/grey.css" rel="stylesheet">
<style type="text/css">
	html, section, div, ul{
		padding:0px;margin:0px;border:0px;
	}
	li{list-style:none;margin:0;padding:0;}
	body{
		 background-color:#FFDEAD;
	}
	.container{
		width:90vw;
		margin:0 auto;
	}
	.container p{
		font-size:1rem !important;
	}
	.container ul{
		width:80vm;
		background:#fff;
		border-radius:4px;
	}

	.container ul li{
		font-size:14px;
		line-height:35px;
		border-bottom:1px solid #ccc;
		letter-spacing:1px;
		padding-left: 10px;
	}

	.container ul li:last-child{
		border-bottom:none;
	}
	
	.mask{
		display: none;
		width:100%;
		height:100%;
		z-index: 10;
		background:#000;
		opacity:0.6;
		position: fixed;
		left: 0;
		top: 0;
	}
	
	.container_sorce{
		z-index: 11;
		position: fixed;
		width: 60vw;
		height: 35vh;
		background: #fff;
		left: 20vw;
		top: 35vh;
		text-align: center;
		line-height: 30px;
		border-radius:5px;
	}
	.container_sorce_user_sorce{
		font-size: 3rem;
		color: red;
		margin-top: 6vh;
	}
	.container_sorce_info{
		line-height: 1rem;
		padding-top: 5vh;
		font-size: 0.8rem;
	}
	.close_button{
		width:30vw;
		height:10vh;
		margin:0 auto;
		background:#ff9800;
		border-radius: 4px;
		line-height: 9vh;
		font-size: 1.2rem;
		cursor: pointer;
		margin-top: 3vh;
	}
	.exam_submit_button{
		
		width:40vw;
		height:10vh;
		margin:10px auto;
		background-color:#ff9800;
		border-radius:5px;
		font-size:1.2rem;
		text-align:center;
		line-height:10vh;
		cursor: pointer;
	}
</style>
</head>
<body>
	<input type="hidden" id="user_id" value="${user_id }"/>
	<input type="hidden" id="exam_id" value="${exam_id }"/>
	<section class="container">
		<h3>单选题(总共${singleSelectCount} 题，每题 ${singleSelectSorce}分)</h3>
		<c:forEach items="${qList}" var="list" varStatus="vs">
			<c:choose>
				<c:when test="${list.questionTypeId=='1'}">
					<p>${vs.count }: ${list.questionTitle}</p>
					<ul class="choise_list_${list.questionId }">
						<c:forEach items="${list.answerList}" var="op">
							<li>
							<input type="radio" name="option_${list.questionId}"  <c:forEach items="${op}" var="entry"> value="${entry.key}" </c:forEach>  /> 
							<c:forEach items="${op}" var="entry">
								<c:out value="${entry.key}" />： 
	   							<c:out value="${entry.value}" />   
   							</c:forEach>
   							</li>
						</c:forEach>
					</ul>
				</c:when>
			</c:choose>
		</c:forEach>
		
		<h3>多选题(总共${multiSelectCount} 题，每题 ${multiSelectSorce}分)</h3>
		<c:forEach items="${qList}" var="list" varStatus="vs">
			<c:choose>
				<c:when test="${list.questionTypeId=='2'}">
					<p>${vs.count }: ${list.questionTitle}</p>
					<ul class="choise_list_${list.questionId }">
						<c:forEach items="${list.answerList}" var="op">
							<li>
							<input type="checkbox" name="option_${list.questionId }"  <c:forEach items="${op}" var="entry"> value="${entry.key}" </c:forEach>  /> 
							<c:forEach items="${op}" var="entry">
								<c:out value="${entry.key}" />： 
	   							<c:out value="${entry.value}" />   
   							</c:forEach>
   							</li>
						</c:forEach>
					</ul>
				</c:when>
			</c:choose>
		</c:forEach>
		
		<h3>判断题(总共${trueOrFalseSelectCount }题，每题${trueOrFalseSelectSorce }分)</h3>
		<c:forEach items="${qList}" var="list" varStatus="vs">
			<c:choose>
				<c:when test="${list.questionTypeId=='3'}">
					<p>${vs.count }: ${list.questionTitle}</p>
					<ul class="choise_list_${list.questionId }">
						<li>
						<input type="radio" name="option_${list.questionId }"  value="正确" > 正确
						</li>
						<li>
						<input type="radio" name="option_${list.questionId }"  value="错误" > 错误
						</li>
					</ul>
				</c:when>
			</c:choose>
		</c:forEach>
		
		<div class="exam_submit_button">交卷</div>
		
		<input type="button" id="ios_button"  value="ios按钮"/>
		<input type="button" id="and_button"  value="Android按钮"/>
		<!-- 遮罩层 -->
		<div class="mask"></div>
		
	</section>
</body>

<script type="text/javascript">
	$(document).ready(function(){
		$('input').iCheck({
		    checkboxClass: 'icheckbox_flat-grey',
		    radioClass: 'iradio_flat-grey'
		  });
	});
	
	
	$(".exam_submit_button").click(function(){
		var answerJson="{";
		
		var userId = $("#user_id").val();
		console.log("用户id:"+userId)
		var examId = $("#exam_id").val();
		//题数
		var count = $("ul[class^='choise_list_']").length;
		var selectedCount = 0;
		console.log("题目总数:"+count);
		$("ul[class^='choise_list_']").each(function(){
			var name = $(this).attr("class");
			//获取问题的id
			var qustionId = name.substring("choise_list_".length);
			console.log(qustionId);
			var input = $("input[name='option_"+qustionId+"']");
			//判断是单选（包括判断）还是多选
			var inputType = input.attr('type');
			console.log("单选还是多选:"+inputType);
			var answer;
			if(inputType=='radio'){
				//单选和判断
				answer = $("input[name='option_"+qustionId+"']:checked").val();
				if(answer!=null&&answer!=''&&answer!='undefined'){
					selectedCount++;
				}
				if(answer==undefined){
					answer = "";
				}
				console.log(answer)
			}
			if(inputType=="checkbox"){
				//多选
				var checkArr = [];
				$("input[name='option_"+qustionId+"']:checked").each(function(){
					checkArr.push($(this).val());
				});
				if(checkArr!=null&&checkArr.length>0){
					selectedCount++;
				}
				answer = checkArr.toString();
			}
			//answer如果是undefined说明这题没做，转成""
			if(answer=="undefined"){
				answer = "";
			}
			answerJson+='"'+qustionId+'":"'+answer+'",';
		});
		answerJson = answerJson.substr(0,answerJson.length-1);
		answerJson+="}";
		
		if(selectedCount==0){
			alert("未进行答题，不允许交卷！");
			return;
		}
		
		if(confirm("总共"+count+"题，"+"已做"+selectedCount+"题，是否确认交卷？")){
			$.ajax({
				   type: "POST",
				   html: "text/html",
				   url: "<%=basePath%>exam/getExamScore.app",
				   data: {
					   userId:userId,
					   examId:examId,
					   answerJson:answerJson
				   },
				   success: function(data){
					  if(data!="error"){
						 $(".mask").show();
					     $("section").append(data);
					  }
				   }
				});
		}
	});
	
	//答题结束，ios和安卓点击退出
	function webViewClose(){
		var browser = myBrowser();
		if("IOS"==browser){
	        window.webkit.messageHandlers.jsCallOC.postMessage("123");
		}else{
			window.jsObj.HtmlcallJava("abc");
		}
	}
	
</script>
</html>