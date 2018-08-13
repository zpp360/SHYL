<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<title>试卷一览_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<base href="<%=basePath%>">
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<script src="js/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/jquery-1.7.1.js"></script>
<script src="<%=basePath%>shyl/js/jquery.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
<style>
.table1 tr{
height:36px;
line-height: 36px;
}
.table1 tr:hover{
background-color:#FFFFF0;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
<jsp:include page="../../common/header.jsp"></jsp:include>
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param value="32" name="menuType"/></jsp:include>
		<div class="mypage_right">
			<h2>试卷一览</h2>
			<div class="tab" style="margin-bottom:0;">
				<a href="<%=basePath%>papermain/insertPaper.act" class="more" style="font-size: 1em;">+&nbsp;&nbsp;新增</a>
				<form action="<%=basePath%>papermain/list.act" method="post" name="newsform" id="newsform">
					<input type="text" class="search" id="newsTitle" name="newsTitle" value="${pd.newsTitle}" placeholder="请输入标题关键字" style="background-color: #ecf0f9;">
					<input type="submit" class="sbtnNew" value="搜索" onclick="search();" style="margin-top:0px;line-height: 46px;height: 46px;color: #ffffff;margin-left: 20px;">
				</form>
			</div>
			<div class="jianli">
			<input type="hidden" id="company_id" value="${pd.company_id}">
				<table class="tableclass">
					<thead>
						<tr>
							<th style="text-align: center;">序号</th>
							<th style="text-align: center;">试卷名称</th>
							<th style="text-align: center;">时长</th>
							<th style="text-align: center;">题库</th>
							<th style="text-align: center;">参与人数</th>
							<th style="text-align: center;">状态</th>
							<th style="text-align: center;">操作</th>
						</tr>
					</thead>
					<tbody>
					    <c:choose>
					        <c:when test="${not empty questionList}">
					            <c:forEach items="${questionList}" var="var" varStatus="vs">
									<tr>
										<td style="width: 46px;text-align: center;">${vs.index+1}</td>
										<td style="width: 115px;text-align: center;display: block;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;" class=""><a href="javaScript:;" onclick="details('${var.id}')" title="${var.name}">${var.name}</a></td>
										<td style="width: 46px;text-align: center;">${var.duration}</td>
										<td style="width: 120px;text-align: center;display: block;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">${var.field_name}</td>
										<c:if test="${var.total != null && var.total != ''}">
											<td style="width: 80px;text-align: center"><a
												href="<%=basePath%>tester/list.act?id=${var.id}">${var.total}</a>
											</td>
										</c:if>
										<c:if test="${var.total == null || var.total == ''}">
											<td style="width: 80px;text-align: center">0</td>
										</c:if>
										<td style="width: 86px;text-align: center;">
										<c:choose>
										<c:when test="${var.statust==0}">
										未上线
										</c:when>
										<c:when test="${var.statust==1}">
										已上线
										</c:when>
										<c:when test="${var.statust==2}">
										已下线
										</c:when>
										</c:choose>
										</td>
										<td style="text-align: center;">
												<c:choose>
														<c:when test="${var.statust ==0}">
										    <a href="<%=basePath%>papermain/to_Edit.act?generatedId=${var.id}&pointid=${var.point_id}&fieldid=${var.field_id}" class="modify" style="">修改内容</a>
										  <a class="modify" style="cursor:pointer;" data-target="#Tra" data-toggle="modal"  onclick="updatePaper('${var.id}')">修改属性</a>
										    <a class="upload" style="cursor:pointer;" data-toggle="modal" title="试卷上线" id="supload_${var.id}" onclick="setSupload('${var.id}');" data-target="#suploadModal">上线</a>
										    <a class='delete' style="cursor:pointer;" data-toggle="modal" title="删除试卷信息" id="delnews_${var.id}" onclick="del('${var.id}');" data-target="#delnews">删除</a>
											</c:when>
												<c:when test="${var.statust ==1 }">
															<a class="zdown" onclick="setXdown('${var.id}')" style="cursor:pointer;" data-toggle="modal" title="试卷下线" id="xdown_${var.id}" data-target="#xdownModal">下线</a>
														</c:when>
											</c:choose>
										</td>
									</tr>
							    </c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="7" style="text-align: center;">
										<span style="color: #ff6a00">没有相关数据</span>
									</td>
								</tr>
							</c:otherwise>
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
		</div>
	</div>
	<div class="modal_h20 fade bs-example-modal-sm in" id="delnews"
			data-toggle="modal" tabindex="-1" role="dialog"
			aria-labelledby="mySmallModalLabel" aria-hidden="false"
			data-target="">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">提示</h4>
					</div>
					<div class="modal-body">
						<p id="warntext">确认删除该试卷？</p>
					</div>
					<div class="modal-footer">
						<input type="hidden" id="id" value="">
						<button type="button" class="btn btn-success" onclick="delevaluation()"
							data-dismiss="modal">确认</button>
						<button type="button" class="btn btn-default"
							data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
			<div class="modal_h20 fade bs-example-modal-sm in" id="suploadModal"
			data-toggle="modal" tabindex="-1" role="dialog"
			aria-labelledby="mySmallModalLabel" aria-hidden="false"
			data-target="">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">提示</h4>
					</div>
					<div class="modal-body">
						<p id="warntext">确定要上线吗？上线后的试卷将可以进行考试</p>
					</div>
					<div class="modal-footer">
						<input type="hidden" id="suploadId" value="">
						<button type="button" class="btn btn-success" onclick="Supload()"
							data-dismiss="modal">确认</button>
						<button type="button" class="btn btn-default"
							data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
			<div class="modal_h20 fade bs-example-modal-sm in" id="xdownModal"
			data-toggle="modal" tabindex="-1" role="dialog"
			aria-labelledby="mySmallModalLabel" aria-hidden="false"
			data-target="">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">提示</h4>
					</div>
					<div class="modal-body">
						<p id="warntext">确定要下线吗？下线后的试卷将无法再进行考试</p>
					</div>
					<div class="modal-footer">
						<input type="hidden" id="xdownId" value="">
						<button type="button" class="btn btn-success" onclick="Xdown()"
							data-dismiss="modal">确认</button>
						<button type="button" class="btn btn-default"
							data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
		<div class="modal_h20 fade bs-example-modal-sm in" id="Tra" tabindex="-1" role="dialog"
				aria-labelledby="It" aria-hidden="false" data-backdrop="static">
				<form action="" id="test6">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">
								修改试卷属性<small>（&nbsp;<span class="red_tip">*</span>为必填项&nbsp;）
								</small>
							</h4>
						</div>
						<div class="modal-body form_table_box">
							<table class="table">
								<tbody>
									<tr>
										<th style="width:120px;"><label class="control-label" style="text-align: tight;"><span
												class="red_tip" style="color: #FF0000">*</span>试卷名称：</label></th>
										<td colspan="3"><input class="inputtxt2"
											data-val="true" data-val-length="长度<35"
											data-val-length-max="35" data-val-required="*" id="TechName"
											name="TechName" type="text" maxlength="35"  onblur="trim(this);"> <span
											class="field-validation-valid" data-valmsg-for="TechName"
											data-valmsg-replace="true"></span></td>
									</tr>
									<tr>
										<th style="width:120px;"><label class="control-label"><span
												class="red_tip" style="color: #FF0000">*</span>时长(分钟)：</label></th>
										<td colspan="3"><input class="inputtxt2"
											data-val="true" data-val-number="字段 使用时间 必须是一个数字。"
											data-val-required="*" id="Duration" name="Duration" maxlength="3"
											onkeyup="value=value.replace(/[^0-9]/g,'')" type="text"
											 onblur="delZero(this);" style="ime-mode:disabled"> <span class="field-validation-valid"
											data-valmsg-for="Duration" data-valmsg-replace="true"></span>
										</td>
									</tr>
									<tr id="dd">
										<th style="width:120px;"><label class="control-label"><span
												class="red_tip" style="color: #FF0000">*</span>题库类别：</label></th>
										<td colspan="3"><select class="inputtxt2" data-val="true"
											data-val-required="*" id="types" name="types"><c:forEach
													items="${classification}" var="ind">
													<c:if test="${ind.fieldId==8}">
													<option value="${ind.fieldId }"
														<c:if test="${ind.fieldId == pd.field_id}">selected</c:if>>${ind.fieldName }</option>
														</c:if>
												</c:forEach>
										</select></td>
									</tr>
									<tr id="ss">
										<th style="width:120px;"><label class="control-label"><span
												class="red_tip" style="color: #FF0000">*</span>知识点：</label></th>
										<td colspan="3"><select class="inputtxt2" data-val="true"
											data-val-required="*" id="knowleage" name="knowleage"><c:forEach
													items="${knowledgepoint}" var="ind">
													<option value="${ind.pointId }"
														<c:if test="${ind.fieldId == pd.pointId}">selected</c:if>>${ind.pointName }</option>
												</c:forEach>
										</select></td>
									</tr>
								</tbody>
							</table>
							<input id="paperid" name="paperid" type="hidden" value="">
						</div>
						<div class="modal-footer">
							<button id="ItButton" type="button" class="btn btn-success" data-dismiss="">确认</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
						</div>
					</div>
					<script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
					<script type="text/javascript">
					$("#ItButton").click(function(){
						var TechName=$("#TechName").val();
						var Duration=$("#Duration").val();
						var types=$("#types").val();
						var paperid=$("#paperid").val();
						var knowleage=$("#knowleage").val();
						if(valateit()){
						$.ajax({
							type : "POST",
							url :  '<%=basePath%>papermain/updatepaper.act',
							data : {
								name:TechName,
								duration:Duration,
								field_id:types,
								id:paperid,
								knowleage:knowleage
							},
							dataType : 'json',
							cache : false,
							success : function(data) {
								$('#Tra').modal('hide');
								window.location.href = "<%=basePath%>papermain/list.act"
							}
						});
						}
					function valateit(){
						var TechName=$("#TechName").val();
						if (TechName== "") {
							$("#TechName").tips({
								side : 2,
								msg : '请输入试卷名称',
								bg : '#AE81FF',
								time : 3
							});
							$("#TechName").focus();
							return false;
						}	
						var Duration=$("#Duration").val();
						if (Duration== "") {
							$("#Duration").tips({
								side : 2,
								msg : '请输入时长',
								bg : '#AE81FF',
								time : 3
							});
							$("#Duration").focus();
							return false;
						}else if (!(Duration > 30 && Duration < 241)) {
							$("#Duration").tips({
								side : 2,
								msg : '数字范围无效，考试的时长必须设置在30到240的范围内',
								bg : '#AE81FF',
								time : 2
							});
							$("#duration").focus();
							return false;
						}
						return true;
					}
					})
					</script>
				</div>
				<input type="reset" name="resit" style="display: none;">
				</form>
			</div>
	<div class="clear"></div>
	<script type="text/javascript" src="<%=basePath%>shyl/js/question/evalexaperAdd.js"></script>
	<%@ include file="../../common/footer.jsp"%>
</body>

</html>