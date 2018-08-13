<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>接发包_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">
<jsp:include page="../common/header.jsp"><jsp:param
		name="id" value="zhfw" /></jsp:include>
<link href="/SHYL/shyl/css/maincss/css.css" rel="stylesheet"
	type="text/css">
<link href="/SHYL/shyl/css/maincss/fuwu.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" href="shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/styleRegist.css">
<link rel="stylesheet" href="shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet"
	href="shyl/fileupload/css/jquery.fileupload-ui.css">
<link rel="stylesheet" href="shyl/css/font-awesome.css">
<link rel="stylesheet" href="shyl/css/non-responsive.css">
<script src="/SHYL/shyl/js/mainjs/box.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<style type="text/css">
th {
	text-align: right;
}

.modify {
	padding: 5px 10px;
	margin: 0 2px;
	border-radius: 3px;
	padding-left: 26px;
	color: #818590;
	font-size: 12px;
}
</style>
</head>

<body>
	<!--<header开始>-->
	<!--</header结束>-->
	<!--<banner开始>-->
	<div id="main" class="mbanner">
	<input type="hidden" name="number" id="number" value="${num.num}"/>
		<ul class="b2">
		<c:choose>
	        <c:when test="${not empty bannerList}">
	    		
	    		<c:forEach items="${bannerList}" var="banner" varStatus="vs">
	    			<li><a title="" target=""><img src="<%=basePath%>images/${banner.file_path}" style="width:1920px;height:430px;"></a></li>
	    		</c:forEach>
	    	</c:when>
	    	<c:otherwise>
			<li><img src="<%=basePath%>shyl/images/banner/services.jpg"></li>
			<li><img src="<%=basePath%>shyl/images/banner/services2.jpg"></li>
			<li><img src="<%=basePath%>shyl/images/banner/services3.jpg"></li>
		</c:otherwise>
		</c:choose>
		</ul>
		<div class="num">
			<ul>
			</ul>
		</div>
	</div>
	<script>
	var number = $('#number').val();
	var width_banner = '';
	if(number == 0){
		width_banner = -3*10;
	}else{
		width_banner = -number*10;
	}
$('.num').css("margin-left",width_banner);
$(".mbanner").slide({ titCell:".num ul" , mainCell:".b2" , effect:"fold", autoPlay:true, delayTime:500 , autoPage:true });
</script>
	<!--</banner结束>-->
	<div class="clear"></div>
	<div class="mfuwu">
		<div class="mauto">
			<div class="txtScroll-left">
				<a href="<%=basePath%>integrated/requirementList.act" class="more">更多 &raquo;</a>
				<div class="bd">
					<ul class="infoList">
						<c:choose>
							<c:when test="${not empty projectRequirementList}">
								<c:forEach items="${projectRequirementList}" var="var"
									varStatus="vs">
									<li><a
										href="<%=basePath%>requirementdetail/projectDetailinfo.act?Id=${var.PROJECT_ID}&flag=true"
										target="_blank"><span>${var.publish_date}</span>${var.project_title}</a></li>
								</c:forEach>
							</c:when>
						</c:choose>
						<c:choose>
                            <c:when test="${not empty personnelRequirementList}">
                                <c:forEach items="${personnelRequirementList}" var="var"
                                    varStatus="vs">
                                    <li><a
                                        href="<%=basePath%>requirementdetail/personnelDetailinfo.act?Id=${var.PERSONNEL_ID}&flag=true"
                                        target="_blank"><span>${var.publish_date}</span>${var.personnel_title}</a></li>
                                </c:forEach>
                            </c:when>
                        </c:choose>
					</ul>
				</div>
			</div>
			<script id="jsID" type="text/javascript">
		 var ary = location.href.split("&");
		jQuery(".txtScroll-left").slide( { titCell:".hd ul",mainCell:".bd ul",autoPage:true,effect: "left",autoPlay:"true",scroll:"3",vis:"3",easing:"swing",delayTime:"500",pnLoop:"true",trigger:"mouseover" });
		</script>
		</div>
	</div>
	<div class="clear"></div>
	<div class="mauto">
	    <c:if test="${pd.latest_project_id != null}">
		<div class="mauto_best">
			<div class="icon_001"></div>
			<div class="mauto_best_l">
				<p style="color: red">
					<a
						href="<%=basePath%>requirementdetail/projectDetailinfo.act?Id=${pd.latest_project_id}&flag=true"
						style="color: #016ab9;">${pd.latest_project_title} </a>
				</p>
				<p style="font-size: 14px; color: #999;">
					<a
						href="<%=basePath%>company/info.act?companyId=${pd.latest_publish_company_id}"
						style="color: #999;"
						onmouseover="this.style.cssText='color:black;'"
						onmouseout="this.style.cssText='color:#999'">${pd.latest_publish_company_name}
					</a>&nbsp&nbsp${pd.latest_publish_date}
				</p>
				<div class="mauto_best_1">
					<i>剩余<b>${pd.latest_project_days}</b>天<span>招标周期</span></i> <i><b>${pd.latest_project_month}</b>个月<span>项目时间</span></i>
					<i><b>${pd.latest_price}</b>万元<span>项目金额</span></i>
				</div>
			</div>
			<div class="mauto_best_r">
				<i><span>${pd.latest_rate_project}%</span>投标进度</i>
				<div class="jindu">
					<b style="width: ${pd.latest_rate_project}%; margin-bottom:6px"></b>
				</div>
				<a id="ljzb" data-toggle='modal' data-target=''
					onclick="logint('${pd.latest_project_id}',2,'${pd.latest_publish_company_id}');">立即竞标</a>
			</div>
		</div>
		</c:if>
		<div class="mfuwu_tab">
		<input type="hidden" id="defaultIndex" value="${pd.flag}">
		<form action="<%=basePath%>integrated/integratedIndex.act?flag=0" id="formA" name="formA" method="post"></form>
			<div class="mfuwu_box">
				<div class="hd">
					<ul>
						<li onclick="cutTab('项目竞标');">竞标项目（<i>${pd.project_count}</i>）<span
							class="arrow"></span></li>
						<li id="renyuan";onclick="cutTab('人员竞标');">人员（<i>${pd.personnel_count}</i>）<span
							class="arrow"></span></li>
					</ul>
				</div>
				<div class="bd">
					<ul>
						<c:choose>
							<c:when test="${not empty projectRequirementList}">
								<c:forEach items="${projectRequirementList}" var="var"
									varStatus="vs">
									<c:if test="${var.PROJECT_ID != pd.latest_project_id}">
									<li>
										<div class="mauto_best_l">

											<p style="color: red">
												<a
													href="<%=basePath%>requirementdetail/projectDetailinfo.act?Id=${var.PROJECT_ID}&flag=true"
													style="color: #016ab9;">${var.project_title} </a>
											</p>
											<p style="font-size: 14px; color: #999;">
												<a
													href="<%=basePath%>company/info.act?companyId=${var.PUBLISH_COMPANY_ID}"
													style="color: #999;"
													onmouseover="this.style.cssText='color:black;'"
													onmouseout="this.style.cssText='color:#999'">${var.PUBLISH_COMPANY_NAME}
												</a>&nbsp&nbsp${var.publish_date}
											</p>
											<div class="mauto_best_1">
												<i>剩余<b>${var.project_days}</b>天<span>招标周期</span></i> <i><b>${var.PROJECT_MONTH}</b>个月<span>项目时间</span></i>
												<i><b>${var.PRICE}</b>万元<span>项目金额</span></i>
												<div class="jdleft">
													<div class="jindu">
														<b style="width: ${var.rate_project}%"></b>
													</div>
													<p>
														<span>${var.rate_project}%</span>投标进度
													</p>
												</div>
											</div>
										</div>
										<div class="mauto_best_r">
											<i>100%保障</i> <a href="javascript:;" class="more"
												data-toggle='modal' data-target='' class='modify'
												onclick="logint('${var.PROJECT_ID}',2,'${var.PUBLISH_COMPANY_ID}');"
												id="ljzb">立即竞标</a>
										</div>
									</li>
									</c:if>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="7" style="text-align:center;">
                                    <span style="color: #ff6a00">没有相关数据</span></td>
								</tr>
							</c:otherwise>
						</c:choose>
						<c:if test="${pd.project_count ne 0 or pd.personnel_count ne 0}">
							<a href="<%=basePath%>integrated/requirementList.act?cuttab=1" class="ckgdxm">查看更多项目>></a>
						</c:if>
					</ul>
					<ul>
						<c:choose>
							<c:when test="${not empty personnelRequirementList}">
								<c:forEach items="${personnelRequirementList}" var="var"
									varStatus="vs">
									<li>
										<div class="mauto_best_l">
											<p>
												<a
													href="<%=basePath%>requirementdetail/personnelDetailinfo.act?Id=${var.PERSONNEL_ID}&flag=true"
													style="color: #016ab9;">${var.personnel_title} </a>
											</p>
											<p style="font-size: 14px; color: #999;">
												<a
													href="<%=basePath%>company/info.act?companyId=${var.PUBLISH_COMPANY_ID}"
													style="color: #999;"
													onmouseover="this.style.cssText='color:black;'"
													onmouseout="this.style.cssText='color:#999'">${var.PUBLISH_COMPANY_NAME}
												</a>&nbsp&nbsp${var.publish_date}
											</p>
											<div class="mauto_best_1">
												<i>剩余<b>${var.personnel_days}</b>天<span>招标周期</span></i> <i><b>${var.PROJECT_MONTH}</b>个月<span>项目时间</span></i>
												<i><b>${var.REQUIREMENT_PERSONEL_COUNT}</b>人<span>需求人数</span></i>
												<div class="jdleft">
													<div class="jindu">
														<b style="width: ${var.rate_personnel}%"></b>
													</div>
													<p>
														<span>${var.rate_personnel}%</span>投标进度
													</p>
												</div>
											</div>
										</div> <input type="hidden" value="${var.PERSONNEL_ID}"
										id="personid">
										<div class="mauto_best_r">
											<i>100%保障</i> <a href="javascript:;" class="more"
												data-toggle='modal' data-target='' class='modify'
												onclick="logint('${var.PERSONNEL_ID}',1,'${var.PUBLISH_COMPANY_ID}');"
												id="ljzb">立即竞标</a>
										</div>
									</li>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="7" style="text-align:center;">
                                    <span style="color: #ff6a00">没有相关数据</span></td>
								</tr>
							</c:otherwise>
						</c:choose>
						<c:if test="${pd.project_count ne 0 or pd.personnel_count ne 0}">
							<a href="<%=basePath%>integrated/personnelInfoList.act?cuttab=2" class="ckgdxm">查看更多项目>></a>
						</c:if>
					</ul>
				</div>
			</div>

			<script id="jsID" type="text/javascript">
	 var ary = location.href.split("&");
	jQuery(".mfuwu_box").slide( { effect:"fade",autoPlay:"false",trigger:"click",easing:"swing",delayTime:"500",pnLoop:"true" ,defaultIndex:$("#defaultIndex").val() });
	</script>
		</div>
	</div>
	<!-- 人员竞标模态框 -->
	<div class="modal fade in" id="wtht" role="dialog"
		aria-labelledby="adoptModal" aria-hidden="false"
		data-backdrop="static">

		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						人员竞标<small> </small>
					</h4>
				</div>
				<form class="form-horizontal" role="form" action="" method="post"
					id="form1" name="form1">

					<table class="table">
						<tbody>
							<tr>
								<th style="line-height: 40px"><span class="red_tip">*</span>联系人：</th>
								<td colspan="3"><input class="inputtxt2" data-val="true"
									data-val-length="长度<50" data-val-length-max="50"
									data-val-required="*" id="Name" name="Name" type="text"
									maxlength="50" value="" onblur="trim(this);"> <span
									class="field-validation-valid" data-valmsg-for="School"
									data-valmsg-replace="true"></span> <input type="hidden"
									id="CompanyName" /></td>
							</tr>
							<tr>
								<th style="line-height: 40px"><span class="red_tip">*</span>联系电话：</th>
								<td><input class="inputtxt2" data-val="true"
									data-val-length="长度<50" data-val-length-max="50"
									data-val-required="*" id="Phone" name="Phone" type="text"
									maxlength="50" value="" onblur="trim(this);"> <span
									class="field-validation-valid" data-valmsg-for="Major"
									data-valmsg-replace="true"></span></td>

							</tr>
							<tr>
								<th style="line-height: 40px"><span class="red_tip">*</span>E-mail：</th>
								<td><input class="inputtxt2" data-val="true"
									data-val-length="长度<50" data-val-length-max="50"
									data-val-required="*" id="Email" name="Email" type="text"
									maxlength="50" value="" onblur="trim(this);"> <span
									class="field-validation-valid" data-valmsg-for="Major"
									data-valmsg-replace="true"></span></td>

							</tr>
							<tr>
								<th style="line-height: 65px">竞标方案：</th>
								<td><textarea
										style="width: 700px; padding-left: 5px; background-color: #ecf0f9; border: 0; border-radius: 5px; font-size: 0.85em; resize: none !important;"
										rows="4" maxlength="500" id="Introduction" name="Introduction"></textarea></td>
							</tr>
							<tr>
								<th style="line-height: 40px">附&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;件：</th>
								<td>
									<div class="row">
										<div class="col-md-12">
											<div class="col-md-12">
												<div>
													<div class="form-group">
														<div class="col-sm-10">
															<input id="docname" style="margin-left:0px" class="inputtxt2" value=""></input>
															<span id="file_uploadCon"
																	class="btn btn-primary fileinput-button"
																	style=""> <span>浏览...</span> <input
																	type="file" id="file_upload" name="file_upload" multiple />
																</span>
														</div>
														<div class="col-sm-5" style="padding-left:50px;">
															<div class="caption" align="center" style="width: 100px;">
															</div>
															<p style="margin-left: -50px; font-size: 12px; margin-top: 5px"
															class="style1">（50M以内）支持的文件格式为.doc/.docx/.pdf/.xls/.xlsx/.ppt/.pptx/.txt/.jpg</p>
														</div>
														<input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="apply_report_path" name="apply_report_path" maxlength="255" type="hidden" value="" onblur="trim(this);" />
														<input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="apply_report_name" name="apply_report_name" maxlength="255" type="hidden" value="" onblur="trim(this);" />
													</div>
												</div>
											</div>
										</div>
									</div> <input type="hidden" value="" id="PERSONNEL_ID"> <input
									type="hidden" value="" id="PROJECT_ID">
							</tr>
						</tbody>
					</table>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" onclick="infosave()"
							id="make">确认</button>
						<button type="button" class="btn btn-default" onclick="Clear()">关闭</button>
					</div>
					<input type="reset" id="clearPersonalData" name="clearPersonalData" style="display:none">
				</form>
			</div>
		</div>
		<script type="text/javascript">
			function Clear(){
				$("#docname").val("");
				$('#wtht').modal('hide');
			}
			
			</script>

	</div>
	<!-- start -->
	<!-- 提交结果 -->
	<div class='modal my-modal-alert' id='success' style="display: none;">
		<div class='modal-dialog boxBodySmall'>
			<div class='modal-content'
				style="width: 150px; text-align: center; position: fixed; right: 40%; bottom: 60%;">
				<div class='modal-body' id='modal-body-alert'>
					<img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;竞标成功!
				</div>
			</div>
		</div>
	</div>
	<div class='modal my-modal-alert' id='error' style="display: none;">
		<div class='modal-dialog boxBodySmall'>
			<div class='modal-content'
				style="width: 150px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
				<div class='modal-body' id='modal-body-alert'>
					<img alt="" src="<%=basePath%>shyl/images/fail.png">&nbsp;&nbsp;竞标失败!
				</div>
			</div>
		</div>
	</div>
	<!-- end -->
	<!-- 确认到登录界面 -->
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
					<p id="warntext">
						请登录后操作！点此&nbsp;<a
							href="<%=basePath%>userLogin/goLogin.act?returnUrl=integrated/integratedIndex.act"
							class="button btn-succes"><b
							style="text-decoration: underline; color: #0a7295;">登录</b></a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- 无权访问 -->
	<div class="modal fade in" id="wqfw" role="dialog"
		aria-labelledby="deledu" aria-hidden="false" data-backdrop="static">
		<div class="modal-dialog  modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<h4>您无权进行此操作，请以企业用户登录！！</h4>
					<br> <br>
				</div>
				<input id="Conid" name="Conid" type="hidden" value="">
				<div class="modal-footer">
				<button id="EduButton" type="button" class="btn btn-success"
                        data-target="modal" onclick="wqfw()">确认</button>
					<input type="hidden" value="" id="delectinfoid">
				</div>
			</div>
		</div>
		<script type="text/javascript">
		function wqfw(){
			$("#wqfw").modal('hide');
		}
		</script>
	</div>
	<!-- 重复竞标 -->
	<div class="modal fade in" id="cfjb" role="dialog"
		aria-labelledby="deledu" aria-hidden="false" data-backdrop="static">
		<div class="modal-dialog  modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<h4>该项目已竞标 ，不能重复竞标</h4>
				</div>
				<input id="Conid" name="Conid" type="hidden" value="">
				<div class="modal-footer">
					<button id="EduButton" type="button" class="btn btn-success"
						data-target="modal" onclick="cfjb()">确认</button>
					<input type="hidden" value="" id="delectinfoid">
				</div>
			</div>
		</div>
		<script type="text/javascript">
		function cfjb(){
			$('#cfjb').modal('hide');
		}
		</script>
	</div>
	<!-- 自己发布的项目不能竞标 -->
	<div class="modal fade in" id="bnjb" role="dialog"
		aria-labelledby="deledu" aria-hidden="false" data-backdrop="static">
		<div class="modal-dialog  modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="modalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<h4>不能竞标自己发布的项目</h4>
				</div>
				<div class="modal-footer">
					<button id="confirm" type="button" class="btn btn-success"
						data-target="modal" onclick="bnjb()">确认</button>
				</div>
			</div>
		</div>
		<script type="text/javascript">
        function bnjb(){
            $('#bnjb').modal('hide');
        }
        </script>
	</div>
	<div class="clear"></div>
	<input type="hidden" value="${platUser.USER_ID}" id="loginstatus">
	<input type="hidden" value="${platUser.USER_TYPE}" id="user_type">
	<input type="hidden" value="<%=basePath%>integrated/uploadfj.act"
		id="renyuan1">
	<!--<footer开始>-->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!--</footer结束>-->
	<script type="text/javascript">
var eventText ='项目竞标';
function cutTab(text){
	eventText = text;
}

//判断用户登录状态
function logint(id,ids,publishId){
	if(ids==1){
		$("#PERSONNEL_ID").val(id);
		url='<%=basePath%>integrated/uploadfj.act';
		$("#renyuan1").val(url);
		var loginstatus=$("#loginstatus").val();
		var user_type=$("#user_type").val();
		if(loginstatus==""){
			$('#layhomewarn').modal('show');
		}
		if(loginstatus == publishId){
			$('#bnjb').modal('show');
			return;
		}
		if((user_type == 2 || user_type == 5) && loginstatus!=""){
			//动态设置名称
			$.ajax({
				type : "POST",
				url :  '<%=basePath%>integrated/bidStatusFlag.act',
				data : {
					user_id:loginstatus,
					PERSONNEL_ID:id
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
					console.log(data);
					if(data==null){
						$('#myModalLabel').html(eventText);
						$('#wtht').modal('show');
						appendhtml();
					}if(data!=null){
						//重复竞标
						$('#cfjb').modal('show');
					}
				}
			});	
		}else if(user_type==1||user_type==3||user_type==4){
			$("#wqfw").modal('show');
		}
	}else{
		$("#myModalLabel").text("项目竞标")
		$("#make").attr("onclick","proinfosave()");
		url='<%=basePath%>integrated/uploadfj.act';
		$("#renyuan1").val(url)
		$("#PROJECT_ID").val(id);
		var loginstatus=$("#loginstatus").val();
		var user_type=$("#user_type").val();
		if(loginstatus==""){
			$('#layhomewarn').modal('show');
		}
		if(loginstatus == publishId){
            $('#bnjb').modal('show');
            return;
        }
		if((user_type == 2 || user_type == 5) && loginstatus!=""){
			//动态设置名称
			$.ajax({
				type : "POST",	
				url :  '<%=basePath%>integrated/projectbid.act',
				data : {
					publish_company_id:loginstatus,
					project_id:id
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
					 if(data==null){
						 $('#myModalLabel').html(eventText);
						$('#wtht').modal('show');
						appendhtml();
					}if(data!=null){
						//重复竞标
						$('#cfjb').modal('show');
					}
				}
			});	
		}else if(user_type==1||user_type==3||user_type==4){
			$("#wqfw").modal('show');
		}
	}
}

//转到登录界面
function login(){
	window.location.href='<%=basePath%>userLogin/goLogin.act';
}
function appendhtml(){
	var loginstatus=$("#loginstatus").val();
	var PERSONNEL_ID=$("#PERSONNEL_ID").val();
	$.ajax({
		type : "POST",	
		url :  '<%=basePath%>integrated/infoshow.act',
		data : {
			user_id:loginstatus,
			PERSONNEL_ID:PERSONNEL_ID,
			tm : new Date().getTime()
		},
		dataType : 'json',
		cache : false,
		success : function(data) {
			$("#Name").val(data.contact);
			$("#Phone").val(data.contact_tel);
			$("#Email").val(data.mail);
			$("#CompanyName").val(data.company_name);
		}
	});
}
</script>

	<script type="text/javascript"
		src="<%=basePath%>shyl/js/jquery.tips.js"></script>
	<link rel="stylesheet"
		href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
	<link rel="stylesheet"
		href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
	<script
		src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
	<script
		src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
	<script
		src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
	<script
		src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
	<script src="<%=basePath%>shyl/js/mainjs/errImage.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		//上传附件
function openmy(){
	$('#success').hide();
}
function errorshow(){
	$('#error').hide();
}
		var tips=function(id,msg){
		$("#"+id).tips({
			side : 2,
			msg : msg,
			bg : '#AE81FF',
			time : 3
		});
	}
	//页面重新加载
	function Reload(flag){
		$("#formA").attr("action","<%=basePath%>integrated/integratedIndex.act?flag="+flag);
		$("#formA").submit();
	}		
		
	//文件上传check
	$("#file_upload").fileupload({
		 dataType :'iframe text',
		 autoUpload: true,
		 maxNumberOfFiles : 1,
		 maxFileSize: 50000000,
		 url: $("#renyuan1").val(),
         sequentialUploads: true
  
    }).bind('fileuploadchange', function (e, data) {
   	 			if(data.files.length > 1){
   	 			tips("docname", "只能上传一个文件。");
   	 		    return false;
	   	 }	
 	}).bind('fileuploaddone', function (e, data) {
	     	    console.log(data);
	 			if("no"==data.result){
	 			tips("docname", "请上传格式为.doc/.docx/.pdf/.xls/.xlsx/.ppt/.pptx/.txt/.jpg格式的文档文件。");
	 		    return false;
   	 }else if("nosize"==data.result){
		 tips("docname", "请上传文件大小在50M以内的文件。");
		 return false;
 	 } else {
	   		 $("#apply_report_path").val(data.result);
	   		 $("#apply_report_name").val(data.originalFiles[0].name);
	   		 $("#docname").val(data.originalFiles[0].name);
	   	 }
    });
	//人员竞标确定
	function infosave(){
		//取得所有上传图片的文件名
		//取得所有上传合同的路径
		var adoptPath = $("#apply_report_path").val();
		
		//取得所有上传合同的文件名
		var adoptNm = $("#apply_report_name").val();
	
		//信息ID
		var loginstatus=$("#loginstatus").val();
		var company_name=$("#CompanyName").val();
		
		var name=$("#Name").val();
		if ($.trim(name) == "") {
			$("#Name").tips({
				side : 2,
				msg : '请输入联系人名称',
				bg : '#AE81FF',
				time : 3
			});
			$("#Name").focus();
			$("#Name").val("");
			return false;
		}
		
		var Phone=$("#Phone").val();
		var Filter =/(^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$)|(^((\(\d{3}\))|(\d{3}\-))?(1[358]\d{9})$)/;
		if (Phone== "") {
			$("#Phone").tips({
				side : 2,
				msg : '请输入电话',
				bg : '#AE81FF',
				time : 3
			});
			$("#Phone").focus();
			return false;
		} else if (!(Filter.test(Phone))) {
			$("#Phone").tips({
				side : 2,
				msg : '请输入正确的联系电话格式',
				bg : '#AE81FF',
				time : 3
			});
			$("#Phone").focus();
			return false;
		}
		
		var Email=$("#Email").val();
		var EmailFilter =/^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT)$/;
		if (Email == "") {
			$("#Email").tips({
				side : 2,
				msg : '请输入邮箱',
				bg : '#AE81FF',
				time : 3
			});
			$("#Email").focus();
			return false;
		} else if (!(EmailFilter.test(Email))) {
			$("#Email").tips({
				side : 2,
				msg : '请输入正确的邮箱格式',
				bg : '#AE81FF',
				time : 3
			});
			$("#Email").focus();
			return false;
		}
		var PERSONNEL_ID=$("#PERSONNEL_ID").val();
		var Introduction=$("#Introduction").val();
		//通过Ajax向后台传值
		$.ajax({
			type : "POST",
			url : '<%=basePath%>integrated/upLoadfujian.act',
			data : {
				PERSONNEL_ID:PERSONNEL_ID,
				adoptPath : adoptPath,
				adoptNm : adoptNm,
				user_id:loginstatus,
				name:name,
				Phone:Phone,
				bid_company_name:company_name,
				Email:Email,
				Introduction:Introduction
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				if ("success" == data.result) {
					$('#wtht').modal('hide');
					$('#success').show()
					setTimeout("Reload(1)", 1000);
				} else {
					$('#error').show()
					setTimeout("errorshow()", 1000);
					$('#wtht').modal('hide');
				}
			}
		});
	}
	//项目竞标确定
	function proinfosave(){
		//取得所有上传图片的文件名
	    //var filePaths = new Array();
		//取得所有上传合同的路径
		var adoptPath = $("#apply_report_path").val();
		//取得所有上传合同的文件名
		var adoptNm = $("#apply_report_name").val();
		//信息ID
		var loginstatus=$("#loginstatus").val();
		var company_name=$("#CompanyName").val();
		var name=$("#Name").val();
		if ($.trim(name) == "") {
			$("#Name").tips({
				side : 2,
				msg : '请输入联系人名称',
				bg : '#AE81FF',
				time : 3
			});
			$("#Name").focus();
			$("#Name").val("");
			return false;
		}
		
		var Phone=$("#Phone").val();
		var Filter =/(^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$)|(^((\(\d{3}\))|(\d{3}\-))?(1[358]\d{9})$)/;
		if (Phone== "") {
			$("#Phone").tips({
				side : 2,
				msg : '请输入电话',
				bg : '#AE81FF',
				time : 3
			});
			$("#Phone").focus();
			return false;
		} else if (!(Filter.test(Phone))) {
			$("#Phone").tips({
				side : 2,
				msg : '请输入正确的联系电话格式',
				bg : '#AE81FF',
				time : 3
			});
			$("#Phone").focus();
			return false;
		}
		
		var Email=$("#Email").val();
		var EmailFilter = /^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT)$/;
		if (Email == "") {
			$("#Email").tips({
				side : 2,
				msg : '请输入邮箱',
				bg : '#AE81FF',
				time : 3
			});
			$("#Email").focus();
			return false;
		} else if (!(EmailFilter.test(Email))) {
			$("#Email").tips({
				side : 2,
				msg : '请输入正确的邮箱格式',
				bg : '#AE81FF',
				time : 3
			});
			$("#Email").focus();
			return false;
		}
		var PROJECT_ID=$("#PROJECT_ID").val();
		var Introduction=$("#Introduction").val();
		//通过Ajax向后台传值
		$.ajax({
			type : "POST",
			url : '<%=basePath%>integrated/upLoadprojectfujian.act',
				data : {
					PROJECT_ID : PROJECT_ID,
					adoptPath : adoptPath,
					adoptNm : adoptNm,
					user_id : loginstatus,
					name : name,
					Phone : Phone,
					bid_company_name : company_name,
					Email : Email,
					Introduction : Introduction
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
					if ("success" == data.result) {
						$('#wtht').modal('hide');
						$('#success').show()
						setTimeout("Reload(0)", 1000);
					} else {
						$('#error').show()
						setTimeout("errorshow()", 1000);
						$('#wtht').modal('hide');
					}
				}
			});
		}
	$('#wtht').on('hidden.bs.modal', function() {
		$("input[name='clearPersonalData']").trigger("click");
	});
	</script>
</body>
</html>
