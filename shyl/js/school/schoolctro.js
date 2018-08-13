var locat;
$(function() {
	locat=document.getElementsByTagName('base')[0].href
	var pro = $("#ProvinceId").val();
	var cityno = $("#CityId").val();
	if(pro == "16" && cityno == "170"){
		$("#areali").css("display","block");
	}else{
		$("#areali").css("display","none");
	}
	var tips=function(id,msg){
		$("#"+id).tips({
			side : 2,
			msg : msg,
			bg : '#AE81FF',
			time : 3
		});
	}
	//ie8支持placeholder
	$("#file_upload").fileupload({
		 dataType :'iframe text',
		 autoUpload: true,
		 maxNumberOfFiles : 1,
         url: locat+'register/Upload.act',
         sequentialUploads: true
	 }).bind('fileuploadchange', function (e, data) {
		 if(data.files.length > 1){
			 tips("file_upload","只能上传一张照片。");
             return false;
		 }
     }).bind('fileuploaddone', function (e, data) {
    	 if("no"==data.result){
    		 tips("file_upload","请上传格式为.jpg/.jpeg/.png./gif格式的图片。");
    		 $("#imgP").attr("src",locat+"/shyl/images/upimg.jpg");
    		 $("#pictureUrl").val('');
    	 } else {
    		 $("#imgP").attr("src",document.getElementsByTagName('base')[0].href+"images/"+data.result);
    		 $("#mypage_image img").attr("src",document.getElementsByTagName('base')[0].href+"images/"+data.result);
    		 $("#imglogo").val(document.getElementsByTagName('base')[0].href+"images/"+data.result);
             document.getElementById("pictureUrl").value=data.result;
    	 }
     });
	 $("#file_uploadS").fileupload({
		 dataType :'iframe text',
		 autoUpload: true,
		 maxNumberOfFiles : 1,
		 url: locat+'register/Upload.act',
	   sequentialUploads: true
	}).bind('fileuploadchange', function (e, data) {
		 if(data.files.length > 1){
			 tips("file_uploadS","只能上传一张照片。");
	       return false;
		 }
	}).bind('fileuploaddone', function (e, data) {
		 if("no"==data.result){
			 tips("file_uploadS","请上传格式为.jpg/.jpeg/.png./gif格式的图片。");
			 $("#imgS").attr("src",locat+"shyl/images/upimg.jpg");
			 $("#representative_building").val('');
		 } else {
			 $("#imgS").attr("src",document.getElementsByTagName('base')[0].href+"images/"+data.result);
	       document.getElementById("representative_building").value=data.result;
		 }
	});
	 $("#file_uploadC").fileupload({
			dataType :'json',
			autoUpload: true,
	       url: locat+'school/Upload.act',
	       sequentialUploads: true
	   }).bind('fileuploaddone', function (e, data) {
	  	 if("NO"==data.result.fileTypeError){
	  		tips("file_uploadC","请上传格式为.jpg/.jpeg/.png./gif格式的图片。");
	  		 $("#imgC").attr("src",locat+"shyl/images/temp.png");
	  	 } else {
	  		  var index = ++pictureindex;
	          img=new Object();
	          img.id = index;
	          img.path=data.result.imgPath;
	          img.name=data.result.imgName;
	          pathArray.push(img);
	      	   $("#pictures").children().remove();
	      	 for (var j =0;j<pathArray.length;j++) {
	    	       addHtml_1(document.getElementsByTagName('base')[0].href+'images/'+pathArray[j].path,pathArray[j].id);
	    	   }
	   	   $("#compictureUrl").val(JSON.stringify(pathArray));
	  	 }
	   });
});	

var pathArray = new Array();
var img = new Object();
var pictureindex = 0;
var test=JSON.parse($("#compictureUrl").val());
for(var i=0; i<test.length; i++)  
{  
   img = new Object();
   img.id = test[i].id;
   img.institutionId = test[i].institutionId;
   img.path = test[i].path;
   img.name = test[i].name;
   pathArray.push(img);
} 

//不存在的图片处理2
function showImgDelayNew_another(index){
	var index = "imgC" + index;
	var imgObj = document.getElementById(index);
	imgObj.onerror=null;
	imgObj.src=locat+'shyl/images/mylogo.jpg';  
}

//点击上传图片追加Html
function addHtml_1 (imgPath,index) {
	var html ="<img onerror='showImgDelayNew_another(" + index + ");' src='"+imgPath+"' onclick='showOriginalPhoto_another(" + index + ");' id='imgC" + index + "' name='imgC' style='width: 100px; padding: 1px; border: 0; background: #fff;' />";
	html+="<a onclick='deleteLocalPicture(" + index + ")' class='delete'>删除</a>";
	$("#pictures").append(html);
}

// 删除点击上传图片获取的图片
function deleteLocalPicture(index){
	for (var i =0;i<pathArray.length;i++) {
		if (index == pathArray[i].id) {
			pathArray.splice(i,1);
			break;
		}
	}
	
	$("#pictures").children().remove();
	
	for (var j =0;j<pathArray.length;j++) {
		addHtml_1(document.getElementsByTagName('base')[0].href+'images/'+ pathArray[j].path, pathArray[j].id);
			}
			$("#compictureUrl").val(JSON.stringify(pathArray));

		}
function showOriginalPhoto(o) {
	var img = document.getElementById(o);
	var src = img.src;
	var newwin = window.open();
	newwin.document.write("<img src='"+src+"'>");
}

// 显示图片处理2
function showOriginalPhoto_another(id)
{
	var id = "imgC" + id;
	var img = document.getElementById(id);
	var src = img.src;
	if (src.indexOf("shyl/images/mylogo.jpg") < 0) {
		var newwin = window.open();
		newwin.document.write("<div align='center'><img src='"+src+"'/></div>");
	}
}

function GetCity() {
    BindCId();
}
function BindCId() {
    var PID = $("#ProvinceId").val();
    $("#CityId").find('option').remove();
    if (PID == "") {
        $("<option value=''>---市---</option>").appendTo("#CityId");
    }
    $.post(locat+'joblist/cityList.act', { 'PID': PID }, function (data) {
        $.each(data.cityList, function (i, list) {
            $("<option value='" + list.REGION_ID + "'>" + list.REGION_NAME + "</option>").appendTo("#CityId");
        });
    });
    if (PID == "16") {
		$("#areali").css("display","block");
	}else{
		$("#areali").css("display","none");
	}
    $("#CityId").val('');
}

// 学校名称
function checkSchoolName() {
	// 学校名称验证
	var comPerson = $("#school_name").val();
	if (comPerson == "") {
		$("#school_name").tips({
			side : 2,
			msg : '请输入学校名称',
			bg : '#AE81FF',
			time : 3
		});
		return true;
	}
}
// 省份验证
function checkProvinceId() {
	// 省份验证
	var ProvinceId = $("#ProvinceId").val();
	if (ProvinceId == "") {
		$("#ProvinceId").tips({
			side : 2,
			msg : '请选择省份',
			bg : '#AE81FF',
			time : 3
		});
		 var PID = $("#ProvinceId").val();
	    $("#CityId").find('option').remove();
	    if (PID == "") {
	        $("<option value=''>---市---</option>").appendTo("#CityId");
	    }
		return true;
	}else{
		 BindCId();
	}
}
// 城市验证
function checkCityId() {
	// 城市验证
	var CityId = $("#CityId").val();
	if (CityId == "170") {
		$("#areali").css("display","block");
	}else{
		$("#areali").css("display","none");
	}
	if (CityId == "") {
		$("#CityId").tips({
			side : 2,
			msg : '请选择城市',
			bg : '#AE81FF',
			time : 3
		});
		return true;
	}
}
//审核机关验证
function checkAreaId(){
	// 城市验证
	var areaId = $("#areaId").val();
	if (areaId == "") {
		$("#areaId").tips({
			side : 2,
			msg : '请选择审核机关！',
			bg : '#AE81FF',
			time : 3
		});
		return true;
	}
}

//组织代码
function checkOrganizeCode() {
	// 组织代码验证
	var SchoolType=$("#organize_code").val();
	var OcodeFilter = /^[0-9A-Z]{18}$/;
	var filter=/[0-9]{8}-[a-zA-Z0-9]/;
	if(SchoolType==""){
		$("#organize_code").tips({
			side:2,
			msg:'请输入组织代码',
			bg:'#AE81FF',
			time:3
		});
		return true;
	}else if (SchoolType.length != 10 && SchoolType.length != 18) {
		$("#organize_code").tips({
			side : 2,
			msg : '必须为10位组织机构代码或18位社会信用代码',
			bg : '#AE81FF',
			time : 3
		});
		return true;
	} else {
		if (!(OcodeFilter.test(SchoolType)) && !filter.test(SchoolType)) {
			$("#organize_code").tips({
				side : 2,
				msg : '请输入正确的组织代码格式',
				bg : '#AE81FF',
				time : 3
			});
			return true;
		}
	}
}

$('#organize_code').keyup(function(){
	var c = $(this);
	if (/[^a-zA-Z0-9! @ # $ % -.?_]/.test(c.val())) {//替换其他字符
		var temp_amount = c.val().replace(
				/[^a-zA-Z0-9! @ # $ % -.?_]/g, '');
	    $(this).val(temp_amount);
	}
});

//院校地址省份
function checkprovince(){
	var Province=$("#ProvinceId").val();
	if(Province==""){
		$("#ProvinceId").tips({
			side:2,
			msg:'请选择省份',
			bg:'#AE81FF',
			time:3
		});
		return true;
	}
}
//院校地址城市
function checkcity(){
	var City=$("#CityId").val();
	if(City==""){
		$("#CityId").tips({
			side:2,
			msg:'请选择省份',
			bg:'#AE81FF',
			time:3
		});
		return true;
	}
}
//隶属于
function checkBelonging(){
	var SchoolType=$("#belonging").val();
	if(SchoolType==""){
		$("#belonging").tips({
			side:2,
			msg:'请选择隶属于',
			bg:'#AE81FF',
			time:3
		});
		return true;
	}
}
// 英文名称
function checkSchoolNameEn() {
	// 邮箱验证
	var regCapital = $("#school_nameen").val();
	if (regCapital == "") {
		$("#school_nameen").tips({
			side : 2,
			msg : '请输入英文名称',
			bg : '#AE81FF',
			time : 3
		});
		return true;
	}
}

// 邮箱验证
function checkEmail() {
	// 邮箱验证
	var Email = $("#Email").val();
	var filter = /^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT)$/;
	if (Email == "") {
		$("#Email").tips({
			side : 2,
			msg : '请输入邮箱',
			bg : '#AE81FF',
			time : 3
		});
		$("#Email").focus();
		return false;
	} else if (!(filter.test(Email))) {
		$("#Email").tips({
			side : 2,
			msg : '请输入正确的邮箱格式',
			bg : '#AE81FF',
			time : 3
		});
		$("#Email").focus();
		return false;
	}
}
// 座机/固定电话验证
function checkPhone() {
	var Telephone = $("#contact_tel").val();
	var Filter = /^((0\d{2,3})-)(\d{7,8})(-(\d{1,4}))?$/;
	var phoneFilter = /^1[3|4|5|8][0-9]\d{4,8}$/;
	if (Telephone == "") {
		$("#contact_tel").tips({
			side : 2,
			msg : '请输入电话',
			bg : '#AE81FF',
			time : 3
		});
		$("#contact_tel").focus();
		return true;
	} else {
		if (!(Filter.test(Telephone)) && !(phoneFilter.test(Telephone))) {
			$("#contact_tel").tips({
				side : 2,
				msg : '请输入正确的联系电话格式',
				bg : '#AE81FF',
				time : 3
			});
			$("#contact_tel").focus();
			return true;
		}
	}
}
// 注册时间
function checkCreationTime() {
	var RegDate = $("#creation_time").val();
	if (RegDate == "") {
		$("#creation_time").tips({
			side : 2,
			msg : '请输入注册时间',
			bg : '#AE81FF',
			time : 3
		});
		return true;
	} 
}

// 院校网址
function checkComWebSite() {
	var ComWebSite = $("#website").val();
	var filter = /((https|http|ftp|rtsp|mms):\/\/)?(([0-9a-z_!~*'().&=+$%-]+:)?[0-9a-z_!~*'().&=+$%-]+@)?(([0-9]{1,3}\.){3}[0-9]{1,3}|([0-9a-z_!~*'()-]+\.)*([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\.[a-z]{2,6})(:[0-9]{1,4})?((\/?)|(\/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+\/?)/;
	
	if (ComWebSite != "" && !(filter.test(ComWebSite))) {
		$("#website").tips({
			side : 2,
			msg : '请输入正确的院校网址格式',
			bg : '#AE81FF',
			time : 3
		});
		return true;
	}
}

//详细地址
function checkAddressDetail() {
	var RegDate = $("#address_detail").val();
	if (RegDate == "") {
		$("#address_detail").tips({
			side : 2,
			msg : '请输入详细地址',
			bg : '#AE81FF',
			time : 3
		});
		return true;
	}
}
//联系人
function checkContact() {
	var RegDate = $("#Contact").val();
	if (RegDate == "") {
		$("#Contact").tips({
			side : 2,
			msg : '请输入联系人',
			bg : '#AE81FF',
			time : 3
		});
		$("#Contact").focus();
		return true;
	}
}
//院校介绍
function checkIntroduction() {
	var RegDate = $("#Introduction").val();
	if (RegDate == "") {
		$("#Introduction").tips({
			side : 2,
			msg : '请输入院校介绍',
			bg : '#AE81FF',
			time : 3
		});
		return true;
	}
}    
function pictureUrl(){
	var pictureUrl = $("#pictureUrl").val();    	
	if (pictureUrl == "") {
		$("#imgP").tips({
			side : 2,
			msg : '请选择学校logo',
			bg : '#AE81FF',
			time : 3
		});
		return true;
	}	
}
function building(){
	var representativeBuilding = $("#representative_building").val();    	
	if (representativeBuilding == "") {
		$("#imgS").tips({
			side : 2,
			msg : '请选择代表建筑',
			bg : '#AE81FF',
			time : 3
		});
		return true;
	}	
}
//提交表单
function sub() {
	var prov = $("#ProvinceId").val();
	var cityn = $("#CityId").val();
	
	//学校名称
	if (checkSchoolName()) {
		$("#school_name").focus(); 
		return false;
	}
	//院校组织代码
	if (checkOrganizeCode()) {
		$("#organize_code").focus(); 
		return false;
	}
	//英文名称
	if (checkSchoolNameEn()) {
		$("#school_nameen").focus(); 
		return false;
	}
	
	//创建时间
	if (checkCreationTime()) {
		$("#creation_time").focus(); 
		return false;
	}
	var RegDate = $("#creation_time").val();
	var date = new Date();
    var mon = date.getMonth() + 1;
    var day = date.getDate();
    var nowDay = date.getFullYear() + "-" + (mon<10?"0"+mon:mon) + "-" +(day<10?"0"+day:day);
    if(RegDate.length>0&&nowDay.length>0){
		if(RegDate>nowDay){
    		$("#creation_time").tips({
    			side : 1,
    			msg : '创建时间不能大于当前时间！',
    			bg : '#AE81FF',
    			time : 3
    		});
    		$("#creation_time").focus();
    		return false;
		}
	}
    
	//隶属于
	if (checkBelonging()) {
		$("#belonging").focus(); 
		return false;
	}
	//电话验证
	if(checkPhone()){
		$("#contact_tel").focus();
		return false;
	}
	//省份
	if(checkProvinceId()){
		$("#ProvinceId").focus();
		return false;
	}
	//城市
	if (checkcity()) {
		$("#CityId").focus(); 
		return false;
	}
	// 审核机关
	if(prov=="16" && cityn=="170"){
		if (checkAreaId()) {
    		$("#areaId").focus(); 
    		return;
    	}
	}
	//详细地址
	if (checkAddressDetail()) {
		$("#address_detail").focus(); 
		return false;
	}
	//官方网站
	if (checkComWebSite()) {
		$("#website").focus(); 
		return false;
	}
	//邮箱
	if(checkEmail()){
		$("#Email").focus();
		return false;
	}
	//联系人
	if (checkContact()) {
		$("#Contact").focus(); 
		return false;
	}
	//院校LOGO
	if(pictureUrl()){
		$("#imgP").focus();
		return false;
	}
	//代表建筑
	if(building()){
		$("#imgS").focus();
		return false;
	}
	// 院校介绍
	if (checkIntroduction()) {
		$("#Introduction").focus(); 
		return false;
	}
	
	// 院校名称
	var school_name = $("#school_name").val();
	// 院校组织代码
	var organize_code=$("#organize_code").val();
	// 英文名称
	var school_nameen = $("#school_nameen").val();
	// 创建时间
	var creation_time = $("#creation_time").val();
	// 重点学科数
	var key_subjects = $("#key_subjects").val();
	// 隶属于
	var belonging = $("#belonging").val();
	// 学校类型
	var school_type = $("#school_type").val();
	// 学校人数
	var student_num = $("#student_num").val();
	// 博士点个数
	var doctor_num = $("#doctor_num").val();
	// 硕士点个数
	var master_num = $("#master_num").val();
	// 院士人数
	var academician_num = $("#academician_num").val();
	// 联系人电话
	var contact_tel = $("#contact_tel").val();
	// 院校地址省份
	var ProvinceId = $("#ProvinceId").val();
	// 院校地址城市
	var CityId = $("#CityId").val();
	// 审核机关
	var areaId = $("#areaId").val();
	// 详细地址
	var address_detail = $("#address_detail").val();
	// 批次
	var batch = $("#batch").val();
	// 官方网站
	var website = $("#website").val();
	// 邮箱
	var Email = $("#Email").val();
	// 联系人
	var Contact = $("#Contact").val();
	// 是否公开
	var yesOrNo=$("input:radio[name='yes_or_no']:checked").val();
	// 院校Logo
	var pictureLogo = $("#pictureUrl").val();
	// 代表建筑
	var representative_building = $("#representative_building").val();
	// 院校介绍
	var Introduction = $("#Introduction").val();
	// 院校介绍
	var compictureUrl = $("#compictureUrl").val();
	
	$.ajax({
		type : "POST",
		url : locat+'school/schoolUpdate.act',
		data : {
			school_name : school_name,
			organize_code : organize_code,
			school_nameen : school_nameen,
			creation_time : creation_time,
			key_subjects : key_subjects,
			belonging : belonging,
			school_type : school_type,
			student_num : student_num,
			doctor_num : doctor_num,
			master_num : master_num,
			academician_num : academician_num,
			contact_tel : contact_tel,
			ProvinceId : ProvinceId,
			CityId : CityId,
			areaId : areaId,
			address_detail : address_detail,
			batch : batch,
			website : website,
			Email : Email,
			Contact : Contact,
			yesOrNo : yesOrNo,
			pictureLogo : pictureLogo,
			representative_building : representative_building,
			Introduction : Introduction,
			compictureUrl : compictureUrl,
			tm : new Date().getTime()
		},
		dataType : 'json',
		cache : false,
		success : function(data) {
			if ("success" == data.result) {
				$(".mypage_image").find("img").attr("src",locat+"images/"+$("#pictureUrl").val());
				$('#my-modal-success-alert').show()
				setTimeout("Reload()", 1000);
			} else if ("telErr" == data.result) {
				$("#contact_tel").tips({
					side : 2,
					msg : '该联系方式已经存在',
					bg : '#AE81FF',
					time : 3
				});
				$("#contact_tel").focus();
			} else if ("emailErr" == data.result) {
				$("#Email").tips({
					side : 2,
					msg : '该邮箱已经存在',
					bg : '#AE81FF',
					time : 3
				});
				$("#Email").focus();
			} else if ("error" == data.result) {
				$('#my-modal-failure-alert').show().delay (1000).fadeOut();
			}
		}
	});
}

//页面重新加载
function Reload(){
	window.location.href=locat+'school/toUpdateInstitution.act';
}