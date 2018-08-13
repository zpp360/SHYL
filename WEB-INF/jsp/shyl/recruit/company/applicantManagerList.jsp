<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>应聘者_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<jsp:include page="../../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/styleRegist.css" />

<script src="<%=basePath%>shyl/js/datepicker/WdatePicker.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<style type="text/css">
.a-upload {
    padding: 4px 10px;
    height: 20px;
    line-height: 20px;
    position: relative;
    cursor: pointer;
    color: #888;
    background: #fafafa;
    border: 1px solid #ddd;
    border-radius: 4px;
    overflow: hidden;
    display: inline-block;
    padding: 6px 12px;
    *display: inline;
    *zoom: 1
}
.a-upload  input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
    filter: alpha(opacity=0);
    cursor: pointer
}
.styleRight{
	text-align: right;
	width: 200px;
	min-width: 200px;
}
.styleRightT{
	text-align: right;
}
.tds {
    word-break: keep-all;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    display:block;
}
</style>
</head>
<body id="top" style="background-color: #f7f7f7;">
<div class="clear"></div>
<div class="register-box p0">
	<div class="rticon"></div>
	<jsp:include page="../../common/left.jsp"><jsp:param value="4" name="menuType"/></jsp:include>
		<div class="mypage_right" style="min-height:920px;">
			<h2>应聘者</h2>
			<div class="jianli">
			<div class="panel-heading">
				<form action="<%=basePath%>company/toApplicantList.act" class="form-inline" method="post" id="formId">                <div class="form-group">
				                    <label>简历状态：</label>
				                    <div class="form-group">
				                            <input type="checkbox" onclick="checkSelect()" value="0" name="isRead" id="boxUnRead" <c:if test="${fn:contains(pd.checkBoxFlag, 0)}">checked</c:if>/> <span>&nbsp;未阅览&nbsp;&nbsp;</span>
				                            <input type="checkbox" onclick="checkSelect()" value="1" name="isRead" id="boxHaveRead" <c:if test="${fn:contains(pd.checkBoxFlag, 1)}">checked</c:if>/><span>&nbsp;已阅览&nbsp;&nbsp;</span>
				                            <input type="hidden" name="checkBoxFlag" value="${pd.checkBoxFlag}" id="checkBoxFlag">
				                            <input type="hidden" id="infoID"  name="infoID" value="${pd.RECRUITMENT_INFO_ID}"/>
				                    </div>
				                </div>
				                <div class="form-group">
				                    <label>姓名：</label>
				                    <div class="form-group">
				                        <input class="inputtxt2" style="width:100%;" maxlength="50" id="Snames" name="Snames" type="text" value="${pd.Snames}"/>
				                    </div>
				                </div>
				                <div class="form-group">
				                    &nbsp;
				                    <input type="submit" class="sbtnNew" value="搜索" style="margin-top:0px;line-height: 46px;height: 46px;color: #ffffff;margin-left: 20px;">
				                </div>
				</form>        
        </div>
         <div class="panel panel-default">
				<div class="panel-heading" style="border:0px;">
                <h5 style="font-size: 15px; padding: 0; margin: 0; text-align: center"><b>${pd.POSITION_NAME}</b></h5>
                </div>
         </div>
					<table class="tableclass">
						<thead>
							<tr>
								<th style="padding-left: 30px; text-align: left; width: 15%;">应聘者</th>
								<th style="text-align: center; width: 20%;">应聘日期</th>
								<th style="text-align: center; width: 15%;">录用审批</th>
								<th style="text-align: center; width: 10%;">阅览状态</th>
								<th style="text-align: center; width: 38%;">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty applicantManagerList}">
								<tr>
									<td colspan="4" style="text-align: center;"><span
										style="color: #ff6a00">没有相关记录</span></td>
								</tr>
							</c:if>
							<c:choose>
						<c:when test="${not empty applicantManagerList}">
						<c:forEach items="${applicantManagerList}" var="var" varStatus="vs">
						<input id="postion_id${vs.index}" type="hidden" name="field_name" value="value">
						    <tr>
                                <td class="tds" style="width:150px;padding-left: 30px; text-align: left;" title="${var.NAME}">
								<a id="cv_id${vs.index}" href="javascript:void(0);" target="_blank" onclick="return showCv('cv_id${vs.index}','${var.USER_ID}','${var.CV_ID}');">
								${var.NAME}
								</a>							
							</td>
                                <td style="text-align: center;">${var.APPLY_DATE}</td>
                                <td style="text-align: center;">${var.ISADOPT}</td>
                                <td style="text-align: center;" id="resumeEvent">${var.BEEN_VIEWED}</td>
                                <td style="text-align: center;">
                                <c:if test="${var.IS_ADOPT == '0'}">
	                                <a data-toggle='modal' data-target='#adoptModal' class='modify' style="cursor: pointer;" onclick="openPic('${var.USER_ID}','${var.COMPANY_ID}');">修改证件</a>
	                                <a data-toggle='modal' data-target='#delCvSend' class="delete" style="cursor: pointer;" onclick="openDelCv('${var.USER_ID}','${var.COMPANY_ID}');">解聘</a>
	                                <c:if test="${var.is_record == '1'}">
                                		<a data-toggle="modal" data-target="#lookRecord" id="lookRecord_${var.USER_ID}" onclick="lookRecord('${var.USER_ID}','${pd.infoID}','${var.RECORD_ID}');" class='zview' style="cursor: pointer;">记录</a>
                                	</c:if>
                                </c:if>
                                <c:if test="${var.IS_ADOPT == '2'}">
	                                <a data-toggle='modal' data-target='#delCvSend' class="delete" style="cursor: pointer;" onclick="openDelCv('${var.USER_ID}','${var.COMPANY_ID}');">解聘</a>
                                </c:if>
                                <c:if test="${empty var.IS_ADOPT}">
	                                <c:if test="${empty var.STATUS}">
		                               <a data-toggle='modal' data-target='#notice' id = "notice_${var.USER_ID}" class='modify' onclick="notice('${pd.USERID}','${pd.POSITION_ID}','${var.RECORD_ID}','${var.USER_ID}');" style="cursor: pointer;">通知</a>
	                                </c:if>
	                                <c:if test="${var.STATUS == '0'}">
		                               <a data-toggle='modal' data-target='#tongyi' id ="tongyi_${var.USER_ID}" class='modify' onclick="tongyi('${var.start_time}','${var.end_time}','${var.description}');">已通知</a>
	                                </c:if>
	                                <c:if test="${var.STATUS == '1'}">
	                                	<c:if test="${not empty pdQQ.QQ}">
		                               		<a id = "mianshi" class='modify'  style="cursor: pointer;" href="tencent://message/?uin=${var.QQ}&Site=http://vps.shuidazhe.com&Menu=yes">面试</a>
	                                	</c:if>
	                                	<c:if test="${empty pdQQ.QQ}">
	                                	<label class="text-center" data-toggle="modal" id="favsqzw">
	                                		<a id = "mianshi" class='modify'  style="cursor: pointer;" href="#"onclick="Tip('favsqzw');">面试</a></label>
	                                	</c:if>
	                                </c:if>
	                                <c:if test="${var.STATUS == '2'}">
		                               <a data-toggle='modal' data-target='#yijujue' id = "yijujue_${var.USER_ID}" class='modify' onclick="yijujue('${pd.USERID}','${var.REASON}');" style="cursor: pointer;">已拒绝</a>
	                                </c:if>
	                                <a data-toggle='modal' data-target='#adoptModal' class='modify' onclick="updFile('${var.USER_ID}','${var.RECORD_ID}');" style="cursor: pointer;">通过</a>
	                                <a data-toggle="modal" data-target="#delSend" id="delSend_${var.USER_ID}" onclick="dels('${var.USER_ID}','${var.RECORD_ID}','delSend_${var.USER_ID}');" class="delete" style="cursor: pointer;">不通过</a>
	                                <c:if test="${var.is_record == null||var.is_record == ''}">
	                                	<a data-toggle="modal" data-target="#Work" id="insertRecord_${var.USER_ID}" class='zview' onclick="delTextContent('${var.USER_ID}','${pd.infoID}','${var.RECORD_ID}')" style="cursor: pointer;">填写</a>
                                	</c:if>
                                	<c:if test="${var.is_record == '1'}">
                                		<a data-toggle="modal" data-target="#lookRecord" id="lookRecord_${var.USER_ID}" onclick="lookRecord('${var.USER_ID}','${pd.infoID}','${var.RECORD_ID}');" class='zview' style="cursor: pointer;">记录</a>
                                	</c:if>
                                </c:if>
                                </td>
                            </tr>
						</c:forEach>
						</c:when>
				    </c:choose>  
						</tbody>
					</table>
			</div>
			<!-- 分页开始 -->
			<div class="page-header position-relative">
				<table style="width: 100%;">
					<tr>
						<td style="align: center;" align="center"><div
							class="pagination"
							style="padding-top: 15px; margin: 0 auto; font-size:12px; display: inline-block;">${page.platformPageStr}</div></td>
					</tr>
				</table>
			</div>
			<!-- 分页结束 -->
			
			        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-7">
            </div>
            <div class="col-sm-2"><a onclick="bind();" class="sback">返回</a></div>
        </div>
		</div>
	</div>
	
	<!-- 添加企业QQ -->
	<div class="modal fade bs-example-modal-sm" tabindex="-1"
		id="layhomewarn" role="dialog" aria-labelledby="mySmallModalLabel"
		aria-hidden="true">
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
						企业QQ为空！点此&nbsp;<a href="<%=basePath%>company/toCompanyUpdate.act"
							class="button btn-succes"><b
							style="text-decoration: underline">添加企业QQ</b></a>
					</p>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 面试通知 弹出框 -->
	<div class="modal fade bs-example-modal-sm in" id="notice"
		data-toggle="modal" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="false"
		data-target="">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="">
						面试通知<small> </small>
					</h4>
				</div>
				<form class="form-horizontal" role="form" action="<%=basePath%>company/addInterview.act" method="post"
					id="form2" name="form2">
					<table class="table">
								<tbody>
									<tr>
										<th style="line-height: 40px"><span class="red_tip">*</span>面试开始时间：</th>
										<td colspan="3">
										  <input class="inputtxt2" id="start_time" name="start_time" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowWeek:true});"
										  type="text" value="" />
										</td>
									</tr>
									<tr>
										<th style="line-height: 40px"><span class="red_tip">*</span>面试结束时间：</th>
										<td colspan="3">
										  <input class="inputtxt2" id="end_time" name="end_time" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowWeek:true});"
										  type="text" value="" />
										  <!-- 记录ID -->
										  <input type="hidden" id="interview_record_id" name="interview_record_id" value="">    
										  <!-- 招聘信息ID -->
										  <input type="hidden" id="interview_infoID" name="interview_infoID" value="">    
										  <!-- 招聘公司ID -->
										  <input type="hidden" id="recruitment_company_id" name="recruitment_company_id" value="">    
										  <!-- 招聘职位ID-->
										  <input type="hidden" id="recruitment_id" name="recruitment_id" value="">            
										  <!-- 招聘者ID-->
										  <input type="hidden" id="recruiters" name="recruiters" value="">                
										</td>
									</tr>
									<tr>
										<th style="line-height: 65px">描述：</th>
										<td> <textarea style="width:70%;padding-left:5px;background-color:#ecf0f9;border:0;border-radius:5px;font-size:0.85em;resize:none!important;" rows="4" maxlength="127" id=description name="description">${pd.introduction_detail}</textarea></td>
									</tr>
								</tbody>
							</table>
					<div class="modal-footer">
						<button type="button" class="btn btn-success"
							onclick="addInterview()" id="make">确认</button>
						<button type="button" class="btn btn-default"
						data-dismiss="modal">取消</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 面试 -->
	<div class="modal fade bs-example-modal-sm in" id="tongyi"
		data-toggle="modal" tabindex="-1" role="dialog" aria-hidden="false"
		data-target="">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						已通知<small> </small>
					</h4>
				</div>
				<form class="form-horizontal" role="form" action="" method="post"
					id="formt" name="formt">
					<table class="table">
						<tbody>
							<tr>
								<th style="line-height: 40px">面试开始时间：</th>
								<td colspan="3"><input class="inputtxt2"
									id="tongyi_start_time" name="tongyi_start_time" type="text" readonly /></td>
							</tr>
							<tr>
								<th style="line-height: 40px">面试结束时间：</th>
								<td colspan="3"><input class="inputtxt2"
									id="tongyi_end_time" name="tongyi_end_time" type="text" readonly /></td>
							</tr>
							<tr>
								<th style="line-height: 65px">描述：</th>
								<td><textarea
										style="width: 700px; padding-left: 5px; background-color: #ecf0f9; border: 0; border-radius: 5px; font-size: 0.85em; resize: none !important;"
										rows="4" maxlength="500" id="tongyi_description"
										name="tongyi_description" readonly></textarea></td>
							</tr>
						</tbody>
					</table>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 面试 -->
	<div class="modal fade bs-example-modal-sm in" id="yijujue"
			data-toggle="modal" tabindex="-1" role="dialog"
			aria-hidden="false"
			data-target="">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						面试<small> </small>
					</h4>
				</div>
				<form class="form-horizontal" role="form" action="" method="post"
					id="form1" name="form1">
					<table class="table">
								<tbody>
									<tr>
										<th style="line-height: 65px">拒绝理由：</th>
										<td> 
										    <textarea style="width:700px;padding-left:5px;background-color:#ecf0f9;border:0;border-radius:5px;font-size:0.85em;resize:none!important;" rows="4" maxlength="500" id="reason" readonly name="reason"></textarea>
										</td>
									</tr>
								</tbody>
							</table>
					<div class="modal-footer">
						<button type="button" class="btn btn-default"
						data-dismiss="modal">取消</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 确认不通过提示画面 -->
	<div class="modal fade bs-example-modal-sm in" id="delSend"
			data-toggle="modal" tabindex="-1" role="dialog"
			aria-labelledby="mySmallModalLabel" aria-hidden="false"
			data-target="">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						onclick="Clear()">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<p id="warntext">确认不通过此应聘者吗？</p>
				</div>
				<div class="modal-footer">
					<input type="hidden" id="recordId" value=""> <input
						type="hidden" id="user_id" value="">
					<button type="button" class="btn btn-success" onclick="Delete()"
						data-dismiss="modal">确认</button>
					<button type="button" class="btn btn-default"
						data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 解除劳动合同提示画面 -->
	<div class="modal fade bs-example-modal-sm in" id="delCvSend"
			data-toggle="modal" tabindex="-1" role="dialog"
			aria-labelledby="mySmallModalLabel" aria-hidden="false"
			data-target="">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						onclick="Clear()">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<p id="warntext">确认要解聘此员工吗？</p>
				</div>
				<div class="modal-footer">
					<input type="hidden" id="userCd" value=""> <input
						type="hidden" id="companyCd" value="">
					<button type="button" class="btn btn-success" onclick="delCvSend()"
						data-dismiss="modal">确认</button>
					<button type="button" class="btn btn-default"
						data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 合同 -->
	<div class='modal my-modal-alert' id='my-modal-success-alert' style="z-index: 10000">
        <div class='modal-dialog boxBodySmall'>
            <div class='modal-content' style="width:260px;text-align:center;position:fixed;right:40%;bottom:45%;">
                <div class='modal-body' id='modal-body-alert'>
                    <img alt="" src="<%=basePath%>shyl/images/mark.png">&nbsp;&nbsp;预览文件不存在!
                </div>
            </div>
        </div>
    </div>
    
    <!-- 用户审核提示 -->    
    <div class='modal my-modal-alert' id='my-modal-exit-alert' style="z-index: 10000">
        <div class='modal-dialog boxBodySmall'>
            <div class='modal-content' style="width:260px;text-align:center;position:fixed;right:40%;bottom:45%;">
                <div class='modal-body' id='modal-body-alert'>
                    <img alt="" src="<%=basePath%>shyl/images/mark.png">&nbsp;&nbsp;该用户已被审核过!
                </div>
            </div>
        </div>
    </div>
	
    <!-- 用户学位删除提示 -->
	<div class="modal fade in" id="delDegree"
		data-toggle="modal" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="false"
		data-target="" style="z-index: 100000">
		<div class="modal-dialog modal-sm" style="width: 370px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						onclick="Clear()">
						<span aria-hidden="true" onclick="cler()">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<p id="warntext">确认删除学位证吗？</p>
				</div>
				<div class="modal-footer">
					<input type="hidden" id="recordId" value=""> <input
						type="hidden" id="user_id" value="">
					<button type="button" class="btn btn-success" onclick="delDegree()"
						data-dismiss="modal">确认</button>
					<button type="button" class="btn btn-default"
						data-dismiss="modal" onclick="cler()">取消</button>
				</div>
			</div>
		</div>
		<script type="text/javascript">
		function cler(){
			$('#delDegree').attr("style","display:none");
		}
		</script>
	</div>
	
	<!-- 资料上传 -->
	<div class="modal fade in" id="adoptModal" role="dialog"
		aria-labelledby="adoptModal" aria-hidden="false" data-backdrop="static">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						资料上传<small> </small>
					</h4>
				</div>
				<form class="form-horizontal" role="form" action="" method="post"
					id="form1" name="form1">
					<input id="updid" name="updid" type="hidden" value="">
					<input id="recordId" name="recordId" type="hidden" value="">
					<input id="operationId" name="operationId" type="hidden" value="">
					<input id="comId" name="comId" type="hidden" value="">
					<table class="table">
						<tbody>
							<tr>
								<th><span class="red_tip">*</span>身份证：</th>
								<td>
									<div>
									    <input id="license_id" name="license_id" type="hidden" value=""/>
										<img id="weixin_show_id" name="weixin_show_id" onerror="showImgDelay(this,'<%=basePath%>shyl/images/img.png');" style="width: 158px; height: 170px;" src="<%=basePath%>shyl/images/img.png">
										<a href="javascript:;" class="a-upload" style="text-decoration:none; font-size:14px;background-color:#428bca; color:#ffffff;">上传本地图片<input type="file" id="weixin_image_id" placeholder="上传本地图片" name="weixin_image_id" multiple></a>
										<p><i style="font-size: 14px;">支持的文件格式为.gif、.jpeg、.jpg、.png</i></p>
									</div>
								</td>
								<th><span class="red_tip">*</span>毕业证：</th>
								<td>
									<div>
									    <input id="license_diploma" name="license_diploma" type="hidden" value=""/>
										<img id="weixin_show_diploma" name="weixin_show_diploma" onerror="showImgDelay(this,'<%=basePath%>shyl/images/img.png');" style="width: 158px; height: 170px;" src="<%=basePath%>shyl/images/img.png">
										<a href="javascript:;" class="a-upload" style="text-decoration:none; font-size:14px;background-color:#428bca; color:#ffffff;">上传本地图片<input type="file" id="weixin_image_diploma" placeholder="上传本地图片" name="weixin_image_diploma" multiple></a>
										<p><i style="font-size: 14px;">支持的文件格式为.gif、.jpeg、.jpg、.png</i></p>
									</div>
								</td>
							</tr>
							<tr>
								<th>学位证：</th>
								<td>
									<div>
									    <input id="license_degree" name="license_degree" type="hidden" value=""/>
										<img id="weixin_show_degree" name="weixin_show_degree" onerror="showImgDelay(this,'<%=basePath%>shyl/images/img.png');" style="width: 158px; height: 170px;" src="<%=basePath%>shyl/images/img.png">
										<a href="javascript:;" class="a-upload" style="text-decoration:none; font-size:14px; background-color:#428bca; color:#ffffff;">上传本地图片<input type="file" id="weixin_image_degree" placeholder="上传本地图片" name="weixin_image_degree" multiple></a>
										<div style="height: 25px;margin-top: 5px;display: none;" id="sc">
											<span><a onclick="deg();" class="delete">删除</a></span>
										</div>
										<p><i style="font-size: 14px;">支持的文件格式为.gif、.jpeg、.jpg、.png</i></p>
									</div>
								</td>
								<th><span class="red_tip">*</span>劳动合同：</th>
								<td>
									<div class="row">
										<div class="col-md-12">
											<div>
												<div class="form-group">
													<div class="col-sm-12">
														<ul id="docName">
															<span id="finame">${pg.file_name}</span>
															<span style="display: none;" id="xg"><a id="view" href='javascript:void(0);' target='_blank' onclick="return view('');" class='zview'>预览</a></span>
															<span style="display: none;" id="vl"><a id="viewL" href='javascript:void(0);' target='_blank' onclick="openL();" class='zview'>预览</a></span>
														</ul>
													</div>
													<div class="col-sm-5" style="margin-left: 7%">
														<div class="caption" align="center" style="width: 100px;">
															<span id="file_uploadCon" class="btn btn-primary fileinput-button" style="margin-top: 20px;">
																<span>上传本地合同</span>
																<input type="file" id="file_upload" name="file_upload" multiple />
																<input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="apply_report_path" maxlength="255" onblur="trim(this);" name="apply_report_path" type="text" value="" />
																<input style="height:0.5px;width:0px;padding:0px;margin:0px; position: absolute;" id="apply_report_name" maxlength="255" onblur="trim(this);" name="apply_report_name" type="text" value="" />
															</span>

														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="modal-footer">
						<button id="EduButton" type="button" class="btn btn-success"
							onclick="updateFile()">确认</button>
						<button type="button" class="btn btn-default" onclick="clear();" data-dismiss="modal">关闭</button>
					</div>
				</form>
			</div>
		</div>
	</div>
		
	<!-- 面试详情 -->
	<div class="modal_gh30 fade in" id="lookRecord" role="dialog"
		aria-labelledby="adoptModal" aria-hidden="false" data-backdrop="static">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						面试记录<small> </small>
					</h4>
				</div>
				<table class="table">
					<!-- 次数循环设置 -->
					<tbody id="interviewDetail">
						<tr>
							<td>
								<table class="table">
									<tr>
										<th style="text-align: center;background: #edeff5;color:red;">暂无记录</th>
									</tr>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
		
	<!-- 记录增加 -->
	<div class="modal_gh30 fade in" id="Work" role="dialog"
		aria-labelledby="adoptModal" aria-hidden="false" data-backdrop="static">
		<div id="workDiv" class="modal-dialog modal-lg" style="width: 750px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						记录填写<small></small>
					</h4>
				</div>
				<input type="hidden" value="" id="recordUserId"/>
				<input type="hidden" value="" id="recordId"/>
				<input type="hidden" value="" id="recordIdNumber"/>
				<table class="table">
					<!-- 次数循环设置 -->
					<tbody id="insertRecordForm">
						<tr>
							<th class="styleRightT" style="vertical-align: middle;width: 10%;"><span class="red_tip">*</span>面试日期：</th>
							<td style="vertical-align: middle;width: 40%;">
								<input class="inputtxt2 date_control" type="text"
									   value="${EducationPd.START_TIME}" 
									   name="record_date"
									   id="record_date" 
									   type="text" 
									   onFocus="WdatePicker({isShowWeek:true,dateFmt:'yyyy-MM-dd'});"
									   placeholder="面试日期" title="面试日期">
									   
								<span  class="field-validation-valid"
									   data-valmsg-for="record_date"
									   data-valmsg-replace="true"></span>
							</td>
							<th class="styleRightT" style="vertical-align: middle;width:10%;"><span class="red_tip">*</span>工作经验：</th>
							<td style="width: 40%;">
								<input id="record_work_experience" name="record_work_experience" maxlength="2" class="inputtxt2" type="text" style="width: 200px;float: left;width: 80%" onkeyup="value=value.replace(/[^0-9]/g,'')" />
								<div style="line-height:40px;float: left;">&nbsp;&nbsp;年</div>
								<span	class="field-validation-valid" 
										data-valmsg-for="record_work_experience"
										data-valmsg-replace="true">
								</span>
							</td>
						</tr>
						<tr>
							<th class="styleRightT" style="vertical-align: middle;"><span class="red_tip">*</span>开始时间：</th>
							<td>
								<input class="inputtxt2 date_control" type="text"
									   name="record_start_time"
									   id="record_start_time" 
									   type="text" 
									   onFocus="WdatePicker({isShowWeek:true,dateFmt:'HH:mm'});"
									   placeholder="开始时间" title="开始时间">
									   
								<span  class="field-validation-valid"
									   data-valmsg-for="record_start_time"
										data-valmsg-replace="true">
								</span>
							</td>
							<th class="styleRightT" style="vertical-align: middle;width:10%;"><span class="red_tip">*</span>结束时间：</th>
							<td>
								<input  class="inputtxt2 date_control" type="text"
										name="record_end_time"
										id="record_end_time"
										type="text" 
										onFocus="WdatePicker({isShowWeek:true,dateFmt:'HH:mm'});"
										placeholder="结束时间" title="结束时间">
								<span
										class="field-validation-valid" 
										data-valmsg-for="record_end_time"
										data-valmsg-replace="true">
								</span>
							</td>
						</tr>
						<tr>
							<th class="styleRightT" style="vertical-align: middle;width: 25%;"><span class="red_tip">*</span>期望薪资：</th>
							<td><input id="record_money" name="record_money" class="inputtxt2" type="text" style="width: 200px;" maxlength="9" 
							onkeyup="value=value.length<=9?value.replace(/[^0-9]/g,''):value.replace(/[^0-9]/g,'').substring(0,9)"/>
								<span 	class="field-validation-valid" 
										data-valmsg-for="record_money"
										data-valmsg-replace="true">
								</span>
								&nbsp;&nbsp;元
							</td>
							<th class="styleRightT" style="vertical-align: middle;width: 25%;"><span class="red_tip">*</span>现职状态：</th>
							<td>
								<select id="record_work_status" name="record_work_status" class="inputtxt2" style="width: 200px;" >
									<!-- 工作状态 -->
								</select>
							</td>
						</tr>
						<tr>
							<th class="styleRightT" style="vertical-align: middle;width: 25%;"><span class="red_tip">*</span>相关学历：</th>
							<td>
								<select  id="record_study_aptitude" name="record_study_aptitude"  class="inputtxt2" style="width: 200px;" >
								</select> 
							</td>
							<th class="styleRightT" style="vertical-align: middle;width: 25%;"><span class="red_tip">*</span>面试方式：</th>
							<td>
								<select id="record_type" name="record_type"  class="inputtxt2" style="width: 200px;">
								</select>
							</td>
						</tr>
						<tr>
							<th class="styleRightT" style="vertical-align: middle;width: 25%;"><span class="red_tip">*</span>面试评分：</th>
							<td>
								<select id="record_evaluate_grade" name="record_evaluate_grade"  class="inputtxt2" style="width: 200px;">
								</select> 
							</td>
							<th></th><td></td>
						</tr>
						<tr>
							<th class="styleRightT" style="vertical-align: middle;width: 25%;"><span class="red_tip">*</span>面试评价：</th>
							<td colspan="3">
								<textarea	id="record_evaluate"
											name="record_evaluate" 
											rows="0" cols="0"
											maxlength="200"
											onkeyup="value=value.length<=200?value:value.substring(0,200)" 
											style="max-width: 500px;min-width: 500px;height: 60px;"></textarea>
								<br />
								<span style="color:red;"></span>
								<span 	class="field-validation-valid" 
										data-valmsg-for="record_evaluate"
										data-valmsg-replace="true">
								</span>			
							</td>
						</tr>
					</tbody>
				</table>
				<div class="modal-footer">
					<button id="recordSubmitButton" type="button" class="btn btn-success"
						onclick="insertRecord()">确认</button>
					<button id="recordClearButton" type="button" class="btn btn-default" onclick="clear();" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
		
	<!-- 提示弹窗 SUCCESS-->
	<div class='modal my-modal-alert' id='success' style="display:none;">
           <div class='modal-dialog boxBodySmall'>
               <div class='modal-content' style="width:150px;text-align:center;position:fixed;right:40%;bottom:60%;">
                   <div class='modal-body' id='modal-body-alert'>
                       <img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;保存成功!
                   </div>
               </div>
           </div>
       </div>
	<!-- 提示弹窗 ERROR-->
	<div class='modal my-modal-alert' id='error' style="display: none;">
        <div class='modal-dialog boxBodySmall'>
            <div class='modal-content' style="width:150px;text-align:center;position:fixed;right:40%;bottom:45%;">
                <div class='modal-body' id='modal-body-alert'>
                    <img alt="" src="<%=basePath%>shyl/images/fail.png">&nbsp;&nbsp;保存失败!
                </div>
            </div>
        </div>
	</div>
		<div class='modal my-modal-alert' id='my-modal-errorfile-alert'>
		<div class='modal-dialog boxBodySmall'>
			<div class='modal-content'
				style="width: 260px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
				<div class='modal-body' id='modal-body-alert'>
					<div style="float:left;margin-bottom:15px;"><img alt="" src="<%=basePath%>shyl/images/mark.png"></div><div style="float:right;margin-right:50px;margin-top:5px;" id="warntext1"></div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
	<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css" ></link>
	<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css" /></link>
	<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
	<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
	
		<script type="text/javascript">
		//加载居中
		function setheight(thiss){
			var divheight = ($("#Work").height()-$("#Work").find("div").height())/2;
			$(thiss).css({
				"margin":divheight+"px auto;"	
			});
		}
		
		$(function() {
			
			$("#weixin_image_id").fileupload({
				dataType :'iframe text',
				autoUpload: true,
				maxNumberOfFiles : 1,
		        url: '<%=basePath%>company/uploadPic.act',
		        sequentialUploads: true
			 }).bind('fileuploadchange', function (e, data) {
				 if(data.files.length > 1){
					 $("#weixin_show_id").tips({
							side : 2,
							msg : '只能上传一张照片。',
							bg : '#AE81FF',
							time : 3
					 });
		             return false;
				 }
		    }).bind('fileuploaddone', function (e, data) {
		   	 if("no"==data.result){
		   		$("#weixin_show_id").tips({
					side : 2,
					msg : '请上传格式为.jpg/.jpeg/.png./gif格式的图片。',
					bg : '#AE81FF',
					time : 3
				});
		   		$("#weixin_show_id").attr("src","<%=basePath%>shyl/images/img.png");
				return false;
		   	 } else {
		   		 $("#weixin_show_id").attr("src","<%=basePath%>images/"+data.result);
		         document.getElementById("license_id").value=data.result;
		   	 }
		    });
			
			$("#weixin_image_diploma").fileupload({
				dataType :'iframe text',
				autoUpload: true,
				maxNumberOfFiles : 1,
		        url: '<%=basePath%>company/uploadPic.act',
		        sequentialUploads: true
			 }).bind('fileuploadchange', function (e, data) {
				 if(data.files.length > 1){
					 $("#weixin_show_diploma").tips({
							side : 2,
							msg : '只能上传一张照片。',
							bg : '#AE81FF',
							time : 3
					 });
		             return false;
				 }
		    }).bind('fileuploaddone', function (e, data) {
		   	 if("no"==data.result){
		   		$("#weixin_show_diploma").tips({
					side : 2,
					msg : '请上传格式为.jpg/.jpeg/.png./gif格式的图片。',
					bg : '#AE81FF',
					time : 3
				});
		   		$("#weixin_show_diploma").attr("src","<%=basePath%>shyl/images/img.png");
				return false;
		   	 } else {
		   		 $("#weixin_show_diploma").attr("src","<%=basePath%>images/"+data.result);
		         document.getElementById("license_diploma").value=data.result;
		   	 }
		    });
			
			$("#weixin_image_degree").fileupload({
				dataType :'iframe text',
				autoUpload: true,
				maxNumberOfFiles : 1,
		        url: '<%=basePath%>company/uploadPic.act',
		        sequentialUploads: true
			 }).bind('fileuploadchange', function (e, data) {
				 if(data.files.length > 1){
					 $("#weixin_show_degree").tips({
							side : 2,
							msg : '只能上传一张照片。',
							bg : '#AE81FF',
							time : 3
					 });
		             return false;
				 }
		    }).bind('fileuploaddone', function (e, data) {
		   	 if("no"==data.result){
		   		$("#weixin_show_degree").tips({
					side : 2,
					msg : '请上传格式为.jpg/.jpeg/.png./gif格式的图片。',
					bg : '#AE81FF',
					time : 3
				});
		   		$("#weixin_show_degree").attr("src","<%=basePath%>shyl/images/img.png");
				return false;
		   	 } else {
		   		 $("#weixin_show_degree").attr("src","<%=basePath%>images/"+data.result);
		         document.getElementById("license_degree").value=data.result;
		         $("#sc").show();
		   	 }
		    });
			
			$("#file_upload").fileupload({
				 autoUpload: true,
				 maxNumberOfFiles : 3,
				 url: '<%=basePath%>company/uploadContract.act',
		         sequentialUploads: true
			 }).bind('fileuploadchange', function (e, data) {
				 if(data.files.length > 1){
					 $("#file_uploadCon").tips({
						 side : 2,
						 msg : "只能上传一个文件。",
						 bg : '#AE81FF',
						 time : 2
					 });
		            return false;
				 }
		     }).bind('fileuploaddone', function (e, data) {
		    	 if("no"==data.result){
			   		 $("#file_uploadCon").tips({
							 side : 2,
							 msg : "请上传格式为.pdf格式的文件。",
							 bg : '#AE81FF',
							 time : 2
						 });
			   		 return false;
			   	 } else {
			   		 $("#apply_report_path").val(data.result);
			   		 $("#apply_report_name").val(data.originalFiles[0].name);
			   		 $("#finame").text(data.originalFiles[0].name);
			   		 $("#vl").show();
			   		 $("#xg").hide();
			   	 }
		     });
			
			// 获取当前录入数据量
			$("#record_evaluate").bind('input propertychange',function(){
				if(200-parseInt(($("#record_evaluate").val()).length)>=0){
					$("#record_evaluate").next().next().html("可录入："+(200-parseInt(($("#record_evaluate").val()).length))+"个字。");
				}else{
					$("#record_evaluate").next().next().html("已超出限定200字数。");
				}
			});
			
			
		});

		 function bind() {
		        location.href = "<%=basePath%>company/toJobManager.act";
		    }
		function openL(){
			var path = $("#apply_report_path").val();
			$("#viewL").attr('href','<%=basePath%>images/'+path);
		}
		
		function updFile(id,recordId){
			$("#updid").val(id);
			$("#recordId").val(recordId);
			$("#operationId").val("0");
		}
		//打开简历
		function showCv(id,USER_ID,cvId) {
				var ret=false;
		    	//通过Ajax向后台传值
				$.ajax({
					type : "POST",
					url :'<%=basePath%>'+'company/existCv.act',
					data : {
						userId : USER_ID,
						cvId : cvId
					},
					dataType : 'json',
					async:false, 
					success : function(data) {
						if(data.result=="0"){
							$("#" + id).attr('href',"<%=basePath%>company/showResume.act?userId="+ USER_ID +"&cvId=" + cvId +"&flag=personel");
							ret=true;
						}else{
							$('#warntext1').html("该简历已被删除！");
							$('#my-modal-errorfile-alert').show ().delay (1000).fadeOut ();
						}
						
					}
				});
		    	return ret;		
		}
		
		 // 申请职位按钮
	       function Tip(divid) {
	       	// 账号未登录的情况
	               $("#" + divid).attr("data-target", "#layhomewarn");
	               return;
	       }
		//check 用户录入信息
		function checkRecord(){
			//获取用户录入的信息check
			// 录入时间
			var record_date = $("#record_date").val();
			if (record_date == "") {
				$("#record_date").tips({
					side : 2,
					msg : '请输入时间',
					bg : '#AE81FF',
					time : 3
				});
				$("#record_date").focus();
				return false;
			}
			//获取当前日期
			var date = new Date();
	        var seperator1 = "-";
	        var year = date.getFullYear();
	        var month = date.getMonth() + 1;
	        var strDate = date.getDate();
	        if (month >= 1 && month <= 9) {
	            month = "0" + month;
	        }
	        if (strDate >= 0 && strDate <= 9) {
	            strDate = "0" + strDate;
	        }
	        var currentdate = year + seperator1 + month + seperator1 + strDate;
			if(record_date.length>0){
	    		if(record_date>currentdate){
		    		$("#record_date").tips({
		    			side : 3,
		    			msg : '时间不能大于当前时间！',
		    			bg : '#AE81FF',
		    			time : 2
		    		});
		    		$("#record_date").focus();
	    			return false;		
	    		}
	    	}
			
			var record_work_experience = $("#record_work_experience").val();
			if(record_work_experience==""){
	    		$("#record_work_experience").tips({
	    			side : 3,
	    			msg : '请输入工作经验',
	    			bg : '#AE81FF',
	    			time : 2
	    		});
	    		$("#record_work_experience").focus();
	    		return false;		
			}
			var reg = /^[0-9]+.?[0-9]*$/;
			if(!(reg.test(record_work_experience))){
	    		$("#record_work_experience").tips({
	    			side : 3,
	    			msg : '必须为纯数字格式',
	    			bg : '#AE81FF',
	    			time : 2
	    		});
	    		$("#record_work_experience").focus();
	    		return false;
			}
			if(parseInt(record_work_experience)>44){
		    		$("#record_work_experience").tips({
		    			side : 3,
		    			msg : '经验不能高于44年（即法定：60岁最高退休年龄 - 16岁最低务工条件 = 44年是一生所能达到的最高经验）',
		    			bg : '#AE81FF',
		    			time : 2
		    		});
		    		$("#record_work_experience").focus();
		    		return false;		
			}
			
			var record_start_time = $("#record_start_time").val();
			//开始时间
			if (record_start_time == "") {
				$("#record_start_time").tips({
					side : 2,
					msg : '请输入开始时间',
					bg : '#AE81FF',
					time : 3
				});
				$("#record_start_time").focus();
				return false;
			}
			//结束时间
			var record_end_time = $("#record_end_time").val();
			if (record_end_time == "") {
				$("#record_end_time").tips({
					side : 2,
					msg : '请输入结束时间',
					bg : '#AE81FF',
					time : 3
				});
				$("#record_end_time").focus();
				return false;
			}
			//结束时间和开始时间比较
	    	if(record_end_time.length>0&&record_end_time.length>0){
	    		if(record_start_time>record_end_time){
		    		$("#record_end_time").tips({
		    			side : 3,
		    			msg : '结束时间不能小于开始时间！',
		    			bg : '#AE81FF',
		    			time : 2
		    		});
		    		$("#record_end_time").focus();
		    		return false;		
	    		}
	    	}
			var record_money = $("#record_money").val();
			if(record_money==""){
		    		$("#record_money").tips({
		    			side : 3,
		    			msg : '请输入期望薪资',
		    			bg : '#AE81FF',
		    			time : 2
		    		});
		    		$("#record_money").focus();
		    		return false;		
			}
			var reg = /^[0-9]+.?[0-9]*$/;
			if(!(reg.test(record_money))){
		    		$("#record_money").tips({
		    			side : 3,
		    			msg : '必须为纯数字格式',
		    			bg : '#AE81FF',
		    			time : 2
		    		});
		    		$("#record_money").focus();
		    		return false;		
			}
			
			
			var record_work_status = $("#record_work_status option:selected").val(); 
			if(record_work_status=="0"){
	    		$("#record_work_status").tips({
	    			side : 2,
	    			msg : '请选择状态',
	    			bg : '#AE81FF',
	    			time : 2
	    		});
	    		$("#record_work_status").focus();
	    		return false;		
			}
			var record_study_aptitude = $("#record_study_aptitude option:selected").val(); 
			if(record_study_aptitude=="0"){
	    		$("#record_study_aptitude").tips({
	    			side : 2,
	    			msg : '请选择学历',
	    			bg : '#AE81FF',
	    			time : 2
	    		});
	    		$("#record_study_aptitude").focus();
	    		return false;		
			}
			var record_type = $("#record_type option:selected").val(); 
			if(record_type=="0"){
	    		$("#record_type").tips({
	    			side : 2,
	    			msg : '请选择方式',
	    			bg : '#AE81FF',
	    			time : 2
	    		});
	    		$("#record_type").focus();
	    		return false;		
			}
			
			
			
			var record_evaluate_grade = $("#record_evaluate_grade option:selected").val(); 
			if(record_evaluate_grade=="0"){
	    		$("#record_evaluate_grade").tips({
	    			side : 2,
	    			msg : '请选择评分',
	    			bg : '#AE81FF',
	    			time : 2
	    		});
	    		$("#record_evaluate_grade").focus();
	    		return false;		
			}
			
			var record_evaluate = $("#record_evaluate").val();
			if(record_evaluate.length>200){
	    		$("#record_evaluate").tips({
	    			side : 2,
	    			msg : '只能录入200以内的汉字评价！',
	    			bg : '#AE81FF',
	    			time : 2
	    		});
	    		$("#record_evaluate").focus();
	    		return false;		
			}
			if(record_evaluate==""||record_evaluate.length<=5){
	    		$("#record_evaluate").tips({
	    			side : 2,
	    			msg : '请录入至少五个字符以上的评价信息！',
	    			bg : '#AE81FF',
	    			time : 2
	    		});
	    		$("#record_evaluate").focus();
	    		return false;		
			}else{
	    		return true;		
			}
		}
		//清空
		function delTextContent(id,recordId,recordIdNumber){
			// 初始化弹窗
			setheight("#workDiv");
			
			//首先清空上次的录入信息
			$("#record_date").val("");
			$("#record_start_time").val("");
			$("#record_end_time").val("");
			$("#record_money").val("");
			$("#record_work_status option[value='0']").attr("selected", true); 
			$("#record_work_status option[value='0']").attr("selected", "selected"); 
			$("#record_type option[value='0']").attr("selected", true); 
			$("#record_type option[value='0']").attr("selected", "selected"); 
			$("#record_work_experience").val("");
			$("#record_study_aptitude option[value='0']").attr("selected", true); 
			$("#record_study_aptitude option[value='0']").attr("selected", "selected"); 
			$("#record_evaluate_grade option[value='0']").attr("selected", true); 
			$("#record_evaluate_grade option[value='0']").attr("selected", "selected"); 
			$("#record_evaluate").val("");
			
			//设置参数
			$("#recordUserId").val(id);
			$("#recordId").val(recordId);
			$("#recordIdNumber").val(recordIdNumber);
			
			// 获取All列表
			var url = '<%=basePath%>company/codeList.act';
			$.ajax({
				url:url,
				type : "POST",
				dataType : 'json',
				data:{code_id:1},
				success:function(returnData){
					// 获取学历列表
					var html = "<option value='0' selected='selected'>请选择</option>";
					var codeXLs = returnData.codeXL;
					for(var codeXL in codeXLs){
						var key = codeXLs[codeXL];
						html +="<option value='"+key.code_key+"'>"+key.code_value+"</option>";
					}
					$("#record_study_aptitude").html("");
					$("#record_study_aptitude").html(html);
					
					// 获取All评分列表
					html = "<option value='0' selected='selected'>请选择</option>";
					var codePFs = returnData.codePF;
					for(var codePF in codePFs){
						var key = codePFs[codePF];
						html +="<option value='"+key.code_key+"'>"+key.code_value+"</option>";
					}
					$("#record_evaluate_grade").html("");
					$("#record_evaluate_grade").html(html);
					
					// 获取All面试类型列表
					html = "<option value='0' selected='selected'>请选择</option>";
					var codeLXs = returnData.codeLX;
					for(var codeLX in codeLXs){
						var key = codeLXs[codeLX];
						html +="<option value='"+key.code_key+"'>"+key.code_value+"</option>";
					}
					$("#record_work_status").html("");
					$("#record_work_status").html(html);
					
					// 获取All职位状态列表
					html = "<option value='0' selected='selected'>请选择</option>";
					var codeZTs = returnData.codeZT;
					for(var codeZT in codeZTs){
						var key = codeZTs[codeZT];
						html +="<option value='"+key.code_key+"'>"+key.code_value+"</option>";
					}
					$("#record_type").html("");
					$("#record_type").html(html);
				}
			});
		}
		//增加面试记录
		function insertRecord(){
			
			//获取用户录入的信息check
			var record_date = $("#record_date").val();
			var record_start_time = $("#record_start_time").val();
			var record_end_time = $("#record_end_time").val();
			var record_money = $("#record_money").val();
			var record_work_status = $("#record_work_status option:selected").val(); 
			var record_type = $("#record_type option:selected").val(); 
			var record_work_experience = $("#record_work_experience").val();
			var record_study_aptitude = $("#record_study_aptitude option:selected").val(); 
			var record_evaluate_grade = $("#record_evaluate_grade option:selected").val(); 
			var record_evaluate = $("#record_evaluate").val();
			
			//ajax 提交后台处理新增记录
			var url = '<%=basePath%>company/insertRecord.act';
			if(checkRecord()){
				$.ajax({
					url:url,
					type : "POST",
					dataType : 'json',
					data:{
						record_date:record_date,
						record_start_time:record_start_time,
						record_end_time:record_end_time,
						record_money:record_money,
						record_work_status:record_work_status,
						record_type:record_type,
						record_work_experience:record_work_experience,
						record_study_aptitude:record_study_aptitude,
						record_evaluate_grade:record_evaluate_grade,
						record_evaluate:record_evaluate,
						record_linkuser_personage : $("#recordUserId").val(),
						record_linkuser_company : $("#recordUserId").val(),
						record_link_id : $("#recordId").val(),
						record_link_id_number : $("#recordIdNumber").val(),
						id_record : "1",
					},
					success:function(returnData){
						//返回页面提示信息，成功/失败。
						if(returnData.pd.status=="success"){
							$("#recordClearButton").click();
							$('#success').show();
							setTimeout("openmy()",2000);
							return true;
						}else{
							$('#error').show ();
							setTimeout("errorshow()",2000);
							return false;
						}
					}
				});
			}else{
				return false;
			}
			
			
		}
		
		// 已同意
	    function tongyi(start_time, end_time,description) {
            $("#tongyi_start_time").val(start_time);
            $("#tongyi_end_time").val(end_time);
            document.getElementById("tongyi_description").innerText = description;
	 		$("#tongyi" + recruiters).attr("data-target", "#tongyi");
			$("#tongyi").attr("data-target", "");  
		}
		
		//弹窗提示
		function openmy(){
			$('#success').hide();
			window.location.href=window.location.href;
		}
		function errorshow(){
			$('#error').hide();
		}
		
		//查看面试记录
		function lookRecord(id,recordId,recordIdNumber){
			//请求后台更新前台数据
			var url = '<%=basePath%>company/lookRecord.act?outtime='+new Date().getTime();
			$.ajax({
				url:url,
				type : "POST",
				dataType : 'json',
				data:{
					recordId:recordId,
					recordLinkuserCompany:id,
					recordLinkuserPersonage:id,
					recordIdNumber:recordIdNumber
				},
				success:function(returnData){
					if(returnData.length>0){
						var dataitem = returnData[0];
						//填充页面
						var html = "";
						html += '<tr><td><table class="table">';
						html += '<tr><th class="styleRight">面试日期：</th><td>'+dataitem.record_date+'</td></tr>';
						html += '<tr><th class="styleRight">面试时间：</th><td>'+dataitem.record_start_time+'~'+dataitem.record_end_time+'</td></tr>';
						html += '<tr><th class="styleRight">期望薪资：</th><td>'+dataitem.record_money+'元</td></tr>';
						if(dataitem.record_work_status==1){
							html += '<tr><th class="styleRight">工作状态：</th><td>在职</td></tr>';
						}else if(dataitem.record_work_status==2){
							html += '<tr><th class="styleRight">工作状态：</th><td>离职</td></tr>';
						}else{
							html += '<tr><th class="styleRight">工作状态：</th><td>其他</td></tr>';
						}
						html += '<tr><th class="styleRight">工作经验：</th><td>'+dataitem.record_work_experience+'年</td></tr>';
						if(dataitem.record_study_aptitude==1||dataitem.record_study_aptitude==2){
							html += '<tr><th class="styleRight">学历等级：</th><td>高中以下（不含高中）</td></tr>';
						}else if(dataitem.record_study_aptitude==3){
							html += '<tr><th class="styleRight">学历等级：</th><td>高中</td></tr>';
						}else if(dataitem.record_study_aptitude==4||dataitem.record_study_aptitude==5){
							html += '<tr><th class="styleRight">学历等级：</th><td>大专/本科</td></tr>';
						}else if(dataitem.record_study_aptitude==6){
							html += '<tr><th class="styleRight">学历等级：</th><td>研究生</td></tr>';
						}else if(dataitem.record_study_aptitude==7){
							html += '<tr><th class="styleRight">学历等级：</th><td>硕士学位</td></tr>';
						}else if(dataitem.record_study_aptitude==8||dataitem.record_study_aptitude==9){
							html += '<tr><th class="styleRight">学历等级：</th><td>博士/博士后学位</td></tr>';
						}
						if(dataitem.record_type==1){
							html += '<tr><th class="styleRight">面试方式：</th><td>当面面试</td></tr>';
						}else if(dataitem.record_type==2){
							html += '<tr><th class="styleRight">面试方式：</th><td>视频面试</td></tr>';
						}else{
							html += '<tr><th class="styleRight">面试方式：</th><td>其他面试</td></tr>';
						}
						html += '<tr><th class="styleRight">面试评分：</th><td>'+dataitem.record_evaluate_grade+'分</td></tr>';
						html += '<tr><th class="styleRight">面试评价：</th><td style="word-wrap:break-word;word-break:break-all;">'+dataitem.record_evaluate+'</td></tr>';
						html += '</table></td></tr>';
						$("#interviewDetail").html("");
						$("#interviewDetail").html(html);
					}else{
						$("#interviewDetail").html("<tr><th style='text-align: center;color:red;'>暂无面试记录</th></tr>");
					}
				}
			});
		}
		
		// 预约面试
	    function notice(company_id, recruitment_id,record_id, recruiters) {
            $("#recruitment_company_id").val(company_id);
            $("#recruitment_id").val(recruitment_id);
			$("#recruiters").val(recruiters); 
			$("#interview_record_id").val(record_id); 
			$("#interview_infoID").val($("#infoID").val());
	 		$("#notice" + recruiters).attr("data-target", "#notice");
			$("#notice").attr("data-target", "");  
		}
		
	 // 视频面试
	    function mianshi(company_id, recruitment_id,record_id, recruiters) {
	    	     
		}
	    
	 // 应聘者拒绝面试
	    function yijujue(user_id, reason) {
		    document.getElementById("reason").innerText=reason;
	    	$("#yijujue" + user_id).attr("data-target", "#yijujue");
			$("#yijujue").attr("data-target", "");  
		}
	 
	    
	    function GetDateT()
	    {
	     var d,s;
	     d = new Date();
	     s = d.getFullYear() + "-";             //取年份
	     var mm = d.getMonth() +1;
	     if(mm < 10){
	    	 mm = "0" + mm;
	     }
	     s = s + mm + "-";//取月份
	     var dd = d.getDate();
	     if(dd < 10){
	    	 dd = "0" + dd;
	     }
	     s = s + dd + " ";         //取日期
	     var hh = d.getHours();
	     if(hh < 10){
	    	 hh = "0" + hh;
	     }
	     s = s + hh + ":";       //取小时
	     var MM = d.getMinutes();
	     if(MM < 10){
	    	 MM = "0" + MM;
	     }
	     s = s + MM + ":";    //取分
	     var ss = d.getSeconds();
	     if(ss < 10){
	    	 ss = "0" + ss;
	     }
	     s = s + ss;         //取秒
	     return(s);  
	    } 
		
		function addInterview(){
			var now_time = GetDateT();
			if ($("#start_time").val() == "") {
				$("#start_time").tips({
					side : 2,
					msg : '请选择面试开始时间',
					bg : '#FF5080',
					time : 2
				});
				$("#start_time").focus();
				return false;
			}
			if ($("#end_time").val() == "") {
				$("#end_time").tips({
					side : 2,
					msg : '请选择面试结束时间',
					bg : '#FF5080',
					time : 2
				});
				$("#end_time").focus();
				return false;
			}
			if ($("#start_time").val() > $("#end_time").val()) {
				$("#start_time").tips({
					side : 2,
					msg : '开始时间不能大于结束时间',
					bg : '#FF5080',
					time : 2
				});
				$("#start_time").focus();
				return false;
			}
			if ($("#start_time").val() < now_time) {
				$("#start_time").tips({
					side : 2,
					msg : '开始时间不能小于当前时间',
					bg : '#FF5080',
					time : 2
				});
				$("#start_time").focus();
				return false;
			}
			if ($("#description").val().length > 125) {
				$("#description").tips({
					side : 2,
					msg : '请输入125个字内的描述',
					bg : '#FF5080',
					time : 2
				});
				$("#description").focus();
				return false;
			} 
			
		   $("#form2").submit();
		}
	</script>
		
	<script type="text/javascript">
	function relo(){
		$('#my-modal-exit-alert').hide();
		window.location.href=window.location.href;
	}
	
	function updateFile(){
		//取得上传图片对应的用户ID
		var id = $("#updid").val();
		var comId = $("#comId").val();
		var recordId = $("#recordId").val();
		var operationId = $("#operationId").val();
		//取得上传身份证图片的数据
		var license_id = $("#license_id").val();
		//取得上传毕业证图片的数据
		var license_diploma = $("#license_diploma").val();
		//取得上传学位证图片的数据
		var license_degree = $("#license_degree").val();
		//取得所有上传合同的路径
		var adoptPath = $("#apply_report_path").val();
		//取得所有上传合同的文件名
		var adoptNm = $("#apply_report_name").val();
		// 身份证验证
		var license_id = $("#license_id").val();
		if (license_id == "") {
			$("#weixin_show_id").tips({
				side : 2,
				msg : '请输入身份证',
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
		// 毕业证验证
		var license_diploma = $("#license_diploma").val();
		if (license_diploma == "") {
			$("#weixin_show_diploma").tips({
				side : 2,
				msg : '请输入毕业证',
				bg : '#AE81FF',
				time : 3
			});
			return false;
		}
		// 合同验证
		if (adoptPath == "") {
			$("#file_upload").tips({
				side : 2,
				msg : '请输入合同',
				bg : '#AE81FF',
				time : 2
			});
			return false;
		}
		//通过Ajax向后台传值
		$.ajax({
			type : "POST",
			url : '<%=basePath%>company/upLoadFile.act',
			data : {
				operationId : operationId,
				id : id,
				comId : comId,
				recordId : recordId,
				id_path : license_id,
				diploma_path : license_diploma,
				degree_path : license_degree,
				labour_path : adoptPath,
				labour_name : adoptNm
			},
			dataType : 'json',
			cache : false,
			async : false,
			success : function(data) {
				if ("success" == data.result) {
					$('#adoptModal').modal('hide');
					location.reload();
				} else {
					$('#adoptModal').modal('hide');
					$('#my-modal-exit-alert').show()
					setTimeout("relo()", 1000);
				}
			}
		});
	}
</script>
	
	<script type="text/javascript">
    function checkSelect(){
    	 var relateIds = "";
    	 $("input[name='isRead']:checked").each(function () {
             relateIds += $(this).attr('value') + ",";
         });
         $("#checkBoxFlag").val(relateIds);
    }
    
    // 预览合同
    function view(view,id) {
		var ret=false;
		$.ajax({
			type : "POST",
			url : '<%=basePath%>company/view.act',
			dataType : 'json',
			data : {
				id : id
			},
			cache : false,
			async : false,
			success : function(data) {
				if(data.responseStr=="OK"){
					var path=data.responsePath;
					$("#view"+id).attr('href','<%=basePath%>'+path);
					ret=true;
				} else {
					$('#my-modal-success-alert').show ().delay (1000).fadeOut ();
					ret=false;
				}
			}
		});
		return ret; 
	}
    
    function dels(userId, recordId, divid) {
		$("#" + divid).attr("data-target", "#delSend");
		$("#delSend").attr("data-target", "");
		$("#recordId").val(recordId);
		$("#user_id").val(userId);
	}
    
    // 证件修改
    function openPic(userId, companyId) {
    	$("#operationId").val("1");
    	$("#updid").val(userId);
    	$("#comId").val(companyId);
		$.ajax({
			type : "POST",
			url : '<%=basePath%>company/openPic.act',
			data : {
				userId : userId,
				companyId : companyId
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				$("#adoptModal").modal('show');
				var id=data.id;
				var id_path=data.id_path;
				var diploma_path=data.diploma_path;
				var degree_path=data.degree_path;
				var labour_name=data.labour_name;
				var labour_path=data.labour_path;
				$("#license_id").val(id_path);
				$("#license_diploma").val(diploma_path);
				$("#license_degree").val(degree_path);
				if(id_path!=null&&id_path!=""){
					$("#weixin_show_id").attr("src","<%=basePath%>images/"+id_path);
		   		} else {
		   			$("#weixin_show_id").attr("src","<%=basePath%>shyl/images/img.png");
		   		}
				if(diploma_path!=null&&diploma_path!=""){
					$("#weixin_show_diploma").attr("src","<%=basePath%>images/"+diploma_path);
		   		} else {
		   			$("#weixin_show_diploma").attr("src","<%=basePath%>shyl/images/img.png");
		   		}
				$("#apply_report_path").val(labour_path);
		   		$("#apply_report_name").val(labour_name);
		   		$("#finame").text(labour_name);
		   		$("#xg a").attr("id","view"+id);
		   		$("#xg a").attr("onclick","return view('view"+id+"','"+id+"');");
		   		if(labour_name!=null&&labour_name!=""){
		   			$("#vl").hide();
		   			$("#xg").show();
		   		}
		   		if(degree_path!=null&&degree_path!=""){
		   			$("#weixin_show_degree").attr("src","<%=basePath%>images/"+degree_path);
		   			$("#sc").show();
		   		} else {
		   			$("#weixin_show_degree").attr("src","<%=basePath%>shyl/images/img.png");
		   		}
			}
		});
	}
    
    function deg(){
    	$('#delDegree').attr("style","display:block");
    	$('#delDegree').attr("style","z-index:100000");
    	$("#delDegree").show();
    }
    
    function delDegree(){
    	$('#delDegree').attr("style","display:none");
    	$("#weixin_show_degree").attr("src","<%=basePath%>shyl/images/img.png");
		$("#license_degree").val('');
		$("#sc").hide();
    }
    
    function showImgDelayNew(index){
    	var imgObj = document.getElementById(index);
    	imgObj.onerror=null;
    	imgObj.src='<%=basePath%>shyl/images/temp.png';  
    }  
    
    function Delete() {
    	location.href = "<%=basePath%>company/delSend.act?userId="+ $("#user_id").val() + "&recordId="+ $("#recordId").val() + "&infoID="+ $("#infoID").val();
	}
    
    function openDelCv(userId, companyId) {
		$("#delCvSend").attr("data-target", "");
		$("#userCd").val(userId);
		$("#companyCd").val(companyId);
	}
    
    function delCvSend() {
    	location.href = "<%=basePath%>company/delCvSend.act?userId="+ $("#userCd").val() + "&companyId="+ $("#companyCd").val() + "&infoID="+ $("#infoID").val();
	}
</script>

	<div class="clear"></div>
	<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
</html>