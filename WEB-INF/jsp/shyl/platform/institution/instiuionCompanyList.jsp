<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<title>收藏夹_济南市服务外包公共服务平台</title>
<base href="<%=basePath%>">
<link rel="stylesheet" href="<%=basePath%>shyl/css/pagination.css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/maincss/css.css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/maincss/mypage.css">
<script src="<%=basePath%>shyl/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>shyl/js/jquery.tips.js"></script>

<script src="<%=basePath%>shyl/js/bootstrap.min.js"></script>
<script src="<%=basePath%>plugins/attention/zDialog/zDrag.js"></script>
<script src="<%=basePath%>plugins/attention/zDialog/zDialog.js"></script>
<!--分页  -->
<script type="text/javascript" src="<%=basePath%>shyl/js/common/head.js"></script>
<script src="shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript">
        $(function () {
            $('#mega-menu-8').dcMegaMenu({
                rowItems: '3',
                speed: 'fast',
                effect: 'fade'
            });
        });
    </script>
    <style type="text/css">

table{  
    table-layout:fixed; 
}  
.tds a{  
    width:100%;  
    word-break:keep-all;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
}
.tds {  
    width:100%;  
    word-break:keep-all;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
}
</style>
</head>


<body id="top" style="background-color: #f7f7f7;">
	<%@ include file="../../common/header.jsp"%>
	<!--</header结束>-->
<div class="clear"></div>
<div class="register-box p0">
	<div class="rticon"></div>
	<jsp:include page="../../common/left.jsp"><jsp:param value="45" name="menuType"/></jsp:include>
		<div class="mypage_right">
			<h2>收藏夹</h2>
			<div class="tab" style="margin-bottom:0;">
				<form action="<%=basePath%>/instiuioncompany/list.act" method="post" name="collectionform" id="collectionform">
					<input type="text" class="search" id="nameTitle" name="nameTitle" value="${pd.nameTitle}" placeholder="请输入简历名称关键字" onblur="trim(this);" style="background-color: #ecf0f9;">
					<input type="submit" class="sbtnNew" value="搜索" onclick="search();" style="margin-top:0px;line-height: 46px;height: 46px;color: #ffffff;margin-left: 20px;">
				</form>
			</div>
			<div class="jianli">
				<form action="<%=basePath%>/instiuioncompany/list.act"
					method="post" name="Form" id="Form">

					<table class="tableclass">
						<thead>
							<tr>
								<th style="padding-left: 30px; text-align: left;">简历名称</th>
								<th style="text-align: center;">姓名</th>
								<th style="text-align: center;">更新日期</th>
								<th style="text-align: center;">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty varList }">
								<tr>
									<td colspan="4" style="text-align: center;"><span
										style="color: #ff6a00">没有相关记录</span></td>
								</tr>
							</c:if>
							<c:forEach items="${varList}" var="var" varStatus="vs">
								<tr>
									<td class="tds" style="padding-left: 30px; text-align: left;"><a
										 id="cv_id${vs.index}" href="javascript:void(0);" 
										target="_blank" title="${var.cv_name}" onclick="return showCv('cv_id${vs.index}','${var.info_id}','${var.cv_id}');">${var.cv_name}</a></td>
									<td  style="text-align: center;" class="tds" >${var.name}</td>
									<td style="text-align: center;">${var.update_timestamp}</td>
									<td style="text-align: center;"><a href=""
										data-toggle="modal" id="deljob_${var.record_id}"
										onclick="del(${var.record_id});" data-target="#deljob"
										class="delete">删除</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
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
	
<div class="modal_h20 fade bs-example-modal-sm in" id="deljob" data-toggle="modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="false" data-target=""><div class="modal-dialog modal-sm">
			    <div class="modal-content">
			        <div class="modal-header">
			            <button type="button" class="close" data-dismiss="modal" onclick="Clear()"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			            <h4 class="modal-title" id="myModalLabel">提示</h4>
			        </div>
			        <div class="modal-body">
			            <p id="warntext">收藏简历取消后不可恢复，确定取消吗？</p>
			        </div>
			        <div class="modal-footer">
			            <input type="hidden" id="collectionInfoId" value="">
			            <button type="button" class="btn btn-success" onclick="Delete()" data-dismiss="modal">确认</button>
			            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			        </div>
			    </div>
			</div>
			</div>
	<div class='modal my-modal-alert' id='my-modal-errorfile-alert'>
		<div class='modal-dialog boxBodySmall'>
			<div class='modal-content'
				style="width: 260px; text-align: center; position: fixed; right: 40%; bottom: 45%;">
				<div class='modal-body' id='modal-body-alert'>
					<div style="float:left;margin-bottom:15px;"><img alt="" src="<%=basePath%>shyl/images/mark.png"></div><div style="float:right;margin-right:50px;margin-top:5px;" id="warntext">该简历已被删除！</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	    function Delete() {
	    	var url= "<%=basePath%>instiuioncompany/del.act";
	        $.post(url, { id: $("#collectionInfoId").val()}, function (data) {
	        	if(data.result==1){
	        		location.href = '<%=basePath%>instiuioncompany/list.act';
	        	}else{
	        		alert("删除失败");
	        	}
	            
	        });
	    }
	    function del(id) {
	            $("#deljob_" + id).attr("data-target", "#deljob");
	            $("#deljob").attr("data-target", "");
	            $("#collectionInfoId").val(id);
	    }
	    
	  //检索
		function search(){
			top.jzts();
			$("#collectionform").submit();
		}
	  
		//打开简历
		function showCv(id, cvUserId, cvId) {
				var ret=false;
		    	//通过Ajax向后台传值
				$.ajax({
					type : "POST",
					url :'<%=basePath%>'+'company/existCv.act',
					data : {
						userId : cvUserId,
						cvId : cvId
					},
					dataType : 'json',
					async:false, 
					success : function(data) {
						if(data.result=="0"){
							$("#" + id).attr('href',"<%=basePath%>company/showResume.act?userId="+ cvUserId +"&cvId=" + cvId + "&flag=personel");
							ret=true;
						}else{
							$('#my-modal-errorfile-alert').show().delay(1000).fadeOut();
						}
						
					}
				});
		    	return ret;		
		}
	</script>
	
	<%@ include file="../../common/footer.jsp"%>

</body>
</html>
