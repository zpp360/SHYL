<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <base href="<%=basePath%>">
        
        <!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
        Remove this if you use the .htaccess -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Exam++</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <link rel="stylesheet" href="shyl/css/bootstrap.css">
        <link href="shyl/css/question/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
        <link href="shyl/css/question/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="shyl/css/question/css/exam.css" rel="stylesheet" type="text/css">
        <link href="shyl/css/question/css/style.css" rel="stylesheet">
        
    </head>
    <body>

        <div class="navbar bs-docs-nav" role="banner">
            <div class="container">
                <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="home"><i class="fa fa-home"></i>主页</a>
                        </li>
                        <li class="active">
                            <a href="start-exam"><i class="fa fa-edit"></i>试题练习</a>
                        </li>
                        <li>
                            <a href="student/usercenter"><i class="fa fa-dashboard"></i>会员中心</a>
                        </li>
                        <li>
                            <a href="student/setting"><i class="fa fa-cogs"></i>个人设置</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>

        <!-- Navigation bar ends -->

        <div class="content" style="margin-bottom: 100px;">

            <div class="container">
                <div class="row">
                    <div class="col-xs-3" style="padding-right: 0px;padding-bottom:15px;">
                        <div class="def-bk" id="bk-exam-control">

                            <div class="def-bk-content" id="exam-control">

                                <div id="question-time" class="question-time-normal">
                                    <div style="height:140px;text-align: center;">
                                        <i id="time-icon" class="fa fa-clock-o"> </i>
                                    </div>

                                    <span style="margin-right:10px;color: #B8B8B8;">已用时</span>
                                    <span id="exam-clock">&nbsp;</span>
                                    <span id="exam-timestamp" style="display:none;">${duration }</span>
                                    <div id="answer-save-info"></div>

                                </div>
                                <div id="question-submit">
                                    <button class="btn-success btn" style="width:100%;">
                                        我要交卷
                                    </button>
                                </div>
                                <div id="exam-info" style="display:none;">
                                    <span id="answer-hashcode"></span>
                                </div>
                            </div>

                        </div>

                    </div>
                    <div class="col-xs-9" style="padding-right: 0px;">
                        <div class="def-bk" id="bk-exampaper">

                            <div class="expand-bk-content" id="bk-conent-exampaper">
                                <div id="exampaper-header">
                                    <div id="exampaper-title">
                                        <i class="fa fa-send"></i>
                                        <span id="exampaper-title-name"> 模拟试卷 </span>
                                        <span style="display:none;" id="exampaper-id">1</span>
                                    </div>
                                    <div id="exampaper-desc-container">
                                        <div id="exampaper-desc" class="exampaper-filter">
                                        
                                        </div>
                                    </div>
                                    
                                </div>
                                <input type="hidden" id="paper-id" value="${examPaperId }">
                                <ul id="exampaper-body">
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

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="copy">
                            <p>
                                Exam++ Copyright © <a href="http://www.examxx.net/" target="_blank">Exam++</a> - <a href="." target="_blank">主页</a> | <a href="http://www.examxx.net/" target="_blank">关于我们</a> | <a href="http://www.examxx.net/" target="_blank">FAQ</a> | <a href="http://www.examxx.net/" target="_blank">联系我们</a>
                            </p>
                        </div>
                    </div>
                </div>

            </div>

        </footer>

        <!-- Slider Ends -->

        <!-- Javascript files -->
        <!-- jQuery -->
        <script type="text/javascript" src="shyl/js/question/jquery/jquery-1.9.0.min.js"></script>
        <!-- Bootstrap JS -->
        <script type="text/javascript" src="shyl/js/question/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="shyl/js/question/all.js?v=0712"></script>
        <script type="text/javascript" src="shyl/js/question/paper-examing.js"></script>

        

    </body>
</html>
