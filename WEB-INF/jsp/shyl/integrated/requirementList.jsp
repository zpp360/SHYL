<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<title>接发包_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">
<link href="<%=basePath%>shyl/css/integrated/css.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>shyl/css/integrated/style.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/styleRegist.css">
<link rel="stylesheet" href="shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet"
	href="shyl/fileupload/css/jquery.fileupload-ui.css">
<link rel="stylesheet" href="shyl/css/font-awesome.css">
<link rel="stylesheet" href="shyl/css/non-responsive.css">
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<style type="text/css">
.th{
text-align: right;
}
</style>
</head>
<body style="background:#f7f7f7;">
    	<!-- 提交结果 -->
				<div class='modal my-modal-alert' id='success'
					style="display: none;">
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
<jsp:include page="../common/header.jsp"><jsp:param name="id" value="zhfw" /></jsp:include>
<!--竞标人员内容-->
<div class="w1100" style="margin-top:90px;">
  <div class="widget-toolbar">
    <ul>
      <li class="active" id="menu_li" onClick="cutTab('menu');">
      竞标项目（<i>${pd.project_count}</i>）
      <span class="arrow"></span></li>
      <li id="button_li" onclick="cutTab('button');">人员（<i>${pd.personnel_count}</i>）<span class="arrow"></span></li>
    </ul>
  </div>
  <form action="" method="post" name="Form" id="Form">
  <input name="cuttab" id="cuttab" type="hidden" value="${pd.cuttab}"/>
  <div id="menu_div" >
    <div class="bid-top">
        <div class="bid-left">
             <p class="bid-tit mt40 fl">搜索：             
             </p>
             <c:if test="${pd.type == '1' }">
                <c:set var="select2" value="selected"></c:set>
             </c:if>
             <c:if test="${pd.type == '2' }">
                <c:set var="select3" value="selected"></c:set>
             </c:if>
             <div class="fl mt30">
                <select id="select" name="select" class="searchbox">
	                <option value="1" ${select2 }>按项目</option>
	                <option value="2" ${select3 }>按公司</option>
                </select>
                <input type="text" id="search" name="searchKey" class="searchbox" style="width:200px;" value="${pd.content }"/>
                <input type="submit" class="sousuo" value="搜索"/>
             </div>
        </div>
        <div class="bid-right">
            <button id="xiangmu" type="button" data-toggle="modal" data-target="" onclick="checkAuthority('project');">发布</button>
        </div>
    </div>
    
    <!--竞标列表开始-->
    <c:set var="test" value="${projectRequirementList}"></c:set>
    <c:choose>
        <c:when test="${not empty projectRequirementList}">
        <c:forEach items="${projectRequirementList}" var="var" varStatus="vs">
        <div class="bid-cont">
        <div class="bid-list">
            <p class="bid-list-tit">
              <a href="<%=basePath%>requirementdetail/projectDetailinfo.act?Id=${var.PROJECT_ID}&flag=true">${var.project_title}
              </a>
            </p>
            <p style="font-size:14px; color:#999;">
              <a href="<%=basePath%>company/info.act?companyId=${var.PUBLISH_COMPANY_ID}" style="color:#999;"
                              onmouseover="this.style.cssText='color:black;'"
                              onmouseout="this.style.cssText='color:#999'">${var.PUBLISH_COMPANY_NAME}
              </a>&nbsp&nbsp${var.publish_date}
            </p>
            <!--项目进度-->
            <div class="fl">
                <div class="bid-one">
                    <p class="one-styles">剩余<span>${var.project_days}</span>天</p>
                    <p>招标周期</p>
                </div>
            </div>
            <span class="bid-border"></span> 
            <!--项目时间-->
            <div class="fl">
                <div class="bid-one">
                    <p class="one-styles"><span>${var.PROJECT_MONTH}</span>个月</p>
                    <p>项目时间</p>
                </div>
            </div>
            <span class="bid-border"></span>
            <!--项目金额-->
            <div class="fl">
                <div class="bid-one">
                    <p class="one-styles"><span>${var.PRICE}</span>万元</p>
                    <p>项目金额</p>
                </div>
            </div>
            <span class="bid-border"></span> 
            <!--投标进度-->
            <div class="fl">
                <div class="bid-two">
                    <div class="bid-two-jd">
                        <b style="width: ${var.project_progress}px;"></b>
                    </div>
                    <p class="two-style"><span class="fr">${var.rate_project}%</span><span class="fl">投标进度</span></p>
                </div>
            </div>
            <div class="fr">
                <div class="bid-list-right">
                    <i>100%保障</i>
                    <br>
                    <button class="ljjb" data-toggle='modal' class="more" data-target='' class='modify' onclick="logint('${var.PROJECT_ID}',2,'${var.PUBLISH_COMPANY_ID}');" id="ljzb">立即竞标</button>
                </div>
            </div>
            <div class="clear"></div>         
        </div>
        </div>
        </c:forEach>
        </c:when>
        <c:otherwise>
          <div class="bid-cont">
            <span style="color: #ff6a00; margin-left: 45%">没有相关记录</span>
          </div>
        </c:otherwise>
        </c:choose>
     <!--竞标列表开始-->
     <div class="page-header position-relative">
      <table style="width: 100%;">
          <tr>
              <td style="align: center;" align="center"><div
                      class="pagination"
                      style="padding-top: 15px; margin: 0 auto; font-size:12px; display: inline-block;">${page.platformPageStr}</div></td>
          </tr>
      </table>
     </div>
  </div>
  <!--竞标项目结束-->
  <div id="button_div" style="display:none">
    <div class="bid-top">
        <div class="bid-left">
             <p class="bid-tit mt40 fl">搜索：             
             </p>
             <c:if test="${pd.type == '1' }">
                <c:set var="select2" value="selected"></c:set>
             </c:if>
             <c:if test="${pd.type == '2' }">
                <c:set var="select3" value="selected"></c:set>
             </c:if>
             <div class="fl mt30">
                <select id="select" name="select2" class="searchbox">
                    <option value="1" ${select2 }>按项目</option>
                    <option value="2" ${select3 }>按公司</option>
                </select>
                <input type="text" id="search" name="searchKey2" class="searchbox" style="width:200px;" value="${pd.content }"/>
                <input type="submit" class="sousuo" value="搜索"/>
              </div>
        </div>
        <div class="bid-right">
            <button id="renyuan" type="button" data-toggle="modal" data-target="" onclick="checkAuthority('personnel');">发布</button>
        </div>
    </div>

    <!--竞标列表开始-->
    <c:choose>
        <c:when test="${not empty personnelRequirementList}">
        <c:forEach items="${personnelRequirementList}" var="var" varStatus="vs">
        <div class="bid-cont">
        <div class="bid-list">
            <p class="bid-list-tit">
              <a href="<%=basePath%>requirementdetail/personnelDetailinfo.act?Id=${var.PERSONNEL_ID}&flag=true">${var.personnel_title}
              </a>
            </p>
            <p style="font-size:14px; color:#999;">
              <a href="<%=basePath%>company/info.act?companyId=${var.PUBLISH_COMPANY_ID}" style="color:#999;"
                              onmouseover="this.style.cssText='color:black;'"
                              onmouseout="this.style.cssText='color:#999'">${var.PUBLISH_COMPANY_NAME}
              </a>&nbsp&nbsp${var.publish_date}
            </p>
            <!--项目进度-->
            <div class="fl">
                <div class="bid-one">
                    <p class="one-styles">剩余<span>${var.personnel_days}</span>天</p>
                    <p>招标周期</p>
                </div>
            </div>
            <span class="bid-border"></span> 
            <!--项目时间-->
            <div class="fl">
                <div class="bid-one">
                    <p class="one-styles"><span>${var.PROJECT_MONTH}</span>个月</p>
                    <p>项目时间</p>
                </div>
            </div>
            <span class="bid-border"></span>
            <!--项目金额-->
            <div class="fl">
                <div class="bid-one">
                    <p class="one-styles"><span>${var.REQUIREMENT_PERSONEL_COUNT}</span>人</p>
                    <p>需求人数</p>
                </div>
            </div>
            <span class="bid-border"></span> 
            <!--投标进度-->
            <div class="fl">
                <div class="bid-two">
                    <div class="bid-two-jd">
                        <b style="width:${var.personnel_progress}px"></b>
                    </div>
                    <p class="two-style"><span class="fr">${var.rate_personnel}%</span><span class="fl">投标进度</span></p>
                </div>
            </div>
            <div class="fr">
                <div class="bid-list-right">
                    <i>100%保障</i>
                    <br>
                    <button class="ljjb" data-toggle='modal' class="more" data-target='' class='modify' onclick="logint('${var.PERSONNEL_ID}',1,'${var.PUBLISH_COMPANY_ID}');" id="ljzb">立即竞标</button>
                </div>
            </div>
            <div class="clear"></div>         
        </div>
     </div>
     </c:forEach>
     </c:when>
     <c:otherwise>
          <div class="bid-cont">
            <span style="color: #ff6a00; margin-left: 45%">没有相关记录</span>
          </div>
     </c:otherwise>
     </c:choose>
   <!--人员结束-->
   <div class="page-header position-relative">
      <table style="width: 100%;">
          <tr>
              <td style="align: center;" align="center"><div
                      class="pagination"
                      style="padding-top: 50px; margin: 0 auto; font-size:12px; display: inline-block;">${page.platformPageStr}</div></td>
          </tr>
      </table>
  </div>
  </div>
  </form>
</div>
<!--<footer开始>-->
    <jsp:include page="../common/footer.jsp"></jsp:include>
<!--</footer结束>-->
<div class="modal fade bs-example-modal-sm" id="layhomewarn" role="dialog" aria-labelledby="mySmallModalLabel">
      <div class="modal-dialog modal-sm" style="margin-top:250px">
          <div class="modal-content">
              <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">
                      <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                  </button>
                  <h4 class="modal-title" id="mySmallModalLabel">提示</h4>
              </div>
              <div class="modal-body">
                  <p id="warntext">请登录后操作！点此&nbsp;
                  <a href="<%=basePath%>userLogin/goLogin.act?returnUrl=integrated/requirementList.act"
                          class="button btn-succes"><b style="text-decoration: underline">登录</b></a>
                  </p>
              </div>
          </div>
      </div>
</div>
<!-- 人员竞标模态框 -->
<div class="modal fade in" id="wtht" role="dialog"
			aria-labelledby="adoptModal" aria-hidden="false" data-backdrop="static">
			
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
											<th style="line-height: 40px"><span class="red_tip">&nbsp;&nbsp;&nbsp;&nbsp;*</span>联系人：</th>
											<td colspan="3"><input class="inputtxt2"
												data-val="true" data-val-length="长度<50"
												data-val-length-max="50" data-val-required="*" id="Name"
												name="Name" type="text" maxlength="50" value="" onblur="trim(this);">
												<span class="field-validation-valid"
												data-valmsg-for="School" data-valmsg-replace="true"></span>
												<input type="hidden" id="CompanyName"/>
											</td>
										</tr>
										<tr>
											<th style="line-height: 40px"><span class="red_tip">*</span>联系电话：</th>
											<td><input class="inputtxt2" data-val="true"
												data-val-length="长度<50" data-val-length-max="50"
												data-val-required="*" id="Phone" name="Phone" type="text" maxlength="50"
												value="" onblur="trim(this);"> <span
												class="field-validation-valid" data-valmsg-for="Major"
												data-valmsg-replace="true"></span></td>

										</tr>
										<tr>
											<th style="line-height: 40px"><span class="red_tip">&nbsp;&nbsp;&nbsp;&nbsp;*</span>E-mail：</th>
											<td><input class="inputtxt2" data-val="true"
												data-val-length="长度<50" data-val-length-max="50"
												data-val-required="*" id="Email" name="Email" type="text" maxlength="50"
												value="" onblur="trim(this);"> <span
												class="field-validation-valid" data-valmsg-for="Major"
												data-valmsg-replace="true"></span></td>

										</tr>
										<tr>
											<th style="line-height: 65px">&nbsp;&nbsp;&nbsp;竞标方案：</th>
											<td> <textarea style="width:700px;padding-left:5px;background-color:#ecf0f9;border:0;border-radius:5px;font-size:0.85em;resize:none!important;" rows="4" maxlength="500" id="Introduction" name="Introduction">${pd.introduction_detail}</textarea></td>
										</tr>
										<tr>
											<th style="line-height: 40px">&nbsp;&nbsp;附&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;件：</th>
											<td>
											<div class="row">
											<div class="col-md-12">
												<div>
													<div class="form-group">
														<div class="col-sm-12"style="padding-left:20px;">
															<input id="docname" class="inputtxt2" value=""
															 style="padding-left:5px;"
															>
															<span id="file_uploadCon"
																	class="btn btn-primary fileinput-button"
																	style=""> <span>浏览...</span> <input
																	type="file" id="file_upload" name="file_upload" multiple />
																</span>
														</div>
														<div class="col-sm-5" style="padding-left:20px;">
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
											<input type="hidden" value="" id="PERSONNEL_ID">
											<input type="hidden" value="" id="PROJECT_ID">
										</tr>
									</tbody>
								</table>
						</table>
						<div class="modal-footer">
							<button type="button" class="btn btn-success"
								onclick="infosave()" id="make">确认</button>
							<a ><button type="button" class="btn btn-default" onclick="Clear()"
								>关闭</button></a>
						</div>
						<input type="reset" id="clearPersonalData" name="clearPersonalData" style="display:none">
					</form>
				</div>
			</div>
			<script type="text/javascript">
			
			</script>
		</div>
		<!-- 确认到登录界面 -->
		<div class="modal fade bs-example-modal-sm" id="layhomewarn" role="dialog" aria-labelledby="mySmallModalLabel">
      <div class="modal-dialog modal-sm" style="margin-top:250px">
          <div class="modal-content">
              <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">
                      <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                  </button>
                  <h4 class="modal-title" id="mySmallModalLabel">提示</h4>
              </div>
              <div class="modal-body">
                  <p id="warntext">
                      请登录后操作！点此&nbsp;<a href="<%=basePath%>userLogin/goLogin.act?returnUrl=integrated/integratedIndex.act"
                          class="button btn-succes"><b
                          style="text-decoration: underline;color: #0a7295;">登录</b></a>
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
			$('#wqfw').modal('hide');
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
					<h4>该项目已竞标	，不能重复竞标</h4>
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
<input id="flag" type="hidden" value= ${pd.flag} />
<input type="hidden" value="${platUser.USER_ID}" id="loginstatus">
<input type="hidden" value="${platUser.USER_TYPE}" id="user_type">
<script type="text/javascript">
$(document).ready(function(){
	if($("#cuttab").val() == 2){
		$("#button_li").attr('class','');
        $("#menu_li").attr('class','');
        $('#button_li').addClass('active');
        $("#menu_div").hide();
        $("#button_div").show();
        $("#Form").attr('action','<%=basePath%>integrated/personnelInfoList.act');
    } else if($("#cuttab").val() == 1) {
    	$("#button_li").attr('class','');
        $("#menu_li").attr('class','');
        $('#menu_li').addClass('active');
        $("#button_div").hide();
        $("#menu_div").show();
    	$("#Form").attr('action','<%=basePath%>integrated/requirementList.act');
    }
	$('#wtht').on('hidden.bs.modal', function() {
		$("input[name='clearPersonalData']").trigger("click");
	});
});
</script>
<script>
function Clear(){
	$("#docname").val("");
	$('#wtht').modal('hide');
}
    $(document).ready(function(){
        if ($("#flag").val() == "personnel") {
            $("#button_li").attr('class','');
            $("#menu_li").attr('class','');
            $('#button_li').addClass('active');
            $("#menu_div").hide();
            $("#button_div").show();
            $("#Form").attr('action','<%=basePath%>integrated/personnelInfoList.act');
        } else {
        	$("#Form").attr('action','<%=basePath%>integrated/requirementList.act');
        }
	}); 
    //切换菜单
    function cutTab(type){
        $("#button_li").attr('class','');
        $("#menu_li").attr('class','');
        $('#'+type+'_li').addClass('active');
        if (type == "button") {
            window.location.href="<%=basePath%>integrated/personnelInfoList.act";
        } else {
        	window.location.href="<%=basePath%>integrated/requirementList.act";
        }
    }
    //查看发布权限
    function checkAuthority(flag) {
        // 账号未登录的情况
        if ($("#loginstatus").val() == "") {
               //$('#layhomewarn').modal('show');
               if (flag == "project") {
            	   $("#xiangmu").attr("data-target", "#layhomewarn");
               } else {
            	   $("#renyuan").attr("data-target", "#layhomewarn");
               }
               
               
               return;
        }
        var userType = $("#userType").val();
        if (userType == "2" || userType == "3" || userType == "5") {
        	if (flag == "project") {
        		window.location.href="<%=basePath%>requirement/toAddProjectRequirement.act?flag=0";
        	} else {
        		window.location.href="<%=basePath%>requirement/toAddProjectRequirement.act?flag=1";
        	}
        } else {
        	$("#warntext").html("对不起，您无权限操作此功能！");
            //$('#layhomewarn').modal('show');
            if (flag == "project") {
            	$("#xiangmu").attr("data-target", "#layhomewarn");
            } else {
            	$("#renyuan").attr("data-target", "#layhomewarn");
            }
        }
       }
    //***********************************************************************************//
    //模态框内容
    </script>
    <script>
    //判断用户登录状态
function logint(id,ids,publishId){
	if(ids==1){
		$("#PERSONNEL_ID").val(id);
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
					if(data==null){
						$('#wtht').modal('show');
						appendhtml();
					}if(data!=null){
						//重复竞标
						$('#cfjb').modal('show');
					}
				}
			});	
		}else if(user_type==1||user_type==3||user_type==4){
			$('#wqfw').modal('show');
		}
	}else{
		$("#myModalLabel").text("项目竞标")
		$("#make").attr("onclick","proinfosave()")
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
						$('#wtht').modal('show');
						appendhtml();
					}if(data!=null){
						//重复竞标
						$('#cfjb').modal('show');
					}
				}
			});	
		}else if(user_type==1||user_type==3||user_type==4){
			$('#wqfw').modal('show');
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
function openmy(){
	$('#success').hide();
}
function errorshow(){
	$('#error').hide();
}
</script>

<script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
		<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
		<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
		<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
		<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
		<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
		<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
		<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
		<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
		<script type="text/javascript">
		//上传附件
		var tips=function(id,msg){
		$("#"+id).tips({
			side : 2,
			msg : msg,
			bg : '#AE81FF',
			time : 3
		});
	}
//页面重新加载
function Reload(){
	window.location.reload();
}
	$("#file_upload").fileupload({
		 dataType :'iframe text',
		 autoUpload: true,
		 maxNumberOfFiles : 1,
		 maxFileSize: 50000000,
		 url: '<%=basePath%>integrated/uploadfj.act',
        sequentialUploads: true
	  }).bind('fileuploadchange', function (e, data) {
	 			if(data.files.length > 1){
	 			tips("docname", "只能上传一个文件。");
	 			return false;
 	 }	
    }).bind('fileuploaddone', function (e, data) {
   	 			if("no"==data.result){
   	 			tips("docname", "请上传格式为.doc/.pdf/.docx/.xls/.xlsx/.ppt/.pptx/.txt/.jpg格式的文档文件。");
	   	 } else if("nosize"==data.result){
	   		tips("docname", "请上传文件大小在50M以内的文件。");
	 } else {
	   		 $("#apply_report_path").val(data.result);
	   		 $("#apply_report_name").val(data.originalFiles[0].name);
	   		 $("#docname").val(data.originalFiles[0].name);
	   	 }
    });
	//人员竞标确定
	function infosave(){
		//取得所有上传图片的文件名
	    //var filePaths = new Array();
		//取得所有上传合同的路径
		var adoptPath = $("#apply_report_path").val();
		//取得所有上传合同的文件名
		var adoptNm = $("#apply_report_name").val();
	
		//信息ID
		var company_name=$("#CompanyName").val();
		var loginstatus=$("#loginstatus").val();
		
		var name=$("#Name").val();
		if (name == "") {
			$("#Name").tips({
				side : 2,
				msg : '请输入联系人名称',
				bg : '#AE81FF',
				time : 3
			});
			$("#Name").focus();
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
					$('#success').show();
				
				//	setTimeout("openmy()", 1000);
				//	$('#wtht').modal('hide');
					setTimeout("Reload()", 1000);
				//	Reload();
				} else {
					$('#error').show();
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
        if (name == "") {
            $("#Name").tips({
                side : 2,
                msg : '请输入联系人名称',
                bg : '#AE81FF',
                time : 3
            });
            $("#Name").focus();
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
                PROJECT_ID:PROJECT_ID,
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
					$('#success').show();	
					setTimeout("Reload()", 1000);
				} else {
					$('#error').show();
					setTimeout("errorshow()", 1000);
					$('#wtht').modal('hide');
				}
            }
        });
    }
	</script>
</body>
</html>
