$.ajaxSetup({ async: false });
       $(function () {
    	   if ($("#recruitmentId").val() == "") {
				$("#prompt").modal('show');
			}
           $.ajaxSetup({ cache: false }); // AJAX缓存
           $.dialog.setting.lock = true; // 遮罩层
           var id = 'job';
           var aid = 'josdetails';
           var menu = document.getElementById('josdetails');
           if (aid == 'send' || aid == 'create') {

           } else {
               $("#" + 'ctalent').addClass("on");
           }
           
           if (null != menu) {
               var endMark = parseInt(aid.lastIndexOf("_"));
               var startMark = parseInt(aid.indexOf("_"));
               if (endMark > startMark) {
                   var str = aid.substring(0, endMark);
                   $("#" + str).addClass("on");
               } else {
                   $("#" + 'josdetails').addClass("on");
               }
           }
           else {
               $("#" + 'job').addClass("on");
           }
           //首先将#back-to-top隐藏
           $("#back-to-top").hide();
           //当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
           $(function () {
               $(window).scroll(function () {
                   if ($(window).scrollTop() > 100) {
                       $("#back-to-top").fadeIn(500);
                   }
                   else {
                       $("#back-to-top").fadeOut(500);
                   }
               });
               //当点击跳转链接后，回到页面顶部位置
               $("#back-to-top").click(function () {
                   $('body,html').animate({ scrollTop: 0 }, 100);
                   return false;
               });
           });

      
       //通过value模拟
    	 $('input').placeholder();
       //通过插入元素模拟
       $('input').placeholder({ isUseSpan: true });
       });
		function closePrompt(){
  			if (navigator.userAgent.indexOf("Firefox") != -1 || navigator.userAgent.indexOf("Chrome") !=-1) {  
  		        window.open(location, '_self').close(); 
  		    } else {  
  		        window.opener = null;  
  		        window.open("", "_self");  
  		        window.close();  
  		    }  
		}
       // 关闭页面
       function Close() {
           window.opener = null;
           window.close();
       }
       
       // 申请职位按钮
       function Tip(divid) {
       	// 账号未登录的情况
       	if ($("#userId").val() == "") {
               $("#" + divid).attr("data-target", "#layhomewarn");
               return;
       	}
		var userType = $("#userType").val();
		if (userType == "1") {
			var companyId = $("#companyId").val();
			// 职位ID
			var recruitmentId =  $("#recruitmentId").val();
       	    // 获取简历信息	
            $.post(document.getElementsByTagName('base')[0].href+'job/detail/getCv.act', {companyId:companyId,recruitmentId:recruitmentId}, function (data) {
           	var list = data.cvList;
           	$("#resume").children('option').remove();
           	if(data.result == '0') {
               	for (var i=0; i<list.length; i++) {
               		var str = $("<option value='"+list[i].cv_id+"'>"+list[i].cv_name+"</option>");
               		if (list[i].default_cv == '0') {
               			str.attr("selected", "selected");
               		} 
               		$("#resume").append(str);
               	}
               	$('#sqzw11').modal('show');
           	} else if(data.result == '2'){
           	$("#my-modal-job-alert .modal-content").css("width", "350px");
           	 $("#alertText").text("您已被该公司录取，无需再投简历！");
       		 $('#my-modal-job-alert').show ().delay (3000).fadeOut ();
           	} else if(data.result == '3'){
           		$("#my-modal-job-alert .modal-content").css("width", "350px");
                $("#alertText").text("该职位已投递，请勿重复投递！");
          		$('#my-modal-job-alert').show ().delay (3000).fadeOut ();
           	}else {
                   $("#warntext").html("请创建一份简历！");
                   $("#" + divid).attr("data-target", "#layhomewarn");
           	}
           });
		} else {
			$("#warntext").html("对不起，您无权限操作此功能！");
			$("#" + divid).attr("data-target", "#layhomewarn");
		}
       }
	// 收藏按钮
      function TipFav(divid) {
       	// 账号未登录的情况
       	if ($("#userId").val() == "") {
               $("#" + divid).attr("data-target", "#layhomewarn");
               return;
       	}
		// 公司ID
		var companyId = $("#companyId").val();
		// 职位ID
		var recruitmentId =  $("#recruitmentId").val();
		var userType = $("#userType").val();
		if (userType == "1") {

           $.post(document.getElementsByTagName('base')[0].href+'job/detail/collectJob.act', {companyId:companyId,recruitmentId:recruitmentId}, function (data) {
           	if (data.result == '0') {
           		$("#my-modal-job-alert .modal-content").css("width", "200px");
                $("#alertText").text("收藏成功！");
              	$('#my-modal-job-alert').show ().delay (3000).fadeOut ();
           	} else if (data.result == '1') {
           		$("#my-modal-job-alert .modal-content").css("width", "350px");
           	   $("#alertText").text("该职位已收藏，无需重复收藏！");
        		$('#my-modal-job-alert').show ().delay (3000).fadeOut ();
           	} else {
           		$("#warntext").html("收藏失败！");
           		$("#" + divid).attr("data-target", "#layhomewarn");
           	}
           });
		} else {
			$("#warntext").html("对不起，您无权限操作此功能！");
			$("#" + divid).attr("data-target", "#layhomewarn");
		}
   	}
	
	// 发送简历
	function sendCv(divid) {
		// 简历ID
		var cvId = $("#resume").val();

		// 公司ID
		var companyId = $("#companyId").val();

		// 职位ID
		var recruitmentId =  $("#recruitmentId").val();
		
       	// TODO
           $.post(document.getElementsByTagName('base')[0].href+'job/detail/sendCv.act', {cvId:cvId,companyId:companyId,recruitmentId:recruitmentId}, function (data) {

           	if (data.result =='0') {
           		$('#sqzw11').modal('hide');
           		$("#my-modal-job-alert .modal-content").css("width", "200px");
          	   $("#alertText").text("投递成功！");
        		$('#my-modal-job-alert').show ().delay (3000).fadeOut ();
           	} else if (data.result == '1') {
           		  $("#my-modal-job-alert .modal-content").css("width", "350px");
            	  $("#alertText").text("该职位已投递，请勿重复投递！");
          		$('#my-modal-job-alert').show ().delay (3000).fadeOut ();
           	} else {
           		$('#sqzw11').modal('hide');
           		$("#warntext").html("投递失败！");
           		$("#" + divid).attr("data-target", "#layhomewarn");
           	}
           });
   	}