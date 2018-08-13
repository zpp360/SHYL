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
<html>
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<jsp:include page="../common/header.jsp"><jsp:param name="id" value="pxjs" /></jsp:include>
<title>培训晋升课程列表_济南市服务外包公共服务平台</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<link rel="stylesheet"
	href="<%=basePath%>shyl/css/institution/allclass.css" type="text/css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/institution/app.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=basePath%>shyl/css/institution/class.css" type="text/css">
<link rel="stylesheet"
	href="<%=basePath%>shyl/css/institution/fatstyle.css" type="text/css">
<link rel="stylesheet"
	href="<%=basePath%>shyl/css/institution/findCourse.css" type="text/css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/institution/head.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=basePath%>shyl/css/institution/register_thirdLogin.css"
	type="text/css">

<!--  ajax加载中div结束 -->
<script type="text/javascript">
    	var _search_name = '';
    </script>
</head>
<body id="List_courseId">
	<div id="header"></div>
	<!-- header end -->
	<!-- body start -->
	<!-- menu start -->
	<div class="wrap class-menu" style="width: 1200px;" data-item-one-id=""
		data-item-two-id="">
		<div class="class-menu-box class-menu-boxfind">
			<div class="clear"></div>
			<div class="all-class-list all-class-listfind">
				<div class="sub-list sub-listfind">
					<div class="list-title list-title-find">学科 :</div>
					<div class="list-right">
						<ul id="itemOneLists">
							<li class="course-active" ids="">全部</li>
						</ul>
					</div>
				</div>
				<div class="sub-list sub-listfind none" id="itemTwoListChoose"
					style="display: none;">
					<div class="list-title list-title-find titPtop">学科小类 :</div>
					<div class="list-right">
						<ul id="itemSecondLists">
							<li class="titPtop course-active" ids="">全部</li>
						</ul>
					</div>
				</div>
				<div class="sub-list sub-listfind itemtagLists titPtop none">
					<div class="list-title titPtop">课程标签 :</div>
					<div class="list-right">
						<ul id="courseLables"></ul>
					</div>
				</div>
				<div class="sub-list sub-listfind itemtagSecondLists titPtop none">
					<div class="list-title titPtop">二级标签 :</div>
					<div class="list-right">
						<ul id="courseSecondLables"></ul>
					</div>
				</div>
				<div class="sub-list sub-listfind">
					<div class="list-title list-title-find titPtop">授课方式 :</div>
					<div class="list-right">
						<ul id="list-type">
							<li class="titPtop course-active" ids="all">全部</li>
							<li class="titPtop" ids="live">直播</li>
							<li class="titPtop" ids="video">录播</li>
							<li class="titPtop" ids="face">面授</li>
							<li class="titPtop" ids="remote">其他</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="newclass newclass-find" style="width: 1200px;">
		<ul id="courseTypes">
			<li class="aacc statefind-active" ids="new">最新</li>
			<li class="aacc" ids="hot">最热</li>
			<li class="aacc" ids="general">综合</li>
		</ul>
		<div class="sreach sreach-find">
			<form method="post" id="searchForms">
				<span><input class="sreach-in sreachfind-in"
					id="searchContent" placeholder="请输入搜索关键词" name="name" type="text"></span>
				<span class="fr icon"> <i class="iconfont searchbtn"
					style="cursor: pointer;"></i>
				</span>
			</form>
		</div>
	</div>
	<!-- menu end -->
	<div id="classList" style="height: auto;">
		<div class="class-list classfind-list">
			<ul class="clear">
			</ul>
		</div>
	</div>
	<input type="hidden" id="indextitle" value=""> <input
			type="hidden" id="secondeItemId" value=""> <input
			type="hidden" id="methodurl" value="<%=basePath%>">
	<input type="hidden" id="oneItemIdSearchKey" value="${pd.oneItemIdSearchKey }">
	<!-- ajax加载中div开始 -->
	<div class="course-loading lp-units-loading" style="display: none">
		<p>
			<i></i>加载中,请稍后...
		</p>
	</div>
	<div class="loading-bg lp-units-loading-bg" style="display: none"></div>
	<script
		src="<%=basePath%>shyl/js/institution/courselist/footerPosition.js"
		type="text/javascript"></script>
	<script src="<%=basePath%>shyl/js/institution/courselist/common.js"
		type="text/javascript"></script>
	<script
		src="<%=basePath%>shyl/js/institution/courselist/jquery.pagination.js"
		type="text/javascript"></script>
	<script
		src="<%=basePath%>shyl/js/institution/courselist/searchcourse.js"
		type="text/javascript"></script>
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>