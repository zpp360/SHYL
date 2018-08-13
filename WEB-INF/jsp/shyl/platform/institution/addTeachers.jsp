<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>培训讲师信息添加_济南市服务外包公共服务平台</title>
<meta charset="UTF-8" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0" />-->
<%-- <script src="<%=basePath%>shyl/js/jquery-1.7.2.js"></script> --%>
<script src="<%=basePath%>shyl/js/jquery-1.9.1.min.js"></script>
<%-- <script src="<%=basePath%>shyl/js/jquery.min.js"></script> --%>
<script src="<%=basePath%>shyl/js/bootstrap.js"></script>
<script src="<%=basePath%>shyl/js/bootstrap.min.js"></script>
<script src="<%=basePath%>shyl/js/datepicker/WdatePicker.js" type="text/javascript"></script>
<link rel="stylesheet" href="<%=basePath%>shyl/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>shyl/css/uploadify.css">
<link href="<%=basePath%>shyl/css/maincss/mypage.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="<%=basePath%>shyl/fileupload/css/jquery.fileupload-ui.css">
<script src="<%=basePath%>shyl/js/mainjs/errImage.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery.check-resubmit.js"></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/registCheck.js"></script>
<jsp:include page="../../common/header.jsp"></jsp:include>
<!-- 引入jQuery UI的js文件 -->
<script type="text/javascript" src="<%=basePath%>shyl/js/mainjs/jquery-ui.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/rcptCommon.js" type="text/javascript"></script>	
<link href="<%=basePath%>shyl/css/maincss/jquery-ui.css" rel="stylesheet">
<script type="text/javascript">
	//ie8支持placeholder
	$(function(){
		$('input, textarea').placeholder({customClass:'my-placeholder'});
		
		// 合并$(function(){});
		var tips=function(id,msg){
			$("#"+id).tips({
				side : 2,
				msg : msg,
				bg : '#AE81FF',
				time : 3
			});
		}
		
		 $("#file_upload").fileupload({
			 dataType :'iframe text',
			 autoUpload: true,
			 maxNumberOfFiles : 1,
	         url: '<%=basePath%>register/Upload.act',
	         sequentialUploads: true
		 }).bind('fileuploadchange', function (e, data) {
			 if(data.files.length > 1){
				 tips("file_upload","只能上传一张照片。");
	             return false;
			 }
	     }).bind('fileuploaddone', function (e, data) {
	    	 if("no"==data.result){
	    		 tips("file_upload","请上传格式为.jpg/.jpeg/.png./gif格式的图片。");
	    		 $("#imgP").attr("src","<%=basePath%>shyl/images/upimg.jpg");
	    	 } else {
	    		 $("#imgP").attr("src","<%=basePath%>images/"+data.result);
	             document.getElementById("teacher_picture").value=data.result;
	    	 }
	     });
	});

    $(document).ready(function () {
    	var result = $('#result').val();
    	if (result == "success") {
		    
    	} else if (result == "error"){
		    $('#my-modal-failure-alert').show ().delay (1000).fadeOut ();
    	}
    	$('#result').val('');
    	return;
    });
    // 讲师姓名
    function checkTeacheName() {
    	// 讲师姓名验证
    	var teacher_name = $("#teacher_name").val();
    	if (teacher_name == "") {
    		$("#teacher_name").tips({
    			side : 2,
    			msg : '请输入姓名',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
    	}
    }
    // 毕业院校
    function checkTeacherGraduate() {
    	// 毕业院校验证
    	var teacher_graduate = $("#graduate").val();
    	if (teacher_graduate == "") {
    		$("#graduate").tips({
    			side : 1,
    			msg : '请输入毕业院校',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
    	}
    }
    // 讲师职称
    function checkTeacherLevel() {
    	// 讲师职称验证
    	var teacher_level = $("#teacher_level").val();
    	if (teacher_level == "") {
    		$("#teacher_level").tips({
    			side : 1,
    			msg : '请输入职称',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
    	}
    }
    // 讲师电话
    function checkTeacherPhone() {
    	// 讲师电话验证
    	var teacher_phone = $("#phone").val();
    	if (teacher_phone == "") {
    		$("#phone").tips({
    			side : 1,
    			msg : '请输入手机号码',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
    	}else {
    		if ((!/^1[34578]\d{9}$/.test(teacher_phone))){ 
    			$("#phone").tips({
        			side : 1,
        			msg : '请输入正确的手机号码格式',
        			bg : '#AE81FF',
        			time : 3
        		});
    			return true;
    		}
    	}
    }
    // 讲师邮箱
    function checkTeacherEmail() {
    	// 讲师邮箱验证
    	// 邮箱验证
    	var teacher_email = $("#email").val();
    	var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    	if (teacher_email == "") {
    		$("#email").tips({
    			side : 1,
    			msg : '请输入邮箱地址',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
    	} else if(teacher_email != "" && !(filter.test(teacher_email))) {
    		$("#email").tips({
    			side : 1,
    			msg : '请输入正确的邮箱格式',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
    	}
    }
    
    //提交表单
	function sub() {
    	// 讲师姓名验证
    	if (checkTeacheName()) {
    		$("#teacher_name").focus(); 
    		return;
    	}
    	// 毕业院校验证
    	if (checkTeacherGraduate()) {
    		$("#graduate").focus(); 
    		return;
    	}
		// 讲师职称验证
		if (checkTeacherLevel()) {
			$("#teacher_level").focus(); 
			return;
		}
		// 讲师手机号码验证
		if (checkTeacherPhone()) {
			$("#phone").focus(); 
			return;
		}
    	// 讲师邮箱验证
		if (checkTeacherEmail()){
			$("#email").focus();
			return;
		}
		$("#form1").submit();
		$('#my-modal-success-alert').show ().delay (1000).fadeOut ();
	}
</script>
<script type="text/javascript">
	var checkSubmitFlg = false;
	function checkSubmit(){
	if(checkSubmitFlg ==true){
		return false; //当表单被提交过一次后checkSubmitFlg将变为true,根据判断将无法进行提交。
		}
		checkSubmitFlg ==true;
		return true;
	}
</script >
</head>
<body id="top" style="background-color: #f7f7f7;">
    
	<div class="clear"></div>
	<div class="register-box p0">
	<div class="rticon"></div>
	<jsp:include page="../../common/left.jsp"><jsp:param value="13" name="menuType"/></jsp:include>
	<div class="mypage_right">
		<h2>师资信息</h2>
		<form action="<%=basePath%>institutionCtrl/toAddTeachers.act" class="form-horizontal" id="form1" method="post" onsubmit="return checkSubmit();">
	    <!-- start -->
        <input type="hidden" id="result" name="result" value="${pd.result}">
        <input type="hidden" id="institutions_id" name="institutions_id" value="${pd.institutions_id}">
        <div class='modal my-modal-alert' id='my-modal-success-alert'>
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:150px;text-align:center;position:fixed;right:40%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/succ.png">&nbsp;&nbsp;添加成功!
                    </div>
                </div>
            </div>
        </div>
        
        <div class='modal my-modal-alert' id='my-modal-failure-alert'>
            <div class='modal-dialog boxBodySmall'>
                <div class='modal-content' style="width:150px;text-align:center;position:fixed;right:40%;bottom:45%;">
                    <div class='modal-body' id='modal-body-alert'>
                        <img alt="" src="<%=basePath%>shyl/images/fail.png">&nbsp;&nbsp;添加失败!
                    </div>
                </div>
            </div>
        </div>
        <!-- end -->
 		<div class="input_class">
<ul>
			<li><span><small style="color: red">*</small>姓名：</span>
                        <input class="inputtxt2" data-val="true" data-val-required="*" id="teacher_name" name="teacher_name" size="50" maxlength="9" type="text" value="" onblur="trim(this);checkTeacheName();" placeholder="请输入讲师姓名"/>
                        <span class="field-validation-valid" data-valmsg-for="Contact" data-valmsg-replace="true"></span>
				</li>
				<li><span><small style="color: red">*</small>毕业院校：</span>
                        <input class="inputtxt2" data-val="true" data-val-required="*" id="graduate" name="graduate" maxlength="20" type="text" value="" onblur="trim(this);checkTeacherGraduate();" placeholder="请输入讲师毕业院校"/>
                        <span class="field-validation-valid" data-valmsg-for="Phone" data-valmsg-replace="true"></span>
				</li>
			</ul>
			<ul>
			<li><span><small style="color: red">*</small>职称：</span>
                        <input class="inputtxt2" data-val="true" data-val-required="*" id="teacher_level" name="teacher_level" size="50" maxlength="10" type="text" value="" onblur="trim(this);checkTeacherLevel();" placeholder="请输入讲师职称"/>
                        <span class="field-validation-valid" data-valmsg-for="Contact" data-valmsg-replace="true"></span>
				</li>
				<li><span><small style="color: red">*</small>手机号码：</span>
                        <input class="inputtxt2" data-val="true" data-val-required="*" id="phone" name="phone" onkeyup="value=value.replace(/[^0-9]/g,'')" maxlength="20" type="text" value="" onblur="trim(this);checkTeacherPhone();delZero(this);" placeholder="请输入讲师手机号码"  style="ime-mode:disabled"/>
                        <span class="field-validation-valid" data-valmsg-for="Phone" data-valmsg-replace="true"></span>
				</li>
			</ul>
			<ul>
			<li><span><small style="color: red">*</small>邮箱：</span>
                        <input class="inputtxt2" data-val="true" data-val-required="*" id="email" name="email" size="50" maxlength="64" type="text" value="" onblur="trim(this);checkTeacherEmail();" placeholder="请输入讲师邮箱地址"/>
                        <span class="field-validation-valid" data-valmsg-for="Contact" data-valmsg-replace="true"></span>
				</li>
			</ul>
			<ul>
				<li style="height:120px;width: 100%;">
					<span>个人头像：</span>                    
                        <p class="pull-left">
                                <img src="<%=basePath%>shyl/images/default/teacher.png" class="upimg" id="imgP" name="imgP" style="width: 100px; padding: 3px; border: solid 1px #ccc; background: #fff;" />
                        </p>
                        <input id="teacher_picture" name="teacher_picture" type="hidden" value="" />
                        <div class="pull-left" style="padding-left: 15px;">
                        <br>
                            	<span class="fileinput-button" style="width:131px;">
								<span style="text-align:left;width:131px;background-color: #4f70c0;color:#FFFFFF;border-radius: 5px;line-height: 42px;text-align: center;font-size:15px;">上传头像</span>
								<input style="width:auto;" type="file" id="file_upload" name="file_upload" title="点击这里上传图片">
								</span><br><i>支持的图片格式为(*.jpg;*.png;*.jpeg;*.gif)</i>
                        </div>
				</li>
				<li style="height:80px;width: 100%;">
				     <span>简介：</span>
                        <textarea style="width:700px;padding-left:5px;background-color:#ecf0f9;border:0;border-radius:5px;font-size:0.85em;resize:none!important;" rows="2" maxlength="500" id="experience" name="experience"></textarea>
				</li>
			</ul>
		</div>
        </form>
        <div class="col-sm-offset-5 col-sm-2">
           <button type="submit" class="btn btn-success btn-block" onclick="sub();" id="subm"><span class="glyphicon glyphicon-ok-circle"></span>&nbsp;&nbsp;保存</button>
	    </div>
	</div>
</div>

<!-- Modal -->
<script src="<%=basePath%>shyl/js/jquery.uploadify.min.js" ></script>
<script type="text/javascript" src="<%=basePath%>shyl/js/jquery.tips.js"></script>
<script src="<%=basePath%>shyl/fileupload/js/vendor/jquery.ui.widget.js"></script>
<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload.js"></script>
<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-process.js"></script>
<script src="<%=basePath%>shyl/fileupload/js/jquery.fileupload-validate.js"></script>
<script src="<%=basePath%>shyl/fileupload/js/jquery.iframe-transport.js"></script>
<script src="<%=basePath%>shyl/js/mainjs/jquery.placeholder.js"></script>
<script type="text/javascript">
//院校自动输入
$("#graduate").autocomplete({
    source: function( request, response ) {
        $.ajax({
        	type:"POST",
            url: '<%=basePath%>register/getschool.act', // 后台请求路径
            dataType: "json",
            data:{
                "inputStr": request.term    // 获取输入框内容
            },
            success: function( data ) {
                response($.map(data, function(item) {
                    return {
                         // 设置item信息
                         label: item.name, // 下拉项显示内容
                         value: item.name,  // 下拉项对应数值
                         schoolId: item.id
                    }
                }));
            }
        });
    },
    minLength: 1,  // 输入框字符个等于2时开始查询
    select: function( event, ui ) { // 选中某项时执行的操作
    	// 存放选中选项的信息
    	$("#graduate").val(ui.item.label);
      }
});
</script>
   <%@ include file="../../common/footer.jsp"%>
</body>
</html>