$(function() {
	question_upload_img.init();
});

var question_upload_img = {
		
		init: function init(){
//			this.drawModal();
			this.prepareUploadify();
			this.prepareDialog();
			this.bindDisplayImg();
		},
		
		drawModal : function drawModal(){
//			$("#question-add-form").append("<div class=\"modal\" id=\"add-question-img-dialog\"><div title=\"图片上传工具\" class=\"modal-dialog modal-lg\"><div class=\"modal-content\"><form><div class=\"form-line img-destination\"><span class=\"form-label\">添加至：</span><label></label><input type=\"hidden\" value=\"\"/></div><div class=\"form-line add-update-quetstionfile\"><span class=\"form-label\">上传图片：</span><div id=\"div-file-list\"></div><div class=\"form-line\" id=\"uploadify\"></div><span class=\"form-message\">请上传png、jpg图片文件，且不能大于100KB。为了使得图片显示正常，请上传的图片长宽比例为2:1</span></div></form></div></div></div>");
			
			
		},
		
		prepareDialog : function prepareDialog() {
			$("#question-add-form").on("click",".add-img",function() {
				var oldhtml=$("#form-message").html();
				if(oldhtml==""){
					$("#uploadify").after("<span class='form-message' id='form-message'>"+"请上传png、jpg或jpeg、gif图片文件，且不能大于5MB。为了使得图片显示正常，请上传的图片长宽比例为2:1"+"</span>");	
				}
				$(".fade").modal({backdrop:true,keyboard:true});
				$("#file-name").empty();
				
				if($(this).hasClass("add-content-img")){
					$(".img-destination label").text("试题内容");
					$(".img-destination input").val(-1);
				}else if($(this).hasClass("add-opt-img")){
					$(".img-destination label").text("试题选项 ");
					var this_index = $(".add-opt-img").index($(this));
					$(".img-destination label").append(String.fromCharCode(65 + this_index));
					$(".img-destination input").val(this_index);
				}
			});
		},
		prepareUploadify : function prepareUploadify(){
			$("#uploadify").uploadify({
				'debug'	 : false,
				'buttonText'	: '点击上传',
				'buttonCursor'	: 'pointer',
				'uploader'	 : document.getElementsByTagName('base')[0].href + 'company/upload-uploadify-img.act',
				'swf'	 : document.getElementsByTagName('base')[0].href + 'shyl/js/question/uploadify/uploadify.swf',
				'multi'	 : false,
				'auto'	 : true,
				'height'	 : '26',
				'width'	 : '60',
				'requeueErrors'	: false,
				'fileSizeLimit'	: '1024 * 1024 * 5', // 上传图片大小限定
				'cancelImage'	: document.getElementsByTagName('base')[0].href + 'resources/js/uploadify/cancel.png',
				'fileTypeExts'   : '*.jpg;*.gif;*.png', 
				overrideEvents:['onSelectError','onDialogClose'],
				onUploadProgress: function() {
				
				},
				onUploadComplete: function(file) {
					$('#maincontent').load(location.href+' #maincontent > *');
					$(".fade").modal('hide');
				},
				onUploadSuccess : function(file, data, response) {
			        	var fileurl = data;
			        	var destination  = $(".img-destination input").val();
			        	if(destination == -1){
			        		var displayImg = $(".question-content").find(".diaplay-img");
			        		$("#tupian").attr("href",document.getElementsByTagName('base')[0].href+"images/"+fileurl);
			        		$("#tupian").attr("data-url",fileurl);
			        		$("#tupian").show();
			        		
			        	}else{
			        		var thisopt =  $($(".add-opt-item")[destination]);
			        		var displayImg = thisopt.find(".diaplay-img");
			        		
			        		if(displayImg.length  == 0){
			        			thisopt.find("input.inputCssST").after("<a href=\"" + document.getElementsByTagName('base')[0].href +'images/'+ fileurl + "\" class=\"diaplay-img display-opt-img\" target=\"_blank\" data-url=\"" + fileurl + "\">预览图片</a>");
			        		}else{
			        			displayImg.attr("href", document.getElementsByTagName('base')[0].href +'images/'+fileurl);
			        		}
			        		
			        	}
			        	
				},
				onSelectError: function(file,errorCode,errorMsg) {
					var filename=file.name;
					  var AllImgExt=".jpg|.jpeg|.gif|.bmp|.png|";  
		              var extName = filename.substring(filename.lastIndexOf(".")).toLowerCase();
		              if(AllImgExt.indexOf(extName+"|")==-1)          
		                {  
		            	  $("#uploadify").tips({
				    			side : 2,
				    			msg : '请上传格式为.jpg/.jpeg/.png./gif格式的图片。',
				    			bg : '#AE81FF',
				    			time : 3
				    		});
							return false;
		                }  
					if(errorCode==-110){
						$("#uploadify").tips({
			    			side : 2,
			    			msg : '只能上传5MB以下的图片。',
			    			bg : '#AE81FF',
			    			time : 3
			    		});
						return false;
					}
				},
				onUploadError: function(file,errorCode,errorMsg, errorString) {
					util.error(errorMsg);
				}
			});
		},
		
		bindDisplayImg : function bindDisplayImg(){
			$("#bk-conent-question-content").delegate(".diaplay-img","click",function() {
				window.open(location.protocol + "//" + location.host + "/" + $(this).attr("href"));
				e.preventDefault();
			});
		}
		
};