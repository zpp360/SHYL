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
<title>理发师修改页面</title>
<meta name="description" content="overview & stats" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%@ include file="../../../system/admin/top.jsp"%>

<link rel="stylesheet" href="plugins/oss/upload.css">

<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>
<script type="text/javascript" src="plugins/oss/upload.js"></script>
<style>

</style>
<script type="text/javascript">
	// 合并$(function(){});
	$(top.hangge());
	$(function() {
		
		// 合并$(function(){});
		//下拉框
		$(".chzn-select").chosen();
		$(".chzn-select-deselect").chosen({
			allow_single_deselect : true
		});
		//日期框
		$('.date-picker').datepicker();
		$('.date-picker1').datepicker({
			 language:  'zh-CN',
	            format: 'yyyy-mm',
	            weekStart: 1,
	            todayBtn:  'linked',
	            autoclose: 1,
	            todayHighlight: 1,
	            minViewMode: 'months', //这里就设置了默认视图为年视图
	            minView: 3, //设置最小视图为年视图
	            forceParse: 0
		});
		
	});
</script>
<!-- 日期框 -->
<script type="text/javascript">

	//保存
	function save() {
		if ($("#BARBER_NAME").val() == "") {
			$("#BARBER_NAME").tips({
				side : 3,
				msg : '请输入理发师姓名',
				bg : '#FF5080',
				time : 2
			});
			$("#BARBER_NAME").focus();
			return false;
		}
		if ($("#SEX").val() == "") {
			$("#SEX").tips({
				side : 3,
				msg : '请选择理发师性别',
				bg : '#FF5080',
				time : 2
			});
			$("#SEX").focus();
			return false;
		}
		if ($("#BARBER_SKILL").val() == "") {
			$("#BARBER_SKILL").tips({
				side : 3,
				msg : '请输入理发师技能',
				bg : '#FF5080',
				time : 2
			});
			$("#BARBER_SKILL").focus();
			return false;
		}
		if ($("#WORK_START_YMD").val() == "") {
			$("#WORK_START_YMD").tips({
				side : 3,
				msg : '请输入工作开始时间',
				bg : '#FF5080',
				time : 2
			});
			$("#WORK_START_YMD").focus();
			return false;
		}
		if ($("#BARBER_ADDRESS").val() == "") {
			$("#BARBER_ADDRESS").tips({
				side : 3,
				msg : '请输入工作场所',
				bg : '#FF5080',
				time : 2
			});
			$("#BARBER_ADDRESS").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
</script>
</head>
<body>
<br>
	<form action="<%=basePath%>barber/${msg }.do" name="Form" id="Form"
		method="post">
		<div id="zhongxin">
		<input type="hidden" name="BARBER_ID" id="BARBER_ID" value="${pd.BARBER_ID }"/>
			<table class="table ">
			
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>理发师姓名</B></td>
					<td><input type="text" name="BARBER_NAME" id="BARBER_NAME" maxlength="40"
						style="height: 20px; width: 300px;margin-top:2px" placeholder="请输入理发师姓名"
						title="理发师姓名" value="${pd.BARBER_NAME}" onblur="trim(this);" /></td>
				</tr>
				
				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>性别</B></td>
					<td><select class="chzn-select" name="SEX" id="SEX"
						data-placeholder="请选择理发师性别"  style="height: 20px; width: 315px;">
								<option value="0" <c:if test="${0 == pd.category }">selected</c:if>>男</option>
								<option value="1"  <c:if test="${1 == pd.category }">selected</c:if>>女</option>

					</select></td>
				</tr>

				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>技能</B></td>
					<td><input type="text" name="BARBER_SKILL" id="BARBER_SKILL"
						maxlength="40" style="height: 20px; width: 300px;"
						placeholder="请输入技能" title="技能" value="${pd.BARBER_SKILL}" onblur="trim(this);" /></td>
				</tr>

				<tr>
				    <td style="width: 80px; text-align: left; padding-top: 13px;"><B>理发师照片</B></td>
					<td>
						<div class="form-group" id="businessDiv">
						    <div class="upload_img">
						    	<form name=theform>
								<input type="radio" name="myradio" value="local_name" /> 上传文件名字保持本地文件名字
								<input type="radio" name="myradio" value="random_name" checked=true/> 上传文件名字是随机文件名
								<br/>
								上传到指定目录:<input type="text" id='dirname' placeholder="如果不填，默认是上传到根目录" size=50>
								</form>
								
								<h4>您所选择的文件列表：</h4>
								<div id="ossfile">你的浏览器不支持flash,Silverlight或者HTML5！</div>
								
								<br/>
								
								<div id="container">
									<a id="selectfiles" href="javascript:void(0);" class='btn'>选择文件</a>
									<a id="postfiles" href="javascript:void(0);" class='btn'>开始上传</a>
								</div>
								
								<pre id="console"></pre>
								
								<p>&nbsp;</p>
							    
							   <c:if test="${empty pd.barber_path}">
									<img id="weixin_show" name="weixin_show" style="width: 158px; height: 190px;" src="<%=basePath%>shyl/images/temp.png">
							   </c:if>
								<c:if test="${!empty pd.barber_path}">
						        	<img id="weixin_show" name="weixin_show" style="width: 158px; height: 190px;" onerror="showImgDelay(this,'<%=basePath%>shyl/images/temp.png');" src="<%=basePath%>${pd.barber_path}">
						        </c:if>
								<a href="javascript:;" class="a-upload" style="text-decoration:none; color:#ffffff;">上传本地图片
								<input type="file" id="weixin_image" name="weixin_image" placeholder="上传本地图片"  multiple></a>
								<p>支持的文件格式为.gif、.jpeg、.jpg、.png</p>
								<div id="container">
									<a id="selectfiles" href="javascript:void(0);" class='btn'>选择文件</a>
									<a id="postfiles" href="javascript:void(0);" class='btn'>开始上传</a>
								</div>
							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td style="width: 80px; text-align: left; padding-top: 13px;"><B>工作开始时间</B></td>
					<td><input class="span10 date-picker" name="WORK_START_YMD" id="WORK_START_YMD" value="${pd.WORK_START_YMD}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="工作开始时间"  title="开通日期" style=" width: 300px"/></td>
				</tr>
				
				<tr>
					<td style="width: 100px; text-align: left; padding-top: 13px;"><span style="color:#C00;padding-right: 4px;">*</span><B>工作场所</B>
					</td>
					
					<td><select class="chzn-select" name="BARBER_ADDRESS_ID" id="BARBER_ADDRESS_ID"
						data-placeholder="请选择机构名称"  style="height: 20px; width: 315px;">
										<option value=""></option>
										<c:forEach items="${barberaddresslist}" var="adr">
											<option value="${adr.id }" <c:if test="${adr.id == pd.BARBER_ADDRESS_ID}">selected</c:if>>${adr.value }</option>
										</c:forEach>
					</select></td>
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
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="<%=basePath%>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
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
	<!-- 实例化编辑器 -->
	<!-- 富文本编辑器end -->

	<script type="text/javascript">
	 function returnback(){
	    	window.location.href="<%=basePath%>barber/list.do";
		}

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
	function removeAppendix(id,path){
		$.post('<%=basePath%>news/deleteAppendix.do', {news_id:id,path:path}, function(data){
			if(data == 'success'){
				$("#docName").val('');
				$("#appendix_path").val('');
				$("#appendix_name").val('');
			}
		});
	}
	
	

	accessid= 'LTAIP3crANlEftRE';
	accesskey= 'vOg4WEx1LF8PqjuXWbK1R2IVQZJBOG';
	host = 'http://shuheng-dev.oss-cn-beijing.aliyuncs.com';
	//host = 'https://oss.shuhengcare.com';

	g_dirname = ''
	g_object_name = ''
	g_object_name_type = ''
	now = timestamp = Date.parse(new Date()) / 1000; 

	var policyText = {
	    "expiration": "2030-01-01T12:00:00.000Z", //设置该Policy的失效时间，超过这个失效时间之后，就没有办法通过这个policy上传文件了
	    "conditions": [
	    ["content-length-range", 0, 104857600] // 设置上传文件的大小限制 100M
	    ]
	};

	var policyBase64 = Base64.encode(JSON.stringify(policyText))
	message = policyBase64
	var bytes = Crypto.HMAC(Crypto.SHA1, message, accesskey, { asBytes: true }) ;
	var signature = Crypto.util.bytesToBase64(bytes);

	function check_object_radio() {
	    var tt = document.getElementsByName('myradio');
	    for (var i = 0; i < tt.length ; i++ )
	    {
	        if(tt[i].checked)
	        {
	            g_object_name_type = tt[i].value;
	            break;
	        }
	    }
	}

	function get_dirname()
	{
	    dir = document.getElementById("dirname").value;
	    if (dir != '' && dir.indexOf('/') != dir.length - 1)
	    {
	        dir = dir + '/'
	    }
	    //alert(dir)
	    g_dirname = dir
	}

	function random_string(len) {
	　　len = len || 32;
	　　var chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678';   
	　　var maxPos = chars.length;
	　　var pwd = '';
	　　for (i = 0; i < len; i++) {
	    　　pwd += chars.charAt(Math.floor(Math.random() * maxPos));
	    }
	    return pwd;
	}

	function get_suffix(filename) {
	    pos = filename.lastIndexOf('.')
	    suffix = ''
	    if (pos != -1) {
	        suffix = filename.substring(pos)
	    }
	    return suffix;
	}

	function calculate_object_name(filename)
	{
	    if (g_object_name_type == 'local_name')
	    {
	        g_object_name += "${filename}"
	    }
	    else if (g_object_name_type == 'random_name')
	    {
	        suffix = get_suffix(filename)
	        g_object_name = g_dirname + random_string(10) + suffix
	    }
	    return ''
	}

	function get_uploaded_object_name(filename)
	{
	    if (g_object_name_type == 'local_name')
	    {
	        tmp_name = g_object_name
	        tmp_name = tmp_name.replace("${filename}", filename);
	        return tmp_name
	    }
	    else if(g_object_name_type == 'random_name')
	    {
	        return g_object_name
	    }
	}

	function set_upload_param(up, filename, ret)
	{
	    g_object_name = g_dirname;
	    if (filename != '') {
	        suffix = get_suffix(filename)
	        calculate_object_name(filename)
	    }
	    new_multipart_params = {
	        'key' : g_object_name,
	        'policy': policyBase64,
	        'OSSAccessKeyId': accessid, 
	        'success_action_status' : '200', //让服务端返回200,不然，默认会返回204
	        'signature': signature,
	    };

	    up.setOption({
	        'url': host,
	        'multipart_params': new_multipart_params
	    });

	    up.start();
	}

	var uploader = new plupload.Uploader({
		runtimes : 'html5,flash,silverlight,html4',
		browse_button : 'selectfiles', 
	    //multi_selection: false,
		container: document.getElementById('container'),
		flash_swf_url : 'plugins/oss/lib/plupload-2.1.2/js/Moxie.swf',
		silverlight_xap_url : 'plugins/oss/lib/plupload-2.1.2/js/Moxie.xap',
	    url : 'http://oss.aliyuncs.com',

		init: {
			PostInit: function() {
				document.getElementById('ossfile').innerHTML = '';
				document.getElementById('postfiles').onclick = function() {
	            set_upload_param(uploader, '', false);
	            return false;
				};
			},

			FilesAdded: function(up, files) {
				plupload.each(files, function(file) {
					document.getElementById('ossfile').innerHTML += '<div id="' + file.id + '">' + file.name + ' (' + plupload.formatSize(file.size) + ')<b></b>'
					+'<div class="progress"><div class="progress-bar" style="width: 0%"></div></div>'
					+'</div>';
				});
			},

			BeforeUpload: function(up, file) {
	            check_object_radio();
	            get_dirname();
	            set_upload_param(up, file.name, true);
	        },

			UploadProgress: function(up, file) {
				var d = document.getElementById(file.id);
				d.getElementsByTagName('b')[0].innerHTML = '<span>' + file.percent + "%</span>";
	            var prog = d.getElementsByTagName('div')[0];
				var progBar = prog.getElementsByTagName('div')[0]
				progBar.style.width= 2*file.percent+'px';
				progBar.setAttribute('aria-valuenow', file.percent);
			},

			FileUploaded: function(up, file, info) {
	            if (info.status == 200)
	            {
	                document.getElementById(file.id).getElementsByTagName('b')[0].innerHTML = 'upload to oss success, object name:' + get_uploaded_object_name(file.name);
	            }
	            else
	            {
	                document.getElementById(file.id).getElementsByTagName('b')[0].innerHTML = info.response;
	            } 
			},

			Error: function(up, err) {
				document.getElementById('console').appendChild(document.createTextNode("\nError xml:" + err.response));
			}
		}
	});

	uploader.init();
	
	 </script>

</body>
</html>