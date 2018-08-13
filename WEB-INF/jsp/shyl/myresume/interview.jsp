<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>面试管理_济南市服务外包公共服务平台</title>
<jsp:include page="../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<script src="js/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/jquery-1.7.1.js"></script>
<script src="<%=basePath%>shyl/js/jquery.min.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="/SHYL/shyl/js/html5shiv.min.js"></script>
<script type="text/javascript" src="/SHYL/shyl/js/respond.min.js"></script>
<![endif]-->
</head>
<body style="background-color: #f7f7f7;">
<!-- /.modal -->
<div class="clear"></div>
<div class="register-box p0">
    <div class="rticon"></div>
    <jsp:include page="../common/left.jsp"><jsp:param value="21" name="menuType"/></jsp:include>
    <div class="mypage_right">
        <h2>我的面试</h2>
        <form action="<%=basePath%>myresume/interview.act" method="post" name="Form" id="Form">
        <div class="jianli">
            <table class="tableclass">
                <thead>
                    <tr>
                    	<th style="text-align: left;padding-left: 20px;">应聘公司</th>
                    	<th style="text-align: center;">应聘日期</th>
                        <th style="padding-left: 30px;text-align: left;">职位</th>
                        <th style="text-align: center;">操作</th>
                    </tr>
                </thead>
                <tbody>
                <c:choose>
                <c:when test="${not empty inteviewList}">
                    <c:forEach items="${inteviewList}" var="var" varStatus="vs">
                        <tr>
                        	<td style="width: 280px;text-align: left;padding-left: 20px;">
                                <a href="<%=basePath%>company/info.act?companyId=${var.company_id}"><div style="width:280px;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title="${var.company_name}">${var.company_name}</div></a>
                            </td>
                            <td style="width: 140px;text-align: center;">${var.apply_date}</td>
                            <td style="width: 280px;padding-left: 30px;text-align: left;">
                            <a id="position_id${vs.index}" href="javascript:void(0);" target="_blank" onclick="return showJob('position_id${vs.index}','${var.company_id}','${var.recruitment_info_id}');">
                            <div style="width:270px;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title="${var.position_name}">${var.position_name}</div></a>
                            </td>
                            
                            <td style="text-align: center;">
                            <c:if test="${var.status == '0'}">
	                             <a data-toggle='modal' data-target='#mianshi' id = "mianshi_${var.USER_ID}" class='modify' onclick="mianshi('${var.start_time}','${var.end_time}','${var.description}','${var.id}');" style="cursor: pointer;">面试通知</a>
                            </c:if>
                            <c:if test="${var.status == '1'}">
                            	<a data-toggle='modal' data-target='#tongyi' id = "tongyi_${var.USER_ID}" class='modify' onclick="tongyi('${var.start_time}','${var.end_time}','${var.description}','${var.id}');" style="cursor: pointer;">已同意</a>
                            </c:if>
                            <c:if test="${var.status == '2'}">
                            	<a data-toggle='modal' data-target='#yijujue' id="yijujue_${var.USER_ID}" class='modify' onclick="yijujue('${var.reason}');" style="cursor: pointer;">已拒绝</a>
                            </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
									<td colspan="4" style="text-align: center;"><span style="color: #ff6a00">没有相关记录</span></td>
								</tr>
                </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>
        <div class="page-header position-relative">
            <table style="width: 100%;">
                <tr>
                    <td style="align: center;" align="center"><div
                            class="pagination"
                            style="padding-top: 15px; margin: 0 auto; font-size:12px; display: inline-block;">${page.platformPageStr}</div></td>
                </tr>
            </table>
        </div>
        </form>
    </div>
</div>
<!-- 面试通知 弹出框 -->
        <div class="modal_h20 fade bs-example-modal-sm in" id="mianshi"
            data-toggle="modal" tabindex="-1" role="dialog"
            aria-labelledby="mySmallModalLabel" aria-hidden="false"
            data-target="">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" onclick="divhidden()">
                            <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">面试通知<small> </small>
                        </h4>
                    </div>
                    <form class="form-horizontal" role="form" action="" method="post"
                        id="form2" name="form2">
                        <table class="table">
                                    <tbody>
                                        <tr>
                                            <th style="line-height: 40px"><span class="red_tip" style="color: red">*</span>面试开始时间：</th>
                                            <td colspan="3">
                                              <input class="inputtxt2" id="start_time" name="start_time" onFocus="WdatePicker({isShowWeek:true});" 
                                              type="text" value="" readonly/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th style="line-height: 40px"><span class="red_tip" style="color: red">*</span>面试结束时间：</th>
                                            <td colspan="3">
                                              <input class="inputtxt2" id="end_time" name="end_time" onFocus="WdatePicker({isShowWeek:true});" 
                                              type="text" value="" readonly/>
                                              <!-- 面试管理ID-->
                                              <input type="hidden" id="interview_id" name="interview_id" value="">                
                                            </td>
                                        </tr>
                                        <tr>
                                            <th style="line-height: 65px">描述：</th>
                                            <td> <textarea style="width:700px;padding-left:5px;background-color:#ecf0f9;border:0;border-radius:5px;font-size:0.85em;resize:none!important;" rows="4" maxlength="500" id="description" name="description" readonly></textarea></td>
                                        </tr>
                                    </tbody>
                                </table>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-success"
                             onclick="updInterview('1')" >同意</button>
                            <button type="button" class="btn btn-default"
                             onclick="divshow()" >拒绝</button>
                        </div>
                        <div id="refuse" name="refuse" style="display:none;">
                            <table class="table">
	                            <tbody>
	                               <tr>
                                       <th style="line-height: 65px;width:124px;">理由：</th>
                                       <td> <textarea style="width:700px;padding-left:5px;background-color:#ecf0f9;border:0;border-radius:5px;font-size:0.85em;resize:none!important;" rows="4" maxlength="500" id="reason" name="reason"></textarea></td>
                                   </tr>
	                            </tbody>
                            </table>
                            <div class="modal-footer">
	                            <button type="button" class="btn btn-success"
	                                onclick="updInterview('2')" >确定</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
       <div class="modal_h20 fade bs-example-modal-sm in" id="tongyi"
           data-toggle="modal" tabindex="-1" role="dialog"
           aria-labelledby="mySmallModalLabel" aria-hidden="false"
           data-target="" data-backdrop="static">
           <div class="modal-dialog modal-lg">
               <div class="modal-content">
                   <div class="modal-header">
                       <button type="button" class="close" data-dismiss="modal" onclick="divhidden()">
                           <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                       </button>
                   </div>
                   <table class="table">
                         <tbody>
                             <tr>
                                 <th style="line-height: 40px">面试开始时间：</th>
                                 <td colspan="3">
                                   <input class="inputtxt2" id="tongyi_start_time" name="tongyi_start_time" onFocus="WdatePicker({isShowWeek:true});" 
                                   type="text" value="" readonly/>
                                 </td>
                             </tr>
                             <tr>
                                 <th style="line-height: 40px">面试结束时间：</th>
                                 <td colspan="3">
                                   <input class="inputtxt2" id="tongyi_end_time" name="tongyi_end_time" onFocus="WdatePicker({isShowWeek:true});" 
                                   type="text" value="" readonly/>             
                                 </td>
                             </tr>
                             <tr>
                                 <th style="line-height: 65px">描述：</th>
                                 <td> <textarea style="width:700px;padding-left:5px;background-color:#ecf0f9;border:0;border-radius:5px;font-size:0.85em;resize:none!important;" rows="4" maxlength="500" id="tongyi_description" name="tongyi_description" readonly></textarea></td>
                             </tr>
                         </tbody>
                     </table>
               </div>
           </div>
       </div>
       <div class="modal_h20 fade bs-example-modal-sm in" id="yijujue"
           data-toggle="modal" tabindex="-1" role="dialog"
           aria-labelledby="mySmallModalLabel" aria-hidden="false"
           data-target="" data-backdrop="static">
           <div class="modal-dialog modal-lg">
               <div class="modal-content">
                   <div class="modal-header">
                       <button type="button" class="close" data-dismiss="modal" onclick="divhidden()">
                           <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                       </button>
                   </div>
                   <table class="table">
                         <tbody>
                             <tr>
                                 <th style="line-height: 65px">拒绝理由：</th>
                                 <td> <textarea style="width:700px;padding-left:5px;background-color:#ecf0f9;border:0;border-radius:5px;font-size:0.85em;resize:none!important;" rows="4" maxlength="500" id="jujue_reason" name="jujue_reason" readonly></textarea></td>
                             </tr>
                         </tbody>
                     </table>
               </div>
           </div>
       </div>
      
     <div class='modal my-modal-alert' id='my-modal-errorfile-alert'>
		<div class='modal-dialog boxBodySmall'>
			<div class='modal-content'
				style="width: 260px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
				<div class='modal-body' id='modal-body-alert'>
					<div style="float:left;margin-bottom:15px;"><img alt="" src="<%=basePath%>shyl/images/mark.png"></div><div style="float:right;margin-right:50px;margin-top:5px;" id="warntext">该职位已被删除！</div>
				</div>
			</div>
		</div>
	</div>
        <script type="text/javascript">
        // 面试
	    function mianshi(start_time, end_time,description, id) {
	    	$("#interview_id").val(id);
            $("#start_time").val(start_time);
            $("#end_time").val(end_time);
            document.getElementById("description").innerText = description;
	 		$("#mianshi" + recruiters).attr("data-target", "#mianshi");
			$("#mianshi").attr("data-target", "");  
		}
	 	// 已同意
	    function tongyi(start_time, end_time,description, id) {
            $("#tongyi_start_time").val(start_time);
            $("#tongyi_end_time").val(end_time);
            document.getElementById("tongyi_description").innerText = description;
	 		$("#tongyi" + recruiters).attr("data-target", "#tongyi");
			$("#tongyi").attr("data-target", "");  
		}
	    // 应聘者拒绝面试
	    function yijujue(reason) {
		    document.getElementById("jujue_reason").innerText=reason;
	    	$("#yijujue" + user_id).attr("data-target", "#yijujue");
			$("#yijujue").attr("data-target", "");  
		}
        //拒绝理由div显示
        function divshow(){
        	document.getElementById("refuse").style.display="";
        }
        function updInterview(status){
        	var reason = $("#reason").val();
        	var interview_id = $("#interview_id").val();
        	window.location="<%=basePath%>myresume/interviewupd.act?status="+status+"&reason="+reason+"&id="+interview_id;
        }
        function divhidden(){
        	document.getElementById("refuse").style.display="none";
        }
        
		//打开职位
		function showJob(id, companyId, recruitmentInfoId) {
				var ret=false;
		    	//通过Ajax向后台传值
				$.ajax({
					type : "POST",
					url :'<%=basePath%>'+'company/existJob.act',
					data : {
						company_id : companyId,
						recruitment_info_id : recruitmentInfoId
					},
					dataType : 'json',
					async:false, 
					success : function(data) {
						if(data.result=="0"){
							$("#" + id).attr('href','<%=basePath%>job/detail/info.act?companyId=' + companyId + '&positionId=' + recruitmentInfoId + '&flag=control');
							ret=true;
						}else{
							$('#warntext').html("该职位已被删除！");
							$('#my-modal-errorfile-alert').show ().delay (1000).fadeOut ();
						}
						
					}
				});
		    	return ret;		
		}
        </script>
<div class="clear"></div>
<!--<footer开始>-->
<jsp:include page="../common/footer.jsp"></jsp:include>
<!--</footer结束>-->
</body>
</html>
