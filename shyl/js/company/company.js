	// 根据省份获取城市列表

    function GetCity() {
        BindCId();
    }

	// 获取城市列表
    function BindCId() {
        var PID = $("#ProvinceId").val();
        $("#CityId").find('option').remove();
        if (PID == "") {
            $("<option value=''>---市---</option>").appendTo("#CityId");
        }
        $.post(document.getElementsByTagName('base')[0].href+'joblist/cityList.act', { 'PID': PID }, function (data) {
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

	// 修改之后的反馈信息
    var locat;
    $(function () {
    	var pro = $("#ProvinceId").val();
    	var cityno = $("#CityId").val();
    	if(pro == "16" && cityno == "170"){
    		$("#areali").css("display","block");
    	}else{
    		$("#areali").css("display","none");
    	}
    	locat=document.getElementsByTagName('base')[0].href
    	var result = $('#result').val();
    	if (result == "telErr") {
    		$("#Phone").tips({
    			side : 2,
    			msg : '该联系方式已经存在',
    			bg : '#AE81FF',
    			time : 3
    		});
    		$("#Phone").focus();
    	}else if (result == "emailErr") {
    		$("#Email").tips({
    			side : 2,
    			msg : '该邮箱已经存在',
    			bg : '#AE81FF',
    			time : 3
    		});
    		$("#Email").focus();
    	}else if (result == "success") {
		    $('#my-modal-success-alert').show ().delay (1000).fadeOut ();
		    $(".mypage_image").find("img").attr("src",locat+$("#pictureUrl").val());
    	} else if (result == "error"){
		    $('#my-modal-failure-alert').show ().delay (1000).fadeOut ();
    	}
    	$('#result').val('');
    	return;
    });
    // 企业法人代表
    function checkComPerson() {
    	// 企业法人代表验证
    	var comPerson = $("#ComPerson").val();
    	if (comPerson == "") {
    		$("#ComPerson").tips({
    			side : 2,
    			msg : '请输入企业法人代表',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
    	}
    }
    // 企业规模
    function checkComScale() {
    	// 企业规模验证
    	var comScale = $("#ComScale").val();
    	if (comScale == "") {
    		$("#ComScale").tips({
    			side : 1,
    			msg : '请输入企业规模',
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
    			side : 1,
    			msg : '请选择省份！',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
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
    			side : 1,
    			msg : '请选择城市！',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
    	}
    }
    
    // 审核机关验证
    function checkAreaId(){
    	// 城市验证
    	var areaId = $("#areaId").val();
    	if (areaId == "") {
    		$("#areaId").tips({
    			side : 1,
    			msg : '请选择审核机关！',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
    	}
    }
    
    // 注册资金
    function checkRegCapital() {
    	// 注册资金验证
    	var regCapital = $("#RegCapital").val();
    	if (regCapital == "") {
    		$("#RegCapital").tips({
    			side : 2,
    			msg : '请输入注册资金',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
    	}
    }
    
    // 邮箱验证
    function checkEmail() {
    	// 邮箱验证
    	var email = $("#Email").val();
    	var filter = /^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT)$/;
    	if (email == "") {
    		$("#Email").tips({
    			side : 2,
    			msg : '请输入邮箱',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
    	}else if (email != "" && !(filter.test(email))) {
    		$("#Email").tips({
    			side : 1,
    			msg : '请输入正确的邮箱格式',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
    	}
    }
    // 联系电话验证
    function checkPhone() {
    	var phone = $("#Phone").val();
    	var filter = /^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/;
    	if (phone == "") {
    		$("#Phone").tips({
    			side : 2,
    			msg : '请输入联系电话',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
    	}else if (phone != "" && !(filter.test(phone))) {
    		$("#Phone").tips({
    			side : 1,
    			msg : '请输入正确的联系电话格式',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
    	}
    }
    
    // 注册时间
    function checkRegDate() {
    	var RegDate = $("#RegDate").val();    	
    	if (RegDate == "") {
    		$("#RegDate").tips({
    			side : 1,
    			msg : '请输入注册时间',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
    	}
    }
    
    // 邮编验证
    function checkZipCode() {
    	var zipCode = $("#ZipCode").val();
    	var filter = /^[0-9]{6}$/;
    	
    	if (zipCode != "" && !(filter.test(zipCode))) {
    		$("#ZipCode").tips({
    			side : 1,
    			msg : '请输入正确的公司邮编',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
    	}
    }
    
    // 公司网址
    function checkComWebSite() {
    	var ComWebSite = $("#ComWebSite").val();
    	var filter = /((https|http|ftp|rtsp|mms):\/\/)?(([0-9a-z_!~*'().&=+$%-]+:)?[0-9a-z_!~*'().&=+$%-]+@)?(([0-9]{1,3}\.){3}[0-9]{1,3}|([0-9a-z_!~*'()-]+\.)*([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\.[a-z]{2,6})(:[0-9]{1,4})?((\/?)|(\/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+\/?)/;
    	
    	if (ComWebSite != "" && !(filter.test(ComWebSite))) {
    		$("#ComWebSite").tips({
    			side : 1,
    			msg : '请输入正确的公司网址格式',
    			bg : '#AE81FF',
    			time : 3
    		});
    		return true;
    	}
    }
    
    // 所属行业inId
    function checkInId() {
    	var inId = $("#inId").val();
    	if (inId == "" || inId == null) {
    		$("#inText").tips({
    			side : 1,
    			msg : '请选择所属行业！',
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
    	// 企业法人代表
    	if (checkComPerson()) {
    		$("#ComPerson").focus(); 
    		return;
    	}
    	// 所属行业
        if (checkInId()) {
    		$("#inText").focus(); 
    		return;
    	}
    	// 企业规模
    	if (checkComScale()) {
    		$("#ComScale").focus(); 
    		return;
    	}
    	// 省份
    	if (checkProvinceId()) {
    		$("#ProvinceId").focus(); 
    		return;
    	}
    	// 城市
    	if (checkCityId()) {
    		$("#CityId").focus(); 
    		return;
    	}
    	
    	// 审核机关
    	if(prov=="16" && cityn=="170"){
    		if (checkAreaId()) {
        		$("#areaId").focus(); 
        		return;
        	}
    	}
    	
    	// 注册资金
    	if (checkRegCapital()) {
    		$("#RegCapital").focus(); 
    		return;
    	}
    	// 注册时间
    	if (checkRegDate()) {
    		$("#RegDate").focus(); 
    		return;
    	}
		// 邮编验证
		if (checkZipCode()) {
			$("#ZipCode").focus(); 
			return;
		}
		// 公司网址验证
		if (checkComWebSite()) {
			$("#ComWebSite").focus(); 
			return;
		}
    	// 邮箱验证
		if (checkEmail()){
			$("#Email").focus();
			return;
		}
		// 联系电话验证
		if (checkPhone()){
			$("#Phone").focus(); 
			return;
		};
		var imgp=$("#imgP").attr("src");
		$("#LOGO").attr("src",imgp);
		$.ajax({
			type : "POST",
			url :$("#form1").attr("action"),
			data : $('#form1').serialize(),
			dataType : 'json',
			async:false, 
			success : function(data) {
				if(data.result=="success"){
					$('#my-modal-success-alert').show ().delay (1000).fadeOut ();
				}else if (data.result == "telErr") {
		    		$("#Phone").tips({
		    			side : 2,
		    			msg : '该联系方式已经存在',
		    			bg : '#AE81FF',
		    			time : 3
		    		});
		    		$("#Phone").focus();
		    	}else if (data.result == "emailErr") {
		    		$("#Email").tips({
		    			side : 2,
		    			msg : '该邮箱已经存在',
		    			bg : '#AE81FF',
		    			time : 3
		    		});
		    		$("#Email").focus();
		    	} else{
				    $('#my-modal-failure-alert').show ().delay (1000).fadeOut ();
		    	}
				
			}
		});
	}

	var pathArray = new Array();
	var img = new Object();
	var pictureindex = 0;
	var test=JSON.parse($("#compictureUrl").val());
	for(var i=0; i<test.length; i++)  
	{
	   img = new Object();
	   img.id = test[i].id;
	   img.companyId = test[i].companyId;
	   img.path = test[i].path;
	   img.name = test[i].name;
	   pathArray.push(img);
	}
	
	// 不存在的图片处理1
	function showImgDelayNew(index){
		var imgObj = document.getElementById(index);
		imgObj.onerror=null;
		imgObj.src=locat+'shyl/images/mylogo.jpg';  
	}
	
	//不存在的图片处理2
	function showImgDelayNew_another(index){
		var index = "imgC" + index;
		var imgObj = document.getElementById(index);
		imgObj.onerror=null;
		imgObj.src=locat+'shyl/images/mylogo.jpg';  
	}
	
	// 上传公司展示图片
	$(function() {
		 var tips=function(id,msg){
			$("#"+id).tips({
				side : 2,
				msg : msg,
				bg : '#AE81FF',
				time : 3
			});
		 }
		 $("#file_uploadC").fileupload({
			dataType :'json',
			autoUpload: true,
	        url: locat+'company/Upload.act',
	        sequentialUploads: true
		 }).bind('fileuploadchange', function (e, data) {
	    }).bind('fileuploaddone', function (e, data) {
	   	 if("SizeError"==data.result.fileSizError){
	   		tips("file_uploadC","请上传大小符合要求的图片(每张图片大小不能超过5MB)。");
	   		return false;
	   	 }else if("NO"==data.result.fileTypeError){
	   		 tips("file_uploadC","请上传格式为.jpg/.jpeg/.png./gif格式的图片。");
	   		 //$("#imgC").attr("src",document.getElementsByTagName('base')[0].href+"shyl/images/temp.png");
	   		 return false;
	   	 } else {
	   		   var index = ++pictureindex;
	           img=new Object();
	           img.id = index;
	           img.path = "";
	           img.path=data.result.imgPath;
	           img.name=data.result.imgName;
	           pathArray.push(img);
	       	   $("#pictures").children().remove();
	    	   for (var j =0;j<pathArray.length;j++) {
	    	       addHtml_1(document.getElementsByTagName('base')[0].href+'images/'+pathArray[j].path,pathArray[j].id);
	    	   }
	    	   console.log(JSON.stringify(pathArray));
	    	   $("#compictureUrl").val(JSON.stringify(pathArray));
	   	 }
	    });
	});	
	
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
			addHtml_1(document.getElementsByTagName('base')[0].href+'images/'+pathArray[j].path,pathArray[j].id);
		}
		$("#compictureUrl").val(JSON.stringify(pathArray));
	
	}
	// 显示图片处理1
	function showOriginalPhoto(id)
	{
		var img = document.getElementById(id);
		var src = img.src;
		if (src.indexOf("shyl/images/mylogo.jpg") < 0) {
			var newwin = window.open();
			newwin.document.write("<div align='center'><img src='"+src+"'/></div>");
		}
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
    
    //获取行业知识选中值
    function Industrycheck() {
        var relateIds = "";
        var texts = "";
        $("input[name='Ind']:checked").each(function () {
            relateIds += $(this).attr('value') + ",";
        });//得到选中复选框的value
        relateIds = relateIds.substring(0, relateIds.length - 1);

        $("input[name='Ind']:checked").each(function () {
            texts += $(this).parent().text().replace("undefined", "") + ',';
        });//得到选中复选框的text 
        if (texts.length > 80) {
            texts = texts.substring(0, 58) + "....";
        }
        else {
            texts = texts.substring(0, texts.length - 1);
        }

        if (texts == "") {
            $("#inText").text("请选择所属行业");
            $("#inText").append('&nbsp;<b class="caret"></b>')
            $("#inId").val("");
            $("#Industry").val("");
        }
        else {
            $("#inText").text(texts);
            $("#inId").val(relateIds);
            $("#Industry").val(texts);
        }
        $("[name='Ind']").removeAttr("checked");//取消全选
        checkInId();
    }

    //checkbox反选
    function InChecked() {
        // 行业
        if ($("#inId").val() != "") {
            var st = $("#inId").val();
            var cklist = st.split(',');
            for (var i = 0; i < cklist.length; i++) {
                var cid = "indu"+cklist[i];
                document.getElementById(cid).checked = true;
            }
        }
    }
    function Clear() {
        //行业
        $("[name='Ind']").removeAttr("checked");//取消全选
        $("[name='Ind']").each(function () {
            $(this).attr("disabled", false);
        });
    }
	// 上传公司Logo
	$(function() {
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
	    		 //$("#imgP").attr("src",document.getElementsByTagName('base')[0].href+"shyl/images/upimg.jpg");
	    	 } else {
	    		 $("#imgP").attr("src",document.getElementsByTagName('base')[0].href+"images/"+data.result);
	    		 $("#mypage_image img").attr("src",document.getElementsByTagName('base')[0].href+"images/"+data.result);
	    		 $("#imglogo").val(document.getElementsByTagName('base')[0].href+"images/"+data.result);
	             document.getElementById("pictureUrl").value=data.result;
	    	 }
	     });
		 //上传营业执照扫描件
		 $("#file_upload_business").fileupload({
			 dataType :'iframe text',
			 autoUpload: true,
			 maxNumberOfFiles : 1,
	         url: locat+'register/Upload.act',
	         sequentialUploads: true
		 }).bind('fileuploadchange', function (e, data) {
			 if(data.files.length > 1){
				 tips("file_upload_business","只能上传一张照片。");
	             return false;
			 }
	     }).bind('fileuploaddone', function (e, data) {
	    	 if("no"==data.result){
	    		 tips("file_upload_business","请上传格式为.jpg/.jpeg/.png./gif格式的图片。");
	    	 }else if("nosize"==data.result){
	    		 tips("file_upload_business","建议图片最大为10MB，尺寸在4000*4000以内");
	    	 }
	    	 else {
	    		 $("#imgLL").attr("src",document.getElementsByTagName('base')[0].href+"images/"+data.result);
	             document.getElementById("business_license").value=data.result;
	    	 }
	     });
	})