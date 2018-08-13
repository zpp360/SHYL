<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<title>培训晋升-订单支付（购买课程）</title>
<base href="<%=basePath%>">

<jsp:include page="../common/header.jsp"><jsp:param name="id" value="pxjs" /></jsp:include>
<link href="<%=basePath%>shyl/css/integrated/css.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>shyl/css/integrated/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/styleRegist.css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/question/bootstrap/js/bootstrap.js">
<script src="<%=basePath%>shyl/js/layer/layer.js"></script>
<script type="text/javascript">
	function pay(){
		var courseName=$("#course_name").val();
		var price=$("#totalAmount1").val();
		var commodityId = $("#commodityId").val();
		var classTypeId = $("#course_id").val();
		var teaching_style = $("#teaching_style").val();
		var subject_id = $("#subject_id").val();
		if(price == "0" || price == "0.00"){
			$('#wqfw').modal('show');
		}else{
			//动态设置名称
			$.ajax({
				type : "POST",
				url :  '<%=basePath%>institution/dopay.act',
				data: {
					orderNumber: $("#orderNumber").val(),
					courseName:courseName,
					price:price,
					commodityId:commodityId,
					course_id:classTypeId,
					teaching_style:teaching_style,
					subject_id:subject_id,
		        },
				dataType : 'json',
				cache : false,
				success : function(data) {
					if("success" == data.result){
					$.ajax({
						type : "POST",
						url :  '<%=basePath%>institution/doGet.act',
						data : { 
							orderNumber : $("#orderNumber").val(),
							courseName:courseName,
							price:price,
							commodityId:commodityId,
							course_id:classTypeId,
							teaching_style:teaching_style,
							subject_id:subject_id,
							},
						dataType : 'json',
						cache : false,
						success : function(data) {
							$("#imgsrcW").attr("src","<%=basePath%>images/"+data.fileNameW);
							console.info(data);
							$('#alipay').modal('show');
						},
						error : function(data) {
							console.info(data);
						}
					});
					$("#imgsrc").attr("src", "<%=basePath%>images/"+data.fileName);
					$("#outTradeNo").val(data.outTradeNo);
					$("#totalAmount").val("￥"+data.totalAmount);
					$("#subject").val(data.subject);
					$("#subject").attr("title",data.subject);
					$("#totalAmount").attr("title","￥"+data.totalAmount);
					$("#outTradeNo").attr("title",data.outTradeNo);
					}
					}
				});
			  }
	}
	function payAndSyncBuy(){
		$("#payForm").submit();
	}
</script>
<style type="text/css">
.style2{margin-top: 20px;margin-bottom: 20px;}
.style2-big{margin-top:5px;width: 100%;}
.bidetailed{border: 0px;padding:3px;}
.biddetailed-tit{border-left:0px;}
.style2{width: 150px;}
div.style3 {
	background-color: #fff;
	width: 440px;
	min-height: 256px;
	padding: 20px;
	padding-bottom: 50px;
	margin: 0 auto;
	border: 1px solid #edf1fc;
	position: relative;
	margin-top: 120px;
	overflow: hidden;
}
.imgsrc{width:200px;height:200px}
.inputtxt2s{width: 150px;padding-left: 5px;background-color: #ffffff;line-height: 42px;height: 42px;border:0;border-radius: 5px;font-size: 0.85em;}
.inputtxt3s{width: 50px;padding-left: 5px;background-color: #ffffff;line-height: 42px;height: 42px;border:0;border-radius: 5px;font-size: 0.85em;}
.leftdiv{margin-left: 0px;width: 100px;background-color: green;float: left;height: 100px;}
.rightdiv{margin-right:10%;width: 80%;float: right;height: 100px;}
</style>
</head>
<body>
	<div class="clear"></div> 
	<div class="register-box clearfix">
    	<div class="rticon"></div>
    	<div class="payList" style="margin-left: 50px;">
		<div class="bidetailed mt40" style="background-color: #f8f9fc;">
			<div class="leftdiv">
				<c:if test="${orderNumber != '' && orderNumber != null}">
					<img src="shyl/images/successImg.jpg" width="100px" height="100px">
				</c:if>
				<c:if test="${orderNumber == '' && orderNumber == null}">
					<img src="shyl/images/del1.jpg" width="100px" height="100px">
				</c:if>
			</div>	 
			<div class="rightdiv">
				<p class="style2-big fl">
					<c:if test="${orderNumber != '' && orderNumber != null}">
						<span class="style3" style="width: 100%;font-weight: bold;">课程订单提交成功，订单号${orderNumber}，请您尽快付款</span>
					</c:if>
					<c:if test="${orderNumber == '' && orderNumber == null}">
						<span class="style3" style="width: 100%;font-weight: bold;">课程订单提交失败，请重新提交</span>
					</c:if>			       	
		       	</p>
		       	<p class="style2-big fl">
			       	<span class="style3">商品名称：</span>
			       	<span class="style3" style="width:695px;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">${pd.courseName}</span>
		       	</p>
		       	<p class="style2-big fl">
			       	<span class="style3">价格：</span>
			       	<span class="style3" style="width:695px">￥${pd.price}</span>
		       	</p>
			</div>
    	</div>
	    <div class="bidetailed mt40" style="weight:250px;height: 100px">
        	<div class="col-sm-2 col-sm-offset-2" style="margin-top: 10px;float: right;margin-top:17px;margin-right: 200px;">
				<button type="button" onclick="pay();" class="btn btn-success btn-block">
					<span class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp;支付
				</button>
			</div>
	    </div>
    	</div>
	</div>
	<!-- 	支付宝支付 -->
	<div class="modal fade in" id="alipay" role="dialog"
		aria-labelledby="deledu">
		<div class="clear"></div>
		<div class="style3">
			<button type="button" class="close" data-dismiss="modal">
				<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
			</button>
			<div class="rticon"></div>
				<label style="color: red;padding-left:42%;padding-bottom:10px;">订单內容</label>
			<div style="padding-left:25%">
				<div>
					订单标题：<input style="width:200px;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" class="inputtxt2s" disabled="disabled" id="subject"	value="" />
				</div>
				<div>
					订单号：<input style="width:200px;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" class="inputtxt2s" disabled="disabled" id="outTradeNo" value="" />
				</div>
				<div>
					订单金额：<input style="width:200px;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" class="inputtxt3s" disabled="disabled" id="totalAmount" value=""/>
				</div>
			</div>
			<div>
			 	<img class="imgsrc" id="imgsrcW" style="width:225px;height:225px;"src="${data.fileNameW}" >  
				<img class="imgsrc" id="imgsrc" src="${data.fileName}"></img>
			</div>
			<div>
				<label style="padding-left:70px;height:15px" id="imgtitle"style="color: red;">微信二维码</label>
				<label style="padding-left:130px;height:15px" id="imgtitle"style="color: red;">支付宝二维码</label>
			</div>
		</div>
		<div class="clear"></div>
		<script type="text/javascript">
			function alipay(){
				$("#alipay").modal('hide');
			}
				getStates();
			//ajax短轮询获取后台核销的状态
			function getStates(){
				jQuery.ajax({
			        type: "POST",
			        url: "<%=basePath%>institution/executeZfjg.act",
			        data: {
			        	orderNumber: $("#orderNumber").val(),
			        },
			        dataType: "json",
			        success: function (data) {
						if(data.result == true){
							window.location.href='<%=basePath%>institution/sucessPage.act?orderNumber='+$("#orderNumber").val();
						}else if (data.result == false) {
							//检测到支付，继续调用
							setTimeout(function () {getStates();}, 5000);
						} else{
							//出错了
						}
			        },
			        error: function () {
			        }
			    });
			} 
		</script>
	</div>
		<!-- 无权访问开始 -->
	<div class="modal fade bs-example-modal-sm" id="wqfw" role="dialog"
		aria-labelledby="mySmallModalLabel">
		<form action="<%=basePath%>institution/payAndSyncBuy.act" method="post" name="payForm" id="payForm">
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
						<h4>购买后可进行观看,确认购买此课程?</h4>
						<input type="hidden" name="orderNumber"id="orderNumber" value="${orderNumber}"/>
						<input type="hidden" name="commodityId" id="commodityId" value="${pd.commodityId}">
			       		<input type="hidden" name="course_name" id="course_name" value="${pd.courseName}">
			       		<input type="hidden" name="totalAmount1" id="totalAmount1" value="${pd.price}">
			       		<input type="hidden" name="course_id" id="course_id" value="${pd.classTypeId}">
			       		<input type="hidden" name="teaching_style" id="teaching_style" value="${pd.teaching_style}">
			       		<input type="hidden" name="subject_id" id="subject_id" value="${pd.subject_id}">
					</div>
					<div class="modal-footer" style="height:20px">
						<button id="EduButtonedu" type="button" class="btn btn-success"
							onclick="payAndSyncBuy()" data-toggle="modal">确认</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
	<!-- 无权访问结束 -->
	<div class="clear"></div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>
