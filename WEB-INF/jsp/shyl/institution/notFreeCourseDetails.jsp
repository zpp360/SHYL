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
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="UTF-8">
		<title>课程详情_济南市服务外包公共服务平台</title>
		<base href="<%=basePath%>">
		<jsp:include page="../common/header.jsp"><jsp:param name="id" value="pxjs" /></jsp:include>
		<link rel="stylesheet" href="shyl/css/bootstrap.css" />
		<link href="<%=basePath%>shyl/css/maincss/css.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="<%=basePath%>shyl/css/course/common.css">
		<link rel="stylesheet" href="<%=basePath%>shyl/css/course/course.css">
	
		<script src="/SHYL/shyl/js/layer/layer.js"></script>
		<style type="text/css">
		body{font-size: 16px;}
		.mark {
		    display: inline-block;
		    width: 34px;
		    height: 20px;
		    line-height: 20px;
		    color: #FFFFFF;
		    border-radius: 2px;
		    text-align: center;
		    margin-top: 10px;
		    font-size: 12px;
		}
		.text-right { 
		  text-align: left;  
		 } 
		 .btn-default { 
		    background-color: #188eee; 
		     color: #fff;
		 } 
		.btn-default:hover {
		    background-color: #147de2;
		    color: #fff;
		}
		</style>
	</head>
	<body class="page-course l-media l-aside-right " data-pinterest-extension-installed="ff1.37.9">
    <form action="<%=basePath%>institution/pay.act" method="post" name="Form" id="Form">
    <input type="hidden" id="coursename" name="courseName" value="">
	<input type="hidden" id="realprice" name="price" value="">
	<input type="hidden" id="commodityId" name="commodityId" value="">
	<input type="hidden" id="teaching_style" name="teaching_style" value="">
	<input type="hidden" id="classTypeId" name="classTypeId" value="${pd.classTypeId}">
	<input type="hidden" id="subject_id" name="subject_id" value="">
	</form>
	<input type="hidden" value="${platUser.USER_ID}" id="loginstatus">
	<input type="hidden" value="${platUser.USER_TYPE}" id="user_type">
	<input type="hidden" value="" id="findseeid">

		<section class="section-feature section-course-banner" style="padding: 80px 0 30px;">
			<div class="inner-center clearfix content" style="padding-top: 10px;">
				<div class="imgtext-course imgtext-course--free" auto-test="mod_course_imgtext">
					<div class="img-left--wrap" auto-test="mod_course_imgtext_left"><img class="img-left" id="imgcover" onerror="this.src='//9.url.cn/edu/lego_modules/edu-ui/0.0.1/img/nohash/img-err2.png';this.onerror=null;" src="//9.url.cn/edu/lego_modules/edu-ui/0.0.1/img/nohash/img-err2.png" width="510" height="286"> <span class="btn-expr js-expr-btn btn-expr--free" style="display: none;"><span class="btn-expr-in"><i class="icon-font i-play i-btn-expr"></i></span></span>
					</div>
					<div class="text-right " auto-test="mod_course_imgtext_right">
						<h1 class="page-tt"><span class="title-main" id="courseName"></span></h1>
					<div class="tt-below-line">
						<span class="line-item statistics-apply"> 教学模式： <span
							class="apply-num js-apply-num" id="apply-num-flag">录播</span></span><i class="icon-sep"></i><span
							class="line-item statistics-rate">购买数： <span
							class="rate-num" id="rate-num-count"> 0人 </span></span>
					</div>
					<div><p style="margin-top:30px;">培训讲师：<span id="jiangshi">某某人</span></p></div>
					<div class="course-price js-course-price course-price--free active" data-termid="100198526">
							<p class="course-price-info free"style="background-color: #F3F3F3;width: 100%;margin-left: 0px;" ><span class="price free" style="color: #E8536D;" id="realPrice">￥29.9</span><del style="color: #383333;font-size: 16px;margin-left: 10px;" id="originalPrice">￥29.9</del> </p>
							
					</div>
					<div class="oper-bar" id="js_btn_bar" auto-test="mod_oper_bar">
						<span onclick="buy()" id="buybtnbar" class="btn-join js-apply-btn btn-default js-apply-btn-apply" style="display: none;">立即购买</span>
					</div>
					<div class="oper-bar" id="js_btn_bar_purchased" auto-test="mod_oper_bar">
						<span id="purchasedbtnbar" class="btn-join js-apply-btn btn-default js-apply-btn-apply" style="background-color: #bbc2c7; display: none;">已购买</span>
					</div>
					<div class="oper-bar" id="js_btn_bar_find" auto-test="mod_oper_bar" style="margin-left: 180px;">
						<span onclick="findsee();" id="findbtnbar" class="btn-join js-apply-btn btn-default js-apply-btn-apply" style="background-color: #01a461; display: none;">立即观看</span>
					</div>
					</div>
				</div>
			</div>
		</section>
		<section id="js-section-main" class="section-main">
			<div class="inner-center clearfix">
				<main class="main">
					<div class="content tabs" style="width: 100%;">
						<div class="tabs-tt-bar js_tab js-tab-nav" id="js_tab">
							<h2 class="tabs-tt active" id="overview" ref="js_basic_tab" auto-test="mod_tabs_basic" onclick="overview();">课程概述</h2>
							<h2 class="tabs-tt" id="catalogue" ref="js_dir_tab" auto-test="mod_tabs_dir" onclick="catalogue();">课程目录</h2>
							<h2 class="tabs-tt" ref="js_comment_tab" auto-test="mod_tabs_comment"></span></h2></div>
						<div class="tabs-content" id="js_basic_tab">
							<div class="guide-bd" id="detailDiv">
							</div>
						</div>
						<div class="tabs-content hide" id="js_dir_tab">
							<div class="js-chapter-list pt30">
							<input type="hidden" id="chapter" value=""/>
								<div class="task-chapter">
									<div class="task-part-list">
										<div class="task-part-item"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</main>
			</div>
			<script type="text/javascript">
			function overview(){
				$("#overview").attr("class","tabs-tt active");
				$("#catalogue").attr("class","tabs-tt");
				$("#js_basic_tab").attr("class","tabs-content");
				$("#js_dir_tab").attr("class","tabs-content hide");
			}
			function catalogue(){
				$("#catalogue").attr("class","tabs-tt active");
				$("#overview").attr("class","tabs-tt");
				$("#js_dir_tab").attr("class","tabs-content");
				$("#js_basic_tab").attr("class","tabs-content hide");
			}
			function taskclick(num){
				var oUl = document.getElementById('task-task-list-id-'+num);
				if (oUl.style.display == 'none') {  //判断样式
					oUl.style.display = 'block';
		        }else {
		        	oUl.style.display = 'none';
		        }
			}
			</script>
		</section>
		<section class="section-postscript section--recommend" auto-test="mod_recommend_courses">
			<div class="inner-center">
				<h3 class="section-tt">其它课程推荐</h3>
				<div class="section-bd course-card-list-single-wrap">
					<ul class="course-card-list">
					</ul>
				</div>
			</div>
		</section>
		<!--<footer开始>-->
 		<jsp:include page="../common/footer.jsp"></jsp:include>
 		<!--</footer结束>-->
 			<!-- 确认到登录界面 开始-->
	<div class="modal fade bs-example-modal-sm" id="layhomewarn"
		role="dialog" aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm" style="margin-top: 250px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="mySmallModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<input type="hidden" value="" id="startid" name="startid">

					请登录后操作！
				</div>
			</div>
		</div>
	</div>
	<!-- 确认到登录界面 结束-->
	<!-- 无权访问开始 -->
	<div class="modal fade bs-example-modal-sm" id="wqfw" role="dialog"
		aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm" style="margin-top: 250px">
			<div class="modal-content" style="width: 410px">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="mySmallModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<div class="modal-body"
						style="width: 410px; height: 60px; padding-top: 0px">
						<h4>您无权限进行操作，请以个人用户登录！！</h4>
						<br> <br>
					</div>
					<div class="modal-footer" style="height: 15px" id="testPaperSubmit">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class='modal my-modal-alert' id='my-modal-failure-alert'>
        <div class='modal-dialog boxBodySmall'>
            <div class='modal-content' style="width:220px;text-align:center;position:fixed;right:40%;bottom:45%;">
                <div class='modal-body' id='modal-body-alert'>
                    <img alt="" src="<%=basePath%>shyl/images/fail.png">&nbsp;&nbsp;查看课程详情失败!
                </div>
            </div>
        </div>
    </div>
    <div class='modal my-modal-alert' id='my-modal-failure-lectures-alert'>
        <div class='modal-dialog boxBodySmall'>
            <div class='modal-content' style="width:220px;text-align:center;position:fixed;right:40%;bottom:45%;">
                <div class='modal-body' id='modal-body-alert'>
                    <img alt="" src="<%=basePath%>shyl/images/fail.png">&nbsp;&nbsp;查看课程目录失败!
                </div>
            </div>
        </div>
    </div>
    <div class='modal my-modal-alert' id='my-modal-failure-course-alert'>
        <div class='modal-dialog boxBodySmall'>
            <div class='modal-content' style="width:220px;text-align:center;position:fixed;right:40%;bottom:45%;">
                <div class='modal-body' id='modal-body-alert'>
                    <img alt="" src="<%=basePath%>shyl/images/fail.png">&nbsp;&nbsp;获取推荐课程失败!
                </div>
            </div>
        </div>
    </div>
	<!-- 无权访问结束 -->
	</body>
<script  type="text/javascript">
	$("#shopcart").click(function(){
	 layer.msg('加入购物车成功');
	});
	function buy(){
		var userid = $('#loginstatus').val();
		//用户类型   1：个人，2：公司，3：培训机构，4：学校，9：管理员
		var usertype = $('#user_type').val();
		//用户不登录的情况，提示用户登录
		if (userid == "") {
			$('#layhomewarn').modal('show');
		} else if(usertype==1){
			$("#Form").submit();
		}else{
			    $('#wqfw').modal('show');
			 }
	}
	function findsee(){
		var classTypeId = $("#classTypeId").val();
		var findseeid = $("#findseeid").val();
		if(findseeid!=null || findseeid!=""){
			window.open('<%=basePath%>institution/courseVideo.act?classTypeId='+classTypeId+'&id='+findseeid,'_blank'); //在新的空白页面打开
		}
	}
	$(document).ready(function(){
		$(".title-label").attr("display","none");
		var classTypeId = $("#classTypeId").val();
		// 课程详情
		$.ajax({
		    type : "POST",
		    url :  '<%=basePath%>courseapp/courseDetail.app',
			data : {
				classTypeId : classTypeId
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				// 成功
				if ("0" == data.flag) {
					var flag = new Array();
					if (data.data.faceFlag == '1') {
						flag.push('面授');
					}
					if (data.data.liveFlag == '1') {
						flag.push('直播');
					}
					if (data.data.videoFlag == '1') {
						flag.push('录播');
					}
					if (data.data.remoteFlag == '1') {
						flag.push('其他');
					}
					//课程名(隐藏域)
					$("#coursename").val(data.data.name);
					//价格(隐藏域)
					$("#realprice").val(data.data.realPrice);
					// 商品ID(隐藏域)
					$("#commodityId").val(data.data.id);
					//授课模式(隐藏域)
					//$("#teaching_style").val(flag.join(' | '));
					$("#teaching_style").val('录播');
					//一级项目ID
					$("#subject_id").val(data.data.itemOneId);
					// 课程名称
					document.getElementById('courseName').innerHTML = data.data.name;
					// 真实价格（优惠之后的价格）
					document.getElementById('realPrice').innerHTML = "￥" + data.data.realPrice;
					// 原始价格
					document.getElementById('originalPrice').innerHTML = "￥" + data.data.originalPrice;
					// 授课模式
					//document.getElementById('apply-num-flag').innerHTML = flag.join(' | ');
					document.getElementById('apply-num-flag').innerHTML = '录播';
					// 购买数
					document.getElementById('rate-num-count').innerHTML = data.data.buyNum + "人";
					// 班型封面
					if(data.data.cover==null || data.data.cover==""){
						$("#imgcover").attr("src","//9.url.cn/edu/lego_modules/edu-ui/0.0.1/img/nohash/img-err2.png");
					}else{
						$("#imgcover").attr("src",data.data.cover);
					}
					
					// 购买标记
					if(data.data.buyFlag == "1"){
						$("#buybtnbar").css("display","none");
						$("#purchasedbtnbar").css("display","block");
						$("#findbtnbar").css("display","block");
					}else{
						$("#buybtnbar").css("display","block");
						$("#purchasedbtnbar").css("display","none");
						$("#findbtnbar").css("display","none");
					}
					// 老师名称
					document.getElementById('jiangshi').innerHTML = data.data.teacherName;
					// 课程详细信息
					document.getElementById('detailDiv').innerHTML = data.data.detailDesc;
					
					// 视频目录
					$.ajax({
					    type : "POST",
					    url :  '<%=basePath%>courseapp/courseVideoList.app',
						data : {
							classTypeId : classTypeId
						},
						dataType : 'json',
						cache : false,
						success : function(data) {
							// 成功
							if ("0" == data.flag) {
								if(eval(data.data.length)>0){
									$("#chapter").val(data.data.length);
									var html = "";
									for(i=0; i<eval(data.data.length); i++){
										html += '<a href="javascript:;"><div class="task-part-hd" id="task-part-hd-id" onclick="taskclick('+i+');"><span class="tt-prefix">第'+(i+1)+'章</span>';
										html += '<h3 class="part-tt" style="text-align: left;color: #000;font-size: 18px;line-height: inherit;">'+data.data[i]['chapterName']+'</h3></div></a>';
										html += '<div class="task-task-list" style="display: none;" id="task-task-list-id-'+i+'">';
										if(eval(data.data[i]['lectures'].length)>0){
											$("#findseeid").val(data.data[0]['lectures'][0]['id']);
											for(j=0; j<eval(data.data[i]['lectures'].length); j++){
												html += '<a class="task-task-item js-task-live-open task-item-nojump" style="cursor: pointer;" target="_blank" href="<%=basePath%>institution/courseVideo.act?classTypeId='+classTypeId+'&id='+data.data[i]['lectures'][j]['id']+'">';
												html += '<i class="icon-font i-course-live item-icon"></i><p class="task-tt">';
												html += '<span class="task-tt-text" style="width: 900px;" title='+data.data[i]['lectures'][j]['lectureName']+'>'+data.data[i]['lectures'][j]['lectureName']+'</span>';
												if(data.data[i]['lectures'][j]['freeFlag'] == "0" 
														|| data.data[i]['lectures'][j]['freeFlag'] == "" 
														|| data.data[i]['lectures'][j]['freeFlag'] == null){
													html += '<span class="tt-suffix"><i class="mark" style="background: #e80808;">付费</i></span>';
												}else if(data.data[i]['lectures'][j]['freeFlag'] == "1"){
													html += '<span class="tt-suffix"><i class="mark" style="background: #5fb41b;">免费</i></span>';
												}else if(data.data[i]['lectures'][j]['freeFlag'] == "2"){
													html += '<span class="tt-suffix"><i class="mark" style="background: #66C6F8;">试听</i></span>';
												}
												html += '<span class="tt-suffix">'+data.data[i]['lectures'][j]['videoTime']+'</span></p></a>';
											}
										}
										html += '</div>';
									}
									$(".task-part-item").html("");
									$(".task-part-item").html(html);
								}
								
								// 推荐课程
								$.ajax({
								    type : "POST",
								    url :  '<%=basePath%>courseapp/courses.app',
									data : {
										itemOneId : "",
										itemSecondId : "",
										courseFlag : "",
										name : "",
										cusorder : "hot",
										page : "1",
										pageSize : "5"
									},
									dataType : 'json',
									cache : false,
									success : function(data) {
										// 成功
										if ("0" == data.flag) {
											if(data.data.rowCount>0){
												var rowCount = 0;
												if(data.data.rowCount>5){
													rowCount = 5;
												}else{
													rowCount = data.data.rowCount;
												}
												var html = "";
												for(i=0; i<rowCount; i++){
													var flag = new Array();
													if (data.data.result[i]['faceFlag'] == '1') {
														flag.push('面授');
													}
													if (data.data.result[i]['liveFlag'] == '1') {
														flag.push('直播');
													}
													if (data.data.result[i]['videoFlag'] == '1') {
														flag.push('录播');
													}
													if (data.data.result[i]['remoteFlag'] == '1') {
														flag.push('其他');
													}
													html += '<li class="course-card-item">';
													html += '<a href="<%=basePath%>institution/notFreeCourse.act?classTypeId='+data.data.result[i]['classTypeId']+'"';
													html += 'target="_blank" class="item-img-link" data-id="'+data.data.result[i]['classTypeId']+'" data-index="1 + 1"';
													html += 'data-ispkg="0" data-cardpos="1.2"';
													html += 'report-tdw="action=Coursecard_Coursecover-clk&amp;ver1=165200&amp;ver3=1.2&amp;obj1=0"';
													html += 'cors-path="1">';
													if(data.data.result[i]['cover']==null || data.data.result[i]['cover']==""){
														html += '<img src="//9.url.cn/edu/lego_modules/edu-ui/0.0.1/img/nohash/img-err2.png" class="item-img"';
													}else{
														html += '<img src="'+data.data.result[i]['cover']+'" class="item-img"';
													}
													html += 'onerror="this.src=//9.url.cn/edu/lego_modules/edu-ui/0.0.1/img/nohash/img-err2.png;this.onerror=null;"';
													html += 'width="220" height="124">';
													html += '<div class="parcel-box">';
													html += '<h4 class="item-tt" style="color:#14191e; height: 20px;">'+data.data.result[i]['name']+'</h4>';
													html += '<div class="item-line item-line--bottom">';
													html += '<span class="price free" style="color: #E8536D;font-size: 16px;" id="realPrice">￥'+data.data.result[i]['realPrice']+'</span>';
													html += '<del style="color: #383333;font-size: 12px;margin-left: 10px;" id="originalPrice">￥'+data.data.result[i]['originalPrice']+'</del>';
													html += '<span class="line-cell item-user item-user--right">';
													html += '<em>购买数：'+data.data.result[i]['buyNum']+'</em></span>';
													html += '</div><span class="line-cell item-price free" style="color:#93999f;">授课模式：'+'录播'+' </span></a></li>';
												}
												$(".course-card-list").html("");
												$(".course-card-list").html(html);
											}else{
												$(".inner-center").css("display","none");
											}
										} else {
											$('#my-modal-failure-course-alert').show().delay(1000).fadeOut();
										}
									}
								});
							} else {
								$('#my-modal-failure-lectures-alert').show().delay(1000).fadeOut();
							}
						}
					});
				} else {
					$('#my-modal-failure-alert').show().delay(1000).fadeOut();
				}
			}
		});
	});
</script>
</html>