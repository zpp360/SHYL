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
<jsp:include page="../common/header.jsp"></jsp:include>
<title>后端开发_后端开发视频教程_web开发_慕课网课程</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="renderer" content="webkit">
<meta property="qc:admins" content="77103107776157736375">
<meta property="wb:webmaster" content="c4f857219bfae3cb">
<meta http-equiv="Access-Control-Allow-Origin" content="*">
<meta http-equiv="Cache-Control" content="no-transform ">
<meta name="Keywords" content="">
<meta name="Description"
	content="慕课网后端开发精品课程,为您提供专业的PHP、Java、linux、Python等实战开发教程,从基础入门到实战精通,课程全面、制作精良、讲解通俗易懂">
<link rel="stylesheet"
	href="/static/moco/v1.0/dist/css/moco.min.css?t=201612230231"
	type="text/css">
<link rel="stylesheet" href="css.css" type="text/css">
<link rel="stylesheet"
	href="http://static.mukewang.com/static/css/??base.css,common/common-less.css?t=4,course/course_list-v2-less.css?v=201612230231"
	type="text/css">
	<link href="shyl/css/course/course1.css" rel="stylesheet" type="text/css">
</head>
<body id="List_courseId">
	<div id="header"></div>
	<div id="main">

		<div class="wrap ">
			<div class="top">
				<div class="course-content">
					<div class="course-nav-box">
						<div class="course-nav-row clearfix">
							<span class="hd l">方向：</span>
							<div class="bd">
								<ul class="">
									<li class="course-nav-item "><a href="">全部</a>
									</li>
									<li
										class="course-nav-item
                                    ">
										<a href="" data-ct="fe">前端开发</a>
									</li>
									<li
										class="course-nav-item
                                     on">
										<a href="" data-ct="be">后端开发</a>
									</li>
									<li
										class="course-nav-item
                                    ">
										<a href="" data-ct="mobile">移动开发</a>
									</li>
									<li
										class="course-nav-item
                                    ">
										<a href="" data-ct="data">数据库</a>
									</li>
									<li
										class="course-nav-item
                                    ">
										<a href="" data-ct="cb">云计算&amp;大数据</a>
									</li>
									<li
										class="course-nav-item
                                    ">
										<a href="" data-ct="op">运维&amp;测试</a>
									</li>
									<li
										class="course-nav-item
                                    ">
										<a href="" data-ct="photo">视觉设计</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="course-nav-row clearfix">
							<span class="hd l">分类：</span>
							<div class="bd">
								<ul class="">
									<li class="course-nav-item on"><a href="">全部</a>
									</li>

									<li class="course-nav-item "><a href=""
										data-id="1" data-ct="be">PHP</a></li>



									<li class="course-nav-item "><a href=""
										data-id="220" data-ct="be">Java</a></li>



									<li class="course-nav-item "><a
										href="" data-id="1118" data-ct="be">Python</a>
									</li>



									<li class="course-nav-item "><a href=""
										data-id="1273" data-ct="be">C</a></li>



									<li class="course-nav-item "><a
										href="" data-id="1331" data-ct="be">C++</a>
									</li>



									<li class="course-nav-item "><a href=""
										data-id="1358" data-ct="be">Go</a></li>



									<li class="course-nav-item "><a href=""
										data-id="1362" data-ct="be">C#</a></li>



									<li class="course-nav-item "><a href=""
										data-id="3629" data-ct="be">Ruby</a></li>


								</ul>
							</div>
						</div>
						<div class="course-nav-row clearfix border_bottom_none">
							<span class="hd l">类型：</span>
							<div class="bd">
								<ul class="">

									<li class="course-nav-item on"><a href="">全部</a>
									</li>
									<li class="course-nav-item "><a
										href="">基础</a></li>
									<li class="course-nav-item "><a
										href="">案例</a></li>
									<li class="course-nav-item "><a
										href="">框架</a></li>
									<li class="course-nav-item "><a
										href="">工具</a></li>
									<li class="course-nav-item "><a
										href="">设计模式</a></li>

								</ul>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

		<div class="container">
			<div class="course-tool-bar clearfix">
				<div class="tool-left l">
					<a href="" class="sort-item">最新</a>
					<a href="" class="sort-item active">最热</a>
				</div>
				<div class="l">
					<span class="tool-item" style="display: none;"> <a
						class="follow-learn tool-chk" href="javascript:void(0);">跟我学</a>
					</span>
				</div>
				<div class="tool-right r">

					<span class="tool-item total-num"> 共<b>192</b>个课程
					</span> <span class="tool-item tool-pager"> <span class="pager-num">
							<b class="pager-cur">1</b>/<em class="pager-total">8</em>
					</span> <a href="javascript:void(0)"
						class="pager-action pager-prev  disabled"><i
							class="icon-left2"></i></a> <a href=""
						class="pager-action pager-next"><i class="icon-right2"></i></a>
					</span>
				</div>
			</div>
			<div class="course-list">
				<div class="moco-course-list">
					<ul class="clearfix">





						<div class="moco-course-wrap">
							<div class="moco-course-box" style="height: 364px">

								<div class="moco-course-box-fisrtLi pr">
									<a
										onclick="_hmt.push(['_trackEvent', '课程列表页', 'click', '列表实战推荐'])"
										href="" target="_blank">
										<div class="imgmask"></div> <img
										src="http://szimg.mukewang.com/5859ed790001b9da05400300-360-202.jpg"
										height="172" width="100%">
										<div class="innerBox pa">
											强力django+杀手级xadmin 打造上线标准的在线教育平台 <br> <span
												class="span_price">￥369.00</span>
										</div>
									</a>
								</div>

								<a
									onclick="_hmt.push(['_trackEvent', '课程列表页', 'click', '列表实战推荐'])"
									href="" target="_blank">
									<div class="moco-course-box-li ">
										<p title="从入门带你搞定Android自动化测试工具 框架 脚本">从入门带你搞定Android自动化测试工具
											框架 脚本</p>
										<span class="span_price">￥179.00</span>
									</div>
								</a> <a
									onclick="_hmt.push(['_trackEvent', '课程列表页', 'click', '列表实战推荐'])"
									href="" target="_blank">
									<div class="moco-course-box-li ">
										<p title="算法与数据结构C++精解">算法与数据结构C++精解</p>
										<span class="span_price">￥148.00</span>
									</div>
								</a> <a
									onclick="_hmt.push(['_trackEvent', '课程列表页', 'click', '列表实战推荐'])"
									href="" target="_blank">
									<div class="moco-course-box-li border_bottom_none">
										<p title="Android网络层架构设计   案例实战  okhttp3">Android网络层架构设计
											案例实战 okhttp3</p>
										<span class="span_price">￥188.00</span>
									</div>
								</a>
							</div>

						</div>






						<div class="moco-course-wrap">


							<a
								onclick="_hmt.push(['_trackEvent', '课程列表页', 'click', '列表首行数据'])"
								href="" target="_self">
								<div class="moco-course-box">
									<img alt="Java入门第一季"
										src="http://img.mukewang.com/57035ff200014b8a06000338-240-135.jpg"
										height="124" width="100%">
									<div class="moco-course-intro">
										<h3>
											<i>初</i> Java入门第一季
										</h3>
										<p>从环境搭建、基础语法开始，带你入门</p>
									</div>
									<div class="moco-course-bottom">
										<span class="l"> 550704人在学</span>
									</div>
								</div>
							</a>
						</div>






						<div class="moco-course-wrap">


							<a
								onclick="_hmt.push(['_trackEvent', '课程列表页', 'click', '列表首行数据'])"
								href="" target="_self">
								<div class="moco-course-box">
									<img alt="C语言入门"
										src="http://img.mukewang.com/574669dc0001993606000338-240-135.jpg"
										height="124" width="100%">
									<div class="moco-course-intro">
										<h3>
											<i>初</i> C语言入门
										</h3>
										<p>进入编程世界的必修课-C语言</p>
									</div>
									<div class="moco-course-bottom">
										<span class="l"> 376159人在学</span>
									</div>
								</div>
							</a>
						</div>






						<div class="moco-course-wrap">


							<a
								onclick="_hmt.push(['_trackEvent', '课程列表页', 'click', '列表首行数据'])"
								href="" target="_self">
								<div class="moco-course-box">
									<img alt="Java入门第二季"
										src="http://img.mukewang.com/570360620001390f06000338-240-135.jpg"
										height="124" width="100%">
									<div class="moco-course-intro">
										<h3>
											<i>初</i> Java入门第二季
										</h3>
										<p>Java 面向对象编程基本实现原理</p>
									</div>
									<div class="moco-course-bottom">
										<span class="l"> 267999人在学</span>
									</div>
								</div>
							</a>
						</div>






						<div class="moco-course-wrap">


							<a
								onclick="_hmt.push(['_trackEvent', '课程列表页', 'click', '列表首行数据'])"
								href="" target="_self">
								<div class="moco-course-box">
									<img alt="PHP入门篇"
										src="http://img.mukewang.com/53daee770001dd0706000338-240-135.jpg"
										height="124" width="100%">
									<div class="moco-course-intro">
										<h3>
											<i>初</i> PHP入门篇
										</h3>
										<p>3小时轻松帮您快速掌握PHP语言基础知识，为后续PHP进级课程学习打下基础。</p>
									</div>
									<div class="moco-course-bottom">
										<span class="l"> 265602人在学</span>
									</div>
								</div>
							</a>
						</div>






						<div class="moco-course-wrap">


							<a href="" target="_self">
								<div class="moco-course-box">
									<img alt="Python入门"
										src="http://img.mukewang.com/540e57300001d6d906000338-240-135.jpg"
										height="124" width="100%">
									<div class="moco-course-intro">
										<h3>
											<i>初</i> Python入门
										</h3>
										<p>未来您要会的优雅、明确、简单语言</p>
									</div>
									<div class="moco-course-bottom">
										<span class="l"> 220134人在学</span>
									</div>
								</div>
							</a>
						</div>






						<div class="moco-course-wrap">


							<a href="" target="_self">
								<div class="moco-course-box">
									<img alt="Java入门第三季"
										src="http://img.mukewang.com/5703604a0001694406000338-240-135.jpg"
										height="124" width="100%">
									<div class="moco-course-intro">
										<h3>
											<i>初</i> Java入门第三季
										</h3>
										<p>Java中你必须懂得常用技能</p>
									</div>
									<div class="moco-course-bottom">
										<span class="l"> 209520人在学</span>
									</div>
								</div>
							</a>
						</div>






						<div class="moco-course-wrap">


							<a href="" target="_self">
								<div class="moco-course-box">
									<img alt="C++远征之起航篇"
										src="http://img.mukewang.com/5707604300018d0406000338-240-135.jpg"
										height="124" width="100%">
									<div class="moco-course-intro">
										<h3>
											<i>初</i> C++远征之起航篇
										</h3>
										<p>C++亮点尽在其中</p>
									</div>
									<div class="moco-course-bottom">
										<span class="l"> 137285人在学</span>
									</div>
								</div>
							</a>
						</div>






						<div class="moco-course-wrap">


							<a href="" target="_self">
								<div class="moco-course-box">
									<img alt="JAVA遇见HTML——JSP篇"
										src="http://img.mukewang.com/576b7afb00019e4906000338-240-135.jpg"
										height="124" width="100%">
									<div class="moco-course-intro">
										<h3>
											<i>初</i> JAVA遇见HTML——JSP篇
										</h3>
										<p>带你轻松的学习JSP基础知识!</p>
									</div>
									<div class="moco-course-bottom">
										<span class="l"> 119351人在学</span>
									</div>
								</div>
							</a>
						</div>





						<div class="moco-course-wrap">
							<div class="moco-course-box">
								<dl class="learn-path">
									<dt>路径推荐</dt>
									<dd>
										<a
											onclick="_hmt.push(['_trackEvent', '课程列表页', 'click', '列表路径推荐'])"
											href=""
											title="零基础入门Android语法与界面">零基础入门Android语法与界面</a>
									</dd>
									<dd>
										<a
											onclick="_hmt.push(['_trackEvent', '课程列表页', 'click', '列表路径推荐'])"
											href="" title="SSH框架探幽">SSH框架探幽</a>
									</dd>
									<dd>
										<a
											onclick="_hmt.push(['_trackEvent', '课程列表页', 'click', '列表路径推荐'])"
											href="" title="搞定Java SSM框架开发">搞定Java
											SSM框架开发</a>
									</dd>
									<dd>
										<a
											onclick="_hmt.push(['_trackEvent', '课程列表页', 'click', '列表路径推荐'])"
											href="" title="探索Python世界">探索Python世界</a>
									</dd>
								</dl>
							</div>
						</div>

						<div class="moco-course-wrap">


							<a href="" target="_self">
								<div class="moco-course-box">
									<img alt="PHP进阶篇"
										src="http://img.mukewang.com/572b06470001a42e06000338-240-135.jpg"
										height="124" width="100%">
									<div class="moco-course-intro">
										<h3>
											<i>中</i> PHP进阶篇
										</h3>
										<p>轻松学习PHP中级课程，进行全面了解</p>
									</div>
									<div class="moco-course-bottom">
										<span class="l"> 110646人在学</span>
									</div>
								</div>
							</a>
						</div>






						<div class="moco-course-wrap">


							<a href="" target="_self">
								<div class="moco-course-box">
									<img alt="Linux C语言编程基本原理与实践"
										src="http://img.mukewang.com/570762760001a1db06000338-240-135.jpg"
										height="124" width="100%">
									<div class="moco-course-intro">
										<h3>
											<i>中</i> Linux C语言编程基本原理与实践
										</h3>
										<p>C—最强编程语言的编程本质。</p>
									</div>
									<div class="moco-course-bottom">
										<span class="l"> 108709人在学</span>
									</div>
								</div>
							</a>
						</div>






						<div class="moco-course-wrap">


							<a href="" target="_self">
								<div class="moco-course-box">
									<img alt="Spring入门篇"
										src="http://img.mukewang.com/5704d2a90001bb1b06000338-240-135.jpg"
										height="124" width="100%">
									<div class="moco-course-intro">
										<h3>
											<i>高</i> Spring入门篇
										</h3>
										<p>为您带来IOC和AOP的基本概念及用法！</p>
									</div>
									<div class="moco-course-bottom">
										<span class="l"> 106547人在学</span>
									</div>
								</div>
							</a>
						</div>






						<div class="moco-course-wrap">


							<a href="" target="_self">
								<div class="moco-course-box">
									<img alt="python进阶"
										src="http://img.mukewang.com/5705b7350001d59b06000338-240-135.jpg"
										height="124" width="100%">
									<div class="moco-course-intro">
										<h3>
											<i>中</i> python进阶
										</h3>
										<p>学习函数式、模块和面向对象编程</p>
									</div>
									<div class="moco-course-bottom">
										<span class="l"> 97613人在学</span>
									</div>
								</div>
							</a>
						</div>






						<div class="moco-course-wrap">


							<a href="" target="_self">
								<div class="moco-course-box">
									<img alt="深入浅出Java多线程"
										src="http://img.mukewang.com/5704a9550001f74606000338-240-135.jpg"
										height="124" width="100%">
									<div class="moco-course-intro">
										<h3>
											<i>中</i> 深入浅出Java多线程
										</h3>
										<p>带你一起深入浅出多线程！</p>
									</div>
									<div class="moco-course-bottom">
										<span class="l"> 95891人在学</span>
									</div>
								</div>
							</a>
						</div>






						<div class="moco-course-wrap">


							<a href="" target="_self">
								<div class="moco-course-box">
									<img alt="Spring MVC起步"
										src="http://img.mukewang.com/570765d90001bf1406000338-240-135.jpg"
										height="124" width="100%">
									<div class="moco-course-intro">
										<h3>
											<i>高</i> Spring MVC起步
										</h3>
										<p>快来看最简单易用的MVC框架</p>
									</div>
									<div class="moco-course-bottom">
										<span class="l"> 90269人在学</span>
									</div>
								</div>
							</a>
						</div>






						<div class="moco-course-wrap">


							<a href="" target="_self">
								<div class="moco-course-box">
									<img alt="初识Java微信公众号开发"
										src="http://img.mukewang.com/576b7b2000010bc706000338-240-135.jpg"
										height="124" width="100%">
									<div class="moco-course-intro">
										<h3>
											<i>中</i> 初识Java微信公众号开发
										</h3>
										<p>Java微信公众号开发的入门课程！</p>
									</div>
									<div class="moco-course-bottom">
										<span class="l"> 86434人在学</span>
									</div>
								</div>
							</a>
						</div>






						<div class="moco-course-wrap">


							<a href="" target="_self">
								<div class="moco-course-box">
									<img alt="版本管理工具介绍—Git篇"
										src="http://img.mukewang.com/5774d9c40001841306000338-240-135.jpg"
										height="124" width="100%">
									<div class="moco-course-intro">
										<h3>
											<i>初</i> 版本管理工具介绍—Git篇
										</h3>
										<p>想成为英雄么？来学习Git吧！</p>
									</div>
									<div class="moco-course-bottom">
										<span class="l"> 84599人在学</span>
									</div>
								</div>
							</a>
						</div>






						<div class="moco-course-wrap">


							<a href="" target="_self">
								<div class="moco-course-box">
									<img alt="JAVA遇见HTML——Servlet篇"
										src="http://img.mukewang.com/579192b500019e4106000338-240-135.jpg"
										height="124" width="100%">
									<div class="moco-course-intro">
										<h3>
											<i>初</i> JAVA遇见HTML——Servlet篇
										</h3>
										<p>JAVA Web开发的核心!</p>
									</div>
									<div class="moco-course-bottom">
										<span class="l"> 82440人在学</span>
									</div>
								</div>
							</a>
						</div>






						<div class="moco-course-wrap">


							<a href="" target="_self">
								<div class="moco-course-box">
									<img alt="手把手教你实现电商网站后台开发"
										src="http://img.mukewang.com/53c4bf6d00015b0106000338-240-135.jpg"
										height="124" width="100%">
									<div class="moco-course-intro">
										<h3>
											<i>中</i> 手把手教你实现电商网站后台开发
										</h3>
										<p>手把手教你用PHP搭建电子商务平台！</p>
									</div>
									<div class="moco-course-bottom">
										<span class="l"> 81003人在学</span>
									</div>
								</div>
							</a>
						</div>






						<div class="moco-course-wrap">


							<a href="" target="_self">
								<div class="moco-course-box">
									<img alt="文件传输基础——Java IO流"
										src="http://img.mukewang.com/5774d7840001a30e06000338-240-135.jpg"
										height="124" width="100%">
									<div class="moco-course-intro">
										<h3>
											<i>中</i> 文件传输基础——Java IO流
										</h3>
										<p>通过大量的案例为您介绍IO流的使用。</p>
									</div>
									<div class="moco-course-bottom">
										<span class="l"> 79182人在学</span>
									</div>
								</div>
							</a>
						</div>






						<div class="moco-course-wrap">


							<a href="" target="_self">
								<div class="moco-course-box">
									<img alt="反射——Java高级开发必须懂的"
										src="http://img.mukewang.com/5774d7e00001eb9206000338-240-135.jpg"
										height="124" width="100%">
									<div class="moco-course-intro">
										<h3>
											<i>中</i> 反射——Java高级开发必须懂的
										</h3>
										<p>反射,Java高级开发必须要懂的知识点</p>
									</div>
									<div class="moco-course-bottom">
										<span class="l"> 78840人在学</span>
									</div>
								</div>
							</a>
						</div>






						<div class="moco-course-wrap">


							<a href="" target="_self">
								<div class="moco-course-box">
									<img alt="C#开发轻松入门"
										src="http://img.mukewang.com/57035f2c000106fa06000338-240-135.jpg"
										height="124" width="100%">
									<div class="moco-course-intro">
										<h3>
											<i>初</i> C#开发轻松入门
										</h3>
										<p>.NET开发轻松入门</p>
									</div>
									<div class="moco-course-bottom">
										<span class="l"> 95031人在学</span>
									</div>
								</div>
							</a>
						</div>
						<div class="moco-course-wrap">


							<a href="" target="_self">
								<div class="moco-course-box">
									<img alt="Python开发简单爬虫"
										src="http://img.mukewang.com/57466ffc00015e2f06000338-240-135.jpg"
										height="124" width="100%">
									<div class="moco-course-intro">
										<h3>
											<i>高</i> Python开发简单爬虫
										</h3>
										<p>带您解开爬虫这门神奇技术的面纱</p>
									</div>
									<div class="moco-course-bottom">
										<span class="l"> 80385人在学</span>
									</div>
								</div>
							</a>
						</div>

					</ul>
				</div>
				<div class="page">
					<span class="disabled_page">首页</span><span class="disabled_page">上一页</span><a
						href="javascript:void(0)" class="active text-page-tag">1</a><a
						class="text-page-tag" href="">2</a><a
						class="text-page-tag" href="">3</a><a
						class="text-page-tag" href="">4</a><a
						class="text-page-tag" href="">5</a><a
						class="text-page-tag" href="">6</a><a
						class="text-page-tag" href="">7</a><a
						href="">下一页</a><a
						href="">尾页</a>
				</div>
			</div>

		</div>

	</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>