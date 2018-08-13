<%@page import="com.itextpdf.text.pdf.PdfAcroForm"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
    String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN" class="ua-www">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>职业能力测试_济南市服务外包公共服务平台</title>
<jsp:include page="../common/header.jsp"><jsp:param name="id" value="cp" /></jsp:include>
<link href="shyl/css/question/css/style.css" rel="stylesheet">
<link href="shyl/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="shyl/css/bootstrap.css">
<link href="shyl/css/question/bootstrap/css/bootstrap-huan1.css"
	rel="stylesheet">
<link href="shyl/css/question/css/exam1.css" rel="stylesheet"
	type="text/css">

<style type="text/css">
a:hover {
   color:#2e2e2e;
   text-decoration: none;
}
</style>
</head>
<body class="nlcp-bg" onLoad="goPageAbility(1,2);">
	<div class="nlcp" style="margin-top: 90px;">
		<input type="hidden" value="<%=basePath%>" id="methodurl"> <input
			type="hidden" value="${pd.id}" id="hist-id"> <input
			type="hidden" value="${pd.id}" id="paper-id"> <input
			type="hidden" value="${platUser.USER_ID}" id="loginstatus"> <input
			type="hidden" value="${platUser.USER_TYPE}" id="user_type"> <input
			type="hidden" value="50" id="hashLen">
			<input type="hidden" value="${pd.field_id}" id="field_id">
		<div class="nlcp-tit"></div>
		<div class="nlcp-nr">
			<div class="nlcp-st">
				<div style="height: 600px;">
					<form id="form1" name="form1" method="post" action="">
						<div class="cpst" id="questionIndex_1">
							<p>
								<b>1.&nbsp;&nbsp;&nbsp;两个女孩从同一点，往相反方向出发，各行4米后左转，再各行3米，此时，两人之间的最短距离为多少：</b>
							</p>
							<p>
								<label style="width:100%;padding-top:15px;padding-bottom:10px"> <input type="radio" name="question-radio1"
									value="0" /> <span style="width: 700px; color: black;">
										A:6米</span>
								</label><br> <label style="width:100%;padding-top:15px;padding-bottom:10px"> <input type="radio" name="question-radio1"
									value="0" /> <span style="width: 700px; color: black;">
										B:8米</span>
								</label> <br><label style="width:100%;padding-top:15px;padding-bottom:10px"> <input type="radio" name="question-radio1"
									value="1" /> <span style="width: 700px; color: black;">
										C:10米</span>
								</label><br> <label style="width:100%;padding-top:15px;padding-bottom:10px"> <input type="radio" name="question-radio1"
									value="0" /> <span style="width: 700px; color: black;">
										D:12米</span>
								</label><br> <label style="width:100%;padding-top:15px;"> <input type="radio" name="question-radio1"
									value="0" /> <span style="width: 700px; color: black;">E:14米</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
                         <div class="cpst" id="questionIndex_2">
							<p>
								<b>2.&nbsp;&nbsp;&nbsp;一个打字员两分钟内可以打完两页纸，那么如果要在六分钟内打完18页纸，则需要几名打字员：</b>
							</p>
							<p>
								<label style="width:100%; padding-top:15px;padding-bottom:10px"> <input type="radio" name="question-radio2"
									value="1" /> <span style="width: 700px; color: black;">
										A:3</span>
								</label> <label style="width:100% ; padding-top:15px;padding-bottom:10px"> <input type="radio" name="question-radio2"
									value="0" /> <span style="width: 700px; color: black;">
										B:4</span>
								</label> <label style="width:100% ; padding-top:15px;padding-bottom:10px"> <input type="radio" name="question-radio2"
									value="0" /> <span style="width: 700px; color: black;">
										C:5</span>
								</label> <label style="width:100% ; padding-top:15px;padding-bottom:10px"> <input type="radio" name="question-radio2"
									value="0" /> <span style="width: 700px; color: black;">
										D:6</span>
								</label> <label style="width:100% ; padding-top:15px;"> <input type="radio" name="question-radio2"
									value="0" /> <span style="width: 700px; color: black;">E:8</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_3">
							<p>
								<b>3.&nbsp;&nbsp;&nbsp;从1至100中，共包含多少个7:</b>
							</p>
							<p>
								<label style="width:100%;padding-top:15px;padding-bottom:10px"> <input type="radio" name="question-radio3"
									value="1" /> <span style="width: 700px; color: black;">
										A:20</span>
								</label> <label style="width:100% ;padding-top:15px;padding-bottom:10px"> <input type="radio" name="question-radio3"
									value="0" /> <span style="width: 700px; color: black;">
										B:25</span>
								</label> <label style="width:100% ;padding-top:15px;padding-bottom:10px"> <input type="radio" name="question-radio3"
									value="0" /> <span style="width: 700px; color: black;">
										C:30</span>
								</label> <label style="width:100% ;padding-top:15px;padding-bottom:10px"> <input type="radio" name="question-radio3"
									value="0" /> <span style="width: 700px; color: black;">
										D:32</span>
								</label> <label style="width:100% ;padding-top:15px;"> <input type="radio" name="question-radio3"
									value="0" /> <span style="width: 700px; color: black;">E:34</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_4">
							<p>
								<b>4.&nbsp;&nbsp;&nbsp;全班学生排成一行，从左数和从右数小明都是第15名，问全班共有学生多少人:</b>
							</p>
							<p>
								<label style="width:100% ;padding-top:15px;padding-bottom:10px"> <input type="radio" name="question-radio4"
									value="0" /> <span style="width: 700px; color: black;">
										A:15</span>
								</label> <label style="width:100% ;padding-top:15px;padding-bottom:10px"> <input type="radio" name="question-radio4"
									value="0" /> <span style="width: 700px; color: black;">
										B:25</span>
								</label> <label style="width:100% ;padding-top:15px;padding-bottom:10px"> <input type="radio" name="question-radio4"
									value="1" /> <span style="width: 700px; color: black;">
										C:29</span>
								</label> <label style="width:100% ;padding-top:15px;padding-bottom:10px"> <input type="radio" name="question-radio4"
									value="0" /> <span style="width: 700px; color: black;">
										D:30</span>
								</label> <label style="width:100% ;padding-top:15px"> <input type="radio" name="question-radio4"
									value="0" /> <span style="width: 700px; color: black;">E:31</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_5">
							<p>
								<b>5.&nbsp;&nbsp;&nbsp;某市的房产税率为8%。如果一套一居室从20000元升值至24000元，那么房产税要增加多少？</b>
							</p>
							<p>
								<label style="width:100% ;padding-top:15px;padding-bottom:10px"> <input type="radio" name="question-radio5"
									value="0" /> <span style="width: 700px; color: black;">
										A:32</span>
								</label> <label style="width:100% ;padding-top:15px;padding-bottom:10px"> <input type="radio" name="question-radio5"
									value="0" /> <span style="width: 700px; color: black;">
										B:50</span>
								</label> <label style="width:100% ;padding-top:15px;padding-bottom:10px"> <input type="radio" name="question-radio5"
									value="0" /> <span style="width: 700px; color: black;">
										C:120</span>
								</label> <label style="width:100% ;padding-top:15px;padding-bottom:10px"> <input type="radio" name="question-radio5"
									value="1" /> <span style="width: 700px; color: black;">
										D:320</span>
								</label> <label style="width:100% ;padding-top:15px"> <input type="radio" name="question-radio5"
									value="0" /> <span style="width: 700px; color: black;">E:400</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_6">
							<p>
								<b>6.&nbsp;&nbsp;&nbsp;某公司去年进口了150万吨钢材，比前年的2倍少25万吨，问该公司两年共进口了多少万吨钢材？</b>
							</p>
							<p>
								<label style="width:100% ;padding-top:15px;padding-bottom:10px"> <input type="radio" name="question-radio6"
									value="1" /> <span style="width: 700px; color: black;">
										A:237.5</span>
								</label> <label style="width:100% ;padding-top:15px;padding-bottom:10px"> <input type="radio" name="question-radio6"
									value="0" /> <span style="width: 700px; color: black;">
										B:250.5</span>
								</label> <label style="width:100%;padding-top:15px;padding-bottom:10px"> <input type="radio" name="question-radio6"
									value="0" /> <span style="width: 700px; color: black;">
										C:275.5 </span>
								</label> <label style="width:100% ;padding-top:15px;padding-bottom:10px"> <input type="radio" name="question-radio6"
									value="0" /> <span style="width: 700px; color: black;">
										D:300.5</span>
								</label> <label style="width:100%;padding-top:15px;"> <input type="radio" name="question-radio6"
									value="0" /> <span style="width: 700px; color: black;">E:325.5 </span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_7">
							<p>
								<b>7.&nbsp;&nbsp;&nbsp;一公司1992年月均亏损10000元，而在1993年头一季度则月均赢利4000元，问为使这两年的收支平衡，在1993年后三季度中月均需赢利多少钱？</b>
							</p>
							<p>
								<label style="width:100%;padding-top:12px;padding-bottom:10px"> <input type="radio" name="question-radio7"
									value="0" /> <span style="width: 700px; color: black;">
										A:9000</span>
								</label> <label style="width:100%;padding-top:12px;padding-bottom:10px"> <input type="radio" name="question-radio7"
									value="1" /> <span style="width: 700px; color: black;">
										B:12000</span>
								</label> <label style="width:100%;padding-top:12px;padding-bottom:10px"> <input type="radio" name="question-radio7"
									value="0" /> <span style="width: 700px; color: black;">
										C:16500 </span>
								</label> <label style="width:100%;padding-top:12px;padding-bottom:10px"> <input type="radio" name="question-radio7"
									value="0" /> <span style="width: 700px; color: black;">
										D:14500</span>
								</label> <label style="width:100%;padding-top:10px;"> <input type="radio" name="question-radio7"
									value="0" /> <span style="width: 700px; color: black;">E:15000</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_8" style="margin-bottom: 10px;">
							<p>
								<b>8.&nbsp;&nbsp;&nbsp;一电信公司在周一到周五的晚上八点到早上八点以及周六、周日全天，实行长途通话的半价收费，问一周内有几个小时长话是半价收费？</b>
							</p>
							<p>
								<label style="width:100% ;padding-top:12px;padding-bottom:10px"> <input type="radio" name="question-radio8"
									value="0" /> <span style="width: 700px; color: black;">
										A:100</span>
								</label> <label style="width:100% ;padding-top:12px;padding-bottom:10px"> <input type="radio" name="question-radio8"
									value="0" /> <span style="width: 700px; color: black;">
										B:96</span>
								</label> <label style="width:100%;padding-top:12px;padding-bottom:10px"> <input type="radio" name="question-radio8"
									value="0" /> <span style="width: 700px; color: black;">
										C:92 </span>
								</label> <label style="width:100%;padding-top:12px;padding-bottom:10px"> <input type="radio" name="question-radio8"
									value="1" /> <span style="width: 700px; color: black;">
										D:108</span>
								</label> <label style="width:100%;padding-top:10px;"> <input type="radio" name="question-radio8"
									value="0" /> <span style="width: 700px; color: black;">E:112</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_9" style="margin-bottom: 10px;">
							<p>
								<b>9.&nbsp;&nbsp;&nbsp;一投资者以每股75元的价格买了一公司的股票n股，此后，他以每股120元的价格卖掉了60%，剩下的在随后一天又以每股70元的低价卖出。如果他从这次股票炒作中获得7500元的利润，那么他买了多少股，即n等于多少？</b>
							</p>
							<p>
								<label style="width:100% ;padding-top:12px;padding-bottom:10px"> <input type="radio" name="question-radio9"
									value="0" /> <span style="width: 700px; color: black;">
										A:250</span>
								</label> <label style="width:100%;padding-top:12px;padding-bottom:10px"> <input type="radio" name="question-radio9"
									value="1" /> <span style="width: 700px; color: black;">
										B:300</span>
								</label> <label style="width:100%;padding-top:12px;padding-bottom:10px"> <input type="radio" name="question-radio9"
									value="0" /> <span style="width: 700px; color: black;">
										C:350 </span>
								</label> <label style="width:100%;padding-top:12px;padding-bottom:10px"> <input type="radio" name="question-radio9"
									value="0" /> <span style="width: 700px; color: black;">
										D:400</span>
								</label> <label style="width:100%;padding-top:10px;"> <input type="radio" name="question-radio9"
									value="0" /> <span style="width: 700px; color: black;">E:500</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_10">
							<p>
								<b>10.&nbsp;&nbsp;&nbsp;一个厂里有3400个有选择权的员工，在这次选举中有40%的员工参加了投票。如果老李得了408张选票，那么对他的支持率是多少？</b>
							</p>
							<p>
								<label style="width:100%;padding-top:12px;padding-bottom:10px"> <input type="radio" name="question-radio10"
									value="0" /> <span style="width: 700px; color: black;">
										A:12%</span>
								</label> <label style="width:100%;padding-top:12px;padding-bottom:10px"> <input type="radio" name="question-radio10"
									value="0" /> <span style="width: 700px; color: black;">
										B:15%</span>
								</label> <label style="width:100%;padding-top:12px;padding-bottom:10px"> <input type="radio" name="question-radio10"
									value="0" /> <span style="width: 700px; color: black;">
										C:18% </span>
								</label> <label style="width:100%;padding-top:12px;padding-bottom:10px"> <input type="radio" name="question-radio10"
									value="0" /> <span style="width: 700px; color: black;">
										D:25%</span>
								</label> <label style="width:100%;padding-top:10px;"> <input type="radio" name="question-radio10"
									value="1" /> <span style="width: 700px; color: black;">E:30%</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_11">
							<p>
								<b>11.&nbsp;&nbsp;&nbsp;找出以下这组图形中不同于其它的那一个。</b>
								<br>
								<img alt="" src="shyl/images/evaluation/problemImg/11.jpg">
							</p>
							<p>
								<label style="width:100%"> <input type="radio" name="question-radio11"
									value="0" /> <span style="width: 700px; color: black;">
										A:图形A</span>
								</label> <label style="width:100%"> <input type="radio" name="question-radio11"
									value="0" /> <span style="width: 700px; color: black;">
										B:图形B</span>
								</label> <label style="width:100%"> <input type="radio" name="question-radio11"
									value="1" /> <span style="width: 700px; color: black;">
										C:图形C </span>
								</label> <label style="width:100%"> <input type="radio" name="question-radio11"
									value="0" /> <span style="width: 700px; color: black;">
										D:图形D</span>
								</label> <label style="width:100%"> <input type="radio" name="question-radio11"
									value="0" /> <span style="width: 700px; color: black;">E:没有答案</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_12">
							<p>
								<b>12.&nbsp;&nbsp;&nbsp;找出以下这组图形中不同于其它的那一个。</b>
								<br>
								<img alt="" src="shyl/images/evaluation/problemImg/12.jpg">
							</p>
							<p>
								<label> <input type="radio" name="question-radio12"
									value="0" /> <span style="width: 700px; color: black;">
										A:图形A</span>
								</label> <label> <input type="radio" name="question-radio12"
									value="0" /> <span style="width: 700px; color: black;">
										B:图形B</span>
								</label> <label> <input type="radio" name="question-radio12"
									value="1" /> <span style="width: 700px; color: black;">
										C:图形C </span>
								</label> <label> <input type="radio" name="question-radio12"
									value="0" /> <span style="width: 700px; color: black;">
										D:图形D</span>
								</label> <label> <input type="radio" name="question-radio12"
									value="0" /> <span style="width: 700px; color: black;">E:没有答案</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_13">
							<p>
								<b>13.&nbsp;&nbsp;&nbsp;以下四个图形中哪一个经过旋转无法得到左边那个图形？</b>
								<br>
								<img alt="" src="shyl/images/evaluation/problemImg/13.jpg">
							</p>
							<p>
								<label style="width:100%"> <input type="radio" name="question-radio13"
									value="1" /> <span style="width: 700px; color: black;">
										A:图形A</span>
								</label> <label style="width:100%"> <input type="radio" name="question-radio13"
									value="0" /> <span style="width: 700px; color: black;">
										B:图形B</span>
								</label> <label style="width:100%"> <input type="radio" name="question-radio13"
									value="0" /> <span style="width: 700px; color: black;">
										C:图形C </span>
								</label> <label style="width:100%"> <input type="radio" name="question-radio13"
									value="0" /> <span style="width: 700px; color: black;">
										D:图形D</span>
								</label> <label style="width:100%"> <input type="radio" name="question-radio13"
									value="0" /> <span style="width: 700px; color: black;">E:没有答案</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_14">
							<p>
								<b>14.&nbsp;&nbsp;&nbsp;下方图形中共有多少个长方形？</b>
								<br>
								<img alt="" src="shyl/images/evaluation/problemImg/14.jpg">
							</p>
							<p>
								<label> <input type="radio" name="question-radio14"
									value="0" /> <span style="width: 700px; color: black;">
										A:10-15个</span>
								</label> <label> <input type="radio" name="question-radio14"
									value="0" /> <span style="width: 700px; color: black;">
										B:16-20个</span>
								</label> <label> <input type="radio" name="question-radio14"
									value="0" /> <span style="width: 700px; color: black;">
										C:21-25个</span>
								</label> <label> <input type="radio" name="question-radio14"
									value="1" /> <span style="width: 700px; color: black;">
										D:26-30个</span>
								</label> <label> <input type="radio" name="question-radio14"
									value="0" /> <span style="width: 700px; color: black;">E:30-35个</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_15">
							<p>
								<b>15.&nbsp;&nbsp;&nbsp;一个立方体的六面，分别写着a、b、c、d、e、f六个字母，根据以下四张图，推测b的对面是什么字母。</b>
								<br>
								<img alt="" src="shyl/images/evaluation/problemImg/15.jpg">
							</p>
							<p>
								<label> <input type="radio" name="question-radio15"
									value="0" /> <span style="width: 700px; color: black;">
										A:字母a</span>
								</label> <label> <input type="radio" name="question-radio15"
									value="0" /> <span style="width: 700px; color: black;">
										B:字母c</span>
								</label> <label> <input type="radio" name="question-radio15"
									value="0" /> <span style="width: 700px; color: black;">
										C:字母d</span>
								</label> <label> <input type="radio" name="question-radio15"
									value="1" /> <span style="width: 700px; color: black;">
										D:字母e</span>
								</label> <label> <input type="radio" name="question-radio15"
									value="0" /> <span style="width: 700px; color: black;">E:字母f</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_16">
							<p>
								<b>16.&nbsp;&nbsp;&nbsp;以下4个图形中哪一个经过旋转无法弥补下方拼图中的空白？</b>
								<br>
								<img alt="" src="shyl/images/evaluation/problemImg/16.jpg" style="width:400px;height:250px">
							</p>
							<p>
								<label> <input type="radio" name="question-radio16"
									value="0" /> <span style="width: 700px; color: black;">
										A:图形A</span>
								</label> <label> <input type="radio" name="question-radio16"
									value="0" /> <span style="width: 700px; color: black;">
										B:图形B</span>
								</label> <label> <input type="radio" name="question-radio16"
									value="0" /> <span style="width: 700px; color: black;">
										C:图形C</span>
								</label> <label> <input type="radio" name="question-radio16"
									value="0" /> <span style="width: 700px; color: black;">
										D:图形D</span>
								</label> <label> <input type="radio" name="question-radio16"
									value="1" /> <span style="width: 700px; color: black;">E:没有答案</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_17">
							<p>
								<b>17.&nbsp;&nbsp;&nbsp;将左图纸片折成一个立方体，立方体的表面图案是怎样的？从A,B,C,D,E中选出正确的一幅。</b>
								<br>
								<img alt="" src="shyl/images/evaluation/problemImg/17.jpg" style="width:400px;height:200px">
							</p>
							<p>
								<label> <input type="radio" name="question-radio17"
									value="1" /> <span style="width: 700px; color: black;">
										A:图形A</span>
								</label> <label> <input type="radio" name="question-radio17"
									value="0" /> <span style="width: 700px; color: black;">
										B:图形B</span>
								</label> <label> <input type="radio" name="question-radio17"
									value="0" /> <span style="width: 700px; color: black;">
										C:图形C</span>
								</label> <label> <input type="radio" name="question-radio17"
									value="0" /> <span style="width: 700px; color: black;">
										D:图形D</span>
								</label> <label> <input type="radio" name="question-radio17"
									value="0" /> <span style="width: 700px; color: black;">E:图形E</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_18">
							<p>
								<b>18.&nbsp;&nbsp;&nbsp;将下图纸片折起之后，物体表面的图案将是怎么样的？</b>
								<br>
								<img alt="" src="shyl/images/evaluation/problemImg/18.jpg" style="width:400px;height:200px">
							</p>
							<p>
								<label> <input type="radio" name="question-radio18"
									value="1" /> <span style="width: 700px; color: black;">
										A:图形A</span>
								</label> <label> <input type="radio" name="question-radio18"
									value="0" /> <span style="width: 700px; color: black;">
										B:图形B</span>
								</label> <label> <input type="radio" name="question-radio18"
									value="0" /> <span style="width: 700px; color: black;">
										C:图形C</span>
								</label> <label> <input type="radio" name="question-radio18"
									value="0" /> <span style="width: 700px; color: black;">
										D:图形D</span>
								</label> <label> <input type="radio" name="question-radio18"
									value="0" /> <span style="width: 700px; color: black;">E:图形E</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_19" style="margin-bottom:10px">
							<p>
								<b>19.&nbsp;&nbsp;&nbsp;下面四幅图反映的是一个立方体的不同表面，那么符合“X”指示的这面应该是怎么样的？</b>
								<br>
								<img alt="" src="shyl/images/evaluation/problemImg/19.jpg" style="width:400px;height:200px">
							</p>
							<p>
								<label> <input type="radio" name="question-radio19"
									value="0" /> <span style="width: 700px; color: black;">
										A:图形A</span>
								</label> <label> <input type="radio" name="question-radio19"
									value="0" /> <span style="width: 700px; color: black;">
										B:图形B</span>
								</label> <label> <input type="radio" name="question-radio19"
									value="0" /> <span style="width: 700px; color: black;">
										C:图形C</span>
								</label> <label> <input type="radio" name="question-radio19"
									value="1" /> <span style="width: 700px; color: black;">
										D:图形D</span>
								</label> <label> <input type="radio" name="question-radio19"
									value="0" /> <span style="width: 700px; color: black;">E:图形E</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_20">
							<p>
								<b>20.&nbsp;&nbsp;&nbsp;如果在A,B,C,D,E各图中某处添上一条线（任何形状的线皆可，但线条不能重叠），哪幅图案能够变成左图所示的形态？</b>
								<br>
								<img alt="" src="shyl/images/evaluation/problemImg/20.jpg" style="width:400px;height:200px">
							</p>
							<p>
								<label> <input type="radio" name="question-radio20"
									value="0" /> <span style="width: 700px; color: black;">
										A:图形A</span>
								</label> <label> <input type="radio" name="question-radio20"
									value="1" /> <span style="width: 700px; color: black;">
										B:图形B</span>
								</label> <label> <input type="radio" name="question-radio20"
									value="0" /> <span style="width: 700px; color: black;">
										C:图形C</span>
								</label> <label> <input type="radio" name="question-radio20"
									value="0" /> <span style="width: 700px; color: black;">
										D:图形D</span>
								</label> <label> <input type="radio" name="question-radio20"
									value="0" /> <span style="width: 700px; color: black;">E:图形E</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_21">
							<p>
								<b>21.&nbsp;&nbsp;&nbsp;来自英、法、日、德的甲、乙、丙、丁四位旅客，刚好碰在一起，他们除懂本国语言外，每人还会说其它三国语言的一种。
								有一种语言是三个人都会说的，但没有一种语言四人都懂，现知道（1）乙不会说英语，当甲与丙交谈时，他却能替他们做翻译（2）甲是日本人，丁不会说日语，
								但他俩却能毫无困难地交谈（3）乙、丙、丁交谈时，找不到共同语言（4）四个人中没有一个人既能用日语交谈，同时又能用法语交谈。可见 </b>
							</p>
							<p>
								<label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio21"
									value="0" /> <span style="width: 700px; color: black;">
										A:甲日德、乙法德、丙英法、丁英德</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio21"
									value="0" /> <span style="width: 700px; color: black;">
										B:甲日德、乙法德、丙英德、丁英法</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio21"
									value="1" /> <span style="width: 700px; color: black;">
										C:甲日法、乙日德、丙英法、丁日英</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio21"
									value="0" /> <span style="width: 700px; color: black;">
										D:甲日法、乙英德、丙法德、丁日德</span>
								</label> <label style="width:100%;padding-top:5px;"> <input type="radio" name="question-radio21"
									value="0" /> <span style="width: 700px; color: black;">E:以上都不对</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_22">
							<p>
								<b>22.&nbsp;&nbsp;&nbsp;有统计资料显示，1996年底全国库存积压的男式衬衫有15亿件，够全国成年男士人均3件之多。其主要原因是： </b>
							</p>
							<p>
								<label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio22"
									value="0" /> <span style="width: 700px; color: black;">
										A:这些衬衫样式不流行</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio22"
									value="0" /> <span style="width: 700px; color: black;">
										B:这些衬衫质量不合格</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio22"
									value="1" /> <span style="width: 700px; color: black;">
										C:生产衬衫的厂家太多，使产品供给大大超过需求</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio22"
									value="0" /> <span style="width: 700px; color: black;">
										D:全国人民的消费水平低</span>
								</label> <label style="width:100%;padding-top:5px;"> <input type="radio" name="question-radio22"
									value="0" /> <span style="width: 700px; color: black;">E:以上都不对</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_23">
							<p>
								<b>23.&nbsp;&nbsp;&nbsp;某人开始说：“你的这个意见很好，我想大家都会同意。”但他接着又说：“你的这个意见很好，我想没有谁不会不同意的。”可见: </b>
							</p>
							<p>
								<label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio23"
									value="0" /> <span style="width: 700px; color: black;">
										A:该人同意这个意见</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio23"
									value="0" /> <span style="width: 700px; color: black;">
										B:该人反对这个意见</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio23"
									value="0" /> <span style="width: 700px; color: black;">
										C:大家都不反对这个意见</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio23"
									value="1" /> <span style="width: 700px; color: black;">
										D:该人说话前后矛盾，无法判断大家的意思</span>
								</label> <label style="width:100%;padding-top:5px;"> <input type="radio" name="question-radio23"
									value="0" /> <span style="width: 700px; color: black;">E:以上都不对</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_24">
							<p>
								<b>24.&nbsp;&nbsp;&nbsp;社会平等和经济平等密切相关，互为因果。显著并在增大的收入差距并未证明有助于富有活力的经济成效和发展的强大势力。
								事实上看起来更可能是强烈地阻碍了公众对于发展的参与。因此</b>
							</p>
							<p>
								<label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio24"
									value="0" /> <span style="width: 700px; color: black;">
										A:消灭收入差别十分有必要</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio24"
									value="1" /> <span style="width: 700px; color: black;">
										B:需要把收入差距控制在一定的范围内，进而才有可能达到一定程度 的社会平等</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio24"
									value="0" /> <span style="width: 700px; color: black;">
										C:社会平等只不过是乌托帮而己</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio24"
									value="0" /> <span style="width: 700px; color: black;">
										D:公众在收入过度集中前只能无可奈何</span>
								</label> <label style="width:100%;padding-top:5px;"> <input type="radio" name="question-radio24"
									value="0" /> <span style="width: 700px; color: black;">E:以上都不对</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_25">
							<p>
								<b>25.&nbsp;&nbsp;&nbsp;人文社会科学与自然科学作为专门化的论辩形式在更高层次上，具有统一性和共同性。我国人文社会科学界，
								许多伪劣产品是在人文社会科学的学术规范与自然科学的学术规范不同的借口之下生产出来、甚至受到好评的。因此</b>
							</p>
							<p>
								<label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio25"
									value="1" /> <span style="width: 700px; color: black;">
										A:尽管人文社会科学与自然科学有区别，但更重要的是寻找两者都必须遵守的共同的学术规范</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio25"
									value="0" /> <span style="width: 700px; color: black;">
										B:人文社会科学要引入自然科学的学术规范</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio25"
									value="0" /> <span style="width: 700px; color: black;">
										C:自然科学要引入人文社会科学的学术规范</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio25"
									value="0" /> <span style="width: 700px; color: black;">
										D:人文社会科学学术规范与自然科学学术规范之间是“井水不犯河水”的关系</span>
								</label> <label style="width:100%;padding-top:5px;"> <input type="radio" name="question-radio25"
									value="0" /> <span style="width: 700px; color: black;">E:以上都不对</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_26">
							<p>
								<b>26.&nbsp;&nbsp;&nbsp;这块麦田今年增产，或者是因为选用了优良品种，或者是由于是田间管理搞得好，
								或者由于化肥用得多；这块麦田今年确实选用了优良品种；所以</b>
							</p>
							<p>
								<label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio26"
									value="0" /> <span style="width: 700px; color: black;">
										A:这块麦田今年增产并不是由于田间管理搞得好</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio26"
									value="1" /> <span style="width: 700px; color: black;">
										B:这块麦田今年增产并不是由于化肥用得多</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio26"
									value="0" /> <span style="width: 700px; color: black;">
										C:这块麦田今年增产肯定是化肥用得多，并且田间管理搞得好</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio26"
									value="0" /> <span style="width: 700px; color: black;">
										D:这块麦田今年增产可能是化肥用得多，或田间管理搞得好</span>
								</label> <label style="width:100%;padding-top:5px"> <input type="radio" name="question-radio26"
									value="0" /> <span style="width: 700px; color: black;">E:以上都不对</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_27">
							<p>
								<b>27.&nbsp;&nbsp;&nbsp;如果饮用高山上或火山地带的温泉水，就是饮用氟量较高的水；如果长期饮用含氟较高的水，牙齿上就会有白色的斑点。所以：</b>
							</p>
							<p>
								<label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio27"
									value="0" /> <span style="width: 700px; color: black;">
										A:山里人牙齿上一定有白色的斑点</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio27"
									value="0" /> <span style="width: 700px; color: black;">
										B:牙齿上有白色斑点的人，必是山里人</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio27"
									value="0" /> <span style="width: 700px; color: black;">
										C:除了火山和高山地区，其它地方人牙齿上不可能有白色的斑点</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio27"
									value="1" /> <span style="width: 700px; color: black;">
										D:长期饮用温泉水的山里人牙齿上肯定有白色的斑点</span>
								</label> <label style="width:100%;padding-top:5px;"> <input type="radio" name="question-radio27"
									value="0" /> <span style="width: 700px; color: black;">E:以上都不对</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_28">
							<p>
								<b>28.&nbsp;&nbsp;&nbsp;要对社会现象作详尽的了解，探索规律，即使是地区性的，便一定要走进现实社会中找资料，绝不能凭空臆度。要明白事情的因果关系，
								建立有关的理论，不能没有实质的资料，以供验证理论之用。所以：</b>
							</p>
							<p>
								<label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio28"
									value="0" /> <span style="width: 700px; color: black;">
										A:从事社会研究的人，一定同时也是从事实践工作的人</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio28"
									value="1" /> <span style="width: 700px; color: black;">
										B:要从事社会研究，不能不从实际工作中收集资料</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio28"
									value="0" /> <span style="width: 700px; color: black;">
										C:依据实质的资料作社会研究，则不具有有理论性</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio28"
									value="0" /> <span style="width: 700px; color: black;">
										D:社会研究只需有实质的资料就可以了</span>
								</label> <label style="width:100%;padding-top:5px;"> <input type="radio" name="question-radio28"
									value="0" /> <span style="width: 700px; color: black;">E:以上都不对</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_29">
							<p>
								<b>29.&nbsp;&nbsp;&nbsp;事物发展的根本原因，不是在事物的外部而是在事物的内部，在于事物内部的矛盾性。任何事物内部都有矛盾性。因此：</b>
							</p>
							<p>
								<label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio29"
									value="1" /> <span style="width: 700px; color: black;">
										A:任何事物都处在不断的运动和发展之中</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio29"
									value="0" /> <span style="width: 700px; color: black;">
										B:有一部分事情可以处于静止状态</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio29"
									value="0" /> <span style="width: 700px; color: black;">
										C:处于运动和发展中的事物都以同样的速度向前进</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio29"
									value="0" /> <span style="width: 700px; color: black;">
										D:当一个社会处于封闭状态时，这个社会就是一个静止的社会</span>
								</label> <label style="width:100%;padding-top:5px;"> <input type="radio" name="question-radio29"
									value="0" /> <span style="width: 700px; color: black;">E:以上都不对</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_30">
							<p>
								<b>30.&nbsp;&nbsp;&nbsp;只有在统治者不能照旧统治下去，人民群众也不能照旧生活下去的时候，革命才会发生。
								就个人而言，选择革命或接受革命，也往往是别的路走不通之后，才逼上梁山的。由此可见：</b>
							</p>
							<p>
								<label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio30"
									value="1" /> <span style="width: 700px; color: black;">
										A:任何一次革命，都不是人为制造的结果</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio30"
									value="0" /> <span style="width: 700px; color: black;">
										B:革命不需要领导力量也会成功</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio30"
									value="0" /> <span style="width: 700px; color: black;">
										C:革命不需要动员，群众也会自发参与</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:5px"> <input type="radio" name="question-radio30"
									value="0" /> <span style="width: 700px; color: black;">
										D:所有在个人生活中遇到挫折的人都会参加革命或支持革命</span>
								</label> <label style="width:100%;padding-top:5px;"> <input type="radio" name="question-radio30"
									value="0" /> <span style="width: 700px; color: black;">E:以上都不对</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_31">
							<p>
								<b>31.&nbsp;&nbsp;&nbsp;第一行的前四个图形都是按照一定的规律与次序排列起来的，请您分析其排列的规律，
								并按照该规律从abcde五个备选图形中选择相应的图形填入问号处。</b>
								<br>
								<img alt="" src="shyl/images/evaluation/problemImg/31.jpg">
							</p>
							<p>
								<label> <input type="radio" name="question-radio31"
									value="0" /> <span style="width: 700px; color: black;">
										A:a</span>
								</label> <label> <input type="radio" name="question-radio31"
									value="0" /> <span style="width: 700px; color: black;">
										B:b</span>
								</label> <label> <input type="radio" name="question-radio31"
									value="0" /> <span style="width: 700px; color: black;">
										C:c</span>
								</label> <label> <input type="radio" name="question-radio31"
									value="1" /> <span style="width: 700px; color: black;">
										D:d</span>
								</label> <label> <input type="radio" name="question-radio31"
									value="0" /> <span style="width: 700px; color: black;">E:e</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_32">
							<p>
								<b>32.&nbsp;&nbsp;&nbsp;第一行的前四个图形都是按照一定的规律与次序排列起来的，请您分析其排列的规律，
								并按照该规律从abcde五个备选图形中选择相应的图形填入问号处。</b>
								<br>
								<img alt="" src="shyl/images/evaluation/problemImg/32.jpg">
							</p>
							<p>
								<label> <input type="radio" name="question-radio32"
									value="1" /> <span style="width: 700px; color: black;">
										A:a</span>
								</label> <label> <input type="radio" name="question-radio32"
									value="0" /> <span style="width: 700px; color: black;">
										B:b</span>
								</label> <label> <input type="radio" name="question-radio32"
									value="0" /> <span style="width: 700px; color: black;">
										C:c</span>
								</label> <label> <input type="radio" name="question-radio32"
									value="0" /> <span style="width: 700px; color: black;">
										D:d</span>
								</label> <label> <input type="radio" name="question-radio32"
									value="0" /> <span style="width: 700px; color: black;">E:e</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_33">
							<p>
								<b>33.&nbsp;&nbsp;&nbsp;第一行的前四个图形都是按照一定的规律与次序排列起来的，请您分析其排列的规律，
								并按照该规律从abcde五个备选图形中选择相应的图形填入问号处。</b>
								<br>
								<img alt="" src="shyl/images/evaluation/problemImg/33.jpg">
							</p>
							<p>
								<label> <input type="radio" name="question-radio33"
									value="0" /> <span style="width: 700px; color: black;">
										A:a</span>
								</label> <label> <input type="radio" name="question-radio33"
									value="0" /> <span style="width: 700px; color: black;">
										B:b</span>
								</label> <label> <input type="radio" name="question-radio33"
									value="1" /> <span style="width: 700px; color: black;">
										C:c</span>
								</label> <label> <input type="radio" name="question-radio33"
									value="0" /> <span style="width: 700px; color: black;">
										D:d</span>
								</label> <label> <input type="radio" name="question-radio33"
									value="0" /> <span style="width: 700px; color: black;">E:e</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_34">
							<p>
								<b>34.&nbsp;&nbsp;&nbsp;第一行的前四个图形都是按照一定的规律与次序排列起来的，请您分析其排列的规律，
								并按照该规律从abcde五个备选图形中选择相应的图形填入问号处。</b>
								<br>
								<img alt="" src="shyl/images/evaluation/problemImg/34.jpg">
							</p>
							<p>
								<label> <input type="radio" name="question-radio34"
									value="0" /> <span style="width: 700px; color: black;">
										A:a</span>
								</label> <label> <input type="radio" name="question-radio34"
									value="0" /> <span style="width: 700px; color: black;">
										B:b</span>
								</label> <label> <input type="radio" name="question-radio34"
									value="0" /> <span style="width: 700px; color: black;">
										C:c</span>
								</label> <label> <input type="radio" name="question-radio34"
									value="0" /> <span style="width: 700px; color: black;">
										D:d</span>
								</label> <label> <input type="radio" name="question-radio34"
									value="1" /> <span style="width: 700px; color: black;">E:e</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_35">
							<p>
								<b>35.&nbsp;&nbsp;&nbsp;第一行的前四个图形都是按照一定的规律与次序排列起来的，请您分析其排列的规律，
								并按照该规律从abcde五个备选图形中选择相应的图形填入问号处。</b>
								<br>
								<img alt="" src="shyl/images/evaluation/problemImg/35.jpg">
							</p>
							<p>
								<label style="width:100%"> <input type="radio" name="question-radio35"
									value="0" /> <span style="width: 700px; color: black;">
										A:a</span>
								</label> <label style="width:100%"> <input type="radio" name="question-radio35"
									value="0" /> <span style="width: 700px; color: black;">
										B:b</span>
								</label> <label style="width:100%"> <input type="radio" name="question-radio35"
									value="1" /> <span style="width: 700px; color: black;">
										C:c</span>
								</label> <label style="width:100%"> <input type="radio" name="question-radio35"
									value="0" /> <span style="width: 700px; color: black;">
										D:d</span>
								</label> <label style="width:100%"> <input type="radio" name="question-radio35"
									value="0" /> <span style="width: 700px; color: black;">E:e</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_36">
							<p>
								<b>36.&nbsp;&nbsp;&nbsp;下题包含五个图形，其中四个图形在某一方面相似，请你找出另一个与众不同的图形。</b>
								<br>
								<img alt="" src="shyl/images/evaluation/problemImg/36.jpg">
							</p>
							<p>
								<label> <input type="radio" name="question-radio36"
									value="0" /> <span style="width: 700px; color: black;">
										A:(a)</span>
								</label> <label> <input type="radio" name="question-radio36"
									value="0" /> <span style="width: 700px; color: black;">
										B:(b)</span>
								</label> <label> <input type="radio" name="question-radio36"
									value="1" /> <span style="width: 700px; color: black;">
										C:(c)</span>
								</label> <label> <input type="radio" name="question-radio36"
									value="0" /> <span style="width: 700px; color: black;">
										D:(d)</span>
								</label> <label> <input type="radio" name="question-radio36"
									value="0" /> <span style="width: 700px; color: black;">E:(e)</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_37">
							<p>
								<b>37.&nbsp;&nbsp;&nbsp;下题包含五个图形，其中四个图形在某一方面相似，请你找出另一个与众不同的图形。</b>
								<br>
								<img alt="" src="shyl/images/evaluation/problemImg/37.jpg">
							</p>
							<p>
								<label style="width:100%"> <input type="radio" name="question-radio37"
									value="0" /> <span style="width: 700px; color: black;">
										A:(a)</span>
								</label> <label style="width:100%"> <input type="radio" name="question-radio37"
									value="1" /> <span style="width: 700px; color: black;">
										B:(b)</span>
								</label> <label style="width:100%"> <input type="radio" name="question-radio37"
									value="0" /> <span style="width: 700px; color: black;">
										C:(c)</span>
								</label> <label style="width:100%"> <input type="radio" name="question-radio37"
									value="0" /> <span style="width: 700px; color: black;">
										D:(d)</span>
								</label> <label style="width:100%"> <input type="radio" name="question-radio37"
									value="0" /> <span style="width: 700px; color: black;">E:(e)</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_38">
							<p>
								<b>38.&nbsp;&nbsp;&nbsp;下题包含五个图形，其中四个图形在某一方面相似，请你找出另一个与众不同的图形。</b>
								<br>
								<img alt="" src="shyl/images/evaluation/problemImg/38.jpg">
							</p>
							<p>
								<label style="width:100%"> <input type="radio" name="question-radio38"
									value="0" /> <span style="width: 700px; color: black;">
										A:a</span>
								</label> <label style="width:100%"> <input type="radio" name="question-radio38"
									value="0" /> <span style="width: 700px; color: black;">
										B:b</span>
								</label> <label style="width:100%"> <input type="radio" name="question-radio38"
									value="0" /> <span style="width: 700px; color: black;">
										C:c</span>
								</label> <label style="width:100%"> <input type="radio" name="question-radio38"
									value="0" /> <span style="width: 700px; color: black;">
										D:d</span>
								</label> <label style="width:100%"> <input type="radio" name="question-radio38"
									value="1" /> <span style="width: 700px; color: black;">E:e</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_39">
							<p>
								<b>39.&nbsp;&nbsp;&nbsp;下题包含五个图形，其中四个图形在某一方面相似，请你找出另一个与众不同的图形。</b>
								<br>
								<img alt="" src="shyl/images/evaluation/problemImg/39.jpg">
							</p>
							<p>
								<label style="width:100%"> <input type="radio" name="question-radio39"
									value="0" /> <span style="width: 700px; color: black;">
										A:a</span>
								</label> <label style="width:100%"> <input type="radio" name="question-radio39"
									value="0" /> <span style="width: 700px; color: black;">
										B:b</span>
								</label> <label style="width:100%"> <input type="radio" name="question-radio39"
									value="0" /> <span style="width: 700px; color: black;">
										C:c</span>
								</label> <label style="width:100%"> <input type="radio" name="question-radio39"
									value="0" /> <span style="width: 700px; color: black;">
										D:d</span>
								</label> <label style="width:100%"> <input type="radio" name="question-radio39"
									value="1" /> <span style="width: 700px; color: black;">E:e</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_40">
							<p>
								<b>40.&nbsp;&nbsp;&nbsp;下题包含五个图形，其中四个图形在某一方面相似，请你找出另一个与众不同的图形。</b>
								<br>
								<img alt="" src="shyl/images/evaluation/problemImg/40.jpg">
							</p>
							<p>
								<label> <input type="radio" name="question-radio40"
									value="0" /> <span style="width: 700px; color: black;">
										A:A</span>
								</label> <label> <input type="radio" name="question-radio40"
									value="0" /> <span style="width: 700px; color: black;">
										B:B</span>
								</label> <label> <input type="radio" name="question-radio40"
									value="1" /> <span style="width: 700px; color: black;">
										C:C</span>
								</label> <label> <input type="radio" name="question-radio40"
									value="0" /> <span style="width: 700px; color: black;">
										D:D</span>
								</label> <label> <input type="radio" name="question-radio40"
									value="0" /> <span style="width: 700px; color: black;">E:E</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_41">
							<p>
								<b>41.&nbsp;&nbsp;&nbsp;上市公司作为现代公司治理结构的最高形态，如何实施股 权激励，解决上市公司中股东与经营者之间的“委托——代理”问题，
								提高上市公司整体运营效率，是当前我国上市公司中亟待解决的问题。在上市公司中实施切实有效的激励约束机制，
								对完善上市公司治理结构、实现股东与经营者的目标趋同、降低代理成本、控制经营者的道德风险具有十分重要的现实意义。
								这段话的核心思想是：</b>
							</p>
							<p>
								<label style="width:100%;padding-top:4px;padding-bottom:4px"> <input type="radio" name="question-radio41"
									value="1" /> <span style="width: 700px; color: black;">
										A:要恰当地运用上市公司的股权激励机制</span>
								</label> <label style="width:100%;padding-top:4px;padding-bottom:2px"> <input type="radio" name="question-radio41"
									value="0" /> <span style="width: 700px; color: black;">
										B:股东与经营者的目标趋同是上市公司成功的重要保障</span>
								</label> <label style="width:100%;padding-top:4px;padding-bottom:2px"> <input type="radio" name="question-radio41"
									value="0" /> <span style="width: 700px; color: black;">
										C:代理成本是目前上市公司面临的一个比较突出的问题</span>
								</label> <label style="width:100%;padding-top:4px;padding-bottom:2px"> <input type="radio" name="question-radio41"
									value="0" /> <span style="width: 700px; color: black;">
										D:上市公司的治理结构需要进一步调整</span>
								</label> <label style="width:100%;padding-top:4px;"> <input type="radio" name="question-radio41"
									value="0" /> <span style="width: 700px; color: black;">E:上市公司是现代公司治理结构的最高形态</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_42">
							<p>
								<b>42.&nbsp;&nbsp;&nbsp;只要你为公司揽得一份新合同，你就有机会额外购买与合 同金融成一定比例的股票。这只是科用公司精心设计的退休、
								股票购买和股票奖励计划制度的一部分。退休计划成为普遍的职员所有权的基础。公司的401(k)计划允许职员选择购买各种
                                "先锋"基金和科用公司股票。此外还有一个适用于每个人的《职员股票所有权计划》。
                                                                                与规定职员必须把他们的股份卖回给公司的其他私营公司不同，科用公司的人可以通过科用公司登记注册的经纪交易公司布尔公司彼此进行交易。
                                                                                简而言之，公司保持一个内部股票市场，职员可以在那里买卖股票；唯一的限制是，该市场只对科用公司的员工开放。根据以上段落，科用公司的员工持股计划的最大优点是：</b>
							</p>
							<p>
								<label style="width:100%;padding-top:4px;padding-bottom:4px"> <input type="radio" name="question-radio42"
									value="0" /> <span style="width: 700px; color: black;">
										A:金额高，利润丰厚</span>
								</label> <label style="width:100%;padding-top:4px;padding-bottom:2px"> <input type="radio" name="question-radio42"
									value="0" /> <span style="width: 700px; color: black;">
										B:允许购买“先锋”基金</span>
								</label> <label style="width:100%;padding-top:4px;padding-bottom:2px"> <input type="radio" name="question-radio42"
									value="0" /> <span style="width: 700px; color: black;">
										C:以退休计划为所有权的基础</span>
								</label> <label style="width:100%;padding-top:4px;padding-bottom:2px"> <input type="radio" name="question-radio42"
									value="1" /> <span style="width: 700px; color: black;">
										D:严谨方便，自由度高</span>
								</label> <label style="width:100%;padding-top:4px;"> <input type="radio" name="question-radio42"
									value="0" /> <span style="width: 700px; color: black;">E:可以激励员工</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_43">
							<p>
								<b>43.&nbsp;&nbsp;&nbsp;于年轻人在培训后离职是否给公司造成损失，卢韦先生表 示，他们不希望用合同的形式将人“捆绑”起来，
								而是要使公司的每一个岗位都具有吸引力。“如果一个有前途有才干的年轻人要求辞职，这的确是令人遗憾的事情。但是，
								应该对此进行检讨的是我们自己而不是他。”卢韦先生认为，如果由于担心这种情况的发生而只雇用具备相当工作经验的人，甚至放弃对青年人的培训，
								这是极不明智的作法，因为青年人的第一次在职培训往往会对他未来的工作产生很大影响。根据以上段落，卢韦先生想表达的主要观点是：</b>
							</p>
							<p>
								<label style="width:100%;padding-top:4px;padding-bottom:4px"> <input type="radio" name="question-radio43"
									value="0" /> <span style="width: 700px; color: black;">
										A:要防止年轻员工辞职</span>
								</label> <label style="width:100%;padding-top:4px;padding-bottom:4px"> <input type="radio" name="question-radio43"
									value="0" /> <span style="width: 700px; color: black;">
										B: 有前途的年轻人辞职是一件令人遗憾的事情</span>
								</label> <label style="width:100%;padding-top:4px;padding-bottom:4px"> <input type="radio" name="question-radio43"
									value="1" /> <span style="width: 700px; color: black;">
										C:不能因为担心员工流失而放弃雇佣、培训不具备工作经验的年轻人</span>
								</label> <label style="width:100%;padding-top:4px;padding-bottom:4px"> <input type="radio" name="question-radio43"
									value="0" /> <span style="width: 700px; color: black;">
										D:青年人的第一次在职培训会对其未来工作有很大的影响</span>
								</label> <label style="width:100%;padding-top:4px;"> <input type="radio" name="question-radio43"
									value="0" /> <span style="width: 700px; color: black;">E:要增强公司的岗位吸引力</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_44">
							<p>
								<b>44.&nbsp;&nbsp;&nbsp;巨人大厦的开发是一个个人狂热的典型之作，单凭巨人集 团的实力，根本无法承接这项浩大的工程，
								而且更令人瞠目结舌的是，大厦从1994年2月动工到1996年7月，史玉柱竟未申请过一分钱银行贷款，全凭自有资金和卖楼花的钱支撑。
								稍微懂点经济的人都知道，房地产必须有金融资本作后盾，可史玉柱竟将银行搁置一边。后来，由于资金的不足，巨人大厦能如期完工，
								已买楼花的人要求退款并赔偿，巨人集团无钱赔偿，成为了巨人财务危机的导火索。从上文来看，导致巨人集团开发工作失败的主要原因是：</b>
							</p>
							<p>
								<label style="width:100%;padding-top:4px;padding-bottom:4px"> <input type="radio" name="question-radio44"
									value="1" /> <span style="width: 700px; color: black;">
										A:不自量力、自视过高</span>
								</label> <label style="width:100%;padding-top:4px;padding-bottom:4px"> <input type="radio" name="question-radio44"
									value="0" /> <span style="width: 700px; color: black;">
										B:管理层不懂经济知识</span>
								</label> <label style="width:100%;padding-top:4px;padding-bottom:4px"> <input type="radio" name="question-radio44"
									value="0" /> <span style="width: 700px; color: black;">
										C:买楼的人要求退款和赔偿</span>
								</label> <label style="width:100%;padding-top:4px;padding-bottom:4px"> <input type="radio" name="question-radio44"
									value="0" /> <span style="width: 700px; color: black;">
										D:大厦施工时间太长</span>
								</label> <label style="width:100%;padding-top:4px;"> <input type="radio" name="question-radio44"
									value="0" /> <span style="width: 700px; color: black;">E:史玉柱独断专行，不听取他人意见</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_45">
							<p>
								<b>45.&nbsp;&nbsp;&nbsp;IBM公司追求卓越，特别是在人才培训、造就销售人 才方面取得了成功的经验。
								具体地说，IBM公司决不让一名未经培训或者未经全面培训的人到销售第一线去。销售人员们说些什么、
								做些什么以及怎样说和怎样做，都对公司的形象和信用影响极大。如果准备不足就仓促上阵，
								会使一个很有潜力的销售人员夭折。因此该公司用于培训的资金充足，计划严密，结构合理，一到培训结束，
								学员就可以有足够的技能，满怀信心地同用户打交道，不合格的培训几乎总是导致频繁地更换销售人员，
								其费用远远超过了高质量培训过程所需要的费用。上文主要表达的管理理念是：</b>
							</p>
							<p>
								<label style="width:100%;padding-top:4px;padding-bottom:4px"> <input type="radio" name="question-radio45"
									value="0" /> <span style="width: 700px; color: black;">
										A:销售人员应当满怀信心的和客户打交道</span>
								</label> <label style="width:100%;padding-top:4px;padding-bottom:2px"> <input type="radio" name="question-radio45"
									value="0" /> <span style="width: 700px; color: black;">
										B:一名未经培训的人到销售第一线会对公司造成巨大损失</span>
								</label> <label style="width:100%;padding-top:4px;padding-bottom:2px"> <input type="radio" name="question-radio45"
									value="0" /> <span style="width: 700px; color: black;">
										C:销售人员对公司的形象维护至关重要</span>
								</label> <label style="width:100%;padding-top:4px;padding-bottom:2px"> <input type="radio" name="question-radio45"
									value="1" /> <span style="width: 700px; color: black;">
										D:在员工正式工作前要给以充足、高质量的培训</span>
								</label> <label style="width:100%;padding-top:3px;"> <input type="radio" name="question-radio45"
									value="0" /> <span style="width: 700px; color: black;">E:IBM的销售人员应当用心注意自己的言行</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_46">
							<p>
								<b>46.&nbsp;&nbsp;&nbsp;投产前，公司大胆打破了那种"工人只能按图施工"的常规，而是把 设计方案摆出来，
								请工人们"评头论足"，提出意见，工人们提出的各种合理化建议共达749次，经研究，采纳了其中542项，
								其中有两项意见的效果非常显著。在以前装配车架和车身时，工人得站在一个槽沟里，手拿沉重的扳手，
								低着头把螺栓拧上螺母。由于工作十分吃力，因而往往干得马马虎虎，影响了汽车质量，工人格莱姆说：
								"为什么不能把螺母先装在车架上，让工人站在地在上就能拧螺母呢？"这个建议被采纳，
								既减轻了劳动强度，又使质量和效率大为提高。该案例来自福特汽车公司，它主要表达的意思是：</b>
							</p>
							<p>
								<label style="width:100%;padding-top:4px;padding-bottom:4px"> <input type="radio" name="question-radio46"
									value="0" /> <span style="width: 700px; color: black;">
										A:福特公司的汽车工人很善于提意见</span>
								</label> <label style="width:100%;padding-top:4px;padding-bottom:2px"> <input type="radio" name="question-radio46"
									value="1" /> <span style="width: 700px; color: black;">
										B:福特公司广泛听取工人建议，有效提高了生产质量和效率</span>
								</label> <label style="width:100%;padding-top:4px;padding-bottom:2px"> <input type="radio" name="question-radio46"
									value="0" /> <span style="width: 700px; color: black;">
										C:福特汽车装配车架和车身的技术不合理，经过改进后提高了生产效率</span>
								</label> <label style="width:100%;padding-top:4px;padding-bottom:2px"> <input type="radio" name="question-radio46"
									value="0" /> <span style="width: 700px; color: black;">
										D:福特公司的管理者善于打破常规</span>
								</label> <label style="width:100%;padding-top:3px;"> <input type="radio" name="question-radio46"
									value="0" /> <span style="width: 700px; color: black;">E:福特汽车公司的汽车工人责任心很强</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_47">
							<p>
								<b>47.&nbsp;&nbsp;&nbsp;以前,一个员工在一个单位工作超过10年是很平常的事情;现在,
								一个员工在一个IT公司工作超过10个月就可算得上"三朝元老"了。互联网公司的发展速度正在改变着人们对"一个时代"周期的理解,
								以前一个五年计划可以算得上一个时代,而现在,它是四个时代的总周期。时代的节奏越来越快,
								人才的需求瓶颈不仅发生在其数量的短缺上,而且更多地体现在人才的选拔和培养的矛盾上。
								下面几项中，最能涵盖上文的核心思想的是：
								</b>
							</p>
							<p>
								<label style="width:100%;padding-top:4px;padding-bottom:4px"> <input type="radio" name="question-radio47"
									value="0" /> <span style="width: 700px; color: black;">
										A:人们对“一个时代”这样一个时间概念的理解有了变化</span>
								</label> <label style="width:100%;padding-top:4px;padding-bottom:4px"> <input type="radio" name="question-radio47"
									value="0" /> <span style="width: 700px; color: black;">
										B:如今，一个员工在一个IT公司工作10年是不可思议的</span>
								</label> <label style="width:100%;padding-top:4px;padding-bottom:4px"> <input type="radio" name="question-radio47"
									value="0" /> <span style="width: 700px; color: black;">
										C:IT业的员工流动性比其他行业更强。</span>
								</label> <label style="width:100%;padding-top:4px;padding-bottom:4px"> <input type="radio" name="question-radio47"
									value="1" /> <span style="width: 700px; color: black;">
										D:时代节奏的加快改变了人们对人才选拔和培养重要性的看法</span>
								</label> <label style="width:100%;padding-top:4px"> <input type="radio" name="question-radio47"
									value="0" /> <span style="width: 700px; color: black;">E: 随着时代节奏的加快，IT公司对人才的需求也不断增大</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_48">
							<p>
								<b>48.&nbsp;&nbsp;&nbsp;矩阵组织能够弥补对企业进行单一划分带来的不足，把各种企业划分 的好处充分发挥出来。
								显然，如果不对企业进行地域上的细分，比如说只有大中华而没有华南、华东、香港、台湾，就无法针对各地区市场的特点把工作深入下去。
								而如果只进行地域上的划分，对某一种产品比如AS/400而言，就不会有一个人能够非常了解这个产品在各地表现出来的特点，因为每个地区都会只看重该地区整盘的生意。
								如果再进一步按照行业划分，就会专门有人来研究各个行业客户对IBM产品的需求，从而更加有效地把握住各种产品的重点市场。 上文强调的管理原则是：
								</b>
							</p>
							<p>
								<label style="width:100%;padding-top:4px;padding-bottom:4px"> <input type="radio" name="question-radio48"
									value="0" /> <span style="width: 700px; color: black;">
										A:企业发展不能只重视个别的地区市场</span>
								</label> <label style="width:100%;padding-top:4px;padding-bottom:4px"> <input type="radio" name="question-radio48"
									value="0" /> <span style="width: 700px; color: black;">
										B:企业的产品销售一定要按照行业来划分</span>
								</label> <label style="width:100%;padding-top:4px;padding-bottom:4px"> <input type="radio" name="question-radio48"
									value="1" /> <span style="width: 700px; color: black;">
										C:对企业进行划分时，应当参考不同的标准进行多重划分</span>
								</label> <label style="width:100%;padding-top:4px;padding-bottom:4px"> <input type="radio" name="question-radio48"
									value="0" /> <span style="width: 700px; color: black;">
										D:有必要对企业进行地域上的细分</span>
								</label> <label style="width:100%;padding-top:4px;"> <input type="radio" name="question-radio48"
									value="0" /> <span style="width: 700px; color: black;">E:要有效地把握不同产品的重点市场</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_49">
							<p>
								<b>49.&nbsp;&nbsp;&nbsp;公司章程规定，股东年底分红将不按照股份分红，股东全体分红不 得超过公司分红数总额的30％，
								剩下70％的红利分给公司内不持股的普通员工。这种分红制度从教科书、理论书中找不到理论的依据，
								而在部分经济学家的眼中这也是一种不规范的股份制。可就是这种从诞生之日起就遭到非议的劳动股份制，
								已经成为慧聪公司发展九年历史中的一项最基本的产权制度，并成为慧聪制胜的法宝，
								郭凡生曾经感慨地说："企业的分配制度必须要从资本型为主过渡到以知识分配为主。上文表达的主要意思是：
								</b>
							</p>
							<p>
								<label style="width:100%;padding-top:4px;padding-bottom:4px"> <input type="radio" name="question-radio49"
									value="1" /> <span style="width: 700px; color: black;">
										A:一项不规范的分红制度法反而可能是有效的</span>
								</label> <label style="width:100%;padding-top:4px;padding-bottom:4px"> <input type="radio" name="question-radio49"
									value="0" /> <span style="width: 700px; color: black;">
										B:慧聪公司的分红制度没能很好地保障股东权益</span>
								</label> <label style="width:100%;padding-top:4px;padding-bottom:4px"> <input type="radio" name="question-radio49"
									value="0" /> <span style="width: 700px; color: black;">
										C:尽管饱受非议，慧聪的股份分红制度仍有强大的生命力</span>
								</label> <label style="width:100%;padding-top:4px;padding-bottom:4px"> <input type="radio" name="question-radio49"
									value="0" /> <span style="width: 700px; color: black;">
										D:企业的分配制度必须要不断改革</span>
								</label> <label style="width:100%;padding-top:4px;"> <input type="radio" name="question-radio49"
									value="0" /> <span style="width: 700px; color: black;">E:相对于投资者而言慧聪的分红制度更注重对知识劳动者的奖励</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>
						<div class="cpst" id="questionIndex_50">
							<p>
								<b>50.&nbsp;&nbsp;&nbsp;与全世界各地的麦当劳快餐店完全按照统一模式运作一样，全世界 的艾科公司分公司都完全遵照总部的原则来运作，
								分享同一个使命和目标。在中国，艾科公司的各个组织机构均按照总部的原则来实施业务、培训开发人才，
								没有丝毫的偏差。如此严格的照搬需要有严格的内部控制系统来维护，公司具备极高标准的内部控制系统，
								设置专门的专家小组对各个分公司的各个部门、各个组织不定期地实施检查、审计，
								以检查以前的运作中有没有背离公司的原则和规定，挖掘现有运作中的漏洞和暇疵。上文的核心思想是：
								</b>
							</p>
							<p>
								<label style="width:100%;padding-top:5px;padding-bottom:4px"> <input type="radio" name="question-radio50"
									value="0" /> <span style="width: 700px; color: black;">
										A:艾科公司具备高素质的专家小组</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:4px"> <input type="radio" name="question-radio50"
									value="0" /> <span style="width: 700px; color: black;">
										B:艾科公司经常进行不定期的检查和审计</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:4px"> <input type="radio" name="question-radio50"
									value="1" /> <span style="width: 700px; color: black;">
										C:艾科公司具有严格的内部控制系统，保证属下各个组织机构按照统一的原则运行</span>
								</label> <label style="width:100%;padding-top:5px;padding-bottom:4px"> <input type="radio" name="question-radio50"
									value="0" /> <span style="width: 700px; color: black;">
										D:艾科公司的业务培训非常严格，有专门的专家小组进行评估</span>
								</label> <label style="width:100%;padding-top:5px;"> <input type="radio" name="question-radio50"
									value="0" /> <span style="width: 700px; color: black;">E:艾科公司重视对属下不同组织机构之间的协调工作</span>
								</label>
							</p>
							<div class="clear"></div>
						</div>																		
					</form>
				</div>
				<div class="nlcp-btn" id="barcon"></div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<div class="modal fade bs-example-modal-sm" id="confirmDialog"
		role="dialog" aria-labelledby="mySmallModalLabel">
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
						<h4>您确定要交卷吗？交卷后本次测评结束！！</h4>
						<br> <br>
					</div>
					<div class="modal-footer" style="height: 40px" id="abilityTestPaperSubmit">
						<button id="EduButton" type="button" class="btn btn-success"
							data-dismiss="modal">确认</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
	</div>
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
					请登录后操作！点此&nbsp;<a style="cursor: pointer;"
						href="<%=basePath%>userLogin/goLogin.act?returnUrl=evaluation/evaluationIndex.act">
						<b style="text-decoration: underline; color: #0a7295;">登录</b>
					</a>
				</div>
			</div>
		</div>
	</div>
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
					<div class="modal-footer" style="height: 40px" id="testPaperSubmit">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	        <div class='modal my-modal-alert' id='my-modal-success-alert'>
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:200px;text-align:center;position:fixed;right:45%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;<label>添加成功!</label>
                    </div>
                </div>
            </div>
        </div>
	<!-- 无权访问结束 -->
	<script type="text/javascript"
		src="shyl/js/question/ability-examing.js"></script>
	<script type="text/javascript" src="shyl/js/question/all.js?v=0712"></script>
	<script type="text/javascript">
		function logint() {
			var userid = $('#loginstatus').val();
			var usertype = $('#user_type').val();
			if (userid == "") {
				$("#layhomewarn").modal('show');
			} else if (usertype == 1) {
				$('#confirmDialog').modal('show');
			} else {
				$('#wqfw').modal('show');
			}
		}
	</script>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>