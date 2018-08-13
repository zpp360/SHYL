<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<title>试卷一览_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<base href="<%=basePath%>">
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<jsp:include page="../../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link rel="stylesheet"
	href="<%=basePath%>shyl/css/question/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="<%=basePath%>shyl/css/question/font-awesome/css/exam.css" />
<link rel="stylesheet"
	href="<%=basePath%>shyl/css/question/font-awesome/css/morris.css" />
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/question/exampaper-preview.js"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
</head>
<body style="background-color: #f7f7f7;">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param value="32" name="menuType"/></jsp:include>
		<div class="mypage_right">
			<h2 style="color:color:black;">预览试卷</h2>
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
											<span id="exampaper-title-name">${exampapername} </span>
											<span style="display:none;" id="exampaper-id">${exampaperid}</span>
											
										</div>
										<div id="exampaper-desc-container">
											<div id="exampaper-desc" class="exampaper-filter">
												
											
											</div>
											<div style="margin-top: 5px;">
												<span>试卷总分：</span><span id="exampaper-total-point" style="margin-right:20px;"></span>
												<!-- <span id="add-more-qt-to-paper"><i class="small-icon fa fa-plus-square" title="添加选项"></i><span>增加更多题目</span></span> -->
											</div>
										</div>
										
										
									</div>
									<ul id="exampaper-body" style="padding:0px;">
										${htmlStr }
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
											<!-- <button class="btn btn-danger"><i class="fa fa-save"></i>保存试卷</button> -->
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
	<div class="clear"></div>
	<%@ include file="../../common/footer.jsp"%>
</body>
<script type="text/javascript">
var selection = $("#dd").find("select");
var point_list = $("#ss").find("select");
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
    function Delete() {
    	var id=$("#id").val();
    	location.href="<%=basePath%>papermain/delevaluation.act?id="+id;	
	}
    function xdown(id){
    	location.href="<%=basePath%>papermain/xdown.act?id="+id;
    }
    function del(id){
    	$("#id").val(id);
    }
    function details(id){
    	window.location="<%=basePath%>papermain/details.act?generatedId="+id;
    }
    //检索
	function search(){
		top.jzts();
		$("#newsform").submit();
	}
    function updatePaper(id){
    	$.ajax({
			type : "POST",
			url :  '<%=basePath%>papermain/findpaperbyid.act',
			data : {
				id:id
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				$("#TechName").val(data.name);
				$("#Duration").val(data.duration);
				$("#types").val(data.field_id);
				$("#paperid").val(id);
				$("#knowleage").val(data.point_id);
			}
		});
    }
</script>
</html>