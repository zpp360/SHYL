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
		<meta charset="UTF-8">
		<title>课程详情_济南市服务外包公共服务平台</title>
		<base href="<%=basePath%>">
		<jsp:include page="../common/header.jsp"><jsp:param name="id" value="pxjs" /></jsp:include>
		<!-- <meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="format-detection" content="telephone=no,email=no"> -->
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<!-- <meta itemprop="image" content="http://10.url.cn/qqcourse_logo_ng/ajNVdqHZLLCEU32icG2jVyWh5piaOzjUMFHKibP5SKEicYVf73OyZ3v0SvLwJfaprpQcjqLQck9zJvg/">
		<meta version="116945">
		<link rel="dns-prefetch" href="https://7.url.cn/">
		<link rel="dns-prefetch" href="https://8.url.cn/">
		<link rel="dns-prefetch" href="https://9.url.cn/"> -->
		<link href="<%=basePath%>shyl/css/maincss/css.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="<%=basePath%>shyl/css/course/common.css">
		<link rel="stylesheet" href="<%=basePath%>shyl/css/course/course.css">
		<script src="shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
		<script type="text/javascript" src="shyl/js/jquery-1.7.1.js"></script>
		
		<style type="text/css">
		body{font-size: 16px;}
		</style>
	</head>

	<body class="page-course l-media l-aside-right " data-pinterest-extension-installed="ff1.37.9">
	<!-- <iframe style="width: 1px; height: 1px; position: absolute; top: -1000px; left: -1000px;" src="coursedetails/api_v112.htm"></iframe> -->
		<!-- <nav class="sticky-nav hide" id="js_float_tab" auto-test="mod_sticky_nav">
			<div class="inner-center">
				<ul class="tabs-tt-bar js_tab">
					<li class="tabs-tt active" ref="js_basic_tab">课程概述</li>
					<li class="tabs-tt" ref="js_dir_tab">课程目录</li>				
				</ul>
				<div class="btn-join js-apply-btn btn-default js-apply-btn-apply">立即报名</div>
			</div>
		</nav> -->
		<section class="section-feature section--course-banner" style="padding: 80px 0 30px;">
			<div class="course-banner inner-center clearfix">
				<nav class="breadcrumb inner-center">
					<a class="breadcrumb-item" href="https://ke.qq.com/course/list">全部课程</a><i class="icon-font i-v-right"></i>
					<a class="breadcrumb-item" href="https://ke.qq.com/course/list?mt=1004">职业·考证</a><i class="icon-font i-v-right"></i>
					<a class="breadcrumb-item" href="https://ke.qq.com/course/list?mt=1004&amp;st=2039">医疗卫生</a><i class="icon-font i-v-right"></i>
					<a class="breadcrumb-item" href="https://ke.qq.com/course/list?mt=1004&amp;st=2039&amp;tt=3213">执业医师</a><i class="icon-font i-v-right"></i>
					<a class="breadcrumb-item item--tt" href="https://ke.qq.com/course/169959">2017 昭昭老师 执业（含助理）必考点精讲</a>
				</nav>
				<div class="imgtext-course imgtext-course--free" auto-test="mod_course_imgtext">
					<div class="img-left--wrap" auto-test="mod_course_imgtext_left">
					<img class="img-left" onerror="this.src='//9.url.cn/edu/lego_modules/edu-ui/0.0.1/img/nohash/img-err2.png';this.onerror=null;" src="<%=basePath%>shyl/images/course/5101.jpg" alt="2017 昭昭老师 执业（含助理）必考点精讲" width="510" height="286"> <span class="btn-expr js-expr-btn btn-expr--free" style="display: none;"><span class="btn-expr-in"><i class="icon-font i-play i-btn-expr"></i></span></span>
					</div>
					<div class="text-right " auto-test="mod_course_imgtext_right">
						<h1 class="page-tt"><span class="title-main">2017 昭昭老师 执业（含助理）必考点精讲</span><span class="title-label"></span></h1>
						<div class="tt-below-line"> <span class="line-item statistics-apply">  报名人数  <span class="apply-num js-apply-num">4803</span></span><i class="icon-sep"></i><span class="line-item statistics-rate"> 
							<div class="line-item item--share" id="js_share">
								<div class="hover-tips tips--share" id="js_share_panel">
									<ul class="share-list">
										<li class="share-qq icon-qq" data-to="qq"></li>
										<li class="share-qzone icon-qzone" data-to="qzone"></li>
										<li class="share-weixin icon-weixin" data-to="weixin"></li>
									</ul>
								</div>
							</div><span class="line-item btn-favorite " id="js_fav"></span></div>
						<div class="course-class course-class--one ">
							<div class="class-tt-list-wrap">
								<ul class="class-tt-list" id="js_term_master">
									<li class="js-term-item active" data-idx="0" data-termid="100198526"><span class="item-name" title="2017医考必过班">2017医考必过班</span> </li>
								</ul><span class="class-more" style=""><i class="icon-font i-v-left"></i>更多班级<i class="icon-font i-v-right"></i></span></div>
							<div class="class-content-list ">
								<div class="class-content js-term-item js-term-baseinfo    class-content--no-des active" data-idx="0" data-termid="100198526">
									<h2 class="hidden-clip">2017医考必过班 </h2>
									<p class="class-date"> 12月19日开课 至 21年11月结课 </p>
								</div>
							</div>
						</div>
						<div class="course-price js-course-price course-price--free active" data-termid="100198526">
							<p class="course-price-info free"> <span class="price free">  免费  </span> </p>
							<div class="course-price-discount">
								<div class="course-coupon js-coupon-wrap hide" style="display: none;"></div>
							</div>
						</div>
						<a href="http://class.hujiang.com/16321064/demo">
						<div class="oper-bar" id="js_btn_bar" auto-test="mod_oper_bar"> <span class="btn-join js-apply-btn btn-default js-apply-btn-apply">立即观看</span>
						</div>
						</a>
					</div>
				</div>
			</div>
		</section>
		<section id="js-section-main" class="section-main">
			<div class="inner-center clearfix">
				<main class="main">
					<div class="content tabs" style="width: 1200px;">
						<div class="tabs-tt-bar js_tab js-tab-nav" id="js_tab">
							<h2 class="tabs-tt active" id="overview" ref="js_basic_tab" auto-test="mod_tabs_basic" onclick="overview();">课程概述</h2>
							<h2 class="tabs-tt" id="catalogue" ref="js_dir_tab" auto-test="mod_tabs_dir" onclick="catalogue();">课程目录</h2>
							<h2 class="tabs-tt" ref="js_comment_tab" auto-test="mod_tabs_comment"></span></h2></div>
						<div class="tabs-content" id="js_basic_tab">
							<h3 class="guide-tt js-teacher-location" data-teacherlocation="1">老师介绍</h3>
							<div class="guide-bd">
								<div class="teacher-list">
									<div class="teacher-item">
										<a href="https://ke.qq.com/teacher/19860344" class="img-left" target="_blank"><img src="<%=basePath%>shyl/images/course/g.jpg" alt="昭昭老师"></a>
										<div class="text-right">
											<h4 class="text-tt"><a class="tt-link js-teacher-name" href="https://ke.qq.com/teacher/19860344" title="昭昭老师" target="_blank">昭昭老师</a></h4>
											<div class="text-intro js-teacher-intro" title="昭昭老师，京城医考四大名师，通过图文并茂，画图讲解法教给你，零基础也能过医考！">昭昭老师，京城医考四大名师，通过图文并茂，画图讲解法教给你，零基础也能过医考！</div>
										</div>
									</div>
								</div>
							</div>
							<div class="guide-bd">
								<table class="tb-course">
									<tbody>
										<tr>
											<th>简　　介</th>
											<td>在这里，昭昭老师用图文并茂的方法，帮助那些基础最差的同学拿证！</td>
										</tr>
										<tr>
											<th>学习目标</th>
											<td>2016年的考试内容，就是我们2017年的努力方向！</td>
										</tr>
									</tbody>
								</table>
								<div class="intro-course"> <br style="font-family: 'Hiragino Sans GB', 'Microsoft Yahei', arial, 宋体, 'Helvetica Neue', Helvetica, STHeiTi, sans-serif;">
									<span style="max-width: 100%; box-sizing: border-box; font-family: 'Hiragino Sans GB', 'Microsoft Yahei', arial, 宋体, 'Helvetica Neue', Helvetica, STHeiTi, sans-serif; font-size: 20px;"><span style="max-width: 100%; box-sizing: border-box; font-family: arial, helvetica, sans-serif;"><span style="max-width: 100%; box-sizing: border-box; font-size: 16px;">本课程是有昭天下教育科技公司创始人，<u><span style="max-width: 100%; box-sizing: border-box; color: rgb(255, 0, 0);">刘钊老师亲手创办</span></u>，并<span style="max-width: 100%; box-sizing: border-box; color: rgb(255, 0, 0);">亲自授课</span>的直播课程。</span>
									</span><br><br><span style="max-width: 100%; box-sizing: border-box; font-size: 16px;"><span style="max-width: 100%; box-sizing: border-box; color: rgb(0, 0, 0); font-family: tahoma, arial, 'Hiragino Sans GB', 宋体, sans-serif;">昭昭老师，中国医学考试培训青年领军人物，被广大学员誉为京城四大名师、医考之王等。授课风格鲜明生动，轻松理解、简单易记、押题精准，</span><span style="max-width: 100%; box-sizing: border-box; color: rgb(255, 0, 0);"><span style="max-width: 100%; box-sizing: border-box; font-family: tahoma, arial, 'Hiragino Sans GB', 宋体, sans-serif;">国内首创“画图记忆法”</span></span><span style="max-width: 100%; box-sizing: border-box; color: rgb(0, 0, 0); font-family: tahoma, arial, 'Hiragino Sans GB', 宋体, sans-serif;">，近年来经其培训并通过医考的学员数以万计，获得广大考生的一致认可。</span></span>
									</span>
									<span style="font-family: 'Hiragino Sans GB', 'Microsoft Yahei', arial, 宋体, 'Helvetica Neue', Helvetica, STHeiTi, sans-serif;">&nbsp;&nbsp;</span>
									<br style="font-family: 'Hiragino Sans GB', 'Microsoft Yahei', arial, 宋体, 'Helvetica Neue', Helvetica, STHeiTi, sans-serif;">
									<br style="font-family: 'Hiragino Sans GB', 'Microsoft Yahei', arial, 宋体, 'Helvetica Neue', Helvetica, STHeiTi, sans-serif;">
									<span style="max-width: 100%; box-sizing: border-box; font-family: 'Hiragino Sans GB', 'Microsoft Yahei', arial, 宋体, 'Helvetica Neue', Helvetica, STHeiTi, sans-serif; font-size: 18px;"><span style="max-width: 100%; box-sizing: border-box; font-family: arial, helvetica, sans-serif;"><span style="max-width: 100%; box-sizing: border-box; font-size: 16px;">本课程主要特色：详细解析历年真题，让你在短时间内，高效的搞懂医考23门科目的内容。</span></span>
									</span>
									<span style="font-family: 'Hiragino Sans GB', 'Microsoft Yahei', arial, 宋体, 'Helvetica Neue', Helvetica, STHeiTi, sans-serif;">&nbsp;&nbsp;</span>
									<br style="font-family: 'Hiragino Sans GB', 'Microsoft Yahei', arial, 宋体, 'Helvetica Neue', Helvetica, STHeiTi, sans-serif;">
									<br style="font-family: 'Hiragino Sans GB', 'Microsoft Yahei', arial, 宋体, 'Helvetica Neue', Helvetica, STHeiTi, sans-serif;">
									<span style="max-width: 100%; box-sizing: border-box; font-family: 'Hiragino Sans GB', 'Microsoft Yahei', arial, 宋体, 'Helvetica Neue', Helvetica, STHeiTi, sans-serif; font-size: 16px;">学员的认可，是老师最欣慰的、最开心的事情，看看他们的故事，你的那个证书还远吗》》》</span>
									<span style="font-family: 'Hiragino Sans GB', 'Microsoft Yahei', arial, 宋体, 'Helvetica Neue', Helvetica, STHeiTi, sans-serif;">&nbsp;</span>
									<br>&nbsp;
									
								</div>
							</div>
						</div>
						<div class="tabs-content hide" id="js_dir_tab">
							<!-- <div class="course-class-task" id="js_class_task">
								<div class="drop-down drop-down--class"><span class="drop-down-tt js-term-current">2017医考必过班</span> </div>
								<div class="task-schedule js-schedule task-schedule--no-begin"><span class="schedule-start js-progress-start">12月19日开课</span>
									<div class="schedule-progress-wrap">
										<div class="schedule-progress js-progress-progress"><span class="percent js-percent" style="width: 0%;"></span></div>
										<div class="progress-course-plan js-progress" style="left: 0%;"><i class="icon-person-multi"></i>
											<p class="plan-text js-progress-txt">暂未开课</p>
										</div>
									</div><span class="schedule-end js-progress-end">21年11月结课</span></div>
							</div> -->
							<div class="js-chapter-list pt30">
								<div class="task-chapter">
									<div class="task-part-list">
										<div class="task-part-item">
											<a href="javascript:;"><div class="task-part-hd" id="task-part-hd-id-1"> <span class="tt-prefix">第1节</span>
												<h3 class="part-tt">运动系统</h3> </div></a>
											<div class="task-task-list" style="display: none;" id="task-task-list-id-1">
												<a class="task-task-item js-task-live-open task-item-nojump" href="javascript:void(0);"> <i class="icon-font i-course-live item-icon"></i>
													<p class="task-tt"> <span class="task-tt-text" title="【直播】运动系统1">【直播】运动系统1</span><span class="tt-suffix">(12月19日 已结束)</span> </p>
												</a>
												<a class="task-task-item js-task-live-open task-item-nojump" href="javascript:void(0);"> <i class="icon-font i-course-live item-icon"></i>
													<p class="task-tt"> <span class="task-tt-text" title="【直播】运动系统2">【直播】运动系统2</span><span class="tt-suffix">(12月21日 已结束)</span> </p>
												</a>
												<a class="task-task-item js-task-live-open task-item-nojump" href="javascript:void(0);"> <i class="icon-font i-course-live item-icon"></i>
													<p class="task-tt"> <span class="task-tt-text" title="【直播】运动系统3">【直播】运动系统3</span><span class="tt-suffix">(12月23日 已结束)</span> </p>
												</a>
												<!-- end for -->
											</div>
										</div>
										<div class="task-part-item">
											<a href="javascript:;"><div class="task-part-hd" id="task-part-hd-id-2"> <span class="tt-prefix">第2节</span>
												<h3 class="part-tt">运动系统</h3> </div></a>
											<div class="task-task-list" style="display: none;" id="task-task-list-id-2">
												<a class="task-task-item js-task-live-open task-item-nojump" href="javascript:void(0);"> <i class="icon-font i-course-live item-icon"></i>
													<p class="task-tt"> <span class="task-tt-text" title="【直播】运动系统4">【直播】运动系统4</span><span class="tt-suffix">(12月26日 20:00-21:30)</span> </p>
												</a>
												<a class="task-task-item js-task-live-open task-item-nojump" href="javascript:void(0);"> <i class="icon-font i-course-live item-icon"></i>
													<p class="task-tt"> <span class="task-tt-text" title="【直播】运动系统5">【直播】运动系统5</span><span class="tt-suffix">(12月28日 20:00-21:30)</span> </p>
												</a>
												<a class="task-task-item js-task-live-open task-item-nojump" href="javascript:void(0);"> <i class="icon-font i-course-live item-icon"></i>
													<p class="task-tt"> <span class="task-tt-text" title="【直播】运动系统6">【直播】运动系统6</span><span class="tt-suffix">(12月30日 20:00-21:30)</span> </p>
												</a>
												<!-- end for -->
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- <div class="tabs-content hide" id="js_comment_tab">
							<div class="sm-cont sm-main-inner ">
								<div class="mod-comments" id="js-comments">
									<div class="mod-comments-list" id="js-comments-list"></div>
								</div>
							</div>
						</div> -->
					</div>
				</main>
				<%-- <aside class="aside-right" auto-test="mod_course_aside">
					<div class="aside-recommend hide"></div>
					<div class="aside-blocks">
						<div class="aside-block block--agency" auto-test="mod_course_aside_agency">
							<div class="block-bd">
								<h4 class="agency-tt"><div class="tt-cover-url"><a href="https://zhaozhao.ke.qq.com/" target="_blank"><img src="<%=basePath%>shyl/images/course//a.png" alt="昭天下教育-医考精品课堂" width="64" height="64"></a></div><div class="tt-cover-name"><a class="tt-link js-agency-name" href="https://zhaozhao.ke.qq.com/" title="昭天下教育-医考精品课堂" target="_blank">昭天下教育-医考精品课堂</a>   <i class="icon-agency-level "></i>   </div></h4>
								<ul class="tree-list">
									<li>
										<p class="item-tt">好评度</p><span class="item-num">  100%  </span></li>
									<li>
										<p class="item-tt">课程数</p><span class="item-num js-item-num" data-num="10">10</span></li>
									<li>
										<p class="item-tt">学生数</p><span class="item-num js-item-num" data-num="14533">1万</span></li>
								</ul>
								<div class="agency-summary">图形讲解教你过医考</div>
							</div>
						</div>
						<div class="aside-block block--contact" auto-test="mod_course_aside_contact">
							<h3 class="block-tt">加群沟通</h3>
							<div class="block-bd">
								<ul class="contact-list">
									<li class=" js-folded-item"><i class="item-icon icon-font i-group"></i>
										<a href="tencent://VisitPublicGroup/?subcmd=VisitPublicGroup&amp;param=7B22457874506172616D223A7B226170704964223A2230227D2C2267726F757055696E223A3536313131333838302C2276697369746F72223A317D&amp;fuin=3245135300" class="item-tt js-group-entrance" title="2017医考比过群" data-gc="561113880" target="_blank">2017医考比过群</a>
										<p class="gray">群号: 561113880</p>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</aside> --%>
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
			</script>
		</section>
		<script>
			var Tfp = +(new Date());
		</script>
		<section class="section-postscript section--recommend" auto-test="mod_recommend_courses">
			<div class="inner-center">
				<h3 class="section-tt">老师还为你推荐了以下几门课程</h3>
				<div class="section-bd course-card-list-single-wrap">
					<ul class="course-card-list">
						<li class="course-card-item">
							<a href="https://ke.qq.com/course/169961" target="_blank" class="item-img-link" data-id="169961" data-index="0 + 1" data-ispkg="0" data-cardpos="1.1" report-tdw="action=Coursecard_Coursecover-clk&amp;ver1=169961&amp;ver3=1.1&amp;obj1=0" cors-path="1"> <img src="<%=basePath%>shyl/images/course//220_003.png" alt="2017 执业医师  循环系统" title="2017 执业医师  循环系统" class="item-img" onerror="javascript:this.src='//9.url.cn/edu/lego_modules/edu-ui/0.0.1/img/nohash/img-err2.png';this.onerror=null;" width="220" height="124"> </a>
							<h4 class="item-tt">   <a href="https://ke.qq.com/course/169961" target="_blank" class="item-tt-link" title="2017 执业医师  循环系统" report-tdw="action=Coursecard_Coursesname-clk&amp;ver1=169961&amp;ver3=1.1" cors-path="1">2017 执业医师  循环系统</a>  </h4>
							<div class="item-line item-line--bottom"> <span class="line-cell item-price free">  免费 </span> <span class="line-cell item-user item-user--right"> 最近报名 7092人 </span> </div>
						</li>
						<li class="course-card-item">
							<a href="https://ke.qq.com/course/165200" target="_blank" class="item-img-link" data-id="165200" data-index="1 + 1" data-ispkg="0" data-cardpos="1.2" report-tdw="action=Coursecard_Coursecover-clk&amp;ver1=165200&amp;ver3=1.2&amp;obj1=0" cors-path="1"> <img src="<%=basePath%>shyl/images/course//220_002.jpg" alt="昭昭老师   药师 公开课" title="昭昭老师   药师 公开课" class="item-img" onerror="javascript:this.src='//9.url.cn/edu/lego_modules/edu-ui/0.0.1/img/nohash/img-err2.png';this.onerror=null;" width="220" height="124"> </a>
							<h4 class="item-tt">   <a href="https://ke.qq.com/course/165200" target="_blank" class="item-tt-link" title="昭昭老师   药师 公开课" report-tdw="action=Coursecard_Coursesname-clk&amp;ver1=165200&amp;ver3=1.2" cors-path="1">昭昭老师   药师 公开课</a>  </h4>
							<div class="item-line item-line--bottom"> <span class="line-cell item-price free">  免费 </span> <span class="line-cell item-user item-user--right"> 最近报名 643人 </span> </div>
						</li>
						<li class="course-card-item">
							<a href="https://ke.qq.com/course/171246" target="_blank" class="item-img-link" data-id="171246" data-index="2 + 1" data-ispkg="0" data-cardpos="1.3" report-tdw="action=Coursecard_Coursecover-clk&amp;ver1=171246&amp;ver3=1.3&amp;obj1=0" cors-path="1"> <img src="<%=basePath%>shyl/images/course//220.jpg" alt="医考 巴巴 执业中医 中西医结合 公益课" title="医考 巴巴 执业中医 中西医结合 公益课" class="item-img" onerror="javascript:this.src='//9.url.cn/edu/lego_modules/edu-ui/0.0.1/img/nohash/img-err2.png';this.onerror=null;" width="220" height="124"> </a>
							<h4 class="item-tt">   <a href="https://ke.qq.com/course/171246" target="_blank" class="item-tt-link" title="医考 巴巴 执业中医 中西医结合 公益课" report-tdw="action=Coursecard_Coursesname-clk&amp;ver1=171246&amp;ver3=1.3" cors-path="1">医考 巴巴 执业中医 中西医结合 公益课</a>  </h4>
							<div class="item-line item-line--bottom"> <span class="line-cell item-price free">  免费 </span> <span class="line-cell item-user item-user--right"> 最近报名 489人 </span> </div>
						</li>
						<li class="course-card-item">
							<a href="https://ke.qq.com/course/169958" target="_blank" class="item-img-link" data-id="169958" data-index="3 + 1" data-ispkg="0" data-cardpos="1.4" report-tdw="action=Coursecard_Coursecover-clk&amp;ver1=169958&amp;ver3=1.4&amp;obj1=0" cors-path="1"> <img src="<%=basePath%>shyl/images/course//220.png" alt="昭昭老师 2017 执业医师 泌尿系统" title="昭昭老师 2017 执业医师 泌尿系统" class="item-img" onerror="javascript:this.src='//9.url.cn/edu/lego_modules/edu-ui/0.0.1/img/nohash/img-err2.png';this.onerror=null;" width="220" height="124"> </a>
							<h4 class="item-tt">   <a href="https://ke.qq.com/course/169958" target="_blank" class="item-tt-link" title="昭昭老师 2017 执业医师 泌尿系统" report-tdw="action=Coursecard_Coursesname-clk&amp;ver1=169958&amp;ver3=1.4" cors-path="1">昭昭老师 2017 执业医师 泌尿系统</a>  </h4>
							<div class="item-line item-line--bottom"> <span class="line-cell item-price free">  免费 </span> <span class="line-cell item-user item-user--right"> 最近报名 383人 </span> </div>
						</li>
						<li class="course-card-item">
							<a href="https://ke.qq.com/course/169960" target="_blank" class="item-img-link" data-id="169960" data-index="4 + 1" data-ispkg="0" data-cardpos="1.5" report-tdw="action=Coursecard_Coursecover-clk&amp;ver1=169960&amp;ver3=1.5&amp;obj1=0" cors-path="1"> <img src="<%=basePath%>shyl/images/course//220_002.png" alt="2017 执业医师 呼吸系统" title="2017 执业医师 呼吸系统" class="item-img" onerror="javascript:this.src='//9.url.cn/edu/lego_modules/edu-ui/0.0.1/img/nohash/img-err2.png';this.onerror=null;" width="220" height="124"> </a>
							<h4 class="item-tt">   <a href="https://ke.qq.com/course/169960" target="_blank" class="item-tt-link" title="2017 执业医师 呼吸系统" report-tdw="action=Coursecard_Coursesname-clk&amp;ver1=169960&amp;ver3=1.5" cors-path="1">2017 执业医师 呼吸系统</a>  </h4>
							<div class="item-line item-line--bottom"> <span class="line-cell item-price free">  免费 </span> <span class="line-cell item-user item-user--right"> 最近报名 221人 </span> </div>
						</li>
					</ul>
				</div>
			</div>
		</section>
		 <!--<footer开始>-->
 	<jsp:include page="../common/footer.jsp"></jsp:include>
 <!--</footer结束>-->
		
		<script type="text/javascript">
		$(document).ready(function(){
			$("#task-part-hd-id-1").click(function() {
			var oUl = document.getElementById('task-task-list-id-1');
			if (oUl.style.display == 'none') {  //判断样式
	               oUl.style.display = 'block';
	           }
	           else {
	               oUl.style.display = 'none';
	           }
			});
			
			$("#task-part-hd-id-2").click(function() {
			var oUl = document.getElementById('task-task-list-id-2');
			if (oUl.style.display == 'none') {  //判断样式
	               oUl.style.display = 'block';
	           }
	           else {
	               oUl.style.display = 'none';
	           }
			});
		});
		</script>
		
		<!-- <script type="text/javascript">
			require.resourceMap({
				"res": {
					"edu-comb/0.0.1/comb.nowrap": {
						"url": "/lego_modules/edu-comb/0.0.1/comb.nowrap.729dab8b.js"
					},
					"edu-base": {
						"url": "/lego_modules/edu-base/0.0.1/edu-base.5531ec41.js"
					},
					"404/mod.main": {
						"url": "/modules/404/mod.main.6953ebc4.js"
					},
					"coupon/mod.main": {
						"url": "/modules/coupon/mod.main.f96e1623.js"
					},
					"applySuccess/mod.main": {
						"url": "/modules/applySuccess/mod.main.9680a345.js"
					},
					"comment/mod.main": {
						"url": "/modules/comment/mod.main.52458f1e.js"
					},
					"download/js/mod.main": {
						"url": "/download/js/mod.main.0171906f.js"
					},
					"download/js/mod.main.teacher": {
						"url": "/download/js/mod.main.teacher.6e4b8a2f.js"
					},
					"faq/mod.main": {
						"url": "/modules/faq/mod.main.5c1f42c1.js"
					},
					"ckeditor.init/0.0.1/mod.main.ckeditor": {
						"url": "/lego_modules/ckeditor.init/0.0.1/mod.main.ckeditor.js"
					},
					"agencyIndex/mod.main": {
						"url": "/modules/agencyIndex/mod.main.d545ffcd.js"
					},
					"agencyIndex/mod.mainNew": {
						"url": "/modules/agencyIndex/mod.mainNew.0f7b3dd5.js"
					},
					"courseDetail/mod.main.live": {
						"url": "/modules/courseDetail/mod.main.live.f0a33dae.js"
					},
					"courseList/mod.main": {
						"url": "/modules/courseList/mod.main.9dfc671f.js"
					},
					"coursePackage/mod.main": {
						"url": "/modules/coursePackage/mod.main.72b73ae9.js"
					},
					"index/mod.main": {
						"url": "/modules/index/mod.main.f5761570.js"
					},
					"personIndex/mod.main": {
						"url": "/modules/personIndex/mod.main.bef87b3e.js"
					},
					"renzheng/mod.main": {
						"url": "/modules/renzheng/mod.main.c31df7fc.js"
					},
					"searchAgency/mod.main": {
						"url": "/modules/searchAgency/mod.main.6ead4ca7.js"
					},
					"serviceDetail/mod.main": {
						"url": "/modules/serviceDetail/mod.main.b55df5a0.js"
					},
					"storageProxy/mod.main": {
						"url": "/modules/storageProxy/mod.main.d741040a.js"
					},
					"teacher/mod.main": {
						"url": "/modules/teacher/mod.main.8d0edbec.js"
					},
					"topo_index/mod.main": {
						"url": "/modules/topo_index/mod.main.c375c926.js"
					},
					"topo/mod.main": {
						"url": "/modules/topo/mod.main.f843cd90.js"
					},
					"unsubscribeEmail/mod.main": {
						"url": "/modules/unsubscribeEmail/mod.main.ad3dd57d.js"
					},
					"timing/0.0.1/timing": {
						"url": "/lego_modules/timing/0.0.1/timing.bd1b42e9.js"
					},
					"edu-zoom/0.0.1/index": {
						"url": "/lego_modules/edu-zoom/0.0.1/index.67e3c928.js"
					},
					"ckeditor": {
						"url": "/lego_modules/ckeditor/4.5.10/ckeditor.js"
					},
					"ckeditorAdapter/0.0.1/ckeditorAdapter": {
						"url": "/lego_modules/ckeditorAdapter/0.0.1/ckeditorAdapter.5fdec451.js"
					},
					"ckeditor.init/0.0.1/src/addpic": {
						"url": "/lego_modules/ckeditor.init/0.0.1/src/addpic.js"
					},
					"ckeditor.init/0.0.1/src/addvideo": {
						"url": "/lego_modules/ckeditor.init/0.0.1/src/addvideo.js"
					},
					"ckeditor.init/0.0.1/src/addword": {
						"url": "/lego_modules/ckeditor.init/0.0.1/src/addword.js"
					},
					"ckeditor.init/0.0.1/src/addlink": {
						"url": "/lego_modules/ckeditor.init/0.0.1/src/addlink.js"
					},
					"ckeditor.init/0.0.1/src/instruction": {
						"url": "/lego_modules/ckeditor.init/0.0.1/src/instruction.js"
					},
					"edu-pay/0.0.2/fusion_loader.nowrap": {
						"url": "/lego_modules/edu-pay/0.0.2/fusion_loader.nowrap.f3fbff50.js"
					},
					"edu-pay/0.0.2/cashier.nowrap": {
						"url": "/lego_modules/edu-pay/0.0.2/cashier.nowrap.23481b14.js"
					},
					"edu-pay-service/0.0.1/fusion_loader.nowrap": {
						"url": "/lego_modules/edu-pay-service/0.0.1/fusion_loader.nowrap.f3fbff50.js"
					},
					"edu-pay-service/0.0.1/cashier.nowrap": {
						"url": "/lego_modules/edu-pay-service/0.0.1/cashier.nowrap.23481b14.js"
					}
				}
			});

			var metaData = {
					"sys_time": 1482720166,
					"cid": 169959,
					"aid": 31713,
					"price": 0,
					"source": 0,
					"terms": [{
						"endtime": 1637423999,
						"expr_num": 0,
						"term_id": 100198526,
						"introduce": "2017 执业及助理医师在这里带你们执考必过 ",
						"chapter_info ":[{
						"sub_info ": [{
						"endtime": 1482499800,
						"sub_id": 0,
						"name": "运动系统 ",
						"introduce ":"",
						"term_id ":100198526,
						"task_info ": [{
						"endtime": 1482154200,
						"resid_ext": "",
						"status": 3,
						"special_flag": 0,
						"expr_range": 0,
						"resid_list": "",
						"introduce": "",
						"term_id": 100198526,
						"csid": 7768652,
						"aid": 31713,
						"type": 1,
						"restrict_flag": 0,
						"cid": 169959,
						"bgtime": 1482148800,
						"expr_flag": 0,
						"taid": "926454510688231",
						"has_reply": 0,
						"tu_list": [19860344],
						"name": "运动系统1",
						"create_time": 1481886893,
						"te_list": [19860344]
					}, {
						"endtime": 1482327000,
						"resid_ext": "",
						"status": 3,
						"special_flag": 0,
						"expr_range": 0,
						"resid_list": "",
						"introduce": "",
						"term_id": 100198526,
						"csid": 7768652,
						"aid": 31713,
						"type": 1,
						"restrict_flag": 0,
						"cid": 169959,
						"bgtime": 1482321600,
						"expr_flag": 0,
						"taid": "926458805655527",
						"has_reply": 0,
						"tu_list": [19860344],
						"name": "运动系统2",
						"create_time": 1481886962,
						"te_list": [19860344]
					}, {
						"endtime": 1482499800,
						"resid_ext": "",
						"status": 3,
						"special_flag": 0,
						"expr_range": 0,
						"resid_list": "",
						"introduce": "",
						"term_id": 100198526,
						"csid": 7768652,
						"aid": 31713,
						"type": 1,
						"restrict_flag": 0,
						"cid": 169959,
						"bgtime": 1482494400,
						"expr_flag": 0,
						"taid": "926463100622823",
						"has_reply": 0,
						"tu_list": [19860344],
						"name": "运动系统3",
						"create_time": 1481886962,
						"te_list": [19860344]
					}],
					"csid": 7768652,
					"cid": 169959,
					"bgtime": 1482148800
				},
				{
					"endtime": 1483104600,
					"sub_id": 1,
					"name": "运动系统 ",
					"introduce ":"",
					"term_id ":100198526,
					"task_info ": [{
					"endtime": 1482759000,
					"resid_ext": "",
					"status": 1,
					"special_flag": 0,
					"expr_range": 0,
					"resid_list": "",
					"introduce": "",
					"term_id": 100198526,
					"csid": 7790921,
					"aid": 31713,
					"type": 1,
					"restrict_flag": 0,
					"cid": 169959,
					"bgtime": 1482753600,
					"expr_flag": 0,
					"taid": "942539163211751",
					"tu_list": [19860344],
					"name": "运动系统4",
					"create_time": 1482590589,
					"te_list": [19860344]
				}, {
					"endtime": 1482931800,
					"resid_ext": "",
					"status": 1,
					"special_flag": 0,
					"expr_range": 0,
					"resid_list": "",
					"introduce": "",
					"term_id": 100198526,
					"csid": 7790921,
					"aid": 31713,
					"type": 1,
					"restrict_flag": 0,
					"cid": 169959,
					"bgtime": 1482926400,
					"expr_flag": 0,
					"taid": "942543458179047",
					"tu_list": [19860344],
					"name": "运动系统5",
					"create_time": 1482590589,
					"te_list": [19860344]
				}, {
					"endtime": 1483104600,
					"resid_ext": "",
					"status": 1,
					"special_flag": 0,
					"expr_range": 0,
					"resid_list": "",
					"introduce": "",
					"term_id": 100198526,
					"csid": 7790921,
					"aid": 31713,
					"type": 1,
					"restrict_flag": 0,
					"cid": 169959,
					"bgtime": 1483099200,
					"expr_flag": 0,
					"taid": "942547753146343",
					"tu_list": [19860344],
					"name": "运动系统6",
					"create_time": 1482590589,
					"te_list": [19860344]
				}],
			"csid": 7790921,
			"cid": 169959,
			"bgtime": 1482753600
			}],
			"name": "",
			"introduce": "",
			"term_id": 100198526,
			"aid": 31713,
			"type": 1,
			"ch_id": 280474,
			"cid": 169959,
			"ch_no": 0
			}],
			"aid": 31713,
			"sign_max": 0,
			"term_no": 0,
			"pay_status": -
			1,
			"sign_endtime": 1511193599,
			"pub_time": 1479652802,
			"room_url": "tencent://VisitPublicGroup / ?subcmd = VisitPublicGroupEx & amp;param = 7 B22457874506172616D223A7B226170704964223A223231222C22617070506172616D223A227B5C22436F7572736549645C223A3130303139383532367D227D2C2262466F72456475223A312C2267726F757055696E223A3130303139383532362C2276697369746F72223A317D ",
			"tu_list ": [19860344],
			"name" : "2017医考必过班",
			"room_id": 100198526,
			"te_list": [19860344],
			"role_type": 3,
			"transcode_flag": 0,
			"live_room": 0,
			"apply_time": 0,
			"cycle": 0,
			"try_study": 0,
			"reserve_flag": 0,
			"sign_bgtime": 1479652802,
			"discount_infos": [],
			"sponsor": 19860344,
			"room_scale": 0,
			"cid": 169959,
			"remind": 0,
			"bgtime": 1482148800,
			"live_vid": 0,
			"apply_num": 4803,
			"price": 0,
			"source": 0,
			"room_url4c": "",
			"is_small_term": false,
			"is_apply_over": false,
			"is_study_over": false,
			"is_applied": false
			}], "payid": 1, "store_num": 254, "name": "2017昭昭老师执业（ 含助理） 必考点精讲 ",
			"summary ":"在这里， 昭昭老师用图文并茂的方法， 帮助那些基础最差的同学拿证！ ",
			"agency_domain ":"zhaozhao.ke.qq.com ",
			"agency_name ":"昭天下教育 - 医考精品课堂 ",
			"train ":0,
			"cover_url ":" //10.url.cn/qqcourse_logo_ng/ajNVdqHZLLCEU32icG2jVyWh5piaOzjUMFHKibP5SKEicYVf73OyZ3v0SvLwJfaprpQcjqLQck9zJvg/",
			"passcard":0,
			"passcard_price":0,
			"passcard_status":-1,
			"agency_type":1,
			"agency_step_flag":3,
			"files":{},
			"isReplay":0,
			"cur_term_id":100198526,
			"is_vip_course":0,
			"is_user_vip":0,
			"vip_discount":100,
			"complier_delay":2};
			TRecord.cfg.url=TRecord.maps.core.courseDetail;
			TAuto= false;
			window.timingCfg = {
				http2: '7832-74-2',
				http1: '7832-74-3',
				https: '7832-74-4',
				spdy: '7832-74-5'
			};
			require.async(['edu-comb/0.0.1/comb.nowrap', 'edu-base', 'courseDetail/mod.main.live'], function() {

				var
					wrap = require("edu-wrap-https-proxy/0.0.2/index"),
					$ = require("jquery"),
					getHeader = function(e, t) {
						return(e.getResponseHeader(t) || "").toLowerCase()
					};
				$(window).load(function() {
					var

						e = window.timingCfg;
					e && require.async(["timing/0.0.1/timing"], function(t) {
							$.ajax({
								type: "HEAD",
								url: "/ketang_sc.html",
								complete: function(r) {
									var

										n = getHeader(r, "x-client-spdy"),
										o = getHeader(r, "x-client-proto-ver"),
										i = getHeader(r, "x-client-proto"),
										d = "http1";
									~i.indexOf("https") && (d = n ? "spdy" : o && ~o.indexOf("http/2") ? "http2" : "https"), e[d] && t.report(e[d])
								}
							})
						}),
						function() {
							var

								e = document.createElement("script"),
								t = window.location.protocol.split(":")[0];
							e.src = "https" === t ? "https://zz.bdstatic.com/linksubmit/push.js" : "http://push.zhanzhang.baidu.com/push.js";
							var

								r = document.getElementsByTagName("script")[0];
							r.parentNode.insertBefore(e, r)
						}();
					var

						t = require("t-record/0.0.1/t-record");
					t && (window.TRecord = t, window.TAuto && TRecord.report(null, {
						delay: 1e3
					}))
				}), window.top === window && require.async(["edu-zoom/0.0.1/index"]);;
			}, null, function() {

				TRecord.push('page_js_ready');
			});;
			TRecord.push('inline_script_run_time', T[0] + (new Date - TInline));
		</script>  -->
		<!-- <iframe style="display: none;" name="tencent_iframe" id="tencent_iframe"></iframe>
		<span style="display: none; font-size: 14px;">，</span><span style="display:none;font-size:14px;"></span><span style="display:none;font-size:14px;"></span><span style="display:none;font-size:14px;"></span><span style="display: none; font-size: 14px;">！</span><span style="border-radius: 2px; text-indent: 20px; width: auto; padding: 0px 4px 0px 0px; text-align: center; font: bold 11px/20px &quot;Helvetica Neue&quot;,Helvetica,sans-serif; color: rgb(255, 255, 255); background: rgb(189, 8, 28) url(&quot;data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGhlaWdodD0iMzBweCIgd2lkdGg9IjMwcHgiIHZpZXdCb3g9Ii0xIC0xIDMxIDMxIj48Zz48cGF0aCBkPSJNMjkuNDQ5LDE0LjY2MiBDMjkuNDQ5LDIyLjcyMiAyMi44NjgsMjkuMjU2IDE0Ljc1LDI5LjI1NiBDNi42MzIsMjkuMjU2IDAuMDUxLDIyLjcyMiAwLjA1MSwxNC42NjIgQzAuMDUxLDYuNjAxIDYuNjMyLDAuMDY3IDE0Ljc1LDAuMDY3IEMyMi44NjgsMC4wNjcgMjkuNDQ5LDYuNjAxIDI5LjQ0OSwxNC42NjIiIGZpbGw9IiNmZmYiIHN0cm9rZT0iI2ZmZiIgc3Ryb2tlLXdpZHRoPSIxIj48L3BhdGg+PHBhdGggZD0iTTE0LjczMywxLjY4NiBDNy41MTYsMS42ODYgMS42NjUsNy40OTUgMS42NjUsMTQuNjYyIEMxLjY2NSwyMC4xNTkgNS4xMDksMjQuODU0IDkuOTcsMjYuNzQ0IEM5Ljg1NiwyNS43MTggOS43NTMsMjQuMTQzIDEwLjAxNiwyMy4wMjIgQzEwLjI1MywyMi4wMSAxMS41NDgsMTYuNTcyIDExLjU0OCwxNi41NzIgQzExLjU0OCwxNi41NzIgMTEuMTU3LDE1Ljc5NSAxMS4xNTcsMTQuNjQ2IEMxMS4xNTcsMTIuODQyIDEyLjIxMSwxMS40OTUgMTMuNTIyLDExLjQ5NSBDMTQuNjM3LDExLjQ5NSAxNS4xNzUsMTIuMzI2IDE1LjE3NSwxMy4zMjMgQzE1LjE3NSwxNC40MzYgMTQuNDYyLDE2LjEgMTQuMDkzLDE3LjY0MyBDMTMuNzg1LDE4LjkzNSAxNC43NDUsMTkuOTg4IDE2LjAyOCwxOS45ODggQzE4LjM1MSwxOS45ODggMjAuMTM2LDE3LjU1NiAyMC4xMzYsMTQuMDQ2IEMyMC4xMzYsMTAuOTM5IDE3Ljg4OCw4Ljc2NyAxNC42NzgsOC43NjcgQzEwLjk1OSw4Ljc2NyA4Ljc3NywxMS41MzYgOC43NzcsMTQuMzk4IEM4Ljc3NywxNS41MTMgOS4yMSwxNi43MDkgOS43NDksMTcuMzU5IEM5Ljg1NiwxNy40ODggOS44NzIsMTcuNiA5Ljg0LDE3LjczMSBDOS43NDEsMTguMTQxIDkuNTIsMTkuMDIzIDkuNDc3LDE5LjIwMyBDOS40MiwxOS40NCA5LjI4OCwxOS40OTEgOS4wNCwxOS4zNzYgQzcuNDA4LDE4LjYyMiA2LjM4NywxNi4yNTIgNi4zODcsMTQuMzQ5IEM2LjM4NywxMC4yNTYgOS4zODMsNi40OTcgMTUuMDIyLDYuNDk3IEMxOS41NTUsNi40OTcgMjMuMDc4LDkuNzA1IDIzLjA3OCwxMy45OTEgQzIzLjA3OCwxOC40NjMgMjAuMjM5LDIyLjA2MiAxNi4yOTcsMjIuMDYyIEMxNC45NzMsMjIuMDYyIDEzLjcyOCwyMS4zNzkgMTMuMzAyLDIwLjU3MiBDMTMuMzAyLDIwLjU3MiAxMi42NDcsMjMuMDUgMTIuNDg4LDIzLjY1NyBDMTIuMTkzLDI0Ljc4NCAxMS4zOTYsMjYuMTk2IDEwLjg2MywyNy4wNTggQzEyLjA4NiwyNy40MzQgMTMuMzg2LDI3LjYzNyAxNC43MzMsMjcuNjM3IEMyMS45NSwyNy42MzcgMjcuODAxLDIxLjgyOCAyNy44MDEsMTQuNjYyIEMyNy44MDEsNy40OTUgMjEuOTUsMS42ODYgMTQuNzMzLDEuNjg2IiBmaWxsPSIjYmQwODFjIj48L3BhdGg+PC9nPjwvc3ZnPg==&quot;) no-repeat scroll 3px 50% / 14px 14px; position: absolute; opacity: 1; z-index: 8675309; display: none; cursor: pointer; border: medium none;">Save</span>
		<aside class="wrap-side-operation" id="js-side-operation">
			<div class="mod-side-operation">
				<div id="js-jump-container" class="js-jump-container">
					<a href="javascript:void(0)" class="mod-side-operation__jump-to-top" id="js-jump-to-top"><i class="icon-font i-to-top"></i></a>
					<div id="js-jump-plan-container" class="js-jump-plan-container">
						<a href="javascript:void(0)" class="js-jump-plane" id="js-plane"></a>
					</div>
				</div>
				<div class="side-service-item side-service-hover side-service-qq js-c-special">
					<a class="item-link-block" href="http://wpa.b.qq.com/cgi/wpa.php?ln=2&amp;uin=800082734" target="_blank" report-tdw="action=BQQ_clk&amp;module=agencymanage">
						<i class="icon-font i-qq-border item-icon"></i> <span class="item-hover-text">在线客服</span> </a>
				</div>
				<div class="side-service-item side-service-hover side-service-weixin js-c-special">
					<i class="icon-font i-weixin-border item-icon"></i> <span class="item-hover-text">扫码关注</span>
					<div class="item-hover-tips"></div>
				</div>
				
				
			</div>
		</aside> -->
	</body>

</html>