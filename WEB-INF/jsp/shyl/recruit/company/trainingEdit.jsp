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
<title>修改出差人员_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<base href="<%=basePath%>">
<%@ include file="../../common/header.jsp"%>
<link rel="stylesheet" href="<%=basePath%>shyl/css/work.css">
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css">
<script src="<%=basePath%>shyl/js/mainjs/errImage.js"
	type="text/javascript"></script>
<script src="<%=basePath%>shyl/js/datepicker/WdatePicker.js"
	type="text/javascript"></script>
<!-- 新追加部分 -->
<script src="<%=basePath%>shyl/js/bootstrap.js"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<!--引入弹窗组件end-->

<style type="text/css">
.inputtxt2NNew {
	width: 275px;
	padding-left: 5px;
	background-color: #ecf0f9;
	line-height: 42px;
	height: 42px;
	border: 0;
	border-radius: 5px;
	font-size: 0.85em;
}

.textareatxt2 {
	background-color: #f7f7f7 !important;
}

.edui-default .edui-editor {
	background-color: #ecf0f9;
}

.modal {
	z-index: 10176524 !important;
}

div.inputtxt2 {
	width: 275px;
	float: left;
}

div.inputtxt2 b {
	float: right;
	margin-top: 20px;
	margin-right: 7px;
}

a:hover, a:focus {
	color: inherit;
}

* {
	box-sizing: content-box;
}

.modal-dialog {
	margin: 150px auto !important;
}
</style>

</head>
<body id="top" style="background-color: #f7f7f7;">
	<div class="clear"></div>
	<div class="register-box p0">
		<div class="rticon"></div>
		<jsp:include page="../../common/left.jsp"><jsp:param
				value="2" name="menuType" /></jsp:include>
		<!--  我的简历管理部分页面-->
		<div class="mypage_right">
			<h2>修改出差人员</h2>
			<div class="input_class" style="margin-bottom: 100px;">
				<form class="form-horizontal" id="form1" method="post" role="form">
					<input type="hidden" value="${pd.info_id}" id="info_id"
						name="info_id">
						<input type="hidden" value="${pg.train_id}" id="train_id"
						name="train_id">
						<input type="hidden" value="${pg.id}" id="ids"
						name="id">
					<ul style="margin-bottom: 20px;">
						<li><span><small style="color: red">*</small>&nbsp;起始时间：</span>
							<input id="strart_time" name="strart_time" class="inputtxt2"
							style="width: 275px;" value="${pg.strart_time}"  onFocus="WdatePicker({isShowWeek:true});"
							type="text" /></li>
						<li><span><small style="color: red">*</small>&nbsp;结束时间：</span>
							<input id="end_time" name="end_time" class="inputtxt2"
							style="width: 275px;" value="${pg.end_time}" onFocus="WdatePicker({isShowWeek:true});"
							type="text" />
						<li><span><small style="color: red">*</small>&nbsp;实训人员：</span><input
							type="text" class="inputtxt2" style="width: 275px;"
							id="evection_people" value="${pg.evection_people}"  maxlength=10 name="evection_people" onblur="trim(this);">
					</ul>
					<div class="jianli" style=" float: left"">
						<table class="tableclass" style="width: 65%; margin-left: 15%; float: left">
							<thead>
								<tr>
									<th style="text-align: center;">凭证号</th>
									<th style="text-align: center;">人民币(元)</th>
									<th style="text-align: center;">操作</th>
								</tr>
							</thead>
							<tbody  id="fm2_table_body" >
								<c:choose>
									<c:when test="${not empty editList}">
										<c:forEach items="${editList}" var="var" varStatus="vs">
											<tr>
												<input type="hidden" id="id${vs.index}" value="${var.id}" name="id"/>
												<td class="bgc_tt short" style="text-align: center;"><input type="text" class="inputtxt2 c_number" style="width: 93%;" id="certificate_number${vs.index}" value="${var.certificate_number}" maxlength="20" name="certificate_number" onkeyup="this.value=this.value.replace(/\D/g,'')" onblur="trim(this);"></td>
												<td class="bgc_tt short" style="text-align: center;"><input type="text" class="inputtxt2 c_money" style="width: 93%;" id="money${vs.index}" value="${var.money}" maxlength="10" name="money" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" style="ime-mode:disabled" onblur="changeFloat(this);"></td>
												<td class="bgc_tt short" style="text-align: center;">
												<input type='button' class='btn btn-success btn-block' value='删除' style='width: 63px;height:25px;margin-left:10%;' onclick='removeNewPersonRow(this)'/>
												</td>
											</tr>
										</c:forEach>
									</c:when>
								</c:choose>
							</tbody>	
						</table>
						<input type="button" class="btn btn-success btn-block" style="width: 63px;height:25px;bottom:0;float: left;" value="增加"  onclick="addNewPersonRow()"/>
					</div>

				</form>

				<div class=" col-sm-2" style="margin-left: 25%; margin-top: 5%">
					<button type="button" class="btn btn-success btn-block"
						onclick="sub()">
						<span class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp;保存
					</button>
				</div>
					<div class="col-sm-2" style="margin-top: 5%;">
					<a onclick="GO()"
						class="btn btn-default btn-block"><span
						class="glyphicon glyphicon-circle-arrow-left"></span>&nbsp;&nbsp;返回</a>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>

	<%@ include file="../../common/footer.jsp"%>
	<!--引入表单验证end-->
	<script type="text/javascript">
	function yzs(id,text){
		if(new RegExp(/[^\-?\d.]/g).test(text)){
			$("#"+id).val("");
		}
	}
	
	function addNewPersonRow(){
		 var bodyObj=document.getElementById("fm2_table_body");
		 var yz="value=value.replace(/[^\-?\d.]/g,'')";
		 bodyObj.style.display = '';
		    if(bodyObj==null)   
		    {  
		        alert("Body of Table not Exist!");  
		        return;  
		    }  
		    var rowCount = bodyObj.rows.length;
		    var count = rowCount -1;
		    var newRow = bodyObj.insertRow(rowCount++);
		    var firstCell = newRow.insertCell(0);
		    var secondCell = newRow.insertCell(1);
		    var threeCell = newRow.insertCell(2);
		    firstCell.className = "bgc_tt short";  //this is a css
		    secondCell.className = "bgc_tt short";
		    threeCell.className = "bgc_tt short";
		    firstCell.colSpan = "1";
		    secondCell.colSpan = "1";
		    threeCell.colSpan = "1";
		    firstCell.style.textAlign = "center";
		    secondCell.style.textAlign = "center";
		    threeCell.style.textAlign = "center";
		    firstCell.innerHTML = "<input type='text' class='inputtxt2 c_number' style='width: 93%;' id='certificate_number"+count+"' maxlength=16 name='certificate_number"+count+"' onkeyup='yzs(this.id,this.value);' />";
		    secondCell.innerHTML="<input type='text' class='inputtxt2 c_money' style='width: 93%;'id='money"+count+"' maxlength=10 name='money"+count+"' onkeyup='yzs(this.id,this.value);' />";
		    threeCell.innerHTML="<input type='button' class='btn btn-success btn-block' value='删除' style='width: 63px;height:25px;margin-left:10%' onclick='removeNewPersonRow(this)'/>";
		 }	
	function removeNewPersonRow(inputobj){  
	    if(inputobj==null) return;  
	    var parentTD = inputobj.parentNode;  //parentNode是父标签的意思，如果你的TD里用了很多div控制格式，要多调用几次parentNode
	    var parentTR = parentTD.parentNode;  
	    var parentTBODY = parentTR.parentNode;  
	    parentTBODY.removeChild(parentTR);  
	}
	
	    // 返回
	    function GO() {
	    	location.href = '<%=basePath%>training/list.act?info_id='+$("#info_id").val();
		}
	    
		var trainArray = new Array();
		function sub(){
			var tr = $("table tbody tr").length;
			var trCount = tr - 1;
			var info_id = $("#info_id").val();
			var train_id = $("#train_id").val();
			
			var strart_time = $("#strart_time").val();
			var end_time = $("#end_time").val();
			var evection_people =$("#evection_people").val();
			if (strart_time == "") {
				$("#strart_time").tips({
					side : 2,
					msg : '请输入起始时间',
					bg : '#AE81FF',
					time : 2
				});
				return false;
			}
			if (end_time == "") {
				$("#end_time").tips({
					side : 2,
					msg : '请输入结束时间',
					bg : '#AE81FF',
					time : 2
				});
				return false;
			}
			if(strart_time>end_time){
	    		$("#end_time").tips({
	    			side : 3,
	    			msg : '结束时间不能小于开始时间！',
	    			bg : '#AE81FF',
	    			time : 2
	    		});
	    		$("#end_time").focus();
	    		return false;		
	    		}
			if (evection_people == "") {
				$("#evection_people").tips({
					side : 2,
					msg : '请输入出差人员',
					bg : '#AE81FF',
					time : 2
				});
				return false;
			}
			var result=true;
			$('table tbody tr').each(function(index,element){
				var dataAll=new Object();
				dataAll.strart_time = strart_time;
				dataAll.end_time = end_time;
				dataAll.evection_people = evection_people;
				var _this=$(this);
				_this.find('input[type="text"]').each(function(index,element){
					if ($(this).val() == "") {
						$(this).tips({
							side : 3,
							msg : '不能为空',
							bg : '#AE81FF',
							time : 2
						});
						trainArray = [];
						result = false;  
		                return false;  
					}else{
						if($(this).hasClass("c_number")){
							dataAll.certificate_number=$(this).val();	
						}
						if($(this).hasClass("c_money")){
							dataAll.money=$(this).val();	
						}
					}
					
				});
				 if (!result){
					 return false;  
				 }
	         		 
			    trainArray.push(dataAll);
			  })
			   if (!result)  
         		 return;  
			//通过Ajax向后台传值
			$.ajax({
				type : "POST",
				url : '<%=basePath%>training/update.act',
				data : {
					info_id : info_id,
					train_id : train_id,
					addList :JSON.stringify(trainArray)
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
					if ("success" == data.result) {
						window.location.href='<%=basePath%>training/list.act?info_id='+info_id;
					} else {
						
						location.reload();
						alert("保存失败");
					} 
				}
			});
		}
		
	</script>
</body>

</html>