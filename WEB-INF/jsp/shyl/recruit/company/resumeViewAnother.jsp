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
<title>我的简历_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<base href="<%=basePath%>">
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<link href="shyl/css/maincss/css.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link href="shyl/css/maincss/mypage.css" rel="stylesheet" type="text/css">
<script src="shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<jsp:include page="../../common/header.jsp"></jsp:include>
<style type="text/css">
.tt{
padding: 10px;
    width: 300px;
    min-height: 150px;
    border: 1px solid #ccc;
    resize: none;
    line-height:30px;
    overflow: hidden;
    word-wrap: break-word;
}

div.mypage_right div.input_class ul li {
    width: 432px;
    float: left;
    line-height: 42px;
    height: 42px;
    margin: 10px 0;
}
hr.resume {
	margin-left:100px;
	margin-right:100px;
	border-width:1px;
	border-color: #bfb9b9;
	border-style: dashed;
}
.n-tit1 {
    display: block;
    width: 254px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<c:if test="${pd.flag == 'applicant1' }">
		<jsp:include page="../../common/left.jsp"><jsp:param value="4" name="menuType"/></jsp:include>
		</c:if>
		<c:if test="${pd.flag == 'applicant2' }">
		<jsp:include page="../../common/left.jsp"><jsp:param value="5" name="menuType"/></jsp:include>
		</c:if>
		
		<div class="mypage_right">
			<h2>个人信息</h2>
			<input id="userId" type="hidden" value="${pd.USER_ID}"/>
                <input id="cvId" type="hidden" value="${cvpd.CV_ID}"/>
			<div class="input_class">
				<ul>
					<li><span>姓名：</span><input type="text" class="inputtxt2"  disabled="disabled"
						value="${pd.NAME}" maxlength="50"></li>
					<li><span>性别：</span><input type="text" class="inputtxt2" disabled="disabled"
						value="${pd.SEX}" maxlength="50"></li>
					<li><span>出生日期：</span><input type="text" class="inputtxt2" disabled="disabled"
						value="${pd.BRITH_DATE}" maxlength="50"></li>
					<li><span>参加工作年份：</span><input type="text" class="inputtxt2"  disabled="disabled"
						value="${pd.WORK_DATE }" maxlength="50"></li>
					<li><span>婚姻状况：</span><input type="text" class="inputtxt2"disabled="disabled"
						value="${pd.MARITAL_STATUS }" maxlength="50"></li>
					<li><span>国家或地区：</span><input type="text" class="inputtxt2"disabled="disabled"
						value="${pd.AREA }" maxlength="50"></li>
					<li><span>证件类型：</span><input type="text" class="inputtxt2"disabled="disabled"
						value="${pd.CERTIFICATE_TYPE}" maxlength="50"></li>
					<li><span>证件号码：</span><input type="text" class="inputtxt2"disabled="disabled"
						value="${pd.CERTIFICATE_NUM}" maxlength="50"></li>
					<li><span>海外工作经历：</span><input type="text" class="inputtxt2"disabled="disabled"
						value="${pd.OVERSEAS_WORK}" maxlength="50"></li>
					<li><span>政治面貌：</span><input type="text" class="inputtxt2"disabled="disabled"
						value="${pd.POLITICAL_AFFILIATE }" maxlength="50"></li>
					<li><span>户口所在地：</span><input type="text" class="inputtxt2"disabled="disabled"
						value="${pd.REGISTERED_RESIDENCE }" maxlength="50"></li>
					<li><span>居住地：</span><input type="text" class="inputtxt2"disabled="disabled"
						value="${pd.RESIDENCE }" maxlength="50"></li>

					<li><span>学历：</span><input type="text" class="inputtxt2"disabled="disabled"
						value="${pd.EDUCATION}" maxlength="50"></li>
					<li><span>联系方式：</span><input type="text" class="inputtxt2"disabled="disabled"
						value="${pd.CONTACT_INFO}" maxlength="50"></li>
					<li><span>电子邮箱：</span><input type="text" class="inputtxt2"disabled="disabled"
						value="${pd.MAIL}" maxlength="50"></li>
				</ul>
			</div>
			<h2 style="margin-top:20px;">自我评价</h2>
			<div class="input_class">
				<ul>
					<li style="width:90%;height: auto;"><textarea class="inputtxt2 tt" disabled="disabled"
						maxlength="50" style="width:100%;">${cvpd.SELF_APPRAISAL}</textarea>
            		</li>
            	</ul>
            </div>
            <h2 style="margin-top:20px;">求职意向</h2>
            <div class="input_class">
				<ul>
					<li><span>期望工作性质：</span><input type="text" class="inputtxt2"
						disabled="disabled" value="${cvpd.WORKTYPE}" maxlength="50"></li>
					<li><span>期望从事行业：</span><input type="text" class="inputtxt2 n-tit1"
						disabled="disabled"
						value="<c:if test="${cvpd.INDEUSTRY1 != null}">${cvpd.INDEUSTRY1}</c:if><c:if test="${cvpd.INDEUSTRY2 !=null}">,${cvpd.INDEUSTRY2}</c:if><c:if test="${cvpd.INDEUSTRY3 !=null}">,${cvpd.INDEUSTRY3}</c:if><c:if test="${cvpd.INDEUSTRY4 !=null}">,${cvpd.INDEUSTRY4}</c:if><c:if test="${cvpd.INDEUSTRY5 !=null}">,${cvpd.INDEUSTRY5}</c:if>"
						maxlength="50"></li>
					<li><span>期望从事职业：</span><input type="text" class="inputtxt2"
						disabled="disabled" value="${cvpd.INDEUSTRY }" maxlength="50"></li>
					<li><span>期望月薪(税前)：</span><input type="text" class="inputtxt2"
						disabled="disabled" value="${cvpd.SALARY}" maxlength="50"></li>
					<li><span>工作状态：</span><input type="text" class="inputtxt2"
						disabled="disabled" value="${cvpd.WORKINGSTATE }" maxlength="50"></li>
					<li><span>期望工作地：</span><input type="text" class="inputtxt2"
						disabled="disabled" value="${cvpd.PROVINCE}&nbsp;${cvpd.CITY}"
						maxlength="50"></li>

				</ul>
			</div>
			<h2 style="margin-top:20px;">语言能力</h2>
            <div class="input_class">
            	<ul>
            		<c:if test="${not empty languagepdList}">
            			<c:forEach items="${languagepdList}" var="var" varStatus="vs">
            				<li style="width:80%;margin-left:50px;">
            					<input type="text" class="inputtxt2" style="width:80%" disabled="disabled" value="外语语种&nbsp;:&nbsp;${var.languages }&nbsp;/&nbsp;读写能力&nbsp;:&nbsp;${var.read_write_skill}&nbsp;/&nbsp;听写能力&nbsp;:&nbsp;${var.listen_say_skill}" maxlength="50">
            				</li>
            			</c:forEach>
            		</c:if>
					<c:if test="${empty languagepdList}">
						<li style="width:80%">
							无
						</li>
					</c:if>
            	</ul>
            </div>
            <h2 style="margin-top:20px;">教育经历</h2>
            <div class="input_class">
            	<ul>
            		<c:if test="${not empty ediucationpdList}">
	            		<c:forEach items="${ediucationpdList}" var="var" varStatus="vs">
							<li style="width:80%;margin-left:50px;" >
							<input class="inputtxt2" style="width:80%" readonly="readonly" value="${var.start_time} ～ ${var.end_time} ： ${var.school_name } / ${var.specialty } / ${var.education } / ${var.overseas_study}海外工作经历">
							</li>
						</c:forEach>
            		</c:if>
            		<c:if test="${empty languagepdList}">
						<li style="width:80%">
							无
						</li>
					</c:if>
            	</ul>
            </div>
            <h2 style="margin-top:20px;">工作经历</h2>
            <div class="input_class">
            	<ul>
            	 	<c:if test="${not empty experiencepdList}">
						<c:forEach items="${experiencepdList}" var="var" varStatus="vs">
							<li><span>单位名称：</span><input type="text" class="inputtxt2"
								disabled="disabled" value="${var.enterprise_name}"
								maxlength="50"></li>
							<li><span>时间：</span><input type="text" class="inputtxt2"
								disabled="disabled" value="${var.start_time } - ${var.end_time}"
								maxlength="50"></li>
							<li><span>公司性质：</span><input type="text" class="inputtxt2"
								disabled="disabled" value="${var.enterprise_nature }"
								maxlength="50"></li>
							<li><span>行业：</span><input type="text" class="inputtxt2"
								disabled="disabled" value="${var.industry_type}" maxlength="50"></li>
							<li><span>部门：</span><input type="text" class="inputtxt2"
								disabled="disabled" value="${var.department }" maxlength="50"></li>
							<li><span>职位：</span><input type="text" class="inputtxt2"
								disabled="disabled" value="${var.positions }" maxlength="50"></li>
							<li style="width: 97%; height: auto;"><span>工作描述：</span>
							<textarea class="inputtxt2 tt" disabled="disabled"
									style="width: 80%" maxlength="50">${var.job_description }</textarea></li>
							<li style="width: 98%; height: auto;"><span>下属人数：</span><input type="text" class="inputtxt2"
								disabled="disabled" value="${var.subordinates }" style="width: 80%" maxlength="50" ></li>
							<c:if test="${vs.index != experiencepdList.size()-1}">
								<li style="width: 98%; height: auto;"><hr class="resume"></li>
							</c:if>
						</c:forEach>
            	 	</c:if>
            		<c:if test="${empty experiencepdList}">
						<li style="width:80%">
							无
						</li>
					</c:if>
            	</ul>
            </div>
            <h2 style="margin-top:20px;">项目经验</h2>
            <div class="input_class">
	            <ul>
		            <c:if test="${not empty projectpdList}">
			            <c:forEach items="${projectpdList}" var="var" varStatus="vs">
							<li><span>项目名称：</span><input type="text" class="inputtxt2"
								disabled="disabled" value="${var.project_name }"
								maxlength="50"></li>
							<li><span>时间：</span><input type="text" class="inputtxt2"
								disabled="disabled" value="${var.start_time } - ${var.end_time}"
								maxlength="50" style="width: 260px;"></li>
							<li style="width: 98%; height: auto;"><span>开发工具：</span><input type="text" class="inputtxt2"
								disabled="disabled" value="${var.development_tool}" style="width: 80%"
								maxlength="50"></li>
							<li style="width: 98%; height: auto;"><span>涉及技术：</span><input type="text" class="inputtxt2"
								disabled="disabled" value="${var.technology}" style="width: 80%" maxlength="50"></li>
							<li style="width: 98%; height: auto;"><span>描述：</span><input type="text" class="inputtxt2"
								disabled="disabled" value="${var.job_description}" style="width: 80%" maxlength="50"></li>
							<li style="width: 98%; height: auto;"><span>职责：</span><input type="text" class="inputtxt2"
								disabled="disabled" value="${var.project_description}" style="width: 80%" maxlength="50"></li>
							<c:if test="${vs.index != projectpdList.size()-1}">
								<li style="width: 98%; height: auto;"><hr class="resume"></li>
							</c:if>
						</c:forEach>
		            </c:if>
		            <c:if test="${empty projectpdList}">
						<li style="width:80%">
							无
						</li>
					</c:if>
	            </ul>
            </div>
            <h2 style="margin-top:20px;">培训经历</h2>
            <div class="input_class">
            	<ul>
            		<c:if test="${not empty traingpdList}">
			            <c:forEach items="${traingpdList}" var="var" varStatus="vs">
							<li><span>培训机构：</span><input type="text" class="inputtxt2"
								disabled="disabled" value="${var.training_institutions }"
								maxlength="50"></li>
							<li><span>时间：</span><input type="text" class="inputtxt2"
								disabled="disabled" value="${var.start_time } - ${var.end_time}"
								maxlength="50" style="width: 260px;"></li>
							<li style="width: 98%; height: auto;"><span>证书：</span><input type="text" class="inputtxt2"
								disabled="disabled" value="${var.certificate}" style="width: 80%"
								maxlength="50"></li>
							<li style="width: 98%; height: auto;"><span>培训课程：</span><input type="text" class="inputtxt2"
								disabled="disabled" value="${var.course}" style="width: 80%" maxlength="50"></li>
							<c:if test="${vs.index != traingpdList.size()-1}">
								<li style="width: 98%; height: auto;"><hr class="resume"></li>
							</c:if>
						</c:forEach>
            		</c:if>
            		<c:if test="${empty traingpdList}">
						<li style="width:80%">
							无
						</li>
					</c:if>
            	</ul>
            </div>
            <h2 style="margin-top:20px;">IT技能</h2>
            <div class="input_class">
            	<ul>
            		<c:if test="${not empty itList}">
			            <c:forEach items="${itList}" var="var" varStatus="vs">
							<li style="width: 98%; height: auto;margin-left:50px;"><input type="text" class="inputtxt2"
								disabled="disabled" value="名称 : ${var.skill_name } / 使用时间 : ${var.use_month}(月) / 掌握程度 : ${var.skill_level}" style="width: 80%"
								maxlength="50"></li>
						</c:forEach>
            		</c:if>
            		<c:if test="${empty itList}">
						<li style="width:80%">
							无
						</li>
					</c:if>
            	</ul>
            </div>
            <h2 style="margin-top:20px;">荣誉证书</h2>
			<div class="input_class">
				<ul>
					<c:if test="${not empty certpdList}">
						<c:forEach items="${certpdList}" var="var" varStatus="vs">
							<li style="width: 98%; height: auto;margin-left:50px;"><input type="text" class="inputtxt2"
								disabled="disabled" value="名称 : ${var.certificate_name } / 证书取得时间 : ${var.get_time}" style="width: 80%"
								maxlength="50"></li>
						</c:forEach>
					</c:if>
					<c:if test="${empty certpdList}">
						<li style="width:80%">
							无
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<div class="modal_h20 fade bs-example-modal-sm" tabindex="-1"
		id="layhomewarn" role="dialog" aria-labelledby="mySmallModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="mySmallModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<p id="warntext">
						请登录后操作！点此&nbsp;<a
							href="/"
							class="button btn-succes"><bR
							style="text-decoration: underline">登录</b></a>
					</p>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog --></div>
	<div class='modal_h20 my-modal-alert' id='my-modal-job-alert'>
	      <div class='modal-dialog boxBodySmall'>
	          <div class='modal-content' style="width:350px;text-align:center;position:fixed;right:45%;bottom:50%;">
	              <div class='modal-body' id='modal-body-alert'>
	                  <img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;<label id="alertText">收藏成功!</label>
	              </div>
	          </div>
	      </div>
	</div>
	<div class="clear"></div>
	<!-- 中间部分结束 -->

	<script type="text/javascript"
		src="<%=basePath%>static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript"
		src="<%=basePath%>static/js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>shyl/js/jquery.tips.js"></script>
<script type="text/javascript">
	    function TipFav(divid) {
	    	// 简历用户Id
			var userId = $("#userId").val();
			// 简历Id
			var cvId =  $("#cvId").val();
	    	// TODO
	        $.post('<%=basePath%>company/collectResume.act', {userId:userId,cvId:cvId}, function (data) {
	        	if (data.result == '0') {
	        		$("#my-modal-job-alert .modal-content").css("width", "200px");
	                $("#alertText").text("收藏成功！");
	              	$('#my-modal-job-alert').show().delay(3000).fadeOut();
	        	} else if (data.result == '1') {
	        		$("#my-modal-job-alert .modal-content").css("width", "350px");
	            	$("#alertText").text("该简历已收藏，无需重复收藏！");
	         		$('#my-modal-job-alert').show().delay(3000).fadeOut();
	        	} else {
	        		$("#my-modal-job-alert .modal-content").css("width", "200px");
	                $("#alertText").text("收藏失败！");
	              	$('#my-modal-job-alert').show().delay(3000).fadeOut();
	        	}
	        });
	    }
</script>

	<!--<footer开始>-->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!--</footer结束>-->
	<div class="modaldel fade in" id="prompt" tabindex="-1" role="dialog"
		aria-labelledby="delresume" aria-hidden="false" data-backdrop="static"
		data-target="" style="display: none;">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						onclick="closePrompt();">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<p id="warntext">该简历不存在，请浏览其它！</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" onclick="closePrompt();"
						id="d">关闭</button>
				</div>
				<script type="text/javascript">
        		function closePrompt(){
        			if (navigator.userAgent.indexOf("Firefox") != -1 || navigator.userAgent.indexOf("Chrome") !=-1) {  
        		        window.open(location, '_self').close(); 
        		    } else {  
        		        window.opener = null;  
        		        window.open("", "_self");  
        		        window.close();  
        		    }  
					}
				</script>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			if ($("#cvId").val() == "") {
				$("#prompt").modal('show');
			}
		})
	</script>
</body>

</html>