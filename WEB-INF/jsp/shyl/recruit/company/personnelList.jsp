<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv=”X-UA-Compatible” content=”IE=EmulateIE7″ />
<meta charset="utf-8">
<title>找人才_济南市服务外包公共服务平台</title>
<jsp:include page="../../common/header.jsp"><jsp:param name="id" value="rctd" /></jsp:include>
<link href="/SHYL/shyl/css/maincss/rencai.css" rel="stylesheet" type="text/css"/>
<script src="/SHYL/shyl/js/mainjs/jquery-v1.10.2.js" type="text/javascript"></script>
<script src="/SHYL/shyl/js/mainjs/box.js" type="text/javascript"></script>
<style type="">
.puts {
    width: 270px;
    padding-left: 5px;
    line-height: 42px;
    height: 36px;
    border: 0;
    border-radius: 5px;
    border: 1px solid #dbdbdb;
    font-size: 0.85em;
    background-color: #ffffff;
}
</style>
</head>
<body>
<!--<header开始>-->
<!--</header结束>-->
<div class="clear"></div>
  <form class="form-horizontal" id="personelForm" action="<%=basePath%>company/toPersonnelList.act" method="post">
  			<input type="hidden" name="PARENT_ID" id="PARENT_ID" value="${pd.PARENT_ID}"/>
			<div class="rc_qy_paihang clearfix" style="margin-top: 100px;padding-bottom:20px;">
				<div class="rc_zw_category">
			     <input id="HopeJobId" name="HopeJobId" type="hidden" value="${pd.HopeJobId}" />
			     <dl>
				     <dt>职位：</dt>
					<dd class="fd7">
					    <!-- 开始循环 -->	
						<c:choose>
							<c:when test="${not empty jobPareCateList}">
								<c:forEach items="${jobPareCateList}" var="var" varStatus="vs">
									<a id="fd${var.POSITION_ID}" href="#" onclick="jobCilid(${var.POSITION_ID})">${var.POSITION_NAME}</a>
							</c:forEach>
							</c:when>
						</c:choose>
						<input type="hidden" id="zhiwei" value=${pd.jobType} />
					</dd>
				</dl>
				<dl>
				     <dt>类别：</dt>
					<dd class="fd7" id="types">
						  <c:forEach items="${jobChilCateList}" var="jobChilCate">
			              <a href="javascript:void(0);"><input type="checkbox" onclick="checkboxs();" id="${jobChilCate.POSITION_ID}" name="Job" value="${jobChilCate.POSITION_ID}" <c:if test="${fn:contains(pd.HopeJobId, jobChilCate.POSITION_ID)}">checked</c:if>/>
			              <span>${jobChilCate.POSITION_NAME}</span>
			              </a>
		                  </c:forEach>
					</dd>
				</dl>
				<dl>
				<dt>地点：</dt>
				<dd class="fd7">
				<select class="inputtxt2 valid puts" id="ProvinceId" name="ProvinceId" >
				<option value="">--选择省--</option>
				<c:forEach items="${provincesList}" var="provinces">
						<option value="${provinces.REGION_ID}" <c:if test="${provinces.REGION_ID == pd.ProvinceId }">selected</c:if>>${provinces.REGION_NAME}</option>
				</c:forEach>												
				</select>
				~
				 <select id="CityId" name="CityId" class="inputtxt2 valid puts">
                 </select>
                 <input type="hidden" id="city" name="city" value="${pd.CityId }" />
				</dd>
				</dl>
				<dl>
				<dt>学历：</dt>
				<dd class="fd7">
				 <select class="inputtxt2 valid puts" id="EduBackground" name="EduBackground"><option value="">无</option>
							   <c:forEach items="${educationList}" var="education">
										<option value="${education.DISTINGUISH_ID}" <c:if test="${education.DISTINGUISH_ID == pd.EduBackground }">selected</c:if>>${education.VALUE}</option>
								</c:forEach>
						    </select>
				</dd>
				</dl>
				<dl>
				<dt>年限：</dt>
				<dd class="fd7">
				 <select class="inputtxt2 valid puts" id="WorkYear" name="WorkYear"><option value="">无</option>
							  <c:forEach items="${jobTimeList}" var="jobTime">
										<option value="${jobTime.DISTINGUISH_ID}" <c:if test="${jobTime.DISTINGUISH_ID == pd.WorkYear }">selected</c:if>>${jobTime.VALUE}</option>
								</c:forEach>
						    </select>
				</dd>
				</dl>
				<dl>
				<dt>薪资：</dt>
				<dd class="fd7">
				 <select class="inputtxt2 valid puts" id="HopeSalaryID" name="HopeSalaryID"><option value="">无</option>
							<c:forEach items="${salRangeList}" var="salRange">
										<option value="${salRange.DISTINGUISH_ID}" <c:if test="${salRange.DISTINGUISH_ID == pd.HopeSalaryID }">selected</c:if>>${salRange.VALUE}</option>
								</c:forEach>
						    </select>
				</dd>
				<dt>搜索：</dt>
				<dd>
					<input type="text" class="search2" style="padding-left: 5px; margin-top: 5px;width: 268px;" placeholder="请输入姓名" name="NAME" value="${pd.NAME}"/>
					<input type="button" class="searchbtn" value="搜索" style="margin-top: 5px;" onclick="submits();"/>
				</dd>
				
				
				</dl>	
						
				</div>
			</div>
				<div class="recruit_list">
					<table>
						<thead>
							 <tr class="active">
				                    <td style="width: 10%;">姓名</td>
				                    <td style="width: 10%;">性别</td>
				                    <td style="width: 10%;">年龄</td>
				                    <td style="width: 15%;">期望薪资</td>
				                    <td style="width: 10%;">期望地点</td>
				                    <td style="width: 10%;">更新日期</td>
				                </tr>
						</thead>
						<tbody>
				            <!-- 开始循环 -->	
								<c:choose>
									<c:when test="${not empty varList}">
										<c:forEach items="${varList}" var="var" varStatus="vs">
				                    <tr>
				                        <td><a href="<%=basePath%>company/showResume.act?userId=${var.USER_ID}&cvId=${var.CV_ID}&flag=personel" target="_blank">${var.NAME}</a></td>
				                            <td>${var.SEX}</td>
				                        <td>${var.AGE}</td>
				                        <td>${var.EXPECTED_SALARY}</td>
				                        <td>
				                        	<c:if test="${var.EXPECTED_WORK_PROVINCE!=null}">
				                        	${var.EXPECTED_WORK_PROVINCE}&nbsp;-
				                        	</c:if>
				                        	<c:if test="${var.EXPECTED_WORK_CITY!=null}">
				                        	${var.EXPECTED_WORK_CITY}
				                        	</c:if>
				                        </td>
				                        <td>${var.UPDATE_TIMESTAMP}</td>
				                    </tr>
									</c:forEach>
									</c:when>
									<c:otherwise>
										<tr><td align="center" colspan="6" style="color: #000000; font-size: 16px; ">没有相关数据</td></tr>
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
										style="padding-top: 0px; margin: 0 auto; display: inline-block;">${page.platformPageStr}</div></td>
							</tr>
						</table>
					</div>
					</form>
<div class="clear"></div>
<!--<footer开始>-->
<%@ include file="../../common/footer.jsp"%>
<!--</footer结束>-->
<script type="text/javascript">
 $.ajaxSetup({ async: false });
 $(document).ready(function () {
	 checkboxs();
	   $("#ProvinceId").change(function () { BindCId(); });
        BindCId();
    });
     function BindCId() {
        var PID = $("#ProvinceId").val();
        $("#CityId").find('option').remove();
        var city = $("#city").val();
        if (PID == "") {
            $("<option value=''>---市---</option>").appendTo("#CityId");
        }
        $.post('<%=basePath%>joblist/cityList.act', { 'PID': PID }, function (data) {
            $.each(data.cityList, function (i, list) {
            	if (city == list.REGION_ID) {
                    $("<option value='" + list.REGION_ID + "' selected>" + list.REGION_NAME + "</option>").appendTo("#CityId");
            	} else {
                    $("<option value='" + list.REGION_ID + "'>" + list.REGION_NAME + "</option>").appendTo("#CityId");
            	}
            });
        });
        //$("#CityId").val('');
    }
   //控制用户最多只能选择5个checkbox选项
  function checkboxs(){
	  var n = $("input[name='Job']:checked").length;
      if (n >= 5) {
          $("[name='Job']").each(function () {
              if (!$(this).is(":checked")) {
                  $(this).attr("disabled", true);
              }
          });
      } else {
          $("[name='Job']").each(function () {
              $(this).attr("disabled", false);
          });
      }
      
  }
   function jobCilid(pid){
	   $("#PARENT_ID").val(pid);
	   $.ajax({
			type: "POST",
			url: '<%=basePath%>company/getChild.act?tm='+new Date().getTime(),
	    	data: {PARENT_ID:pid},
			dataType:'json',
			//beforeSend: validateData,
			cache: false,
			success: function(data){
				$("#types").empty();
				if(data.length>0){
					$.each(data, function (i, list) {
$("<a href='javascript:void(0);'><input type='checkbox' onclick='checkboxs();' id='"+list.POSITION_ID+"' name='Job' value="+list.POSITION_ID+"<span>"+list.POSITION_NAME+"</span>").appendTo("#types");
		            });
				}
			}
		});
   }
   function submits(){
	   var relateIds = "";
       $("input[name='Job']:checked").each(function () {
           relateIds += $(this).attr('value') + ",";
       });//得到选中复选框的value
       relateIds = relateIds.substring(0, relateIds.length - 1);
       $("#HopeJobId").val(relateIds);
	   $("#personelForm").submit();
   }
   
</script>
</body>
</html>
