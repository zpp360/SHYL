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
<base href="<%=basePath%>">

<meta charset="utf-8" />
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../../system/admin/top.jsp"%>
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<!-- 日期框 -->
<script type="text/javascript">
	//保存
	function save() {
		if ($("#attr_name").val() == "") {
			$("#attr_name").tips({
				side : 3,
				msg : '请输入场地名称',
				bg : '#FF5080',
				time : 2
			});
			$("#attr_name").focus();
			return false;
		}
		if ($("#attr_type").val() == "") {
			$("#attr_type").tips({
				side : 3,
				msg : '请选择所属场地',
				bg : '#FF5080',
				time : 2
			});
			$("#attr_type").focus();
			return false;
		}
		//ueditor获取纯文本，给app使用
		var content = UE.getEditor('attr_desc').getContentTxt();
		$("#attr_desc").val(content);
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
</script>
<style type="text/css">
.upload_img{
	float: left;width: 60%;position: relative;
}
.upload_img img{float: left;}
.upload_img a{
	position: absolute;
	left: 210px;
	top:0;
	font-size: 0.85em;
	border:0;
	background-color: #3961c2;
	color: #fff;
	padding: 0;
	width: 160px;
	text-align: center;
	height: 50px;
	line-height: 50px;
	display: inline-block;border-radius:4px;
    float: left;
    margin-top: 20px;
}
.upload_img p{
	position: absolute;
	bottom:50px;
	left: 210px;
	color: #737373;
	line-height: 30px;
	width: 60%;
	font-size: 1.1em;
	float: left;
}
.upload_img p i{
	color: #1c1c1c;font-weight: bold;
	font-size: 1.1em;
}
select, input[type="file"] {
    height: 45px;
    line-height: 30px;
}
.uploadbtn{
    position: absolute;
    top: 0;
    margin: 0;
    opacity: 0;
    -ms-filter: 'alpha(opacity=0)';
    font-size: 8px !important;
    direction: ltr;
    height: 100px;
    width: 300px;
    cursor: pointer;  
}
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
    *display: inline;
    *zoom: 1
}
.a-upload input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
    filter: alpha(opacity=0);
    cursor: pointer
}
.upload a{
	position: absolute;
	left: 330px;
	font-size: 0.85em;
	border:0;
	background-color: #3961c2;
	color: #fff;
	padding: 0;
	width: 100px;
	text-align: center;
	height: 30px;
	line-height: 30px;
	display: inline-block;border-radius:4px;
    float: left;
    margin-left: 100px;
}
.upload p{
	bottom:50px;
	left: 100px;
	color: #737373;
	line-height: 30px;
	width: 60%;
	font-size: 1.1em;
}
</style>
</head>
<body>
<br>
	<form action="<%=basePath%>extendAttr/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="attr_id" value="${pd.attr_id }"/>
		<div id="zhongxin">
			<table class="table ">
			    <tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>属性名称</B></td>
					<td><input type="text" value="${pd.attr_name}" name="attr_name" id="attr_name" maxlength="40"
						 style="height: 20px; width: 300px;" placeholder="请输入属性名称"
						title="属性名称" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>属性类型</B>
					</td>
					<td><select class="chzn-select" name="attr_type" id="attr_type"
						data-placeholder="请选择属性类型"  style="height: 20px; width: 315px;">
										<c:forEach items="${attrTypeList}" var="type">
											<option value="${type.distinguish_id }" <c:if test="${type.distinguish_id == pd.attr_type }">selected</c:if>>${type.distinguish_name }</option>
										</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>排序号</B></td>
					<td><input type="text" value="${pd.attr_sort}" name="attr_sort" id="attr_sort" maxlength="11" 
						 style="height: 20px; width: 300px;" placeholder="请输入排序号码"
						title="排序号" onblur="trim(this);" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap"
						style="width: 80px; text-align: left; padding-top: 13px;"><B>房间 介绍</B></td>
					<td><textarea id="attr_desc"  name="attr_desc" maxlength="10000" 
							style="min-height: 450px; margin: 0 auto; width: 80%;float:left" 
							title="单位介绍">${pd.attr_desc}</textarea></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		<div align="center" style="margin-top: 10px;">

			<a class="btn  btn-success" onclick="save();"><i class="icon-save"></i>保存</a> 
			<a class="btn  btn-light" onclick="returnback()"><i class=" icon-circle-arrow-left"></i>返回</a>

			<!-- <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a> -->
		</div>
		<div id="zhongxin2" class="center" style="display: none">
			<br /> <br /> <br /> <br /> <img src="<%=basePath%>static/images/jiazai.gif" /><br />
			<h4 class="lighter block green"></h4>
		</div>
	</form>
	<!-- 引入 -->
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript"
		src="static/js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->

	<!-- 日期框 -->
	<!-- 富文本编辑器start -->
	<!-- 配置文件 -->
	<script type="text/javascript" src="plugins/ueditor/ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript" src="plugins/ueditor/ueditor.all.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
	<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
	<!-- 实例化编辑器 -->
	<script type="text/javascript">
		var ue = UE.getEditor("attr_desc");
		//ueditor有标签文本

		function getContent() {
			var arr = [];
			arr.push(UE.getEditor('attr_desc').getContent());
			return arr.join("");
		}

		function clean() {
			ue.setContent("");
		}

		function setFocus() {
			UE.getEditor('attr_desc').focus();
		}
		//关联下拉菜单
		$(function(){
			//二级机构
			var knowledges = $("#mechanisms1").val();
			if(""!=knowledges){
				BindCId(knowledges);
			}else{
				BindCId(0);
			}
			$("#mechanism1").change(function() {
			    BindCId(0);
			});
			
			//三级机构
			var knowledges = $("#mechanisms2").val();
			if(""!=knowledges){
				BindCId1(knowledges);
			}else{
				BindCId1(0);
			}
			$("#mechanism2").change(function() {
			    BindCId1(0);
			});
			
			//合并的：$(function(){});
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
		});
		
		function BindCId(cid) {
			var PID = $("#mechanism1").val();
			$("#mechanism2").empty();
			if (PID == "") {
		        $("<option value=''>全部</option>").appendTo("#mechanism2");
		    }else{
		    	$.ajax({
					type:"POST",
					url:"<%=basePath%>unit/getmechanism2List.do",
					data:{'PID' : PID},
					dataType:"json",
					cache:false,
					success:function(data){
						var html='<option value="">全部</option>';
						$.each(data.mechanismlist2,function(i,list){
							if(list.id==cid){
								if(cid!=0){
									html+="<option value="+list.id+" selected='selected' >"+list.name+"</option>";
								}
							}else{
								html+="<option value="+list.id+">"+list.name+"</option>";
							}
						});
						$("#mechanism2").append(html);
						$("#mechanism2").trigger("liszt:updated");
					}
				});
		    }
		}
		
		function BindCId1(cid) {
			var PID = $("#mechanism2").val();
			$("#mechanism3").empty();
			if (PID == "") {
		        $("<option value=''>全部</option>").appendTo("#mechanism3");
		    }else{
		    	$.ajax({
					type:"POST",
					url:"<%=basePath%>unit/getmechanism3List.do",
					data:{'PID' : PID},
					dataType:"json",
					cache:false,
					success:function(data){
						var html='<option value="">全部</option>';
						$.each(data.mechanismlist3,function(i,list){
							if(list.id==cid){
								if(cid!=0){
									html+="<option value="+list.id+" selected='selected' >"+list.name+"</option>";
								}
							}else{
								html+="<option value="+list.id+">"+list.name+"</option>";
							}
						});
						$("#mechanism3").append(html);
						$("#mechanism3").trigger("liszt:updated");
					}
				});
		    }
		}
		
	</script>
	<!-- 富文本编辑器end -->

	<script type="text/javascript">
		$(top.hangge());
		//返回
	    function returnback(){
	    	window.location.href="<%=basePath%>extendAttr/list.do";
		}
		$(function() {
			//下拉框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			//日期框
			$('.date-picker').datepicker();
			$('.date-picker1').datepicker({
				language : 'zh-CN',
				format : 'yyyy-mm',
				weekStart : 1,
				todayBtn : 'linked',
				autoclose : 1,
				todayHighlight : 1,
				minViewMode : 'months', //这里就设置了默认视图为年视图
				minView : 3, //设置最小视图为年视图
				forceParse : 0
			});
		});
		
		
	</script>
<!-- 附件上传 -->
	<script type="text/javascript">
	var tips=function(id,msg){
		$("#"+id).tips({
			side : 2,
			msg : msg,
			bg : '#FF5080',
			time : 2
		});
	}
	
	//附件删除
	function removeAppendix(){
		var path = $("#appendix_path").val();
		$.post('<%=basePath%>government/deleteAppendix.do', {path:path}, function(data){
			if(data == 'success'){
				$("#docName").val('');
				$("#appendix_path").val('');
				$("#appendix_name").val('');
			}
		});
	}
	 </script>
</body>
</html>