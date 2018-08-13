<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>试题管理_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">
<jsp:include page="../../common/header.jsp"></jsp:include>
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<script src="js/jquery-v1.10.2.js" type="text/javascript"></script>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/style_another.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/question/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/question/font-awesome/css/exam.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/question/font-awesome/css/morris.css" />
<script src="<%=basePath%>shyl/js/question/question-view.js" type="text/javascript"></script>
</head>
<body id="top" style="background-color: #f7f7f7;">
<div class="modal_h20 modal fade in" id="delquestion" data-toggle="modal" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="false" data-backdrop="static">
	<div class="modal-dialog modal-sm">
	   <div class="modal-content">
	       <div class="modal-header">
	           <button type="button" class="close" data-dismiss="modal" onclick="Clear()"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
	           <h4 class="modal-title" id="myModalLabel">提示</h4>
	       </div>
	       <div class="modal-body">
	           <p id="warntext">试题删除后不可恢复，确定删除吗？</p>
	       </div>
	       <div class="modal-footer">
	           <input type="hidden" id="questionID" value="">
	           <button type="button" class="btn btn-success" onclick="Delete()" data-dismiss="modal">确认</button>
	           <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	       </div>
	   </div>
	</div>
</div>
	
<!-- /.modal -->
<div class="clear"></div>
<div class="register-box p0">
	<div class="rticon"></div>
	<jsp:include page="../../common/left.jsp"><jsp:param value="35" name="menuType"/></jsp:include>
	<div class="mypage_right" style="min-height:920px;">
		<h2 style="font-size:1.0em;color:black;">试题预览</h2>
			<div>
				<div class="container" style="min-height:500px;">
					<div class="row">
		 		           <div class="col-xs-9">
								<div class="page-content row">
									<div class="def-bk" id="bk-exampaper">
		
										<div class="expand-bk-content" id="bk-conent-exampaper">
											<ul id="exampaper-body" style="padding:0px;">
												${strHtml }						
												<div class="answer-desc-detail">
													<label class="label label-primary"><i class="fa fa-check-square-o"></i><span> 添加人</span></label>
													<div class="answer-desc-content">
														${pd.company_name}
													</div>
													<input type="hidden" id="question_id" name="question_id" value="${question.id }">
												</div>
											</ul>
											<div id="exampaper-footer" style="height: 187px;text-align:center;margin-top:40px;">
												<div class="col-sm-offset-4 col-sm-2">
												   <table>
												      <tr>
												         <td><button data-toggle="modal" class="btn btn-success btn-block" id="delete-question-btn"><span class="glyphicon glyphicon-trash"></span>&nbsp;&nbsp;删除该题</button></td>
												         <td>&nbsp;&nbsp;</td>
												         <td><button class="btn btn-success btn-block" onclick="javascript:window.close();"><span class="glyphicon glyphicon-remove"></span>&nbsp;&nbsp;关闭页面</button></td>
												      </tr>
												   </table>
							                    </div>
											</div>

										</div>
									</div>
								</div>
							</div>
				   </div>
				</div>
			</div>
	</div>
</div>
<div class="clear"></div>
<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
</html>
