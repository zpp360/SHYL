<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<title>企业新闻发布_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<base href="<%=basePath%>">
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link rel="stylesheet" href="shyl/css/bootstrap.css" />
<jsp:include page="../../common/header.jsp"></jsp:include>
<script src="shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<style type="text/css">
.textareatxt2{
	background-color: #f7f7f7 !important ;
}
.edui-default .edui-editor {
	background-color: #ecf0f9;
}

.modal {
	z-index: 10176524 !important;
}
div.inputtxt2 {
    width: 275px;
    float: left;
}
div.inputtxt2 b{
    float: right;
    margin-top: 20px;
    margin-right: 7px;
}
* {
    box-sizing: content-box;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param value="3" name="menuType"/></jsp:include>
		<div class="mypage_right">
			<h2 style="margin-top: 0px;">发布企业新闻</h2>
			<div class="input_class" style="margin-bottom: 100px;">
			<form class="form-horizontal company_list" role="form" id="newsForm"
							name="newsForm" action="" method="post">
				<ul style="margin-bottom: 20px;">
					<li style="width: 800px;">
					 	<span><small style="color:red">*</small>&nbsp;新闻标题：</span>
						<input type="text" class="inputtxt2" style="width: 600px;" id="news_title" name="news_title" placeholder="请输入新闻标题" maxlength="50" onblur="trim(this);">
					</li>
					<li style="height:260px;width: 100%;">
						<span><small style="color:red">*</small>&nbsp;新闻内容：</span>
						<textarea id="news_content" name="news_description"
												class="textareatxt2" style=" float: left;height:160px;"></textarea>
					</li>
					
				</ul>
			</form>
				<a href="javascript:void(0);" class="save3" onclick="save();">保存</a>
				<a href="javascript:void(0);" class="sback" onclick="returnback();">返回</a>
			</div>
		</div>
	</div>
	<div class='modal my-modal-alert' id='my-modal-success-alert'>
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:150px;text-align:center;position:fixed;right:40%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;添加成功!
                    </div>
                </div>
            </div>
        </div>
	<div class="clear"></div>
	<%@ include file="../../common/footer.jsp"%>
</body>
<!-- 富文本编辑器start -->
	<!-- 配置文件 -->
	<script src="shyl/js/jquery-1.7.2.js"></script>
	<script src="shyl/js/bootstrap.js"></script>
	<script src="shyl/js/scroll.js"></script>
	<!-- 新追加部分 -->
	<!--引入弹窗组件start-->
	<script src="plugins/attention/zDialog/zDrag.js"></script>
	<script src="plugins/attention/zDialog/zDialog.js"></script>
	<script type="text/javascript" src="plugins/ueditor/ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript" src="plugins/ueditor/ueditor.all.js"></script>
	<!-- 实例化编辑器 -->
	<script type="text/javascript">
		var ue = UE.getEditor("news_content",{
			autoHeightEnabled: false
		});
		//ueditor有标签文本

		function getContent() {
			var arr = [];
			arr.push(UE.getEditor('news_content').getContent());
			return arr.join("");
		}

		function clean() {
			ue.setContent("");
		}

		function setFocus() {
			UE.getEditor('news_content').focus();
		}
	</script>
	<!--引入表单验证start-->
	<script src="shyl/js/jquery.validate.js"></script>
	<script src="shyl/js/jquery.validate.unobtrusive.js"></script>
	<script type="text/javascript" src="shyl/js/jquery.tips.js"></script>
	<!--引入表单验证end-->
	<script type="text/javascript">
	    // 保存
		function save(){
			if(localcheck()){
				$("#newsForm").attr('action','<%=basePath%>companyNews/save.act');
				$("#newsForm").submit();
				$("#my-modal-success-alert").show().delay(4000).fadeOut(); 
			}
		}
		
		function localcheck(){
			if($("#news_title").val() == ""){
				$("#news_title").tips({
					side : 2,
					msg : "请输入新闻标题",
					bg : '#AE81FF',
					time : 2
				});
				$("#news_title").focus();
				return false;
			}
			if($("#news_content").val() == ""){
				$("#edui1").tips({
					side : 2,
					msg : "请输入新闻内容",
					bg : '#AE81FF',
					time : 2
				});
				$("#news_content").focus();
				return false;
			}
			return true;
		}
	    
		//返回
	    function returnback(){
	    	window.location.href="<%=basePath%>companyNews/list.act";}
	</script>
</html>